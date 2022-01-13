`define WHITE 12'hFFF
`define BLACK 12'h000;

module pixel_gen(
   input clk,
   input rst,
   input [9:0] px,
   input [9:0] py,
   output reg [11:0] pixel
);
    
    integer i;

    always @* begin
        pixel = `WHITE;

        // Draw girds
        if (py >= 40 && py <= 440) begin
            for (i = 0; i <= 10; i = i + 1) begin
                if (px == 220 + i*20)
                    pixel = `BLACK;
            end
        end

        if (px >= 220 && px <= 420) begin
            for (i = 0; i <= 20; i = i + 1) begin
                if (py == 40 + i*20)
                    pixel = `BLACK;
            end
        end
    end

endmodule



