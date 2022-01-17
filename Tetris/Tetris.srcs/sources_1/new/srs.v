
module super_rotating_system(
    input [1:0] rotation,
    input i_block,
    input ccw,
    input [15:0] rotated_block,
    input [199:0] board,
    input [4:0] ax,
    input [3:0] ay,
    output reg [1:0] ox,
    output reg [1:0] oy,
    output reg ox_neg,
    output reg oy_neg,
    output reg fail
);

    collision_check cc_0(
        .bx(ax),
        .by(ay),
        .block(rotated_block),
        .board(board),
        .up_col(0),
        .collision(col0)
    );

    reg t1x_neg_cw, t1y_neg_cw;
    reg [1:0] t1_ox, t1_oy;
    wire t1x_neg = ccw? ~t1x_neg_cw: t1x_neg_cw;
    wire t1y_neg = ccw? ~t1y_neg_cw: t1y_neg_cw;
    wire [4:0] t1_x = t1x_neg? ax - t1_ox: ax + t1_ox;
    wire [3:0] t1_y = t1y_neg? ay - t1_oy: ay + t1_oy;
    collision_check cc_1(
        .bx(t1_x),
        .by(t1_y),
        .block(rotated_block),
        .board(board),
        .up_col(0),
        .collision(col1)
    );


    reg t2x_neg_cw, t2y_neg_cw;
    reg [1:0] t2_ox, t2_oy;
    wire t2x_neg = ccw? ~t2x_neg_cw: t2x_neg_cw;
    wire t2y_neg = ccw? ~t2y_neg_cw: t2y_neg_cw;
    wire [4:0] t2_x = t2x_neg? ax - t2_ox: ax + t2_ox;
    wire [3:0] t2_y = t2y_neg? ay - t2_oy: ay + t2_oy;
    collision_check cc_2(
        .bx(t2_x),
        .by(t2_y),
        .block(rotated_block),
        .board(board),
        .up_col(0),
        .collision(col2)
    );


    reg t3x_neg_cw, t3y_neg_cw;
    reg [1:0] t3_ox, t3_oy;
    wire t3x_neg = ccw? ~t3x_neg_cw: t3x_neg_cw;
    wire t3y_neg = ccw? ~t3y_neg_cw: t3y_neg_cw;
    wire [4:0] t3_x = t3x_neg? ax - t3_ox: ax + t3_ox;
    wire [3:0] t3_y = t3y_neg? ay - t3_oy: ay + t3_oy;
    collision_check cc_3(
        .bx(t3_x),
        .by(t3_y),
        .block(rotated_block),
        .board(board),
        .up_col(0),
        .collision(col3)
    );


    reg t4x_neg_cw, t4y_neg_cw;
    reg [1:0] t4_ox, t4_oy;
    wire t4x_neg = ccw? ~t4x_neg_cw: t4x_neg_cw;
    wire t4y_neg = ccw? ~t4y_neg_cw: t4y_neg_cw;
    wire [4:0] t4_x = t4x_neg? ax - t4_ox: ax + t4_ox;
    wire [3:0] t4_y = t4y_neg? ay - t4_oy: ay + t4_oy;
    collision_check cc_4(
        .bx(t4_x),
        .by(t4_y),
        .block(rotated_block),
        .board(board),
        .up_col(0),
        .collision(col4)
    );

    wire [1:0] rot_check = rotation + ccw;

    always @* begin
        ox = 0;
        oy = 0;
        ox_neg = 0;
        oy_neg = 0;
        fail = 1;

        if (!i_block) begin
            case (rot_check)
                0: begin
                    t1_ox = 0; t1_oy = 1; t1x_neg_cw = 0; t1y_neg_cw = 1;
                    t2_ox = 1; t2_oy = 1; t2x_neg_cw = 0; t2y_neg_cw = 1;
                    t3_ox = 2; t3_oy = 0; t3x_neg_cw = 1; t3y_neg_cw = 0;
                    t4_ox = 2; t4_oy = 1; t4x_neg_cw = 1; t4y_neg_cw = 1;
                end
                1: begin
                    t1_ox = 0; t1_oy = 1; t1x_neg_cw = 0; t1y_neg_cw = 0;
                    t2_ox = 1; t2_oy = 1; t2x_neg_cw = 1; t2y_neg_cw = 0;
                    t3_ox = 2; t3_oy = 0; t3x_neg_cw = 0; t3y_neg_cw = 0;
                    t4_ox = 2; t4_oy = 1; t4x_neg_cw = 0; t4y_neg_cw = 0;
                end
                2: begin
                    t1_ox = 0; t1_oy = 1; t1x_neg_cw = 0; t1y_neg_cw = 0;
                    t2_ox = 1; t2_oy = 1; t2x_neg_cw = 0; t2y_neg_cw = 0;
                    t3_ox = 2; t3_oy = 0; t3x_neg_cw = 1; t3y_neg_cw = 0;
                    t4_ox = 2; t4_oy = 1; t4x_neg_cw = 1; t4y_neg_cw = 0;
                end
                3: begin
                    t1_ox = 0; t1_oy = 1; t1x_neg_cw = 0; t1y_neg_cw = 1;
                    t2_ox = 1; t2_oy = 1; t2x_neg_cw = 1; t2y_neg_cw = 1;
                    t3_ox = 2; t3_oy = 0; t3x_neg_cw = 0; t3y_neg_cw = 0;
                    t4_ox = 2; t4_oy = 1; t4x_neg_cw = 0; t4y_neg_cw = 1;
                end
            endcase
        end else begin
            case (rot_check)
                0: begin
                    t1_ox = 0; t1_oy = 2; t1x_neg_cw = 0; t1y_neg_cw = 1;
                    t2_ox = 0; t2_oy = 1; t2x_neg_cw = 0; t2y_neg_cw = 0;
                    t3_ox = 1; t3_oy = 2; t3x_neg_cw = 1; t3y_neg_cw = 1;
                    t4_ox = 2; t4_oy = 1; t4x_neg_cw = 0; t4y_neg_cw = 0;
                end
                1: begin
                    t1_ox = 0; t1_oy = 1; t1x_neg_cw = 0; t1y_neg_cw = 1;
                    t2_ox = 0; t2_oy = 2; t2x_neg_cw = 0; t2y_neg_cw = 0;
                    t3_ox = 2; t3_oy = 1; t3x_neg_cw = 0; t3y_neg_cw = 1;
                    t4_ox = 1; t4_oy = 2; t4x_neg_cw = 1; t4y_neg_cw = 0;
                end
                2: begin
                    t1_ox = 0; t1_oy = 2; t1x_neg_cw = 0; t1y_neg_cw = 0;
                    t2_ox = 0; t2_oy = 1; t2x_neg_cw = 0; t2y_neg_cw = 1;
                    t3_ox = 1; t3_oy = 2; t3x_neg_cw = 0; t3y_neg_cw = 0;
                    t4_ox = 2; t4_oy = 1; t4x_neg_cw = 1; t4y_neg_cw = 1;
                end
                3: begin
                    t1_ox = 0; t1_oy = 1; t1x_neg_cw = 0; t1y_neg_cw = 0;
                    t2_ox = 0; t2_oy = 2; t2x_neg_cw = 0; t2y_neg_cw = 1;
                    t3_ox = 2; t3_oy = 1; t3x_neg_cw = 1; t3y_neg_cw = 0;
                    t4_ox = 1; t4_oy = 2; t4x_neg_cw = 0; t4y_neg_cw = 1;
                end
            endcase
        end

        if (!col4) begin ox = t4_ox; oy = t4_oy; ox_neg = t4x_neg; oy_neg = t4y_neg; fail = 0; end 
        if (!col3) begin ox = t3_ox; oy = t3_oy; ox_neg = t3x_neg; oy_neg = t3y_neg; fail = 0; end 
        if (!col2) begin ox = t2_ox; oy = t2_oy; ox_neg = t2x_neg; oy_neg = t2y_neg; fail = 0; end 
        if (!col1) begin ox = t1_ox; oy = t1_oy; ox_neg = t1x_neg; oy_neg = t1y_neg; fail = 0; end 
        if (!col0) begin ox = 0; oy = 0; ox_neg = 0; oy_neg = 0; fail = 0; end 
    end
endmodule