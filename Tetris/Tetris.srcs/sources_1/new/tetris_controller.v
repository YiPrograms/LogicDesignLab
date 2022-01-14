

module tetris_controller(
    input clk,
    input clk_fall,
    input rst,
    input [7:0] keys,
    output reg [799:0] block_states,
    output [28:0] active_block,
    output reg [3:0] state
);

    integer i, j;

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

    function collision(
        input [4:0] bx,
        input [3:0] by,
        input [15:0] block,
        input [799:0] board
    );
        integer i, j;

        for (i = 0; i < 4; i = i + 1) begin
            for (j = 0; j < 4; j = j + 1) begin
                if (block[4*i+j] &&
                    (bx+i <= 1 || by+j <= 1 || by+j >= 12 ||
                        board[(bx+i-2)*40 + (by+i-2)*4 +: 4]))
                    collision = 1;
            end
        end
    endfunction

    parameter S_Menu = 4'd0;
    parameter S_GenBlock = 4'd1;
    parameter S_Falling = 4'd2;
    parameter S_Landing = 4'd3;
    parameter S_Landed = 4'd4;
    parameter S_ClearLines = 4'd5;
    parameter S_Waiting = 4'd6;
    parameter S_GameOver = 4'd7;

    // reg [3:0] state;
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
    rotation_translation rot(
        .block_type(active_type),
        .rotation(active_rot),
        .rotated_block(rotated_block)
    );

    wire [1:0] active_rot_cw = active_rot + 1;
    wire [15:0] rotated_block_cw;
    rotation_translation rot_cw(
        .block_type(active_type),
        .rotation(active_rot_cw),
        .rotated_block(rotated_block_cw)
    );

    wire [1:0] active_rot_ccw = active_rot - 1;
    wire [15:0] rotated_block_ccw;
    rotation_translation rot_ccw(
        .block_type(active_type),
        .rotation(active_rot_ccw),
        .rotated_block(rotated_block_ccw)
    );

    always @* begin
        next_state = state;
        next_block_states = block_states;
        next_active_type = active_type;
        next_active_x = active_x;
        next_active_y = active_y;
        next_active_rot = active_rot;

        case (state)
            S_Menu: begin
                if (keys[7]) // Enter
                    next_state = S_GenBlock;
            end
            S_GenBlock: begin
                if (random <= 7 && random != 0) begin // Random OK
                    next_active_type = random;
                    next_active_x = 22 - block_dims[next_active_type];
                    next_active_y = next_active_type == 4? 6: 5;
                    next_active_rot = 0;

                    next_state = S_Falling;
                end
            end
            S_Falling, S_Landing: begin
                if (clk_fall_1p || keys[4]) begin // Fall
                    if (state == S_Landing) begin // Land
                        next_state = S_Landed;
                    end else begin // Fall
                        next_active_x = active_x - 1;
                        if (collision(active_x - 2, active_y, rotated_block, block_states))
                            next_state = S_Landing;
                    end
                end else if (keys[0]) begin // Left
                    if (!collision(active_x, active_y - 1, rotated_block, block_states)) begin
                        next_active_y = active_y - 1;
                        if (state == S_Landing && !collision(active_x - 1, active_y - 1, rotated_block, block_states))
                            next_state = S_Falling;
                    end
                end else if (keys[1]) begin // Right
                    if (!collision(active_x, active_y + 1, rotated_block, block_states)) begin
                        next_active_y = active_y + 1;
                        if (state == S_Landing && !collision(active_x - 1, active_y + 1, rotated_block, block_states))
                            next_state = S_Falling;
                    end
                end else if (keys[2]) begin // TODO: SRS cw
                    next_active_rot = active_rot + 1;
                end else if (keys[3]) begin // TODO: SRS ccw
                    next_active_rot = active_rot - 1;
                end
            end
            S_Landed: begin
                // if (rotated_block[4*i + j] && active_x + i >= 2 && active_y + j >= 2)
                //     next_block_states[40*(active_x - 2) + 4*(active_y - 2)] = active_type;
                // next_block_states[40*(active_x - 2) + 4*(active_y+1 - 2)] = rotated_block[1]? active_type: block_states[40*(active_x+i - 2) + 4*(active_y+j - 2)];
                // next_block_states[40*(active_x - 2) + 4*(active_y+2 - 2)] = rotated_block[2]? active_type: block_states[40*(active_x+i - 2) + 4*(active_y+j - 2)];
                // next_block_states[40*(active_x - 2) + 4*(active_y+3 - 2)] = rotated_block[3]? active_type: block_states[40*(active_x+i - 2) + 4*(active_y+j - 2)];
                // next_block_states[40*(active_x+1 - 2) + 4*(active_y+j - 2)] = rotated_block[4]? active_type: block_states[40*(active_x+i - 2) + 4*(active_y+j - 2)];
                // next_block_states[40*(active_x+1 - 2) + 4*(active_y+j - 2)] = rotated_block[5]? active_type: block_states[40*(active_x+i - 2) + 4*(active_y+j - 2)];
                // next_block_states[40*(active_x+1 - 2) + 4*(active_y+j - 2)] = rotated_block[6]? active_type: block_states[40*(active_x+i - 2) + 4*(active_y+j - 2)];
                // next_block_states[40*(active_x+1 - 2) + 4*(active_y+j - 2)] = rotated_block[7]? active_type: block_states[40*(active_x+i - 2) + 4*(active_y+j - 2)];
                // next_block_states[40*(active_x+2 - 2) + 4*(active_y+j - 2)] = rotated_block[8]? active_type: block_states[40*(active_x+i - 2) + 4*(active_y+j - 2)];
                // next_block_states[40*(active_x+2 - 2) + 4*(active_y+j - 2)] = rotated_block[9]? active_type: block_states[40*(active_x+i - 2) + 4*(active_y+j - 2)];
                // next_block_states[40*(active_x+2 - 2) + 4*(active_y+j - 2)] = rotated_block[10]? active_type: block_states[40*(active_x+i - 2) + 4*(active_y+j - 2)];
                // next_block_states[40*(active_x+2 - 2) + 4*(active_y+j - 2)] = rotated_block[11]? active_type: block_states[40*(active_x+i - 2) + 4*(active_y+j - 2)];
                // next_block_states[40*(active_x+3 - 2) + 4*(active_y+j - 2)] = rotated_block[12]? active_type: block_states[40*(active_x+i - 2) + 4*(active_y+j - 2)];
                // next_block_states[40*(active_x+3 - 2) + 4*(active_y+j - 2)] = rotated_block[13]? active_type: block_states[40*(active_x+i - 2) + 4*(active_y+j - 2)];
                // next_block_states[40*(active_x+3 - 2) + 4*(active_y+j - 2)] = rotated_block[14]? active_type: block_states[40*(active_x+i - 2) + 4*(active_y+j - 2)];
                // next_block_states[40*(active_x+3 - 2) + 4*(active_y+j - 2)] = rotated_block[15]? active_type: block_states[40*(active_x+i - 2) + 4*(active_y+j - 2)];
                
                // for (i = 0; i < 4; i = i + 1)
                //     for (j = 0; j < 4; j = j + 1)
                //         if (rotated_block[4*i + j] && active_x + i >= 2 && active_y + j >= 2)
                //             next_block_states[(40*(active_x + i - 2) + 4*(active_y + j - 2)) +: 4] = active_type;

                next_active_type = 0;
                next_active_x = 0;
                next_active_y = 0;
                next_active_rot = 0;

                next_state = S_ClearLines;
            end
            S_ClearLines: begin
                next_state = S_Waiting;
            end
            S_Waiting: begin
                next_state = S_GenBlock;
            end
            S_GameOver: begin
                next_state = S_Menu;
            end
        endcase
    end

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            state <= S_Menu;
            block_states <= 0;
            active_type <= 0;
            active_x <= 0;
            active_y <= 0;
            active_rot <= 0;
        end else begin
            state <= next_state;
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
    parameter [15:0] block_tiles [0:8] = {
        16'b0000000000000000,
        16'b0000111100000000,
        16'b0000000101110000,
        16'b0000010001110000,
        16'b0000000000110011,
        16'b0000001001110000,
        16'b0000001101100000,
        16'b0000011000110000,
        16'b0000000000000000
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
