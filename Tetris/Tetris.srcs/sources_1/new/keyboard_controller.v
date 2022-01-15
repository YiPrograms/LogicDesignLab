
module hold_pulses(
    input clk,
    input rst,
    input key,
    output reg pulse
);
    parameter hold_time = 35000000/524288; // 0.35s
    parameter trigger_interval = 8500000/524288; // 0.085s
    reg [27:0] counter;
    reg [27:0] next_counter;

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
                next_state = S_Holding;
                next_counter = 0;
                next_pulse = 1;
            end else if (state == S_Holding) begin
                if (counter == hold_time) begin
                    next_state = S_Triggered;
                    next_counter = 0;
                end
            end else begin // S_Triggered
                if (counter == trigger_interval) begin
                    next_pulse = 1;
                    next_counter = 0;
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
            state <= next_state;
        end
    end
endmodule

module keypress_controller (
    input clk,
    input clk_op,
    input rst,
    inout PS2_DATA,
    inout PS2_CLK,
    output [7:0] keys
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

    reg [7:0] key_press;

    hold_pulses l_hold(
        .clk(clk_op),
        .rst(rst),
        .key(key_press[0]),
        .pulse(keys[0])
    );

    hold_pulses r_hold(
        .clk(clk_op),
        .rst(rst),
        .key(key_press[1]),
        .pulse(keys[1])
    );

    hold_pulses #(.hold_time(0)) down_hold(
        .clk(clk_op),
        .rst(rst),
        .key(key_press[4]),
        .pulse(keys[4])
    );

    onepulse cw_op(
        .signal(key_press[2]),
        .clk(clk_op),
        .op(keys[2])
    );

    onepulse ccw_op(
        .signal(key_press[3]),
        .clk(clk_op),
        .op(keys[3])
    );

    onepulse space_op(
        .signal(key_press[5]),
        .clk(clk_op),
        .op(keys[5])
    );

    onepulse hold_op(
        .signal(key_press[6]),
        .clk(clk_op),
        .op(keys[6])
    );

    onepulse enter_op(
        .signal(key_press[7]),
        .clk(clk_op),
        .op(keys[7])
    );

	always @(posedge clk, posedge rst) begin
		if (rst) begin
            key_press = 0;
		end else begin
			if (been_ready) begin
				case (last_change)
                    {1'b0, 8'h6b}: // Move Left: Left
                        key_press[0] = key_down[last_change];
                    {1'b1, 8'h74}: // Move Right: Right
                        key_press[1] = key_down[last_change];
                    {1'b0, 8'h75}, {1'b0, 8'h22}: // Rotate CW: Up, X
                        key_press[2] = key_down[last_change];
                    {1'b0, 8'h1a}: // Rotate CCW: Z
                        key_press[3] = key_down[last_change];
                    {1'b0, 8'h72}: // Soft Drop: Down
                        key_press[4] = key_down[last_change];
                    {1'b0, 8'h29}: // Hard Drop: Space
                        key_press[5] = key_down[last_change];
                    {1'b0, 8'h21}: // Hold: C
                        key_press[6] = key_down[last_change];
                    {1'b0, 8'h5a}: // Enter
                        key_press[7] = key_down[last_change];
                endcase
			end

		end
	end
endmodule