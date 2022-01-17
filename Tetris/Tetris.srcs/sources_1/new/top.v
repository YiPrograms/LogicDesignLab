
module clock_divider #(parameter max = 26) (
    input clk,
    input rst,
    output reg [max:0] div
);
    wire [max:0] next_num;
    assign next_num = div + 1'b1;

    always @(posedge clk, posedge rst) begin
        if (rst)
            div <= 0;
        else
            div <= next_num;
    end
endmodule


module tetris(
    input clk,
    input rst,

    output [3:0] vgaRed,
    output [3:0] vgaGreen,
    output [3:0] vgaBlue,
    output hsync,
    output vsync,

    inout PS2_DATA,
	inout PS2_CLK,

    input vol_up,
    input vol_down,
    output audio_mclk,
    output audio_lrck, 
    output audio_sck,
    output audio_sdin,

    input btn,
    input rx,
    output rx_ack,
    output tx,
    input tx_ack,

    output [6:0] DISPLAY,
    output [3:0] DIGIT,

    output [15:0] led
);
    wire [26:0] div;

    wire [799:0] block_states;
    wire [33:0] active_block;
    wire [199:0] block_bits;
    wire [3:0] hold_tile;
    wire [11:0] next_tiles;
    wire [19:0] whole_lines;
    wire [13:0] score;

    wire [7:0] keys;
    wire [3:0] state;

    clock_divider divs(
        .clk(clk),
        .rst(rst),
        .div(div)
    );

    vga_top vga_top_inst(
        .clk_25MHz(div[1]),
        .rst(rst),

        .block_states(block_states),
        .active_block(active_block),
        .state(state),
        .hold_tile(hold_tile),
        .next_tiles(next_tiles),
        .whole_lines(whole_lines),


        .vgaRed(vgaRed),
        .vgaGreen(vgaGreen),
        .vgaBlue(vgaBlue),
        .hsync(hsync),
        .vsync(vsync)
    );

    wire [4:0] xx;
    wire [3:0] yy;
    wire [3:0] dat;
    wire [3:0] led_test;

    wire send_block;
    wire received_block;

    tetris_controller tetris_controller_inst(
        .clk(div[8]),
        .clk_fall(div[26]),
        .rst(rst),
        .keys(keys),
        .block_states(block_states),
        .active_block(active_block),
        .block_bits(block_bits),
        .state(state),
        .hold_tile(hold_tile),
        .next_tiles(next_tiles),
        .whole_lines(whole_lines),
        .send_block(send_block),
        .received_block(received_block),
        .score(score),

        .xx(xx),
        .yy(yy),
        .dat(dat),
        .led_test(led_test)
    );

    assign led[15:12] = led_test;

    keypress_controller keypress_controller_inst(
        .clk(clk),
        .clk_op(div[8]),
        .rst(rst),
        .PS2_DATA(PS2_DATA),
        .PS2_CLK(PS2_CLK),
        .keys(keys)
    );

    // wire [15:0] bcds = {state, active_block[9+:4], active_block[4+:4], active_block[0+:4]};
    // wire [15:0] bcds = {4'b0, lc[8], lc[4+:4], lc[0+:4]};
    wire [15:0] bcds;
    assign bcds[0 +: 4] = score % 10;
    assign bcds[4 +: 4] = score / 10 % 10;
    assign bcds[8 +: 4] = score / 100 % 10;
    assign bcds[12 +: 4] = score / 100;

    seven_seg_controller seven_seg_controller_inst(
        .clk_display(div[12]),
        .bcds(bcds),
        .DIGIT(DIGIT),
        .DISPLAY(DISPLAY)
    );

    wire music_play = state != 1 && state != 11;
    music music_inst(
        .clk(clk),
        .clk13(div[12]),
        .clk21(div[20]),
        .rst(rst),
        .play(music_play),
        .vol_up(vol_up),
        .vol_down(vol_down),
        .audio_mclk(audio_mclk),
        .audio_lrck(audio_lrck), 
        .audio_sck(audio_sck),
        .audio_sdin(audio_sdin),
        .volume_leds(led[4:0])
    );

    debounce dpS(.pb_debounced(btn_db), .pb(btn), .clk(div[12]));
    onepulse opS(.signal(btn_db), .clk(div[8]), .op(btn_op));


    wire [4:0] receive_buffer;
    multi_controller mc(
        .clk(div[8]),
        .rst(rst),
        .send_block(send_block),
        .received_block(received_block),
        .receive_buffer(receive_buffer),
        .rx(rx),
        .rx_ack(rx_ack),
        .tx(tx),
        .tx_ack(tx_ack)
    );
    // assign bcds = {state, dat, xx[3:0], receive_buffer[3:0]};

    // assign led[15 -: 7] = key_press;

endmodule
