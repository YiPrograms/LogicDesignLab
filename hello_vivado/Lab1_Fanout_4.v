`timescale 1ns/1ps

module Fanout_4(in, out);
input in;
output [3:0] out;

wire t0;
not (t0, in);
not (out[0], out[1], out[2], out[3], t0);

endmodule

