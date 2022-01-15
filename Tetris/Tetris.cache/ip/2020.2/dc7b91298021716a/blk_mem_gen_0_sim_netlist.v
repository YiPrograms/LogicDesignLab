// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Sat Jan 15 14:41:38 2022
// Host        : YNB running 64-bit Arch Linux
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    wea,
    addra,
    dina,
    douta,
    clkb,
    web,
    addrb,
    dinb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [3:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [3:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [0:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [7:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [3:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [3:0]doutb;

  wire [7:0]addra;
  wire [7:0]addrb;
  wire clka;
  wire clkb;
  wire [3:0]dina;
  wire [3:0]dinb;
  wire [3:0]douta;
  wire [3:0]doutb;
  wire [0:0]wea;
  wire [0:0]web;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [7:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "8" *) 
  (* C_ADDRB_WIDTH = "8" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.39015 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "1" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "200" *) 
  (* C_READ_DEPTH_B = "200" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "4" *) 
  (* C_READ_WIDTH_B = "4" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "200" *) 
  (* C_WRITE_DEPTH_B = "200" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "4" *) 
  (* C_WRITE_WIDTH_B = "4" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[7:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[7:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[3:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2020.2"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
QGLtnqZzRetDH6gCWT4Js6wuLlZfrNx/VJp3sfR2NF+cxypO5AxN0oDKLJJtmdrtE/ueNDg+Qf7Z
TqBNRojORA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
B6Ger3hRvfjHkaJ+W8639Kl3TzC9TogLuklOXEiMNdc4Im+DjEUzxb3DKlzu0VW3zxZqjJ3+wsW/
LnRmPCESi5Y9eRJaLFXg79EMfoj4X+nTdHAP6yCfltBADKegZ12gpnB/8ey5yn2KA74LUtPC7jna
iyjqSfsWLGnz6UdXzwk=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BX+DxgMPRyZbYojCUR9Sk8Lq+3ZigBz4yMFHQkmurfdfDzyTPJCE827eGiPyTenK1QPVhEtf9g06
0BFXq/0COPuU1BWJwdkz1c4dE6/exDwhvEh+hPx3vRY6z8fDEf6aGVIXrHDvrmddehe7yMSIpo+k
aXHR06EEdfHCFY4TggYwhcJVXjkE+ApsVuyfmEfPmYjo8hCWyQyBsUWIOY03q1+MvUjjsmTwgs9g
fh5MY9ToaLfoJxPKdCpsqrBX4LJ+VDGFlAqIcqHTE2jCmPiToZAFXB7fzf1wDjFCBlJyFVDBGi0i
m+CouLSb7X1mvVhdDZgNrZDJMV688Bu3o54vew==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DaIU/Ddc8USbZ2mURzujJDWDH1JbHl5tFVOOQ2aVaUPIA71yyE38OXVLEtF8rNmujYH30nEeQ+FV
LVJ16aaHw+iiuaqorTM3K5KLohVlN+WlcEtSXHuPNHjw8ddqtzpaX7pH1zqZH+YmfCL5oaNLqDH4
rkBnUl0/Gm/hzSwKjYhXGQFYQ+gGP99OjXakzrAqZzp/Iq4gt+Z5902/JV9thd/isHQImJ0QyK8M
EKM579iPAfXGes2mbiNYHcvDmSPYmW1zlhOE++N1EKeea7j/msnKeyhlC+hGE4Xfn4TVvqgQexCT
rp/wS/MosY6WH1aKFQlFH2hEppA7KXUaQlvG+w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
XmWoAt4X8hrCJ5yTyug4ajJW5UhfkLNibzjihWzZ4Cr9hQSvWZoTc8rjGsLPbz6Le+/9iI5KxecS
eR0wiAO+G2IkwhZgVBeZdKoFnlnTVAyLjk9wMAFXNyJZM6b1NDbfXlPcUsC6JePvPlwwdWknkSsC
r3KvgkWAS+O3xvRmaNw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Hw3Y+rShKrXiUViyNU1/O2qv6TgheLHBnFMj1i9MUGrHYqh9pLfLYUgWR7S2vj4jv4S+Ks0BpP4p
dKEqVAFmTCfQNEUHaVcFPkOHgig6L4mhLY6HUUKJoRgiQepgLi/W3V+ZZPQSQFkB3CU4MsJzhXvR
yLcpDriZy8cnAHD87Zi5DrNGBzj3kigJeM0du6lCQbxtF5aEdoaNP+YTnIFtcqYhoYnswQlYt0sV
HKgFA8VzqzL5WYnpH7+1IKmFkJBHkyqHCa9wPK0qCKnxkuDj70YzPVqQ+cocdKU+/gNdpCOdZlci
F2HTxrgfrXndJru3TiDqu4UavqAe0MNuFp3t0w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XPVggoWL6aXz+MpODTOZhEUQDa0vfEnUDaYeEHXm2vGyqKJujN2c/FFAFBeBYdJATLsIsQ+BqoPc
pBbcFYXDBfOtFIW2dH6Y1OoD65KyJ/hAq8coa21kFgq4hFat5vzZ2iIfkCpTUr4vDZO7Xne8cZO9
WsHffoTCt5rS59wWm2b8I5R8Eh2TUbQg3RCyrcnD66cvcEnlXe1CNMQ4/loVJpA4IBinBf820Wjc
vw2fZbGI0jXC+ACSHOviH63Xwmn+aRV5Ppkup7IYoon/ieKapRQeASu3TTY37xSBXiInSdtMTzJ6
+4GfO4eSHVriCk/sWbuTBzfRzoSShrnHjzz5LA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2020_08", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L78XuiswVcgO2gtebzL7SA9BC/jJGAM0v6S9pzmyqL+QYzRneiYeGyDmsW33jEVVSTuNjTXkBLY7
yTOKQruatwe4V0OLi6174saSAmPgerSV1GyLP7KhmusLV/N61avC9TPam+tekhKeE0tds4EnJ3et
4JdLh+SE4Z4pcuqCjB5MFneIYKKWDx7siU6oesAQtoSJOesfMchX63MhOjOHFP/ch+1gHv3T45hg
IGF7V7TrdREVE4f9631tlVJ1o2Dypsmo/76Itz5WCGlTMjAnWXN8IXxKN+PZ3dyt1wjrZm2P/td+
xiGszFnSLrRvw/HferwtSmRx8q0fiHZ88roGTw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kDX5kq2QEe25429T6vQqBCFvV1McKTJRYfK99ymVNK2GGvGLXSzgwJHwB2fj9rM0wme3zYYY0vQR
x+9F4L7KLlOVY6qY3LB59uDzyXBI3mMZaS905HXHJkdZHWtQWpfHhl27LqL+8FSluaD6F+KFfYOV
CwIOVuCIp/XjxFXpNBik7YiPt4kHOlDA97IXNLnYUn/g1csGqeNWce4UTne50ggWvLYGbTFGmTjT
N67TpUiGRVRCSv8Tax72GWFIMFZk3Tlp68ZUSQEybZMWX1U9XdMdtxfvNGhf8mi5jQJ2SupSzKu4
T/+53IN9T8aLePAiGBKKG1ZBj4y1ZyYA7XYvjw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 22368)
`pragma protect data_block
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
Q60D1+Fn+7WEzdzaiT3xHrcCGhTDm2Ik
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
