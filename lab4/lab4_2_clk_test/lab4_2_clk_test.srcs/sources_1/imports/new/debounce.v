

module debounce (pb_debounced, pb, clk);
    output pb_debounced; // output after being debounced
    input pb; // input from a pushbutton
    input clk;

    reg [3:0] shift_reg; // use shift_reg to filter the bounce

    always @(posedge clk) begin
        shift_reg[3:1] <= shift_reg[2:0];
        shift_reg[0] <= pb;
    end
    assign pb_debounced = ((shift_reg == 4'b1111) ? 1'b1 : 1'b0);
endmodule


module onepulse (pb_debounced, clk, pb_1pulse);
    input pb_debounced;
    input clk;
    output pb_1pulse;
    
    reg pb_1pulse;
    reg pb_debounced_delay;

    always @(posedge clk) begin
        if (pb_debounced == 1'b1 & pb_debounced_delay == 1'b0)
            pb_1pulse <= 1'b1;
        else
            pb_1pulse <= 1'b0;
        pb_debounced_delay <= pb_debounced;
    end
endmodule
