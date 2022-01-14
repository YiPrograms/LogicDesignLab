
module vga_top(
    input clk_25MHz,
    input clk_fps,
    input rst,
    input [879:0] block_states,
    output [3:0] vgaRed,
    output [3:0] vgaGreen,
    output [3:0] vgaBlue,
    output hsync,
    output vsync
);

    wire [11:0] pixel;
    wire valid;
    wire [9:0] h_cnt; //640
    wire [9:0] v_cnt;  //480

    assign {vgaRed, vgaGreen, vgaBlue} = (valid==1'b0) ? 12'h0: pixel;

    pixel_gen pixel_gen_inst(
        .clk(clk_fps),
        .rst(rst),
        .px(h_cnt),
        .py(v_cnt),
        .block_states(block_states),
        .pixel(pixel)
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

endmodule


