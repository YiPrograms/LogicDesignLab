

module tetris_controller(
    input clk,
    input clk_fall,
    input rst,
    input [7:0] keys,
    output [799:0] block_states,
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

    reg [7:0] addra;
    reg [3:0] dina;
    reg wea;
    wire [7:0] addrb;
    wire [3:0] doutb;
    blk_mem_gen_0 block_bram(
        .addra(addra),
        .clka(clk),
        .dina(dina),
        .wea(wea),
        .addrb(addrb),
        .clkb(clk),
        .doutb(doutb)
    );

    block_reader br(
        .clk(clk),
        .rst(rst),
        .addrb(addrb),
        .doutb(doutb),
        .block_states(block_states)
    );

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
    reg [1:0] op_x;
    reg [1:0] op_y;


    reg [3:0] next_state;
    reg [3:0] next_active_type;
    reg [4:0] next_active_x;
    reg [3:0] next_active_y;
    reg [1:0] next_active_rot;
    reg [27:0] next_fall_counter;
    reg [1:0] next_op_x;
    reg [1:0] next_op_y;

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

    reg [4:0] check_x;
    reg [3:0] check_y;

    collision_check cc_check(
        .bx(check_x),
        .by(check_y),
        .block(rotated_block),
        .board(block_states),
        .collision(col_check)
    );

    wire [4:0] check_down_bx = check_x - 1;
    collision_check cc_check_down(
        .bx(check_down_bx),
        .by(check_y),
        .block(rotated_block),
        .board(block_states),
        .collision(col_check_down)
    );

    always @* begin
        next_state = state;
        next_active_type = active_type;
        next_active_x = active_x;
        next_active_y = active_y;
        next_active_rot = active_rot;
        next_op_x = 0;
        next_op_y = 0;

        check_x = active_x;
        check_y = active_y;

        addra = 0;
        dina = 0;
        wea = 0;

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
                        check_x = active_x - 1;
                        if (col_check_down)
                            next_state = S_Landing;
                    end
                end else if (keys[0]) begin // Left
                    check_y = active_y - 1;
                    if (!col_check) begin
                        next_active_y = active_y - 1;
                        if (state == S_Landing && !col_check_down)
                            next_state = S_Falling;
                    end
                end else if (keys[1]) begin // Right
                    check_y = active_y + 1;
                    if (!col_check) begin
                        next_active_y = active_y + 1;
                        if (state == S_Landing && !col_check_down)
                            next_state = S_Falling;
                    end
                end else if (keys[2]) begin // TODO: SRS cw
                    next_active_rot = active_rot + 1;
                end else if (keys[3]) begin // TODO: SRS ccw
                    next_active_rot = active_rot - 1;
                end
            end
            S_Landed: begin
                // for (i = 0; i < 4; i = i + 1)
                //     for (j = 0; j < 4; j = j + 1)
                //         if (rotated_block[4*i + j] && active_x + i >= 2 && active_y + j >= 2)
                //             next_block_states[(40*(active_x + i - 2) + 4*(active_y + j - 2)) +: 4] = active_type;
                if (rotated_block[4*op_x + op_y] && active_x + op_x >= 3 && active_y + op_y >= 3) begin
                    addra = 10*(active_x + op_x - 3) + (active_y + op_y - 3);
                    dina = active_type;
                    wea = 1;
                end
                // if (active_x + op_x >= 3 && active_y + op_y >= 3) begin
                //     addra = 10*(active_x + op_x - 3) + (active_y + op_y - 3);
                //     dina = active_type;
                //     wea = 1;
                // end

                next_op_y = op_y + 1;
                next_op_x = op_y == 3? op_x + 1: op_x;
                
                if (op_x == 3 && op_y == 3) begin
                    next_active_type = 0;
                    next_active_x = 0;
                    next_active_y = 0;
                    next_active_rot = 0;

                    next_state = S_ClearLines;
                end
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
            active_type <= 0;
            active_x <= 0;
            active_y <= 0;
            active_rot <= 0;
            op_x <= 0;
            op_y <= 0;
        end else begin
            state <= next_state;
            active_type <= next_active_type;
            active_x <= next_active_x;
            active_y <= next_active_y;
            active_rot <= next_active_rot;
            op_x <= next_op_x;
            op_y <= next_op_y;
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

module collision_check(
    input [4:0] bx,
    input [3:0] by,
    input [15:0] block,
    input [799:0] board,
    output reg collision
);
    integer i, j;

    always @* begin
        collision = 0;
        for (i = 0; i < 4; i = i + 1) begin
            for (j = 0; j < 4; j = j + 1) begin
                if (block[4*i+j] &&
                    (bx+i <= 2 || by+j <= 2 || by+j >= 13 ||
                        board[(bx+i-3)*40 + (by+i-3)*4 +: 4]))
                    collision = 1;
            end
        end
    end
endmodule

module block_reader(
    input clk,
    input rst,
    output reg [7:0] addrb,
    input [3:0] doutb,
    output reg [799:0] block_states
);

    reg [799:0] next_block_states;
    reg [7:0] next_addrb;

    always @* begin
        next_block_states = block_states;
        next_block_states[4*addrb +: 4] = doutb;
        next_addrb = addrb == 199? 0: addrb + 1;
    end

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            block_states <= 0;
            addrb <= 0;
        end else begin
            block_states <= next_block_states;
            addrb <= next_addrb;
        end
    end
endmodule