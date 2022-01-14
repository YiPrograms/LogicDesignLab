
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
    output vsync
);
    wire [23:0] div;

    wire [879:0] block_states;
    assign block_states = { {{21 {{10 {4'd0}}} }} , 4'd1, 4'd2, 4'd3, 4'd4, 4'd5, 4'd6, 4'd7, 4'd8, 4'd0, 4'd1};

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


endmodule
