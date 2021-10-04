
module lab2_1_t;
    
    reg clk;
    reg rst;
    wire [5:0] out;
    reg [5:0] ans;

    reg pass;
    reg [5:0] n;
    reg a_seq;

    lab2_1 l2 (clk, rst, out);

    always #5 clk = ~clk;

    always @(posedge clk, posedge rst) begin
        cal();
    end

    always @(negedge clk) begin
        test();
    end

    initial begin
        pass = 1;
        clk = 1;
        a_seq = 1;
        n = 0;
        ans = 0;

        // Test reset
        rst = 1;
        #5 rst = 0;

        // Run a full a_seq & b_seq

        // Test reset on clock edge
        #705 rst = 1;
        #20 rst = 0;

        // Test reset between clock edges
        #53 rst = 1;
        #13 rst = 0;

        #100

        if (pass)
            $display(">>>> [PASS] Congratulations!");
        else
            $display(">>>> [ERROR] Try it again!");
    end

    task test;
        begin
            if (out != ans)
                pass = 0;
        end
    endtask

    task cal;
        begin
            if(rst == 1'b1) begin
                a_seq = 1;
                n = 1;
                ans = 0;
            end else begin
                if (a_seq) begin
                    if (ans > n)
                        ans = ans - n;
                    else
                        ans = ans + n;

                    if (ans == 63) begin
                        a_seq = 0;
                        n = 0;
                    end
                end else begin
                    ans = ans - 2**(n - 1);

                    if (ans == 0) begin
                        a_seq = 1;
                        n = 0;
                    end
                end
                n = n + 1;
            end
        end
    endtask


endmodule