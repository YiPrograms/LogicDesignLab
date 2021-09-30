
module lab2_1_t;
    
    reg clk;
    reg rst;
    wire [5:0] out;

    lab2_1 l2 (clk, rst, out);

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        #5 rst = 0;

        #100 rst = 1;
        #13 rst = 0;
    end

    initial #5000 $finish;

endmodule