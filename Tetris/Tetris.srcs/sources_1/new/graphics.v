`define WHITE 12'hfff
`define BLACK 12'h000

`define TILE_BORDER_COLOR 12'h666
`define GHOST_BORDER_COLOR 12'h333
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

`define I_GHOST_COLOR 12'hbff
`define J_GHOST_COLOR 12'hcdf
`define L_GHOST_COLOR 12'hffc
`define O_GHOST_COLOR 12'hffe
`define T_GHOST_COLOR 12'hfdf
`define Z_GHOST_COLOR 12'hfcc
`define S_GHOST_COLOR 12'hcff
`define GRAY_GHOST_COLOR 12'hbbb

module pixel_gen(
    input [9:0] px,
    input [9:0] py,
    input [799:0] block_states,
    input [33:0] active_block,
    input [3:0] state,
    input [3:0] hold_tile,
    input [11:0] next_tiles,
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
    // parameter [11:0] ghost_colors [0:8] = {
    //     `WHITE, `I_GHOST_COLOR, `J_GHOST_COLOR, `L_GHOST_COLOR, `O_GHOST_COLOR,
    //     `T_GHOST_COLOR, `Z_GHOST_COLOR, `S_GHOST_COLOR, `GRAY_GHOST_COLOR
    // };
    parameter [15:0] block_tiles [0:8] = { // For next tiles and hold only
        16'b0000000000000000,
        16'b0000111100000000,
        16'b0000000101110000,
        16'b0000010001110000,
        16'b0000011001100000, // O block is at middle
        16'b0000001001110000,
        16'b0000001101100000,
        16'b0000011000110000,
        16'b0000000000000000
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

        begin // Draw background

            // Draw table
            if (px > 220 && px < 420 && py > 40 && py < 440)
                pixel = `TABLE_COLOR;
            if (px > 422 && px < 528 && py > 40 && py < 278)
                pixel = `TABLE_COLOR;
            if (px > 102 && px < 218 && py > 40 && py < 123)
                pixel = `TABLE_COLOR;

            // Draw border
            if ((px == 220 || px == 420) && py >= 40 && py <= 440 ||
                (py == 40 || py == 440) && px >= 220 && px <= 420)
                pixel = `BORDER_INNER_COLOR;
            if ((py == 38 || py == 39 || py == 441 || py == 442) && px >= 219 && px <= 421 ||
                (px == 218 || px == 219 || px == 421 || px == 422) && py >= 39 && py <= 441)
                pixel = `BORDER_OUTER_COLOR;

            // Next border
            if ((px == 422 || px == 528) && py >= 40 && py <= 278 ||
                (py == 40 || py == 278) && px >= 422 && px <= 528)
                pixel = `BORDER_INNER_COLOR;
            if ((py == 38 || py == 39 || py == 279  || py == 280) && px >= 422 && px <= 529 ||
                (px == 529 || px == 530) && py >= 39 && py <= 279)
                pixel = `BORDER_OUTER_COLOR;

            // Hold border
            if ((px == 102 || px == 218) && py >= 40 && py <= 123 ||
                (py == 40 || py == 123) && px >= 102 && px <= 218)
                pixel = `BORDER_INNER_COLOR;
            if ((py == 38 || py == 39 || py == 124 || py == 125) && px >= 101 && px <= 219 ||
                (px == 100 || px == 101) && py >= 39 && py <= 124)
                pixel = `BORDER_OUTER_COLOR;
        end

        begin // Draw ghost tile
            if (py > 40 && py < 440 && px > 220 && px < 420) begin
                if (active_type != 0) begin
                    if (tile_x+3 >= ghost_x && tile_x+3 < ghost_x + 4 && 
                        tile_y+3 >= active_y && tile_y+3 < active_y + 4) begin // Ghost tile
                        if (rotated_block[4*(tile_x+3 - (ghost_x))+(tile_y+3 - (active_y))]) begin
                            pixel = { tile_colors[active_type][8+:4]>>1, tile_colors[active_type][4+:4]>>1, tile_colors[active_type][0+:4]>>1 };
                        end
                    end
                end
            end
        end

        begin // Draw grids
            if (py > 40 && py < 440)
                for (i = 1; i <= 9; i = i + 1)
                    if (px == 220 + i*20)
                        pixel = `GIRD_COLOR;
            if (px > 220 && px < 420)
                for (i = 1; i <= 19; i = i + 1)
                    if (py == 40 + i*20)
                        pixel = `GIRD_COLOR;
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
        
        begin // Draw active tile
            if (py < 440 && px > 220 && px < 420) begin
                if (active_type != 0) begin
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

        begin // Draw next blocks
            if (py > 40 && py < 320 && px > 422 && px < 538) begin
                if (tile_y >= 11 && tile_y <= 14) begin
                    if (tile_x >= 16 && tile_x <= 19) begin // Next 1
                        if (block_tiles[next_tiles[8 +: 4]][4*(tile_x - 16)+(tile_y - 11)]) begin
                            if (is_border)
                                pixel = `TILE_BORDER_COLOR;
                            else
                                pixel = tile_colors[next_tiles[8 +: 4]];
                        end
                    end else if (tile_x >= 12 && tile_x <= 15) begin // Next 2
                        if (block_tiles[next_tiles[4 +: 4]][4*(tile_x - 12)+(tile_y - 11)]) begin
                            if (is_border)
                                pixel = `TILE_BORDER_COLOR;
                            else
                                pixel = tile_colors[next_tiles[4 +: 4]];
                        end
                    end else if (tile_x >= 8 && tile_x <= 11) begin // Next 3
                        if (block_tiles[next_tiles[0 +: 4]][4*(tile_x - 8)+(tile_y - 11)]) begin
                            if (is_border)
                                pixel = `TILE_BORDER_COLOR;
                            else
                                pixel = tile_colors[next_tiles[0 +: 4]];
                        end
                    end
                end
            end
        end

        begin // Draw hold block
            if (py > 40 && py < 123 && px > 102 && px < 218) begin
                if (tile_x >= 16 && tile_x <= 19) begin
                    if (px/20 >= 6 && px/20 <= 9) begin
                        if (block_tiles[hold_tile][4*(tile_x - 16)+(px/20 - 6)]) begin
                            if (is_border)
                                pixel = `TILE_BORDER_COLOR;
                            else
                                pixel = tile_colors[hold_tile];
                        end
                    end
                end
            end
        end

        begin // Gameover mask
            if (state == 11) begin
                if (py > 40 && py < 440 && px > 220 && px < 420 ||
                    px > 422 && px < 528 && py > 40 && py < 278 ||
                    px > 102 && px < 218 && py > 40 && py < 123) begin
                    pixel = { pixel[8+:4]>>2, pixel[4+:4]>>2, pixel[0+:4]>>2 };
                end
            end
        end


    end

endmodule



