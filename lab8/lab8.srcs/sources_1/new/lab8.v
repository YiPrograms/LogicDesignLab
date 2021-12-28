`define Bf3 32'd233
`define D4 32'd294
`define A2 32'd110
`define B2 32'd123
`define D3 32'd147
`define Af4 32'd415
`define Af2 32'd104
`define G2 32'd98
`define G3 32'd196
`define Bf2 32'd117
`define A4 32'd440
`define C3 32'd131
`define F4 32'd349
`define G4 32'd392
`define G5 32'd784
`define Bf4 32'd466
`define C4 32'd262
`define C5 32'd523
`define E4 32'd330
`define F2 32'd87
`define Ef5 32'd622
`define Af3 32'd208
`define Ef3 32'd156
`define B4 32'd494
`define Ef4 32'd311
`define D5 32'd587
`define F3 32'd175
`define C2 32'd65
`define F5 32'd698

`define S   32'd50000000 // slience
`define sil   32'd50000000 // slience

module clock_divider(clk, clk_div);   
    parameter n = 26;     
    input clk;   
    output clk_div;   
    
    reg [n-1:0] num;
    wire [n-1:0] next_num;
    
    always@(posedge clk)begin
    	num<=next_num;
    end
    
    assign next_num = num +1;
    assign clk_div = num[n-1];
    
endmodule


module player_control (
	input clk, 
	input reset, 
	input _play, 
	input _slow, 
	input _mode,
    input _music,
	output reg [11:0] ibeat
);
	parameter LEN = 512;
    reg [11:0] next_ibeat;
    reg slow_flag, next_slow_flag;
    reg cur_music, next_cur_music;

	always @(posedge clk, posedge reset) begin
		if (reset) begin
			ibeat <= 0;
            slow_flag <= 0;
            cur_music <= 0;
		end else if (_play && _mode == 1) begin
            ibeat <= next_ibeat;
            slow_flag <= next_slow_flag;
            cur_music <= next_cur_music;
		end
	end

    always @* begin
        if (_music != cur_music) begin
            next_ibeat = 0;
            next_slow_flag = 0;
            next_cur_music <= _music;
        end else begin
            next_cur_music <= cur_music;
            if (_slow && !slow_flag) begin
                next_ibeat = ibeat;
                next_slow_flag = 1;
            end else begin
                next_ibeat = (ibeat + 1 != LEN) ? (ibeat + 1) : 0;
                next_slow_flag = 0;
            end
        end
    end

endmodule

module note_gen(
    clk, // clock from crystal
    rst, // active high reset
    volume, 
    note_div_left, // div for note generation
    note_div_right,
    audio_left,
    audio_right
);

    // I/O declaration
    input clk; // clock from crystal
    input rst; // active low reset
    input [2:0] volume;
    input [21:0] note_div_left, note_div_right; // div for note generation
    output [15:0] audio_left, audio_right;

    // Declare internal signals
    reg [21:0] clk_cnt_next, clk_cnt;
    reg [21:0] clk_cnt_next_2, clk_cnt_2;
    reg b_clk, b_clk_next;
    reg c_clk, c_clk_next;

    reg [15:0] high;
    reg [15:0] low;

    reg [15:0] next_high;
    reg [15:0] next_low;

    // Note frequency generation
    // clk_cnt, clk_cnt_2, b_clk, c_clk
    always @(posedge clk or posedge rst)
        if (rst == 1'b1)
            begin
                clk_cnt <= 22'd0;
                clk_cnt_2 <= 22'd0;
                b_clk <= 1'b0;
                c_clk <= 1'b0;

                high <= 16'h0400;
                low <= 16'hfc00;
            end
        else
            begin
                clk_cnt <= clk_cnt_next;
                clk_cnt_2 <= clk_cnt_next_2;
                b_clk <= b_clk_next;
                c_clk <= c_clk_next;

                high <= next_high;
                low <= next_low;
            end
    
    // clk_cnt_next, b_clk_next
    always @*
        if (clk_cnt == note_div_left)
            begin
                clk_cnt_next = 22'd0;
                b_clk_next = ~b_clk;
            end
        else
            begin
                clk_cnt_next = clk_cnt + 1'b1;
                b_clk_next = b_clk;
            end

    // clk_cnt_next_2, c_clk_next
    always @*
        if (clk_cnt_2 == note_div_right)
            begin
                clk_cnt_next_2 = 22'd0;
                c_clk_next = ~c_clk;
            end
        else
            begin
                clk_cnt_next_2 = clk_cnt_2 + 1'b1;
                c_clk_next = c_clk;
            end

    // Assign the amplitude of the note
    // Volume is controlled here

    // This produces noices, likely due to complicated circuits
    // assign high = 16'h0008 << (volume * 2);
    // assign low = ~high + 1;

    always @* begin
        case (volume)
            5: begin
                next_high = 16'h4000;
                next_low = 16'hc000;
            end
            4: begin
                next_high = 16'h1000;
                next_low = 16'hf000;
            end
            2: begin
                next_high = 16'h0100;
                next_low = 16'hff00;
            end
            1: begin
                next_high = 16'h0020;
                next_low = 16'hffe0;
            end
            default: begin // 3
                next_high = 16'h0400;
                next_low = 16'hfc00;
            end
        endcase
    end

    assign audio_left = (note_div_left == 22'd1) ? 16'h0000 : 
                                (b_clk == 1'b0) ? low : high;
    assign audio_right = (note_div_right == 22'd1) ? 16'h0000 : 
                                (c_clk == 1'b0) ? low : high;
endmodule

module keypress_controller (
    input clk,
    input rst,
    inout PS2_DATA,
    inout PS2_CLK,
    output reg [6:0] key_pressed
);

	wire [511:0] key_down;
	wire [8:0] last_change;
	wire been_ready;

    KeyboardDecoder key_de (
		.key_down(key_down),
		.last_change(last_change),
		.key_valid(been_ready),
		.PS2_DATA(PS2_DATA),
		.PS2_CLK(PS2_CLK),
		.rst(rst),
		.clk(clk)
	);

	always @(posedge clk, posedge rst) begin
		if (rst) begin
            key_pressed = 0;
		end else begin
			if (been_ready) begin
				case (last_change)
                    {1'b0, 8'h1c}: // L Shift
                        key_pressed[0] = key_down[last_change];
                    {1'b0, 8'h1b}: // [
                        key_pressed[1] = key_down[last_change];
                    {1'b0, 8'h23}: // ]
                        key_pressed[2] = key_down[last_change];
                    {1'b0, 8'h2b}: // K
                        key_pressed[3] = key_down[last_change];
                    {1'b0, 8'h34}: // L
                        key_pressed[4] = key_down[last_change];
                    {1'b0, 8'h33}: // ;
                        key_pressed[5] = key_down[last_change];
                    {1'b0, 8'h3b}: // ;
                        key_pressed[6] = key_down[last_change];
                endcase
			end
		end
	end
endmodule


module music_example (
	input [11:0] ibeatNum,
	input en,
    input _music,
	output reg [31:0] toneL,
    output reg [31:0] toneR
);

    always @* begin
        if (_music == 0) begin
            if(en == 1) begin
                case(ibeatNum)
					12'd0: toneR = `G4; 12'd1: toneR = `G4; 12'd2: toneR = `G4; 12'd3: toneR = `G4;
					12'd4: toneR = `G4; 12'd5: toneR = `G4; 12'd6: toneR = `G4; 12'd7: toneR = `S;
					12'd8: toneR = `Bf4; 12'd9: toneR = `Bf4; 12'd10: toneR = `Bf4; 12'd11: toneR = `Bf4;
					12'd12: toneR = `Bf4; 12'd13: toneR = `Bf4; 12'd14: toneR = `Bf4; 12'd15: toneR = `S;
					12'd16: toneR = `C5; 12'd17: toneR = `C5; 12'd18: toneR = `C5; 12'd19: toneR = `C5;
					12'd20: toneR = `C5; 12'd21: toneR = `C5; 12'd22: toneR = `C5; 12'd23: toneR = `C5;
					12'd24: toneR = `C5; 12'd25: toneR = `C5; 12'd26: toneR = `C5; 12'd27: toneR = `S;
					12'd28: toneR = `Af4; 12'd29: toneR = `Af4; 12'd30: toneR = `Af4; 12'd31: toneR = `Af4;
					12'd32: toneR = `Af4; 12'd33: toneR = `Af4; 12'd34: toneR = `Af4; 12'd35: toneR = `Af4;
					12'd36: toneR = `Af4; 12'd37: toneR = `Af4; 12'd38: toneR = `Af4; 12'd39: toneR = `S;
					12'd40: toneR = `G4; 12'd41: toneR = `G4; 12'd42: toneR = `G4; 12'd43: toneR = `G4;
					12'd44: toneR = `G4; 12'd45: toneR = `G4; 12'd46: toneR = `G4; 12'd47: toneR = `S;
					12'd48: toneR = `F4; 12'd49: toneR = `F4; 12'd50: toneR = `F4; 12'd51: toneR = `F4;
					12'd52: toneR = `F4; 12'd53: toneR = `F4; 12'd54: toneR = `F4; 12'd55: toneR = `S;
					12'd56: toneR = `Ef4; 12'd57: toneR = `Ef4; 12'd58: toneR = `Ef4; 12'd59: toneR = `Ef4;
					12'd60: toneR = `Ef4; 12'd61: toneR = `Ef4; 12'd62: toneR = `Ef4; 12'd63: toneR = `S;
					12'd64: toneR = `F4; 12'd65: toneR = `F4; 12'd66: toneR = `F4; 12'd67: toneR = `F4;
					12'd68: toneR = `F4; 12'd69: toneR = `F4; 12'd70: toneR = `F4; 12'd71: toneR = `S;
					12'd72: toneR = `C5; 12'd73: toneR = `C5; 12'd74: toneR = `C5; 12'd75: toneR = `C5;
					12'd76: toneR = `C5; 12'd77: toneR = `C5; 12'd78: toneR = `C5; 12'd79: toneR = `S;
					12'd80: toneR = `Bf4; 12'd81: toneR = `Bf4; 12'd82: toneR = `Bf4; 12'd83: toneR = `Bf4;
					12'd84: toneR = `Bf4; 12'd85: toneR = `Bf4; 12'd86: toneR = `Bf4; 12'd87: toneR = `S;
					12'd88: toneR = `C5; 12'd89: toneR = `C5; 12'd90: toneR = `C5; 12'd91: toneR = `S;
					12'd92: toneR = `G4; 12'd93: toneR = `G4; 12'd94: toneR = `G4; 12'd95: toneR = `G4;
					12'd96: toneR = `G4; 12'd97: toneR = `G4; 12'd98: toneR = `G4; 12'd99: toneR = `G4;
					12'd100: toneR = `G4; 12'd101: toneR = `G4; 12'd102: toneR = `G4; 12'd103: toneR = `S;
					12'd104: toneR = `F4; 12'd105: toneR = `F4; 12'd106: toneR = `F4; 12'd107: toneR = `F4;
					12'd108: toneR = `F4; 12'd109: toneR = `F4; 12'd110: toneR = `F4; 12'd111: toneR = `S;
					12'd112: toneR = `Ef4; 12'd113: toneR = `Ef4; 12'd114: toneR = `Ef4; 12'd115: toneR = `Ef4;
					12'd116: toneR = `Ef4; 12'd117: toneR = `Ef4; 12'd118: toneR = `Ef4; 12'd119: toneR = `Ef4;
					12'd120: toneR = `Ef4; 12'd121: toneR = `Ef4; 12'd122: toneR = `Ef4; 12'd123: toneR = `Ef4;
					12'd124: toneR = `Ef4; 12'd125: toneR = `Ef4; 12'd126: toneR = `Ef4; 12'd127: toneR = `S;
					12'd128: toneR = `C4; 12'd129: toneR = `C4; 12'd130: toneR = `C4; 12'd131: toneR = `C4;
					12'd132: toneR = `C4; 12'd133: toneR = `C4; 12'd134: toneR = `C4; 12'd135: toneR = `S;
					12'd136: toneR = `Ef4; 12'd137: toneR = `Ef4; 12'd138: toneR = `Ef4; 12'd139: toneR = `Ef4;
					12'd140: toneR = `Ef4; 12'd141: toneR = `Ef4; 12'd142: toneR = `Ef4; 12'd143: toneR = `S;
					12'd144: toneR = `F4; 12'd145: toneR = `F4; 12'd146: toneR = `F4; 12'd147: toneR = `F4;
					12'd148: toneR = `F4; 12'd149: toneR = `F4; 12'd150: toneR = `F4; 12'd151: toneR = `F4;
					12'd152: toneR = `F4; 12'd153: toneR = `F4; 12'd154: toneR = `F4; 12'd155: toneR = `S;
					12'd156: toneR = `D4; 12'd157: toneR = `D4; 12'd158: toneR = `D4; 12'd159: toneR = `D4;
					12'd160: toneR = `D4; 12'd161: toneR = `D4; 12'd162: toneR = `D4; 12'd163: toneR = `D4;
					12'd164: toneR = `D4; 12'd165: toneR = `D4; 12'd166: toneR = `D4; 12'd167: toneR = `S;
					12'd168: toneR = `Af4; 12'd169: toneR = `Af4; 12'd170: toneR = `Af4; 12'd171: toneR = `Af4;
					12'd172: toneR = `Af4; 12'd173: toneR = `Af4; 12'd174: toneR = `Af4; 12'd175: toneR = `S;
					12'd176: toneR = `G4; 12'd177: toneR = `G4; 12'd178: toneR = `G4; 12'd179: toneR = `G4;
					12'd180: toneR = `G4; 12'd181: toneR = `G4; 12'd182: toneR = `G4; 12'd183: toneR = `S;
					12'd184: toneR = `G5; 12'd185: toneR = `G5; 12'd186: toneR = `G5; 12'd187: toneR = `G5;
					12'd188: toneR = `G5; 12'd189: toneR = `G5; 12'd190: toneR = `G5; 12'd191: toneR = `S;
					12'd192: toneR = `F5; 12'd193: toneR = `F5; 12'd194: toneR = `F5; 12'd195: toneR = `F5;
					12'd196: toneR = `F5; 12'd197: toneR = `F5; 12'd198: toneR = `F5; 12'd199: toneR = `S;
					12'd200: toneR = `D5; 12'd201: toneR = `D5; 12'd202: toneR = `D5; 12'd203: toneR = `D5;
					12'd204: toneR = `D5; 12'd205: toneR = `D5; 12'd206: toneR = `D5; 12'd207: toneR = `S;
					12'd208: toneR = `Ef5; 12'd209: toneR = `Ef5; 12'd210: toneR = `Ef5; 12'd211: toneR = `Ef5;
					12'd212: toneR = `Ef5; 12'd213: toneR = `Ef5; 12'd214: toneR = `Ef5; 12'd215: toneR = `Ef5;
					12'd216: toneR = `Ef5; 12'd217: toneR = `Ef5; 12'd218: toneR = `Ef5; 12'd219: toneR = `S;
					12'd220: toneR = `D5; 12'd221: toneR = `D5; 12'd222: toneR = `D5; 12'd223: toneR = `D5;
					12'd224: toneR = `D5; 12'd225: toneR = `D5; 12'd226: toneR = `D5; 12'd227: toneR = `D5;
					12'd228: toneR = `D5; 12'd229: toneR = `D5; 12'd230: toneR = `D5; 12'd231: toneR = `S;
					12'd232: toneR = `Bf4; 12'd233: toneR = `Bf4; 12'd234: toneR = `Bf4; 12'd235: toneR = `Bf4;
					12'd236: toneR = `Bf4; 12'd237: toneR = `Bf4; 12'd238: toneR = `Bf4; 12'd239: toneR = `S;
					12'd240: toneR = `C5; 12'd241: toneR = `C5; 12'd242: toneR = `C5; 12'd243: toneR = `C5;
					12'd244: toneR = `C5; 12'd245: toneR = `C5; 12'd246: toneR = `C5; 12'd247: toneR = `S;
					12'd248: toneR = `Bf4; 12'd249: toneR = `Bf4; 12'd250: toneR = `Bf4; 12'd251: toneR = `Bf4;
					12'd252: toneR = `Bf4; 12'd253: toneR = `Bf4; 12'd254: toneR = `Bf4; 12'd255: toneR = `S;
					12'd256: toneR = `G4; 12'd257: toneR = `G4; 12'd258: toneR = `G4; 12'd259: toneR = `G4;
					12'd260: toneR = `G4; 12'd261: toneR = `G4; 12'd262: toneR = `G4; 12'd263: toneR = `S;
					12'd264: toneR = `Bf4; 12'd265: toneR = `Bf4; 12'd266: toneR = `Bf4; 12'd267: toneR = `Bf4;
					12'd268: toneR = `Bf4; 12'd269: toneR = `Bf4; 12'd270: toneR = `Bf4; 12'd271: toneR = `S;
					12'd272: toneR = `C5; 12'd273: toneR = `C5; 12'd274: toneR = `C5; 12'd275: toneR = `C5;
					12'd276: toneR = `C5; 12'd277: toneR = `C5; 12'd278: toneR = `C5; 12'd279: toneR = `C5;
					12'd280: toneR = `C5; 12'd281: toneR = `C5; 12'd282: toneR = `C5; 12'd283: toneR = `S;
					12'd284: toneR = `Af4; 12'd285: toneR = `Af4; 12'd286: toneR = `Af4; 12'd287: toneR = `Af4;
					12'd288: toneR = `Af4; 12'd289: toneR = `Af4; 12'd290: toneR = `Af4; 12'd291: toneR = `Af4;
					12'd292: toneR = `Af4; 12'd293: toneR = `Af4; 12'd294: toneR = `Af4; 12'd295: toneR = `S;
					12'd296: toneR = `G4; 12'd297: toneR = `G4; 12'd298: toneR = `G4; 12'd299: toneR = `G4;
					12'd300: toneR = `G4; 12'd301: toneR = `G4; 12'd302: toneR = `G4; 12'd303: toneR = `S;
					12'd304: toneR = `F4; 12'd305: toneR = `F4; 12'd306: toneR = `F4; 12'd307: toneR = `F4;
					12'd308: toneR = `F4; 12'd309: toneR = `F4; 12'd310: toneR = `F4; 12'd311: toneR = `S;
					12'd312: toneR = `D5; 12'd313: toneR = `D5; 12'd314: toneR = `D5; 12'd315: toneR = `D5;
					12'd316: toneR = `D5; 12'd317: toneR = `D5; 12'd318: toneR = `D5; 12'd319: toneR = `S;
					12'd320: toneR = `C5; 12'd321: toneR = `C5; 12'd322: toneR = `C5; 12'd323: toneR = `C5;
					12'd324: toneR = `C5; 12'd325: toneR = `C5; 12'd326: toneR = `C5; 12'd327: toneR = `S;
					12'd328: toneR = `Bf4; 12'd329: toneR = `Bf4; 12'd330: toneR = `Bf4; 12'd331: toneR = `Bf4;
					12'd332: toneR = `Bf4; 12'd333: toneR = `Bf4; 12'd334: toneR = `Bf4; 12'd335: toneR = `S;
					12'd336: toneR = `Bf4; 12'd337: toneR = `Bf4; 12'd338: toneR = `Bf4; 12'd339: toneR = `Bf4;
					12'd340: toneR = `Bf4; 12'd341: toneR = `Bf4; 12'd342: toneR = `Bf4; 12'd343: toneR = `S;
					12'd344: toneR = `C5; 12'd345: toneR = `C5; 12'd346: toneR = `C5; 12'd347: toneR = `C5;
					12'd348: toneR = `C5; 12'd349: toneR = `C5; 12'd350: toneR = `C5; 12'd351: toneR = `S;
					12'd352: toneR = `D5; 12'd353: toneR = `D5; 12'd354: toneR = `D5; 12'd355: toneR = `D5;
					12'd356: toneR = `D5; 12'd357: toneR = `D5; 12'd358: toneR = `D5; 12'd359: toneR = `S;
					12'd360: toneR = `Ef5; 12'd361: toneR = `Ef5; 12'd362: toneR = `Ef5; 12'd363: toneR = `Ef5;
					12'd364: toneR = `Ef5; 12'd365: toneR = `Ef5; 12'd366: toneR = `Ef5; 12'd367: toneR = `Ef5;
					12'd368: toneR = `Ef5; 12'd369: toneR = `Ef5; 12'd370: toneR = `Ef5; 12'd371: toneR = `Ef5;
					12'd372: toneR = `Ef5; 12'd373: toneR = `Ef5; 12'd374: toneR = `Ef5; 12'd375: toneR = `S;
					12'd376: toneR = `G4; 12'd377: toneR = `G4; 12'd378: toneR = `G4; 12'd379: toneR = `G4;
					12'd380: toneR = `G4; 12'd381: toneR = `G4; 12'd382: toneR = `G4; 12'd383: toneR = `S;
					12'd384: toneR = `G4; 12'd385: toneR = `G4; 12'd386: toneR = `G4; 12'd387: toneR = `G4;
					12'd388: toneR = `G4; 12'd389: toneR = `G4; 12'd390: toneR = `G4; 12'd391: toneR = `S;
					12'd392: toneR = `F4; 12'd393: toneR = `F4; 12'd394: toneR = `F4; 12'd395: toneR = `F4;
					12'd396: toneR = `F4; 12'd397: toneR = `F4; 12'd398: toneR = `F4; 12'd399: toneR = `S;
					12'd400: toneR = `Ef4; 12'd401: toneR = `Ef4; 12'd402: toneR = `Ef4; 12'd403: toneR = `Ef4;
					12'd404: toneR = `Ef4; 12'd405: toneR = `Ef4; 12'd406: toneR = `Ef4; 12'd407: toneR = `Ef4;
					12'd408: toneR = `Ef4; 12'd409: toneR = `Ef4; 12'd410: toneR = `Ef4; 12'd411: toneR = `Ef4;
					12'd412: toneR = `Ef4; 12'd413: toneR = `Ef4; 12'd414: toneR = `Ef4; 12'd415: toneR = `Ef4;
					12'd416: toneR = `Ef4; 12'd417: toneR = `Ef4; 12'd418: toneR = `Ef4; 12'd419: toneR = `Ef4;
					12'd420: toneR = `Ef4; 12'd421: toneR = `Ef4; 12'd422: toneR = `Ef4; 12'd423: toneR = `Ef4;
					12'd424: toneR = `Ef4; 12'd425: toneR = `Ef4; 12'd426: toneR = `Ef4; 12'd427: toneR = `Ef4;
					12'd428: toneR = `Ef4; 12'd429: toneR = `Ef4; 12'd430: toneR = `Ef4; 12'd431: toneR = `S;
					12'd432: toneR = `G4; 12'd433: toneR = `G4; 12'd434: toneR = `G4; 12'd435: toneR = `G4;
					12'd436: toneR = `G4; 12'd437: toneR = `G4; 12'd438: toneR = `G4; 12'd439: toneR = `S;
					12'd440: toneR = `G5; 12'd441: toneR = `G5; 12'd442: toneR = `G5; 12'd443: toneR = `G5;
					12'd444: toneR = `G5; 12'd445: toneR = `G5; 12'd446: toneR = `G5; 12'd447: toneR = `S;
					12'd448: toneR = `F5; 12'd449: toneR = `F5; 12'd450: toneR = `F5; 12'd451: toneR = `F5;
					12'd452: toneR = `F5; 12'd453: toneR = `F5; 12'd454: toneR = `F5; 12'd455: toneR = `S;
					12'd456: toneR = `D5; 12'd457: toneR = `D5; 12'd458: toneR = `D5; 12'd459: toneR = `D5;
					12'd460: toneR = `D5; 12'd461: toneR = `D5; 12'd462: toneR = `D5; 12'd463: toneR = `D5;
					12'd464: toneR = `D5; 12'd465: toneR = `D5; 12'd466: toneR = `D5; 12'd467: toneR = `D5;
					12'd468: toneR = `D5; 12'd469: toneR = `D5; 12'd470: toneR = `D5; 12'd471: toneR = `D5;
					12'd472: toneR = `D5; 12'd473: toneR = `D5; 12'd474: toneR = `D5; 12'd475: toneR = `D5;
					12'd476: toneR = `D5; 12'd477: toneR = `D5; 12'd478: toneR = `D5; 12'd479: toneR = `D5;
					12'd480: toneR = `D5; 12'd481: toneR = `D5; 12'd482: toneR = `D5; 12'd483: toneR = `D5;
					12'd484: toneR = `D5; 12'd485: toneR = `D5; 12'd486: toneR = `D5; 12'd487: toneR = `D5;
					12'd488: toneR = `D5; 12'd489: toneR = `D5; 12'd490: toneR = `D5; 12'd491: toneR = `D5;
					12'd492: toneR = `D5; 12'd493: toneR = `D5; 12'd494: toneR = `D5; 12'd495: toneR = `D5;
					12'd496: toneR = `D5; 12'd497: toneR = `D5; 12'd498: toneR = `D5; 12'd499: toneR = `D5;
					12'd500: toneR = `D5; 12'd501: toneR = `D5; 12'd502: toneR = `D5; 12'd503: toneR = `S;
					12'd504: toneR = `S; 12'd505: toneR = `S; 12'd506: toneR = `S; 12'd507: toneR = `S;
					12'd508: toneR = `S; 12'd509: toneR = `S; 12'd510: toneR = `S; 12'd511: toneR = `S;

                    default: toneR = `sil;
                endcase
            end else begin
                toneR = `sil;
            end
        end else begin
            if(en == 1) begin
                case(ibeatNum)
					12'd0: toneR = `S; 12'd1: toneR = `S; 12'd2: toneR = `S; 12'd3: toneR = `S;
					12'd4: toneR = `S; 12'd5: toneR = `S; 12'd6: toneR = `S; 12'd7: toneR = `S;
					12'd8: toneR = `S; 12'd9: toneR = `S; 12'd10: toneR = `S; 12'd11: toneR = `S;
					12'd12: toneR = `S; 12'd13: toneR = `S; 12'd14: toneR = `S; 12'd15: toneR = `S;
					12'd16: toneR = `E4; 12'd17: toneR = `E4; 12'd18: toneR = `E4; 12'd19: toneR = `E4;
					12'd20: toneR = `E4; 12'd21: toneR = `E4; 12'd22: toneR = `E4; 12'd23: toneR = `E4;
					12'd24: toneR = `E4; 12'd25: toneR = `E4; 12'd26: toneR = `E4; 12'd27: toneR = `S;
					12'd28: toneR = `E4; 12'd29: toneR = `E4; 12'd30: toneR = `E4; 12'd31: toneR = `S;
					12'd32: toneR = `E4; 12'd33: toneR = `E4; 12'd34: toneR = `E4; 12'd35: toneR = `E4;
					12'd36: toneR = `E4; 12'd37: toneR = `E4; 12'd38: toneR = `E4; 12'd39: toneR = `E4;
					12'd40: toneR = `E4; 12'd41: toneR = `E4; 12'd42: toneR = `E4; 12'd43: toneR = `S;
					12'd44: toneR = `E4; 12'd45: toneR = `E4; 12'd46: toneR = `E4; 12'd47: toneR = `S;
					12'd48: toneR = `C4; 12'd49: toneR = `C4; 12'd50: toneR = `C4; 12'd51: toneR = `C4;
					12'd52: toneR = `C4; 12'd53: toneR = `C4; 12'd54: toneR = `C4; 12'd55: toneR = `C4;
					12'd56: toneR = `C4; 12'd57: toneR = `C4; 12'd58: toneR = `C4; 12'd59: toneR = `C4;
					12'd60: toneR = `C4; 12'd61: toneR = `C4; 12'd62: toneR = `C4; 12'd63: toneR = `S;
					12'd64: toneR = `E4; 12'd65: toneR = `E4; 12'd66: toneR = `E4; 12'd67: toneR = `E4;
					12'd68: toneR = `E4; 12'd69: toneR = `E4; 12'd70: toneR = `E4; 12'd71: toneR = `E4;
					12'd72: toneR = `E4; 12'd73: toneR = `E4; 12'd74: toneR = `E4; 12'd75: toneR = `E4;
					12'd76: toneR = `E4; 12'd77: toneR = `E4; 12'd78: toneR = `E4; 12'd79: toneR = `S;
					12'd80: toneR = `A4; 12'd81: toneR = `A4; 12'd82: toneR = `A4; 12'd83: toneR = `A4;
					12'd84: toneR = `A4; 12'd85: toneR = `A4; 12'd86: toneR = `A4; 12'd87: toneR = `A4;
					12'd88: toneR = `A4; 12'd89: toneR = `A4; 12'd90: toneR = `A4; 12'd91: toneR = `A4;
					12'd92: toneR = `A4; 12'd93: toneR = `A4; 12'd94: toneR = `A4; 12'd95: toneR = `S;
					12'd96: toneR = `G4; 12'd97: toneR = `G4; 12'd98: toneR = `G4; 12'd99: toneR = `G4;
					12'd100: toneR = `G4; 12'd101: toneR = `G4; 12'd102: toneR = `G4; 12'd103: toneR = `G4;
					12'd104: toneR = `G4; 12'd105: toneR = `G4; 12'd106: toneR = `G4; 12'd107: toneR = `G4;
					12'd108: toneR = `G4; 12'd109: toneR = `G4; 12'd110: toneR = `G4; 12'd111: toneR = `G4;
					12'd112: toneR = `G4; 12'd113: toneR = `G4; 12'd114: toneR = `G4; 12'd115: toneR = `G4;
					12'd116: toneR = `G4; 12'd117: toneR = `G4; 12'd118: toneR = `G4; 12'd119: toneR = `G4;
					12'd120: toneR = `G4; 12'd121: toneR = `G4; 12'd122: toneR = `G4; 12'd123: toneR = `G4;
					12'd124: toneR = `G4; 12'd125: toneR = `G4; 12'd126: toneR = `G4; 12'd127: toneR = `S;
					12'd128: toneR = `S; 12'd129: toneR = `S; 12'd130: toneR = `S; 12'd131: toneR = `S;
					12'd132: toneR = `S; 12'd133: toneR = `S; 12'd134: toneR = `S; 12'd135: toneR = `S;
					12'd136: toneR = `F4; 12'd137: toneR = `F4; 12'd138: toneR = `F4; 12'd139: toneR = `F4;
					12'd140: toneR = `F4; 12'd141: toneR = `F4; 12'd142: toneR = `F4; 12'd143: toneR = `F4;
					12'd144: toneR = `F4; 12'd145: toneR = `F4; 12'd146: toneR = `F4; 12'd147: toneR = `F4;
					12'd148: toneR = `F4; 12'd149: toneR = `F4; 12'd150: toneR = `F4; 12'd151: toneR = `F4;
					12'd152: toneR = `F4; 12'd153: toneR = `F4; 12'd154: toneR = `F4; 12'd155: toneR = `F4;
					12'd156: toneR = `F4; 12'd157: toneR = `F4; 12'd158: toneR = `F4; 12'd159: toneR = `S;
					12'd160: toneR = `F4; 12'd161: toneR = `F4; 12'd162: toneR = `F4; 12'd163: toneR = `F4;
					12'd164: toneR = `F4; 12'd165: toneR = `F4; 12'd166: toneR = `F4; 12'd167: toneR = `F4;
					12'd168: toneR = `F4; 12'd169: toneR = `F4; 12'd170: toneR = `F4; 12'd171: toneR = `F4;
					12'd172: toneR = `F4; 12'd173: toneR = `F4; 12'd174: toneR = `F4; 12'd175: toneR = `S;
					12'd176: toneR = `D4; 12'd177: toneR = `D4; 12'd178: toneR = `D4; 12'd179: toneR = `D4;
					12'd180: toneR = `D4; 12'd181: toneR = `D4; 12'd182: toneR = `D4; 12'd183: toneR = `D4;
					12'd184: toneR = `D4; 12'd185: toneR = `D4; 12'd186: toneR = `D4; 12'd187: toneR = `D4;
					12'd188: toneR = `D4; 12'd189: toneR = `D4; 12'd190: toneR = `D4; 12'd191: toneR = `S;
					12'd192: toneR = `C4; 12'd193: toneR = `C4; 12'd194: toneR = `C4; 12'd195: toneR = `C4;
					12'd196: toneR = `C4; 12'd197: toneR = `C4; 12'd198: toneR = `C4; 12'd199: toneR = `C4;
					12'd200: toneR = `C4; 12'd201: toneR = `C4; 12'd202: toneR = `C4; 12'd203: toneR = `C4;
					12'd204: toneR = `C4; 12'd205: toneR = `C4; 12'd206: toneR = `C4; 12'd207: toneR = `S;
					12'd208: toneR = `E4; 12'd209: toneR = `E4; 12'd210: toneR = `E4; 12'd211: toneR = `E4;
					12'd212: toneR = `E4; 12'd213: toneR = `E4; 12'd214: toneR = `E4; 12'd215: toneR = `E4;
					12'd216: toneR = `E4; 12'd217: toneR = `E4; 12'd218: toneR = `E4; 12'd219: toneR = `E4;
					12'd220: toneR = `E4; 12'd221: toneR = `E4; 12'd222: toneR = `E4; 12'd223: toneR = `S;
					12'd224: toneR = `G3; 12'd225: toneR = `G3; 12'd226: toneR = `G3; 12'd227: toneR = `G3;
					12'd228: toneR = `G3; 12'd229: toneR = `G3; 12'd230: toneR = `G3; 12'd231: toneR = `G3;
					12'd232: toneR = `G3; 12'd233: toneR = `G3; 12'd234: toneR = `G3; 12'd235: toneR = `G3;
					12'd236: toneR = `G3; 12'd237: toneR = `G3; 12'd238: toneR = `G3; 12'd239: toneR = `G3;
					12'd240: toneR = `G3; 12'd241: toneR = `G3; 12'd242: toneR = `G3; 12'd243: toneR = `G3;
					12'd244: toneR = `G3; 12'd245: toneR = `G3; 12'd246: toneR = `G3; 12'd247: toneR = `G3;
					12'd248: toneR = `G3; 12'd249: toneR = `G3; 12'd250: toneR = `G3; 12'd251: toneR = `G3;
					12'd252: toneR = `G3; 12'd253: toneR = `G3; 12'd254: toneR = `G3; 12'd255: toneR = `S;
					12'd256: toneR = `S; 12'd257: toneR = `S; 12'd258: toneR = `S; 12'd259: toneR = `S;
					12'd260: toneR = `S; 12'd261: toneR = `S; 12'd262: toneR = `S; 12'd263: toneR = `S;
					12'd264: toneR = `S; 12'd265: toneR = `S; 12'd266: toneR = `S; 12'd267: toneR = `S;
					12'd268: toneR = `S; 12'd269: toneR = `S; 12'd270: toneR = `S; 12'd271: toneR = `S;
					12'd272: toneR = `E4; 12'd273: toneR = `E4; 12'd274: toneR = `E4; 12'd275: toneR = `E4;
					12'd276: toneR = `E4; 12'd277: toneR = `E4; 12'd278: toneR = `E4; 12'd279: toneR = `E4;
					12'd280: toneR = `E4; 12'd281: toneR = `E4; 12'd282: toneR = `E4; 12'd283: toneR = `E4;
					12'd284: toneR = `E4; 12'd285: toneR = `E4; 12'd286: toneR = `E4; 12'd287: toneR = `S;
					12'd288: toneR = `E4; 12'd289: toneR = `E4; 12'd290: toneR = `E4; 12'd291: toneR = `E4;
					12'd292: toneR = `E4; 12'd293: toneR = `E4; 12'd294: toneR = `E4; 12'd295: toneR = `E4;
					12'd296: toneR = `E4; 12'd297: toneR = `E4; 12'd298: toneR = `E4; 12'd299: toneR = `S;
					12'd300: toneR = `E4; 12'd301: toneR = `E4; 12'd302: toneR = `E4; 12'd303: toneR = `S;
					12'd304: toneR = `C4; 12'd305: toneR = `C4; 12'd306: toneR = `C4; 12'd307: toneR = `C4;
					12'd308: toneR = `C4; 12'd309: toneR = `C4; 12'd310: toneR = `C4; 12'd311: toneR = `C4;
					12'd312: toneR = `C4; 12'd313: toneR = `C4; 12'd314: toneR = `C4; 12'd315: toneR = `C4;
					12'd316: toneR = `C4; 12'd317: toneR = `C4; 12'd318: toneR = `C4; 12'd319: toneR = `S;
					12'd320: toneR = `E4; 12'd321: toneR = `E4; 12'd322: toneR = `E4; 12'd323: toneR = `E4;
					12'd324: toneR = `E4; 12'd325: toneR = `E4; 12'd326: toneR = `E4; 12'd327: toneR = `E4;
					12'd328: toneR = `E4; 12'd329: toneR = `E4; 12'd330: toneR = `E4; 12'd331: toneR = `E4;
					12'd332: toneR = `E4; 12'd333: toneR = `E4; 12'd334: toneR = `E4; 12'd335: toneR = `S;
					12'd336: toneR = `A4; 12'd337: toneR = `A4; 12'd338: toneR = `A4; 12'd339: toneR = `A4;
					12'd340: toneR = `A4; 12'd341: toneR = `A4; 12'd342: toneR = `A4; 12'd343: toneR = `A4;
					12'd344: toneR = `A4; 12'd345: toneR = `A4; 12'd346: toneR = `A4; 12'd347: toneR = `A4;
					12'd348: toneR = `A4; 12'd349: toneR = `A4; 12'd350: toneR = `A4; 12'd351: toneR = `S;
					12'd352: toneR = `G4; 12'd353: toneR = `G4; 12'd354: toneR = `G4; 12'd355: toneR = `G4;
					12'd356: toneR = `G4; 12'd357: toneR = `G4; 12'd358: toneR = `G4; 12'd359: toneR = `G4;
					12'd360: toneR = `G4; 12'd361: toneR = `G4; 12'd362: toneR = `G4; 12'd363: toneR = `G4;
					12'd364: toneR = `G4; 12'd365: toneR = `G4; 12'd366: toneR = `G4; 12'd367: toneR = `G4;
					12'd368: toneR = `G4; 12'd369: toneR = `G4; 12'd370: toneR = `G4; 12'd371: toneR = `G4;
					12'd372: toneR = `G4; 12'd373: toneR = `G4; 12'd374: toneR = `G4; 12'd375: toneR = `G4;
					12'd376: toneR = `G4; 12'd377: toneR = `G4; 12'd378: toneR = `G4; 12'd379: toneR = `G4;
					12'd380: toneR = `G4; 12'd381: toneR = `G4; 12'd382: toneR = `G4; 12'd383: toneR = `S;
					12'd384: toneR = `S; 12'd385: toneR = `S; 12'd386: toneR = `S; 12'd387: toneR = `S;
					12'd388: toneR = `S; 12'd389: toneR = `S; 12'd390: toneR = `S; 12'd391: toneR = `S;
					12'd392: toneR = `S; 12'd393: toneR = `S; 12'd394: toneR = `S; 12'd395: toneR = `S;
					12'd396: toneR = `S; 12'd397: toneR = `S; 12'd398: toneR = `S; 12'd399: toneR = `S;
					12'd400: toneR = `F4; 12'd401: toneR = `F4; 12'd402: toneR = `F4; 12'd403: toneR = `F4;
					12'd404: toneR = `F4; 12'd405: toneR = `F4; 12'd406: toneR = `F4; 12'd407: toneR = `F4;
					12'd408: toneR = `F4; 12'd409: toneR = `F4; 12'd410: toneR = `F4; 12'd411: toneR = `S;
					12'd412: toneR = `F4; 12'd413: toneR = `F4; 12'd414: toneR = `F4; 12'd415: toneR = `S;
					12'd416: toneR = `G4; 12'd417: toneR = `G4; 12'd418: toneR = `G4; 12'd419: toneR = `G4;
					12'd420: toneR = `G4; 12'd421: toneR = `G4; 12'd422: toneR = `G4; 12'd423: toneR = `G4;
					12'd424: toneR = `G4; 12'd425: toneR = `G4; 12'd426: toneR = `G4; 12'd427: toneR = `G4;
					12'd428: toneR = `G4; 12'd429: toneR = `G4; 12'd430: toneR = `G4; 12'd431: toneR = `S;
					12'd432: toneR = `B4; 12'd433: toneR = `B4; 12'd434: toneR = `B4; 12'd435: toneR = `B4;
					12'd436: toneR = `B4; 12'd437: toneR = `B4; 12'd438: toneR = `B4; 12'd439: toneR = `B4;
					12'd440: toneR = `B4; 12'd441: toneR = `B4; 12'd442: toneR = `B4; 12'd443: toneR = `B4;
					12'd444: toneR = `B4; 12'd445: toneR = `B4; 12'd446: toneR = `B4; 12'd447: toneR = `S;
					12'd448: toneR = `C5; 12'd449: toneR = `C5; 12'd450: toneR = `C5; 12'd451: toneR = `C5;
					12'd452: toneR = `C5; 12'd453: toneR = `C5; 12'd454: toneR = `C5; 12'd455: toneR = `C5;
					12'd456: toneR = `C5; 12'd457: toneR = `C5; 12'd458: toneR = `C5; 12'd459: toneR = `C5;
					12'd460: toneR = `C5; 12'd461: toneR = `C5; 12'd462: toneR = `C5; 12'd463: toneR = `C5;
					12'd464: toneR = `C5; 12'd465: toneR = `C5; 12'd466: toneR = `C5; 12'd467: toneR = `C5;
					12'd468: toneR = `C5; 12'd469: toneR = `C5; 12'd470: toneR = `C5; 12'd471: toneR = `C5;
					12'd472: toneR = `C5; 12'd473: toneR = `C5; 12'd474: toneR = `C5; 12'd475: toneR = `C5;
					12'd476: toneR = `C5; 12'd477: toneR = `C5; 12'd478: toneR = `C5; 12'd479: toneR = `C5;
					12'd480: toneR = `C5; 12'd481: toneR = `C5; 12'd482: toneR = `C5; 12'd483: toneR = `C5;
					12'd484: toneR = `C5; 12'd485: toneR = `C5; 12'd486: toneR = `C5; 12'd487: toneR = `C5;
					12'd488: toneR = `C5; 12'd489: toneR = `C5; 12'd490: toneR = `C5; 12'd491: toneR = `C5;
					12'd492: toneR = `C5; 12'd493: toneR = `C5; 12'd494: toneR = `C5; 12'd495: toneR = `C5;
					12'd496: toneR = `C5; 12'd497: toneR = `C5; 12'd498: toneR = `C5; 12'd499: toneR = `C5;
					12'd500: toneR = `C5; 12'd501: toneR = `C5; 12'd502: toneR = `C5; 12'd503: toneR = `C5;
					12'd504: toneR = `C5; 12'd505: toneR = `C5; 12'd506: toneR = `C5; 12'd507: toneR = `C5;
					12'd508: toneR = `C5; 12'd509: toneR = `C5; 12'd510: toneR = `C5; 12'd511: toneR = `S;

                    default: toneR = `sil;
                endcase
            end else begin
                toneR = `sil;
            end
        end
    end

    always @(*) begin
        if (_music == 0) begin
            if(en == 1)begin
                case(ibeatNum)
					12'd0: toneL = `S; 12'd1: toneL = `S; 12'd2: toneL = `S; 12'd3: toneL = `S;
					12'd4: toneL = `S; 12'd5: toneL = `S; 12'd6: toneL = `S; 12'd7: toneL = `S;
					12'd8: toneL = `S; 12'd9: toneL = `S; 12'd10: toneL = `S; 12'd11: toneL = `S;
					12'd12: toneL = `S; 12'd13: toneL = `S; 12'd14: toneL = `S; 12'd15: toneL = `S;
					12'd16: toneL = `Af3; 12'd17: toneL = `Af3; 12'd18: toneL = `Af3; 12'd19: toneL = `Af3;
					12'd20: toneL = `Af3; 12'd21: toneL = `Af3; 12'd22: toneL = `Af3; 12'd23: toneL = `Af3;
					12'd24: toneL = `Af3; 12'd25: toneL = `Af3; 12'd26: toneL = `Af3; 12'd27: toneL = `Af3;
					12'd28: toneL = `Af3; 12'd29: toneL = `Af3; 12'd30: toneL = `Af3; 12'd31: toneL = `Af3;
					12'd32: toneL = `Af3; 12'd33: toneL = `Af3; 12'd34: toneL = `Af3; 12'd35: toneL = `Af3;
					12'd36: toneL = `Af3; 12'd37: toneL = `Af3; 12'd38: toneL = `Af3; 12'd39: toneL = `Af3;
					12'd40: toneL = `Af3; 12'd41: toneL = `Af3; 12'd42: toneL = `Af3; 12'd43: toneL = `Af3;
					12'd44: toneL = `Af3; 12'd45: toneL = `Af3; 12'd46: toneL = `Af3; 12'd47: toneL = `S;
					12'd48: toneL = `Bf3; 12'd49: toneL = `Bf3; 12'd50: toneL = `Bf3; 12'd51: toneL = `Bf3;
					12'd52: toneL = `Bf3; 12'd53: toneL = `Bf3; 12'd54: toneL = `Bf3; 12'd55: toneL = `Bf3;
					12'd56: toneL = `Bf3; 12'd57: toneL = `Bf3; 12'd58: toneL = `Bf3; 12'd59: toneL = `Bf3;
					12'd60: toneL = `Bf3; 12'd61: toneL = `Bf3; 12'd62: toneL = `Bf3; 12'd63: toneL = `Bf3;
					12'd64: toneL = `Bf3; 12'd65: toneL = `Bf3; 12'd66: toneL = `Bf3; 12'd67: toneL = `Bf3;
					12'd68: toneL = `Bf3; 12'd69: toneL = `Bf3; 12'd70: toneL = `Bf3; 12'd71: toneL = `Bf3;
					12'd72: toneL = `Bf3; 12'd73: toneL = `Bf3; 12'd74: toneL = `Bf3; 12'd75: toneL = `Bf3;
					12'd76: toneL = `Bf3; 12'd77: toneL = `Bf3; 12'd78: toneL = `Bf3; 12'd79: toneL = `S;
					12'd80: toneL = `G3; 12'd81: toneL = `G3; 12'd82: toneL = `G3; 12'd83: toneL = `G3;
					12'd84: toneL = `G3; 12'd85: toneL = `G3; 12'd86: toneL = `G3; 12'd87: toneL = `G3;
					12'd88: toneL = `G3; 12'd89: toneL = `G3; 12'd90: toneL = `G3; 12'd91: toneL = `G3;
					12'd92: toneL = `G3; 12'd93: toneL = `G3; 12'd94: toneL = `G3; 12'd95: toneL = `G3;
					12'd96: toneL = `G3; 12'd97: toneL = `G3; 12'd98: toneL = `G3; 12'd99: toneL = `G3;
					12'd100: toneL = `G3; 12'd101: toneL = `G3; 12'd102: toneL = `G3; 12'd103: toneL = `G3;
					12'd104: toneL = `G3; 12'd105: toneL = `G3; 12'd106: toneL = `G3; 12'd107: toneL = `G3;
					12'd108: toneL = `G3; 12'd109: toneL = `G3; 12'd110: toneL = `G3; 12'd111: toneL = `S;
					12'd112: toneL = `C4; 12'd113: toneL = `C4; 12'd114: toneL = `C4; 12'd115: toneL = `C4;
					12'd116: toneL = `C4; 12'd117: toneL = `C4; 12'd118: toneL = `C4; 12'd119: toneL = `C4;
					12'd120: toneL = `C4; 12'd121: toneL = `C4; 12'd122: toneL = `C4; 12'd123: toneL = `C4;
					12'd124: toneL = `C4; 12'd125: toneL = `C4; 12'd126: toneL = `C4; 12'd127: toneL = `C4;
					12'd128: toneL = `C4; 12'd129: toneL = `C4; 12'd130: toneL = `C4; 12'd131: toneL = `C4;
					12'd132: toneL = `C4; 12'd133: toneL = `C4; 12'd134: toneL = `C4; 12'd135: toneL = `C4;
					12'd136: toneL = `C4; 12'd137: toneL = `C4; 12'd138: toneL = `C4; 12'd139: toneL = `C4;
					12'd140: toneL = `C4; 12'd141: toneL = `C4; 12'd142: toneL = `C4; 12'd143: toneL = `S;
					12'd144: toneL = `Af3; 12'd145: toneL = `Af3; 12'd146: toneL = `Af3; 12'd147: toneL = `Af3;
					12'd148: toneL = `Af3; 12'd149: toneL = `Af3; 12'd150: toneL = `Af3; 12'd151: toneL = `Af3;
					12'd152: toneL = `Af3; 12'd153: toneL = `Af3; 12'd154: toneL = `Af3; 12'd155: toneL = `Af3;
					12'd156: toneL = `Af3; 12'd157: toneL = `Af3; 12'd158: toneL = `Af3; 12'd159: toneL = `Af3;
					12'd160: toneL = `Af3; 12'd161: toneL = `Af3; 12'd162: toneL = `Af3; 12'd163: toneL = `Af3;
					12'd164: toneL = `Af3; 12'd165: toneL = `Af3; 12'd166: toneL = `Af3; 12'd167: toneL = `Af3;
					12'd168: toneL = `Af3; 12'd169: toneL = `Af3; 12'd170: toneL = `Af3; 12'd171: toneL = `Af3;
					12'd172: toneL = `Af3; 12'd173: toneL = `Af3; 12'd174: toneL = `Af3; 12'd175: toneL = `S;
					12'd176: toneL = `G3; 12'd177: toneL = `G3; 12'd178: toneL = `G3; 12'd179: toneL = `G3;
					12'd180: toneL = `G3; 12'd181: toneL = `G3; 12'd182: toneL = `G3; 12'd183: toneL = `G3;
					12'd184: toneL = `G3; 12'd185: toneL = `G3; 12'd186: toneL = `G3; 12'd187: toneL = `G3;
					12'd188: toneL = `G3; 12'd189: toneL = `G3; 12'd190: toneL = `G3; 12'd191: toneL = `G3;
					12'd192: toneL = `G3; 12'd193: toneL = `G3; 12'd194: toneL = `G3; 12'd195: toneL = `G3;
					12'd196: toneL = `G3; 12'd197: toneL = `G3; 12'd198: toneL = `G3; 12'd199: toneL = `G3;
					12'd200: toneL = `G3; 12'd201: toneL = `G3; 12'd202: toneL = `G3; 12'd203: toneL = `G3;
					12'd204: toneL = `G3; 12'd205: toneL = `G3; 12'd206: toneL = `G3; 12'd207: toneL = `S;
					12'd208: toneL = `C4; 12'd209: toneL = `C4; 12'd210: toneL = `C4; 12'd211: toneL = `C4;
					12'd212: toneL = `C4; 12'd213: toneL = `C4; 12'd214: toneL = `C4; 12'd215: toneL = `C4;
					12'd216: toneL = `C4; 12'd217: toneL = `C4; 12'd218: toneL = `C4; 12'd219: toneL = `C4;
					12'd220: toneL = `C4; 12'd221: toneL = `C4; 12'd222: toneL = `C4; 12'd223: toneL = `C4;
					12'd224: toneL = `C4; 12'd225: toneL = `C4; 12'd226: toneL = `C4; 12'd227: toneL = `C4;
					12'd228: toneL = `C4; 12'd229: toneL = `C4; 12'd230: toneL = `C4; 12'd231: toneL = `C4;
					12'd232: toneL = `C4; 12'd233: toneL = `C4; 12'd234: toneL = `C4; 12'd235: toneL = `C4;
					12'd236: toneL = `C4; 12'd237: toneL = `C4; 12'd238: toneL = `C4; 12'd239: toneL = `S;
					12'd240: toneL = `G3; 12'd241: toneL = `G3; 12'd242: toneL = `G3; 12'd243: toneL = `G3;
					12'd244: toneL = `G3; 12'd245: toneL = `G3; 12'd246: toneL = `G3; 12'd247: toneL = `G3;
					12'd248: toneL = `G3; 12'd249: toneL = `G3; 12'd250: toneL = `G3; 12'd251: toneL = `G3;
					12'd252: toneL = `G3; 12'd253: toneL = `G3; 12'd254: toneL = `G3; 12'd255: toneL = `S;
					12'd256: toneL = `S; 12'd257: toneL = `S; 12'd258: toneL = `S; 12'd259: toneL = `S;
					12'd260: toneL = `S; 12'd261: toneL = `S; 12'd262: toneL = `S; 12'd263: toneL = `S;
					12'd264: toneL = `S; 12'd265: toneL = `S; 12'd266: toneL = `S; 12'd267: toneL = `S;
					12'd268: toneL = `S; 12'd269: toneL = `S; 12'd270: toneL = `S; 12'd271: toneL = `S;
					12'd272: toneL = `Af2; 12'd273: toneL = `Af2; 12'd274: toneL = `Af2; 12'd275: toneL = `Af2;
					12'd276: toneL = `Af2; 12'd277: toneL = `Af2; 12'd278: toneL = `Af2; 12'd279: toneL = `S;
					12'd280: toneL = `Ef3; 12'd281: toneL = `Ef3; 12'd282: toneL = `Ef3; 12'd283: toneL = `Ef3;
					12'd284: toneL = `Ef3; 12'd285: toneL = `Ef3; 12'd286: toneL = `Ef3; 12'd287: toneL = `S;
					12'd288: toneL = `Af3; 12'd289: toneL = `Af3; 12'd290: toneL = `Af3; 12'd291: toneL = `Af3;
					12'd292: toneL = `Af3; 12'd293: toneL = `Af3; 12'd294: toneL = `Af3; 12'd295: toneL = `S;
					12'd296: toneL = `Ef3; 12'd297: toneL = `Ef3; 12'd298: toneL = `Ef3; 12'd299: toneL = `Ef3;
					12'd300: toneL = `Ef3; 12'd301: toneL = `Ef3; 12'd302: toneL = `Ef3; 12'd303: toneL = `S;
					12'd304: toneL = `Bf2; 12'd305: toneL = `Bf2; 12'd306: toneL = `Bf2; 12'd307: toneL = `Bf2;
					12'd308: toneL = `Bf2; 12'd309: toneL = `Bf2; 12'd310: toneL = `Bf2; 12'd311: toneL = `S;
					12'd312: toneL = `F3; 12'd313: toneL = `F3; 12'd314: toneL = `F3; 12'd315: toneL = `F3;
					12'd316: toneL = `F3; 12'd317: toneL = `F3; 12'd318: toneL = `F3; 12'd319: toneL = `S;
					12'd320: toneL = `Bf3; 12'd321: toneL = `Bf3; 12'd322: toneL = `Bf3; 12'd323: toneL = `Bf3;
					12'd324: toneL = `Bf3; 12'd325: toneL = `Bf3; 12'd326: toneL = `Bf3; 12'd327: toneL = `S;
					12'd328: toneL = `F3; 12'd329: toneL = `F3; 12'd330: toneL = `F3; 12'd331: toneL = `F3;
					12'd332: toneL = `F3; 12'd333: toneL = `F3; 12'd334: toneL = `F3; 12'd335: toneL = `S;
					12'd336: toneL = `G2; 12'd337: toneL = `G2; 12'd338: toneL = `G2; 12'd339: toneL = `G2;
					12'd340: toneL = `G2; 12'd341: toneL = `G2; 12'd342: toneL = `G2; 12'd343: toneL = `S;
					12'd344: toneL = `D3; 12'd345: toneL = `D3; 12'd346: toneL = `D3; 12'd347: toneL = `D3;
					12'd348: toneL = `D3; 12'd349: toneL = `D3; 12'd350: toneL = `D3; 12'd351: toneL = `S;
					12'd352: toneL = `G3; 12'd353: toneL = `G3; 12'd354: toneL = `G3; 12'd355: toneL = `G3;
					12'd356: toneL = `G3; 12'd357: toneL = `G3; 12'd358: toneL = `G3; 12'd359: toneL = `S;
					12'd360: toneL = `D3; 12'd361: toneL = `D3; 12'd362: toneL = `D3; 12'd363: toneL = `D3;
					12'd364: toneL = `D3; 12'd365: toneL = `D3; 12'd366: toneL = `D3; 12'd367: toneL = `S;
					12'd368: toneL = `C3; 12'd369: toneL = `C3; 12'd370: toneL = `C3; 12'd371: toneL = `C3;
					12'd372: toneL = `C3; 12'd373: toneL = `C3; 12'd374: toneL = `C3; 12'd375: toneL = `S;
					12'd376: toneL = `G3; 12'd377: toneL = `G3; 12'd378: toneL = `G3; 12'd379: toneL = `G3;
					12'd380: toneL = `G3; 12'd381: toneL = `G3; 12'd382: toneL = `G3; 12'd383: toneL = `S;
					12'd384: toneL = `Ef4; 12'd385: toneL = `Ef4; 12'd386: toneL = `Ef4; 12'd387: toneL = `Ef4;
					12'd388: toneL = `Ef4; 12'd389: toneL = `Ef4; 12'd390: toneL = `Ef4; 12'd391: toneL = `S;
					12'd392: toneL = `G3; 12'd393: toneL = `G3; 12'd394: toneL = `G3; 12'd395: toneL = `G3;
					12'd396: toneL = `G3; 12'd397: toneL = `G3; 12'd398: toneL = `G3; 12'd399: toneL = `S;
					12'd400: toneL = `Af3; 12'd401: toneL = `Af3; 12'd402: toneL = `Af3; 12'd403: toneL = `Af3;
					12'd404: toneL = `Af3; 12'd405: toneL = `Af3; 12'd406: toneL = `Af3; 12'd407: toneL = `Af3;
					12'd408: toneL = `Af3; 12'd409: toneL = `Af3; 12'd410: toneL = `Af3; 12'd411: toneL = `Af3;
					12'd412: toneL = `Af3; 12'd413: toneL = `Af3; 12'd414: toneL = `Af3; 12'd415: toneL = `Af3;
					12'd416: toneL = `Af3; 12'd417: toneL = `Af3; 12'd418: toneL = `Af3; 12'd419: toneL = `Af3;
					12'd420: toneL = `Af3; 12'd421: toneL = `Af3; 12'd422: toneL = `Af3; 12'd423: toneL = `Af3;
					12'd424: toneL = `Af3; 12'd425: toneL = `Af3; 12'd426: toneL = `Af3; 12'd427: toneL = `Af3;
					12'd428: toneL = `Af3; 12'd429: toneL = `Af3; 12'd430: toneL = `Af3; 12'd431: toneL = `S;
					12'd432: toneL = `G3; 12'd433: toneL = `G3; 12'd434: toneL = `G3; 12'd435: toneL = `G3;
					12'd436: toneL = `G3; 12'd437: toneL = `G3; 12'd438: toneL = `G3; 12'd439: toneL = `G3;
					12'd440: toneL = `G3; 12'd441: toneL = `G3; 12'd442: toneL = `G3; 12'd443: toneL = `G3;
					12'd444: toneL = `G3; 12'd445: toneL = `G3; 12'd446: toneL = `G3; 12'd447: toneL = `S;
					12'd448: toneL = `D3; 12'd449: toneL = `D3; 12'd450: toneL = `D3; 12'd451: toneL = `D3;
					12'd452: toneL = `D3; 12'd453: toneL = `D3; 12'd454: toneL = `D3; 12'd455: toneL = `D3;
					12'd456: toneL = `D3; 12'd457: toneL = `D3; 12'd458: toneL = `D3; 12'd459: toneL = `D3;
					12'd460: toneL = `D3; 12'd461: toneL = `D3; 12'd462: toneL = `D3; 12'd463: toneL = `D3;
					12'd464: toneL = `D3; 12'd465: toneL = `D3; 12'd466: toneL = `D3; 12'd467: toneL = `D3;
					12'd468: toneL = `D3; 12'd469: toneL = `D3; 12'd470: toneL = `D3; 12'd471: toneL = `D3;
					12'd472: toneL = `D3; 12'd473: toneL = `D3; 12'd474: toneL = `D3; 12'd475: toneL = `D3;
					12'd476: toneL = `D3; 12'd477: toneL = `D3; 12'd478: toneL = `D3; 12'd479: toneL = `D3;
					12'd480: toneL = `D3; 12'd481: toneL = `D3; 12'd482: toneL = `D3; 12'd483: toneL = `D3;
					12'd484: toneL = `D3; 12'd485: toneL = `D3; 12'd486: toneL = `D3; 12'd487: toneL = `D3;
					12'd488: toneL = `D3; 12'd489: toneL = `D3; 12'd490: toneL = `D3; 12'd491: toneL = `D3;
					12'd492: toneL = `D3; 12'd493: toneL = `D3; 12'd494: toneL = `D3; 12'd495: toneL = `S;
					12'd496: toneL = `S; 12'd497: toneL = `S; 12'd498: toneL = `S; 12'd499: toneL = `S;
					12'd500: toneL = `S; 12'd501: toneL = `S; 12'd502: toneL = `S; 12'd503: toneL = `S;
					12'd504: toneL = `S; 12'd505: toneL = `S; 12'd506: toneL = `S; 12'd507: toneL = `S;
					12'd508: toneL = `S; 12'd509: toneL = `S; 12'd510: toneL = `S; 12'd511: toneL = `S;

                    default : toneL = `sil;
                endcase
            end else begin
                toneL = `sil;
            end
        end else begin
            if(en == 1)begin
                case(ibeatNum)
					12'd0: toneL = `C3; 12'd1: toneL = `C3; 12'd2: toneL = `C3; 12'd3: toneL = `C3;
					12'd4: toneL = `C3; 12'd5: toneL = `C3; 12'd6: toneL = `C3; 12'd7: toneL = `C3;
					12'd8: toneL = `C3; 12'd9: toneL = `C3; 12'd10: toneL = `C3; 12'd11: toneL = `C3;
					12'd12: toneL = `C3; 12'd13: toneL = `C3; 12'd14: toneL = `C3; 12'd15: toneL = `S;
					12'd16: toneL = `G3; 12'd17: toneL = `G3; 12'd18: toneL = `G3; 12'd19: toneL = `G3;
					12'd20: toneL = `G3; 12'd21: toneL = `G3; 12'd22: toneL = `G3; 12'd23: toneL = `G3;
					12'd24: toneL = `G3; 12'd25: toneL = `G3; 12'd26: toneL = `G3; 12'd27: toneL = `G3;
					12'd28: toneL = `G3; 12'd29: toneL = `G3; 12'd30: toneL = `G3; 12'd31: toneL = `S;
					12'd32: toneL = `G2; 12'd33: toneL = `G2; 12'd34: toneL = `G2; 12'd35: toneL = `G2;
					12'd36: toneL = `G2; 12'd37: toneL = `G2; 12'd38: toneL = `G2; 12'd39: toneL = `G2;
					12'd40: toneL = `G2; 12'd41: toneL = `G2; 12'd42: toneL = `G2; 12'd43: toneL = `G2;
					12'd44: toneL = `G2; 12'd45: toneL = `G2; 12'd46: toneL = `G2; 12'd47: toneL = `S;
					12'd48: toneL = `G3; 12'd49: toneL = `G3; 12'd50: toneL = `G3; 12'd51: toneL = `G3;
					12'd52: toneL = `G3; 12'd53: toneL = `G3; 12'd54: toneL = `G3; 12'd55: toneL = `G3;
					12'd56: toneL = `G3; 12'd57: toneL = `G3; 12'd58: toneL = `G3; 12'd59: toneL = `G3;
					12'd60: toneL = `G3; 12'd61: toneL = `G3; 12'd62: toneL = `G3; 12'd63: toneL = `S;
					12'd64: toneL = `C3; 12'd65: toneL = `C3; 12'd66: toneL = `C3; 12'd67: toneL = `C3;
					12'd68: toneL = `C3; 12'd69: toneL = `C3; 12'd70: toneL = `C3; 12'd71: toneL = `C3;
					12'd72: toneL = `C3; 12'd73: toneL = `C3; 12'd74: toneL = `C3; 12'd75: toneL = `C3;
					12'd76: toneL = `C3; 12'd77: toneL = `C3; 12'd78: toneL = `C3; 12'd79: toneL = `S;
					12'd80: toneL = `G3; 12'd81: toneL = `G3; 12'd82: toneL = `G3; 12'd83: toneL = `G3;
					12'd84: toneL = `G3; 12'd85: toneL = `G3; 12'd86: toneL = `G3; 12'd87: toneL = `G3;
					12'd88: toneL = `G3; 12'd89: toneL = `G3; 12'd90: toneL = `G3; 12'd91: toneL = `G3;
					12'd92: toneL = `G3; 12'd93: toneL = `G3; 12'd94: toneL = `G3; 12'd95: toneL = `S;
					12'd96: toneL = `G2; 12'd97: toneL = `G2; 12'd98: toneL = `G2; 12'd99: toneL = `G2;
					12'd100: toneL = `G2; 12'd101: toneL = `G2; 12'd102: toneL = `G2; 12'd103: toneL = `G2;
					12'd104: toneL = `G2; 12'd105: toneL = `G2; 12'd106: toneL = `G2; 12'd107: toneL = `G2;
					12'd108: toneL = `G2; 12'd109: toneL = `G2; 12'd110: toneL = `G2; 12'd111: toneL = `S;
					12'd112: toneL = `G3; 12'd113: toneL = `G3; 12'd114: toneL = `G3; 12'd115: toneL = `G3;
					12'd116: toneL = `G3; 12'd117: toneL = `G3; 12'd118: toneL = `G3; 12'd119: toneL = `G3;
					12'd120: toneL = `G3; 12'd121: toneL = `G3; 12'd122: toneL = `G3; 12'd123: toneL = `G3;
					12'd124: toneL = `G3; 12'd125: toneL = `G3; 12'd126: toneL = `G3; 12'd127: toneL = `S;
					12'd128: toneL = `F2; 12'd129: toneL = `F2; 12'd130: toneL = `F2; 12'd131: toneL = `F2;
					12'd132: toneL = `F2; 12'd133: toneL = `F2; 12'd134: toneL = `F2; 12'd135: toneL = `F2;
					12'd136: toneL = `F2; 12'd137: toneL = `F2; 12'd138: toneL = `F2; 12'd139: toneL = `F2;
					12'd140: toneL = `F2; 12'd141: toneL = `F2; 12'd142: toneL = `F2; 12'd143: toneL = `S;
					12'd144: toneL = `F3; 12'd145: toneL = `F3; 12'd146: toneL = `F3; 12'd147: toneL = `F3;
					12'd148: toneL = `F3; 12'd149: toneL = `F3; 12'd150: toneL = `F3; 12'd151: toneL = `F3;
					12'd152: toneL = `F3; 12'd153: toneL = `F3; 12'd154: toneL = `F3; 12'd155: toneL = `F3;
					12'd156: toneL = `F3; 12'd157: toneL = `F3; 12'd158: toneL = `F3; 12'd159: toneL = `S;
					12'd160: toneL = `F2; 12'd161: toneL = `F2; 12'd162: toneL = `F2; 12'd163: toneL = `F2;
					12'd164: toneL = `F2; 12'd165: toneL = `F2; 12'd166: toneL = `F2; 12'd167: toneL = `F2;
					12'd168: toneL = `F2; 12'd169: toneL = `F2; 12'd170: toneL = `F2; 12'd171: toneL = `F2;
					12'd172: toneL = `F2; 12'd173: toneL = `F2; 12'd174: toneL = `F2; 12'd175: toneL = `S;
					12'd176: toneL = `F3; 12'd177: toneL = `F3; 12'd178: toneL = `F3; 12'd179: toneL = `F3;
					12'd180: toneL = `F3; 12'd181: toneL = `F3; 12'd182: toneL = `F3; 12'd183: toneL = `F3;
					12'd184: toneL = `F3; 12'd185: toneL = `F3; 12'd186: toneL = `F3; 12'd187: toneL = `F3;
					12'd188: toneL = `F3; 12'd189: toneL = `F3; 12'd190: toneL = `F3; 12'd191: toneL = `S;
					12'd192: toneL = `C3; 12'd193: toneL = `C3; 12'd194: toneL = `C3; 12'd195: toneL = `C3;
					12'd196: toneL = `C3; 12'd197: toneL = `C3; 12'd198: toneL = `C3; 12'd199: toneL = `C3;
					12'd200: toneL = `C3; 12'd201: toneL = `C3; 12'd202: toneL = `C3; 12'd203: toneL = `C3;
					12'd204: toneL = `C3; 12'd205: toneL = `C3; 12'd206: toneL = `C3; 12'd207: toneL = `S;
					12'd208: toneL = `G2; 12'd209: toneL = `G2; 12'd210: toneL = `G2; 12'd211: toneL = `G2;
					12'd212: toneL = `G2; 12'd213: toneL = `G2; 12'd214: toneL = `G2; 12'd215: toneL = `G2;
					12'd216: toneL = `G2; 12'd217: toneL = `G2; 12'd218: toneL = `G2; 12'd219: toneL = `G2;
					12'd220: toneL = `G2; 12'd221: toneL = `G2; 12'd222: toneL = `G2; 12'd223: toneL = `S;
					12'd224: toneL = `A2; 12'd225: toneL = `A2; 12'd226: toneL = `A2; 12'd227: toneL = `A2;
					12'd228: toneL = `A2; 12'd229: toneL = `A2; 12'd230: toneL = `A2; 12'd231: toneL = `A2;
					12'd232: toneL = `A2; 12'd233: toneL = `A2; 12'd234: toneL = `A2; 12'd235: toneL = `A2;
					12'd236: toneL = `A2; 12'd237: toneL = `A2; 12'd238: toneL = `A2; 12'd239: toneL = `S;
					12'd240: toneL = `B2; 12'd241: toneL = `B2; 12'd242: toneL = `B2; 12'd243: toneL = `B2;
					12'd244: toneL = `B2; 12'd245: toneL = `B2; 12'd246: toneL = `B2; 12'd247: toneL = `B2;
					12'd248: toneL = `B2; 12'd249: toneL = `B2; 12'd250: toneL = `B2; 12'd251: toneL = `B2;
					12'd252: toneL = `B2; 12'd253: toneL = `B2; 12'd254: toneL = `B2; 12'd255: toneL = `S;
					12'd256: toneL = `C3; 12'd257: toneL = `C3; 12'd258: toneL = `C3; 12'd259: toneL = `C3;
					12'd260: toneL = `C3; 12'd261: toneL = `C3; 12'd262: toneL = `C3; 12'd263: toneL = `C3;
					12'd264: toneL = `C3; 12'd265: toneL = `C3; 12'd266: toneL = `C3; 12'd267: toneL = `C3;
					12'd268: toneL = `C3; 12'd269: toneL = `C3; 12'd270: toneL = `C3; 12'd271: toneL = `S;
					12'd272: toneL = `G3; 12'd273: toneL = `G3; 12'd274: toneL = `G3; 12'd275: toneL = `G3;
					12'd276: toneL = `G3; 12'd277: toneL = `G3; 12'd278: toneL = `G3; 12'd279: toneL = `G3;
					12'd280: toneL = `G3; 12'd281: toneL = `G3; 12'd282: toneL = `G3; 12'd283: toneL = `G3;
					12'd284: toneL = `G3; 12'd285: toneL = `G3; 12'd286: toneL = `G3; 12'd287: toneL = `S;
					12'd288: toneL = `G2; 12'd289: toneL = `G2; 12'd290: toneL = `G2; 12'd291: toneL = `G2;
					12'd292: toneL = `G2; 12'd293: toneL = `G2; 12'd294: toneL = `G2; 12'd295: toneL = `G2;
					12'd296: toneL = `G2; 12'd297: toneL = `G2; 12'd298: toneL = `G2; 12'd299: toneL = `G2;
					12'd300: toneL = `G2; 12'd301: toneL = `G2; 12'd302: toneL = `G2; 12'd303: toneL = `S;
					12'd304: toneL = `G3; 12'd305: toneL = `G3; 12'd306: toneL = `G3; 12'd307: toneL = `G3;
					12'd308: toneL = `G3; 12'd309: toneL = `G3; 12'd310: toneL = `G3; 12'd311: toneL = `G3;
					12'd312: toneL = `G3; 12'd313: toneL = `G3; 12'd314: toneL = `G3; 12'd315: toneL = `G3;
					12'd316: toneL = `G3; 12'd317: toneL = `G3; 12'd318: toneL = `G3; 12'd319: toneL = `S;
					12'd320: toneL = `C3; 12'd321: toneL = `C3; 12'd322: toneL = `C3; 12'd323: toneL = `C3;
					12'd324: toneL = `C3; 12'd325: toneL = `C3; 12'd326: toneL = `C3; 12'd327: toneL = `C3;
					12'd328: toneL = `C3; 12'd329: toneL = `C3; 12'd330: toneL = `C3; 12'd331: toneL = `C3;
					12'd332: toneL = `C3; 12'd333: toneL = `C3; 12'd334: toneL = `C3; 12'd335: toneL = `S;
					12'd336: toneL = `G3; 12'd337: toneL = `G3; 12'd338: toneL = `G3; 12'd339: toneL = `G3;
					12'd340: toneL = `G3; 12'd341: toneL = `G3; 12'd342: toneL = `G3; 12'd343: toneL = `G3;
					12'd344: toneL = `G3; 12'd345: toneL = `G3; 12'd346: toneL = `G3; 12'd347: toneL = `G3;
					12'd348: toneL = `G3; 12'd349: toneL = `G3; 12'd350: toneL = `G3; 12'd351: toneL = `S;
					12'd352: toneL = `G2; 12'd353: toneL = `G2; 12'd354: toneL = `G2; 12'd355: toneL = `G2;
					12'd356: toneL = `G2; 12'd357: toneL = `G2; 12'd358: toneL = `G2; 12'd359: toneL = `G2;
					12'd360: toneL = `G2; 12'd361: toneL = `G2; 12'd362: toneL = `G2; 12'd363: toneL = `G2;
					12'd364: toneL = `G2; 12'd365: toneL = `G2; 12'd366: toneL = `G2; 12'd367: toneL = `S;
					12'd368: toneL = `G3; 12'd369: toneL = `G3; 12'd370: toneL = `G3; 12'd371: toneL = `G3;
					12'd372: toneL = `G3; 12'd373: toneL = `G3; 12'd374: toneL = `G3; 12'd375: toneL = `G3;
					12'd376: toneL = `G3; 12'd377: toneL = `G3; 12'd378: toneL = `G3; 12'd379: toneL = `G3;
					12'd380: toneL = `G3; 12'd381: toneL = `G3; 12'd382: toneL = `G3; 12'd383: toneL = `S;
					12'd384: toneL = `F2; 12'd385: toneL = `F2; 12'd386: toneL = `F2; 12'd387: toneL = `F2;
					12'd388: toneL = `F2; 12'd389: toneL = `F2; 12'd390: toneL = `F2; 12'd391: toneL = `F2;
					12'd392: toneL = `F2; 12'd393: toneL = `F2; 12'd394: toneL = `F2; 12'd395: toneL = `F2;
					12'd396: toneL = `F2; 12'd397: toneL = `F2; 12'd398: toneL = `F2; 12'd399: toneL = `S;
					12'd400: toneL = `F3; 12'd401: toneL = `F3; 12'd402: toneL = `F3; 12'd403: toneL = `F3;
					12'd404: toneL = `F3; 12'd405: toneL = `F3; 12'd406: toneL = `F3; 12'd407: toneL = `F3;
					12'd408: toneL = `F3; 12'd409: toneL = `F3; 12'd410: toneL = `F3; 12'd411: toneL = `F3;
					12'd412: toneL = `F3; 12'd413: toneL = `F3; 12'd414: toneL = `F3; 12'd415: toneL = `S;
					12'd416: toneL = `G2; 12'd417: toneL = `G2; 12'd418: toneL = `G2; 12'd419: toneL = `G2;
					12'd420: toneL = `G2; 12'd421: toneL = `G2; 12'd422: toneL = `G2; 12'd423: toneL = `G2;
					12'd424: toneL = `G2; 12'd425: toneL = `G2; 12'd426: toneL = `G2; 12'd427: toneL = `G2;
					12'd428: toneL = `G2; 12'd429: toneL = `G2; 12'd430: toneL = `G2; 12'd431: toneL = `S;
					12'd432: toneL = `G3; 12'd433: toneL = `G3; 12'd434: toneL = `G3; 12'd435: toneL = `G3;
					12'd436: toneL = `G3; 12'd437: toneL = `G3; 12'd438: toneL = `G3; 12'd439: toneL = `G3;
					12'd440: toneL = `G3; 12'd441: toneL = `G3; 12'd442: toneL = `G3; 12'd443: toneL = `G3;
					12'd444: toneL = `G3; 12'd445: toneL = `G3; 12'd446: toneL = `G3; 12'd447: toneL = `S;
					12'd448: toneL = `C3; 12'd449: toneL = `C3; 12'd450: toneL = `C3; 12'd451: toneL = `C3;
					12'd452: toneL = `C3; 12'd453: toneL = `C3; 12'd454: toneL = `C3; 12'd455: toneL = `C3;
					12'd456: toneL = `C3; 12'd457: toneL = `C3; 12'd458: toneL = `C3; 12'd459: toneL = `C3;
					12'd460: toneL = `C3; 12'd461: toneL = `C3; 12'd462: toneL = `C3; 12'd463: toneL = `S;
					12'd464: toneL = `G2; 12'd465: toneL = `G2; 12'd466: toneL = `G2; 12'd467: toneL = `G2;
					12'd468: toneL = `G2; 12'd469: toneL = `G2; 12'd470: toneL = `G2; 12'd471: toneL = `G2;
					12'd472: toneL = `G2; 12'd473: toneL = `G2; 12'd474: toneL = `G2; 12'd475: toneL = `G2;
					12'd476: toneL = `G2; 12'd477: toneL = `G2; 12'd478: toneL = `G2; 12'd479: toneL = `S;
					12'd480: toneL = `C2; 12'd481: toneL = `C2; 12'd482: toneL = `C2; 12'd483: toneL = `C2;
					12'd484: toneL = `C2; 12'd485: toneL = `C2; 12'd486: toneL = `C2; 12'd487: toneL = `C2;
					12'd488: toneL = `C2; 12'd489: toneL = `C2; 12'd490: toneL = `C2; 12'd491: toneL = `C2;
					12'd492: toneL = `C2; 12'd493: toneL = `C2; 12'd494: toneL = `C2; 12'd495: toneL = `C2;
					12'd496: toneL = `C2; 12'd497: toneL = `C2; 12'd498: toneL = `C2; 12'd499: toneL = `C2;
					12'd500: toneL = `C2; 12'd501: toneL = `C2; 12'd502: toneL = `C2; 12'd503: toneL = `C2;
					12'd504: toneL = `C2; 12'd505: toneL = `C2; 12'd506: toneL = `C2; 12'd507: toneL = `C2;
					12'd508: toneL = `C2; 12'd509: toneL = `C2; 12'd510: toneL = `C2; 12'd511: toneL = `S;

                    default : toneL = `sil;
                endcase
            end else begin
                toneL = `sil;
            end
        end
    end
endmodule

module play_mode_controller (
    input [6:0] key_pressed,
    output reg [31:0] play_tone
);

    always @* begin
        if (key_pressed[0])
            play_tone = `C4;
        else if (key_pressed[1])
            play_tone = `D4;
        else if (key_pressed[2])
            play_tone = `E4;
        else if (key_pressed[3])
            play_tone = `F4;
        else if (key_pressed[4])
            play_tone = `G4;
        else if (key_pressed[5])
            play_tone = `A4;
        else if (key_pressed[6])
            play_tone = `B4;
        else
            play_tone = `sil;
    end

endmodule

module seven_seg_controller (
    input clk_display,
    input [31:0] tone,
    output reg [3:0] DIGIT,
    output reg [6:0] DISPLAY
);
    
    reg [3:0] note;
    reg [3:0] notation;

    parameter sharp = 7;
    parameter flat = 8;
    parameter c = 0;
    parameter d = 1;
    parameter e = 2;
    parameter f = 3;
    parameter g = 4;
    parameter a = 5;
    parameter b = 6;
    parameter nothing = 10;

    always @* begin
        notation = nothing;
        note = nothing;
        case (tone)
            `C5, `C3, `C4, `C2:
                note = c;
            `D5, `D3, `D4:
                note = d;
            `Ef3, `E4, `Ef5, `Ef4:
                note = e;
            `F3, `F4, `F2, `F5:
                note = f;
            `G3, `G5, `G4, `G2:
                note = g;
            `A4, `Af2, `A2, `Af4, `Af3:
                note = a;
            `Bf4, `B4, `B2, `Bf2, `Bf3:
                note = b;
        endcase
        case (tone)
            `Ef4, `Ef5, `Bf2, `Af4, `Af2, `Ef3, `Bf3, `Bf4, `Af3:
                notation = flat;
        endcase
    end

    reg [3:0] value;

    always @(posedge clk_display) begin
        case (DIGIT)
            4'b1110: begin
                value = notation;
                DIGIT = 4'b1101;
            end
            4'b1101: begin
                value = nothing;
                DIGIT = 4'b1011;
            end
            4'b1011: begin
                value = nothing;
                DIGIT = 4'b0111;
            end
            4'b0111: begin
                value = note;
                DIGIT = 4'b1110;
            end
            default: begin
                value = note;
                DIGIT = 4'b1110;
            end
        endcase
    end

    always @* begin
        case (value)
            4'd0: DISPLAY = 7'b0100111; // c
            4'd1: DISPLAY = 7'b0100001; // d
            4'd2: DISPLAY = 7'b0000110; // E
            4'd3: DISPLAY = 7'b0001110; // F
            4'd4: DISPLAY = 7'b1000010; // G
            4'd5: DISPLAY = 7'b0100000; // a
            4'd6: DISPLAY = 7'b0000011; // b
            4'd7: DISPLAY = 7'b0011100; // #
            4'd8: DISPLAY = 7'b0000011; // b
            default: DISPLAY = 7'b0111111; // -
        endcase
    end

endmodule

module lab8(
    clk,        // clock from crystal
    rst,        // BTNC: active high reset
    _play,      // SW0: Play/Pause
    _mute,      // SW1: Mute
    _slow,      // SW2: Slow
    _music,     // SW3: Music
    _mode,      // SW15: Mode
    _volUP,     // BTNU: Vol up
    _volDOWN,   // BTND: Vol down
    _higherOCT, // BTNR: Oct higher
    _lowerOCT,  // BTNL: Oct lower
    PS2_DATA,   // Keyboard I/O
    PS2_CLK,    // Keyboard I/O
    _led,       // LED: [15:13] octave & [4:0] volume
    audio_mclk, // master clock
    audio_lrck, // left-right clock
    audio_sck,  // serial clock
    audio_sdin, // serial audio data input
    DISPLAY,    // 7-seg
    DIGIT       // 7-seg
);

    // I/O declaration
    input clk; 
    input rst; 
    input _play, _mute, _slow, _music, _mode; 
    input _volUP, _volDOWN, _higherOCT, _lowerOCT; 
    inout PS2_DATA; 
	inout PS2_CLK; 
    output reg [15:0] _led; 
    output audio_mclk; 
    output audio_lrck; 
    output audio_sck; 
    output audio_sdin; 
    output [6:0] DISPLAY; 
    output [3:0] DIGIT; 
    
    // Internal Signal
    wire [15:0] audio_in_left, audio_in_right;

    wire [11:0] ibeatNum;               // Beat counter
    wire [31:0] demo_freqL, demo_freqR;           // Raw frequency, produced by music module
    wire [21:0] freq_outL, freq_outR;    // Processed frequency, adapted to the clock rate of Basys3

    wire [6:0] key_pressed;
    wire [31:0] play_tone;


    wire [31:0] prefreqL, prefreqR;
    reg [31:0] freqL, freqR;


    // Flip flops
    reg [2:0] volume;
    reg [1:0] octave;


    // clkDiv22
    wire clkDiv22;
    clock_divider #(.n(22)) clock_22(.clk(clk), .clk_div(clkDiv22));    // for keyboard and audio

    // clkDiv13
    wire clkDiv13;
    clock_divider #(.n(13)) clock_13(.clk(clk), .clk_div(clkDiv13));    // for debounce and 7segment


    // Player Control
    // [in]  reset, clock, _play, _slow, _music, and _mode
    // [out] beat number
    player_control playerCtrl_00 ( 
        .clk(clkDiv22),
        .reset(rst),
        ._play(_play),
        ._slow(_slow), 
        ._mode(_mode),
        ._music(_music),
        .ibeat(ibeatNum)
    );

    // Music module
    // [in]  beat number and en
    // [out] left & right raw frequency
    music_example music_00 (
        .ibeatNum(ibeatNum),
        .en(_play),
        ._music(_music),
        .toneL(demo_freqL),
        .toneR(demo_freqR)
    );


    keypress_controller kp(
        .clk(clk),
        .rst(rst),
        .PS2_DATA(PS2_DATA),
        .PS2_CLK(PS2_CLK),
        .key_pressed(key_pressed)
    );

    play_mode_controller pmc(
        .key_pressed(key_pressed),
        .play_tone(play_tone)
    );


    // Volume & Octave control
    debounce dpU(.pb_debounced(U_db), .pb(_volUP), .clk(clkDiv13));
    debounce dpD(.pb_debounced(D_db), .pb(_volDOWN), .clk(clkDiv13));
    debounce dpH(.pb_debounced(H_db), .pb(_higherOCT), .clk(clkDiv13));
    debounce dpL(.pb_debounced(L_db), .pb(_lowerOCT), .clk(clkDiv13));
    onepulse opU(.signal(U_db), .clk(clk), .op(U_op));
    onepulse opD(.signal(D_db), .clk(clk), .op(D_op));
    onepulse opH(.signal(H_db), .clk(clk), .op(H_op));
    onepulse opL(.signal(L_db), .clk(clk), .op(L_op));

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            volume <= 3;
            octave <= 2;
        end else begin
            if (U_op && volume != 5)
                volume <= volume + 1;
            if (D_op && volume != 1)
                volume <= volume - 1;
            if (H_op && octave != 3)
                octave <= octave + 1;
            if (L_op && octave != 1)
                octave <= octave - 1;  
        end
    end

    always @* begin
        _led = 0;
        if (!_mute) begin
            _led[0] = 1;
            _led[1] = volume != 1;
            _led[2] = volume != 1 && volume != 2;
            _led[3] = volume == 4 || volume == 5;
            _led[4] = volume == 5;
        end

        _led[16-octave] = 1;
    end

    // tone selector & octave
    assign prefreqL = (_mode == 0)? play_tone: demo_freqL;
    assign prefreqR = (_mode == 0)? play_tone: demo_freqR;
    // assign freqL = (_mute || prefreqL == `sil)? `sil: (octave == 1)? (prefreqL / 2): (octave == 3)? (prefreqL * 2): prefreqL;
    // assign freqR = (_mute || prefreqR == `sil)? `sil: (octave == 1)? (prefreqR / 2): (octave == 3)? (prefreqR * 2): prefreqR;

    always @(posedge clkDiv13, posedge rst) begin
        if (rst) begin
            freqL <= `sil;
            freqR <= `sil;
        end else begin
            freqL <= (_mute || prefreqL == `sil)? `sil: (octave == 1)? (prefreqL / 2): (octave == 3)? (prefreqL * 2): prefreqL;
            freqR <= (_mute || prefreqR == `sil)? `sil: (octave == 1)? (prefreqR / 2): (octave == 3)? (prefreqR * 2): prefreqR;
        end
    end

    // freq_outL, freq_outR
    // Note gen makes no sound, if freq_out = 50000000 / `silence = 1
    assign freq_outL = 50000000 / freqL;
    assign freq_outR = 50000000 / freqR;

    // Note generation
    // [in]  processed frequency
    // [out] audio wave signal (using square wave here)
    note_gen noteGen_00(
        .clk(clk), 
        .rst(rst), 
        .volume(volume),
        .note_div_left(freq_outL), 
        .note_div_right(freq_outR), 
        .audio_left(audio_in_left),     // left sound audio
        .audio_right(audio_in_right)    // right sound audio
    );

    // Speaker controller
    speaker_control sc(
        .clk(clk), 
        .rst(rst), 
        .audio_in_left(audio_in_left),      // left channel audio data input
        .audio_in_right(audio_in_right),    // right channel audio data input
        .audio_mclk(audio_mclk),            // master clock
        .audio_lrck(audio_lrck),            // left-right clock
        .audio_sck(audio_sck),              // serial clock
        .audio_sdin(audio_sdin)             // serial audio data input
    );

    seven_seg_controller ssc(
        .clk_display(clkDiv13),
        .tone(prefreqR),
        .DIGIT(DIGIT),
        .DISPLAY(DISPLAY)
    );

endmodule
