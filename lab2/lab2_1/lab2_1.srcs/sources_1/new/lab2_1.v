
module lab2_1 (
    input clk,
    input rst,
    output reg [5:0] out);

    reg [5:0] n;
    reg dir;
    reg [5:0] next_out;
    reg next_dir;
    reg [5:0] next_n;

    always @* begin
        next_dir = dir;
        next_n = n + 1;
        if (dir == 1) begin
            if (n == 0)
                next_out = 0;
            else if (out > n)
                next_out = out - n;
            else
                next_out = out + n;

            if (next_out == 63) begin
                next_dir = 0;
                next_n = 1;
            end
        end else begin
            next_out = out - 2**(n - 1);

            if (next_out == 0) begin
                next_dir = 1;
                next_n = 1;
            end
        end
    end

    always @(posedge clk, posedge rst) begin
        if (rst == 1) begin
            out <= 0;
            n <= 1;
            dir <= 1;
        end else begin
            out <= next_out;
            dir <= next_dir;
            n <= next_n;
        end
    end

endmodule