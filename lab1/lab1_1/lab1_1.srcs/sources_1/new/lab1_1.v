`timescale 1ns/100ps

module lab1_1 (a, b, dir, d);

    input [3:0] a;
    input [1:0] b;
    input dir;
    output wire [3:0] d;

    assign d = (dir == 0) ? (a << b) : (a >> b);

endmodule
