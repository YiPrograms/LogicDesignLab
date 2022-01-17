
module vga_top(
    input clk_25MHz,
    input rst,
    input [799:0] block_states,
    input [33:0] active_block,
    input [3:0] state,
    input [3:0] hold_tile,
    input [11:0] next_tiles,
    input [19:0] whole_lines,
    output [3:0] vgaRed,
    output [3:0] vgaGreen,
    output [3:0] vgaBlue,
    output hsync,
    output vsync
);

    wire [11:0] pixel;
    // wire [11:0] pixel_out = (state == 11)?
    //                         { pixel[8+:4]>>1, pixel[4+:4]>>1, pixel[0+:4]>>1 }:
    //                         pixel;
    wire valid;
    wire [9:0] h_cnt; //640
    wire [9:0] v_cnt;  //480

    wire [11:0] bg_pixel;
    wire [16:0] pixel_addr = 320*(v_cnt>>1) + (h_cnt>>1);

    assign {vgaRed, vgaGreen, vgaBlue} = (valid==1'b0) ? 12'h0: pixel;

    pixel_gen pixel_gen_inst(
        .px(h_cnt),
        .py(v_cnt),
        .bg_pixel(bg_pixel),
        .block_states(block_states),
        .active_block(active_block),
        .state(state),
        .hold_tile(hold_tile),
        .next_tiles(next_tiles),
        .whole_lines(whole_lines),
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

    blk_mem_gen_1 blk_mem_gen_1_inst(
        .clka(clk_25MHz),
        .addra(pixel_addr),
        .douta(bg_pixel)
    );

endmodule


