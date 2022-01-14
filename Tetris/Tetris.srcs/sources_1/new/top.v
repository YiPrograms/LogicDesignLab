
module clock_divider #(parameter max = 23) (
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
    wire [23:0] div;

    wire [879:0] block_states;
    // assign block_states = { {{21 {{10 {4'd0}}} }} , 4'd1, 4'd2, 4'd3, 4'd4, 4'd5, 4'd6, 4'd7, 4'd8, 4'd0, 4'd1};

    wire [6:0] keys;

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

        .vgaRed(vgaRed),
        .vgaGreen(vgaGreen),
        .vgaBlue(vgaBlue),
        .hsync(hsync),
        .vsync(vsync)
    );

    tetris_controller tetris_controller_inst(
        .clk(clk),
        .clk_fall(div[22]),
        .rst(rst),
        .block_states(block_states)
    );

    keypress_controller keypress_controller_inst(
        .clk(clk),
        .rst(rst),
        .PS2_DATA(PS2_DATA),
        .PS2_CLK(PS2_CLK),
        .keys(keys)
    );

    assign led[15 -: 7] = keys;

endmodule
