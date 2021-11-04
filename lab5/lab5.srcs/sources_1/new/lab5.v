
module clock_divider #(parameter n = 13) (
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

module clock_divider_500ms_onepulse (
    input clk,
    output clk_div
);
    reg [23: 0] counter = 0;

    wire [24: 0] next_cnt;
    assign next_cnt = counter == 50000000? 0: counter + 1;

    always @(posedge clk) begin
        counter <= next_cnt;
    end

    assign clk_div = counter == 50000000;
endmodule


module lab5(
    input clk,
    input rst,
    input BTNL,
    input BTNR,
    input BTNU,
    input BTND,
    input BTNC,
    output reg [15:0] LED,
    output reg [3:0] DIGIT,
    output reg [6:0] DISPLAY
);

    clock_divider #(13) cd13(.clk(clk), .clk_div(clk13));
    clock_divider_500ms_onepulse cd500(.clk(clk), .clk_div(clk_500));

    debounce dbok(.pb_debounced(ok_db), .pb(BTNU), .clk(clk13));
    debounce dbcanc(.pb_debounced(canc_db), .pb(BTND), .clk(clk13));
    debounce dbl(.pb_debounced(l_db), .pb(BTNL), .clk(clk13));
    debounce dbm(.pb_debounced(m_db), .pb(BTNC), .clk(clk13));
    debounce dbr(.pb_debounced(r_db), .pb(BTNR), .clk(clk13));

    onepluse opok(.pb_debounced(ok_db), .clk(clk13), .pb_1pulse(ok_op));
    onepluse opcanc(.pb_debounced(canc_db), .clk(clk13), .pb_1pulse(canc_op));
    onepluse opl(.pb_debounced(l_db), .clk(clk13), .pb_1pulse(l_op));
    onepluse opm(.pb_debounced(m_db), .clk(clk13), .pb_1pulse(m_op));
    onepluse opr(.pb_debounced(r_db), .clk(clk13), .pb_1pulse(r_op));

    integer i;

    parameter S_Idle = 3'd0;
    parameter S_Type = 3'd1;
    parameter S_Amount = 3'd2;
    parameter S_Payment = 3'd3;
    parameter S_Release = 3'd4;
    parameter S_Change = 3'd5;

    reg [2:0] state;
    reg [3:0] BCD [3:0];
    reg [3:0] counter;
    reg [2:0] type;
    reg [2:0] price;
    reg [1:0] amount;
    reg [2:0] money;    


    reg [2:0] next_state;
    reg [3:0] next_counter;
    always @* begin
        next_state = state;
        next_counter = counter + clk_500;
        
        case (state)
            S_Idle: begin
                if (l_op || m_op || r_op)
                    next_state = S_Type;
            end
            S_Type: begin
                if (canc_op)
                    next_state = S_Idle;
                else if (ok_op)
                    next_state = S_Amount;
            end
            S_Amount: begin
                if (canc_op)
                    next_state = S_Idle;
                else if (ok_op)
                    next_state = S_Payment;
            end
            S_Payment: begin
                if (canc_op)
                    next_state = S_Change;
                else if (money >= price)
                    next_state = S_Release;
            end
            S_Release: begin
                if (counter == 6)
                    next_state = S_Change;
            end
            S_Change: begin
                if (money == 0)
                    next_state = S_Idle;
            end
        endcase

        if (next_state != state)
            next_counter = 0;
    end

    reg [2:0] next_type;
    always @* begin
        next_type = type;
        if (state == S_Idle || state == S_Type) begin
            if (l_op)
                next_type = 0;
            else if (m_op)
                next_type = 1;
            else if (r_op)
                next_type = 2;
        end
    end


    // Calculate price
    always @* begin
        
    end

    reg [1:0] next_amount;


    reg [3:0] next_BCD;
    always @* begin
        for (i = 0; i < 4; i = i + 1) begin
            next_BCD[i] = 15;
        end

        case (state)
            S_Idle: begin
                for (i = 0; i < 4; i = i + 1) begin
                    next_BCD[i] = counter & 1;
                end
            end
            S_Type: begin
                next_BCD[3] = 10 + type;

                next_BCD[1] = price / 10;
                next_BCD[0] = price % 10;
            end
            S_Amount, S_Release: begin
                next_BCD[3] = 10 + type;
                
                next_BCD[0] = amount;
            end
            S_Payment: begin
                next_BCD[3] = money / 10;
                next_BCD[2] = money % 10;
                next_BCD[1] = price / 10;
                next_BCD[0] = price % 10;
            end
            S_Change: begin
                next_BCD[1] = money / 10;
                next_BCD[0] = money % 10;
            end
        endcase
    end


    reg [2:0] next_money;
    always @* begin
        next_money = money;
        if (state == S_Payment) begin
            if (l_op)
                next_money = money + 1;
            else if (m_op)
                next_money = money + 5;
            else if (r_op)
                next_money = money + 10;
            else if (money >= price)
                next_money = money - price;
        end
    end

    always @(posedge clk13, posedge rst) begin
        if (rst) begin
            state <= S_Idle;
        end else begin
            state <= next_state;
        end
    end

    always @* begin
        for (i = 0; i < 16; i = i + 1)
            LED[i] = (state == S_Idle || state == S_Release) && (counter & 1);
    end

    reg [3:0] value;

    always @(posedge clk13) begin
        case (DIGIT)
            4'b1110: begin
                value = BCD[1];
                DIGIT = 4'b1101;
            end
            4'b1101: begin
                value = BCD[2];
                DIGIT = 4'b1011;
            end
            4'b1011: begin
                value = BCD[3];
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
            4'd10: DISPLAY = 7'b000_1000;
            4'd11: DISPLAY = 7'b001_0010;
            4'd12: DISPLAY = 7'b100_1110;
            default: DISPLAY = 7'b111_1111;
        endcase
    end

endmodule
