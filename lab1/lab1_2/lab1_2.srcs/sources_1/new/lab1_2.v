`timescale 1ns / 100ps

module lab1_2 (a, b, aluctr, d);

    input [3:0] a;
    input [1:0] b;
    input [1:0] aluctr;
    output reg [3:0] d;

    wire [3:0] l1_out;
    lab1_1 l1 (a, b, aluctr[0], l1_out);

    // assign d = (aluctr <= 2'b01) ? l1_out : (aluctr == 2'b10) ? a + b : a - b;

    always @* begin
        d = l1_out;
        case (aluctr)
            2'b10:
                d = a + b;
            2'b11:
                d = a - b;
        endcase
    end


endmodule
