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

module music_example (
	input [11:0] ibeatNum,
	input en,
	output reg [31:0] toneL,
    output reg [31:0] toneR
);

    always @* begin
        if(en == 1) begin
            case(ibeatNum)
              12'd0: toneR = `G4; 12'd1: toneR = `G4; 12'd2: toneR = `G4; 12'd3: toneR = `G4;
                    12'd4: toneR = `G4; 12'd5: toneR = `G4; 12'd6: toneR = `G4; 12'd7: toneR = `G4;
                    12'd8: toneR = `Bf4; 12'd9: toneR = `Bf4; 12'd10: toneR = `Bf4; 12'd11: toneR = `Bf4;
                    12'd12: toneR = `Bf4; 12'd13: toneR = `Bf4; 12'd14: toneR = `Bf4; 12'd15: toneR = `Bf4;
                    12'd16: toneR = `C5; 12'd17: toneR = `C5; 12'd18: toneR = `C5; 12'd19: toneR = `C5;
                    12'd20: toneR = `C5; 12'd21: toneR = `C5; 12'd22: toneR = `C5; 12'd23: toneR = `C5;
                    12'd24: toneR = `C5; 12'd25: toneR = `C5; 12'd26: toneR = `C5; 12'd27: toneR = `C5;
                    12'd28: toneR = `Af4; 12'd29: toneR = `Af4; 12'd30: toneR = `Af4; 12'd31: toneR = `Af4;
                    12'd32: toneR = `Af4; 12'd33: toneR = `Af4; 12'd34: toneR = `Af4; 12'd35: toneR = `Af4;
                    12'd36: toneR = `Af4; 12'd37: toneR = `Af4; 12'd38: toneR = `Af4; 12'd39: toneR = `Af4;
                    12'd40: toneR = `G4; 12'd41: toneR = `G4; 12'd42: toneR = `G4; 12'd43: toneR = `G4;
                    12'd44: toneR = `G4; 12'd45: toneR = `G4; 12'd46: toneR = `G4; 12'd47: toneR = `G4;
                    12'd48: toneR = `F4; 12'd49: toneR = `F4; 12'd50: toneR = `F4; 12'd51: toneR = `F4;
                    12'd52: toneR = `F4; 12'd53: toneR = `F4; 12'd54: toneR = `F4; 12'd55: toneR = `F4;
                    12'd56: toneR = `Ef4; 12'd57: toneR = `Ef4; 12'd58: toneR = `Ef4; 12'd59: toneR = `Ef4;
                    12'd60: toneR = `Ef4; 12'd61: toneR = `Ef4; 12'd62: toneR = `Ef4; 12'd63: toneR = `Ef4;
                    12'd64: toneR = `F4; 12'd65: toneR = `F4; 12'd66: toneR = `F4; 12'd67: toneR = `F4;
                    12'd68: toneR = `F4; 12'd69: toneR = `F4; 12'd70: toneR = `F4; 12'd71: toneR = `F4;
                    12'd72: toneR = `C5; 12'd73: toneR = `C5; 12'd74: toneR = `C5; 12'd75: toneR = `C5;
                    12'd76: toneR = `C5; 12'd77: toneR = `C5; 12'd78: toneR = `C5; 12'd79: toneR = `C5;
                    12'd80: toneR = `Bf4; 12'd81: toneR = `Bf4; 12'd82: toneR = `Bf4; 12'd83: toneR = `Bf4;
                    12'd84: toneR = `Bf4; 12'd85: toneR = `Bf4; 12'd86: toneR = `Bf4; 12'd87: toneR = `Bf4;
                    12'd88: toneR = `C5; 12'd89: toneR = `C5; 12'd90: toneR = `C5; 12'd91: toneR = `C5;
                    12'd92: toneR = `G4; 12'd93: toneR = `G4; 12'd94: toneR = `G4; 12'd95: toneR = `G4;
                    12'd96: toneR = `G4; 12'd97: toneR = `G4; 12'd98: toneR = `G4; 12'd99: toneR = `G4;
                    12'd100: toneR = `G4; 12'd101: toneR = `G4; 12'd102: toneR = `G4; 12'd103: toneR = `G4;
                    12'd104: toneR = `F4; 12'd105: toneR = `F4; 12'd106: toneR = `F4; 12'd107: toneR = `F4;
                    12'd108: toneR = `F4; 12'd109: toneR = `F4; 12'd110: toneR = `F4; 12'd111: toneR = `F4;
                    12'd112: toneR = `Ef4; 12'd113: toneR = `Ef4; 12'd114: toneR = `Ef4; 12'd115: toneR = `Ef4;
                    12'd116: toneR = `Ef4; 12'd117: toneR = `Ef4; 12'd118: toneR = `Ef4; 12'd119: toneR = `Ef4;
                    12'd120: toneR = `Ef4; 12'd121: toneR = `Ef4; 12'd122: toneR = `Ef4; 12'd123: toneR = `Ef4;
                    12'd124: toneR = `Ef4; 12'd125: toneR = `Ef4; 12'd126: toneR = `Ef4; 12'd127: toneR = `Ef4;
                    12'd128: toneR = `C4; 12'd129: toneR = `C4; 12'd130: toneR = `C4; 12'd131: toneR = `C4;
                    12'd132: toneR = `C4; 12'd133: toneR = `C4; 12'd134: toneR = `C4; 12'd135: toneR = `C4;
                    12'd136: toneR = `Ef4; 12'd137: toneR = `Ef4; 12'd138: toneR = `Ef4; 12'd139: toneR = `Ef4;
                    12'd140: toneR = `Ef4; 12'd141: toneR = `Ef4; 12'd142: toneR = `Ef4; 12'd143: toneR = `Ef4;
                    12'd144: toneR = `F4; 12'd145: toneR = `F4; 12'd146: toneR = `F4; 12'd147: toneR = `F4;
                    12'd148: toneR = `F4; 12'd149: toneR = `F4; 12'd150: toneR = `F4; 12'd151: toneR = `F4;
                    12'd152: toneR = `F4; 12'd153: toneR = `F4; 12'd154: toneR = `F4; 12'd155: toneR = `F4;
                    12'd156: toneR = `D4; 12'd157: toneR = `D4; 12'd158: toneR = `D4; 12'd159: toneR = `D4;
                    12'd160: toneR = `D4; 12'd161: toneR = `D4; 12'd162: toneR = `D4; 12'd163: toneR = `D4;
                    12'd164: toneR = `D4; 12'd165: toneR = `D4; 12'd166: toneR = `D4; 12'd167: toneR = `D4;
                    12'd168: toneR = `Af4; 12'd169: toneR = `Af4; 12'd170: toneR = `Af4; 12'd171: toneR = `Af4;
                    12'd172: toneR = `Af4; 12'd173: toneR = `Af4; 12'd174: toneR = `Af4; 12'd175: toneR = `Af4;
                    12'd176: toneR = `G4; 12'd177: toneR = `G4; 12'd178: toneR = `G4; 12'd179: toneR = `G4;
                    12'd180: toneR = `G4; 12'd181: toneR = `G4; 12'd182: toneR = `G4; 12'd183: toneR = `G4;
                    12'd184: toneR = `G5; 12'd185: toneR = `G5; 12'd186: toneR = `G5; 12'd187: toneR = `G5;
                    12'd188: toneR = `G5; 12'd189: toneR = `G5; 12'd190: toneR = `G5; 12'd191: toneR = `G5;
                    12'd192: toneR = `F5; 12'd193: toneR = `F5; 12'd194: toneR = `F5; 12'd195: toneR = `F5;
                    12'd196: toneR = `F5; 12'd197: toneR = `F5; 12'd198: toneR = `F5; 12'd199: toneR = `F5;
                    12'd200: toneR = `D5; 12'd201: toneR = `D5; 12'd202: toneR = `D5; 12'd203: toneR = `D5;
                    12'd204: toneR = `D5; 12'd205: toneR = `D5; 12'd206: toneR = `D5; 12'd207: toneR = `D5;
                    12'd208: toneR = `Ef5; 12'd209: toneR = `Ef5; 12'd210: toneR = `Ef5; 12'd211: toneR = `Ef5;
                    12'd212: toneR = `Ef5; 12'd213: toneR = `Ef5; 12'd214: toneR = `Ef5; 12'd215: toneR = `Ef5;
                    12'd216: toneR = `Ef5; 12'd217: toneR = `Ef5; 12'd218: toneR = `Ef5; 12'd219: toneR = `Ef5;
                    12'd220: toneR = `D5; 12'd221: toneR = `D5; 12'd222: toneR = `D5; 12'd223: toneR = `D5;
                    12'd224: toneR = `D5; 12'd225: toneR = `D5; 12'd226: toneR = `D5; 12'd227: toneR = `D5;
                    12'd228: toneR = `D5; 12'd229: toneR = `D5; 12'd230: toneR = `D5; 12'd231: toneR = `D5;
                    12'd232: toneR = `Bf4; 12'd233: toneR = `Bf4; 12'd234: toneR = `Bf4; 12'd235: toneR = `Bf4;
                    12'd236: toneR = `Bf4; 12'd237: toneR = `Bf4; 12'd238: toneR = `Bf4; 12'd239: toneR = `Bf4;
                    12'd240: toneR = `C5; 12'd241: toneR = `C5; 12'd242: toneR = `C5; 12'd243: toneR = `C5;
                    12'd244: toneR = `C5; 12'd245: toneR = `C5; 12'd246: toneR = `C5; 12'd247: toneR = `C5;
                    12'd248: toneR = `Bf4; 12'd249: toneR = `Bf4; 12'd250: toneR = `Bf4; 12'd251: toneR = `Bf4;
                    12'd252: toneR = `Bf4; 12'd253: toneR = `Bf4; 12'd254: toneR = `Bf4; 12'd255: toneR = `Bf4;
                    12'd256: toneR = `G4; 12'd257: toneR = `G4; 12'd258: toneR = `G4; 12'd259: toneR = `G4;
                    12'd260: toneR = `G4; 12'd261: toneR = `G4; 12'd262: toneR = `G4; 12'd263: toneR = `G4;
                    12'd264: toneR = `Bf4; 12'd265: toneR = `Bf4; 12'd266: toneR = `Bf4; 12'd267: toneR = `Bf4;
                    12'd268: toneR = `Bf4; 12'd269: toneR = `Bf4; 12'd270: toneR = `Bf4; 12'd271: toneR = `Bf4;
                    12'd272: toneR = `C5; 12'd273: toneR = `C5; 12'd274: toneR = `C5; 12'd275: toneR = `C5;
                    12'd276: toneR = `C5; 12'd277: toneR = `C5; 12'd278: toneR = `C5; 12'd279: toneR = `C5;
                    12'd280: toneR = `C5; 12'd281: toneR = `C5; 12'd282: toneR = `C5; 12'd283: toneR = `C5;
                    12'd284: toneR = `Af4; 12'd285: toneR = `Af4; 12'd286: toneR = `Af4; 12'd287: toneR = `Af4;
                    12'd288: toneR = `Af4; 12'd289: toneR = `Af4; 12'd290: toneR = `Af4; 12'd291: toneR = `Af4;
                    12'd292: toneR = `Af4; 12'd293: toneR = `Af4; 12'd294: toneR = `Af4; 12'd295: toneR = `Af4;
                    12'd296: toneR = `G4; 12'd297: toneR = `G4; 12'd298: toneR = `G4; 12'd299: toneR = `G4;
                    12'd300: toneR = `G4; 12'd301: toneR = `G4; 12'd302: toneR = `G4; 12'd303: toneR = `G4;
                    12'd304: toneR = `F4; 12'd305: toneR = `F4; 12'd306: toneR = `F4; 12'd307: toneR = `F4;
                    12'd308: toneR = `F4; 12'd309: toneR = `F4; 12'd310: toneR = `F4; 12'd311: toneR = `F4;
                    12'd312: toneR = `D5; 12'd313: toneR = `D5; 12'd314: toneR = `D5; 12'd315: toneR = `D5;
                    12'd316: toneR = `D5; 12'd317: toneR = `D5; 12'd318: toneR = `D5; 12'd319: toneR = `D5;
                    12'd320: toneR = `C5; 12'd321: toneR = `C5; 12'd322: toneR = `C5; 12'd323: toneR = `C5;
                    12'd324: toneR = `C5; 12'd325: toneR = `C5; 12'd326: toneR = `C5; 12'd327: toneR = `C5;
                    12'd328: toneR = `Bf4; 12'd329: toneR = `Bf4; 12'd330: toneR = `Bf4; 12'd331: toneR = `Bf4;
                    12'd332: toneR = `Bf4; 12'd333: toneR = `Bf4; 12'd334: toneR = `Bf4; 12'd335: toneR = `S;
                    12'd336: toneR = `Bf4; 12'd337: toneR = `Bf4; 12'd338: toneR = `Bf4; 12'd339: toneR = `Bf4;
                    12'd340: toneR = `Bf4; 12'd341: toneR = `Bf4; 12'd342: toneR = `Bf4; 12'd343: toneR = `Bf4;
                    12'd344: toneR = `C5; 12'd345: toneR = `C5; 12'd346: toneR = `C5; 12'd347: toneR = `C5;
                    12'd348: toneR = `C5; 12'd349: toneR = `C5; 12'd350: toneR = `C5; 12'd351: toneR = `C5;
                    12'd352: toneR = `D5; 12'd353: toneR = `D5; 12'd354: toneR = `D5; 12'd355: toneR = `D5;
                    12'd356: toneR = `D5; 12'd357: toneR = `D5; 12'd358: toneR = `D5; 12'd359: toneR = `D5;
                    12'd360: toneR = `Ef5; 12'd361: toneR = `Ef5; 12'd362: toneR = `Ef5; 12'd363: toneR = `Ef5;
                    12'd364: toneR = `Ef5; 12'd365: toneR = `Ef5; 12'd366: toneR = `Ef5; 12'd367: toneR = `Ef5;
                    12'd368: toneR = `Ef5; 12'd369: toneR = `Ef5; 12'd370: toneR = `Ef5; 12'd371: toneR = `Ef5;
                    12'd372: toneR = `Ef5; 12'd373: toneR = `Ef5; 12'd374: toneR = `Ef5; 12'd375: toneR = `Ef5;
                    12'd376: toneR = `G4; 12'd377: toneR = `G4; 12'd378: toneR = `G4; 12'd379: toneR = `G4;
                    12'd380: toneR = `G4; 12'd381: toneR = `G4; 12'd382: toneR = `G4; 12'd383: toneR = `S;
                    12'd384: toneR = `G4; 12'd385: toneR = `G4; 12'd386: toneR = `G4; 12'd387: toneR = `G4;
                    12'd388: toneR = `G4; 12'd389: toneR = `G4; 12'd390: toneR = `G4; 12'd391: toneR = `G4;
                    12'd392: toneR = `F4; 12'd393: toneR = `F4; 12'd394: toneR = `F4; 12'd395: toneR = `F4;
                    12'd396: toneR = `F4; 12'd397: toneR = `F4; 12'd398: toneR = `F4; 12'd399: toneR = `F4;
                    12'd400: toneR = `Ef4; 12'd401: toneR = `Ef4; 12'd402: toneR = `Ef4; 12'd403: toneR = `Ef4;
                    12'd404: toneR = `Ef4; 12'd405: toneR = `Ef4; 12'd406: toneR = `Ef4; 12'd407: toneR = `Ef4;
                    12'd408: toneR = `Ef4; 12'd409: toneR = `Ef4; 12'd410: toneR = `Ef4; 12'd411: toneR = `Ef4;
                    12'd412: toneR = `Ef4; 12'd413: toneR = `Ef4; 12'd414: toneR = `Ef4; 12'd415: toneR = `Ef4;
                    12'd416: toneR = `Ef4; 12'd417: toneR = `Ef4; 12'd418: toneR = `Ef4; 12'd419: toneR = `Ef4;
                    12'd420: toneR = `Ef4; 12'd421: toneR = `Ef4; 12'd422: toneR = `Ef4; 12'd423: toneR = `Ef4;
                    12'd424: toneR = `Ef4; 12'd425: toneR = `Ef4; 12'd426: toneR = `Ef4; 12'd427: toneR = `Ef4;
                    12'd428: toneR = `Ef4; 12'd429: toneR = `Ef4; 12'd430: toneR = `Ef4; 12'd431: toneR = `Ef4;
                    12'd432: toneR = `G4; 12'd433: toneR = `G4; 12'd434: toneR = `G4; 12'd435: toneR = `G4;
                    12'd436: toneR = `G4; 12'd437: toneR = `G4; 12'd438: toneR = `G4; 12'd439: toneR = `G4;
                    12'd440: toneR = `G5; 12'd441: toneR = `G5; 12'd442: toneR = `G5; 12'd443: toneR = `G5;
                    12'd444: toneR = `G5; 12'd445: toneR = `G5; 12'd446: toneR = `G5; 12'd447: toneR = `G5;
                    12'd448: toneR = `F5; 12'd449: toneR = `F5; 12'd450: toneR = `F5; 12'd451: toneR = `F5;
                    12'd452: toneR = `F5; 12'd453: toneR = `F5; 12'd454: toneR = `F5; 12'd455: toneR = `F5;
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
                    12'd500: toneR = `D5; 12'd501: toneR = `D5; 12'd502: toneR = `D5; 12'd503: toneR = `D5;
                    12'd504: toneR = `S; 12'd505: toneR = `S; 12'd506: toneR = `S; 12'd507: toneR = `S;
                    12'd508: toneR = `S; 12'd509: toneR = `S; 12'd510: toneR = `S; 12'd511: toneR = `S;

                default: toneR = `sil;
            endcase
        end else begin
            toneR = `sil;
        end
    end

    always @(*) begin
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
                    12'd44: toneL = `Af3; 12'd45: toneL = `Af3; 12'd46: toneL = `Af3; 12'd47: toneL = `Af3;
                    12'd48: toneL = `Bf3; 12'd49: toneL = `Bf3; 12'd50: toneL = `Bf3; 12'd51: toneL = `Bf3;
                    12'd52: toneL = `Bf3; 12'd53: toneL = `Bf3; 12'd54: toneL = `Bf3; 12'd55: toneL = `Bf3;
                    12'd56: toneL = `Bf3; 12'd57: toneL = `Bf3; 12'd58: toneL = `Bf3; 12'd59: toneL = `Bf3;
                    12'd60: toneL = `Bf3; 12'd61: toneL = `Bf3; 12'd62: toneL = `Bf3; 12'd63: toneL = `Bf3;
                    12'd64: toneL = `Bf3; 12'd65: toneL = `Bf3; 12'd66: toneL = `Bf3; 12'd67: toneL = `Bf3;
                    12'd68: toneL = `Bf3; 12'd69: toneL = `Bf3; 12'd70: toneL = `Bf3; 12'd71: toneL = `Bf3;
                    12'd72: toneL = `Bf3; 12'd73: toneL = `Bf3; 12'd74: toneL = `Bf3; 12'd75: toneL = `Bf3;
                    12'd76: toneL = `Bf3; 12'd77: toneL = `Bf3; 12'd78: toneL = `Bf3; 12'd79: toneL = `Bf3;
                    12'd80: toneL = `G3; 12'd81: toneL = `G3; 12'd82: toneL = `G3; 12'd83: toneL = `G3;
                    12'd84: toneL = `G3; 12'd85: toneL = `G3; 12'd86: toneL = `G3; 12'd87: toneL = `G3;
                    12'd88: toneL = `G3; 12'd89: toneL = `G3; 12'd90: toneL = `G3; 12'd91: toneL = `G3;
                    12'd92: toneL = `G3; 12'd93: toneL = `G3; 12'd94: toneL = `G3; 12'd95: toneL = `G3;
                    12'd96: toneL = `G3; 12'd97: toneL = `G3; 12'd98: toneL = `G3; 12'd99: toneL = `G3;
                    12'd100: toneL = `G3; 12'd101: toneL = `G3; 12'd102: toneL = `G3; 12'd103: toneL = `G3;
                    12'd104: toneL = `G3; 12'd105: toneL = `G3; 12'd106: toneL = `G3; 12'd107: toneL = `G3;
                    12'd108: toneL = `G3; 12'd109: toneL = `G3; 12'd110: toneL = `G3; 12'd111: toneL = `G3;
                    12'd112: toneL = `C4; 12'd113: toneL = `C4; 12'd114: toneL = `C4; 12'd115: toneL = `C4;
                    12'd116: toneL = `C4; 12'd117: toneL = `C4; 12'd118: toneL = `C4; 12'd119: toneL = `C4;
                    12'd120: toneL = `C4; 12'd121: toneL = `C4; 12'd122: toneL = `C4; 12'd123: toneL = `C4;
                    12'd124: toneL = `C4; 12'd125: toneL = `C4; 12'd126: toneL = `C4; 12'd127: toneL = `C4;
                    12'd128: toneL = `C4; 12'd129: toneL = `C4; 12'd130: toneL = `C4; 12'd131: toneL = `C4;
                    12'd132: toneL = `C4; 12'd133: toneL = `C4; 12'd134: toneL = `C4; 12'd135: toneL = `C4;
                    12'd136: toneL = `C4; 12'd137: toneL = `C4; 12'd138: toneL = `C4; 12'd139: toneL = `C4;
                    12'd140: toneL = `C4; 12'd141: toneL = `C4; 12'd142: toneL = `C4; 12'd143: toneL = `C4;
                    12'd144: toneL = `Af3; 12'd145: toneL = `Af3; 12'd146: toneL = `Af3; 12'd147: toneL = `Af3;
                    12'd148: toneL = `Af3; 12'd149: toneL = `Af3; 12'd150: toneL = `Af3; 12'd151: toneL = `Af3;
                    12'd152: toneL = `Af3; 12'd153: toneL = `Af3; 12'd154: toneL = `Af3; 12'd155: toneL = `Af3;
                    12'd156: toneL = `Af3; 12'd157: toneL = `Af3; 12'd158: toneL = `Af3; 12'd159: toneL = `Af3;
                    12'd160: toneL = `Af3; 12'd161: toneL = `Af3; 12'd162: toneL = `Af3; 12'd163: toneL = `Af3;
                    12'd164: toneL = `Af3; 12'd165: toneL = `Af3; 12'd166: toneL = `Af3; 12'd167: toneL = `Af3;
                    12'd168: toneL = `Af3; 12'd169: toneL = `Af3; 12'd170: toneL = `Af3; 12'd171: toneL = `Af3;
                    12'd172: toneL = `Af3; 12'd173: toneL = `Af3; 12'd174: toneL = `Af3; 12'd175: toneL = `Af3;
                    12'd176: toneL = `G3; 12'd177: toneL = `G3; 12'd178: toneL = `G3; 12'd179: toneL = `G3;
                    12'd180: toneL = `G3; 12'd181: toneL = `G3; 12'd182: toneL = `G3; 12'd183: toneL = `G3;
                    12'd184: toneL = `G3; 12'd185: toneL = `G3; 12'd186: toneL = `G3; 12'd187: toneL = `G3;
                    12'd188: toneL = `G3; 12'd189: toneL = `G3; 12'd190: toneL = `G3; 12'd191: toneL = `G3;
                    12'd192: toneL = `G3; 12'd193: toneL = `G3; 12'd194: toneL = `G3; 12'd195: toneL = `G3;
                    12'd196: toneL = `G3; 12'd197: toneL = `G3; 12'd198: toneL = `G3; 12'd199: toneL = `G3;
                    12'd200: toneL = `G3; 12'd201: toneL = `G3; 12'd202: toneL = `G3; 12'd203: toneL = `G3;
                    12'd204: toneL = `G3; 12'd205: toneL = `G3; 12'd206: toneL = `G3; 12'd207: toneL = `G3;
                    12'd208: toneL = `C4; 12'd209: toneL = `C4; 12'd210: toneL = `C4; 12'd211: toneL = `C4;
                    12'd212: toneL = `C4; 12'd213: toneL = `C4; 12'd214: toneL = `C4; 12'd215: toneL = `C4;
                    12'd216: toneL = `C4; 12'd217: toneL = `C4; 12'd218: toneL = `C4; 12'd219: toneL = `C4;
                    12'd220: toneL = `C4; 12'd221: toneL = `C4; 12'd222: toneL = `C4; 12'd223: toneL = `C4;
                    12'd224: toneL = `C4; 12'd225: toneL = `C4; 12'd226: toneL = `C4; 12'd227: toneL = `C4;
                    12'd228: toneL = `C4; 12'd229: toneL = `C4; 12'd230: toneL = `C4; 12'd231: toneL = `C4;
                    12'd232: toneL = `C4; 12'd233: toneL = `C4; 12'd234: toneL = `C4; 12'd235: toneL = `C4;
                    12'd236: toneL = `C4; 12'd237: toneL = `C4; 12'd238: toneL = `C4; 12'd239: toneL = `C4;
                    12'd240: toneL = `G3; 12'd241: toneL = `G3; 12'd242: toneL = `G3; 12'd243: toneL = `G3;
                    12'd244: toneL = `G3; 12'd245: toneL = `G3; 12'd246: toneL = `G3; 12'd247: toneL = `G3;
                    12'd248: toneL = `G3; 12'd249: toneL = `G3; 12'd250: toneL = `G3; 12'd251: toneL = `G3;
                    12'd252: toneL = `G3; 12'd253: toneL = `G3; 12'd254: toneL = `G3; 12'd255: toneL = `G3;
                    12'd256: toneL = `S; 12'd257: toneL = `S; 12'd258: toneL = `S; 12'd259: toneL = `S;
                    12'd260: toneL = `S; 12'd261: toneL = `S; 12'd262: toneL = `S; 12'd263: toneL = `S;
                    12'd264: toneL = `S; 12'd265: toneL = `S; 12'd266: toneL = `S; 12'd267: toneL = `S;
                    12'd268: toneL = `S; 12'd269: toneL = `S; 12'd270: toneL = `S; 12'd271: toneL = `S;
                    12'd272: toneL = `Af2; 12'd273: toneL = `Af2; 12'd274: toneL = `Af2; 12'd275: toneL = `Af2;
                    12'd276: toneL = `Af2; 12'd277: toneL = `Af2; 12'd278: toneL = `Af2; 12'd279: toneL = `Af2;
                    12'd280: toneL = `Ef3; 12'd281: toneL = `Ef3; 12'd282: toneL = `Ef3; 12'd283: toneL = `Ef3;
                    12'd284: toneL = `Ef3; 12'd285: toneL = `Ef3; 12'd286: toneL = `Ef3; 12'd287: toneL = `Ef3;
                    12'd288: toneL = `Af3; 12'd289: toneL = `Af3; 12'd290: toneL = `Af3; 12'd291: toneL = `Af3;
                    12'd292: toneL = `Af3; 12'd293: toneL = `Af3; 12'd294: toneL = `Af3; 12'd295: toneL = `Af3;
                    12'd296: toneL = `Ef3; 12'd297: toneL = `Ef3; 12'd298: toneL = `Ef3; 12'd299: toneL = `Ef3;
                    12'd300: toneL = `Ef3; 12'd301: toneL = `Ef3; 12'd302: toneL = `Ef3; 12'd303: toneL = `Ef3;
                    12'd304: toneL = `Bf2; 12'd305: toneL = `Bf2; 12'd306: toneL = `Bf2; 12'd307: toneL = `Bf2;
                    12'd308: toneL = `Bf2; 12'd309: toneL = `Bf2; 12'd310: toneL = `Bf2; 12'd311: toneL = `Bf2;
                    12'd312: toneL = `F3; 12'd313: toneL = `F3; 12'd314: toneL = `F3; 12'd315: toneL = `F3;
                    12'd316: toneL = `F3; 12'd317: toneL = `F3; 12'd318: toneL = `F3; 12'd319: toneL = `F3;
                    12'd320: toneL = `Bf3; 12'd321: toneL = `Bf3; 12'd322: toneL = `Bf3; 12'd323: toneL = `Bf3;
                    12'd324: toneL = `Bf3; 12'd325: toneL = `Bf3; 12'd326: toneL = `Bf3; 12'd327: toneL = `Bf3;
                    12'd328: toneL = `F3; 12'd329: toneL = `F3; 12'd330: toneL = `F3; 12'd331: toneL = `F3;
                    12'd332: toneL = `F3; 12'd333: toneL = `F3; 12'd334: toneL = `F3; 12'd335: toneL = `F3;
                    12'd336: toneL = `G2; 12'd337: toneL = `G2; 12'd338: toneL = `G2; 12'd339: toneL = `G2;
                    12'd340: toneL = `G2; 12'd341: toneL = `G2; 12'd342: toneL = `G2; 12'd343: toneL = `G2;
                    12'd344: toneL = `D3; 12'd345: toneL = `D3; 12'd346: toneL = `D3; 12'd347: toneL = `D3;
                    12'd348: toneL = `D3; 12'd349: toneL = `D3; 12'd350: toneL = `D3; 12'd351: toneL = `D3;
                    12'd352: toneL = `G3; 12'd353: toneL = `G3; 12'd354: toneL = `G3; 12'd355: toneL = `G3;
                    12'd356: toneL = `G3; 12'd357: toneL = `G3; 12'd358: toneL = `G3; 12'd359: toneL = `G3;
                    12'd360: toneL = `D3; 12'd361: toneL = `D3; 12'd362: toneL = `D3; 12'd363: toneL = `D3;
                    12'd364: toneL = `D3; 12'd365: toneL = `D3; 12'd366: toneL = `D3; 12'd367: toneL = `D3;
                    12'd368: toneL = `C3; 12'd369: toneL = `C3; 12'd370: toneL = `C3; 12'd371: toneL = `C3;
                    12'd372: toneL = `C3; 12'd373: toneL = `C3; 12'd374: toneL = `C3; 12'd375: toneL = `C3;
                    12'd376: toneL = `G3; 12'd377: toneL = `G3; 12'd378: toneL = `G3; 12'd379: toneL = `G3;
                    12'd380: toneL = `G3; 12'd381: toneL = `G3; 12'd382: toneL = `G3; 12'd383: toneL = `G3;
                    12'd384: toneL = `Ef4; 12'd385: toneL = `Ef4; 12'd386: toneL = `Ef4; 12'd387: toneL = `Ef4;
                    12'd388: toneL = `Ef4; 12'd389: toneL = `Ef4; 12'd390: toneL = `Ef4; 12'd391: toneL = `Ef4;
                    12'd392: toneL = `G3; 12'd393: toneL = `G3; 12'd394: toneL = `G3; 12'd395: toneL = `G3;
                    12'd396: toneL = `G3; 12'd397: toneL = `G3; 12'd398: toneL = `G3; 12'd399: toneL = `G3;
                    12'd400: toneL = `Af3; 12'd401: toneL = `Af3; 12'd402: toneL = `Af3; 12'd403: toneL = `Af3;
                    12'd404: toneL = `Af3; 12'd405: toneL = `Af3; 12'd406: toneL = `Af3; 12'd407: toneL = `Af3;
                    12'd408: toneL = `Af3; 12'd409: toneL = `Af3; 12'd410: toneL = `Af3; 12'd411: toneL = `Af3;
                    12'd412: toneL = `Af3; 12'd413: toneL = `Af3; 12'd414: toneL = `Af3; 12'd415: toneL = `Af3;
                    12'd416: toneL = `Af3; 12'd417: toneL = `Af3; 12'd418: toneL = `Af3; 12'd419: toneL = `Af3;
                    12'd420: toneL = `Af3; 12'd421: toneL = `Af3; 12'd422: toneL = `Af3; 12'd423: toneL = `Af3;
                    12'd424: toneL = `Af3; 12'd425: toneL = `Af3; 12'd426: toneL = `Af3; 12'd427: toneL = `Af3;
                    12'd428: toneL = `Af3; 12'd429: toneL = `Af3; 12'd430: toneL = `Af3; 12'd431: toneL = `Af3;
                    12'd432: toneL = `G3; 12'd433: toneL = `G3; 12'd434: toneL = `G3; 12'd435: toneL = `G3;
                    12'd436: toneL = `G3; 12'd437: toneL = `G3; 12'd438: toneL = `G3; 12'd439: toneL = `G3;
                    12'd440: toneL = `G3; 12'd441: toneL = `G3; 12'd442: toneL = `G3; 12'd443: toneL = `G3;
                    12'd444: toneL = `G3; 12'd445: toneL = `G3; 12'd446: toneL = `G3; 12'd447: toneL = `G3;
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
                    12'd492: toneL = `D3; 12'd493: toneL = `D3; 12'd494: toneL = `D3; 12'd495: toneL = `D3;
                    12'd496: toneL = `S; 12'd497: toneL = `S; 12'd498: toneL = `S; 12'd499: toneL = `S;
                    12'd500: toneL = `S; 12'd501: toneL = `S; 12'd502: toneL = `S; 12'd503: toneL = `S;
                    12'd504: toneL = `S; 12'd505: toneL = `S; 12'd506: toneL = `S; 12'd507: toneL = `S;
                    12'd508: toneL = `S; 12'd509: toneL = `S; 12'd510: toneL = `S; 12'd511: toneL = `S;

                default : toneL = `sil;
            endcase
        end
        else begin
            toneL = `sil;
        end
    end
endmodule