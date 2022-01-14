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
   input [879:0] block_states,
   input [14:0] active_block,
   output reg [11:0] pixel
);
    
    integer i;

    wire [4:0] tile_x = 21 - py/20;
    wire [3:0] tile_y = px/20 - 11;
    wire [9:0] tile_offset = tile_x*40 + tile_y*4;
    localparam [11:0] tile_colors [0:8] = {
        `WHITE, `I_BLOCK_COLOR, `J_BLOCK_COLOR, `L_BLOCK_COLOR, `O_BLOCK_COLOR,
        `T_BLOCK_COLOR, `Z_BLOCK_COLOR, `S_BLOCK_COLOR, `GRAY_BLOCK_COLOR
    };

    wire [3:0] active_type;
    wire [4:0] active_x;
    wire [3:0] active_y;
    wire [1:0] active_rot;
    assign {active_rot, active_y, active_x, active_type} = active_block;

    wire [1:0] ax = tile_x - active_x; // Active tile inner x
    wire [1:0] ay = tile_y - active_y; // Active tile inner y

    integer block_dims [0:7] = {0, 4, 3, 3, 2, 3, 3, 3};
    parameter [15:0] block_tiles [0:7] = {
        16'b0000000000000000,
        16'b0000111100000000,
        16'b0000000101110000,
        16'b0000010001110000,
        16'b0000000000110011,
        16'b0000001001110000,
        16'b0000001101100000,
        16'b0000011000110000
    };

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
            if (py > 40 && py < 440 && px > 220 && px < 420) begin
                if (active_type != 0 &&
                    tile_x >= active_x && tile_x < active_x + block_dims[active_type] && 
                    tile_y >= active_y && tile_y < active_y + block_dims[active_type]) begin
                    
                    if (block_dims[active_type] == 2)
                        pixel = tile_colors[active_type];
                    else if (block_dims[active_type] == 3)
                        case (active_rot)
                            0: if (block_tiles[active_type][4*ax + ay])
                                pixel = tile_colors[active_type];
                            1: if (block_tiles[active_type][4*ay + (3-ax - 1)])
                                pixel = tile_colors[active_type];
                            2: if (block_tiles[active_type][4*(3-ax - 1) + (3-ay - 1)])
                                pixel = tile_colors[active_type];
                            3: if (block_tiles[active_type][4*(3-ay - 1) + ax])
                                pixel = tile_colors[active_type];
                        endcase
                    else // 4
                        case (active_rot)
                            0: if (block_tiles[active_type][4*ax + ay])
                                pixel = tile_colors[active_type];
                            1: if (block_tiles[active_type][4*ay + (3-ax)])
                                pixel = tile_colors[active_type];
                            2: if (block_tiles[active_type][4*(3-ax) + (3-ay)])
                                pixel = tile_colors[active_type];
                            3: if (block_tiles[active_type][4*(3-ay) + ax])
                                pixel = tile_colors[active_type];
                        endcase
                end
            end
        end

    end

endmodule



