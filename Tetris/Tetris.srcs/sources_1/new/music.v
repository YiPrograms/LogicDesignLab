`define B3 32'd247
`define E5 32'd659
`define Gs4 32'd415
`define D4 32'd294
`define A4 32'd440
`define G5 32'd784
`define E4 32'd330
`define Gs3 32'd208
`define B4 32'd494
`define F5 32'd698
`define C4 32'd262
`define A3 32'd220
`define D5 32'd587
`define C5 32'd523
`define A5 32'd880

`define S   32'd50000000 // slience
`define sil   32'd50000000 // slience

module music(
    input clk,
    input clk13,
    input clk22,
    input rst,
    input play,
    input vol_up,
    input vol_down,
    output audio_mclk,
    output audio_lrck, 
    output audio_sck,
    output audio_sdin,
    output reg [4:0] volume_leds
);

    debounce dpU(.pb_debounced(U_db), .pb(_volUP), .clk(clk13));
    debounce dpD(.pb_debounced(D_db), .pb(_volDOWN), .clk(clk13));
    onepulse opU(.signal(U_db), .clk(clk), .op(U_op));
    onepulse opD(.signal(D_db), .clk(clk), .op(D_op));

    reg [2:0] volume;
    always @(posedge clk, posedge rst) begin
        if (rst) begin
            volume <= 3;
        end else begin
            if (U_op && volume != 5)
                volume <= volume + 1;
            if (D_op && volume != 1)
                volume <= volume - 1;
        end
    end

    wire [15:0] audio_in_left, audio_in_right;

    wire [11:0] ibeatNum;               // Beat counter
    wire [21:0] freq_outL, freq_outR;    // Processed frequency, adapted to the clock rate of Basys3

    wire [6:0] key_pressed;
    wire [31:0] play_tone;

    wire [31:0] freqL, freqR;

    player_control playerCtrl_00 ( 
        .clk(clk22),
        .reset(rst),
        ._play(play),
        .ibeat(ibeatNum)
    );

    music_example music_00 (
        .ibeatNum(ibeatNum),
        .en(play),
        .toneL(freqL),
        .toneR(freqR)
    );

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

    always @* begin
        volume_leds[0] = 1;
        volume_leds[1] = volume != 1;
        volume_leds[2] = volume != 1 && volume != 2;
        volume_leds[3] = volume == 4 || volume == 5;
        volume_leds[4] = volume == 5;
    end

endmodule

module player_control (
	input clk, 
	input reset, 
	input _play, 
	output reg [11:0] ibeat
);
	parameter LEN = 3584;
    reg [11:0] next_ibeat;

	always @(posedge clk, posedge reset) begin
		if (reset || !_play) begin
			ibeat <= 0;
		end else if (_play) begin
            ibeat <= next_ibeat;
		end
	end

    always @* begin
        next_ibeat = (ibeat + 1 != LEN) ? (ibeat + 1) : 0;
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

module speaker_control(
    clk,  // clock from the crystal
    rst,  // active high reset
    audio_in_left, // left channel audio data input
    audio_in_right, // right channel audio data input
    audio_mclk, // master clock
    audio_lrck, // left-right clock, Word Select clock, or sample rate clock
    audio_sck, // serial clock
    audio_sdin // serial audio data input
);

    // I/O declaration
    input clk;  // clock from the crystal
    input rst;  // active high reset
    input [15:0] audio_in_left; // left channel audio data input
    input [15:0] audio_in_right; // right channel audio data input
    output audio_mclk; // master clock
    output audio_lrck; // left-right clock
    output audio_sck; // serial clock
    output audio_sdin; // serial audio data input
    reg audio_sdin;

    // Declare internal signal nodes 
    wire [8:0] clk_cnt_next;
    reg [8:0] clk_cnt;
    reg [15:0] audio_left, audio_right;

    // Counter for the clock divider
    assign clk_cnt_next = clk_cnt + 1'b1;

    always @(posedge clk or posedge rst)
        if (rst == 1'b1)
            clk_cnt <= 9'd0;
        else
            clk_cnt <= clk_cnt_next;

    // Assign divided clock output
    assign audio_mclk = clk_cnt[1];
    assign audio_lrck = clk_cnt[8];
    assign audio_sck = 1'b1; // use internal serial clock mode

    // audio input data buffer
    always @(posedge clk_cnt[8] or posedge rst)
        if (rst == 1'b1)
            begin
                audio_left <= 16'd0;
                audio_right <= 16'd0;
            end
        else
            begin
                audio_left <= audio_in_left;
                audio_right <= audio_in_right;
            end

    always @*
        case (clk_cnt[8:4])
            5'b00000: audio_sdin = audio_right[0];
            5'b00001: audio_sdin = audio_left[15];
            5'b00010: audio_sdin = audio_left[14];
            5'b00011: audio_sdin = audio_left[13];
            5'b00100: audio_sdin = audio_left[12];
            5'b00101: audio_sdin = audio_left[11];
            5'b00110: audio_sdin = audio_left[10];
            5'b00111: audio_sdin = audio_left[9];
            5'b01000: audio_sdin = audio_left[8];
            5'b01001: audio_sdin = audio_left[7];
            5'b01010: audio_sdin = audio_left[6];
            5'b01011: audio_sdin = audio_left[5];
            5'b01100: audio_sdin = audio_left[4];
            5'b01101: audio_sdin = audio_left[3];
            5'b01110: audio_sdin = audio_left[2];
            5'b01111: audio_sdin = audio_left[1];
            5'b10000: audio_sdin = audio_left[0];
            5'b10001: audio_sdin = audio_right[15];
            5'b10010: audio_sdin = audio_right[14];
            5'b10011: audio_sdin = audio_right[13];
            5'b10100: audio_sdin = audio_right[12];
            5'b10101: audio_sdin = audio_right[11];
            5'b10110: audio_sdin = audio_right[10];
            5'b10111: audio_sdin = audio_right[9];
            5'b11000: audio_sdin = audio_right[8];
            5'b11001: audio_sdin = audio_right[7];
            5'b11010: audio_sdin = audio_right[6];
            5'b11011: audio_sdin = audio_right[5];
            5'b11100: audio_sdin = audio_right[4];
            5'b11101: audio_sdin = audio_right[3];
            5'b11110: audio_sdin = audio_right[2];
            5'b11111: audio_sdin = audio_right[1];
            default: audio_sdin = 1'b0;
        endcase

endmodule

module music_example (
	input [11:0] ibeatNum,
	input en,
	output [31:0] toneL,
    output [31:0] toneR
); 

    reg [31:0] tone;

    assign toneL = tone;
    assign toneR = tone;

    always @* begin
        if(en == 1) begin
            case(ibeatNum)
                12'd0: tone = `E5; 12'd1: tone = `E5; 12'd2: tone = `E5; 12'd3: tone = `E5;
				12'd4: tone = `E5; 12'd5: tone = `E5; 12'd6: tone = `E5; 12'd7: tone = `E5;
				12'd8: tone = `E5; 12'd9: tone = `E5; 12'd10: tone = `E5; 12'd11: tone = `E5;
				12'd12: tone = `E5; 12'd13: tone = `E5; 12'd14: tone = `E5; 12'd15: tone = `S;
				12'd16: tone = `B4; 12'd17: tone = `B4; 12'd18: tone = `B4; 12'd19: tone = `B4;
				12'd20: tone = `B4; 12'd21: tone = `B4; 12'd22: tone = `B4; 12'd23: tone = `S;
				12'd24: tone = `C5; 12'd25: tone = `C5; 12'd26: tone = `C5; 12'd27: tone = `C5;
				12'd28: tone = `C5; 12'd29: tone = `C5; 12'd30: tone = `C5; 12'd31: tone = `S;
				12'd32: tone = `D5; 12'd33: tone = `D5; 12'd34: tone = `D5; 12'd35: tone = `D5;
				12'd36: tone = `D5; 12'd37: tone = `D5; 12'd38: tone = `D5; 12'd39: tone = `S;
				12'd40: tone = `E5; 12'd41: tone = `E5; 12'd42: tone = `E5; 12'd43: tone = `E5;
				12'd44: tone = `E5; 12'd45: tone = `E5; 12'd46: tone = `E5; 12'd47: tone = `S;
				12'd48: tone = `C5; 12'd49: tone = `C5; 12'd50: tone = `C5; 12'd51: tone = `C5;
				12'd52: tone = `C5; 12'd53: tone = `C5; 12'd54: tone = `C5; 12'd55: tone = `S;
				12'd56: tone = `B4; 12'd57: tone = `B4; 12'd58: tone = `B4; 12'd59: tone = `B4;
				12'd60: tone = `B4; 12'd61: tone = `B4; 12'd62: tone = `B4; 12'd63: tone = `S;
				12'd64: tone = `A4; 12'd65: tone = `A4; 12'd66: tone = `A4; 12'd67: tone = `A4;
				12'd68: tone = `A4; 12'd69: tone = `A4; 12'd70: tone = `A4; 12'd71: tone = `A4;
				12'd72: tone = `A4; 12'd73: tone = `A4; 12'd74: tone = `A4; 12'd75: tone = `A4;
				12'd76: tone = `A4; 12'd77: tone = `A4; 12'd78: tone = `A4; 12'd79: tone = `S;
				12'd80: tone = `A4; 12'd81: tone = `A4; 12'd82: tone = `A4; 12'd83: tone = `A4;
				12'd84: tone = `A4; 12'd85: tone = `A4; 12'd86: tone = `A4; 12'd87: tone = `S;
				12'd88: tone = `C5; 12'd89: tone = `C5; 12'd90: tone = `C5; 12'd91: tone = `C5;
				12'd92: tone = `C5; 12'd93: tone = `C5; 12'd94: tone = `C5; 12'd95: tone = `S;
				12'd96: tone = `E5; 12'd97: tone = `E5; 12'd98: tone = `E5; 12'd99: tone = `E5;
				12'd100: tone = `E5; 12'd101: tone = `E5; 12'd102: tone = `E5; 12'd103: tone = `E5;
				12'd104: tone = `E5; 12'd105: tone = `E5; 12'd106: tone = `E5; 12'd107: tone = `E5;
				12'd108: tone = `E5; 12'd109: tone = `E5; 12'd110: tone = `E5; 12'd111: tone = `S;
				12'd112: tone = `D5; 12'd113: tone = `D5; 12'd114: tone = `D5; 12'd115: tone = `D5;
				12'd116: tone = `D5; 12'd117: tone = `D5; 12'd118: tone = `D5; 12'd119: tone = `S;
				12'd120: tone = `C5; 12'd121: tone = `C5; 12'd122: tone = `C5; 12'd123: tone = `C5;
				12'd124: tone = `C5; 12'd125: tone = `C5; 12'd126: tone = `C5; 12'd127: tone = `S;
				12'd128: tone = `B4; 12'd129: tone = `B4; 12'd130: tone = `B4; 12'd131: tone = `B4;
				12'd132: tone = `B4; 12'd133: tone = `B4; 12'd134: tone = `B4; 12'd135: tone = `B4;
				12'd136: tone = `B4; 12'd137: tone = `B4; 12'd138: tone = `B4; 12'd139: tone = `B4;
				12'd140: tone = `B4; 12'd141: tone = `B4; 12'd142: tone = `B4; 12'd143: tone = `S;
				12'd144: tone = `B4; 12'd145: tone = `B4; 12'd146: tone = `B4; 12'd147: tone = `B4;
				12'd148: tone = `B4; 12'd149: tone = `B4; 12'd150: tone = `B4; 12'd151: tone = `S;
				12'd152: tone = `C5; 12'd153: tone = `C5; 12'd154: tone = `C5; 12'd155: tone = `C5;
				12'd156: tone = `C5; 12'd157: tone = `C5; 12'd158: tone = `C5; 12'd159: tone = `S;
				12'd160: tone = `D5; 12'd161: tone = `D5; 12'd162: tone = `D5; 12'd163: tone = `D5;
				12'd164: tone = `D5; 12'd165: tone = `D5; 12'd166: tone = `D5; 12'd167: tone = `D5;
				12'd168: tone = `D5; 12'd169: tone = `D5; 12'd170: tone = `D5; 12'd171: tone = `D5;
				12'd172: tone = `D5; 12'd173: tone = `D5; 12'd174: tone = `D5; 12'd175: tone = `S;
				12'd176: tone = `E5; 12'd177: tone = `E5; 12'd178: tone = `E5; 12'd179: tone = `E5;
				12'd180: tone = `E5; 12'd181: tone = `E5; 12'd182: tone = `E5; 12'd183: tone = `E5;
				12'd184: tone = `E5; 12'd185: tone = `E5; 12'd186: tone = `E5; 12'd187: tone = `E5;
				12'd188: tone = `E5; 12'd189: tone = `E5; 12'd190: tone = `E5; 12'd191: tone = `S;
				12'd192: tone = `C5; 12'd193: tone = `C5; 12'd194: tone = `C5; 12'd195: tone = `C5;
				12'd196: tone = `C5; 12'd197: tone = `C5; 12'd198: tone = `C5; 12'd199: tone = `C5;
				12'd200: tone = `C5; 12'd201: tone = `C5; 12'd202: tone = `C5; 12'd203: tone = `C5;
				12'd204: tone = `C5; 12'd205: tone = `C5; 12'd206: tone = `C5; 12'd207: tone = `S;
				12'd208: tone = `A4; 12'd209: tone = `A4; 12'd210: tone = `A4; 12'd211: tone = `A4;
				12'd212: tone = `A4; 12'd213: tone = `A4; 12'd214: tone = `A4; 12'd215: tone = `A4;
				12'd216: tone = `A4; 12'd217: tone = `A4; 12'd218: tone = `A4; 12'd219: tone = `A4;
				12'd220: tone = `A4; 12'd221: tone = `A4; 12'd222: tone = `A4; 12'd223: tone = `S;
				12'd224: tone = `A4; 12'd225: tone = `A4; 12'd226: tone = `A4; 12'd227: tone = `A4;
				12'd228: tone = `A4; 12'd229: tone = `A4; 12'd230: tone = `A4; 12'd231: tone = `A4;
				12'd232: tone = `A4; 12'd233: tone = `A4; 12'd234: tone = `A4; 12'd235: tone = `A4;
				12'd236: tone = `A4; 12'd237: tone = `A4; 12'd238: tone = `A4; 12'd239: tone = `A4;
				12'd240: tone = `A4; 12'd241: tone = `A4; 12'd242: tone = `A4; 12'd243: tone = `A4;
				12'd244: tone = `A4; 12'd245: tone = `A4; 12'd246: tone = `A4; 12'd247: tone = `A4;
				12'd248: tone = `A4; 12'd249: tone = `A4; 12'd250: tone = `A4; 12'd251: tone = `A4;
				12'd252: tone = `A4; 12'd253: tone = `A4; 12'd254: tone = `A4; 12'd255: tone = `S;
				12'd256: tone = `S; 12'd257: tone = `S; 12'd258: tone = `S; 12'd259: tone = `S;
				12'd260: tone = `S; 12'd261: tone = `S; 12'd262: tone = `S; 12'd263: tone = `S;
				12'd264: tone = `D5; 12'd265: tone = `D5; 12'd266: tone = `D5; 12'd267: tone = `D5;
				12'd268: tone = `D5; 12'd269: tone = `D5; 12'd270: tone = `D5; 12'd271: tone = `D5;
				12'd272: tone = `D5; 12'd273: tone = `D5; 12'd274: tone = `D5; 12'd275: tone = `D5;
				12'd276: tone = `D5; 12'd277: tone = `D5; 12'd278: tone = `D5; 12'd279: tone = `S;
				12'd280: tone = `F5; 12'd281: tone = `F5; 12'd282: tone = `F5; 12'd283: tone = `F5;
				12'd284: tone = `F5; 12'd285: tone = `F5; 12'd286: tone = `F5; 12'd287: tone = `S;
				12'd288: tone = `A5; 12'd289: tone = `A5; 12'd290: tone = `A5; 12'd291: tone = `A5;
				12'd292: tone = `A5; 12'd293: tone = `A5; 12'd294: tone = `A5; 12'd295: tone = `A5;
				12'd296: tone = `A5; 12'd297: tone = `A5; 12'd298: tone = `A5; 12'd299: tone = `A5;
				12'd300: tone = `A5; 12'd301: tone = `A5; 12'd302: tone = `A5; 12'd303: tone = `S;
				12'd304: tone = `G5; 12'd305: tone = `G5; 12'd306: tone = `G5; 12'd307: tone = `G5;
				12'd308: tone = `G5; 12'd309: tone = `G5; 12'd310: tone = `G5; 12'd311: tone = `S;
				12'd312: tone = `F5; 12'd313: tone = `F5; 12'd314: tone = `F5; 12'd315: tone = `F5;
				12'd316: tone = `F5; 12'd317: tone = `F5; 12'd318: tone = `F5; 12'd319: tone = `S;
				12'd320: tone = `S; 12'd321: tone = `S; 12'd322: tone = `S; 12'd323: tone = `S;
				12'd324: tone = `S; 12'd325: tone = `S; 12'd326: tone = `S; 12'd327: tone = `S;
				12'd328: tone = `E5; 12'd329: tone = `E5; 12'd330: tone = `E5; 12'd331: tone = `E5;
				12'd332: tone = `E5; 12'd333: tone = `E5; 12'd334: tone = `E5; 12'd335: tone = `E5;
				12'd336: tone = `E5; 12'd337: tone = `E5; 12'd338: tone = `E5; 12'd339: tone = `E5;
				12'd340: tone = `E5; 12'd341: tone = `E5; 12'd342: tone = `E5; 12'd343: tone = `S;
				12'd344: tone = `C5; 12'd345: tone = `C5; 12'd346: tone = `C5; 12'd347: tone = `C5;
				12'd348: tone = `C5; 12'd349: tone = `C5; 12'd350: tone = `C5; 12'd351: tone = `S;
				12'd352: tone = `E5; 12'd353: tone = `E5; 12'd354: tone = `E5; 12'd355: tone = `E5;
				12'd356: tone = `E5; 12'd357: tone = `E5; 12'd358: tone = `E5; 12'd359: tone = `E5;
				12'd360: tone = `E5; 12'd361: tone = `E5; 12'd362: tone = `E5; 12'd363: tone = `E5;
				12'd364: tone = `E5; 12'd365: tone = `E5; 12'd366: tone = `E5; 12'd367: tone = `S;
				12'd368: tone = `D5; 12'd369: tone = `D5; 12'd370: tone = `D5; 12'd371: tone = `D5;
				12'd372: tone = `D5; 12'd373: tone = `D5; 12'd374: tone = `D5; 12'd375: tone = `S;
				12'd376: tone = `C5; 12'd377: tone = `C5; 12'd378: tone = `C5; 12'd379: tone = `C5;
				12'd380: tone = `C5; 12'd381: tone = `C5; 12'd382: tone = `C5; 12'd383: tone = `S;
				12'd384: tone = `B4; 12'd385: tone = `B4; 12'd386: tone = `B4; 12'd387: tone = `B4;
				12'd388: tone = `B4; 12'd389: tone = `B4; 12'd390: tone = `B4; 12'd391: tone = `B4;
				12'd392: tone = `B4; 12'd393: tone = `B4; 12'd394: tone = `B4; 12'd395: tone = `B4;
				12'd396: tone = `B4; 12'd397: tone = `B4; 12'd398: tone = `B4; 12'd399: tone = `S;
				12'd400: tone = `B4; 12'd401: tone = `B4; 12'd402: tone = `B4; 12'd403: tone = `B4;
				12'd404: tone = `B4; 12'd405: tone = `B4; 12'd406: tone = `B4; 12'd407: tone = `S;
				12'd408: tone = `C5; 12'd409: tone = `C5; 12'd410: tone = `C5; 12'd411: tone = `C5;
				12'd412: tone = `C5; 12'd413: tone = `C5; 12'd414: tone = `C5; 12'd415: tone = `S;
				12'd416: tone = `D5; 12'd417: tone = `D5; 12'd418: tone = `D5; 12'd419: tone = `D5;
				12'd420: tone = `D5; 12'd421: tone = `D5; 12'd422: tone = `D5; 12'd423: tone = `D5;
				12'd424: tone = `D5; 12'd425: tone = `D5; 12'd426: tone = `D5; 12'd427: tone = `D5;
				12'd428: tone = `D5; 12'd429: tone = `D5; 12'd430: tone = `D5; 12'd431: tone = `S;
				12'd432: tone = `E5; 12'd433: tone = `E5; 12'd434: tone = `E5; 12'd435: tone = `E5;
				12'd436: tone = `E5; 12'd437: tone = `E5; 12'd438: tone = `E5; 12'd439: tone = `E5;
				12'd440: tone = `E5; 12'd441: tone = `E5; 12'd442: tone = `E5; 12'd443: tone = `E5;
				12'd444: tone = `E5; 12'd445: tone = `E5; 12'd446: tone = `E5; 12'd447: tone = `S;
				12'd448: tone = `C5; 12'd449: tone = `C5; 12'd450: tone = `C5; 12'd451: tone = `C5;
				12'd452: tone = `C5; 12'd453: tone = `C5; 12'd454: tone = `C5; 12'd455: tone = `C5;
				12'd456: tone = `C5; 12'd457: tone = `C5; 12'd458: tone = `C5; 12'd459: tone = `C5;
				12'd460: tone = `C5; 12'd461: tone = `C5; 12'd462: tone = `C5; 12'd463: tone = `S;
				12'd464: tone = `A4; 12'd465: tone = `A4; 12'd466: tone = `A4; 12'd467: tone = `A4;
				12'd468: tone = `A4; 12'd469: tone = `A4; 12'd470: tone = `A4; 12'd471: tone = `A4;
				12'd472: tone = `A4; 12'd473: tone = `A4; 12'd474: tone = `A4; 12'd475: tone = `A4;
				12'd476: tone = `A4; 12'd477: tone = `A4; 12'd478: tone = `A4; 12'd479: tone = `S;
				12'd480: tone = `A4; 12'd481: tone = `A4; 12'd482: tone = `A4; 12'd483: tone = `A4;
				12'd484: tone = `A4; 12'd485: tone = `A4; 12'd486: tone = `A4; 12'd487: tone = `A4;
				12'd488: tone = `A4; 12'd489: tone = `A4; 12'd490: tone = `A4; 12'd491: tone = `A4;
				12'd492: tone = `A4; 12'd493: tone = `A4; 12'd494: tone = `A4; 12'd495: tone = `A4;
				12'd496: tone = `A4; 12'd497: tone = `A4; 12'd498: tone = `A4; 12'd499: tone = `A4;
				12'd500: tone = `A4; 12'd501: tone = `A4; 12'd502: tone = `A4; 12'd503: tone = `A4;
				12'd504: tone = `A4; 12'd505: tone = `A4; 12'd506: tone = `A4; 12'd507: tone = `A4;
				12'd508: tone = `A4; 12'd509: tone = `A4; 12'd510: tone = `A4; 12'd511: tone = `S;
				12'd512: tone = `E5; 12'd513: tone = `E5; 12'd514: tone = `E5; 12'd515: tone = `E5;
				12'd516: tone = `E5; 12'd517: tone = `E5; 12'd518: tone = `E5; 12'd519: tone = `E5;
				12'd520: tone = `E5; 12'd521: tone = `E5; 12'd522: tone = `E5; 12'd523: tone = `E5;
				12'd524: tone = `E5; 12'd525: tone = `E5; 12'd526: tone = `E5; 12'd527: tone = `S;
				12'd528: tone = `B4; 12'd529: tone = `B4; 12'd530: tone = `B4; 12'd531: tone = `B4;
				12'd532: tone = `B4; 12'd533: tone = `B4; 12'd534: tone = `B4; 12'd535: tone = `S;
				12'd536: tone = `C5; 12'd537: tone = `C5; 12'd538: tone = `C5; 12'd539: tone = `C5;
				12'd540: tone = `C5; 12'd541: tone = `C5; 12'd542: tone = `C5; 12'd543: tone = `S;
				12'd544: tone = `D5; 12'd545: tone = `D5; 12'd546: tone = `D5; 12'd547: tone = `D5;
				12'd548: tone = `D5; 12'd549: tone = `D5; 12'd550: tone = `D5; 12'd551: tone = `S;
				12'd552: tone = `E5; 12'd553: tone = `E5; 12'd554: tone = `E5; 12'd555: tone = `E5;
				12'd556: tone = `E5; 12'd557: tone = `E5; 12'd558: tone = `E5; 12'd559: tone = `S;
				12'd560: tone = `C5; 12'd561: tone = `C5; 12'd562: tone = `C5; 12'd563: tone = `C5;
				12'd564: tone = `C5; 12'd565: tone = `C5; 12'd566: tone = `C5; 12'd567: tone = `S;
				12'd568: tone = `B4; 12'd569: tone = `B4; 12'd570: tone = `B4; 12'd571: tone = `B4;
				12'd572: tone = `B4; 12'd573: tone = `B4; 12'd574: tone = `B4; 12'd575: tone = `S;
				12'd576: tone = `A4; 12'd577: tone = `A4; 12'd578: tone = `A4; 12'd579: tone = `A4;
				12'd580: tone = `A4; 12'd581: tone = `A4; 12'd582: tone = `A4; 12'd583: tone = `A4;
				12'd584: tone = `A4; 12'd585: tone = `A4; 12'd586: tone = `A4; 12'd587: tone = `A4;
				12'd588: tone = `A4; 12'd589: tone = `A4; 12'd590: tone = `A4; 12'd591: tone = `S;
				12'd592: tone = `A4; 12'd593: tone = `A4; 12'd594: tone = `A4; 12'd595: tone = `A4;
				12'd596: tone = `A4; 12'd597: tone = `A4; 12'd598: tone = `A4; 12'd599: tone = `S;
				12'd600: tone = `C5; 12'd601: tone = `C5; 12'd602: tone = `C5; 12'd603: tone = `C5;
				12'd604: tone = `C5; 12'd605: tone = `C5; 12'd606: tone = `C5; 12'd607: tone = `S;
				12'd608: tone = `E5; 12'd609: tone = `E5; 12'd610: tone = `E5; 12'd611: tone = `E5;
				12'd612: tone = `E5; 12'd613: tone = `E5; 12'd614: tone = `E5; 12'd615: tone = `E5;
				12'd616: tone = `E5; 12'd617: tone = `E5; 12'd618: tone = `E5; 12'd619: tone = `E5;
				12'd620: tone = `E5; 12'd621: tone = `E5; 12'd622: tone = `E5; 12'd623: tone = `S;
				12'd624: tone = `D5; 12'd625: tone = `D5; 12'd626: tone = `D5; 12'd627: tone = `D5;
				12'd628: tone = `D5; 12'd629: tone = `D5; 12'd630: tone = `D5; 12'd631: tone = `S;
				12'd632: tone = `C5; 12'd633: tone = `C5; 12'd634: tone = `C5; 12'd635: tone = `C5;
				12'd636: tone = `C5; 12'd637: tone = `C5; 12'd638: tone = `C5; 12'd639: tone = `S;
				12'd640: tone = `B4; 12'd641: tone = `B4; 12'd642: tone = `B4; 12'd643: tone = `B4;
				12'd644: tone = `B4; 12'd645: tone = `B4; 12'd646: tone = `B4; 12'd647: tone = `B4;
				12'd648: tone = `B4; 12'd649: tone = `B4; 12'd650: tone = `B4; 12'd651: tone = `B4;
				12'd652: tone = `B4; 12'd653: tone = `B4; 12'd654: tone = `B4; 12'd655: tone = `S;
				12'd656: tone = `B4; 12'd657: tone = `B4; 12'd658: tone = `B4; 12'd659: tone = `B4;
				12'd660: tone = `B4; 12'd661: tone = `B4; 12'd662: tone = `B4; 12'd663: tone = `S;
				12'd664: tone = `C5; 12'd665: tone = `C5; 12'd666: tone = `C5; 12'd667: tone = `C5;
				12'd668: tone = `C5; 12'd669: tone = `C5; 12'd670: tone = `C5; 12'd671: tone = `S;
				12'd672: tone = `D5; 12'd673: tone = `D5; 12'd674: tone = `D5; 12'd675: tone = `D5;
				12'd676: tone = `D5; 12'd677: tone = `D5; 12'd678: tone = `D5; 12'd679: tone = `D5;
				12'd680: tone = `D5; 12'd681: tone = `D5; 12'd682: tone = `D5; 12'd683: tone = `D5;
				12'd684: tone = `D5; 12'd685: tone = `D5; 12'd686: tone = `D5; 12'd687: tone = `S;
				12'd688: tone = `E5; 12'd689: tone = `E5; 12'd690: tone = `E5; 12'd691: tone = `E5;
				12'd692: tone = `E5; 12'd693: tone = `E5; 12'd694: tone = `E5; 12'd695: tone = `E5;
				12'd696: tone = `E5; 12'd697: tone = `E5; 12'd698: tone = `E5; 12'd699: tone = `E5;
				12'd700: tone = `E5; 12'd701: tone = `E5; 12'd702: tone = `E5; 12'd703: tone = `S;
				12'd704: tone = `C5; 12'd705: tone = `C5; 12'd706: tone = `C5; 12'd707: tone = `C5;
				12'd708: tone = `C5; 12'd709: tone = `C5; 12'd710: tone = `C5; 12'd711: tone = `C5;
				12'd712: tone = `C5; 12'd713: tone = `C5; 12'd714: tone = `C5; 12'd715: tone = `C5;
				12'd716: tone = `C5; 12'd717: tone = `C5; 12'd718: tone = `C5; 12'd719: tone = `S;
				12'd720: tone = `A4; 12'd721: tone = `A4; 12'd722: tone = `A4; 12'd723: tone = `A4;
				12'd724: tone = `A4; 12'd725: tone = `A4; 12'd726: tone = `A4; 12'd727: tone = `A4;
				12'd728: tone = `A4; 12'd729: tone = `A4; 12'd730: tone = `A4; 12'd731: tone = `A4;
				12'd732: tone = `A4; 12'd733: tone = `A4; 12'd734: tone = `A4; 12'd735: tone = `S;
				12'd736: tone = `A4; 12'd737: tone = `A4; 12'd738: tone = `A4; 12'd739: tone = `A4;
				12'd740: tone = `A4; 12'd741: tone = `A4; 12'd742: tone = `A4; 12'd743: tone = `A4;
				12'd744: tone = `A4; 12'd745: tone = `A4; 12'd746: tone = `A4; 12'd747: tone = `A4;
				12'd748: tone = `A4; 12'd749: tone = `A4; 12'd750: tone = `A4; 12'd751: tone = `A4;
				12'd752: tone = `A4; 12'd753: tone = `A4; 12'd754: tone = `A4; 12'd755: tone = `A4;
				12'd756: tone = `A4; 12'd757: tone = `A4; 12'd758: tone = `A4; 12'd759: tone = `A4;
				12'd760: tone = `A4; 12'd761: tone = `A4; 12'd762: tone = `A4; 12'd763: tone = `A4;
				12'd764: tone = `A4; 12'd765: tone = `A4; 12'd766: tone = `A4; 12'd767: tone = `S;
				12'd768: tone = `S; 12'd769: tone = `S; 12'd770: tone = `S; 12'd771: tone = `S;
				12'd772: tone = `S; 12'd773: tone = `S; 12'd774: tone = `S; 12'd775: tone = `S;
				12'd776: tone = `D5; 12'd777: tone = `D5; 12'd778: tone = `D5; 12'd779: tone = `D5;
				12'd780: tone = `D5; 12'd781: tone = `D5; 12'd782: tone = `D5; 12'd783: tone = `D5;
				12'd784: tone = `D5; 12'd785: tone = `D5; 12'd786: tone = `D5; 12'd787: tone = `D5;
				12'd788: tone = `D5; 12'd789: tone = `D5; 12'd790: tone = `D5; 12'd791: tone = `S;
				12'd792: tone = `F5; 12'd793: tone = `F5; 12'd794: tone = `F5; 12'd795: tone = `F5;
				12'd796: tone = `F5; 12'd797: tone = `F5; 12'd798: tone = `F5; 12'd799: tone = `S;
				12'd800: tone = `A5; 12'd801: tone = `A5; 12'd802: tone = `A5; 12'd803: tone = `A5;
				12'd804: tone = `A5; 12'd805: tone = `A5; 12'd806: tone = `A5; 12'd807: tone = `A5;
				12'd808: tone = `A5; 12'd809: tone = `A5; 12'd810: tone = `A5; 12'd811: tone = `A5;
				12'd812: tone = `A5; 12'd813: tone = `A5; 12'd814: tone = `A5; 12'd815: tone = `S;
				12'd816: tone = `G5; 12'd817: tone = `G5; 12'd818: tone = `G5; 12'd819: tone = `G5;
				12'd820: tone = `G5; 12'd821: tone = `G5; 12'd822: tone = `G5; 12'd823: tone = `S;
				12'd824: tone = `F5; 12'd825: tone = `F5; 12'd826: tone = `F5; 12'd827: tone = `F5;
				12'd828: tone = `F5; 12'd829: tone = `F5; 12'd830: tone = `F5; 12'd831: tone = `S;
				12'd832: tone = `S; 12'd833: tone = `S; 12'd834: tone = `S; 12'd835: tone = `S;
				12'd836: tone = `S; 12'd837: tone = `S; 12'd838: tone = `S; 12'd839: tone = `S;
				12'd840: tone = `E5; 12'd841: tone = `E5; 12'd842: tone = `E5; 12'd843: tone = `E5;
				12'd844: tone = `E5; 12'd845: tone = `E5; 12'd846: tone = `E5; 12'd847: tone = `E5;
				12'd848: tone = `E5; 12'd849: tone = `E5; 12'd850: tone = `E5; 12'd851: tone = `E5;
				12'd852: tone = `E5; 12'd853: tone = `E5; 12'd854: tone = `E5; 12'd855: tone = `S;
				12'd856: tone = `C5; 12'd857: tone = `C5; 12'd858: tone = `C5; 12'd859: tone = `C5;
				12'd860: tone = `C5; 12'd861: tone = `C5; 12'd862: tone = `C5; 12'd863: tone = `S;
				12'd864: tone = `E5; 12'd865: tone = `E5; 12'd866: tone = `E5; 12'd867: tone = `E5;
				12'd868: tone = `E5; 12'd869: tone = `E5; 12'd870: tone = `E5; 12'd871: tone = `E5;
				12'd872: tone = `E5; 12'd873: tone = `E5; 12'd874: tone = `E5; 12'd875: tone = `E5;
				12'd876: tone = `E5; 12'd877: tone = `E5; 12'd878: tone = `E5; 12'd879: tone = `S;
				12'd880: tone = `D5; 12'd881: tone = `D5; 12'd882: tone = `D5; 12'd883: tone = `D5;
				12'd884: tone = `D5; 12'd885: tone = `D5; 12'd886: tone = `D5; 12'd887: tone = `S;
				12'd888: tone = `C5; 12'd889: tone = `C5; 12'd890: tone = `C5; 12'd891: tone = `C5;
				12'd892: tone = `C5; 12'd893: tone = `C5; 12'd894: tone = `C5; 12'd895: tone = `S;
				12'd896: tone = `B4; 12'd897: tone = `B4; 12'd898: tone = `B4; 12'd899: tone = `B4;
				12'd900: tone = `B4; 12'd901: tone = `B4; 12'd902: tone = `B4; 12'd903: tone = `B4;
				12'd904: tone = `B4; 12'd905: tone = `B4; 12'd906: tone = `B4; 12'd907: tone = `B4;
				12'd908: tone = `B4; 12'd909: tone = `B4; 12'd910: tone = `B4; 12'd911: tone = `S;
				12'd912: tone = `B4; 12'd913: tone = `B4; 12'd914: tone = `B4; 12'd915: tone = `B4;
				12'd916: tone = `B4; 12'd917: tone = `B4; 12'd918: tone = `B4; 12'd919: tone = `S;
				12'd920: tone = `C5; 12'd921: tone = `C5; 12'd922: tone = `C5; 12'd923: tone = `C5;
				12'd924: tone = `C5; 12'd925: tone = `C5; 12'd926: tone = `C5; 12'd927: tone = `S;
				12'd928: tone = `D5; 12'd929: tone = `D5; 12'd930: tone = `D5; 12'd931: tone = `D5;
				12'd932: tone = `D5; 12'd933: tone = `D5; 12'd934: tone = `D5; 12'd935: tone = `D5;
				12'd936: tone = `D5; 12'd937: tone = `D5; 12'd938: tone = `D5; 12'd939: tone = `D5;
				12'd940: tone = `D5; 12'd941: tone = `D5; 12'd942: tone = `D5; 12'd943: tone = `S;
				12'd944: tone = `E5; 12'd945: tone = `E5; 12'd946: tone = `E5; 12'd947: tone = `E5;
				12'd948: tone = `E5; 12'd949: tone = `E5; 12'd950: tone = `E5; 12'd951: tone = `E5;
				12'd952: tone = `E5; 12'd953: tone = `E5; 12'd954: tone = `E5; 12'd955: tone = `E5;
				12'd956: tone = `E5; 12'd957: tone = `E5; 12'd958: tone = `E5; 12'd959: tone = `S;
				12'd960: tone = `C5; 12'd961: tone = `C5; 12'd962: tone = `C5; 12'd963: tone = `C5;
				12'd964: tone = `C5; 12'd965: tone = `C5; 12'd966: tone = `C5; 12'd967: tone = `C5;
				12'd968: tone = `C5; 12'd969: tone = `C5; 12'd970: tone = `C5; 12'd971: tone = `C5;
				12'd972: tone = `C5; 12'd973: tone = `C5; 12'd974: tone = `C5; 12'd975: tone = `S;
				12'd976: tone = `A4; 12'd977: tone = `A4; 12'd978: tone = `A4; 12'd979: tone = `A4;
				12'd980: tone = `A4; 12'd981: tone = `A4; 12'd982: tone = `A4; 12'd983: tone = `A4;
				12'd984: tone = `A4; 12'd985: tone = `A4; 12'd986: tone = `A4; 12'd987: tone = `A4;
				12'd988: tone = `A4; 12'd989: tone = `A4; 12'd990: tone = `A4; 12'd991: tone = `S;
				12'd992: tone = `A4; 12'd993: tone = `A4; 12'd994: tone = `A4; 12'd995: tone = `A4;
				12'd996: tone = `A4; 12'd997: tone = `A4; 12'd998: tone = `A4; 12'd999: tone = `A4;
				12'd1000: tone = `A4; 12'd1001: tone = `A4; 12'd1002: tone = `A4; 12'd1003: tone = `A4;
				12'd1004: tone = `A4; 12'd1005: tone = `A4; 12'd1006: tone = `A4; 12'd1007: tone = `A4;
				12'd1008: tone = `A4; 12'd1009: tone = `A4; 12'd1010: tone = `A4; 12'd1011: tone = `A4;
				12'd1012: tone = `A4; 12'd1013: tone = `A4; 12'd1014: tone = `A4; 12'd1015: tone = `A4;
				12'd1016: tone = `A4; 12'd1017: tone = `A4; 12'd1018: tone = `A4; 12'd1019: tone = `A4;
				12'd1020: tone = `A4; 12'd1021: tone = `A4; 12'd1022: tone = `A4; 12'd1023: tone = `S;
				12'd1024: tone = `E4; 12'd1025: tone = `E4; 12'd1026: tone = `E4; 12'd1027: tone = `E4;
				12'd1028: tone = `E4; 12'd1029: tone = `E4; 12'd1030: tone = `E4; 12'd1031: tone = `E4;
				12'd1032: tone = `E4; 12'd1033: tone = `E4; 12'd1034: tone = `E4; 12'd1035: tone = `E4;
				12'd1036: tone = `E4; 12'd1037: tone = `E4; 12'd1038: tone = `E4; 12'd1039: tone = `E4;
				12'd1040: tone = `E4; 12'd1041: tone = `E4; 12'd1042: tone = `E4; 12'd1043: tone = `E4;
				12'd1044: tone = `E4; 12'd1045: tone = `E4; 12'd1046: tone = `E4; 12'd1047: tone = `E4;
				12'd1048: tone = `E4; 12'd1049: tone = `E4; 12'd1050: tone = `E4; 12'd1051: tone = `E4;
				12'd1052: tone = `E4; 12'd1053: tone = `E4; 12'd1054: tone = `E4; 12'd1055: tone = `S;
				12'd1056: tone = `C4; 12'd1057: tone = `C4; 12'd1058: tone = `C4; 12'd1059: tone = `C4;
				12'd1060: tone = `C4; 12'd1061: tone = `C4; 12'd1062: tone = `C4; 12'd1063: tone = `C4;
				12'd1064: tone = `C4; 12'd1065: tone = `C4; 12'd1066: tone = `C4; 12'd1067: tone = `C4;
				12'd1068: tone = `C4; 12'd1069: tone = `C4; 12'd1070: tone = `C4; 12'd1071: tone = `C4;
				12'd1072: tone = `C4; 12'd1073: tone = `C4; 12'd1074: tone = `C4; 12'd1075: tone = `C4;
				12'd1076: tone = `C4; 12'd1077: tone = `C4; 12'd1078: tone = `C4; 12'd1079: tone = `C4;
				12'd1080: tone = `C4; 12'd1081: tone = `C4; 12'd1082: tone = `C4; 12'd1083: tone = `C4;
				12'd1084: tone = `C4; 12'd1085: tone = `C4; 12'd1086: tone = `C4; 12'd1087: tone = `S;
				12'd1088: tone = `D4; 12'd1089: tone = `D4; 12'd1090: tone = `D4; 12'd1091: tone = `D4;
				12'd1092: tone = `D4; 12'd1093: tone = `D4; 12'd1094: tone = `D4; 12'd1095: tone = `D4;
				12'd1096: tone = `D4; 12'd1097: tone = `D4; 12'd1098: tone = `D4; 12'd1099: tone = `D4;
				12'd1100: tone = `D4; 12'd1101: tone = `D4; 12'd1102: tone = `D4; 12'd1103: tone = `D4;
				12'd1104: tone = `D4; 12'd1105: tone = `D4; 12'd1106: tone = `D4; 12'd1107: tone = `D4;
				12'd1108: tone = `D4; 12'd1109: tone = `D4; 12'd1110: tone = `D4; 12'd1111: tone = `D4;
				12'd1112: tone = `D4; 12'd1113: tone = `D4; 12'd1114: tone = `D4; 12'd1115: tone = `D4;
				12'd1116: tone = `D4; 12'd1117: tone = `D4; 12'd1118: tone = `D4; 12'd1119: tone = `S;
				12'd1120: tone = `B3; 12'd1121: tone = `B3; 12'd1122: tone = `B3; 12'd1123: tone = `B3;
				12'd1124: tone = `B3; 12'd1125: tone = `B3; 12'd1126: tone = `B3; 12'd1127: tone = `B3;
				12'd1128: tone = `B3; 12'd1129: tone = `B3; 12'd1130: tone = `B3; 12'd1131: tone = `B3;
				12'd1132: tone = `B3; 12'd1133: tone = `B3; 12'd1134: tone = `B3; 12'd1135: tone = `B3;
				12'd1136: tone = `B3; 12'd1137: tone = `B3; 12'd1138: tone = `B3; 12'd1139: tone = `B3;
				12'd1140: tone = `B3; 12'd1141: tone = `B3; 12'd1142: tone = `B3; 12'd1143: tone = `B3;
				12'd1144: tone = `B3; 12'd1145: tone = `B3; 12'd1146: tone = `B3; 12'd1147: tone = `B3;
				12'd1148: tone = `B3; 12'd1149: tone = `B3; 12'd1150: tone = `B3; 12'd1151: tone = `S;
				12'd1152: tone = `C4; 12'd1153: tone = `C4; 12'd1154: tone = `C4; 12'd1155: tone = `C4;
				12'd1156: tone = `C4; 12'd1157: tone = `C4; 12'd1158: tone = `C4; 12'd1159: tone = `C4;
				12'd1160: tone = `C4; 12'd1161: tone = `C4; 12'd1162: tone = `C4; 12'd1163: tone = `C4;
				12'd1164: tone = `C4; 12'd1165: tone = `C4; 12'd1166: tone = `C4; 12'd1167: tone = `C4;
				12'd1168: tone = `C4; 12'd1169: tone = `C4; 12'd1170: tone = `C4; 12'd1171: tone = `C4;
				12'd1172: tone = `C4; 12'd1173: tone = `C4; 12'd1174: tone = `C4; 12'd1175: tone = `C4;
				12'd1176: tone = `C4; 12'd1177: tone = `C4; 12'd1178: tone = `C4; 12'd1179: tone = `C4;
				12'd1180: tone = `C4; 12'd1181: tone = `C4; 12'd1182: tone = `C4; 12'd1183: tone = `S;
				12'd1184: tone = `A3; 12'd1185: tone = `A3; 12'd1186: tone = `A3; 12'd1187: tone = `A3;
				12'd1188: tone = `A3; 12'd1189: tone = `A3; 12'd1190: tone = `A3; 12'd1191: tone = `A3;
				12'd1192: tone = `A3; 12'd1193: tone = `A3; 12'd1194: tone = `A3; 12'd1195: tone = `A3;
				12'd1196: tone = `A3; 12'd1197: tone = `A3; 12'd1198: tone = `A3; 12'd1199: tone = `A3;
				12'd1200: tone = `A3; 12'd1201: tone = `A3; 12'd1202: tone = `A3; 12'd1203: tone = `A3;
				12'd1204: tone = `A3; 12'd1205: tone = `A3; 12'd1206: tone = `A3; 12'd1207: tone = `A3;
				12'd1208: tone = `A3; 12'd1209: tone = `A3; 12'd1210: tone = `A3; 12'd1211: tone = `A3;
				12'd1212: tone = `A3; 12'd1213: tone = `A3; 12'd1214: tone = `A3; 12'd1215: tone = `S;
				12'd1216: tone = `Gs3; 12'd1217: tone = `Gs3; 12'd1218: tone = `Gs3; 12'd1219: tone = `Gs3;
				12'd1220: tone = `Gs3; 12'd1221: tone = `Gs3; 12'd1222: tone = `Gs3; 12'd1223: tone = `Gs3;
				12'd1224: tone = `Gs3; 12'd1225: tone = `Gs3; 12'd1226: tone = `Gs3; 12'd1227: tone = `Gs3;
				12'd1228: tone = `Gs3; 12'd1229: tone = `Gs3; 12'd1230: tone = `Gs3; 12'd1231: tone = `Gs3;
				12'd1232: tone = `Gs3; 12'd1233: tone = `Gs3; 12'd1234: tone = `Gs3; 12'd1235: tone = `Gs3;
				12'd1236: tone = `Gs3; 12'd1237: tone = `Gs3; 12'd1238: tone = `Gs3; 12'd1239: tone = `Gs3;
				12'd1240: tone = `Gs3; 12'd1241: tone = `Gs3; 12'd1242: tone = `Gs3; 12'd1243: tone = `Gs3;
				12'd1244: tone = `Gs3; 12'd1245: tone = `Gs3; 12'd1246: tone = `Gs3; 12'd1247: tone = `S;
				12'd1248: tone = `B3; 12'd1249: tone = `B3; 12'd1250: tone = `B3; 12'd1251: tone = `B3;
				12'd1252: tone = `B3; 12'd1253: tone = `B3; 12'd1254: tone = `B3; 12'd1255: tone = `B3;
				12'd1256: tone = `B3; 12'd1257: tone = `B3; 12'd1258: tone = `B3; 12'd1259: tone = `B3;
				12'd1260: tone = `B3; 12'd1261: tone = `B3; 12'd1262: tone = `B3; 12'd1263: tone = `B3;
				12'd1264: tone = `B3; 12'd1265: tone = `B3; 12'd1266: tone = `B3; 12'd1267: tone = `B3;
				12'd1268: tone = `B3; 12'd1269: tone = `B3; 12'd1270: tone = `B3; 12'd1271: tone = `B3;
				12'd1272: tone = `B3; 12'd1273: tone = `B3; 12'd1274: tone = `B3; 12'd1275: tone = `B3;
				12'd1276: tone = `B3; 12'd1277: tone = `B3; 12'd1278: tone = `B3; 12'd1279: tone = `S;
				12'd1280: tone = `E4; 12'd1281: tone = `E4; 12'd1282: tone = `E4; 12'd1283: tone = `E4;
				12'd1284: tone = `E4; 12'd1285: tone = `E4; 12'd1286: tone = `E4; 12'd1287: tone = `E4;
				12'd1288: tone = `E4; 12'd1289: tone = `E4; 12'd1290: tone = `E4; 12'd1291: tone = `E4;
				12'd1292: tone = `E4; 12'd1293: tone = `E4; 12'd1294: tone = `E4; 12'd1295: tone = `E4;
				12'd1296: tone = `E4; 12'd1297: tone = `E4; 12'd1298: tone = `E4; 12'd1299: tone = `E4;
				12'd1300: tone = `E4; 12'd1301: tone = `E4; 12'd1302: tone = `E4; 12'd1303: tone = `E4;
				12'd1304: tone = `E4; 12'd1305: tone = `E4; 12'd1306: tone = `E4; 12'd1307: tone = `E4;
				12'd1308: tone = `E4; 12'd1309: tone = `E4; 12'd1310: tone = `E4; 12'd1311: tone = `S;
				12'd1312: tone = `C4; 12'd1313: tone = `C4; 12'd1314: tone = `C4; 12'd1315: tone = `C4;
				12'd1316: tone = `C4; 12'd1317: tone = `C4; 12'd1318: tone = `C4; 12'd1319: tone = `C4;
				12'd1320: tone = `C4; 12'd1321: tone = `C4; 12'd1322: tone = `C4; 12'd1323: tone = `C4;
				12'd1324: tone = `C4; 12'd1325: tone = `C4; 12'd1326: tone = `C4; 12'd1327: tone = `C4;
				12'd1328: tone = `C4; 12'd1329: tone = `C4; 12'd1330: tone = `C4; 12'd1331: tone = `C4;
				12'd1332: tone = `C4; 12'd1333: tone = `C4; 12'd1334: tone = `C4; 12'd1335: tone = `C4;
				12'd1336: tone = `C4; 12'd1337: tone = `C4; 12'd1338: tone = `C4; 12'd1339: tone = `C4;
				12'd1340: tone = `C4; 12'd1341: tone = `C4; 12'd1342: tone = `C4; 12'd1343: tone = `S;
				12'd1344: tone = `D4; 12'd1345: tone = `D4; 12'd1346: tone = `D4; 12'd1347: tone = `D4;
				12'd1348: tone = `D4; 12'd1349: tone = `D4; 12'd1350: tone = `D4; 12'd1351: tone = `D4;
				12'd1352: tone = `D4; 12'd1353: tone = `D4; 12'd1354: tone = `D4; 12'd1355: tone = `D4;
				12'd1356: tone = `D4; 12'd1357: tone = `D4; 12'd1358: tone = `D4; 12'd1359: tone = `D4;
				12'd1360: tone = `D4; 12'd1361: tone = `D4; 12'd1362: tone = `D4; 12'd1363: tone = `D4;
				12'd1364: tone = `D4; 12'd1365: tone = `D4; 12'd1366: tone = `D4; 12'd1367: tone = `D4;
				12'd1368: tone = `D4; 12'd1369: tone = `D4; 12'd1370: tone = `D4; 12'd1371: tone = `D4;
				12'd1372: tone = `D4; 12'd1373: tone = `D4; 12'd1374: tone = `D4; 12'd1375: tone = `S;
				12'd1376: tone = `B3; 12'd1377: tone = `B3; 12'd1378: tone = `B3; 12'd1379: tone = `B3;
				12'd1380: tone = `B3; 12'd1381: tone = `B3; 12'd1382: tone = `B3; 12'd1383: tone = `B3;
				12'd1384: tone = `B3; 12'd1385: tone = `B3; 12'd1386: tone = `B3; 12'd1387: tone = `B3;
				12'd1388: tone = `B3; 12'd1389: tone = `B3; 12'd1390: tone = `B3; 12'd1391: tone = `B3;
				12'd1392: tone = `B3; 12'd1393: tone = `B3; 12'd1394: tone = `B3; 12'd1395: tone = `B3;
				12'd1396: tone = `B3; 12'd1397: tone = `B3; 12'd1398: tone = `B3; 12'd1399: tone = `B3;
				12'd1400: tone = `B3; 12'd1401: tone = `B3; 12'd1402: tone = `B3; 12'd1403: tone = `B3;
				12'd1404: tone = `B3; 12'd1405: tone = `B3; 12'd1406: tone = `B3; 12'd1407: tone = `S;
				12'd1408: tone = `C4; 12'd1409: tone = `C4; 12'd1410: tone = `C4; 12'd1411: tone = `C4;
				12'd1412: tone = `C4; 12'd1413: tone = `C4; 12'd1414: tone = `C4; 12'd1415: tone = `C4;
				12'd1416: tone = `C4; 12'd1417: tone = `C4; 12'd1418: tone = `C4; 12'd1419: tone = `C4;
				12'd1420: tone = `C4; 12'd1421: tone = `C4; 12'd1422: tone = `C4; 12'd1423: tone = `S;
				12'd1424: tone = `E4; 12'd1425: tone = `E4; 12'd1426: tone = `E4; 12'd1427: tone = `E4;
				12'd1428: tone = `E4; 12'd1429: tone = `E4; 12'd1430: tone = `E4; 12'd1431: tone = `E4;
				12'd1432: tone = `E4; 12'd1433: tone = `E4; 12'd1434: tone = `E4; 12'd1435: tone = `E4;
				12'd1436: tone = `E4; 12'd1437: tone = `E4; 12'd1438: tone = `E4; 12'd1439: tone = `S;
				12'd1440: tone = `A4; 12'd1441: tone = `A4; 12'd1442: tone = `A4; 12'd1443: tone = `A4;
				12'd1444: tone = `A4; 12'd1445: tone = `A4; 12'd1446: tone = `A4; 12'd1447: tone = `A4;
				12'd1448: tone = `A4; 12'd1449: tone = `A4; 12'd1450: tone = `A4; 12'd1451: tone = `A4;
				12'd1452: tone = `A4; 12'd1453: tone = `A4; 12'd1454: tone = `A4; 12'd1455: tone = `S;
				12'd1456: tone = `A4; 12'd1457: tone = `A4; 12'd1458: tone = `A4; 12'd1459: tone = `A4;
				12'd1460: tone = `A4; 12'd1461: tone = `A4; 12'd1462: tone = `A4; 12'd1463: tone = `A4;
				12'd1464: tone = `A4; 12'd1465: tone = `A4; 12'd1466: tone = `A4; 12'd1467: tone = `A4;
				12'd1468: tone = `A4; 12'd1469: tone = `A4; 12'd1470: tone = `A4; 12'd1471: tone = `S;
				12'd1472: tone = `Gs4; 12'd1473: tone = `Gs4; 12'd1474: tone = `Gs4; 12'd1475: tone = `Gs4;
				12'd1476: tone = `Gs4; 12'd1477: tone = `Gs4; 12'd1478: tone = `Gs4; 12'd1479: tone = `Gs4;
				12'd1480: tone = `Gs4; 12'd1481: tone = `Gs4; 12'd1482: tone = `Gs4; 12'd1483: tone = `Gs4;
				12'd1484: tone = `Gs4; 12'd1485: tone = `Gs4; 12'd1486: tone = `Gs4; 12'd1487: tone = `Gs4;
				12'd1488: tone = `Gs4; 12'd1489: tone = `Gs4; 12'd1490: tone = `Gs4; 12'd1491: tone = `Gs4;
				12'd1492: tone = `Gs4; 12'd1493: tone = `Gs4; 12'd1494: tone = `Gs4; 12'd1495: tone = `Gs4;
				12'd1496: tone = `Gs4; 12'd1497: tone = `Gs4; 12'd1498: tone = `Gs4; 12'd1499: tone = `Gs4;
				12'd1500: tone = `Gs4; 12'd1501: tone = `Gs4; 12'd1502: tone = `Gs4; 12'd1503: tone = `Gs4;
				12'd1504: tone = `Gs4; 12'd1505: tone = `Gs4; 12'd1506: tone = `Gs4; 12'd1507: tone = `Gs4;
				12'd1508: tone = `Gs4; 12'd1509: tone = `Gs4; 12'd1510: tone = `Gs4; 12'd1511: tone = `Gs4;
				12'd1512: tone = `Gs4; 12'd1513: tone = `Gs4; 12'd1514: tone = `Gs4; 12'd1515: tone = `Gs4;
				12'd1516: tone = `Gs4; 12'd1517: tone = `Gs4; 12'd1518: tone = `Gs4; 12'd1519: tone = `Gs4;
				12'd1520: tone = `Gs4; 12'd1521: tone = `Gs4; 12'd1522: tone = `Gs4; 12'd1523: tone = `Gs4;
				12'd1524: tone = `Gs4; 12'd1525: tone = `Gs4; 12'd1526: tone = `Gs4; 12'd1527: tone = `Gs4;
				12'd1528: tone = `Gs4; 12'd1529: tone = `Gs4; 12'd1530: tone = `Gs4; 12'd1531: tone = `Gs4;
				12'd1532: tone = `Gs4; 12'd1533: tone = `Gs4; 12'd1534: tone = `Gs4; 12'd1535: tone = `S;
				12'd1536: tone = `E5; 12'd1537: tone = `E5; 12'd1538: tone = `E5; 12'd1539: tone = `E5;
				12'd1540: tone = `E5; 12'd1541: tone = `E5; 12'd1542: tone = `E5; 12'd1543: tone = `E5;
				12'd1544: tone = `E5; 12'd1545: tone = `E5; 12'd1546: tone = `E5; 12'd1547: tone = `E5;
				12'd1548: tone = `E5; 12'd1549: tone = `E5; 12'd1550: tone = `E5; 12'd1551: tone = `S;
				12'd1552: tone = `B4; 12'd1553: tone = `B4; 12'd1554: tone = `B4; 12'd1555: tone = `B4;
				12'd1556: tone = `B4; 12'd1557: tone = `B4; 12'd1558: tone = `B4; 12'd1559: tone = `S;
				12'd1560: tone = `C5; 12'd1561: tone = `C5; 12'd1562: tone = `C5; 12'd1563: tone = `C5;
				12'd1564: tone = `C5; 12'd1565: tone = `C5; 12'd1566: tone = `C5; 12'd1567: tone = `S;
				12'd1568: tone = `D5; 12'd1569: tone = `D5; 12'd1570: tone = `D5; 12'd1571: tone = `D5;
				12'd1572: tone = `D5; 12'd1573: tone = `D5; 12'd1574: tone = `D5; 12'd1575: tone = `S;
				12'd1576: tone = `E5; 12'd1577: tone = `E5; 12'd1578: tone = `E5; 12'd1579: tone = `E5;
				12'd1580: tone = `E5; 12'd1581: tone = `E5; 12'd1582: tone = `E5; 12'd1583: tone = `S;
				12'd1584: tone = `C5; 12'd1585: tone = `C5; 12'd1586: tone = `C5; 12'd1587: tone = `C5;
				12'd1588: tone = `C5; 12'd1589: tone = `C5; 12'd1590: tone = `C5; 12'd1591: tone = `S;
				12'd1592: tone = `B4; 12'd1593: tone = `B4; 12'd1594: tone = `B4; 12'd1595: tone = `B4;
				12'd1596: tone = `B4; 12'd1597: tone = `B4; 12'd1598: tone = `B4; 12'd1599: tone = `S;
				12'd1600: tone = `A4; 12'd1601: tone = `A4; 12'd1602: tone = `A4; 12'd1603: tone = `A4;
				12'd1604: tone = `A4; 12'd1605: tone = `A4; 12'd1606: tone = `A4; 12'd1607: tone = `A4;
				12'd1608: tone = `A4; 12'd1609: tone = `A4; 12'd1610: tone = `A4; 12'd1611: tone = `A4;
				12'd1612: tone = `A4; 12'd1613: tone = `A4; 12'd1614: tone = `A4; 12'd1615: tone = `S;
				12'd1616: tone = `A4; 12'd1617: tone = `A4; 12'd1618: tone = `A4; 12'd1619: tone = `A4;
				12'd1620: tone = `A4; 12'd1621: tone = `A4; 12'd1622: tone = `A4; 12'd1623: tone = `S;
				12'd1624: tone = `C5; 12'd1625: tone = `C5; 12'd1626: tone = `C5; 12'd1627: tone = `C5;
				12'd1628: tone = `C5; 12'd1629: tone = `C5; 12'd1630: tone = `C5; 12'd1631: tone = `S;
				12'd1632: tone = `E5; 12'd1633: tone = `E5; 12'd1634: tone = `E5; 12'd1635: tone = `E5;
				12'd1636: tone = `E5; 12'd1637: tone = `E5; 12'd1638: tone = `E5; 12'd1639: tone = `E5;
				12'd1640: tone = `E5; 12'd1641: tone = `E5; 12'd1642: tone = `E5; 12'd1643: tone = `E5;
				12'd1644: tone = `E5; 12'd1645: tone = `E5; 12'd1646: tone = `E5; 12'd1647: tone = `S;
				12'd1648: tone = `D5; 12'd1649: tone = `D5; 12'd1650: tone = `D5; 12'd1651: tone = `D5;
				12'd1652: tone = `D5; 12'd1653: tone = `D5; 12'd1654: tone = `D5; 12'd1655: tone = `S;
				12'd1656: tone = `C5; 12'd1657: tone = `C5; 12'd1658: tone = `C5; 12'd1659: tone = `C5;
				12'd1660: tone = `C5; 12'd1661: tone = `C5; 12'd1662: tone = `C5; 12'd1663: tone = `S;
				12'd1664: tone = `B4; 12'd1665: tone = `B4; 12'd1666: tone = `B4; 12'd1667: tone = `B4;
				12'd1668: tone = `B4; 12'd1669: tone = `B4; 12'd1670: tone = `B4; 12'd1671: tone = `B4;
				12'd1672: tone = `B4; 12'd1673: tone = `B4; 12'd1674: tone = `B4; 12'd1675: tone = `B4;
				12'd1676: tone = `B4; 12'd1677: tone = `B4; 12'd1678: tone = `B4; 12'd1679: tone = `S;
				12'd1680: tone = `B4; 12'd1681: tone = `B4; 12'd1682: tone = `B4; 12'd1683: tone = `B4;
				12'd1684: tone = `B4; 12'd1685: tone = `B4; 12'd1686: tone = `B4; 12'd1687: tone = `S;
				12'd1688: tone = `C5; 12'd1689: tone = `C5; 12'd1690: tone = `C5; 12'd1691: tone = `C5;
				12'd1692: tone = `C5; 12'd1693: tone = `C5; 12'd1694: tone = `C5; 12'd1695: tone = `S;
				12'd1696: tone = `D5; 12'd1697: tone = `D5; 12'd1698: tone = `D5; 12'd1699: tone = `D5;
				12'd1700: tone = `D5; 12'd1701: tone = `D5; 12'd1702: tone = `D5; 12'd1703: tone = `D5;
				12'd1704: tone = `D5; 12'd1705: tone = `D5; 12'd1706: tone = `D5; 12'd1707: tone = `D5;
				12'd1708: tone = `D5; 12'd1709: tone = `D5; 12'd1710: tone = `D5; 12'd1711: tone = `S;
				12'd1712: tone = `E5; 12'd1713: tone = `E5; 12'd1714: tone = `E5; 12'd1715: tone = `E5;
				12'd1716: tone = `E5; 12'd1717: tone = `E5; 12'd1718: tone = `E5; 12'd1719: tone = `E5;
				12'd1720: tone = `E5; 12'd1721: tone = `E5; 12'd1722: tone = `E5; 12'd1723: tone = `E5;
				12'd1724: tone = `E5; 12'd1725: tone = `E5; 12'd1726: tone = `E5; 12'd1727: tone = `S;
				12'd1728: tone = `C5; 12'd1729: tone = `C5; 12'd1730: tone = `C5; 12'd1731: tone = `C5;
				12'd1732: tone = `C5; 12'd1733: tone = `C5; 12'd1734: tone = `C5; 12'd1735: tone = `C5;
				12'd1736: tone = `C5; 12'd1737: tone = `C5; 12'd1738: tone = `C5; 12'd1739: tone = `C5;
				12'd1740: tone = `C5; 12'd1741: tone = `C5; 12'd1742: tone = `C5; 12'd1743: tone = `S;
				12'd1744: tone = `A4; 12'd1745: tone = `A4; 12'd1746: tone = `A4; 12'd1747: tone = `A4;
				12'd1748: tone = `A4; 12'd1749: tone = `A4; 12'd1750: tone = `A4; 12'd1751: tone = `A4;
				12'd1752: tone = `A4; 12'd1753: tone = `A4; 12'd1754: tone = `A4; 12'd1755: tone = `A4;
				12'd1756: tone = `A4; 12'd1757: tone = `A4; 12'd1758: tone = `A4; 12'd1759: tone = `S;
				12'd1760: tone = `A4; 12'd1761: tone = `A4; 12'd1762: tone = `A4; 12'd1763: tone = `A4;
				12'd1764: tone = `A4; 12'd1765: tone = `A4; 12'd1766: tone = `A4; 12'd1767: tone = `A4;
				12'd1768: tone = `A4; 12'd1769: tone = `A4; 12'd1770: tone = `A4; 12'd1771: tone = `A4;
				12'd1772: tone = `A4; 12'd1773: tone = `A4; 12'd1774: tone = `A4; 12'd1775: tone = `A4;
				12'd1776: tone = `A4; 12'd1777: tone = `A4; 12'd1778: tone = `A4; 12'd1779: tone = `A4;
				12'd1780: tone = `A4; 12'd1781: tone = `A4; 12'd1782: tone = `A4; 12'd1783: tone = `A4;
				12'd1784: tone = `A4; 12'd1785: tone = `A4; 12'd1786: tone = `A4; 12'd1787: tone = `A4;
				12'd1788: tone = `A4; 12'd1789: tone = `A4; 12'd1790: tone = `A4; 12'd1791: tone = `S;
				12'd1792: tone = `S; 12'd1793: tone = `S; 12'd1794: tone = `S; 12'd1795: tone = `S;
				12'd1796: tone = `S; 12'd1797: tone = `S; 12'd1798: tone = `S; 12'd1799: tone = `S;
				12'd1800: tone = `D5; 12'd1801: tone = `D5; 12'd1802: tone = `D5; 12'd1803: tone = `D5;
				12'd1804: tone = `D5; 12'd1805: tone = `D5; 12'd1806: tone = `D5; 12'd1807: tone = `D5;
				12'd1808: tone = `D5; 12'd1809: tone = `D5; 12'd1810: tone = `D5; 12'd1811: tone = `D5;
				12'd1812: tone = `D5; 12'd1813: tone = `D5; 12'd1814: tone = `D5; 12'd1815: tone = `S;
				12'd1816: tone = `F5; 12'd1817: tone = `F5; 12'd1818: tone = `F5; 12'd1819: tone = `F5;
				12'd1820: tone = `F5; 12'd1821: tone = `F5; 12'd1822: tone = `F5; 12'd1823: tone = `S;
				12'd1824: tone = `A5; 12'd1825: tone = `A5; 12'd1826: tone = `A5; 12'd1827: tone = `A5;
				12'd1828: tone = `A5; 12'd1829: tone = `A5; 12'd1830: tone = `A5; 12'd1831: tone = `A5;
				12'd1832: tone = `A5; 12'd1833: tone = `A5; 12'd1834: tone = `A5; 12'd1835: tone = `A5;
				12'd1836: tone = `A5; 12'd1837: tone = `A5; 12'd1838: tone = `A5; 12'd1839: tone = `S;
				12'd1840: tone = `G5; 12'd1841: tone = `G5; 12'd1842: tone = `G5; 12'd1843: tone = `G5;
				12'd1844: tone = `G5; 12'd1845: tone = `G5; 12'd1846: tone = `G5; 12'd1847: tone = `S;
				12'd1848: tone = `F5; 12'd1849: tone = `F5; 12'd1850: tone = `F5; 12'd1851: tone = `F5;
				12'd1852: tone = `F5; 12'd1853: tone = `F5; 12'd1854: tone = `F5; 12'd1855: tone = `S;
				12'd1856: tone = `S; 12'd1857: tone = `S; 12'd1858: tone = `S; 12'd1859: tone = `S;
				12'd1860: tone = `S; 12'd1861: tone = `S; 12'd1862: tone = `S; 12'd1863: tone = `S;
				12'd1864: tone = `E5; 12'd1865: tone = `E5; 12'd1866: tone = `E5; 12'd1867: tone = `E5;
				12'd1868: tone = `E5; 12'd1869: tone = `E5; 12'd1870: tone = `E5; 12'd1871: tone = `E5;
				12'd1872: tone = `E5; 12'd1873: tone = `E5; 12'd1874: tone = `E5; 12'd1875: tone = `E5;
				12'd1876: tone = `E5; 12'd1877: tone = `E5; 12'd1878: tone = `E5; 12'd1879: tone = `S;
				12'd1880: tone = `C5; 12'd1881: tone = `C5; 12'd1882: tone = `C5; 12'd1883: tone = `C5;
				12'd1884: tone = `C5; 12'd1885: tone = `C5; 12'd1886: tone = `C5; 12'd1887: tone = `S;
				12'd1888: tone = `E5; 12'd1889: tone = `E5; 12'd1890: tone = `E5; 12'd1891: tone = `E5;
				12'd1892: tone = `E5; 12'd1893: tone = `E5; 12'd1894: tone = `E5; 12'd1895: tone = `E5;
				12'd1896: tone = `E5; 12'd1897: tone = `E5; 12'd1898: tone = `E5; 12'd1899: tone = `E5;
				12'd1900: tone = `E5; 12'd1901: tone = `E5; 12'd1902: tone = `E5; 12'd1903: tone = `S;
				12'd1904: tone = `D5; 12'd1905: tone = `D5; 12'd1906: tone = `D5; 12'd1907: tone = `D5;
				12'd1908: tone = `D5; 12'd1909: tone = `D5; 12'd1910: tone = `D5; 12'd1911: tone = `S;
				12'd1912: tone = `C5; 12'd1913: tone = `C5; 12'd1914: tone = `C5; 12'd1915: tone = `C5;
				12'd1916: tone = `C5; 12'd1917: tone = `C5; 12'd1918: tone = `C5; 12'd1919: tone = `S;
				12'd1920: tone = `B4; 12'd1921: tone = `B4; 12'd1922: tone = `B4; 12'd1923: tone = `B4;
				12'd1924: tone = `B4; 12'd1925: tone = `B4; 12'd1926: tone = `B4; 12'd1927: tone = `B4;
				12'd1928: tone = `B4; 12'd1929: tone = `B4; 12'd1930: tone = `B4; 12'd1931: tone = `B4;
				12'd1932: tone = `B4; 12'd1933: tone = `B4; 12'd1934: tone = `B4; 12'd1935: tone = `S;
				12'd1936: tone = `B4; 12'd1937: tone = `B4; 12'd1938: tone = `B4; 12'd1939: tone = `B4;
				12'd1940: tone = `B4; 12'd1941: tone = `B4; 12'd1942: tone = `B4; 12'd1943: tone = `S;
				12'd1944: tone = `C5; 12'd1945: tone = `C5; 12'd1946: tone = `C5; 12'd1947: tone = `C5;
				12'd1948: tone = `C5; 12'd1949: tone = `C5; 12'd1950: tone = `C5; 12'd1951: tone = `S;
				12'd1952: tone = `D5; 12'd1953: tone = `D5; 12'd1954: tone = `D5; 12'd1955: tone = `D5;
				12'd1956: tone = `D5; 12'd1957: tone = `D5; 12'd1958: tone = `D5; 12'd1959: tone = `D5;
				12'd1960: tone = `D5; 12'd1961: tone = `D5; 12'd1962: tone = `D5; 12'd1963: tone = `D5;
				12'd1964: tone = `D5; 12'd1965: tone = `D5; 12'd1966: tone = `D5; 12'd1967: tone = `S;
				12'd1968: tone = `E5; 12'd1969: tone = `E5; 12'd1970: tone = `E5; 12'd1971: tone = `E5;
				12'd1972: tone = `E5; 12'd1973: tone = `E5; 12'd1974: tone = `E5; 12'd1975: tone = `E5;
				12'd1976: tone = `E5; 12'd1977: tone = `E5; 12'd1978: tone = `E5; 12'd1979: tone = `E5;
				12'd1980: tone = `E5; 12'd1981: tone = `E5; 12'd1982: tone = `E5; 12'd1983: tone = `S;
				12'd1984: tone = `C5; 12'd1985: tone = `C5; 12'd1986: tone = `C5; 12'd1987: tone = `C5;
				12'd1988: tone = `C5; 12'd1989: tone = `C5; 12'd1990: tone = `C5; 12'd1991: tone = `C5;
				12'd1992: tone = `C5; 12'd1993: tone = `C5; 12'd1994: tone = `C5; 12'd1995: tone = `C5;
				12'd1996: tone = `C5; 12'd1997: tone = `C5; 12'd1998: tone = `C5; 12'd1999: tone = `S;
				12'd2000: tone = `A4; 12'd2001: tone = `A4; 12'd2002: tone = `A4; 12'd2003: tone = `A4;
				12'd2004: tone = `A4; 12'd2005: tone = `A4; 12'd2006: tone = `A4; 12'd2007: tone = `A4;
				12'd2008: tone = `A4; 12'd2009: tone = `A4; 12'd2010: tone = `A4; 12'd2011: tone = `A4;
				12'd2012: tone = `A4; 12'd2013: tone = `A4; 12'd2014: tone = `A4; 12'd2015: tone = `S;
				12'd2016: tone = `A4; 12'd2017: tone = `A4; 12'd2018: tone = `A4; 12'd2019: tone = `A4;
				12'd2020: tone = `A4; 12'd2021: tone = `A4; 12'd2022: tone = `A4; 12'd2023: tone = `A4;
				12'd2024: tone = `A4; 12'd2025: tone = `A4; 12'd2026: tone = `A4; 12'd2027: tone = `A4;
				12'd2028: tone = `A4; 12'd2029: tone = `A4; 12'd2030: tone = `A4; 12'd2031: tone = `A4;
				12'd2032: tone = `A4; 12'd2033: tone = `A4; 12'd2034: tone = `A4; 12'd2035: tone = `A4;
				12'd2036: tone = `A4; 12'd2037: tone = `A4; 12'd2038: tone = `A4; 12'd2039: tone = `A4;
				12'd2040: tone = `A4; 12'd2041: tone = `A4; 12'd2042: tone = `A4; 12'd2043: tone = `A4;
				12'd2044: tone = `A4; 12'd2045: tone = `A4; 12'd2046: tone = `A4; 12'd2047: tone = `S;
				12'd2048: tone = `E5; 12'd2049: tone = `E5; 12'd2050: tone = `E5; 12'd2051: tone = `E5;
				12'd2052: tone = `E5; 12'd2053: tone = `E5; 12'd2054: tone = `E5; 12'd2055: tone = `E5;
				12'd2056: tone = `E5; 12'd2057: tone = `E5; 12'd2058: tone = `E5; 12'd2059: tone = `E5;
				12'd2060: tone = `E5; 12'd2061: tone = `E5; 12'd2062: tone = `E5; 12'd2063: tone = `S;
				12'd2064: tone = `B4; 12'd2065: tone = `B4; 12'd2066: tone = `B4; 12'd2067: tone = `B4;
				12'd2068: tone = `B4; 12'd2069: tone = `B4; 12'd2070: tone = `B4; 12'd2071: tone = `S;
				12'd2072: tone = `C5; 12'd2073: tone = `C5; 12'd2074: tone = `C5; 12'd2075: tone = `C5;
				12'd2076: tone = `C5; 12'd2077: tone = `C5; 12'd2078: tone = `C5; 12'd2079: tone = `S;
				12'd2080: tone = `D5; 12'd2081: tone = `D5; 12'd2082: tone = `D5; 12'd2083: tone = `D5;
				12'd2084: tone = `D5; 12'd2085: tone = `D5; 12'd2086: tone = `D5; 12'd2087: tone = `S;
				12'd2088: tone = `E5; 12'd2089: tone = `E5; 12'd2090: tone = `E5; 12'd2091: tone = `E5;
				12'd2092: tone = `E5; 12'd2093: tone = `E5; 12'd2094: tone = `E5; 12'd2095: tone = `S;
				12'd2096: tone = `C5; 12'd2097: tone = `C5; 12'd2098: tone = `C5; 12'd2099: tone = `C5;
				12'd2100: tone = `C5; 12'd2101: tone = `C5; 12'd2102: tone = `C5; 12'd2103: tone = `S;
				12'd2104: tone = `B4; 12'd2105: tone = `B4; 12'd2106: tone = `B4; 12'd2107: tone = `B4;
				12'd2108: tone = `B4; 12'd2109: tone = `B4; 12'd2110: tone = `B4; 12'd2111: tone = `S;
				12'd2112: tone = `A4; 12'd2113: tone = `A4; 12'd2114: tone = `A4; 12'd2115: tone = `A4;
				12'd2116: tone = `A4; 12'd2117: tone = `A4; 12'd2118: tone = `A4; 12'd2119: tone = `A4;
				12'd2120: tone = `A4; 12'd2121: tone = `A4; 12'd2122: tone = `A4; 12'd2123: tone = `A4;
				12'd2124: tone = `A4; 12'd2125: tone = `A4; 12'd2126: tone = `A4; 12'd2127: tone = `S;
				12'd2128: tone = `A4; 12'd2129: tone = `A4; 12'd2130: tone = `A4; 12'd2131: tone = `A4;
				12'd2132: tone = `A4; 12'd2133: tone = `A4; 12'd2134: tone = `A4; 12'd2135: tone = `S;
				12'd2136: tone = `C5; 12'd2137: tone = `C5; 12'd2138: tone = `C5; 12'd2139: tone = `C5;
				12'd2140: tone = `C5; 12'd2141: tone = `C5; 12'd2142: tone = `C5; 12'd2143: tone = `S;
				12'd2144: tone = `E5; 12'd2145: tone = `E5; 12'd2146: tone = `E5; 12'd2147: tone = `E5;
				12'd2148: tone = `E5; 12'd2149: tone = `E5; 12'd2150: tone = `E5; 12'd2151: tone = `E5;
				12'd2152: tone = `E5; 12'd2153: tone = `E5; 12'd2154: tone = `E5; 12'd2155: tone = `E5;
				12'd2156: tone = `E5; 12'd2157: tone = `E5; 12'd2158: tone = `E5; 12'd2159: tone = `S;
				12'd2160: tone = `D5; 12'd2161: tone = `D5; 12'd2162: tone = `D5; 12'd2163: tone = `D5;
				12'd2164: tone = `D5; 12'd2165: tone = `D5; 12'd2166: tone = `D5; 12'd2167: tone = `S;
				12'd2168: tone = `C5; 12'd2169: tone = `C5; 12'd2170: tone = `C5; 12'd2171: tone = `C5;
				12'd2172: tone = `C5; 12'd2173: tone = `C5; 12'd2174: tone = `C5; 12'd2175: tone = `S;
				12'd2176: tone = `B4; 12'd2177: tone = `B4; 12'd2178: tone = `B4; 12'd2179: tone = `B4;
				12'd2180: tone = `B4; 12'd2181: tone = `B4; 12'd2182: tone = `B4; 12'd2183: tone = `B4;
				12'd2184: tone = `B4; 12'd2185: tone = `B4; 12'd2186: tone = `B4; 12'd2187: tone = `B4;
				12'd2188: tone = `B4; 12'd2189: tone = `B4; 12'd2190: tone = `B4; 12'd2191: tone = `S;
				12'd2192: tone = `B4; 12'd2193: tone = `B4; 12'd2194: tone = `B4; 12'd2195: tone = `B4;
				12'd2196: tone = `B4; 12'd2197: tone = `B4; 12'd2198: tone = `B4; 12'd2199: tone = `S;
				12'd2200: tone = `C5; 12'd2201: tone = `C5; 12'd2202: tone = `C5; 12'd2203: tone = `C5;
				12'd2204: tone = `C5; 12'd2205: tone = `C5; 12'd2206: tone = `C5; 12'd2207: tone = `S;
				12'd2208: tone = `D5; 12'd2209: tone = `D5; 12'd2210: tone = `D5; 12'd2211: tone = `D5;
				12'd2212: tone = `D5; 12'd2213: tone = `D5; 12'd2214: tone = `D5; 12'd2215: tone = `D5;
				12'd2216: tone = `D5; 12'd2217: tone = `D5; 12'd2218: tone = `D5; 12'd2219: tone = `D5;
				12'd2220: tone = `D5; 12'd2221: tone = `D5; 12'd2222: tone = `D5; 12'd2223: tone = `S;
				12'd2224: tone = `E5; 12'd2225: tone = `E5; 12'd2226: tone = `E5; 12'd2227: tone = `E5;
				12'd2228: tone = `E5; 12'd2229: tone = `E5; 12'd2230: tone = `E5; 12'd2231: tone = `E5;
				12'd2232: tone = `E5; 12'd2233: tone = `E5; 12'd2234: tone = `E5; 12'd2235: tone = `E5;
				12'd2236: tone = `E5; 12'd2237: tone = `E5; 12'd2238: tone = `E5; 12'd2239: tone = `S;
				12'd2240: tone = `C5; 12'd2241: tone = `C5; 12'd2242: tone = `C5; 12'd2243: tone = `C5;
				12'd2244: tone = `C5; 12'd2245: tone = `C5; 12'd2246: tone = `C5; 12'd2247: tone = `C5;
				12'd2248: tone = `C5; 12'd2249: tone = `C5; 12'd2250: tone = `C5; 12'd2251: tone = `C5;
				12'd2252: tone = `C5; 12'd2253: tone = `C5; 12'd2254: tone = `C5; 12'd2255: tone = `S;
				12'd2256: tone = `A4; 12'd2257: tone = `A4; 12'd2258: tone = `A4; 12'd2259: tone = `A4;
				12'd2260: tone = `A4; 12'd2261: tone = `A4; 12'd2262: tone = `A4; 12'd2263: tone = `A4;
				12'd2264: tone = `A4; 12'd2265: tone = `A4; 12'd2266: tone = `A4; 12'd2267: tone = `A4;
				12'd2268: tone = `A4; 12'd2269: tone = `A4; 12'd2270: tone = `A4; 12'd2271: tone = `S;
				12'd2272: tone = `A4; 12'd2273: tone = `A4; 12'd2274: tone = `A4; 12'd2275: tone = `A4;
				12'd2276: tone = `A4; 12'd2277: tone = `A4; 12'd2278: tone = `A4; 12'd2279: tone = `A4;
				12'd2280: tone = `A4; 12'd2281: tone = `A4; 12'd2282: tone = `A4; 12'd2283: tone = `A4;
				12'd2284: tone = `A4; 12'd2285: tone = `A4; 12'd2286: tone = `A4; 12'd2287: tone = `A4;
				12'd2288: tone = `A4; 12'd2289: tone = `A4; 12'd2290: tone = `A4; 12'd2291: tone = `A4;
				12'd2292: tone = `A4; 12'd2293: tone = `A4; 12'd2294: tone = `A4; 12'd2295: tone = `A4;
				12'd2296: tone = `A4; 12'd2297: tone = `A4; 12'd2298: tone = `A4; 12'd2299: tone = `A4;
				12'd2300: tone = `A4; 12'd2301: tone = `A4; 12'd2302: tone = `A4; 12'd2303: tone = `S;
				12'd2304: tone = `S; 12'd2305: tone = `S; 12'd2306: tone = `S; 12'd2307: tone = `S;
				12'd2308: tone = `S; 12'd2309: tone = `S; 12'd2310: tone = `S; 12'd2311: tone = `S;
				12'd2312: tone = `D5; 12'd2313: tone = `D5; 12'd2314: tone = `D5; 12'd2315: tone = `D5;
				12'd2316: tone = `D5; 12'd2317: tone = `D5; 12'd2318: tone = `D5; 12'd2319: tone = `D5;
				12'd2320: tone = `D5; 12'd2321: tone = `D5; 12'd2322: tone = `D5; 12'd2323: tone = `D5;
				12'd2324: tone = `D5; 12'd2325: tone = `D5; 12'd2326: tone = `D5; 12'd2327: tone = `S;
				12'd2328: tone = `F5; 12'd2329: tone = `F5; 12'd2330: tone = `F5; 12'd2331: tone = `F5;
				12'd2332: tone = `F5; 12'd2333: tone = `F5; 12'd2334: tone = `F5; 12'd2335: tone = `S;
				12'd2336: tone = `A5; 12'd2337: tone = `A5; 12'd2338: tone = `A5; 12'd2339: tone = `A5;
				12'd2340: tone = `A5; 12'd2341: tone = `A5; 12'd2342: tone = `A5; 12'd2343: tone = `A5;
				12'd2344: tone = `A5; 12'd2345: tone = `A5; 12'd2346: tone = `A5; 12'd2347: tone = `A5;
				12'd2348: tone = `A5; 12'd2349: tone = `A5; 12'd2350: tone = `A5; 12'd2351: tone = `S;
				12'd2352: tone = `G5; 12'd2353: tone = `G5; 12'd2354: tone = `G5; 12'd2355: tone = `G5;
				12'd2356: tone = `G5; 12'd2357: tone = `G5; 12'd2358: tone = `G5; 12'd2359: tone = `S;
				12'd2360: tone = `F5; 12'd2361: tone = `F5; 12'd2362: tone = `F5; 12'd2363: tone = `F5;
				12'd2364: tone = `F5; 12'd2365: tone = `F5; 12'd2366: tone = `F5; 12'd2367: tone = `S;
				12'd2368: tone = `S; 12'd2369: tone = `S; 12'd2370: tone = `S; 12'd2371: tone = `S;
				12'd2372: tone = `S; 12'd2373: tone = `S; 12'd2374: tone = `S; 12'd2375: tone = `S;
				12'd2376: tone = `E5; 12'd2377: tone = `E5; 12'd2378: tone = `E5; 12'd2379: tone = `E5;
				12'd2380: tone = `E5; 12'd2381: tone = `E5; 12'd2382: tone = `E5; 12'd2383: tone = `E5;
				12'd2384: tone = `E5; 12'd2385: tone = `E5; 12'd2386: tone = `E5; 12'd2387: tone = `E5;
				12'd2388: tone = `E5; 12'd2389: tone = `E5; 12'd2390: tone = `E5; 12'd2391: tone = `S;
				12'd2392: tone = `C5; 12'd2393: tone = `C5; 12'd2394: tone = `C5; 12'd2395: tone = `C5;
				12'd2396: tone = `C5; 12'd2397: tone = `C5; 12'd2398: tone = `C5; 12'd2399: tone = `S;
				12'd2400: tone = `E5; 12'd2401: tone = `E5; 12'd2402: tone = `E5; 12'd2403: tone = `E5;
				12'd2404: tone = `E5; 12'd2405: tone = `E5; 12'd2406: tone = `E5; 12'd2407: tone = `E5;
				12'd2408: tone = `E5; 12'd2409: tone = `E5; 12'd2410: tone = `E5; 12'd2411: tone = `E5;
				12'd2412: tone = `E5; 12'd2413: tone = `E5; 12'd2414: tone = `E5; 12'd2415: tone = `S;
				12'd2416: tone = `D5; 12'd2417: tone = `D5; 12'd2418: tone = `D5; 12'd2419: tone = `D5;
				12'd2420: tone = `D5; 12'd2421: tone = `D5; 12'd2422: tone = `D5; 12'd2423: tone = `S;
				12'd2424: tone = `C5; 12'd2425: tone = `C5; 12'd2426: tone = `C5; 12'd2427: tone = `C5;
				12'd2428: tone = `C5; 12'd2429: tone = `C5; 12'd2430: tone = `C5; 12'd2431: tone = `S;
				12'd2432: tone = `B4; 12'd2433: tone = `B4; 12'd2434: tone = `B4; 12'd2435: tone = `B4;
				12'd2436: tone = `B4; 12'd2437: tone = `B4; 12'd2438: tone = `B4; 12'd2439: tone = `B4;
				12'd2440: tone = `B4; 12'd2441: tone = `B4; 12'd2442: tone = `B4; 12'd2443: tone = `B4;
				12'd2444: tone = `B4; 12'd2445: tone = `B4; 12'd2446: tone = `B4; 12'd2447: tone = `S;
				12'd2448: tone = `B4; 12'd2449: tone = `B4; 12'd2450: tone = `B4; 12'd2451: tone = `B4;
				12'd2452: tone = `B4; 12'd2453: tone = `B4; 12'd2454: tone = `B4; 12'd2455: tone = `S;
				12'd2456: tone = `C5; 12'd2457: tone = `C5; 12'd2458: tone = `C5; 12'd2459: tone = `C5;
				12'd2460: tone = `C5; 12'd2461: tone = `C5; 12'd2462: tone = `C5; 12'd2463: tone = `S;
				12'd2464: tone = `D5; 12'd2465: tone = `D5; 12'd2466: tone = `D5; 12'd2467: tone = `D5;
				12'd2468: tone = `D5; 12'd2469: tone = `D5; 12'd2470: tone = `D5; 12'd2471: tone = `D5;
				12'd2472: tone = `D5; 12'd2473: tone = `D5; 12'd2474: tone = `D5; 12'd2475: tone = `D5;
				12'd2476: tone = `D5; 12'd2477: tone = `D5; 12'd2478: tone = `D5; 12'd2479: tone = `S;
				12'd2480: tone = `E5; 12'd2481: tone = `E5; 12'd2482: tone = `E5; 12'd2483: tone = `E5;
				12'd2484: tone = `E5; 12'd2485: tone = `E5; 12'd2486: tone = `E5; 12'd2487: tone = `E5;
				12'd2488: tone = `E5; 12'd2489: tone = `E5; 12'd2490: tone = `E5; 12'd2491: tone = `E5;
				12'd2492: tone = `E5; 12'd2493: tone = `E5; 12'd2494: tone = `E5; 12'd2495: tone = `S;
				12'd2496: tone = `C5; 12'd2497: tone = `C5; 12'd2498: tone = `C5; 12'd2499: tone = `C5;
				12'd2500: tone = `C5; 12'd2501: tone = `C5; 12'd2502: tone = `C5; 12'd2503: tone = `C5;
				12'd2504: tone = `C5; 12'd2505: tone = `C5; 12'd2506: tone = `C5; 12'd2507: tone = `C5;
				12'd2508: tone = `C5; 12'd2509: tone = `C5; 12'd2510: tone = `C5; 12'd2511: tone = `S;
				12'd2512: tone = `A4; 12'd2513: tone = `A4; 12'd2514: tone = `A4; 12'd2515: tone = `A4;
				12'd2516: tone = `A4; 12'd2517: tone = `A4; 12'd2518: tone = `A4; 12'd2519: tone = `A4;
				12'd2520: tone = `A4; 12'd2521: tone = `A4; 12'd2522: tone = `A4; 12'd2523: tone = `A4;
				12'd2524: tone = `A4; 12'd2525: tone = `A4; 12'd2526: tone = `A4; 12'd2527: tone = `S;
				12'd2528: tone = `A4; 12'd2529: tone = `A4; 12'd2530: tone = `A4; 12'd2531: tone = `A4;
				12'd2532: tone = `A4; 12'd2533: tone = `A4; 12'd2534: tone = `A4; 12'd2535: tone = `A4;
				12'd2536: tone = `A4; 12'd2537: tone = `A4; 12'd2538: tone = `A4; 12'd2539: tone = `A4;
				12'd2540: tone = `A4; 12'd2541: tone = `A4; 12'd2542: tone = `A4; 12'd2543: tone = `A4;
				12'd2544: tone = `A4; 12'd2545: tone = `A4; 12'd2546: tone = `A4; 12'd2547: tone = `A4;
				12'd2548: tone = `A4; 12'd2549: tone = `A4; 12'd2550: tone = `A4; 12'd2551: tone = `A4;
				12'd2552: tone = `A4; 12'd2553: tone = `A4; 12'd2554: tone = `A4; 12'd2555: tone = `A4;
				12'd2556: tone = `A4; 12'd2557: tone = `A4; 12'd2558: tone = `A4; 12'd2559: tone = `S;
				12'd2560: tone = `E4; 12'd2561: tone = `E4; 12'd2562: tone = `E4; 12'd2563: tone = `E4;
				12'd2564: tone = `E4; 12'd2565: tone = `E4; 12'd2566: tone = `E4; 12'd2567: tone = `E4;
				12'd2568: tone = `E4; 12'd2569: tone = `E4; 12'd2570: tone = `E4; 12'd2571: tone = `E4;
				12'd2572: tone = `E4; 12'd2573: tone = `E4; 12'd2574: tone = `E4; 12'd2575: tone = `E4;
				12'd2576: tone = `E4; 12'd2577: tone = `E4; 12'd2578: tone = `E4; 12'd2579: tone = `E4;
				12'd2580: tone = `E4; 12'd2581: tone = `E4; 12'd2582: tone = `E4; 12'd2583: tone = `E4;
				12'd2584: tone = `E4; 12'd2585: tone = `E4; 12'd2586: tone = `E4; 12'd2587: tone = `E4;
				12'd2588: tone = `E4; 12'd2589: tone = `E4; 12'd2590: tone = `E4; 12'd2591: tone = `S;
				12'd2592: tone = `C4; 12'd2593: tone = `C4; 12'd2594: tone = `C4; 12'd2595: tone = `C4;
				12'd2596: tone = `C4; 12'd2597: tone = `C4; 12'd2598: tone = `C4; 12'd2599: tone = `C4;
				12'd2600: tone = `C4; 12'd2601: tone = `C4; 12'd2602: tone = `C4; 12'd2603: tone = `C4;
				12'd2604: tone = `C4; 12'd2605: tone = `C4; 12'd2606: tone = `C4; 12'd2607: tone = `C4;
				12'd2608: tone = `C4; 12'd2609: tone = `C4; 12'd2610: tone = `C4; 12'd2611: tone = `C4;
				12'd2612: tone = `C4; 12'd2613: tone = `C4; 12'd2614: tone = `C4; 12'd2615: tone = `C4;
				12'd2616: tone = `C4; 12'd2617: tone = `C4; 12'd2618: tone = `C4; 12'd2619: tone = `C4;
				12'd2620: tone = `C4; 12'd2621: tone = `C4; 12'd2622: tone = `C4; 12'd2623: tone = `S;
				12'd2624: tone = `D4; 12'd2625: tone = `D4; 12'd2626: tone = `D4; 12'd2627: tone = `D4;
				12'd2628: tone = `D4; 12'd2629: tone = `D4; 12'd2630: tone = `D4; 12'd2631: tone = `D4;
				12'd2632: tone = `D4; 12'd2633: tone = `D4; 12'd2634: tone = `D4; 12'd2635: tone = `D4;
				12'd2636: tone = `D4; 12'd2637: tone = `D4; 12'd2638: tone = `D4; 12'd2639: tone = `D4;
				12'd2640: tone = `D4; 12'd2641: tone = `D4; 12'd2642: tone = `D4; 12'd2643: tone = `D4;
				12'd2644: tone = `D4; 12'd2645: tone = `D4; 12'd2646: tone = `D4; 12'd2647: tone = `D4;
				12'd2648: tone = `D4; 12'd2649: tone = `D4; 12'd2650: tone = `D4; 12'd2651: tone = `D4;
				12'd2652: tone = `D4; 12'd2653: tone = `D4; 12'd2654: tone = `D4; 12'd2655: tone = `S;
				12'd2656: tone = `B3; 12'd2657: tone = `B3; 12'd2658: tone = `B3; 12'd2659: tone = `B3;
				12'd2660: tone = `B3; 12'd2661: tone = `B3; 12'd2662: tone = `B3; 12'd2663: tone = `B3;
				12'd2664: tone = `B3; 12'd2665: tone = `B3; 12'd2666: tone = `B3; 12'd2667: tone = `B3;
				12'd2668: tone = `B3; 12'd2669: tone = `B3; 12'd2670: tone = `B3; 12'd2671: tone = `B3;
				12'd2672: tone = `B3; 12'd2673: tone = `B3; 12'd2674: tone = `B3; 12'd2675: tone = `B3;
				12'd2676: tone = `B3; 12'd2677: tone = `B3; 12'd2678: tone = `B3; 12'd2679: tone = `B3;
				12'd2680: tone = `B3; 12'd2681: tone = `B3; 12'd2682: tone = `B3; 12'd2683: tone = `B3;
				12'd2684: tone = `B3; 12'd2685: tone = `B3; 12'd2686: tone = `B3; 12'd2687: tone = `S;
				12'd2688: tone = `C4; 12'd2689: tone = `C4; 12'd2690: tone = `C4; 12'd2691: tone = `C4;
				12'd2692: tone = `C4; 12'd2693: tone = `C4; 12'd2694: tone = `C4; 12'd2695: tone = `C4;
				12'd2696: tone = `C4; 12'd2697: tone = `C4; 12'd2698: tone = `C4; 12'd2699: tone = `C4;
				12'd2700: tone = `C4; 12'd2701: tone = `C4; 12'd2702: tone = `C4; 12'd2703: tone = `C4;
				12'd2704: tone = `C4; 12'd2705: tone = `C4; 12'd2706: tone = `C4; 12'd2707: tone = `C4;
				12'd2708: tone = `C4; 12'd2709: tone = `C4; 12'd2710: tone = `C4; 12'd2711: tone = `C4;
				12'd2712: tone = `C4; 12'd2713: tone = `C4; 12'd2714: tone = `C4; 12'd2715: tone = `C4;
				12'd2716: tone = `C4; 12'd2717: tone = `C4; 12'd2718: tone = `C4; 12'd2719: tone = `S;
				12'd2720: tone = `A3; 12'd2721: tone = `A3; 12'd2722: tone = `A3; 12'd2723: tone = `A3;
				12'd2724: tone = `A3; 12'd2725: tone = `A3; 12'd2726: tone = `A3; 12'd2727: tone = `A3;
				12'd2728: tone = `A3; 12'd2729: tone = `A3; 12'd2730: tone = `A3; 12'd2731: tone = `A3;
				12'd2732: tone = `A3; 12'd2733: tone = `A3; 12'd2734: tone = `A3; 12'd2735: tone = `A3;
				12'd2736: tone = `A3; 12'd2737: tone = `A3; 12'd2738: tone = `A3; 12'd2739: tone = `A3;
				12'd2740: tone = `A3; 12'd2741: tone = `A3; 12'd2742: tone = `A3; 12'd2743: tone = `A3;
				12'd2744: tone = `A3; 12'd2745: tone = `A3; 12'd2746: tone = `A3; 12'd2747: tone = `A3;
				12'd2748: tone = `A3; 12'd2749: tone = `A3; 12'd2750: tone = `A3; 12'd2751: tone = `S;
				12'd2752: tone = `Gs3; 12'd2753: tone = `Gs3; 12'd2754: tone = `Gs3; 12'd2755: tone = `Gs3;
				12'd2756: tone = `Gs3; 12'd2757: tone = `Gs3; 12'd2758: tone = `Gs3; 12'd2759: tone = `Gs3;
				12'd2760: tone = `Gs3; 12'd2761: tone = `Gs3; 12'd2762: tone = `Gs3; 12'd2763: tone = `Gs3;
				12'd2764: tone = `Gs3; 12'd2765: tone = `Gs3; 12'd2766: tone = `Gs3; 12'd2767: tone = `Gs3;
				12'd2768: tone = `Gs3; 12'd2769: tone = `Gs3; 12'd2770: tone = `Gs3; 12'd2771: tone = `Gs3;
				12'd2772: tone = `Gs3; 12'd2773: tone = `Gs3; 12'd2774: tone = `Gs3; 12'd2775: tone = `Gs3;
				12'd2776: tone = `Gs3; 12'd2777: tone = `Gs3; 12'd2778: tone = `Gs3; 12'd2779: tone = `Gs3;
				12'd2780: tone = `Gs3; 12'd2781: tone = `Gs3; 12'd2782: tone = `Gs3; 12'd2783: tone = `S;
				12'd2784: tone = `B3; 12'd2785: tone = `B3; 12'd2786: tone = `B3; 12'd2787: tone = `B3;
				12'd2788: tone = `B3; 12'd2789: tone = `B3; 12'd2790: tone = `B3; 12'd2791: tone = `B3;
				12'd2792: tone = `B3; 12'd2793: tone = `B3; 12'd2794: tone = `B3; 12'd2795: tone = `B3;
				12'd2796: tone = `B3; 12'd2797: tone = `B3; 12'd2798: tone = `B3; 12'd2799: tone = `B3;
				12'd2800: tone = `B3; 12'd2801: tone = `B3; 12'd2802: tone = `B3; 12'd2803: tone = `B3;
				12'd2804: tone = `B3; 12'd2805: tone = `B3; 12'd2806: tone = `B3; 12'd2807: tone = `B3;
				12'd2808: tone = `B3; 12'd2809: tone = `B3; 12'd2810: tone = `B3; 12'd2811: tone = `B3;
				12'd2812: tone = `B3; 12'd2813: tone = `B3; 12'd2814: tone = `B3; 12'd2815: tone = `S;
				12'd2816: tone = `E4; 12'd2817: tone = `E4; 12'd2818: tone = `E4; 12'd2819: tone = `E4;
				12'd2820: tone = `E4; 12'd2821: tone = `E4; 12'd2822: tone = `E4; 12'd2823: tone = `E4;
				12'd2824: tone = `E4; 12'd2825: tone = `E4; 12'd2826: tone = `E4; 12'd2827: tone = `E4;
				12'd2828: tone = `E4; 12'd2829: tone = `E4; 12'd2830: tone = `E4; 12'd2831: tone = `E4;
				12'd2832: tone = `E4; 12'd2833: tone = `E4; 12'd2834: tone = `E4; 12'd2835: tone = `E4;
				12'd2836: tone = `E4; 12'd2837: tone = `E4; 12'd2838: tone = `E4; 12'd2839: tone = `E4;
				12'd2840: tone = `E4; 12'd2841: tone = `E4; 12'd2842: tone = `E4; 12'd2843: tone = `E4;
				12'd2844: tone = `E4; 12'd2845: tone = `E4; 12'd2846: tone = `E4; 12'd2847: tone = `S;
				12'd2848: tone = `C4; 12'd2849: tone = `C4; 12'd2850: tone = `C4; 12'd2851: tone = `C4;
				12'd2852: tone = `C4; 12'd2853: tone = `C4; 12'd2854: tone = `C4; 12'd2855: tone = `C4;
				12'd2856: tone = `C4; 12'd2857: tone = `C4; 12'd2858: tone = `C4; 12'd2859: tone = `C4;
				12'd2860: tone = `C4; 12'd2861: tone = `C4; 12'd2862: tone = `C4; 12'd2863: tone = `C4;
				12'd2864: tone = `C4; 12'd2865: tone = `C4; 12'd2866: tone = `C4; 12'd2867: tone = `C4;
				12'd2868: tone = `C4; 12'd2869: tone = `C4; 12'd2870: tone = `C4; 12'd2871: tone = `C4;
				12'd2872: tone = `C4; 12'd2873: tone = `C4; 12'd2874: tone = `C4; 12'd2875: tone = `C4;
				12'd2876: tone = `C4; 12'd2877: tone = `C4; 12'd2878: tone = `C4; 12'd2879: tone = `S;
				12'd2880: tone = `D4; 12'd2881: tone = `D4; 12'd2882: tone = `D4; 12'd2883: tone = `D4;
				12'd2884: tone = `D4; 12'd2885: tone = `D4; 12'd2886: tone = `D4; 12'd2887: tone = `D4;
				12'd2888: tone = `D4; 12'd2889: tone = `D4; 12'd2890: tone = `D4; 12'd2891: tone = `D4;
				12'd2892: tone = `D4; 12'd2893: tone = `D4; 12'd2894: tone = `D4; 12'd2895: tone = `D4;
				12'd2896: tone = `D4; 12'd2897: tone = `D4; 12'd2898: tone = `D4; 12'd2899: tone = `D4;
				12'd2900: tone = `D4; 12'd2901: tone = `D4; 12'd2902: tone = `D4; 12'd2903: tone = `D4;
				12'd2904: tone = `D4; 12'd2905: tone = `D4; 12'd2906: tone = `D4; 12'd2907: tone = `D4;
				12'd2908: tone = `D4; 12'd2909: tone = `D4; 12'd2910: tone = `D4; 12'd2911: tone = `S;
				12'd2912: tone = `B3; 12'd2913: tone = `B3; 12'd2914: tone = `B3; 12'd2915: tone = `B3;
				12'd2916: tone = `B3; 12'd2917: tone = `B3; 12'd2918: tone = `B3; 12'd2919: tone = `B3;
				12'd2920: tone = `B3; 12'd2921: tone = `B3; 12'd2922: tone = `B3; 12'd2923: tone = `B3;
				12'd2924: tone = `B3; 12'd2925: tone = `B3; 12'd2926: tone = `B3; 12'd2927: tone = `B3;
				12'd2928: tone = `B3; 12'd2929: tone = `B3; 12'd2930: tone = `B3; 12'd2931: tone = `B3;
				12'd2932: tone = `B3; 12'd2933: tone = `B3; 12'd2934: tone = `B3; 12'd2935: tone = `B3;
				12'd2936: tone = `B3; 12'd2937: tone = `B3; 12'd2938: tone = `B3; 12'd2939: tone = `B3;
				12'd2940: tone = `B3; 12'd2941: tone = `B3; 12'd2942: tone = `B3; 12'd2943: tone = `S;
				12'd2944: tone = `C4; 12'd2945: tone = `C4; 12'd2946: tone = `C4; 12'd2947: tone = `C4;
				12'd2948: tone = `C4; 12'd2949: tone = `C4; 12'd2950: tone = `C4; 12'd2951: tone = `C4;
				12'd2952: tone = `C4; 12'd2953: tone = `C4; 12'd2954: tone = `C4; 12'd2955: tone = `C4;
				12'd2956: tone = `C4; 12'd2957: tone = `C4; 12'd2958: tone = `C4; 12'd2959: tone = `S;
				12'd2960: tone = `E4; 12'd2961: tone = `E4; 12'd2962: tone = `E4; 12'd2963: tone = `E4;
				12'd2964: tone = `E4; 12'd2965: tone = `E4; 12'd2966: tone = `E4; 12'd2967: tone = `E4;
				12'd2968: tone = `E4; 12'd2969: tone = `E4; 12'd2970: tone = `E4; 12'd2971: tone = `E4;
				12'd2972: tone = `E4; 12'd2973: tone = `E4; 12'd2974: tone = `E4; 12'd2975: tone = `S;
				12'd2976: tone = `A4; 12'd2977: tone = `A4; 12'd2978: tone = `A4; 12'd2979: tone = `A4;
				12'd2980: tone = `A4; 12'd2981: tone = `A4; 12'd2982: tone = `A4; 12'd2983: tone = `A4;
				12'd2984: tone = `A4; 12'd2985: tone = `A4; 12'd2986: tone = `A4; 12'd2987: tone = `A4;
				12'd2988: tone = `A4; 12'd2989: tone = `A4; 12'd2990: tone = `A4; 12'd2991: tone = `S;
				12'd2992: tone = `A4; 12'd2993: tone = `A4; 12'd2994: tone = `A4; 12'd2995: tone = `A4;
				12'd2996: tone = `A4; 12'd2997: tone = `A4; 12'd2998: tone = `A4; 12'd2999: tone = `A4;
				12'd3000: tone = `A4; 12'd3001: tone = `A4; 12'd3002: tone = `A4; 12'd3003: tone = `A4;
				12'd3004: tone = `A4; 12'd3005: tone = `A4; 12'd3006: tone = `A4; 12'd3007: tone = `S;
				12'd3008: tone = `Gs4; 12'd3009: tone = `Gs4; 12'd3010: tone = `Gs4; 12'd3011: tone = `Gs4;
				12'd3012: tone = `Gs4; 12'd3013: tone = `Gs4; 12'd3014: tone = `Gs4; 12'd3015: tone = `Gs4;
				12'd3016: tone = `Gs4; 12'd3017: tone = `Gs4; 12'd3018: tone = `Gs4; 12'd3019: tone = `Gs4;
				12'd3020: tone = `Gs4; 12'd3021: tone = `Gs4; 12'd3022: tone = `Gs4; 12'd3023: tone = `Gs4;
				12'd3024: tone = `Gs4; 12'd3025: tone = `Gs4; 12'd3026: tone = `Gs4; 12'd3027: tone = `Gs4;
				12'd3028: tone = `Gs4; 12'd3029: tone = `Gs4; 12'd3030: tone = `Gs4; 12'd3031: tone = `Gs4;
				12'd3032: tone = `Gs4; 12'd3033: tone = `Gs4; 12'd3034: tone = `Gs4; 12'd3035: tone = `Gs4;
				12'd3036: tone = `Gs4; 12'd3037: tone = `Gs4; 12'd3038: tone = `Gs4; 12'd3039: tone = `Gs4;
				12'd3040: tone = `Gs4; 12'd3041: tone = `Gs4; 12'd3042: tone = `Gs4; 12'd3043: tone = `Gs4;
				12'd3044: tone = `Gs4; 12'd3045: tone = `Gs4; 12'd3046: tone = `Gs4; 12'd3047: tone = `Gs4;
				12'd3048: tone = `Gs4; 12'd3049: tone = `Gs4; 12'd3050: tone = `Gs4; 12'd3051: tone = `Gs4;
				12'd3052: tone = `Gs4; 12'd3053: tone = `Gs4; 12'd3054: tone = `Gs4; 12'd3055: tone = `Gs4;
				12'd3056: tone = `Gs4; 12'd3057: tone = `Gs4; 12'd3058: tone = `Gs4; 12'd3059: tone = `Gs4;
				12'd3060: tone = `Gs4; 12'd3061: tone = `Gs4; 12'd3062: tone = `Gs4; 12'd3063: tone = `Gs4;
				12'd3064: tone = `Gs4; 12'd3065: tone = `Gs4; 12'd3066: tone = `Gs4; 12'd3067: tone = `Gs4;
				12'd3068: tone = `Gs4; 12'd3069: tone = `Gs4; 12'd3070: tone = `Gs4; 12'd3071: tone = `S;
				12'd3072: tone = `E5; 12'd3073: tone = `E5; 12'd3074: tone = `E5; 12'd3075: tone = `E5;
				12'd3076: tone = `E5; 12'd3077: tone = `E5; 12'd3078: tone = `E5; 12'd3079: tone = `E5;
				12'd3080: tone = `E5; 12'd3081: tone = `E5; 12'd3082: tone = `E5; 12'd3083: tone = `E5;
				12'd3084: tone = `E5; 12'd3085: tone = `E5; 12'd3086: tone = `E5; 12'd3087: tone = `S;
				12'd3088: tone = `B4; 12'd3089: tone = `B4; 12'd3090: tone = `B4; 12'd3091: tone = `B4;
				12'd3092: tone = `B4; 12'd3093: tone = `B4; 12'd3094: tone = `B4; 12'd3095: tone = `S;
				12'd3096: tone = `C5; 12'd3097: tone = `C5; 12'd3098: tone = `C5; 12'd3099: tone = `C5;
				12'd3100: tone = `C5; 12'd3101: tone = `C5; 12'd3102: tone = `C5; 12'd3103: tone = `S;
				12'd3104: tone = `D5; 12'd3105: tone = `D5; 12'd3106: tone = `D5; 12'd3107: tone = `D5;
				12'd3108: tone = `D5; 12'd3109: tone = `D5; 12'd3110: tone = `D5; 12'd3111: tone = `S;
				12'd3112: tone = `E5; 12'd3113: tone = `E5; 12'd3114: tone = `E5; 12'd3115: tone = `E5;
				12'd3116: tone = `E5; 12'd3117: tone = `E5; 12'd3118: tone = `E5; 12'd3119: tone = `S;
				12'd3120: tone = `C5; 12'd3121: tone = `C5; 12'd3122: tone = `C5; 12'd3123: tone = `C5;
				12'd3124: tone = `C5; 12'd3125: tone = `C5; 12'd3126: tone = `C5; 12'd3127: tone = `S;
				12'd3128: tone = `B4; 12'd3129: tone = `B4; 12'd3130: tone = `B4; 12'd3131: tone = `B4;
				12'd3132: tone = `B4; 12'd3133: tone = `B4; 12'd3134: tone = `B4; 12'd3135: tone = `S;
				12'd3136: tone = `A4; 12'd3137: tone = `A4; 12'd3138: tone = `A4; 12'd3139: tone = `A4;
				12'd3140: tone = `A4; 12'd3141: tone = `A4; 12'd3142: tone = `A4; 12'd3143: tone = `A4;
				12'd3144: tone = `A4; 12'd3145: tone = `A4; 12'd3146: tone = `A4; 12'd3147: tone = `A4;
				12'd3148: tone = `A4; 12'd3149: tone = `A4; 12'd3150: tone = `A4; 12'd3151: tone = `S;
				12'd3152: tone = `A4; 12'd3153: tone = `A4; 12'd3154: tone = `A4; 12'd3155: tone = `A4;
				12'd3156: tone = `A4; 12'd3157: tone = `A4; 12'd3158: tone = `A4; 12'd3159: tone = `S;
				12'd3160: tone = `C5; 12'd3161: tone = `C5; 12'd3162: tone = `C5; 12'd3163: tone = `C5;
				12'd3164: tone = `C5; 12'd3165: tone = `C5; 12'd3166: tone = `C5; 12'd3167: tone = `S;
				12'd3168: tone = `E5; 12'd3169: tone = `E5; 12'd3170: tone = `E5; 12'd3171: tone = `E5;
				12'd3172: tone = `E5; 12'd3173: tone = `E5; 12'd3174: tone = `E5; 12'd3175: tone = `E5;
				12'd3176: tone = `E5; 12'd3177: tone = `E5; 12'd3178: tone = `E5; 12'd3179: tone = `E5;
				12'd3180: tone = `E5; 12'd3181: tone = `E5; 12'd3182: tone = `E5; 12'd3183: tone = `S;
				12'd3184: tone = `D5; 12'd3185: tone = `D5; 12'd3186: tone = `D5; 12'd3187: tone = `D5;
				12'd3188: tone = `D5; 12'd3189: tone = `D5; 12'd3190: tone = `D5; 12'd3191: tone = `S;
				12'd3192: tone = `C5; 12'd3193: tone = `C5; 12'd3194: tone = `C5; 12'd3195: tone = `C5;
				12'd3196: tone = `C5; 12'd3197: tone = `C5; 12'd3198: tone = `C5; 12'd3199: tone = `S;
				12'd3200: tone = `B4; 12'd3201: tone = `B4; 12'd3202: tone = `B4; 12'd3203: tone = `B4;
				12'd3204: tone = `B4; 12'd3205: tone = `B4; 12'd3206: tone = `B4; 12'd3207: tone = `B4;
				12'd3208: tone = `B4; 12'd3209: tone = `B4; 12'd3210: tone = `B4; 12'd3211: tone = `B4;
				12'd3212: tone = `B4; 12'd3213: tone = `B4; 12'd3214: tone = `B4; 12'd3215: tone = `S;
				12'd3216: tone = `B4; 12'd3217: tone = `B4; 12'd3218: tone = `B4; 12'd3219: tone = `B4;
				12'd3220: tone = `B4; 12'd3221: tone = `B4; 12'd3222: tone = `B4; 12'd3223: tone = `S;
				12'd3224: tone = `C5; 12'd3225: tone = `C5; 12'd3226: tone = `C5; 12'd3227: tone = `C5;
				12'd3228: tone = `C5; 12'd3229: tone = `C5; 12'd3230: tone = `C5; 12'd3231: tone = `S;
				12'd3232: tone = `D5; 12'd3233: tone = `D5; 12'd3234: tone = `D5; 12'd3235: tone = `D5;
				12'd3236: tone = `D5; 12'd3237: tone = `D5; 12'd3238: tone = `D5; 12'd3239: tone = `D5;
				12'd3240: tone = `D5; 12'd3241: tone = `D5; 12'd3242: tone = `D5; 12'd3243: tone = `D5;
				12'd3244: tone = `D5; 12'd3245: tone = `D5; 12'd3246: tone = `D5; 12'd3247: tone = `S;
				12'd3248: tone = `E5; 12'd3249: tone = `E5; 12'd3250: tone = `E5; 12'd3251: tone = `E5;
				12'd3252: tone = `E5; 12'd3253: tone = `E5; 12'd3254: tone = `E5; 12'd3255: tone = `E5;
				12'd3256: tone = `E5; 12'd3257: tone = `E5; 12'd3258: tone = `E5; 12'd3259: tone = `E5;
				12'd3260: tone = `E5; 12'd3261: tone = `E5; 12'd3262: tone = `E5; 12'd3263: tone = `S;
				12'd3264: tone = `C5; 12'd3265: tone = `C5; 12'd3266: tone = `C5; 12'd3267: tone = `C5;
				12'd3268: tone = `C5; 12'd3269: tone = `C5; 12'd3270: tone = `C5; 12'd3271: tone = `C5;
				12'd3272: tone = `C5; 12'd3273: tone = `C5; 12'd3274: tone = `C5; 12'd3275: tone = `C5;
				12'd3276: tone = `C5; 12'd3277: tone = `C5; 12'd3278: tone = `C5; 12'd3279: tone = `S;
				12'd3280: tone = `A4; 12'd3281: tone = `A4; 12'd3282: tone = `A4; 12'd3283: tone = `A4;
				12'd3284: tone = `A4; 12'd3285: tone = `A4; 12'd3286: tone = `A4; 12'd3287: tone = `A4;
				12'd3288: tone = `A4; 12'd3289: tone = `A4; 12'd3290: tone = `A4; 12'd3291: tone = `A4;
				12'd3292: tone = `A4; 12'd3293: tone = `A4; 12'd3294: tone = `A4; 12'd3295: tone = `S;
				12'd3296: tone = `A4; 12'd3297: tone = `A4; 12'd3298: tone = `A4; 12'd3299: tone = `A4;
				12'd3300: tone = `A4; 12'd3301: tone = `A4; 12'd3302: tone = `A4; 12'd3303: tone = `A4;
				12'd3304: tone = `A4; 12'd3305: tone = `A4; 12'd3306: tone = `A4; 12'd3307: tone = `A4;
				12'd3308: tone = `A4; 12'd3309: tone = `A4; 12'd3310: tone = `A4; 12'd3311: tone = `A4;
				12'd3312: tone = `A4; 12'd3313: tone = `A4; 12'd3314: tone = `A4; 12'd3315: tone = `A4;
				12'd3316: tone = `A4; 12'd3317: tone = `A4; 12'd3318: tone = `A4; 12'd3319: tone = `A4;
				12'd3320: tone = `A4; 12'd3321: tone = `A4; 12'd3322: tone = `A4; 12'd3323: tone = `A4;
				12'd3324: tone = `A4; 12'd3325: tone = `A4; 12'd3326: tone = `A4; 12'd3327: tone = `S;
				12'd3328: tone = `S; 12'd3329: tone = `S; 12'd3330: tone = `S; 12'd3331: tone = `S;
				12'd3332: tone = `S; 12'd3333: tone = `S; 12'd3334: tone = `S; 12'd3335: tone = `S;
				12'd3336: tone = `D5; 12'd3337: tone = `D5; 12'd3338: tone = `D5; 12'd3339: tone = `D5;
				12'd3340: tone = `D5; 12'd3341: tone = `D5; 12'd3342: tone = `D5; 12'd3343: tone = `D5;
				12'd3344: tone = `D5; 12'd3345: tone = `D5; 12'd3346: tone = `D5; 12'd3347: tone = `D5;
				12'd3348: tone = `D5; 12'd3349: tone = `D5; 12'd3350: tone = `D5; 12'd3351: tone = `S;
				12'd3352: tone = `F5; 12'd3353: tone = `F5; 12'd3354: tone = `F5; 12'd3355: tone = `F5;
				12'd3356: tone = `F5; 12'd3357: tone = `F5; 12'd3358: tone = `F5; 12'd3359: tone = `S;
				12'd3360: tone = `A5; 12'd3361: tone = `A5; 12'd3362: tone = `A5; 12'd3363: tone = `A5;
				12'd3364: tone = `A5; 12'd3365: tone = `A5; 12'd3366: tone = `A5; 12'd3367: tone = `A5;
				12'd3368: tone = `A5; 12'd3369: tone = `A5; 12'd3370: tone = `A5; 12'd3371: tone = `A5;
				12'd3372: tone = `A5; 12'd3373: tone = `A5; 12'd3374: tone = `A5; 12'd3375: tone = `S;
				12'd3376: tone = `G5; 12'd3377: tone = `G5; 12'd3378: tone = `G5; 12'd3379: tone = `G5;
				12'd3380: tone = `G5; 12'd3381: tone = `G5; 12'd3382: tone = `G5; 12'd3383: tone = `S;
				12'd3384: tone = `F5; 12'd3385: tone = `F5; 12'd3386: tone = `F5; 12'd3387: tone = `F5;
				12'd3388: tone = `F5; 12'd3389: tone = `F5; 12'd3390: tone = `F5; 12'd3391: tone = `S;
				12'd3392: tone = `S; 12'd3393: tone = `S; 12'd3394: tone = `S; 12'd3395: tone = `S;
				12'd3396: tone = `S; 12'd3397: tone = `S; 12'd3398: tone = `S; 12'd3399: tone = `S;
				12'd3400: tone = `E5; 12'd3401: tone = `E5; 12'd3402: tone = `E5; 12'd3403: tone = `E5;
				12'd3404: tone = `E5; 12'd3405: tone = `E5; 12'd3406: tone = `E5; 12'd3407: tone = `E5;
				12'd3408: tone = `E5; 12'd3409: tone = `E5; 12'd3410: tone = `E5; 12'd3411: tone = `E5;
				12'd3412: tone = `E5; 12'd3413: tone = `E5; 12'd3414: tone = `E5; 12'd3415: tone = `S;
				12'd3416: tone = `C5; 12'd3417: tone = `C5; 12'd3418: tone = `C5; 12'd3419: tone = `C5;
				12'd3420: tone = `C5; 12'd3421: tone = `C5; 12'd3422: tone = `C5; 12'd3423: tone = `S;
				12'd3424: tone = `E5; 12'd3425: tone = `E5; 12'd3426: tone = `E5; 12'd3427: tone = `E5;
				12'd3428: tone = `E5; 12'd3429: tone = `E5; 12'd3430: tone = `E5; 12'd3431: tone = `E5;
				12'd3432: tone = `E5; 12'd3433: tone = `E5; 12'd3434: tone = `E5; 12'd3435: tone = `E5;
				12'd3436: tone = `E5; 12'd3437: tone = `E5; 12'd3438: tone = `E5; 12'd3439: tone = `S;
				12'd3440: tone = `D5; 12'd3441: tone = `D5; 12'd3442: tone = `D5; 12'd3443: tone = `D5;
				12'd3444: tone = `D5; 12'd3445: tone = `D5; 12'd3446: tone = `D5; 12'd3447: tone = `S;
				12'd3448: tone = `C5; 12'd3449: tone = `C5; 12'd3450: tone = `C5; 12'd3451: tone = `C5;
				12'd3452: tone = `C5; 12'd3453: tone = `C5; 12'd3454: tone = `C5; 12'd3455: tone = `S;
				12'd3456: tone = `B4; 12'd3457: tone = `B4; 12'd3458: tone = `B4; 12'd3459: tone = `B4;
				12'd3460: tone = `B4; 12'd3461: tone = `B4; 12'd3462: tone = `B4; 12'd3463: tone = `B4;
				12'd3464: tone = `B4; 12'd3465: tone = `B4; 12'd3466: tone = `B4; 12'd3467: tone = `B4;
				12'd3468: tone = `B4; 12'd3469: tone = `B4; 12'd3470: tone = `B4; 12'd3471: tone = `S;
				12'd3472: tone = `B4; 12'd3473: tone = `B4; 12'd3474: tone = `B4; 12'd3475: tone = `B4;
				12'd3476: tone = `B4; 12'd3477: tone = `B4; 12'd3478: tone = `B4; 12'd3479: tone = `S;
				12'd3480: tone = `C5; 12'd3481: tone = `C5; 12'd3482: tone = `C5; 12'd3483: tone = `C5;
				12'd3484: tone = `C5; 12'd3485: tone = `C5; 12'd3486: tone = `C5; 12'd3487: tone = `S;
				12'd3488: tone = `D5; 12'd3489: tone = `D5; 12'd3490: tone = `D5; 12'd3491: tone = `D5;
				12'd3492: tone = `D5; 12'd3493: tone = `D5; 12'd3494: tone = `D5; 12'd3495: tone = `D5;
				12'd3496: tone = `D5; 12'd3497: tone = `D5; 12'd3498: tone = `D5; 12'd3499: tone = `D5;
				12'd3500: tone = `D5; 12'd3501: tone = `D5; 12'd3502: tone = `D5; 12'd3503: tone = `S;
				12'd3504: tone = `E5; 12'd3505: tone = `E5; 12'd3506: tone = `E5; 12'd3507: tone = `E5;
				12'd3508: tone = `E5; 12'd3509: tone = `E5; 12'd3510: tone = `E5; 12'd3511: tone = `E5;
				12'd3512: tone = `E5; 12'd3513: tone = `E5; 12'd3514: tone = `E5; 12'd3515: tone = `E5;
				12'd3516: tone = `E5; 12'd3517: tone = `E5; 12'd3518: tone = `E5; 12'd3519: tone = `S;
				12'd3520: tone = `C5; 12'd3521: tone = `C5; 12'd3522: tone = `C5; 12'd3523: tone = `C5;
				12'd3524: tone = `C5; 12'd3525: tone = `C5; 12'd3526: tone = `C5; 12'd3527: tone = `C5;
				12'd3528: tone = `C5; 12'd3529: tone = `C5; 12'd3530: tone = `C5; 12'd3531: tone = `C5;
				12'd3532: tone = `C5; 12'd3533: tone = `C5; 12'd3534: tone = `C5; 12'd3535: tone = `S;
				12'd3536: tone = `A4; 12'd3537: tone = `A4; 12'd3538: tone = `A4; 12'd3539: tone = `A4;
				12'd3540: tone = `A4; 12'd3541: tone = `A4; 12'd3542: tone = `A4; 12'd3543: tone = `A4;
				12'd3544: tone = `A4; 12'd3545: tone = `A4; 12'd3546: tone = `A4; 12'd3547: tone = `A4;
				12'd3548: tone = `A4; 12'd3549: tone = `A4; 12'd3550: tone = `A4; 12'd3551: tone = `S;
				12'd3552: tone = `A4; 12'd3553: tone = `A4; 12'd3554: tone = `A4; 12'd3555: tone = `A4;
				12'd3556: tone = `A4; 12'd3557: tone = `A4; 12'd3558: tone = `A4; 12'd3559: tone = `A4;
				12'd3560: tone = `A4; 12'd3561: tone = `A4; 12'd3562: tone = `A4; 12'd3563: tone = `A4;
				12'd3564: tone = `A4; 12'd3565: tone = `A4; 12'd3566: tone = `A4; 12'd3567: tone = `A4;
				12'd3568: tone = `A4; 12'd3569: tone = `A4; 12'd3570: tone = `A4; 12'd3571: tone = `A4;
				12'd3572: tone = `A4; 12'd3573: tone = `A4; 12'd3574: tone = `A4; 12'd3575: tone = `A4;
				12'd3576: tone = `A4; 12'd3577: tone = `A4; 12'd3578: tone = `A4; 12'd3579: tone = `A4;
				12'd3580: tone = `A4; 12'd3581: tone = `A4; 12'd3582: tone = `A4; 12'd3583: tone = `S;

                default: tone = `sil;
            endcase
        end else begin
            tone = `sil;
        end
    end

endmodule