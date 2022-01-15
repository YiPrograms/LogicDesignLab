

module tetris_controller(
    input clk,
    input clk_fall,
    input rst,
    input [7:0] keys,
    output [799:0] block_states,
    output [28:0] active_block,
    output reg [3:0] state
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

    always @* begin

        // addra = 0;
        // dina = 0;
        // wea = 0;
        addra = 10*(active_x + i - 3) + (active_y + j - 3);
        dina = active_type;
        wea = 1;

                next_op_y = op_y + 1;
                next_op_x = op_y == 1? op_x + 1: op_x;
                
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
        next_addrb = addrb == 799? 0: addrb + 1;
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