
module hold_pulses(
    input clk,
    input rst,
    input key,
    output reg pulse
);
    parameter hold_time = 40000000; // 0.4s
    parameter trigger_interval = 10000000; // 0.1s
    reg [25:0] counter;
    reg [25:0] next_counter;

    parameter S_Idle = 0;
    parameter S_Holding = 1;
    parameter S_Triggered = 2;
    reg [1:0] state;
    reg [1:0] next_state;

    reg next_pulse;

    always @* begin
        next_pulse = 0;
        next_state = state;
        next_counter = counter + 1;
        if (key) begin
            if (state == S_Idle) begin
                next_state <= S_Holding;
                next_counter <= 0;
                next_pulse <= 1;
            end else if (state == S_Holding) begin
                if (counter == hold_time) begin
                    next_state <= S_Triggered;
                    next_counter <= 0;
                end
            end else begin // S_Triggered
                if (counter == trigger_interval) begin
                    next_pulse <= 1;
                    next_counter <= 0;
                end
            end
        end else begin
            next_state = S_Idle;
            next_counter = 0;
        end
    end

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            pulse <= 0;
            counter <= 0;
            state <= S_Idle;
        end else begin
            pulse <= next_pulse;
            counter <= next_counter;
            counter <= next_state;
        end
    end
endmodule

module keypress_controller (
    input clk,
    input rst,
    inout PS2_DATA,
    inout PS2_CLK,
    output [6:0] keys
);

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

    reg [6:0] key_press;

    hold_pulses l_hold(
        .clk(clk),
        .rst(rst),
        .key(key_press[0]),
        .pulse(keys[0])
    );

    hold_pulses r_hold(
        .clk(clk),
        .rst(rst),
        .key(key_press[1]),
        .pulse(keys[1])
    );

    hold_pulses #(.hold_time(0)) down_hold(
        .clk(clk),
        .rst(rst),
        .key(key_press[4]),
        .pulse(keys[4])
    );

    assign keys[2] = key_press[2];
    assign keys[3] = key_press[3];
    assign keys[5] = key_press[5];
    assign keys[6] = key_press[6];

	always @(posedge clk, posedge rst) begin
		if (rst) begin
            key_press = 0;
		end else begin
            // One-pulses
            key_press[2] = 0;
            key_press[3] = 0;
            key_press[5] = 0;
            key_press[6] = 0;

			if (been_ready) begin
				case (last_change)
                    {1'b0, 8'h1c}: // Move Left: Left
                        key_press[0] = key_down[last_change];
                    {1'b0, 8'h1b}: // Move Right: Right
                        key_press[1] = key_down[last_change];
                    {1'b0, 8'h23}: // Rotate CW: Up, X
                        key_press[2] = key_down[last_change];
                    {1'b0, 8'h2b}: // Rotate CCW: Z
                        key_press[3] = key_down[last_change];
                    {1'b0, 8'h34}: // Soft Drop: Down
                        key_press[4] = key_down[last_change];
                    {1'b0, 8'h33}: // Hard Drop: Space
                        key_press[5] = key_down[last_change];
                    {1'b0, 8'h3b}: // Hold: C
                        key_press[6] = key_down[last_change];
                endcase
			end

		end
	end
endmodule