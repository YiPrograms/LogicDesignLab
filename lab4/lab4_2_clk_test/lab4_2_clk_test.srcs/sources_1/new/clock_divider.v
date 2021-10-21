
module clock_divider_100ms_onepulse (
    input clk,
    output clk_div
);
    reg [23: 0] counter = 0;

    wire [24: 0] next_cnt;
    assign next_cnt = counter == 10000000? 0: counter + 1;

    always @(posedge clk) begin
        counter <= next_cnt;
    end

    assign clk_div = counter >= 5000000;
endmodule