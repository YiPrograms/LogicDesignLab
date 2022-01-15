
module super_rotating_system(
    input [1:0] rotation,
    input i_block,
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
        .collision(col0)
    );

    reg [4:0] t1_x;
    reg [3:0] t1_y;
    collision_check cc_1(
        .bx(t1_x),
        .by(t1_y),
        .block(rotated_block),
        .board(board),
        .collision(col1)
    );
    reg [4:0] t2_x;
    reg [3:0] t2_y;
    collision_check cc_2(
        .bx(t2_x),
        .by(t2_y),
        .block(rotated_block),
        .board(board),
        .collision(col2)
    );

    always @* begin
        ox = 0;
        oy = 0;
        ox_neg = 0;
        oy_neg = 0;
        fail = 1;

        if (!i_block) begin
            case (rotation)
                0: begin
                    t1_x = ax + 0; t1_y = ay + -1; 
                    t2_x = ax + 1; t2_y = ay + -1; 
                    if (!col2) begin ox = 1; oy = 1; ox_neg = 0; oy_neg = 1; fail = 0; end
                    if (!col1) begin ox = 0; oy = 1; ox_neg = 0; oy_neg = 1; fail = 0; end
                end
                1: begin
                    t1_x = ax + 0; t1_y = ay + 1; 
                    t2_x = ax + -1; t2_y = ay + 1; 
                    if (!col2) begin ox = 1; oy = 1; ox_neg = 1; oy_neg = 0; fail = 0; end
                    if (!col1) begin ox = 0; oy = 1; ox_neg = 0; oy_neg = 0; fail = 0; end
                end
                2: begin
                    t1_x = ax + 0; t1_y = ay + 1; 
                    t2_x = ax + 1; t2_y = ay + 1; 
                    if (!col2) begin ox = 1; oy = 1; ox_neg = 0; oy_neg = 0; fail = 0; end
                    if (!col1) begin ox = 0; oy = 1; ox_neg = 0; oy_neg = 0; fail = 0; end
                end
                3: begin
                    t1_x = ax + 0; t1_y = ay + -1; 
                    t2_x = ax + -1; t2_y = ay + -1; 
                    if (!col2) begin ox = 1; oy = 1; ox_neg = 1; oy_neg = 1; fail = 0; end
                    if (!col1) begin ox = 0; oy = 1; ox_neg = 0; oy_neg = 1; fail = 0; end
                end
            endcase
        end else begin
            case (rotation)
                0: begin
                    t1_x = ax + 0; t1_y = ay + -2; 
                    t2_x = ax + 0; t2_y = ay + 1; 
                    if (!col2) begin ox = 0; oy = 1; ox_neg = 0; oy_neg = 0; fail = 0; end
                    if (!col1) begin ox = 0; oy = 2; ox_neg = 0; oy_neg = 1; fail = 0; end
                end
                1: begin
                    t1_x = ax + 0; t1_y = ay + -1; 
                    t2_x = ax + 0; t2_y = ay + 2; 
                    if (!col2) begin ox = 0; oy = 2; ox_neg = 0; oy_neg = 0; fail = 0; end
                    if (!col1) begin ox = 0; oy = 1; ox_neg = 0; oy_neg = 1; fail = 0; end
                end
                2: begin
                    t1_x = ax + 0; t1_y = ay + 2; 
                    t2_x = ax + 0; t2_y = ay + -1; 
                    if (!col2) begin ox = 0; oy = 1; ox_neg = 0; oy_neg = 1; fail = 0; end
                    if (!col1) begin ox = 0; oy = 2; ox_neg = 0; oy_neg = 0; fail = 0; end
                end
                3: begin
                    t1_x = ax + 0; t1_y = ay + 1; 
                    t2_x = ax + 0; t2_y = ay + -2; 
                    if (!col2) begin ox = 0; oy = 2; ox_neg = 0; oy_neg = 1; fail = 0; end
                    if (!col1) begin ox = 0; oy = 1; ox_neg = 0; oy_neg = 0; fail = 0; end 
                end
            endcase
        end

        if (!col0) begin ox = 0; oy = 0; ox_neg = 0; oy_neg = 0; fail = 0; end 

    end

    //     if (i_block) begin // Test 1 (No rotate)
    //         cx = 0; cy = 0;
    //         if (bad) begin
    //             case (rotation - ccw)
    //                 0: begin
    //                     cx = 0; cx_neg = 0; // Test 2
    //                     cy = 2; cy_neg = 1;
    //                     if (!bad) begin
    //                         ox = 0; ox_neg = 0; // Test 2
    //                         oy = 2; oy_neg = 1;
    //                     end else begin
    //                         cx = 0; cx_neg = 0;  // Test 3
    //                         cy = 1; cy_neg = 0;
    //                         if (!bad) begin
    //                             ox = 0; ox_neg = 0;
	// 							oy = 1; oy_neg = 0;
	// 						end else begin
    //                             cx = 1; cx_neg = 1;  // Test 4
    //                             cy = 2; cy_neg = 1;
    //                             if (!bad) begin
    //                                 ox = 1; ox_neg = 1;
	// 							oy = 2; oy_neg = 1;
	// 						end else begin
    //                                 cx = 2; cx_neg = 0;  // Test 5
    //                                 cy = 1; cy_neg = 0;
    //                                 if (!bad) begin
    //                                     ox = 2; ox_neg = 0;
	// 							oy = 1; oy_neg = 0;
	// 						end else begin
    //                                     fail = 1;
    //                                 end
    //                             end
    //                         end
    //                     end
    //                 end
    //                 1: begin
    //                     cx = 0; cx_neg = 0; // Test 2
    //                     cy = 1; cy_neg = 1;
    //                     if (!bad) begin
    //                         ox = 0; ox_neg = 0;
    //                         oy = 1; oy_neg = 1;
    //                     end else begin
    //                         cx = 0; cx_neg = 0;  // Test 3
    //                         cy = 2; cy_neg = 0;
    //                         if (!bad) begin
    //                             ox = 0; ox_neg = 0;
	// 							oy = 2; oy_neg = 0;
	// 						end else begin
    //                             cx = 2; cx_neg = 0;  // Test 4
    //                             cy = 1; cy_neg = 1;
    //                             if (!bad) begin
    //                                 ox = 2; ox_neg = 0;
    //                                 oy = 1; oy_neg = 1;
    //                             end else begin
    //                                 cx = 1; cx_neg = 1;  // Test 5
    //                                 cy = 2; cy_neg = 0;
    //                                 if (!bad) begin
    //                                     ox = 1; ox_neg = 1;
    //                                     oy = 2; oy_neg = 0;
    //                                 end else begin
    //                                     fail = 1;
    //                                 end
    //                             end
    //                         end
    //                     end
    //                 end
    //                 2: begin
    //                     cx = 0; cx_neg = 0; // Test 2
    //                     cy = 2; cy_neg = 0;
    //                     if (!bad) begin
    //                         ox = 0; ox_neg = 0;
    //                         oy = 2; oy_neg = 0;
    //                     end else begin
    //                         cx = 0; cx_neg = 0;  // Test 3
    //                         cy = 1; cy_neg = 1;
    //                         if (!bad) begin
    //                             ox = 0; ox_neg = 0;
	// 							oy = 1; oy_neg = 1;
	// 						end else begin
    //                             cx = 1; cx_neg = 0;  // Test 4
    //                             cy = 2; cy_neg = 0;
    //                             if (!bad) begin
    //                                 ox = 1; ox_neg = 0;
    //                                 oy = 2; oy_neg = 0;
    //                             end else begin
    //                                 cx = 2; cx_neg = 1;  // Test 5
    //                                 cy = 1; cy_neg = 1;
    //                                 if (!bad) begin
    //                                     ox = 2; ox_neg = 1;
    //                                     oy = 1; oy_neg = 1;
    //                                 end else begin
    //                                     fail = 1;
    //                                 end
    //                             end
    //                         end
    //                     end
    //                 end
    //                 3: begin
    //                     cx = 0; cx_neg = 0; // Test 2
    //                     cy = 1; cy_neg = 0;
    //                     if (!bad) begin
    //                         ox = 0; ox_neg = 0;
    //                         oy = 1; oy_neg = 0;
    //                     end else begin
    //                         cx = 0; cx_neg = 0;  // Test 3
    //                         cy = 2; cy_neg = 1;
    //                         if (!bad) begin
    //                             ox = 0; ox_neg = 0;
	// 							oy = 2; oy_neg = 1;
	// 						end else begin
    //                             cx = 2; cx_neg = 1;  // Test 4
    //                             cy = 1; cy_neg = 0;
    //                             if (!bad) begin
    //                                 ox = 2; ox_neg = 1;
    //                                 oy = 1; oy_neg = 0;
    //                             end else begin
    //                                 cx = 1; cx_neg = 0;  // Test 5
    //                                 cy = 2; cy_neg = 1;
    //                                 if (!bad) begin
    //                                     ox = 1; ox_neg = 0;
    //                                     oy = 2; oy_neg = 1;
    //                                 end else begin
    //                                     fail = 1;
    //                                 end
    //                             end
    //                         end
    //                     end
    //                 end
    //             endcase
    //         end
    //     end else begin // Test 1 (No rotate)
    //         cx = 0; cy = 0;
    //         if (bad) begin
    //             case (rotation - ccw)
    //                 0: begin
    //                     cx = 0; cx_neg = 0; // Test 2
    //                     cy = 1; cy_neg = 1;
    //                     if (!bad) begin
    //                         ox = 0; ox_neg = 0;
    //                         oy = 1; oy_neg = 1;
    //                     end else begin
    //                         cx = 1; cx_neg = 0;  // Test 3
    //                         cy = 1; cy_neg = 1;
    //                         if (!bad) begin
    //                             ox = 1; ox_neg = 0;
	// 							oy = 1; oy_neg = 1;
	// 						end else begin
    //                             cx = 2; cx_neg = 1;  // Test 4
    //                             cy = 0; cy_neg = 0;
    //                             if (!bad) begin
    //                                 ox = 2; ox_neg = 1;
    //                                 oy = 0; oy_neg = 0;
    //                             end else begin
    //                                 cx = 2; cx_neg = 1;  // Test 5
    //                                 cy = 1; cy_neg = 1;
    //                                 if (!bad) begin
    //                                     ox = 2; ox_neg = 1;
    //                                     oy = 1; oy_neg = 1;
    //                                 end else begin
    //                                     fail = 1;
    //                                 end
    //                             end
    //                         end
    //                     end
    //                 end
    //                 1: begin
    //                     cx = 0; cx_neg = 0; // Test 2
    //                     cy = 1; cy_neg = 0;
    //                     if (!bad) begin
    //                         ox = 0; ox_neg = 0;
    //                         oy = 1; oy_neg = 0;
    //                     end else begin
    //                         cx = 1; cx_neg = 1;  // Test 3
    //                         cy = 1; cy_neg = 0;
    //                         if (!bad) begin
    //                             ox = 1; ox_neg = 1;
	// 							oy = 1; oy_neg = 0;
	// 						end else begin
    //                             cx = 2; cx_neg = 0;  // Test 4
    //                             cy = 0; cy_neg = 0;
    //                             if (!bad) begin
    //                                 ox = 2; ox_neg = 0;
    //                                 oy = 0; oy_neg = 0;
    //                             end else begin
    //                                 cx = 2; cx_neg = 0;  // Test 5
    //                                 cy = 1; cy_neg = 0;
    //                                 if (!bad) begin
    //                                     ox = 2; ox_neg = 0;
    //                                     oy = 1; oy_neg = 0;
    //                                 end else begin
    //                                     fail = 1;
    //                                 end
    //                             end
    //                         end
    //                     end
    //                 end
    //                 2: begin
    //                     cx = 0; cx_neg = 0; // Test 2
    //                     cy = 1; cy_neg = 0;
    //                     if (!bad) begin
    //                         ox = 0; ox_neg = 0;
    //                         oy = 1; oy_neg = 0;
    //                     end else begin
    //                         cx = 1; cx_neg = 0;  // Test 3
    //                         cy = 1; cy_neg = 0;
    //                         if (!bad) begin
    //                             ox = 1; ox_neg = 0;
	// 							oy = 1; oy_neg = 0;
	// 						end else begin
    //                             cx = 2; cx_neg = 1;  // Test 4
    //                             cy = 0; cy_neg = 0;
    //                             if (!bad) begin
    //                                 ox = 2; ox_neg = 1;
    //                                 oy = 0; oy_neg = 0;
    //                             end else begin
    //                                 cx = 2; cx_neg = 1;  // Test 5
    //                                 cy = 1; cy_neg = 0;
    //                                 if (!bad) begin
    //                                     ox = 2; ox_neg = 1;
    //                                     oy = 1; oy_neg = 0;
    //                                 end else begin
    //                                     fail = 1;
    //                                 end
    //                             end
    //                         end
    //                     end
    //                 end
    //                 3: begin
    //                     cx = 0; cx_neg = 0; // Test 2
    //                     cy = 1; cy_neg = 1;
    //                     if (!bad) begin
    //                         ox = 0; ox_neg = 0;
    //                         oy = 1; oy_neg = 1;
    //                     end else begin
    //                         cx = 1; cx_neg = 1;  // Test 3
    //                         cy = 1; cy_neg = 1;
    //                         if (!bad) begin
    //                             ox = 1; ox_neg = 1;
	// 							oy = 1; oy_neg = 1;
	// 						end else begin
    //                             cx = 2; cx_neg = 0;  // Test 4
    //                             cy = 0; cy_neg = 0;
    //                             if (!bad) begin
    //                                 ox = 2; ox_neg = 0;
    //                                 oy = 0; oy_neg = 0;
    //                             end else begin
    //                                 cx = 2; cx_neg = 0;  // Test 5
    //                                 cy = 1; cy_neg = 1;
    //                                 if (!bad) begin
    //                                     ox = 2; ox_neg = 0;
    //                                     oy = 1; oy_neg = 1;
    //                                 end else begin
    //                                     fail = 1;
    //                                 end
    //                             end
    //                         end
    //                     end
    //                 end
    //             endcase
    //         end
    //     end
    // end
    
endmodule