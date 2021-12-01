
module clock_divider(clk1, clk, clk22);
    input clk;
    output clk1;
    output clk22;
    reg [21:0] num;
    wire [21:0] next_num;

    always @(posedge clk) begin
        num <= next_num;
    end

    assign next_num = num + 1'b1;
    assign clk1 = num[1];
    assign clk22 = num[21];
endmodule


module lab7_2 (
    input clk,
    input rst,
    input hold,
    inout PS2_CLK,
    inout PS2_DATA,
    output [3:0] vgaRed,
    output [3:0] vgaGreen,
    output [3:0] vgaBlue,
    output hsync,
    output vsync,
    output pass
);

    wire [11:0] data;
    wire clk_25MHz;
    wire clk_22;
    wire [11:0] pixel;
    wire valid;
    wire [9:0] h_cnt; //640
    wire [9:0] v_cnt;  //480

    assign {vgaRed, vgaGreen, vgaBlue} = (valid==1'b1) ? pixel: 12'b0;

    clock_divider clk_wiz_0_inst(
        .clk(clk),
        .clk1(clk_25MHz),
        .clk22(clk_22)
    );

    integer i;

    reg is_pass;
    reg [1:0] rots [11:0];

    reg [11:0] pressed_1p;
    reg l_shift, r_shift;

    assign pass = is_pass;

    reg [16:0] pixel_addr;
    wire [16:0] blk_x = h_cnt / 160;
    wire [16:0] blk_y = v_cnt / 160;
    wire [16:0] px = (h_cnt>>1) - blk_x * 80;
    wire [16:0] py = (v_cnt>>1) - blk_y * 80;
    always @* begin
        if (hold)
            pixel_addr = 320*(blk_y*80 + py) + blk_x*80 + px;
        else begin
            case (rots[blk_y*4 + blk_x])
                2'b00:
                    pixel_addr = 320*(blk_y*80 + py) + blk_x*80 + px;
                2'b01:
                    pixel_addr = 320*(blk_y*80 + px) + blk_x*80 + (79-py);
                2'b10:
                    pixel_addr = 320*(blk_y*80 + (79-py)) + blk_x*80 + (79-px);
                2'b11:
                    pixel_addr = 320*(blk_y*80 + (79-px)) + blk_x*80 + py;
            endcase
        end
    end

    blk_mem_gen_0 blk_mem_gen_0_inst(
        .clka(clk_25MHz),
        .wea(0),
        .addra(pixel_addr),
        .dina(data[11:0]),
        .douta(pixel)
    ); 

    vga_controller vga_inst(
        .pclk(clk_25MHz),
        .reset(rst),
        .hsync(hsync),
        .vsync(vsync),
        .valid(valid),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt)
    );
    
    reg next_is_pass;
    always @* begin
        next_is_pass = 1;
        for (i = 0; i < 12; i = i + 1) begin
            if (rots[i] != 0)
                next_is_pass = 0;
        end
    end

    reg [1:0] next_rots [11:0];
    always @* begin
        for (i = 0; i < 12; i = i + 1) begin
            if (!hold && !is_pass && pressed_1p[i]) begin
                if (l_shift || r_shift)
                    next_rots[i] = rots[i] + 1;
                else
                    next_rots[i] = rots[i] - 1;
            end else begin
                next_rots[i] = rots[i];
            end
        end
    end

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            is_pass <= 0;
            for (i = 0; i < 12; i = i + 1)
                rots[i] <= i*7+5;
        end else begin
            is_pass <= next_is_pass;
            for (i = 0; i < 12; i = i + 1)
                rots[i] <= next_rots[i];
        end
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
            pressed_1p <= 0;
            l_shift <= 0;
            r_shift <= 0;
		end else begin
            pressed_1p = 0;
			if (been_ready) begin
				case (last_change)
                    {1'b0, 8'h12}: // L Shift
                        l_shift = key_down[last_change];
                    {1'b0, 8'h59}: // R Shift
                        r_shift = key_down[last_change];
                    {1'b0, 8'h44}: // O
                        pressed_1p[0] = key_down[last_change];
                    {1'b0, 8'h4D}: // P
                        pressed_1p[1] = key_down[last_change];
                    {1'b0, 8'h54}: // [
                        pressed_1p[2] = key_down[last_change];
                    {1'b0, 8'h5B}: // ]
                        pressed_1p[3] = key_down[last_change];
                    {1'b0, 8'h42}: // K
                        pressed_1p[4] = key_down[last_change];
                    {1'b0, 8'h4B}: // L
                        pressed_1p[5] = key_down[last_change];
                    {1'b0, 8'h4C}: // ;
                        pressed_1p[6] = key_down[last_change];
                    {1'b0, 8'h52}: // '
                        pressed_1p[7] = key_down[last_change];
                    {1'b0, 8'h3A}: // M
                        pressed_1p[8] = key_down[last_change];
                    {1'b0, 8'h41}: // ,
                        pressed_1p[9] = key_down[last_change];
                    {1'b0, 8'h49}: // .
                        pressed_1p[10] = key_down[last_change];
                    {1'b0, 8'h4A}: // /
                        pressed_1p[11] = key_down[last_change];
                endcase
			end
		end
	end

endmodule
