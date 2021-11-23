
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

module lab06(
    input clk,
    input rst,
    inout PS2_CLK,
    inout PS2_DATA,
    output reg [3:0] DIGIT,
    output reg [6:0] DISPLAY,
    output reg [15:0] LED
);

    clock_divider #(14) cd14(.clk(clk), .clk_div(clk14));
    clock_divider #(26) cd26(.clk(clk), .clk_div(clk26));

    OnePulse op(.signal(clk26), .clock(clk), .signal_single_pulse(clk26_1p));

    parameter S_IdleB1 = 4'd0;
    parameter S_PickUpB1 = 4'd1;
    parameter S_DepositB1 = 4'd2;
    parameter S_RefuelG1 = 4'd3;
    parameter S_DriveB1G2 = 4'd4;
    parameter S_RefuelB1B2 = 4'd5;
    parameter S_DriveG2B2 = 4'd6;
    parameter S_GetOffB2 = 4'd7;
    parameter S_IdleB2 = 4'd8;
    parameter S_PickUpB2 = 4'd9;
    parameter S_DepositB2 = 4'd10;
    parameter S_RefuelG3 = 4'd11;
    parameter S_DriveB2G2 = 4'd12;
    parameter S_RefuelB2B1 = 4'd13;
    parameter S_DriveG2B1 = 4'd14;
    parameter S_GetOffB1 = 4'd15;

    parameter BCD_DASH = 4'd13;
    parameter BCD_OFF = 4'd15;

    reg [3:0] state;
    reg [1:0] passengers;
    reg [1:0] B1;
    reg [1:0] B2;
    reg [4:0] gas;
    reg [7:0] revenue;
    reg [2:0] pos;


    reg B1_pressed;
    reg B2_pressed;
    OnePulse b1op(.signal(B1_pressed), .clock(clk), .signal_single_pulse(B1_pressed_1p));
    OnePulse b2op(.signal(B2_pressed), .clock(clk), .signal_single_pulse(B2_pressed_1p));

    // State transition logic
    reg [3:0] next_state;
    always @* begin
        next_state = state;

        case (state)
            S_IdleB1:
                if (B1 != 0)
                    next_state = S_PickUpB1;
                else if (B2 != 0)
                    next_state = S_DriveB1G2;
            S_PickUpB1:
                next_state = S_DepositB1;
            S_DepositB1:
                next_state = S_RefuelG1;
            S_RefuelG1, S_RefuelB1B2, S_RefuelG3, S_RefuelB2B1:
                if (gas == 20 || revenue < 10)
                    next_state = state + 1;
            S_DriveB1G2:
                if (pos == 2) begin
                    if (passengers != 0)
                        next_state = S_RefuelB1B2;
                    else
                        next_state = S_DriveG2B2;
                end
            S_DriveG2B2:
                if (pos == 5)
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
                next_state = S_DepositB2;
            S_DepositB2:
                next_state = S_RefuelG3;
            S_DriveB2G2:
                if (pos == 4) begin
                    if (passengers != 0)
                        next_state = S_RefuelB2B1;
                    else
                        next_state = S_DriveG2B1;
                end
            S_DriveG2B1:
                if (pos == 1)
                    next_state = S_GetOffB1;
            S_GetOffB1:
                if (passengers == 0)
                    next_state = S_IdleB1;
        endcase
    end

    reg [1:0] next_B1;
    reg [1:0] next_B2;
    always @* begin
        next_B1 = B1;
        next_B2 = B2;

        if (clk26_1p) begin
            case (state)
                S_PickUpB1:
                    next_B1 = 0;
                S_PickUpB2:
                    next_B2 = 0;
            endcase
        end else begin
            if (B1_pressed_1p && B1 != 2)
                next_B1 = B1 + 1;
            if (B2_pressed_1p && B2 != 2)
                next_B2 = B2 + 1;
        end
    end

    reg [1:0] next_passengers;
    always @* begin
        next_passengers = passengers;
        case (state)
            S_PickUpB1:
                next_passengers = B1;
            S_PickUpB2:
                next_passengers = B2;
            S_GetOffB2, S_GetOffB1:
                if (passengers != 0)
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
    reg [7:0] next_revenue;
    always @* begin
        next_gas = gas;
        next_revenue = revenue;

        case (state)
            S_DepositB1, S_DepositB2: begin
                next_revenue = revenue + 30 * passengers;
                if (next_revenue > 90)
                    next_revenue = 90;
            end
            S_RefuelG1, S_RefuelB1B2, S_RefuelG3, S_RefuelB2B1:
                if (gas < 20 && revenue >= 10) begin
                    next_gas = gas + 10;
                    if (next_gas >= 20)
                        next_gas = 20;
                    
                    next_revenue = revenue - 10;
                end
            S_DriveB1G2:
                if (pos == 2)
                    next_gas = gas - 5 * passengers;
            S_DriveG2B2:
                if (pos == 5)
                    next_gas = gas - 5 * passengers;
            S_DriveB2G2:
                if (pos == 4)
                    next_gas = gas - 5 * passengers;
            S_DriveG2B1:
                if (pos == 1)
                    next_gas = gas - 5 * passengers;
        endcase
    end


    // Flip Flops
    always @(posedge clk, posedge rst) begin
        if (rst) begin
            state <= S_IdleB1;
            passengers <= 0;
            B1 <= 0;
            B2 <= 0;
            gas <= 0;
            revenue <= 0;
            pos <= 0;
        end else begin
            if (clk26_1p) begin
                state <= next_state;
                passengers <= next_passengers;
                gas <= next_gas;
                revenue <= next_revenue;
                pos <= next_pos;
            end

            B1 <= next_B1;
            B2 <= next_B2;
        end
    end


    // LED
    integer i;
    always @* begin
        for (i = 0; i < 16; i = i + 1)
            LED[i] = 0;

        LED[pos] = 1;

        LED[10] = passengers != 0;
        LED[9] = passengers == 2;

        LED[15] = B1 != 0;
        LED[14] = B1 == 2;

        LED[12] = B2 != 0;
        LED[11] = B2 == 2;
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
	
	wire shift_down;
	wire [511:0] key_down;
	wire [8:0] last_change;
	wire been_ready;
	
	KeyboardDecoder key_de (
		.key_down(key_down),
		.last_change(last_change),
		.key_valid(been_ready),
		.PS2_DATA(PS2_DATA),
		.PS2_CLK(PS2_CLK),
		.rst(rst),
		.clk(clk)
	);

	always @(posedge clk, posedge rst) begin
		if (rst) begin
			B1_pressed = 0;
            B2_pressed = 0;
		end else begin
			if (been_ready) begin
				if (last_change == 9'b0_0110_1001)
                    B1_pressed = key_down[last_change];
                else if (last_change == 9'b0_0111_0010)
                    B2_pressed = key_down[last_change];
			end
		end
	end

endmodule
