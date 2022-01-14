
module seven_seg_controller (
    input clk_display,
    input [15:0] bcds,
    output reg [3:0] DIGIT,
    output reg [6:0] DISPLAY
);
    
    reg [3:0] value;

    always @(posedge clk_display) begin
        case (DIGIT)
            4'b1110: begin
                value = bcds[4+:4];
                DIGIT = 4'b1101;
            end
            4'b1101: begin
                value = bcds[8+:4];
                DIGIT = 4'b1011;
            end
            4'b1011: begin
                value = bcds[12+:4];
                DIGIT = 4'b0111;
            end
            4'b0111: begin
                value = bcds[0+:4];
                DIGIT = 4'b1110;
            end
            default: begin
                value = bcds[0+:4];
                DIGIT = 4'b1110;
            end
        endcase
    end

    always @* begin
        case (value)
            4'd0: DISPLAY = 7'b100_0000;
            4'd1: DISPLAY = 7'b111_1001;
            4'd2: DISPLAY = 7'b010_0100;
            4'd3: DISPLAY = 7'b011_0000;
            4'd4: DISPLAY = 7'b001_1001;
            4'd5: DISPLAY = 7'b001_0010;
            4'd6: DISPLAY = 7'b000_0010;
            4'd7: DISPLAY = 7'b111_1000;
            4'd8: DISPLAY = 7'b000_0000;
            4'd9: DISPLAY = 7'b001_0000;
            4'd10: DISPLAY = 7'b0100000; // a
            4'd11: DISPLAY = 7'b0000011; // b
            4'd12: DISPLAY = 7'b0100111; // c
            4'd13: DISPLAY = 7'b0100001; // d
            4'd14: DISPLAY = 7'b0000110; // E
            4'd15: DISPLAY = 7'b0001110; // F
            default: DISPLAY = 7'b111_1111;
        endcase
    end

endmodule