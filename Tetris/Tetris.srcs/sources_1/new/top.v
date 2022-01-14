
module clock_divider #(parameter max = 26) (
    input clk,
    input rst,
    output reg [max:0] div
);
    wire [max:0] next_num;
    assign next_num = div + 1'b1;

    always @(posedge clk, posedge rst) begin
        if (rst)
            div <= 0;
        else
            div <= next_num;
    end
endmodule


module tetris(
    input clk,
    input rst,

    output [3:0] vgaRed,
    output [3:0] vgaGreen,
    output [3:0] vgaBlue,
    output hsync,
    output vsync,

    inout PS2_DATA,
	inout PS2_CLK,

    output audio_mclk,
    output audio_lrck, 
    output audio_sck,
    output audio_sdin,

    output [6:0] DISPLAY,
    output [3:0] DIGIT,

    output [15:0] led
);
    wire [26:0] div;

    wire [799:0] block_states;
    wire [28:0] active_block;

    wire [6:0] keys;
    wire [6:0] key_press;
    wire [8:0] lc;

    clock_divider divs(
        .clk(clk),
        .rst(rst),
        .div(div)
    );

    vga_top vga_top_inst(
        .clk_25MHz(div[1]),
        .clk_fps(div[21]),
        .rst(rst),

        .block_states(block_states),
        .active_block(active_block),

        .vgaRed(vgaRed),
        .vgaGreen(vgaGreen),
        .vgaBlue(vgaBlue),
        .hsync(hsync),
        .vsync(vsync)
    );

    tetris_controller tetris_controller_inst(
        .clk(clk),
        .clk_fall(div[25]),
        .rst(rst),
        .keys(keys),
        .block_states(block_states),
        .active_block(active_block)
    );

    keypress_controller keypress_controller_inst(
        .clk(clk),
        .rst(rst),
        .PS2_DATA(PS2_DATA),
        .PS2_CLK(PS2_CLK),
        .key_press(key_press),
        .keys(keys),
        .lc(lc)
    );

    // wire [15:0] bcds = {4'b0, active_block[9+:4], active_block[4+:4], active_block[0+:4]};
    wire [15:0] bcds = {4'b0, lc[8], lc[4+:4], lc[0+:4]};
    seven_seg_controller seven_seg_controller_inst(
        .clk_display(div[12]),
        .bcds(bcds),
        .DIGIT(DIGIT),
        .DISPLAY(DISPLAY)
    );

    assign led[15 -: 7] = key_press;

endmodule
