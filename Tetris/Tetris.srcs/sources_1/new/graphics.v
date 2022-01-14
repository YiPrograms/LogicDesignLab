`define WHITE 12'hfff
`define BLACK 12'h000

`define GIRD_COLOR 12'h333
`define TABLE_COLOR 12'h444
`define BORDER_OUTER_COLOR 12'h3dc
`define BORDER_INNER_COLOR 12'h2aa

`define I_BLOCK_COLOR 12'h0df
`define J_BLOCK_COLOR 12'h89e
`define L_BLOCK_COLOR 12'hfb0
`define O_BLOCK_COLOR 12'hfd7
`define T_BLOCK_COLOR 12'hc9e
`define Z_BLOCK_COLOR 12'hf78
`define S_BLOCK_COLOR 12'h2ed
`define GRAY_BLOCK_COLOR 12'hbbb

module pixel_gen(
   input clk,
   input rst,
   input [9:0] px,
   input [9:0] py,
   input [799:0] block_states,
   input [28:0] active_block,
   output reg [11:0] pixel
);
    
    integer i;

    wire [4:0] tile_x = 21 - py/20;
    wire [3:0] tile_y = px/20 - 11;
    wire [9:0] tile_offset = tile_x*40 + tile_y*4;
    parameter [11:0] tile_colors [0:8] = {
        `WHITE, `I_BLOCK_COLOR, `J_BLOCK_COLOR, `L_BLOCK_COLOR, `O_BLOCK_COLOR,
        `T_BLOCK_COLOR, `Z_BLOCK_COLOR, `S_BLOCK_COLOR, `GRAY_BLOCK_COLOR
    };

    wire [3:0] active_type;
    wire [4:0] active_x;
    wire [3:0] active_y;
    wire [15:0] rotated_block;
    assign {rotated_block, active_y, active_x, active_type} = active_block;

    always @* begin
        // Background
        pixel = `WHITE;

        begin // Draw background elements

            // Draw table
            if (px > 220 && px < 420 && py > 40 && py < 440)
                pixel = `TABLE_COLOR;

            // Draw grids
            if (py > 40 && py < 440)
                for (i = 1; i <= 9; i = i + 1)
                    if (px == 220 + i*20)
                        pixel = `GIRD_COLOR;
            if (px > 220 && px < 420)
                for (i = 1; i <= 19; i = i + 1)
                    if (py == 40 + i*20)
                        pixel = `GIRD_COLOR;

            // Draw border
            if ((px == 220 || px == 420) && py >= 40 && py <= 440 ||
                (py == 40 || py == 440) && px >= 220 && px <= 420)
                pixel = `BORDER_INNER_COLOR;
            if ((py == 38 || py == 39 || py == 441 || py == 442) && px >= 219 && px <= 421 ||
                (px == 218 || px == 219 || px == 421 || px == 422) && py >= 39 && py <= 441)
                pixel = `BORDER_OUTER_COLOR;
        end
        
        begin // Draw tiles
            if (py > 40 && py < 440 && px > 220 && px < 420)
                if(block_states[tile_offset +: 4])
                    pixel = tile_colors[block_states[tile_offset +: 4]];
        end

        begin // Draw active tile
            if (py < 440 && px > 220 && px < 420) begin
                if (active_type != 0 &&
                    tile_x >= active_x-2 && tile_x < active_x-2 + 4 && 
                    tile_y >= active_y-2 && tile_y < active_y-2 + 4) begin
                    if (rotated_block[4*(tile_x - (active_x-2))+(tile_y - (active_y-2))])
                        pixel = tile_colors[active_type];
                end
            end
        end

    end

endmodule



