`timescale 1ns / 100ps

module lab2_2 (
    input clk,
    input rst,
    input carA,
    input carB,
    output reg [2:0] lightA,
    output reg [2:0] lightB);

    parameter A1 = 3'b000;
    parameter A2 = 3'b001;
    parameter AO = 3'b010;
    parameter B1 = 3'b011;
    parameter B2 = 3'b100;
    parameter BO = 3'b101;

    reg [2:0] state;
    reg [2:0] next_state;

    always @(posedge clk, posedge rst) begin
        if (rst == 1) begin
            state <= A1;
        end else begin
            state <= next_state;
        end
    end

    always @* begin
        next_state = A1;
        case (state)
            A1:
                next_state = A2;
            A2: begin
                if (!carA && carB)
                    next_state = AO;
                else
                    next_state = A2;
            end
            AO:
                next_state = B1;

            B1:
                next_state = B2;
            B2: begin
                if (carA && !carB)
                    next_state = BO;
                else
                    next_state = B2;
            end
            BO:
                next_state = A1;
        endcase
    end

    always @* begin
        lightA = 3'b000;
        lightB = 3'b000;
        case (state)
            A1, A2: begin
                lightA = 3'b001;
                lightB = 3'b100;
            end
            AO: begin
                lightA = 3'b010;
                lightB = 3'b100;
            end

            B1, B2: begin
                lightA = 3'b100;
                lightB = 3'b001;
            end
            BO: begin
                lightA = 3'b100;
                lightB = 3'b010;
            end
        endcase
    end

endmodule