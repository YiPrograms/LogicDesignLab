
module clock_divider #(parameter n = 27) (
    input clk,
    output clk_div
);
    reg [n-1: 0] counter = 0;

    wire [n-1: 0] next_cnt;
    assign next_cnt = counter + 1;

    always @(posedge clk) begin
        counter <= next_cnt;
    end

    assign clk_div = counter[n-1];
endmodule

module clock_divider_100ms_onepulse (
    input clk,
    output clk_div
);
    reg [23: 0] counter = 0;

    wire [24: 0] next_cnt;
    assign next_cnt = counter == 10000000? 0: counter + 1;

    always @(posedge clk) begin
        counter <= next_cnt;
    end

    assign clk_div = counter == 10000000;
endmodule

module lab4_2 (
    input clk,
    input rst,
    input en,
    input input_number,
    input enter,
    input count_down,
    output reg [3:0] DIGIT,
    output reg [6:0] DISPLAY,
    output led0
);

    debounce indb(.pb_debounced(input_number_db), .pb(input_number), .clk(clk));
    onepulse inop(.pb_debounced(input_number_db), .clk(clk), .pb_1pulse(input_number_1p));

    debounce etdb(.pb_debounced(enter_db), .pb(enter), .clk(clk));
    onepulse etop(.pb_debounced(enter_db), .clk(clk), .pb_1pulse(enter_1p));

    debounce cddb(.pb_debounced(count_down_db), .pb(count_down), .clk(clk));
    onepulse cdop(.pb_debounced(count_down_db), .clk(clk), .pb_1pulse(count_down_1p));

    clock_divider_100ms_onepulse cd100(.clk(clk), .clk_div(clk_div));

    parameter S_DirSetting = 2'b00;
    parameter S_NumSetting = 2'b01;
    parameter S_Counting = 2'b11;
    parameter S_Finish = 2'b01;

    integer i;

    reg [1:0] state;
    reg cnt_down;
    reg [1:0] cur_setting;
    reg [3:0] curBCD [3:0];
    reg [3:0] targetBCD [3:0];


    // State transition
    reg [1:0] next_state;
    always @* begin
        next_state = state;
        case (state)
            S_DirSetting: begin
                if (enter_1p)
                    next_state = S_NumSetting;
            end
            S_NumSetting: begin
                if (cur_setting == 0 && enter_1p)
                    next_state = S_Counting;
            end
            S_Counting: begin
                next_state = S_Finish;
                for (i = 0; i < 4; i = i + 1) begin
                    if (curBCD[i] != targetBCD[i])
                        next_state = S_Counting;
                end
            end
        endcase
    end

    assign next_cnt_down = (state == S_DirSetting && count_down_1p)? ~cnt_down: cnt_down;
    assign led0 = cnt_down;

    wire [1:0] next_cur_setting;
    assign next_cur_setting = (state == S_NumSetting && enter_1p && cur_setting > 0)?
                                cur_setting - 1: cur_setting;


    // Num selecting & counting
    reg [4:0] next_curBCD [4:0];
    reg [3:0] next_targetBCD [3:0];
    always @* begin
        for (i = 0; i < 4; i = i + 1) begin
            next_curBCD[i] = curBCD[i];
            next_targetBCD[i] = targetBCD[i];
        end

        case (state)
            S_DirSetting: begin
                if (enter_1p) begin
                    for (i = 0; i < 4; i = i + 1) begin
                        next_curBCD[i] = 0;
                    end
                end
            end
            S_NumSetting: begin
                if (input_number_1p) begin
                    next_curBCD[cur_setting] = curBCD[cur_setting] + 1;
                    if (next_curBCD[cur_setting] > (
                        cur_setting == 3? 1:
                        cur_setting == 2? 5:
                                          9
                    )) begin
                        next_curBCD[cur_setting] = 0;
                    end
                end else if (cur_setting == 0 && enter_1p) begin
                    for (i = 0; i < 4; i = i + 1) begin
                        if (cnt_down) begin
                            next_targetBCD[i] = 0;
                        end else begin
                            next_targetBCD[i] = curBCD[i];
                            next_curBCD[i] = 0;
                        end
                    end
                end
            end
            S_Counting: begin
                if (clk_div && en) begin
                    if (cnt_down) begin
                        // Add 1599 (Complement)
                        for (i = 0; i < 4; i = i + 1) begin : for_digits
                            localparam max_num = (i == 3? 1:
                                                  i == 2? 5: 9);
                            next_curBCD[i] = next_curBCD[i] + max_num;
                            if (next_curBCD[i] > max_num) begin
                                next_curBCD[i + 1] = next_curBCD[i + 1] + 1;
                                next_curBCD[i] = next_curBCD[i] - (max_num + 1);
                            end
                        end
                    end else begin
                        // Add 1
                        next_curBCD[0] = next_curBCD[0] + 1;
                        for (i = 0; i < 3; i = i + 1) begin
                            if (next_curBCD[i] > (i == 2? 5: 9)) begin
                                next_curBCD[i + 1] = next_curBCD[i + 1] + 1;
                                next_curBCD[i] = 0;
                            end
                        end
                    end
                end
            end
        endcase
    end

    // Seqiential memory elements
    always @(posedge clk, posedge rst) begin
        if (rst) begin
            state <= S_DirSetting;
            cnt_down <= 0;
            cur_setting <= 3;
            for (i = 0; i < 4; i = i + 1) begin
                curBCD[i] <= 10;
                targetBCD[i] <= 0;
            end
        end else begin
            state <= next_state;
            cnt_down <= next_cnt_down;
            cur_setting <= next_cur_setting;
            for (i = 0; i < 4; i = i + 1) begin
                curBCD[i] = next_curBCD[i][3:0];
                targetBCD[i] = next_targetBCD[i];
            end
        end
    end


    // Display
    reg [3:0] value;

    wire clk_display;
    clock_divider #(18) cd_display (.clk(clk), .clk_div(clk_display));
    
    always @(posedge clk_display) begin
        case (DIGIT)
            4'b1110: begin
                value = curBCD[1];
                DIGIT = 4'b1101;
            end
            4'b1101: begin
                value = curBCD[2];
                DIGIT = 4'b1011;
            end
            4'b1011: begin
                value = curBCD[3];
                DIGIT = 4'b0111;
            end
            4'b0111: begin
                value = curBCD[0];
                DIGIT = 4'b1110;
            end
            default: begin
                value = curBCD[0];
                DIGIT = 4'b1110;
            end
        endcase
    end

    always @* begin
        case (value)
            4'd0: DISPLAY = 7'b100_0000;
            4'd1: DISPLAY = 7'b111_1001;
            4'd2: DISPLAY = 7'b010_0100;
            4'd3: DISPLAY = 7'b011_0000;
            4'd4: DISPLAY = 7'b001_1001;
            4'd5: DISPLAY = 7'b001_0010;
            4'd6: DISPLAY = 7'b000_0010;
            4'd7: DISPLAY = 7'b111_1000;
            4'd8: DISPLAY = 7'b000_0000;
            4'd9: DISPLAY = 7'b001_0000;
            4'd10: DISPLAY = 7'b011_1111;
            default: DISPLAY = 7'b111_1111;
        endcase
    end

endmodule
