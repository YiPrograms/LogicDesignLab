
module LFSR (
    input wire clk,
    input wire rst,
    output reg [2:0] random
);
    always @(posedge clk or posedge rst) begin
        if (rst == 1'b1)
            random[2:0] <= 4'b100;
        else begin
            random[1:0] <= random[2:1];
            random[2] <= random[1] ^ random[0];
        end
    end
endmodule