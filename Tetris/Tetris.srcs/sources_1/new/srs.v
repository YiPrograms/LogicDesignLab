
module super_rotating_system(
    input [1:0] rotation,
    input ccw,
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

    reg [1:0] cx;
    reg [1:0] cy;
    reg cx_neg;
    reg cy_neg;

    wire real_x_neg = ccw? ~cx_neg: cx_neg;
    wire real_y_neg = ccw? ~cx_neg: cx_neg;

    wire [4:0] check_x = real_x_neg? ax - cx: ax + cx;
    wire [3:0] check_y = real_y_neg? ay - cy: ay + cy;

    collision_check cc_check(
        .bx(check_x),
        .by(check_y),
        .block(rotated_block),
        .board(board),
        .collision(col_check)
    );

    wire bad = (real_x_neg && ax < cx) ||
               (real_y_neg && ay < cy) ||
               col_check;

    always @* begin
        ox = 0;
        oy = 0;
        ox_neg = 0;
        oy_neg = 0;
        fail = 0;

        cx_neg = 0;
        cy_neg = 0;

        if (i_block) begin // Test 1 (No rotate)
            cx = 0; cy = 0;
            if (bad) begin
                case (rotation - ccw)
                    0: begin
                        cx = 0; cx_neg = 0; // Test 2
                        cy = 2; cy_neg = 1;
                        if (!bad) begin
                            ox = cx; ox_neg = cx_neg;
                            oy = cy; oy_neg = cy_neg;
                        end else begin
                            cx = 0; cx_neg = 0;  // Test 3
                            cy = 1; cy_neg = 0;
                            if (!bad) begin
                                ox = cx; ox_neg = cx_neg;
                                oy = cy; oy_neg = cy_neg;
                            end else begin
                                cx = 1; cx_neg = 1;  // Test 4
                                cy = 2; cy_neg = 1;
                                if (!bad) begin
                                    ox = cx; ox_neg = cx_neg;
                                    oy = cy; oy_neg = cy_neg;
                                end else begin
                                    cx = 2; cx_neg = 0;  // Test 5
                                    cy = 1; cy_neg = 0;
                                    if (!bad) begin
                                        ox = cx; ox_neg = cx_neg;
                                        oy = cy; oy_neg = cy_neg;
                                    end else begin
                                        fail = 1;
                                    end
                                end
                            end
                        end
                    end
                    1: begin
                        cx = 0; cx_neg = 0; // Test 2
                        cy = 1; cy_neg = 1;
                        if (!bad) begin
                            ox = cx; ox_neg = cx_neg;
                            oy = cy; oy_neg = cy_neg;
                        end else begin
                            cx = 0; cx_neg = 0;  // Test 3
                            cy = 2; cy_neg = 0;
                            if (!bad) begin
                                ox = cx; ox_neg = cx_neg;
                                oy = cy; oy_neg = cy_neg;
                            end else begin
                                cx = 2; cx_neg = 0;  // Test 4
                                cy = 1; cy_neg = 1;
                                if (!bad) begin
                                    ox = cx; ox_neg = cx_neg;
                                    oy = cy; oy_neg = cy_neg;
                                end else begin
                                    cx = 1; cx_neg = 1;  // Test 5
                                    cy = 2; cy_neg = 0;
                                    if (!bad) begin
                                        ox = cx; ox_neg = cx_neg;
                                        oy = cy; oy_neg = cy_neg;
                                    end else begin
                                        fail = 1;
                                    end
                                end
                            end
                        end
                    end
                    2: begin
                        cx = 0; cx_neg = 0; // Test 2
                        cy = 2; cy_neg = 0;
                        if (!bad) begin
                            ox = cx; ox_neg = cx_neg;
                            oy = cy; oy_neg = cy_neg;
                        end else begin
                            cx = 0; cx_neg = 0;  // Test 3
                            cy = 1; cy_neg = 1;
                            if (!bad) begin
                                ox = cx; ox_neg = cx_neg;
                                oy = cy; oy_neg = cy_neg;
                            end else begin
                                cx = 1; cx_neg = 0;  // Test 4
                                cy = 2; cy_neg = 0;
                                if (!bad) begin
                                    ox = cx; ox_neg = cx_neg;
                                    oy = cy; oy_neg = cy_neg;
                                end else begin
                                    cx = 2; cx_neg = 1;  // Test 5
                                    cy = 1; cy_neg = 1;
                                    if (!bad) begin
                                        ox = cx; ox_neg = cx_neg;
                                        oy = cy; oy_neg = cy_neg;
                                    end else begin
                                        fail = 1;
                                    end
                                end
                            end
                        end
                    end
                    3: begin
                        cx = 0; cx_neg = 0; // Test 2
                        cy = 1; cy_neg = 0;
                        if (!bad) begin
                            ox = cx; ox_neg = cx_neg;
                            oy = cy; oy_neg = cy_neg;
                        end else begin
                            cx = 0; cx_neg = 0;  // Test 3
                            cy = 2; cy_neg = 1;
                            if (!bad) begin
                                ox = cx; ox_neg = cx_neg;
                                oy = cy; oy_neg = cy_neg;
                            end else begin
                                cx = 2; cx_neg = 1;  // Test 4
                                cy = 1; cy_neg = 0;
                                if (!bad) begin
                                    ox = cx; ox_neg = cx_neg;
                                    oy = cy; oy_neg = cy_neg;
                                end else begin
                                    cx = 1; cx_neg = 0;  // Test 5
                                    cy = 2; cy_neg = 1;
                                    if (!bad) begin
                                        ox = cx; ox_neg = cx_neg;
                                        oy = cy; oy_neg = cy_neg;
                                    end else begin
                                        fail = 1;
                                    end
                                end
                            end
                        end
                    end
                endcase
            end
        end
        else begin // Test 1 (No rotate)
            cx = 0; cy = 0;
            if (bad) begin
                case (rotation - ccw)
                    0: begin
                        cx = 0; cx_neg = 0; // Test 2
                        cy = 1; cy_neg = 1;
                        if (!bad) begin
                            ox = cx; ox_neg = cx_neg;
                            oy = cy; oy_neg = cy_neg;
                        end else begin
                            cx = 1; cx_neg = 0;  // Test 3
                            cy = 1; cy_neg = 1;
                            if (!bad) begin
                                ox = cx; ox_neg = cx_neg;
                                oy = cy; oy_neg = cy_neg;
                            end else begin
                                cx = 2; cx_neg = 1;  // Test 4
                                cy = 0; cy_neg = 0;
                                if (!bad) begin
                                    ox = cx; ox_neg = cx_neg;
                                    oy = cy; oy_neg = cy_neg;
                                end else begin
                                    cx = 2; cx_neg = 1;  // Test 5
                                    cy = 1; cy_neg = 1;
                                    if (!bad) begin
                                        ox = cx; ox_neg = cx_neg;
                                        oy = cy; oy_neg = cy_neg;
                                    end else begin
                                        fail = 1;
                                    end
                                end
                            end
                        end
                    end
                    1: begin
                        cx = 0; cx_neg = 0; // Test 2
                        cy = 1; cy_neg = 0;
                        if (!bad) begin
                            ox = cx; ox_neg = cx_neg;
                            oy = cy; oy_neg = cy_neg;
                        end else begin
                            cx = 1; cx_neg = 1;  // Test 3
                            cy = 1; cy_neg = 0;
                            if (!bad) begin
                                ox = cx; ox_neg = cx_neg;
                                oy = cy; oy_neg = cy_neg;
                            end else begin
                                cx = 2; cx_neg = 0;  // Test 4
                                cy = 0; cy_neg = 0;
                                if (!bad) begin
                                    ox = cx; ox_neg = cx_neg;
                                    oy = cy; oy_neg = cy_neg;
                                end else begin
                                    cx = 2; cx_neg = 0;  // Test 5
                                    cy = 1; cy_neg = 0;
                                    if (!bad) begin
                                        ox = cx; ox_neg = cx_neg;
                                        oy = cy; oy_neg = cy_neg;
                                    end else begin
                                        fail = 1;
                                    end
                                end
                            end
                        end
                    end
                    2: begin
                        cx = 0; cx_neg = 0; // Test 2
                        cy = 1; cy_neg = 0;
                        if (!bad) begin
                            ox = cx; ox_neg = cx_neg;
                            oy = cy; oy_neg = cy_neg;
                        end else begin
                            cx = 1; cx_neg = 0;  // Test 3
                            cy = 1; cy_neg = 0;
                            if (!bad) begin
                                ox = cx; ox_neg = cx_neg;
                                oy = cy; oy_neg = cy_neg;
                            end else begin
                                cx = 2; cx_neg = 1;  // Test 4
                                cy = 0; cy_neg = 0;
                                if (!bad) begin
                                    ox = cx; ox_neg = cx_neg;
                                    oy = cy; oy_neg = cy_neg;
                                end else begin
                                    cx = 2; cx_neg = 1;  // Test 5
                                    cy = 1; cy_neg = 0;
                                    if (!bad) begin
                                        ox = cx; ox_neg = cx_neg;
                                        oy = cy; oy_neg = cy_neg;
                                    end else begin
                                        fail = 1;
                                    end
                                end
                            end
                        end
                    end
                    3: begin
                        cx = 0; cx_neg = 0; // Test 2
                        cy = 1; cy_neg = 1;
                        if (!bad) begin
                            ox = cx; ox_neg = cx_neg;
                            oy = cy; oy_neg = cy_neg;
                        end else begin
                            cx = 1; cx_neg = 1;  // Test 3
                            cy = 1; cy_neg = 1;
                            if (!bad) begin
                                ox = cx; ox_neg = cx_neg;
                                oy = cy; oy_neg = cy_neg;
                            end else begin
                                cx = 2; cx_neg = 0;  // Test 4
                                cy = 0; cy_neg = 0;
                                if (!bad) begin
                                    ox = cx; ox_neg = cx_neg;
                                    oy = cy; oy_neg = cy_neg;
                                end else begin
                                    cx = 2; cx_neg = 0;  // Test 5
                                    cy = 1; cy_neg = 1;
                                    if (!bad) begin
                                        ox = cx; ox_neg = cx_neg;
                                        oy = cy; oy_neg = cy_neg;
                                    end else begin
                                        fail = 1;
                                    end
                                end
                            end
                        end
                    end
                endcase
            end
        end
    end
    
endmodule