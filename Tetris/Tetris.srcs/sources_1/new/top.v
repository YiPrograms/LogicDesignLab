
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

    clock_divider divs(
        .clk(clk),
        .rst(rst),
        .div(div)
    );

    vga_top vga_top_inst(
        .clk_25MHz(div[1]),
        .clk_fps(div[21]),
        .rst(rst),
        .vgaRed(vgaRed),
        .vgaGreen(vgaGreen),
        .vgaBlue(vgaBlue),
        .hsync(hsync),
        .vsync(vsync)
    );


endmodule
