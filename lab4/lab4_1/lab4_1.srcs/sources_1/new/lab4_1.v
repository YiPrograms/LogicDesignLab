
module clock_divider #(parameter n = 27) (
    input clk,
    output [2:0] clk_div
);
    reg [n-1: 0] counter = 0;

    wire [n-1: 0] next_cnt;
    assign next_cnt = counter + 1;

    always @(posedge clk) begin
        counter <= next_cnt;
    end

    assign clk_div = { counter[n-3], counter[n-2], counter[n-1] };
endmodule

module lab4_1 (
    input clk,
    input rst,
    input en,
    input dir,
    input speed_up,
    input speed_down,
    output reg [3:0] DIGIT,
    output reg [6:0] DISPLAY,
    output max,
    output min
);

    debounce endb(.pb_debounced(en_db), .pb(en), .clk(clk));
    onepulse enop(.pb_debounced(en_db), .clk(clk), .pb_1pulse(en_1p));

    debounce dirdb(.pb_debounced(dir_db), .pb(dir), .clk(clk));

    debounce sudb(.pb_debounced(speed_up_db), .pb(speed_up), .clk(clk));
    onepulse suop(.pb_debounced(speed_up_db), .clk(clk), .pb_1pulse(speed_up_1p));

    debounce sddb(.pb_debounced(speed_down_db), .pb(speed_down), .clk(clk));
    onepulse sdop(.pb_debounced(speed_down_db), .clk(clk), .pb_1pulse(speed_down_1p));

    reg [1:0] speed;
    reg [3:0] BCD [1:0];
    reg is_pause;

    wire [2:0] clk_div;
    clock_divider cd(.clk(clk), .clk_div(clk_div));
    assign count_clk = clk_div[speed];
    onepulse ccop(.pb_debounced(count_clk), .clk(clk), .pb_1pulse(cnt_clk_1p));


    assign next_is_pause = en_1p? ~is_pause: is_pause;


    reg [1:0] next_speed;
    always @* begin
        next_speed = speed;
        if (speed_up_1p && speed < 2)
            next_speed = speed + 1;
        else if (speed_down_1p && speed > 0)
            next_speed = speed - 1;
    end

    assign max = BCD[0] == 9 && BCD[1] == 9;
    assign min = BCD[0] == 0 && BCD[1] == 0;

    reg [3:0] next_BCD [1:0];
    always @* begin
        next_BCD[0] = BCD[0];
        next_BCD[1] = BCD[1];
        if (cnt_clk_1p && !is_pause) begin
            if (!dir_db && !max) begin
                // Up
                next_BCD[0] = BCD[0] + 1;
                if (next_BCD[0] == 10) begin
                    next_BCD[0] = 0;
                    next_BCD[1] = BCD[1] + 1;
                end
            end else if (dir_db && !min) begin
                // Down
                if (BCD[0] == 0) begin
                    next_BCD[1] = BCD[1] - 1;
                    next_BCD[0] = 9;
                end else begin
                    next_BCD[0] = BCD[0] - 1;
                end
            end
        end
    end

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            speed <= 0;
            is_pause <= 1;
            BCD[0] <= 0;
            BCD[1] <= 0;
        end else begin
            is_pause <= next_is_pause;
            speed <= next_speed;
            BCD[0] <= next_BCD[0];
            BCD[1] <= next_BCD[1];
        end
    end

    reg [3:0] value;

    wire [2:0] clk_display;
    clock_divider #(18) cd_display (.clk(clk), .clk_div(clk_display));
    
    always @(posedge clk_display[0]) begin
        case (DIGIT)
            4'b1110: begin
                value = BCD[1];
                DIGIT = 4'b1101;
            end
            4'b1101: begin
                value = dir_db? 11: 10;
                DIGIT = 4'b1011;
            end
            4'b1011: begin
                value = speed;
                DIGIT = 4'b0111;
            end
            4'b0111: begin
                value = BCD[0];
                DIGIT = 4'b1110;
            end
            default: begin
                value = BCD[0];
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
            4'd10: DISPLAY = 7'b101_1100;
            4'd11: DISPLAY = 7'b110_0011;
            default: DISPLAY = 7'b111_1111;
        endcase
    end

endmodule
