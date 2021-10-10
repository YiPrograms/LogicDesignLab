`timescale 1ns / 1ps

module clock_divider #(parameter n = 25) (
    input clk,
    output clk_div
);
    reg [n - 1:0] counter = 0;
    // reg div;

    always @(posedge clk) begin
        counter <= counter + 1;
    end

    // always @(posedge counter[n], negedge clk) begin
    //     if (clk == 0)
    //         div = 0;
    //     else if (counter[n - 1] == 1)
    //         div = 1;
    // end

    // assign clk_div = div;

    assign clk_div = counter[n - 1];
endmodule


module lab3_1(
    input clk,
    input rst,
    input en,
    input speed,
    output [15:0] led
);

    wire clk_24;
    wire clk_27;

    wire cur_clk;

    reg led_on;

    clock_divider #(24) clk24(.clk(clk), .clk_div(clk_24));
    clock_divider #(27) clk27(.clk(clk), .clk_div(clk_27));

    assign cur_clk = (speed == 1)? clk_27: clk_24;
    
    always @(posedge cur_clk, posedge rst) begin
        if (rst == 1)
            led_on = 1;
        else if (en)
            led_on = ~led_on;
    end

    genvar i;
    generate
        for (i = 0; i <= 15; i = i + 1) begin
            assign led[i] = led_on;
        end
    endgenerate

endmodule


// module lab3_1_t;
//     reg clk;

//     always #1 clk = ~clk;

//     reg rst;

//     wire [15:0] led;

//     lab3_1 l3(.clk(clk), .rst(rst), .en(1), .speed(1), .led(led));

//     initial begin
//         clk = 0;
//         rst = 1;
//         #2

//         rst = 0;
//     end
// endmodule
