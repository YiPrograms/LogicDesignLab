
module tetris_controller(
    input clk,
    input clk_fall,
    input rst,
    input [6:0] keys,
    output reg [799:0] block_states,
    output [28:0] active_block
);

    integer i;

    integer block_dims [0:7] = {0, 4, 3, 3, 2, 3, 3, 3};

    onepulse clk_fall_op(
        .signal(clk_fall),
        .clk(clk),
        .op(clk_fall_1p)
    );

    wire [3:0] random;
    LFSR lfsr_inst(
        .clk(clk),
        .rst(rst),
        .random(random)
    );

    reg [3:0] state;
    reg [3:0] active_type;
    reg [4:0] active_x;
    reg [3:0] active_y;
    reg [1:0] active_rot;
    reg [27:0] fall_counter;

    reg [799:0] next_block_states;

    reg [3:0] next_state;
    reg [3:0] next_active_type;
    reg [4:0] next_active_x;
    reg [3:0] next_active_y;
    reg [1:0] next_active_rot;
    reg [27:0] next_fall_counter;

    wire [15:0] rotated_block;
    rotation_translation(
        .block_type(active_type),
        .rotation(active_rot),
        .rotated_block(rotated_block)
    );

    always @* begin
        // next_block_states = { {{21 {{10 {4'd0}}} }} , 4'd1, 4'd2, 4'd3, 4'd4, 4'd5, 4'd6, 4'd7, 4'd8, 4'd0, 4'd1};
        next_block_states = block_states;
        next_active_type = active_type;
        next_active_x = active_x;
        next_active_y = active_y;
        next_active_rot = active_rot;

        if (active_type == 0) begin // Create active block
            if (random <= 7 && random != 0) begin // Random OK
                next_active_type = random;
                next_active_x = 20 - block_dims[next_active_type];
                next_active_y = next_active_type == 4? 4: 3;
                next_active_rot = 0;
            end
        end else begin
            if (clk_fall_1p) begin
                next_active_x = active_x - 1;
            end else if (keys[0]) begin
                if (active_y != 0)
                    next_active_y = active_y - 1;
            end else if (keys[1]) begin
                if (active_y != 9)
                    next_active_y = active_y + 1;
            end else if (keys[4]) begin
                next_active_x = active_x - 1;
            end else if (keys[2]) begin
                next_active_rot = active_rot + 1;
            end else if (keys[3]) begin
                next_active_rot = active_rot - 1;
            end
        end
    end

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            state <= 
            block_states <= 0;
            active_type <= 0;
            active_x <= 0;
            active_y <= 0;
            active_rot <= 0;
        end else begin
            block_states <= next_block_states;
            active_type <= next_active_type;
            active_x <= next_active_x;
            active_y <= next_active_y;
            active_rot <= next_active_rot;
        end
    end
    
    assign active_block = {rotated_block, active_y, active_x, active_type};

endmodule

module rotation_translation(
    input [3:0] block_type,
    input [1:0] rotation,
    output reg [15:0] rotated_block
);
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

    integer i, j;

    always @* begin
        rotated_block = block_tiles[block_type];
        if (block_dims[block_type] == 3)
            case (rotation)
                // 0:  for (i = 0; i < 4; i = i + 1)
                //         for (j = 0; j < 4; j = j + 1)
                //             rotated_block[4*i + j] = block_tiles[block_type][4*i + j];
                1:  for (i = 0; i < 3; i = i + 1)
                        for (j = 0; j < 3; j = j + 1)
                            rotated_block[4*i + j] = block_tiles[block_type][4*j + (3-i - 1)];
                2:  for (i = 0; i < 3; i = i + 1)
                        for (j = 0; j < 3; j = j + 1)
                            rotated_block[4*i + j] = block_tiles[block_type][4*(3-i - 1) + (3-j - 1)];
                3:  for (i = 0; i < 3; i = i + 1)
                        for (j = 0; j < 3; j = j + 1)
                            rotated_block[4*i + j] = block_tiles[block_type][4*(3-j - 1) + i];
            endcase
        else if (block_dims[block_type] == 4)
            case (rotation)
                // 0:  for (i = 0; i < 4; i = i + 1)
                //         for (j = 0; j < 4; j = j + 1)
                //             rotated_block[4*i + j] = block_tiles[block_type][4*i + j];
                1:  for (i = 0; i < 4; i = i + 1)
                        for (j = 0; j < 4; j = j + 1)
                            rotated_block[4*i + j] = block_tiles[block_type][4*j + (3-i)];
                2:  for (i = 0; i < 4; i = i + 1)
                        for (j = 0; j < 4; j = j + 1)
                            rotated_block[4*i + j] = block_tiles[block_type][4*(3-i) + (3-j)];
                3:  for (i = 0; i < 4; i = i + 1)
                        for (j = 0; j < 4; j = j + 1)
                            rotated_block[4*i + j] = block_tiles[block_type][4*(3-j) + i];
            endcase
    end

endmodule

// function check_colision(
//     input [4:0] bx,
//     input [3:0] by,
//     input [15:0] block,
//     input [799:0] table
// )