

module tetris_controller(
    input clk,
    input clk_fall,
    input rst,
    input [7:0] keys,
    output [799:0] block_states,
    output [199:0] block_bits,
    output [33:0] active_block,
    output reg [3:0] state,
    output reg [3:0] hold_tile,
    output reg [11:0] next_tiles,
    output [19:0] whole_lines,
    output reg send_block,
    input received_block,

    output [4:0] xx,
    output [3:0] yy,
    output [3:0] dat,
    output [3:0] led_test
);

    integer i, j;

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

    onepulse clk_fall_op(
        .signal(clk_fall),
        .clk(clk),
        .op(clk_fall_1p)
    );

    wire [2:0] random;
    LFSR lfsr_inst(
        .clk(clk),
        .rst(rst),
        .random(random)
    );

    wire [3:0] random4b;
    LFSR4B lfsr_inst_4b(
        .clk(clk),
        .rst(rst),
        .random(random4b)
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

    // wire [199:0] block_bits;

    block_reader br(
        .clk(clk),
        .rst(rst),
        .addrb(addrb),
        .doutb(doutb),
        .block_states(block_states),
        .block_bits(block_bits)
        // .xx(xx),
        // .yy(yy)
    );

    parameter S_Reset = 4'd0;
    parameter S_Menu = 4'd1;
    parameter S_GenBlock = 4'd2;
    parameter S_Falling = 4'd3;
    parameter S_Landing = 4'd4;
    parameter S_Dropping = 4'd5;
    parameter S_Landed = 4'd6;
    parameter S_WaitUpdate = 4'd7;
    parameter S_ClearLineAni = 4'd8;
    parameter S_ClearLines = 4'd9;
    parameter S_Waiting = 4'd10;
    parameter S_GameOver = 4'd11;
    parameter S_GarbageBlocks = 4'd12;
    parameter S_GarbageUpdate = 4'd13;

    // reg [3:0] state;
    reg [3:0] active_type;
    reg [4:0] active_x;
    reg [3:0] active_y;
    reg [1:0] active_rot;
    reg [27:0] counter;
    reg [1:0] op_x;
    reg [1:0] op_y;
    reg [4:0] clearing_x;
    reg [3:0] clearing_y;
    reg gameover;
    reg [1:0] spawn_offset;
    reg [3:0] spawn_type;
    reg break_landing;
    reg [4:0] ghost_x;
    // reg [3:0] hold_tile;
    // reg [11:0] next_tiles;
    reg hold_used;
    reg [27:0] fall_counter_target;
    reg [2:0] land_break_times;
    reg [2:0] garbage_blocks_buffer;
    reg [3:0] garbage_blocks_hole;
    reg [27:0] garbage_group_counter;
    reg [2:0] garbage_rows_cnt;


    reg [3:0] next_state;
    reg [3:0] next_active_type;
    reg [4:0] next_active_x;
    reg [3:0] next_active_y;
    reg [1:0] next_active_rot;
    reg [27:0] next_counter;
    reg [1:0] next_op_x;
    reg [1:0] next_op_y;
    reg [4:0] next_clearing_x;
    reg [3:0] next_clearing_y;
    reg next_gameover;
    reg [1:0] next_spawn_offset;
    reg [3:0] next_spawn_type;
    reg next_break_landing;
    reg [4:0] next_ghost_x;
    reg [3:0] next_hold_tile;
    reg [11:0] next_next_tiles;
    reg next_hold_used;
    reg [27:0] next_fall_counter_target;
    reg [2:0] next_land_break_times;
    reg [2:0] next_garbage_blocks_buffer;
    reg [3:0] next_garbage_blocks_hole;
    reg [27:0] next_garbage_group_counter;
    reg [2:0] next_garbage_rows_cnt;



    wire [15:0] rotated_block;
    rotation_translation rot(
        .block_type(active_type),
        .rotation(active_rot),
        .rotated_block(rotated_block)
    );
    // assign dat = rotated_block[4*op_x + op_y] && active_x + op_x >= 3 && active_y + op_y >= 3? active_type: 0;
    assign dat = garbage_blocks_buffer;

    wire [1:0] active_rot_cw = active_rot + 1;
    wire [15:0] rotated_block_cw;
    rotation_translation rot_cw(
        .block_type(active_type),
        .rotation(active_rot_cw),
        .rotated_block(rotated_block_cw)
    );

    // wire [1:0] active_rot_ccw = active_rot - 1;
    // wire [15:0] rotated_block_ccw;
    // rotation_translation rot_ccw(
    //     .block_type(active_type),
    //     .rotation(active_rot_ccw),
    //     .rotated_block(rotated_block_ccw)
    // );

    reg [4:0] check_x;
    reg [3:0] check_y;
    reg [15:0] check_block;
    reg up_col;

    collision_check cc_check(
        .bx(check_x),
        .by(check_y),
        .block(check_block),
        .board(block_bits),
        .up_col(up_col),
        .collision(col_check)
    );

    // reg [4:0] check2_x;
    // reg [3:0] check2_y;
    // reg [15:0] check2_block;
    // reg up_col2;

    // collision_check cc_check2(ghost_y

    wire [4:0] ghost_check_x = ghost_x - 1;
    collision_check ghost_check(
        .bx(ghost_check_x),
        .by(active_y),
        .block(rotated_block),
        .board(block_bits),
        .up_col(0),
        .collision(ghost_col)
    );


    wire [1:0] srs_offset_x;
    wire srs_x_neg;
    wire [1:0] srs_offset_y;
    wire srs_y_neg;
    wire srs_fail;
    reg [15:0] srs_rotated_block;
    // reg srs_is_ccw;
    wire [4:0] t1_x;
    super_rotating_system SRS(
        .rotation(active_rot),
        // .ccw(srs_is_ccw),
        .i_block(active_type == 1),
        .rotated_block(rotated_block_cw),
        // .rotated_block(srs_rotated_block),
        .board(block_bits),
        .ax(active_x),
        .ay(active_y),
        .ox(srs_offset_x),
        .oy(srs_offset_y),
        .ox_neg(srs_x_neg),
        .oy_neg(srs_y_neg),
        .fail(srs_fail),
        .t1_x(t1_x),
        .t1_y(yy),
        .col1(led_test[0])
    );
    assign xx = active_y;
    assign led_test[2:1] = {srs_x_neg, srs_y_neg};

    wire [4:0] whole_line_x;
    whole_line(
        .board(block_bits),
        .line_x(whole_line_x),
        .whole_lines(whole_lines)
    );

    always @* begin
        next_state = state;
        next_active_type = active_type;
        next_active_x = active_x;
        next_active_y = active_y;
        next_active_rot = active_rot;
        next_op_x = 0;
        next_op_y = 0;
        next_counter = 0;
        next_clearing_x = 20;
        next_clearing_y = 0;
        next_gameover = 0;
        next_spawn_offset = 0;
        next_spawn_type = 0;
        next_break_landing = 0;
        next_ghost_x = ghost_x;
        next_hold_tile = hold_tile;
        next_next_tiles = next_tiles;
        next_hold_used = hold_used;
        next_fall_counter_target = fall_counter_target;
        next_land_break_times = 0;
        next_garbage_blocks_hole = garbage_blocks_hole;
        next_garbage_blocks_buffer = garbage_blocks_buffer + (state != S_Menu && received_block);
        check_x = active_x;
        check_y = active_y;
        check_block = rotated_block;
        up_col = 0;

        // check2_x = active_x;
        // check2_y = active_y;
        // check2_block = rotated_block;
        // up_col2 = 0;

        addra = 0;
        dina = 0;
        wea = 0;

        send_block = 0;

        srs_rotated_block = 0;
        // srs_is_ccw = 0;

        
        next_garbage_group_counter = garbage_group_counter + 1;
        if (garbage_group_counter == 2000) begin
            next_garbage_blocks_hole = 10;
            next_garbage_group_counter = 0;
            next_garbage_rows_cnt = 0;
        end
        


        case (state)
            S_Reset: begin
                addra = 10*clearing_x + clearing_y;
                dina = 0;
                wea = 1;

                next_clearing_x = clearing_x;
                next_clearing_y = clearing_y + 1;
                if (clearing_y == 9) begin
                    next_clearing_x = clearing_x - 1;
                    next_clearing_y = 0;
                    if (clearing_x == 0)
                        next_state = S_Menu;
                end

                next_hold_tile = 0;
                next_next_tiles = 0;
                next_fall_counter_target = 100000000/512;
                next_garbage_blocks_buffer = 0;
            end
            S_Menu: begin
                if (keys[7]) begin // Enter
                    next_state = S_GenBlock;
                    send_block = 1; // Notify opponent to start
                end else if (received_block) begin // Opponent started
                    next_state = S_GenBlock;
                end
            end
            S_GenBlock: begin
                next_spawn_type = spawn_type;
                next_spawn_offset = spawn_offset;
                if (spawn_type == 0) begin
                    if (random != 0) begin // Random OK
                        next_spawn_type = next_tiles[8 +: 4];
                        next_next_tiles[4 +: 8] = next_tiles[0 +: 8];
                        next_next_tiles[0 +: 4] = random;
                    end
                end else begin
                    next_active_type = spawn_type;
                    next_active_rot = 0;

                    if (spawn_type == 4) begin
                        next_active_y = 7;
                        if (block_bits[10*(22-3)+7-3 +:2])
                            next_active_x = 23;
                        else if (block_bits[10*(21-3)+7-3 +:2])
                            next_active_x = 22;
                        else
                            next_active_x = 21;
                    end else if (spawn_type == 1) begin
                        next_active_y = 6;
                        if (block_bits[10*(22-3)+6-3 +:4])
                            next_active_x = 21;
                        else
                            next_active_x = 20;
                    end else begin
                        next_active_y = 6;
                        if (block_bits[10*(22-3)+6-3 +:3])
                            next_active_x = 22;
                        else if (block_bits[10*(21-3)+6-3 +:3])
                            next_active_x = 21;
                        else
                            next_active_x = 20;
                    end
                    next_state = S_Falling;
                    next_ghost_x = next_active_x;
                    next_break_landing = 1;

                    // check_y = spawn_type == 4? 7: 6;
                    // check_x = 23 + spawn_offset - block_dims[spawn_type];
                    // check_block = block_tiles[spawn_type];
                    
                    // if (!col_check) begin
                    //     next_state = S_Falling;
                    //     next_active_type = spawn_type;
                    //     next_active_x = 23 + spawn_offset - block_dims[spawn_type];
                    //     next_active_y = spawn_type == 4? 7: 6;
                    //     next_active_rot = 0;
                    // end else begin
                    //     next_spawn_offset = spawn_offset + 1;
                    // end
                end
            end
            S_Falling, S_Dropping: begin
                next_break_landing = break_landing;
                next_land_break_times = land_break_times;
                next_counter = counter + 1;
                if (state == S_Dropping || counter == fall_counter_target || keys[4]) begin // Fall
                    check_x = active_x - 1;
                    next_counter = 0;
                    if (!col_check) begin
                        next_active_x = active_x - 1;
                        next_fall_counter_target = fall_counter_target > 30000000/512? fall_counter_target - 5000/64: 30000000/512;
                    end else begin
                        if (break_landing && land_break_times <= 7) begin
                            next_break_landing = 0;
                            next_land_break_times = land_break_times + 1;
                        end else begin
                            next_state = S_Landed;
                            next_fall_counter_target = fall_counter_target > 30000000/512? fall_counter_target - 50000/64: 30000000/512;
                        end
                    end
                end else if (garbage_blocks_buffer != 0) begin
                    check_x = active_x - 1;
                    if (check_x >= 0 && !col_check) begin
                        next_ghost_x = next_active_x;
                        next_counter = 0;
                        next_state = S_GarbageUpdate;
                    end
                end else if (state == S_Falling) begin
                    if (keys[0]) begin // Left
                        check_y = active_y - 1;
                        if (!col_check) begin
                            next_active_y = active_y - 1;
                            next_break_landing = 1;
                            next_ghost_x = active_x;
                        end
                    end else if (keys[1]) begin // Right
                        check_y = active_y + 1;
                        if (!col_check) begin
                            next_active_y = active_y + 1;
                            next_break_landing = 1;
                            next_ghost_x = active_x;
                        end
                    end else if (keys[2]) begin // SRS cw
                        // srs_rotated_block = rotated_block_cw;
                        if (!srs_fail) begin
                            next_active_rot = active_rot + 1;
                            next_active_x = srs_x_neg? active_x - srs_offset_x :active_x + srs_offset_x;
                            next_active_y = srs_y_neg? active_y - srs_offset_y :active_y + srs_offset_y;
                            next_break_landing = 1;
                            next_ghost_x = next_active_x;
                        end
                    end else if (keys[5]) begin // Space: Hard drop
                        next_state = S_Dropping;
                    end else if (keys[6] && !hold_used) begin // C: Hold
                        next_hold_used = 1;
                        next_hold_tile = active_type;
                        next_spawn_type = hold_tile;
                        next_state = S_GenBlock;
                    end
                end
                
                if (!ghost_col) begin // Ghost block
                    next_ghost_x = ghost_x - 1;
                end
            end
            S_GarbageBlocks: begin
                if (clearing_x == 20)
                    if (garbage_blocks_buffer == 0 || garbage_rows_cnt > 4)
                        next_state = S_GarbageUpdate;
                    else begin
                        if (garbage_blocks_hole == 10) begin
                            if (random4b <= 9) begin
                                next_garbage_blocks_hole = random4b;
                            end
                        end else begin
                            next_clearing_x = 1;
                            next_garbage_blocks_buffer = garbage_blocks_buffer - 1;
                            next_garbage_group_counter = 0;
                            next_garbage_rows_cnt = garbage_rows_cnt + 1;
                        end
                    end
                else begin
                    next_clearing_x = clearing_x;

                    addra = 10*clearing_x + clearing_y;
                    dina = clearing_x == 0? (clearing_y == garbage_blocks_hole? 0: 8)
                            : block_states[40*(clearing_x - 1) + 4*clearing_y +: 4];
                    wea = 1;

                    next_clearing_y = clearing_y + 1;
                    if (clearing_y == 9) begin
                        next_clearing_x = clearing_x + 1;
                        next_clearing_y = 0;
                        if (clearing_x == 19)
                            next_clearing_x = 0;
                        else if (clearing_x == 0)
                            next_state = S_GarbageUpdate;
                    end
                end
            end
            S_Landed: begin
                next_hold_used = 0;
                if (rotated_block[4*op_x + op_y] && active_x + op_x >= 3 && active_y + op_y >= 3 && active_x + op_x <= 22) begin
                    addra = 10*(active_x + op_x - 3) + (active_y + op_y - 3);
                    dina = active_type;
                    wea = 1;
                end
                next_op_y = op_y + 1;
                next_op_x = op_y == 3? op_x + 1: op_x;
                
                up_col = 1;
                next_gameover = (op_x == 0 && op_y == 0)? col_check: gameover;
                
                if (op_x == 3 && op_y == 3) begin
                    next_active_type = 0;
                    next_active_x = 0;
                    next_active_y = 0;
                    next_active_rot = 0;

                    if (gameover)
                        next_state = S_GameOver;
                    else
                        next_state = S_ClearLineAni;
                end
            end
            S_ClearLineAni: begin
                next_counter = counter + 1;
                if (counter == 300 && whole_line_x == 20)
                    next_state = S_Waiting;
                else if (counter == 20000000/512) // 0.2s
                    next_state = S_ClearLines;
            end
            S_WaitUpdate: begin
                next_counter = counter + 1;
                if (counter == 300)
                    next_state = S_ClearLines;
            end
            S_GarbageUpdate: begin
                next_counter = counter + 1;
                if (counter == 300)
                    if (garbage_blocks_buffer == 0 || garbage_rows_cnt > 4)
                        next_state = S_Falling;
                    else
                        next_state = S_GarbageBlocks;
            end
            S_ClearLines: begin
                if (clearing_x == 20)
                    if (whole_line_x == 20)
                        next_state = S_Waiting;
                    else begin
                        next_clearing_x = whole_line_x;
                        send_block = 1;
                    end
                else begin
                    next_clearing_x = clearing_x;

                    addra = 10*clearing_x + clearing_y;
                    dina = clearing_x == 19? 0: block_states[40*(clearing_x + 1) + 4*clearing_y +: 4];
                    wea = 1;

                    next_clearing_y = clearing_y + 1;
                    if (clearing_y == 9) begin
                        next_clearing_x = clearing_x + 1;
                        next_clearing_y = 0;
                        if (clearing_x == 19)
                            next_state = S_WaitUpdate;
                    end
                end
            end
            S_Waiting: begin
                next_state = S_GenBlock;
            end
            S_GameOver: begin
                if (keys[7]) // Enter
                    next_state = S_Reset;
            end
        endcase
    end

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            state <= S_Reset;
            active_type <= 0;
            active_x <= 0;
            active_y <= 0;
            active_rot <= 0;
            op_x <= 0;
            op_y <= 0;
            clearing_x <= 20;
            clearing_y <= 0;
            counter <= 0;
            gameover <= 0;
            spawn_offset <= 0;
            spawn_type <= 0;
            break_landing <= 0;
            ghost_x <= 0;
            hold_tile <= 0;
            next_tiles <= 0;
            hold_used <= 0;
            fall_counter_target <= 100000000/512;
            land_break_times <= 0;
            garbage_blocks_buffer <= 0;
            garbage_blocks_hole <= 10;
            garbage_group_counter <= 0;
            garbage_rows_cnt <= 0;
        end else begin
            state <= next_state;
            active_type <= next_active_type;
            active_x <= next_active_x;
            active_y <= next_active_y;
            active_rot <= next_active_rot;
            op_x <= next_op_x;
            op_y <= next_op_y;
            clearing_x <= next_clearing_x;
            clearing_y <= next_clearing_y;
            counter <= next_counter;
            gameover <= next_gameover;
            spawn_offset <= next_spawn_offset;
            spawn_type <= next_spawn_type;
            break_landing <= next_break_landing;
            ghost_x <= next_ghost_x;
            hold_tile <= next_hold_tile;
            next_tiles <= next_next_tiles;
            hold_used <= next_hold_used;
            fall_counter_target <= next_fall_counter_target;
            land_break_times <= next_land_break_times;
            garbage_blocks_buffer <= next_garbage_blocks_buffer;
            garbage_blocks_hole <= next_garbage_blocks_hole;
            garbage_group_counter <= next_garbage_group_counter;
            garbage_rows_cnt <= next_garbage_rows_cnt;
        end
    end
    
    assign active_block = {rotated_block, ghost_x, active_y, active_x, active_type};

    // assign xx = srs_offset_x;
    // assign yy = srs_offset_y;

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
    input [199:0] board,
    input up_col,
    output reg collision
);
    integer i, j;

    reg [15:0] backboard;

    always @* begin
        for (i = 0; i < 4; i = i + 1) begin
            for (j = 0; j < 4; j = j + 1) begin
                backboard[4*i+j] = (bx+i <= 2 || by+j <= 2 || by+j >= 13)? 1:
                                   (bx+i >= 23)? up_col:
                                   board[(bx+i-3)*10 + (by+j-3)];
            end
        end

        collision = (backboard & block) != 0;
    end
endmodule

module block_reader(
    input clk,
    input rst,
    output reg [7:0] addrb,
    input [3:0] doutb,
    output reg [799:0] block_states,
    output reg [199:0] block_bits
);

    reg [799:0] next_block_states;
    reg [199:0] next_block_bits;
    reg [7:0] next_addrb;
    reg [7:0] last_addrb;
    reg [7:0] last_last_addrb;

    always @* begin
        next_block_states = block_states;
        next_block_bits = block_bits;
        next_block_states[last_last_addrb*4 +: 4] = doutb;
        next_block_bits[last_last_addrb] = doutb? 1: 0;

        next_addrb = addrb == 199? 0: addrb + 1;
    end

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            block_states <= 0;
            block_bits <= 0;
            addrb <= 0;
            last_addrb <= 0;
            last_last_addrb <= 0;
        end else begin
            block_states <= next_block_states;
            block_bits <= next_block_bits;
            last_last_addrb <= last_addrb;
            last_addrb <= addrb;
            addrb <= next_addrb;
        end
    end
endmodule

module whole_line(
    input [199:0] board,
    output reg [4:0] line_x,
    output reg [19:0] whole_lines
);

    integer i;
    always @* begin
        line_x = 20;
        whole_lines = 0;
        for (i = 19; i >= 0; i = i - 1) begin
            if (board[10*i +: 10] == 10'b1111111111) begin
                line_x = i;
                whole_lines[i] = 1;
            end
        end
    end
    
endmodule