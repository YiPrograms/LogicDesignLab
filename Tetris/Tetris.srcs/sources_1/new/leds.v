
module led_controller(
    input [3:0] state,
    input clk,
    input rst,
    output reg [9:0] leds
);
    parameter S_Menu = 4'd1;
    parameter S_Falling = 4'd3;
    parameter S_GameOver = 4'd11;
    integer idx;
    reg [9:0] led_next;
    always @(posedge clk, posedge rst) begin
        if(rst) begin
            leds <= 0;
        end
        else begin
            leds <= led_next;
        end
    end
    always @(*) begin
        led_next = leds;
        case(state)
            S_Menu: begin
                led_next = ~leds;
            end
            S_Falling: begin
                led_next = 0;
                led_next[6:2] = ~leds[6:2];
            end
            S_GameOver: begin
                led_next = 10'b1111111111;
            end
        endcase
    end
endmodule
