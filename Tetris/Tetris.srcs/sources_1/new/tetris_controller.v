
module tetris_controller(
    input clk,
    input clk_fall,
    input rst,
    output reg [879:0] block_states
);

    reg [879:0] next_block_states;

    always @* begin
        next_block_states = { {{21 {{10 {4'd0}}} }} , 4'd1, 4'd2, 4'd3, 4'd4, 4'd5, 4'd6, 4'd7, 4'd8, 4'd0, 4'd1};
    end

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            block_states <= 0;
        end else begin
            block_states <= next_block_states;
        end
    end
    

endmodule
