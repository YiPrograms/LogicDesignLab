
module clock_divider(clk1, clk, clk22);
    input clk;
    output clk1;
    output clk22;
    reg [21:0] num;
    wire [21:0] next_num;

    always @(posedge clk) begin
        num <= next_num;
    end

    assign next_num = num + 1'b1;
    assign clk1 = num[1];
    assign clk22 = num[21];
endmodule

module mem_addr_gen(
   input clk,
   input rst,
   input [9:0] h_cnt,
   input [9:0] v_cnt,
   input en,
   input dir,
   output [16:0] pixel_addr
);
    
    reg [7:0] position;
    
    assign pixel_addr = ((h_cnt>>1)+320*(v_cnt>>1)+ position*320 )% 76800;  //640*480 --> 320*240 

    reg [7:0] next_position;
    always @* begin
        next_position = position + (dir? -1: 1);
        if (next_position == 255)
            next_position = 239;
        else if (next_position == 240)
            next_position = 0;
    end

    always @ (posedge clk or posedge rst) begin
        if (rst)
            position <= 0;
        else if (en)
            position <= next_position;
    end
    
endmodule


module lab7_1(
    input clk,
    input rst,
    input en,
    input dir,
    input nf,
    output [3:0] vgaRed,
    output [3:0] vgaGreen,
    output [3:0] vgaBlue,
    output hsync,
    output vsync
);

    wire [11:0] data;
    wire clk_25MHz;
    wire clk_22;
    wire [16:0] pixel_addr;
    wire [11:0] pixel;
    wire valid;
    wire [9:0] h_cnt; //640
    wire [9:0] v_cnt;  //480

    assign {vgaRed, vgaGreen, vgaBlue} = (valid==1'b0) ? 12'h0:
                                            nf? ~pixel: pixel;

    clock_divider clk_wiz_0_inst(
        .clk(clk),
        .clk1(clk_25MHz),
        .clk22(clk_22)
    );

    mem_addr_gen mem_addr_gen_inst(
        .clk(clk_22),
        .rst(rst),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .pixel_addr(pixel_addr),
        .en(en),
        .dir(dir)
    );

    blk_mem_gen_0 blk_mem_gen_0_inst(
        .clka(clk_25MHz),
        .wea(0),
        .addra(pixel_addr),
        .dina(data[11:0]),
        .douta(pixel)
    ); 

    vga_controller vga_inst(
        .pclk(clk_25MHz),
        .reset(rst),
        .hsync(hsync),
        .vsync(vsync),
        .valid(valid),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt)
    );

endmodule
