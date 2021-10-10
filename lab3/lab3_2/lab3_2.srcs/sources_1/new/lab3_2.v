`timescale 1ns / 1ps

module clock_divider #(parameter n = 25) (
    input clk,
    output clk_div
);
    reg [n - 1:0] counter = 0;

    always @(posedge clk) begin
        counter <= counter + 1;
    end

    assign clk_div = counter[n - 1];
endmodule

module lab3_2(
    input clk,
    input rst,
    input en,
    input dir,
    output [15:0] led
);

    wire clk_d;
    clock_divider #(25) cd(.clk(clk), .clk_div(clk_d));

    parameter S_Flashing = 2'b00;
    parameter S_Shifting = 2'b01;
    parameter S_Expanding = 2'b10;
    parameter S_Invalid = 2'b11;

    reg [1:0] state;
    reg [1:0] next_state;

    reg [5:0] cnt;
    reg [5:0] next_cnt;

    reg [15:0] leds;

    reg [15:0] flashing_leds;
    always @* begin : flashing_block
        flashing_leds = (cnt & 1'b1)? {16 {1'b0}}: {16 {1'b1}};
    end

    reg [15:0] shifting_leds;
    always @* begin : shifting_block
        integer i;
        for (i = 0; i < 16; i = i + 1) begin
            if (i + 16 < cnt || i + 1 > cnt)
                shifting_leds[i] = 1'b0;
            else
                shifting_leds[i] = (i + cnt) & 1'b1;
        end
    end

    reg [15:0] expanding_leds;
    always @* begin : expanding_block
        integer i;

        expanding_leds = {16 {1'b0}};
        for (i = 8; i < 16; i = i + 1)
            if (i < 8 + cnt)
                expanding_leds[i] = 1'b1;
        for (i = 7; i >= 0; i = i - 1)
            if (i > 7 - cnt)
                expanding_leds[i] = 1'b1;
    end

    always @* begin
        next_state = state;
        next_cnt = cnt;

        if (rst) begin
            leds = {16 {1'b1}};
        end else begin
            leds = {16 {1'b0}};
            case (state)
                S_Flashing: begin
                    leds = flashing_leds;
                    if (cnt >= 11) begin
                        next_state = S_Shifting;
                        next_cnt = 16;
                    end else begin
                        next_cnt = cnt + 1;
                    end
                end

                S_Shifting: begin
                    leds = shifting_leds;
                    if (cnt == 0 || cnt == 31) begin
                        next_state = S_Expanding;
                        next_cnt = 1;
                    end else begin
                        next_cnt = cnt + (dir == 1? 1: -1);
                    end
                end

                S_Expanding: begin
                    leds = expanding_leds;
                    if (cnt >= 7) begin
                        next_state = S_Flashing;
                        next_cnt = 0;
                    end else begin
                        if (dir == 0)
                            next_cnt = cnt + 1;
                        else begin
                            if (cnt > 0)
                                next_cnt = cnt - 1;
                        end
                    end
                end

                S_Invalid:
                    next_state = S_Flashing;
            endcase
        end
        
    end

    

    always @(posedge clk_d, posedge rst) begin
        if (rst) begin
            state <= S_Flashing;
            cnt <= 0;
        end else if (en) begin
            state <= next_state;
            cnt <= next_cnt;
        end
    end

    assign led = leds;

endmodule

// module lab3_2_t;
//     reg clk;

//     always #1 clk = ~clk;

//     reg rst;

//     wire [15:0] led;

//     lab3_2 l3(.clk(clk), .rst(rst), .en(1), .dir(0), .led(led));

//     initial begin
//         clk = 0;
//         rst = 1;
//         #2

//         rst = 0;
//     end
// endmodule
