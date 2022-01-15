
module super_rotating_system(
    input [1:0] rotation,
    input i_block,
    input [15:0] rotated_block,
    input [799:0] board,
    input [4:0] ax,
    input [3:0] ay,
    output reg [1:0] ox,
    output reg [1:0] oy,
    output reg ox_neg,
    output reg oy_neg,
    output reg fail
);

    wire [4:0] collisions [4:0];

    collision_check cc_00(.bx(ax + (-2)),.by(ay + (-2)),.block(rotated_block),.board(board),.collision(collisions[0][0]));
    collision_check cc_01(.bx(ax + (-2)),.by(ay + (-1)),.block(rotated_block),.board(board),.collision(collisions[0][1]));
    collision_check cc_02(.bx(ax + (-2)),.by(ay + (0)),.block(rotated_block),.board(board),.collision(collisions[0][2]));
    collision_check cc_03(.bx(ax + (-2)),.by(ay + (1)),.block(rotated_block),.board(board),.collision(collisions[0][3]));
    collision_check cc_04(.bx(ax + (-2)),.by(ay + (2)),.block(rotated_block),.board(board),.collision(collisions[0][4]));
    collision_check cc_10(.bx(ax + (-1)),.by(ay + (-2)),.block(rotated_block),.board(board),.collision(collisions[1][0]));
    collision_check cc_11(.bx(ax + (-1)),.by(ay + (-1)),.block(rotated_block),.board(board),.collision(collisions[1][1]));
    collision_check cc_12(.bx(ax + (-1)),.by(ay + (0)),.block(rotated_block),.board(board),.collision(collisions[1][2]));
    collision_check cc_13(.bx(ax + (-1)),.by(ay + (1)),.block(rotated_block),.board(board),.collision(collisions[1][3]));
    collision_check cc_14(.bx(ax + (-1)),.by(ay + (2)),.block(rotated_block),.board(board),.collision(collisions[1][4]));
    collision_check cc_20(.bx(ax + (0)),.by(ay + (-2)),.block(rotated_block),.board(board),.collision(collisions[2][0]));
    collision_check cc_21(.bx(ax + (0)),.by(ay + (-1)),.block(rotated_block),.board(board),.collision(collisions[2][1]));
    collision_check cc_22(.bx(ax + (0)),.by(ay + (0)),.block(rotated_block),.board(board),.collision(collisions[2][2]));
    collision_check cc_23(.bx(ax + (0)),.by(ay + (1)),.block(rotated_block),.board(board),.collision(collisions[2][3]));
    collision_check cc_24(.bx(ax + (0)),.by(ay + (2)),.block(rotated_block),.board(board),.collision(collisions[2][4]));
    collision_check cc_30(.bx(ax + (1)),.by(ay + (-2)),.block(rotated_block),.board(board),.collision(collisions[3][0]));
    collision_check cc_31(.bx(ax + (1)),.by(ay + (-1)),.block(rotated_block),.board(board),.collision(collisions[3][1]));
    collision_check cc_32(.bx(ax + (1)),.by(ay + (0)),.block(rotated_block),.board(board),.collision(collisions[3][2]));
    collision_check cc_33(.bx(ax + (1)),.by(ay + (1)),.block(rotated_block),.board(board),.collision(collisions[3][3]));
    collision_check cc_34(.bx(ax + (1)),.by(ay + (2)),.block(rotated_block),.board(board),.collision(collisions[3][4]));
    collision_check cc_40(.bx(ax + (2)),.by(ay + (-2)),.block(rotated_block),.board(board),.collision(collisions[4][0]));
    collision_check cc_41(.bx(ax + (2)),.by(ay + (-1)),.block(rotated_block),.board(board),.collision(collisions[4][1]));
    collision_check cc_42(.bx(ax + (2)),.by(ay + (0)),.block(rotated_block),.board(board),.collision(collisions[4][2]));
    collision_check cc_43(.bx(ax + (2)),.by(ay + (1)),.block(rotated_block),.board(board),.collision(collisions[4][3]));
    collision_check cc_44(.bx(ax + (2)),.by(ay + (2)),.block(rotated_block),.board(board),.collision(collisions[4][4]));

    always @* begin
        ox = 0;
        oy = 0;
        ox_neg = 0;
        oy_neg = 0;
        fail = 1;

        if (!collisions[2][2]) begin
            ox = 0;
            oy = 0;
            ox_neg = 0;
            oy_neg = 0;
            fail = 0;
        end else begin
            if (!i_block) begin
                case (rotation)
                    0: begin
                        if (!collisions[0][1]) begin ox = 2; oy = 1; ox_neg = 1; oy_neg = 1; fail = 0; end
                        if (!collisions[0][2]) begin ox = 2; oy = 0; ox_neg = 1; oy_neg = 0; fail = 0; end
                        if (!collisions[3][1]) begin ox = 1; oy = 1; ox_neg = 0; oy_neg = 1; fail = 0; end
                        if (!collisions[2][1]) begin ox = 0; oy = 1; ox_neg = 0; oy_neg = 1; fail = 0; end
                    end
                    1: begin
                        if (!collisions[4][3]) begin ox = 2; oy = 1; ox_neg = 0; oy_neg = 0; fail = 0; end
                        if (!collisions[4][2]) begin ox = 2; oy = 0; ox_neg = 0; oy_neg = 0; fail = 0; end
                        if (!collisions[1][3]) begin ox = 1; oy = 1; ox_neg = 1; oy_neg = 0; fail = 0; end
                        if (!collisions[2][3]) begin ox = 0; oy = 1; ox_neg = 0; oy_neg = 0; fail = 0; end
                    end
                    2: begin
                        if (!collisions[0][3]) begin ox = 2; oy = 1; ox_neg = 1; oy_neg = 0; fail = 0; end
                        if (!collisions[0][2]) begin ox = 2; oy = 0; ox_neg = 1; oy_neg = 0; fail = 0; end
                        if (!collisions[3][3]) begin ox = 1; oy = 1; ox_neg = 0; oy_neg = 0; fail = 0; end
                        if (!collisions[2][3]) begin ox = 0; oy = 1; ox_neg = 0; oy_neg = 0; fail = 0; end
                    end
                    3: begin
                        if (!collisions[4][1]) begin ox = 2; oy = 1; ox_neg = 0; oy_neg = 1; fail = 0; end
                        if (!collisions[4][2]) begin ox = 2; oy = 0; ox_neg = 0; oy_neg = 0; fail = 0; end
                        if (!collisions[1][1]) begin ox = 1; oy = 1; ox_neg = 1; oy_neg = 1; fail = 0; end
                        if (!collisions[2][1]) begin ox = 0; oy = 1; ox_neg = 0; oy_neg = 1; fail = 0; end
                    end
                endcase
            end else begin
                case (rotation)
                    0: begin
                        if (!collisions[4][3]) begin ox = 2; oy = 1; ox_neg = 0; oy_neg = 0; fail = 0; end
                        if (!collisions[1][0]) begin ox = 1; oy = 2; ox_neg = 1; oy_neg = 1; fail = 0; end
                        if (!collisions[2][3]) begin ox = 0; oy = 1; ox_neg = 0; oy_neg = 0; fail = 0; end
                        if (!collisions[2][0]) begin ox = 0; oy = 2; ox_neg = 0; oy_neg = 1; fail = 0; end
                    end
                    1: begin
                        if (!collisions[1][4]) begin ox = 1; oy = 2; ox_neg = 1; oy_neg = 0; fail = 0; end
                        if (!collisions[4][1]) begin ox = 2; oy = 1; ox_neg = 0; oy_neg = 1; fail = 0; end
                        if (!collisions[2][4]) begin ox = 0; oy = 2; ox_neg = 0; oy_neg = 0; fail = 0; end
                        if (!collisions[2][1]) begin ox = 0; oy = 1; ox_neg = 0; oy_neg = 1; fail = 0; end
                    end
                    2: begin
                        if (!collisions[0][1]) begin ox = 2; oy = 1; ox_neg = 1; oy_neg = 1; fail = 0; end
                        if (!collisions[3][4]) begin ox = 1; oy = 2; ox_neg = 0; oy_neg = 0; fail = 0; end
                        if (!collisions[2][1]) begin ox = 0; oy = 1; ox_neg = 0; oy_neg = 1; fail = 0; end
                        if (!collisions[2][4]) begin ox = 0; oy = 2; ox_neg = 0; oy_neg = 0; fail = 0; end
                    end
                    3: begin
                        if (!collisions[3][0]) begin ox = 1; oy = 2; ox_neg = 0; oy_neg = 1; fail = 0; end
                        if (!collisions[0][3]) begin ox = 2; oy = 1; ox_neg = 1; oy_neg = 0; fail = 0; end
                        if (!collisions[2][0]) begin ox = 0; oy = 2; ox_neg = 0; oy_neg = 1; fail = 0; end
                        if (!collisions[2][3]) begin ox = 0; oy = 1; ox_neg = 0; oy_neg = 0; fail = 0; end
                    end
                endcase
            end
        end
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