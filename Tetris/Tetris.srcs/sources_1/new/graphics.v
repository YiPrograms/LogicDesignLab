`define WHITE 12'hfff
`define BLACK 12'h000

`define TILE_BORDER_COLOR 12'h666
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
    input [9:0] px,
    input [9:0] py,
    input [799:0] block_states,
    input [33:0] active_block,
    input [3:0] state,
    output reg [11:0] pixel
);
    
    integer i;

    wire [4:0] tile_x = 21 - py/20;
    wire [3:0] tile_y = px/20 - 11;
    wire is_border = (px%20) == 0 || (px%20) == 19 || (py%20) == 0 || (py%20) == 19;
    wire [9:0] tile_offset = tile_x*40 + tile_y*4;
    parameter [11:0] tile_colors [0:8] = {
        `WHITE, `I_BLOCK_COLOR, `J_BLOCK_COLOR, `L_BLOCK_COLOR, `O_BLOCK_COLOR,
        `T_BLOCK_COLOR, `Z_BLOCK_COLOR, `S_BLOCK_COLOR, `GRAY_BLOCK_COLOR
    };

    wire [3:0] active_type;
    wire [4:0] active_x;
    wire [4:0] ghost_x;
    wire [3:0] active_y;
    wire [15:0] rotated_block;
    assign {rotated_block, ghost_x, active_y, active_x, active_type} = active_block;

    reg [11:0] tile_pixel;

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

            // Next border
            if ((px == 422 || px == 518) && py >= 40 && py <= 318 ||
                (py == 40 || py == 318) && px >= 422 && px <= 518)
                pixel = `BORDER_INNER_COLOR;
            if ((py == 38 || py == 39 || py == 319  || py == 320) && px >= 422 && px <= 519 ||
                (px == 519 || px == 520) && py >= 39 && py <= 319)
                pixel = `BORDER_OUTER_COLOR;

            // Hold border
            if ((px == 138 || px == 218) && py >= 40 && py <= 120 ||
                (py == 40 || py == 120) && px >= 138 && px <= 218)
                pixel = `BORDER_INNER_COLOR;
            if ((py == 38 || py == 39 || py == 122 || py == 121) && px >= 137 && px <= 219 ||
                (px == 136 || px == 137) && py >= 39 && py <= 121)
                pixel = `BORDER_OUTER_COLOR;
        end
        
        begin // Draw tiles
            if (py > 40 && py < 440 && px > 220 && px < 420) begin
                if(block_states[tile_offset +: 4]) begin
                    if (is_border)
                        pixel = `TILE_BORDER_COLOR;
                    else
                        pixel = tile_colors[block_states[tile_offset +: 4]];
                end
            end
        end

        begin // Draw active tile & ghost tile
            if (py < 440 && px > 220 && px < 420) begin
                if (active_type != 0) begin
                    if (tile_x+3 >= ghost_x && tile_x+3 < ghost_x + 4 && 
                        tile_y+3 >= active_y && tile_y+3 < active_y + 4) begin // Ghost tile
                        if (rotated_block[4*(tile_x+3 - (ghost_x))+(tile_y+3 - (active_y))]) begin
                            if (is_border)
                                pixel = `TILE_BORDER_COLOR;
                            else
                                pixel = { tile_colors[active_type][8+:4]>>2, tile_colors[active_type][4+:4]>>2, tile_colors[active_type][0+:4]>>2 };
                        end
                    end

                    if (tile_x+3 >= active_x && tile_x+3 < active_x + 4 && 
                        tile_y+3 >= active_y && tile_y+3 < active_y + 4) begin // Active tile
                        if (rotated_block[4*(tile_x+3 - (active_x))+(tile_y+3 - (active_y))]) begin
                            if (is_border)
                                pixel = `TILE_BORDER_COLOR;
                            else
                                pixel = tile_colors[active_type];
                        end
                    end
                end
            end
        end

        

        begin // Gameover mask
            if (state == 11) begin
                if (py > 40 && py < 440 && px > 220 && px < 420) begin
                    pixel = { pixel[8+:4]>>2, pixel[4+:4]>>2, pixel[0+:4]>>2 };
                end
            end
        end


    end

endmodule



