// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Sat Jan 15 13:31:35 2022
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
    clkb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [3:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [7:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [3:0]doutb;

  wire [7:0]addra;
  wire [7:0]addrb;
  wire clka;
  wire clkb;
  wire [3:0]dina;
  wire [3:0]doutb;
  wire [0:0]wea;
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
  wire [3:0]NLW_U0_douta_UNCONNECTED;
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.51815 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
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
  (* C_MEM_TYPE = "1" *) 
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
        .dinb({1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[3:0]),
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
        .web(1'b0));
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 21536)
`pragma protect data_block
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
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
