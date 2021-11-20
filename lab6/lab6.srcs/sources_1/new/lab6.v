
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

module lab6(
    input clk,
    input rst,
    inout PS2_CLK,
    inout PS2_DATA,
    output reg [3:0] DIGIT,
    output reg [6:0] DISPLAY,
    output reg [15:0] LED
);

    clock_divider #(14) cd14(.clk(clk), .clk_div(clk14));
    clock_divider #(27) cd27(.clk(clk), .clk_div(clk27));

    parameter S_IdleB1 = 4'd0;
    parameter S_PickUpB1 = 4'd1;
    parameter S_RefuelG1 = 4'd2;
    parameter S_DriveB1G2 = 4'd3;
    parameter S_RefuelB1B2 = 4'd4;
    parameter S_DriveG2B2 = 4'd5;
    parameter S_GetOffB2 = 4'd6;
    parameter S_IdleB2 = 4'd7;
    parameter S_PickUpB2 = 4'd8;
    parameter S_RefuelG3 = 4'd9;
    parameter S_DriveB2G2 = 4'd10;
    parameter S_RefuelB2B1 = 4'd11;
    parameter S_DriveG2B1 = 4'd12;
    parameter S_GetOffB1 = 4'd13;

    parameter BCD_DASH = 4'd13;
    parameter BCD_OFF = 4'd15;

    reg [3:0] state;
    reg [2:0] passengers;
    reg [2:0] B1;
    reg [2:0] B2;
    reg [4:0] gas;
    reg [6:0] revenue;
    reg [2:0] pos;


    // State transition logic
    reg [2:0] next_state;
    always @* begin
        next_state = state;

        case (state)
            S_IdleB1:
                if (B1 != 0)
                    next_state = S_PickUpB1;
                else if (B2 != 0)
                    next_state = S_DriveB1G2;
            S_PickUpB1:
                next_state = S_RefuelG1;
            S_RefuelG1, S_RefuelB1B2, S_RefuelG3, S_RefuelB2B1:
                if (gas == 20 || revenue < 10)
                    next_state = state + 1;
            S_DriveB1G2:
                if (pos == 3)
                    next_state = S_RefuelB1B2;
            S_DriveG2B2:
                if (pos == 6)
                    next_state = S_GetOffB2;
            S_GetOffB2:
                if (passengers == 0)
                    next_state = S_IdleB2;
            S_IdleB2:
                if (B2 != 0)
                    next_state = S_PickUpB2;
                else if (B1 != 0)
                    next_state = S_DriveB2G2;
            S_PickUpB2:
                next_state = S_RefuelG3;
            S_DriveB2G2:
                if (pos == 3)
                    next_state = S_RefuelB2B1;
            S_DriveG2B1:
                if (pos == 0)
                    next_state = S_GetOffB1;
            S_GetOffB1:
                if (passengers == 0)
                    next_state = S_IdleB1;
        endcase
    end

    reg [2:0] next_B1;
    reg [2:0] next_B2;
    reg [2:0] next_passengers;
    always @* begin
        next_B1 = B1;
        next_B2 = B2;
        next_passengers = passengers;

        case (state)
            S_PickUpB1: begin
                next_passengers = B1;
                next_B1 = 0;
            end
            S_PickUpB2: begin
                next_passengers = B2;
                next_B2 = 0;
            end
            S_GetOffB2, S_GetOffB1:
                next_passengers = passengers - 1;
        endcase
    end

    reg [2:0] next_pos;
    always @* begin
        next_pos = pos;

        case (state)
            S_DriveB1G2, S_DriveG2B2:
                next_pos = pos + 1;
            S_DriveB2G2, S_DriveG2B1:
                next_pos = pos - 1;
        endcase
    end

    
    reg [4:0] next_gas;
    reg [6:0] next_revenue;
    always @* begin
        next_gas = gas;
        next_revenue = revenue;

        case (state)
            S_PickUpB1:
                next_revenue = revenue + 30 * B1;
            S_PickUpB2:
                next_revenue = revenue + 20 * B2;
            S_RefuelG1, S_RefuelB1B2, S_RefuelG3, S_RefuelB2B1:
                if (gas < 20 && revenue >= 10) begin
                    next_gas = gas + 10;
                    if (next_gas >= 20)
                        next_gas = 20;
                    
                    next_revenue = revenue - 10;
                end
            S_DriveB1G2:
                if (pos == 3)
                    next_gas = gas - 5 * passengers;
            S_DriveG2B2:
                if (pos == 6)
                    next_gas = gas - 5 * passengers;
            S_DriveB2G2:
                if (pos == 3)
                    next_gas = gas - 5 * passengers;
            S_DriveG2B1:
                if (pos == 0)
                    next_gas = gas - 5 * passengers;
        endcase
    end


    // Flip Flops
    always @(posedge clk27, posedge rst) begin
        if (rst) begin
            state = S_IdleB1;
            passengers = 0;
            B1 = 0;
            B2 = 0;
            gas = 0;
            revenue = 0;
            pos = 0;
        end else begin
            state = next_state;
            passengers = next_passengers;
            B1 = next_B1;
            B2 = next_B2;
            gas = next_gas;
            revenue = next_revenue;
            pos = next_pos;
        end
    end

    reg [3:0] value;

    always @(posedge clk14) begin
        case (DIGIT)
            4'b1110: begin
                value = revenue / 10;
                DIGIT = 4'b1101;
            end
            4'b1101: begin
                value = gas % 10;
                DIGIT = 4'b1011;
            end
            4'b1011: begin
                value = gas / 10;
                DIGIT = 4'b0111;
            end
            4'b0111: begin
                value = revenue % 10;
                DIGIT = 4'b1110;
            end
            default: begin
                value = revenue % 10;
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
            default: DISPLAY = 7'b111_1111;
        endcase
    end

endmodule
