// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Sat Jan 15 12:52:34 2022
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
    enb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [3:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [7:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [3:0]doutb;

  wire [7:0]addra;
  wire [7:0]addrb;
  wire clka;
  wire clkb;
  wire [3:0]dina;
  wire [3:0]doutb;
  wire enb;
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
  (* C_HAS_ENB = "1" *) 
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
        .enb(enb),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 21808)
`pragma protect data_block
ps3eB3uAx00au0HrsNmQVVc+cWBn2/QMcNKiOzJSjudzmExY5EnDVMpfo6YhrZLi5JW0cWDrYuPL
hsRMDDwPTLmzRG+xHQB3lvrLJw6G96xtfjlJAmIjkP5Bmlc98FkfpPOVtMRrmO3/UXVc7beVpK5F
O/4hDTHBgWsbI/zxBzpoueaIIPu6ZDMszUFxwVqoA9qq4gD9HhMQgbrFFz0Ahr73DFibYcejWBKd
iGbRPQysOOsHJrGaIK1MWJpUy9dPGded9zj4Sxd0vpTSkf+QMdlZklJ5MhnrWLgIUkZdEWprdMf/
3eCIPkBXmaq5KOwM5+ETMz3Iq0RX/EU+dfEnsjBFj0q3kbgBHnUK1v3kX3B5eHYIdHgl6jmZ5NGf
Wjudu8hQPXE7Mi1kgCoEcC6JmI9+lQobEIjTRBHH1AP5A3iyVrSu04o3YDR+ABih3yIMyrRCTR7P
yrVX8dHhMGeL3WwSjSATOybuwsIsGg/63VMm3Elg/UfYArEtjYOW7S1MUo9FsXOCMx7cfeaah8LW
2GrPGc8YhjzpUWzHeM9LMEuB1gPvT3RkzwgIaAgPLjm3b8e53n5qlB0+NB7P1KIow+kYY7drF92O
nyKpsQCv52ORFC5H2k+9o6yQN/uwdcOFIFk6gdHAWaHw8HPUThPLHRLWNFElIl3LbGP/KxEh5/27
Aa2ajG6sxq/x9ZXQbnfTc28s5fP3H+qwl2YaKd1ZemmfOhTJlRWmn5dS25v+Q3aJxLfGRswu5oKw
KTBJDjgKE44dx2NDAa8QZMTQqMm+8+2oeIQy1m6qFZHflrEdavg5nQQN7mV7Ki8fqoogBQ9BPp+7
/05EWPizf5b5zJEgtU7wUuGQXjy9PVyv5ThiIaAOU/X8MhBXO1g7oxmM2Pj0gw/wg55fdSRnZa1a
EvKcVCE6tsSUFytm95KPFU/kD+moFA1edqLMqvxX56SiSjag2w0/uQCenZdRTwGtls+YskqnmCIl
x6QlXxAmDQa0yM+0xAyUWbhBhIGPefAGtXhrQXXn6t7dPfBSUzSfdWVWnasrr+eYiapKIRfJi6qk
zMDwh1RCbNrd9xqTeV9XMUqv1v//8a7N2DDr1TLvbRc55p5jWAWAO+tttrDAiOLymIiUObphRkST
kUC90z22CFPk3hYkZwgZytL7VySaiP22c8UM93R+wedysC6eRuOYKKJxW4IgK4O9cdt6sNnkrwJA
3zRUNhbQweTcwCFYv3eboxCaa8/EK5kAWUfHAum7J9SEb5Xoj7enDhyDA+dNsk/dzBE3uAHUBn9n
SOnaXQko5h+z/zuoaP82X8EFkCc8rRjMAsYwerIQ9MB3O3W7/KIqpY3UnTLMScx/zZtnnurfSF12
65yEeil5ghPOxL95U4xXbrBeuD34ygloPMmUyj9O9wdMLJ8PpxtttQa7LzudGib/QxXHpKkqHMya
uydSMsww3Vyi5CqvHuXt7ioY3ABaKnBlCWMizsn7OMtLQzw9FzWPj+FCddZDAC3N//qBrzgnlfLm
g4kDDbJUqyuQoneeGrVYWKIWuR/hYcPa/9EQUU5JGrkGeUVZ0stcKd9kCNmgzhuFnOvU3MfyQFtu
/1hNX3uEHrjKKaCYnwh5UARGWzpNU09LNaiT3UOTX230lhICMUw80R6DT/UWLHOEui0c7dsA4kDO
rNARoCweLgo0X9267KQ4JV5ZLL7g6e97MkpZyMc9A2Qv14EJepTExMjOtm3gY+Y9wc3319HVt3NZ
IsbrGdyGzcNe0lmqRdIxWFXcxJtTdLzdPDzBnrbTmc6VgZfmcJTXqpTL+5H8XNXuljULUSX/UQ93
IN182epo9f16CTIIvVB1wTur7cCTgMrriSlrJjDzSj2eDcz9XPOJL3TbnF5HcITCRKRYs/BaLZfm
klOJqbUeWj58o2h7LIgvrbMzmCEUOeULQABce8WI3NRVuBUapMW82lO5mL1tt9SuGaEm2ylYaYs8
VoZktKohOYVQg9A2JzLIOScBniYSFapOamcgfWRTppTQSIsUdEOgyIn0EqHUXtNHX+46ab70TZG5
UEgfVZujgl1NnpDyLVWtmIZJuL6sigJy1rZpeWBwjkHCM5TJaYybNc39pQRM5xG78msWTsAUzFIQ
RzpZ8Rv+PJ893FMz2rtgor1mmeyO8Ho/0wQquoneEi6U+cjYHmDX4UbIu/sL75KGC8ZMeGwqWguA
U9Zy+PwBFP6yLBh+qQrdL5AhBJ1NnYGwRJU+bjAMq+ufpEErakaugVRjjIBD4JJnTQptxIacadh7
i9sTv7Gx0EZzHXsyq9dkpDs2I2HJqbqxDm7tZHTP2TOLNTrUkhRlAxlmBRMqyesjKVXoKd8VgI0Y
4RXvcrr/+PDFL9+qNyGDYxMN5LfehbRAz0qQXdHDAoOjfPcapnZbfnLr4f4AWKZNeyx3Z355MXCH
l7j4Wp08JnJ/OQ9ZQyYyP7OF2O2x0Yd2YBnX1zQ1nF/7nSnKxCXDQNj2PgVafZl2yRgN+B1C8Bx2
5y0aOYInIkgyC/Dop5FJ6onAyF0B9dMQHGwXHy2/EEl8GEbrMPNoUmpI+8R1gqdtgdY5td9dVZTa
dy8iIZVltngfM5e9+FuOiLKgcCdk6pBN7AQfx11yyTap5kqfDVIeDyJ3s/WzatsDjFQdUfsV+tar
36yPG/mGzydhQQReDoR3r2fKwoJ48+KIZVSeZhlrXRqLUb3aUceW4dk9AepU0SWzXKRP2OQNfGaJ
TMug3ZrfrxzlwBQzbScy0Hv2C7o6xld53L7P8r17AvXXJHcV3Yua04aiURKg021R7M+8RsWeUqPU
ehbZ9Wjpde6TmQYRz+TYi8oeMFquRbisyibbJrxLqsEHzWtlEQDNouLa/BROtR7r7ubCZSc37PrQ
3/PwhYGmd/Hc0WH1la62YS6PP7PRZD3AivVP5W6bQhhk3jQYa8gylKyfVUbLb+IL8x2qPYYxi4oV
XERt6hC/vUh8J9XUuDDJEynCBs1BQRyokpX40TULnYG/94hPRICQ1WcWHoJhm4OT8pmAP5/pIWD1
MjgVJ2HbnmyZMaFWrMo1JhvHtpVLB3IyhhulyCMq0AjCzQt/KNzs1X3vPKPkM4e1zFdWAVQTxPFT
qcAOxKI8pkPjzg7SZzFCmBFm5zNvMpn+Jxu8vUF8lvNwqpgYl+1ygAgU6LMwvQ4NvPYAdElmPgzZ
5G8X3M8BmAvVYobzynrTuSr6b5ptXtW2Cu1xz78RdTZCl39iQjNJQij5Bbh9HLcZPAU81E9/CeoW
DgOtDBBXhD+eAePVvM39a1kmS+GHM8ebFB9Uhtt5a8N8zJ9Ds04Q7flpPuBPK2wMli4QVkJItS7H
dz/y1ve8aVxVs0tVOXOrzHSpakiU1B+Y60vB5FAQaimO1S5aIZewBtGcTxAsgLbIYM10rmH3rZeh
1QFuJbUi3kmrHdypkbWXlPwa0ePeZYOsLBakCmtZ5EmGJLDSkDulwNF2Q7IftLQ3BXkj+PnZ1NJ3
i5eDw8Y0kqwHi/mWWxwSZRiw4RYj3MHLIdbhm6fVZrhNdLM1B9QpG9CRhx6tFq2ZaM2ilS0+EzJp
U4HqiO98++fM8CDpR6srnMaY0GqRDU+eGon2YxIfUzIA+ry9NB4QvjcCr7BmsKctgS+uos8mE3Sl
qdqmE4O03rRZF22cM1a1oTv02SHvS6QDR4Ih8M1FCuoIotYaq0AUQWV7NqDP2xiC2PYcHzUs0h4P
powj5KPK18Rgqy2hFFnFMns4/KSZ+E4vUY8XTgTxZ7hK14HmR6QO4A3MOG8fHVNI9cXb9s+A6fCw
U25LFe4i2hbLyTMgI0gWnjqtrvIolbUEdRWgPr8qJIk6Keikw3rxU8H7FE8KpohHb8aIIwHE5hpa
UsZ9uAN3441e2AZjvKGENvU2EPHOQQb0LrsHUZMx/d3kbqS4CUgoYByBhd5JbmnF32kwDppXMc0V
DHY2wKnQCaxctaXKMx9Wuo9kPfCtZGG4UKiicPTlx8j1/1duuVZoI1lEsaKPTbZOHp3HtgPRwr6y
7NGLN0vOEcfzCBwCqUvab9tdmGpPNfsF8woDbLid40W4jKzyc/vntI8i05XIlZWbcZdHJ0GpY99I
0+Vs4k08oeKaCts3lwC5kot1kKLQIqYqSuIrTMOEvpCuooSBAIGenvfwG11yaY0eR/vnFDLE0Cb2
xi433OaGtrLTBDzOTSuog+XK+W65BGR+ay1SCnRoNRdzxIhouTfIACTK4wTRBUWjrnXdsJuazlfS
uqqZB5jmzgg33faJDR6p/SD+J0RiX0BP6AtNeM0dEbOyZUndix5cyQORnBWLILz4zjEPHfa+VmsI
hBo+y7Axeap+zS6JtO1EfBcqxFAsFVKYDshhM7pYW5EcIGotOh8llj2tIG4j8JyhJWMfbrbUgUGJ
efu1Z/6Lj9HcQsXmo3zFWIkZ/i2tuZTyJgL3BX8mkTv0g6YvuZW2N8FJt+HsLVky65X5p4svOc92
W6EOVztC6FSEj150zBfIXSuHXXcvJmKmxJfUDgHCiIfis3lktlUujT+BneuUZw2kXrAub3sy3SuX
UvYNYDBBuTQ8vVkw4ISc77cLcWrseIUlQ4y+ITCwUtMEYSi1P3hLrfScClINmWeaxkaAVipQaxa1
lHRyJbf4Zx9w66KPnlvpTpQ+W22sl02YWeBLpTB6Ir4sU9rOscIeysp5lMTaT+IoY1bZ9+ESp5vh
F1wZoxFqjEcE3IdodvLTxIwadN5QyRLZk6fiycNHasomLpapcEJlgx9oMwKM1HSsDJ+LCnwBjckX
HR1NCQ9YVdYn9s0zZKTmm8TeAeacfe3H5AeiOGGKJYkRRScnOjaOtY/JeicdPxSUpdnc/IzYEcYw
iUq9gRoycdl7nUe1mfSQFB2qBkoBCxpjJyOSUIVffVq/dnbheHp3vejsuKx14XDO6ZTVLYnzqq3g
zEwVvdKxIoQtv3NmEm5z7R+P/v0AByiOoBzabVttYV2/4hG4/Bf2Ip04D1yHFymKVz8mtWp/BuBe
GMKLGcaJusmwR5XeDK9eF5yShOfA/j6aDacleS2MsJEolUbz1YQlZRUv8fEEItsjhNgHvf/BViuu
fNsL/VPmNhJaL+iUqw4xqRkAQObm/qB/O4Iu6czWLUO/yv+tIii/D1Tl5XYv+26xDHL5cES5QpuT
GxQqkltSG0H4J9q3zXxDNwPzCqo/pZX27CrdyoNBFWIfx7/dVIb/A32vCTxXErsKiZBL6d5/BRzm
UtDq+1avacgeoSYXiS5bTnNZ5RR0/zN4MWg6UlvNAqzRsidc8eD0Wub3E1Jg2OAIPY2VY2hKxGv7
9WIb1Kb9pyWR8Qz58Fw5Qpzi6swp45W2XnGyoeRb/8qw3S5w7nDVaSIrBB0pJLngMKUmvdU1x9O2
dvTRVT12SuoI5I51O93DIEBzRnMwgmL/jPIRX0ylymgx8b6Lwv1RXpTsQV0dX6uAM3EMLQmw8CQq
kzX/xZaF02R+PeZGR+Zgv7+F7qp3T+JbH4Y95Z+Munf7Yxhg36pQUiHRZ3fBx81AE2Tdl2tZ5uek
lPWNSG4s/9S25pAQzZskiRxFHhWj0Jw0yzDs0zGQ5GRwfucSjLVTBQk/SwIkxBgJeXQuabs0M3v9
upRKez4iVpoQ0pTp17Zatoo8bcVAVqzOSoUcRIeNxyG9PsQUvubTxXoK7pQh7LnTrilC5fkLeus1
FR3/3e1Cp3gUGG1gsqYQ/Qxhd9kF/q1fntlyZRUPVxi9JwojO4dILG2ma9iJY3vG08ccGEmCByE7
pysAVH2e7asHWdw/RUKmshmM0Toi/F6pBIayq5ls08MoGVe7uUs7eUgi9Yqc2pJ3Y162z0cXNmSX
aMRbAMWwgLcJDHUg1DNVPlNzsICInhH6k1nHiFeXz0TQ7W7+9qkN489XzFOgeAWRlZQjm/eQxSfT
7XWwva0t5xh3VC5S4iUjWZy00fc0sHfEjd2C3wGqI0RvvkC/HvxV8hCiO7NBhY10lgNX+UqctoHn
mpn2fP2vEzDfgGQhhroZKOCHAJWcVSSRKG85VnOLjuybUIm9EtdFCcrnFn8UE7zKe07Z/H7VJ1ea
MHDZH1uf3bG0o/QMRkVz3d9IXReBtn4/d5aNK0yq+7lkJUlA4EQaRZkbyJRCutEVYFqD+buh97OD
R9snl1pYA7cB+IeTewFCxFlAUbUxtwNGPKdiNd0MLhMShAQazAPJnBthbJKnm2SGhp8nBS1GCa7f
4r4pT0zTfMVvRn0Edk1c7ctLEQcAMDsxkE0DtNlkgkWAlLW4RrRnX66x43mm63URYmxTdwWeC9m8
8MzlxYhiB2PfHQC/8otJV8wIQCv8U0mdMDZ4oZBzUmBBwEI/369vq8Dz3jZhwLmCQD8t9+tGmos7
425o0KjMYVPRA2YsNQg/lUmHsZEN2ZCyY11pF5CKOutafWcPkC9E6pIui8nMy/Xld8nD7mCrTq+5
NeS3urBZxVa3c5Z2el+BfsrKrE8OZWfWwP8rgFTQHMVWzpYEkN+j8X+55g0fBsCydyNTAr9GpAAi
7DGkzeg+L0w4PLbVUtEzADvB6f644loMBFyG18M7V3r/NJhk2jcyFdSeLkGSGX9hyxHsvALzglg3
KimW4NcAlg1NzhEQOgjP6ZQDT5lgPgCeG5QX0zgRYEWJqVL5dCBz+Fd8DBGYnfAP4q2VEv9WvlQ6
SI3wn8l2JBHSnGhQgA22RLcCu26XGcG48EC5lQKlmeVciTWFOKWrPufUNBhHlrmRH+BRlMdBGj4n
X1a8z/NXUEZ1nsmc3CPcUthZb7DVp7tbwnbEpbUSKFtxDAqvrwegqNyCxRdh4HdtZEweumcvbQN+
hITCAZZ6HrzkxYOGOgRr5f4snBJ9fC4vktaJ32C8zxXGaHibSpaVJ2dfeAGbdxe/5pSdOkT9ZemL
3RSqnucUsFygO5SecN5D47IQ1ucCLuoqTNWTRBtCFBM2ceXhLYPOkDZx3ke/zelMX6B0PU9SUtDi
/1SWtP82SRYuSCyr9VvGsq9id2rRp7dX61/Ho4GJItcB3KN6UgtW9hTHRlQew96rZM9AuWH/aD+a
EUCurmJBCKEdrHdhwxwM6ii/B/iYl5hyhL2Evl3mSIg+YXpBAybW0Bhm+mbJYkUahRw7MjUM5lHh
cMKA4L0LEGThYBBCumyskDhrRgP0Xkl9NMH9TVTLq8DUzjaKVekTTPy6ciZE/iscqnlwzjPFa7+J
07XmeE2cnzSYBV4XkHNIrhYIO5UIHIERH7c5h1zKirqiVk7/RVlOk9nPNCpN9Hl6HhRshts37Q4C
kMP5HV9KDNTR0SG0hs5lleXHWEPpP6kNBBz05je4mR0FepYT5zsbTPsv1cO3le0Ioow9xHpRd7qv
VLi7c9iE9t7o075SlG51G8A1mLkt1xwzoCW8p2dSD4Lu7D7jCQzYxGgOisVMQexSW9T1TEMdBcZV
yl93sb9hbnnUkAZ/zdluddkMsjyKeLnUBlFYZ+sMajRGDOI+8/DO8+m/6eWGYsonqfJ8F8rtOy4n
dQegHgZBOBrwmzLsf77B9SlWQ8AU28xG0xPom5bFma1zos+Uwsgtw0euR8Jm3LK/zokbAUDSJqzP
gVzfW6VmU+ro+Mwd0dN9XvKNkPCYAZp4ZXt+tPKofkwBdncCxWJmuu5VFw4TlGiUmtlDO6jLyL3L
Yj43a9UxDUpqFSgprdTGQkDFCu8hwa7T+SXqECjTa34xL7fvhoNWN1tqtexqBFoWA2gpApgJVzhX
YxhXjZcy9n8aGnWhBEjyJ8vFsy4TiHt3etQOn4JmB07zHbIgbKioWEtfWCezDh1YCMovIud+O+H+
Nd3EHKlgBmheo0fRzjmBj2hqaMdsNvJfGf+5kWwm6zw1BPY8R+Fy1HRXVXMDyFpPYbdB2IhxX3pW
mVHusHB3wIKXChjTbSayJoSwk+6C6/ANaSn3nBDyzTfPj48OurW8NrlYL+Yy3Agdz6o0LClgf3gq
e37qH7eg2SAO8XItlsqsMwzDe3wB9xa19mUmxObAAhmxwj0K9fraSdkxDnyu98delyV7Dwlbz/Vi
TOJLYyM65+K54sYJ0x7hQxG/kxWhnL9+uL2SyAFShi3J0HPFkKj0qSrUaVjEArRdhmrwpP4olHAf
qBfl/WT5LPYhn3XiyPTnCrZUvVJezRVhmW6NxzSAWRoyilJAXXlesySEvW1rQV5LIjqWgwbUvDVS
it+xyMHWjnflx1b332qElJapGEZ0dRoBZWapQAMamdduoFD6e1nQboa6UTZjAtSHnfYgWUCK4fIA
droVl2zbn1Iupm6rwCH5yR3Z0wtoU+a78s7nKWp0DJu+59VnCarSi2LAOHzfhWpFKmew9KcswrtD
Ut9vVaOMwiLMZzjT7O3fXg4wVjVrMfXgNcBSBy6mcXpvG8iIITAjL1aydRPE94JjTiijfIEzU+5W
Gw8qmdl+OVHM7qdLAZ03z26vx6pK7eeMpw/QxdnkeULvQ8PB+W3moMSsgU3h0cKoAm697DmROc0j
SQDaOwHdkbg2GntzIrbJ0YONCLlAN/LMSKhhtUsMXPFGX96a4CPcEjdkTx1dJOf56Wgj+5d9nXJU
y0eZcIjdtJSB2/eWvLxZtobonL9FBonvNClwkglY9lyiD8BlwLR9hLZscfH5JeHetJ3i/yT1pugU
N4yffN17Rte/b9GrUGMIap+2To1QM+mzTUSKaDL55/8RiQqqaRyOSBNllN/r3g/kfkinB9kN0RaF
0z22aGWKnLOKt0kZMjzbJ/lDUnkw6720p2uji4cyx84GWQiRfkumqxHkK5tP8DH+c5Oebf0K/5JE
QuXcJUtOFqZR6qJwv+TBfgXEI4n9eDAw+8Cso6XS0wjEh24i5aqevn1iA2C429gewOMepPsSoLCp
hgfQk3TylN3nONa8iFTf61IdaF+GPljocFGRFsjNneDHlDR+gHAz6TepA6cPGCOhGixC/5khaGZy
PVLDDaDm3Yic0UaGIdU+8xa5XVycK2HmGSMUpzCtacoURFslSA/7LBCYV/hIA9vMw242xQWI+I4D
vzB+zR5/Cca2qFfk76y7bxXY3FcphzGn+S4ohragyyNeD0t0YFqNAzD2a3NPFRFcQ11Cm2B8IEro
CK74GpVzTa5DSV1uTmdcsasgG2OGyfziUjD6bmGVC6tEbP4+zVi4w47XoAcu7+U7mxS3a86blVLr
BazRbJf0BzpsL7zQ24ZvV09rs7MzsRsPVBQ0wb6uruFEL8ut9Pf6afcgEC6ygM8FbycuwtI3fVYm
srNJXKxb/R6SGcB1y5sxKZWTHAWlGgDXRHcEXx9Q4j9xtQtew1DeLCG/yiMQCmt2euFzJp/ESzvg
uQMfjG4Vx4YfsspHBJQ6MIQXPM8gwOEzIzcGogHNVH9/hBOOdKnHs1djg0nYM4a6HbFIM4hgdpgE
PhuPyd6KYaGK9y1PRRDDt9qc/U6p7xOEzcjh+bWUCwkU0Y0lvRrHRYSqmfX0de0FgGTs3AWHfl27
uGePpPOzzas4hmmRjTTib6BQg/5vz7zJJHrSvYRjxer3rYQqA5QeqITPdeY/HvPK+KFdyK1zU+yo
RT5vcgAqPi4y6Y5HSyS3lQVGPHsi5rP7t14tyYOKAdMWOnNXc034ELZA12S2ADyq5MohDlvH5Q98
N2XnfFr9W/tlI8I7fGnme+PXrM5G7YLCZZONXFjPRk1yccAyfMW66ibIayssNxZGUIOigDzMJ2th
8OC7NkrcHCQw1dzxHqm+UDKFEVCW+ppwcpPWJ1zZcRdkxVBGMctj9Q1hpExoE/dAy3axh4RWW3he
5C4uZFENOD+txCgGySH0jzZUjFyYAh2vcS/sLNAWbIneJ8neAmucSJpdGYuVkZSX/WbK1/OHK/yP
R1Yo4PvJTOpcg7XJS42l72YkvgowOgMTuM8EnKaVvqfLwrqgANjcy3h3jucL8jVbO/Wbqa+2N26f
IgohLPidIskH+LHSzTy/DpOJzYmDB0ETFo4ItbfrKuMqcol9HQ7MWTxuSFvI68n/SlQSS/sWMtyq
OWvmVemelGYeEuwU6A9CR5DcrcWwQ6FiOKvzWExGKMUmNeOrZVmHgbgaCpLMeRCHV6bncE/AvpiJ
GXTSwWixqZBCkp8z5JzWCzybgPHs24eHFhn/4+qyMGAoqLeN01GVbV0r1aQXyZcAGhuT63Z1z3mu
U89jFFy1VKLIqfcx7jFZAJ/tUw9duo+YENQjrCimEwIBuh/i3ltQ6YDLRyo/bEiLROAzm5yjuCgB
y8iPmSxwnLiIRnincBGElJtdXOnfWLCtNn5wt/leIc0oSQopK/HMpFcemh3gWyNHViMXYKRaAZQY
+JNtLOwQEczFLCfdig2WURZqx1ds7MzFImq487HLm2PKdkOHLJMlW7w56xvKklGvrfn8KZ7w6ti8
8JeBmBViYxiYaHKPSOWuTnI0NRMzJn8VbQhyBoLxceSpfyZtNk0PYI/E0g5HyZyLtBQJgiwikH4X
WQ9mHO++P0wrUfHGXCDoc83CYwjLmIqrvzVewItKelhpRQ0GFs6p3smy0SVROkimEKiDRkiVufxO
eQsKcSkV4p93cNLmvjHD/xfDSuWAFX9dbel6gKlc6dKDGy6qbP9oN9MgA+6PiD4k+P7AIJdvVR70
5ctJczSD/1P3j9We7WUabbDzH7V4qC+/jOoFiUcuXj8wADsbI1mTkS+yrbKE+Wg4S5Y5Cb0vlLBB
6A/Wjo2gtNienFTOcPjjsqv0BVm20HYk4rRY9xJSwC7XafAy3zFnOGOIaiYUr/1jA2Wol8KHQC/7
fiaW7KbfwNmk96NzrdVfq6oZvuz9fb3Cymp7yk1ovb5tDP3jbbOt/woQ01IrBsSbk7IN6jxY9PkK
ttnBuaJIGG0Zp6FDsS+hwcZltnSx4mTOnCuNV5981rcLmlnn1jDFs5Up51VDTR+IxvlUH9EW+/11
/2he8J+5Vm5OcwcqCKmPRj46QoJsoK3CKJQCCsN31GC7pSkqsNtfNp9vZAYFCFD0qzuPTIC3GwNG
yLEFGCR6cT5aEYeQnpY5k127DpFWpNlYs/l+K4OdwX3BKlIys1H7aGwhuzw5h/QwEfep0Q+IFLxP
srJkjfp2XlTMuv6055mcw30peDv2EepRSr1qCyWdZsYblpXPPAFZOVOrV0vCGU0icB6HPSdJb+6L
8+TmdZ/UtRU74/TPHvV3Wu1JA/uuKWuj1Z6WPRDYoBzwTv+FnkbzDXMy2Sp/G+cc9VxZNEpPrRp9
4BTH2vfIILNVNX3Rd52Q5i5doc7gp1iQOgIIkLK0+EDCx3E/XUNrnC2qGJImj5yVoIWuqpp17taF
k59EiQ5peDa1VWnUd3FDTYQynKB7ZM3agJxN8FPYv+x1qj+oXC0EEkPPOAouwj+sKCLAFCYNigVR
jdsOErVlenYWU1aUJ945WMxoaCn5L8mPLKOVFR2tVrDQx+p8UODkdCZzx2YvlwYsJzY4LabOs3V5
e+61IzYtH6oHZHwGW6fnGlBCTq/V90Vi92Ll6sfaYMYBHZsIPhHayCAhnlsMipgESbckj8ypiKmS
kQdKTVPlwLm1o1XUHvOKK2yk+Tl0cbiGyfsSqpPIg8boNy1UgkUaWjP6ebd8n7/myB7eLSuJ3DmT
p1xbSG4y36Te/FH8i2XVy9kUhk1QMlWqjfwpGVQ+Z7rU+pBGjrBbhGtfx/M7nR2TQbFBk6Iozy3p
bgtW8XNvEu+CAYkXfiXjYvQhBWNBe/iWO8suFX3Ws8iziPJgKRVI1Lm7AlS4q4pzNX5s1MpN+7va
JKLAYzV4W979dc6m26HwvS5AA7c11z3v16depPrAzXG4vRbVHnfdqJy9U32OqZeY/UVwdLdYSXUT
AwpADw9XI+FpdrCGWG/Y2q6+uNRXAOT1z1OJYhYV0zXI46FUGF4hJg2r1gFlB6YU3OLZtbU1jYfP
ClDJUVGq740hshULs8JriJmgqImW3HwQdOE7thfXVzm98VTruXE5hmY12pj3kc9ujQDSJC6T1y+5
snMlajdtnSb4c8t4O8ppnCumDnqUVdG0KAUNiKc1JO4T49h60pJQHbVlq/uyaQQqJwW9mmDb5C8d
2phTsz6bL24cfZhXSdxJ0XKKAPZd/7KEtPdZ7YFyEhr8Im2bkgffA61Ei/D33SXRX4KsUae+jRJ0
PzgQ8p8+JMBMhIXx5MjRMQW2Eiik/hF4lOn9GWk03rDoJhm71ntpCYSyljJVMjdfCbGWTMZ6b2Gq
8UhXqKZCL1OLUnnRCT92c5CTeiein8OL9w33M3l5A2R+Zq+N+GxgAn4QQy2HrYG3/mz/o4Rgudgi
RvpuirMGJh6RfQTG5YA0ECiedJz8DPDprvhk8iD+hcvIEHXKqpbrxvRBLJ4KJvzPXLfIWrofBL63
CoSpuWptjepCwckAcy9pOo13aN6kpLcPwOL8Nw9xD5FGImldpSDkmqxJG5x5cgyijpGRWtTPAXo0
GL9BV9Z3C9b3Z958gW0OKG7ofWmovfgBdQiM4xGOkKEo/DGyH/pl9vcURNVhvQmmVA180NLUaI8A
Z5XBT+bj1pxV7WIWVfemIIsRQQLe+DTzF3/6Hb79DMQkBjp34TWF3pG1l2QmGUayItg/yA/3JJAw
Ffi6IFJireL1EFdMCP+iSmHxfNgqD5ER7rHQGdWWz8i7o8ehz+KZPar4vtVQrZJkpVYaT2gXbV4/
tpSeSl1ULk5U2XYk7JK9GEkDKM0AVWC262JUPW13e25h6Isk8oozin3AOzLt6KMoKT0sXfDYdbqm
PzgwtwIidnDW6r/JXPfMBQzSLZkfxkvR5/RqK3LfeuvBQa0JVw2iTaCs4d+rb/xu4qWCSfhNTomf
BKlZ7YmaI0Q9vF0JJPY+P93VcuPVaZwfrAIP7OaJUJaRagvHZybzcmeZ5XfRRe3WC5jQZpMTIMnu
94+z6FcpBKPdovrInnYxLu4WojAVxSHwOWYwOzg+NO+oPU0zIag44ioIGtU8k7OA6LHyF7XaYQIw
nDV6ylhGM0Px3YXoleppPPjfUso2gRV0VGruIkIKXmSNcYn2lAdVWHUl/7ts1x05ATvzbCkYAuje
0zWM89nCrlpVSvRWEdUysDWsKwoSqn+C8G6yi8+GqxTJvKuWeqYr5d5xsQpiCvZEEHVU6gd6oWSq
t4wsyyyzPrw+kDeek0AnGRwlbgdMWfkN9iFOQqjVhM1QcrJ+XP4IbkOePJPbO3XcZ4KELhSrTrQY
EeA8XyEHAi8qBuq7tGI7uQZY41K0Cwr5fmIoFcqh09/EvHIxlfYDk6TkevXn/QM6oFrDRLUqnIuX
8DM0to7wjpK9BYZG2K2KWvhrcTP7bh2SsSjj0J1nw+OuFt3/PmFXkIb0MJCJz7fxCev8A+LIWUiT
jRXlv2aUlbJmNA3a9kVicK7bMxDq6jXmBee5sr4YEauWuCMQX4Hy6AvBGf2RmOFS3poThsry5GI/
9bB4DeeMssGRMC042NJRI+4Wm6zybAb0ssl1Eq1oQBEFvD+kfRu7zvREIMyPiETGv7Lt6Q0pWdV/
l7DV+EyVt0OP2HIJiGoC+Dz/OXhj7fzslye+Ug1EOjJ5Q18eMv78QZZfiQ24YhaeqjuTfut3esvW
oq1ldyGCzTjQbvkiHLuR/xCtSi1WyrPwj+jzecJYFAH0j/N7nOL8NqaSAwjOU2BKBXfuix8rGvF2
ge6p8rtwRZr/9dlGBJtwK13L24mDKVP6bTXBxnOfrkdzzrWO4KH9ijAuZ4BLuRrJUrT1T+urHvpI
og4NjgvU/FEi5NJW04ANnZhk3vYOhy9Q1MmjbF0ri1gaNElmkTflWyL3UtxZYo/OvJe85C+5wqli
2wJ0TcPYBT5P/rxnVFJOvjWj4ewSl0lCKJ0UoEYXBTz6jB8E2BjC+/Tm1a4iF3vhYqfY7+35Ax0f
hqNjsM8mwW9XsuqWT0oehWeV7ovkEKO2/N3dbHqyc/Jk3ILeZ3hzUG0UvvoqqZ2s2DvelSFOF6tV
K4pXOivqtdCKy5KHYQ3WisnS1vVgro4YLbnnHk4FORSYkapCbjQLE1QziFEzmxJRqYKdFSNZBLH3
kfWB6Rim9/kIYBBDJ2ehVh4gLaD60/ThhksCWdwluv7AbgfJfC9yT/YtmShNdMoqBcVrvmTNSqZC
dae+EAF/12N40FhAR6bvaWJECOcl0t54jozdzZ/elye680Rq0siaRU72YvoNIZ+UYJhsBaqZqGHF
dHEn3h6YAl+wchTH5Gk+jVTffwIJTQOUkSfY9JT60b0YAmDowcy7s30pNCf47M9fmvQpnsve8g5S
JjLzZg0wEWmmo1T2/CIyMm1amEGzO74SkEgUYXShQwuH5KfG5j9qAoZcYlbeiRkxkRBUX/osVnaa
NDYSu5y9ZPBMCG8Qdr4FPtUA8Na6oBdezxgVzvudaiQJGkY6+B49PMFBFroojQ+iYibvTvmQEQ6C
Ei6y/bOQEI0UWwtYKEkvq7MwRGCtnT35cNAvn7lEi9EtnlJ2MhBFbx1qkWq/x4ouE4zk/3P/DRcU
oLrXB6qy7Y43TDagu9ScTvkSx6oMefjyTDJIKw9Z7FXLd1jeToESF7+4OVXU7FQX99YYMrVkpLl5
vvy2hFpkAf5tCYBOZvlI3lTFHhKUl9eP+GnC7x1+YYDtr8rb+O3LzzEupvI1sluoRLStVTR2LyGb
VnAVqJvjRK3aoUk02FcFcrlTG3MAmqLs9Dr63gQM2ZyxHJuIUe0O5SaQoXFUOiKufrofn2rEIo5w
05knVZdDYH9hrPWKLg8pY4LGZU+9yfTlKGt34vOxi4H+Seiotx3YOj8LKpk3v6EoNoUS0hOm8HsN
DsFrhkqvChNcGvApSXbW62FEGV7Qi3owqnuzQrhx1ixCAcuLgy/nT//p0iN5MAsV2PeARWeZj0Lf
vujUMHq1mZd2PE8zF9DjIS+Lw3T/+DszouOVZB0IpHyb2Ja1DS402JQEIopU6w/SPXpJDJLT8Ddx
C9tVGYYaRdre6Y68nl30tA4GA6lXBD4GFSUrv10xOfs5DMx6oDNiuM6SA6UOYvHG1FHrGmc369xV
9SlGt6QMNKMdX+e//7ZL8w/TU1qJQ4M63bFAe9XorifHt4D3JoBo4pJis892SZEEJIY9HFSC2ghr
XwdAzyaC9cFqmVeN2X+DbkIK1oUNlg4CEBWMd7BD56ImLak8+BSeqiK4q3/zBFcHkkbppPJ2c2fl
jt8Yu2UdDADpXm1OCSpYv2WdIViDki0witXJ5z3X+dqCXESfJOPNDUDEhFp/YXfQtkiso1+pbw+f
rITF1fv3FtnzoJG3RBz1LSfU/VOmz+k+BaVKf+J6YJ3eXK1U+J7e0WL7yeL5LsX719eAK+FVVU6S
68Sxl/qzagwTjANfOy8MAH4J8chXPwtFjh9qWPTmOg09Kz1pD7iifZMnrez6v6gUmNeWWGeIWctT
n0b/qC2po5191uHigbXjanxypod+mK8C9GIhGlm5EY6HYK0b0XUV/M8/OX76ciopBeO8m55NYk1j
lrgLhJphqOyufJQ5c7wVNZmD/4+Agw0zOrOrx3VMbl3B2rNm6QWeNu9/ewAXoxrIIOSRZuv7vWAL
o0QU1OAQTVPR6wD8dsxU7OcOgziRwEWLB4TGe8BuWSZnPjYn5efnvDviNHZgppf+7Kliv5YSrf7p
nP6UyMQmxLYsdcPN9E8Ic8sKqkzvHZyk9+Gj0aqQk7coP2PyxrKdoPBt7duCsCkkCiDlcEL5kNNf
3g+vb1/vVJ1bNBU6QRb2rOLf7LXW9KqMmcEEEte4hfXGHfE5UDr5isEHf24JsJHu92ezEzUct3a4
YZiq3pgl7nvM+UQs3dEm9LWbC/2opNuVBJkHupbuDZrR9ep619P4m25y5oCsLosxp8mObuxOlBBY
yMrgA6tc+XEWaVGKhPJVeV/MtAXJaYneGt9TlV7GakM/+XloJ8SiDd8aqaOkppVqGwY0Ucz8Fa4T
AyH3dX+q7k1l6ryE/C769MfMCnjASG2JPD2HHynDFjT06Ia+b/Tk2O7uIQMlKsp12nr3y5N+52Uc
kkSKpAlEmbJgq0NvfBj3X8nI+M6mcVKIEvudsXAzJQfRAzYZrrTVnMpAp7kLkF4X8oqmRz3FAsKY
zIA9NKJzQdgIEVoAsme9DMGHMmK2fzKepTPtYOHlceqX8PsEWj30Bu1067678KYliaufeLubp4mu
I4ekmkb2cfkVMaGDtqzFjFNwNhlJ0NRmn3g0pASAddx/edWeWAREf/Pju5xOi0JLueojMWA30Xle
qTrT1PvzIDwyY6tCBUjt4ExJsXf7Ko9Ra8qiGjetJqX4Vu4nl4lianpiadAfo4oid4R3BzvSFLl+
lZLtyYp4ZW5K7BAKy3Naboqebl3fBZGOuK8zwu6/IgH7L/FXvxnUdgiiA47J7PDg/bRbaCOcmEul
b0TOLn+BxVcW2y2wQyt/PxBI1EhkQgqUTAKocP1II8MS6NJkny7RhWvQSObHbq9r50tuVOnX/Abp
PK5lN7yCPbM9Rf3fdZDk+mqyeqPmxO9gGe+bCew/vMCct6PWv29D1uJK7no3EaG3KmnFxtQpjKAn
XRj01uQtXvlx70JdjHHCGSneU09KlPKu9YCF0XP1L8wuG7lWujSe4zqI1j98lvfuR6ix1CMNtut/
y9KabTTRNLMLqXlyjx7gO5eyGdQnOJG8cFfCCJkDfjlamfBQnBw1wl7LV+EXPtldd6qH/wKa3B2n
n4+Jy59sMVB8Z8ADcbLJKqlTcyB1Rl30xO7OFEmo67AN3R6PMHLGYfpjmqUJeS2hBfc5Vzjs54e7
1OtgN+dvLqKfZCoY2bBIYnuURrMEvmt9Olq1vhbjeLWgCgBMIQAYCAyQwd8a8WtNe7bvY/2uU6WP
nj0yHZV0oGj0d4mj5/e2CXlHlJYi+5y8QLJ3rZPAqymBy3yRm0Xoig2WQbHj2doDPMTFiikX6c8i
SqMLVhB+1z2HC4ps1+Q6LgNnl+J1Lph80HDRjcQ7iDedMkBb0ISmWDklxdpw3CUXpStgFCxH4TFq
hhjg5hSDSeHxrJz/PIrpPZ3g9qKtv6TcS4V/T+voZDUdnpBHUS5sN1N9LyrGn4JInKyB/NH0xqRA
5KP5kcZz5MBHdEjKAvIXIwX6PPHeozu+ugxQJTXElOMw4Fl+MKR4KFkXPZBbVKXTfectqHwxlpr5
+iCq6AjhzLZdCO2SB/JpSDvM6X6f+xFgbt96ITcJZCChHVLxdAJglFZNKxhkTv6Xhl6o7R3SNaTw
IRU88SZAliW9ZqIKixctpX25R8G2NGoAyrELXvEflmTiMTieu/e0OxjLhD2ndWHzTcedF9xkvSJW
pyEZSCHWUMgY2EpZwy/1dVQbKkyKp6qV5wQaArMfqtA4IqFkcic/si9z2VFZMkJzkEFNkqTN/goC
a6Twr3hrN/A1UaGBEUzKKPd7vKxBbmMhPa6qOhHJe92CfAF7tyumxz3wknWn6VH0Jf2/bf6crm9v
Ae6GSdAeuOPNQ68SI7Aed07ar75+vvXAD9TTtuOORRB7LPQkTn0JKiIsVo+L7WZukXBo58lCFM45
iYKAL+wj3FlReQjMxbV0HkaxbdSFncNpfY17lf+tmxYyoZf/NIUlhYpNclmgW5Eotgs+a12ngN7D
OAIBIP6NQVa+c1iz2nQLXS2xMipXuBt93JxgAeTT0Q7wf+aZPdMbVKhzjVrGkwnSZziPB7KI8TrT
VMPxuloIpbB139yIITzI5fEeAs+TQOkGZ+gM+sXxjJ5FpzSsigpBNvatEMpsZmeuhvNNRM8cyx2X
ivTLOGDrv5WJjx0pUsDYyyZyUHstFhvoNx8djhTNIjE9Lb5LWZuvO6eM82Tad8mDej9pfU0CnAli
sG24i0NGzA3o/xfe0PrppulBCiBF/2e7sSrulGYAon+bYTzgMRgJzSKevUZxdmCzgZtKnM20HjwK
kzYFBEV8XmJEq5QAWvxfpL5ZR9zHE+oyyg9w/OQDrIkwFaX7lkDQtR3fEFpmbrtKrP6G9ZBIVK8Z
urwNaXBiuH6z6mpHzFyDJSQpwYmq5crJfrZ6i/oe/2ojDH2nzlJsLe+slP4++6AxgrQopuFyl5kM
O5SV+cbPI9b1kmJnsjIcSGgy8kIEovJBwyb3MlN/dYdvYS7wsLevWzbwQ6ot0SendRrRPd9j9v2B
HiK/OX2wjKghVPG8UiiuCZnKpWrbK4Ywr+yo2MtFv3tx7WT1gcdslB5NvGDfOtdESL6IjKjYMFQe
T9Ug/v1q1+x6eSNPLKgk01VmPNYGdqSnTsOQMZ4YNT0t0L21ltFLauaLm6CH8ZTqZwFkNJ4nrW2Q
eT7N7oiB3FOaXh2R1RrQD/xC8GELuNWXq5cPZjcI69UK/7WbZvIlBJbKeQpAc3/hbzosXVs8ImUz
U95/r99d45xGSIefI1n7YZ2flb3Cva428J18XfzClCFN0jx63Ca68nBxYUUq3eJemR7agJ94O0fD
/PwQmCI1XrZMymx2YGuVNrItcw/Su9XRaYQ6+QtoUuUjdf4KWn8zINPe/rjvGNhPdETDptltvfGH
KgmX9hNryTgdU8nV2hXGGIxqcRZzxARnU27WFKHKl9iwQHHPLOIXq95n6GaPw5XnBXZ2LMzbDreg
tgIzlM5BPIOYSZVL+0Jh/9s36CNXvI0R8sQp7gJuBZaYNcz87U/Lv35ev4ZzMoJnnHzWyo2aBr5U
6R6gYxUWH4oOi/vS0bNMi+k9XE6MCGfFsqBFEGq95EMjMBRWhvcFMoUaR3DKEb+tB/KvbPJDS5WH
TwtaP/MOKVFYh4LWN00wYI/OjCS8lLKMGKRnJe/MVKQH5VvSCD1cccEza1HwLggalz9VAmVVajm1
mAYE+o2wf3byrVAarK9FeJMz3MA0r+4CaD7kbRc2WVgY5Gll7cNJWZ0S8GYojLquMrLGGb47b/DK
kS4qLFs1HzdA30LdIIDNC/NewHyVvXpbDKyWgxjoHAGr0ldbRCOIWalfB+e9Q67seyPX+r2mqvC6
8+ueoG7TJz/6x5HfmHXR4GjGhJeqD1WkCwg3dr4lHaUMcezt5Kb0F4bymO9w4X6+163RrzJRXtHU
8FoaIMGMXxSvDH/CWkUPU2NmIsZYwV7RG8LsjQZUIieLOUb4QfDJzj8snWqSg1s7Ut6fOVkVjM8m
Gns5rly3wMcvwCAX0kd8GgTouO6+RBLqpGmOVeYAFmBz8VdU68oF7CW7BLksfQsj2G/iXo2/WTgx
2A2y86olRZDnAhR20rqP8nlGPYDqSH7Xpn5F5x9SoFOiiZcMPbV2gGQVnYUXmMTzwO0YPeJ0Os97
5PzyYIC3DPmO6HyoStYn7Zp0FLkM//EKAGBD3C6tkpdBoU3QrutY/MIUk3bXGKJKDxRE6uc3HEmu
4MYNfR/BXpoRIy+55WuE4/e4KWBLEQKJNEPuK87rOgyuW9gvGTmbD3szQ7FOFUPx9xuMzjD8qGW9
NGCpyUFcOZ4HI1RhnF/fAxKDWV72k2W2i0Zu3KxWEyG4OASGZofQQ7x3FSfJdt3IwKOb1V7lXTIo
3rhvuEFfdhPvGqJRuIuXU4TN4ORm7q3omMHKgdgh4y6sWiJO+EtyTnoS8iRKML1rfuq6XBB/rm0r
s/9rodoRO+1D866WE8XHvFIhvoNS310p1mJZ8+TDSt2eeDYHysBxCeqb03+f5LlWFFJz+3mDXJWk
L3hegYKIRcoDmsofuVf0NMyI4s+V2k5VwbOeheBJ3SQlfVoOG2xkEISL9+F2SN40R/t92B8hUfTH
QBldXtNILPUzG//cL2g/oRFpiPpmQm34Z/t9fTuTQVLaVY45MLrkoMaW/hEKuNFQlvSEtMUjjSSf
x2f+VXOWrcSXPh/xbBfJgXRKlEs6E8Al2SYNSuB8r8oVUX2JNqBCcT1y9Ak8Sl+BXsM1ZPqloI3q
+PtbZgtiM0Aig4fgnk9Xx/XyjeQeJg5RunRN5A6l/TGuOVEgNL2S+2LGwBqiV1v1GPpGBcw1FQ2V
5LflxXaVAOCDDO6H77Q41+/tpCDpjozm5WeI1UNbTCl1JWMsHsiVxw2HA0wzv6sUllZ05oinmq6m
9upUCodgWlEUJxJA8gRt/2YAvpG8ByKdsdeKcGaTyY+f0P4gYr61d4yK2z7ZO7Ayz9cFLRMiOxi4
zj2hmGaqbX3sIMLvnpc/1WoK4oGgBf5Q7xCiUqzOEkuHBfcu0l5MVOmqzNeGecUt8popymuUTU7Z
S2CchztFimfEhaME3UOR6sqrxi4EAbLVxZP2qZ7A+0c/V7oPPSrGWLDCcqvI1d97Qmm2IyIxmbGR
nIxUu2hDD96csXYFFZPipYvch+ATyQVRTHXPtvhNsTyreps8HF4uDRsRq06aTMg0s/KJXtjFa9bl
ZJiA0AOTWstm3rdU+YSM6yIKiYVWf2d5DVGTbxf631AfhA5A6fo8XNSS2ef0fLkCJ5FYB8AmDeEl
IOf18W5hqMOASHihERPxKJKhIXOIIoh2J7gpfZ52Fg9Mn13wNWwBaXG2uh1YN4d/+bguX7DkJ7db
SrOsL2Vd417FC5QekdLQn1OpoXE2r8XXfehhMncRCOtGgYVZ3yca3RuUyne3h6vNcVzSCMiyX99I
FpJHKg1TDtbuiClg2VdIAltnYo7py0W9G0tU9ZTKLGqCKnORacIHooLOCHKdG31VbwxGgUMjkpky
UxDVdX8AysAmUjlXpZte9GvV2PBTq4/APMuHqAIb+k66yEuXHoDNmHYNxEXxbfUOSbwv/IuNWb2Z
vbYyY2cPPMts1bcOhNWjLEnMkU02O3hBFrF1kh9mEyheOnyn3IUZpWxB254vofhGPWSx5uLYD+tb
/ZKJKRlp76emH0iHRYW4B3YOC81Vcq1C27t1DvPYq/9v42fGWVTl7IArBsHdX3t/CYtamy71k6QY
2qJlACHkKJtw8qKbWm7M33N9SlFbqZH/m9rhrhsusdxA7ykBt8xd5rxaY2bSu9QEWebvdNy8ySQW
GfT9w6ukyA20kYSqx6gC2p6vbApKOQKjGpiOs87U9dy19QqO1JD33s9IQiZk8FbhidTP1KU51Rv1
lP+oL6jgtN7OK4UutfTO+FhxoPJ5oBWcJaDU/qY3r3rg43ddhZjn5glC0FFw4mwv8+93ZjC/OYej
+q/PrZbJbOiy0GsP34f3hflJncIb1Md5LRCS0rMx5hxTWu6q+WzLdmjY21KB8pa7RtZBRNcpaJEb
kFonHZ757zxxTL+oGR4k6qQnrmL79Cd063kO4sF4gx42vLjNhyccvGQ4c4WdtL9nY5l/RVhMUYjP
tE0n2+usZdGm65mQdzHjhjeZHu6myCNvLMj+6YTfYvrCDs8WxVfjGwNngLKrVjpL+y2Dx3YYrp22
8t/gtLwtaqE6I05bmoSpBoh4SQGLMgxVy3rNRMxEzdiHXZusMfb2bat3FH7yiT2ld4HLjCFvtsu9
BUbiI26n9jblJhPXEZH+OWSCjH5SSGf5FhiwUReWaWw1K6XBHHFsn5mR3E6yF0EH0NC1FdZd9MrS
Wdq5qpSkVbxWE1zhw9adYyqpCgm80NOj4giPzHZ6ZjCosmct8xC9VTqEQw4YSFwHY//QIEzQ0Kje
wc+iXDRbMuNcw5yK3f9HTiouaz6SLyUlmjQNGgnr306aXFnP04cQ6FXjD4E+tnLXMAqFuTjqsEgk
tM2V//FV2NE+Pq776BtghlcghulCOetBd3ny1EYAbJZ3LobBE8b6ga+iOgDShANFSmq8rnj+iofT
Yf8gN3+aI0Qp/Xx0lblzW+Dzp6bEbf+cqLqNHkaHD1OsCPNS1dKmGpQa9LGf/J06PN//Lm4cwc8L
pNkltH+yMLtV78XWWao+S57Fo1rGZSHqclhFr3hXusN22ra24AOcm3xyymly3DL85gcYpnKWVq09
qwsWxWoy51OvbIIjWH1JRbE2cJ+ibqdE9wHSThX8xrdzO+9FVI6CpQ7SQMS6xK6U1LHSeabMLprC
dbqtpvoK077icW6IJ9GJ7MtDB1LxTe0g/CbpYAcAws/P19rp4r2QxQ8vlLZsqKIV0h47h0dqV9D5
i3TcP0OggpjJFVphoS5m96Vfq8yIMkrNcKtnNfyPJICkMVABQruUBoYeuHnbvb8NSPB6Rqw5D92O
GbLMQ+ArM7Gz1MEYRQvtF7zSsRSlqcdLlC+Qf1Z1ijW1RziNa5PfatyVyU8T/0rp1hna5VPwKfbX
W9QVhgIPseLxMAN5QTiGe2HFqmbm3DnjYt5cd85o8xNtdwdHblgKzXTfforoduUTxrLNEyB9c8gN
n4hzpglQhlE/h0D41NxFnuAl1iUmF5azyeELVG7Qzwpj0VIUxSOI2ySta6Nk+yyoaV0uQqgIey8P
UZ34zF5vpbhL3s2u3Po18ielAmPBGgZkaOf+04x6tT4nlxeAQK6/vY9w/9R05BwHFAS2Mo+uasTV
ahbSTeBQ1pQcKEHfqKRIjc7OxrIokv2pFtDrF2ROl4NI8k945iFNb9zKeMfaNKw5tPrnjMbkv/XX
gjVAtoeaMvUwn8zekP124pJwfuAeoKZ1cdzpPeHq4it0Y4drjHNd+ci8FYIRHxoOoOpYLRcuNa9n
5inyr8+HLPh6d2k0VJQuKXWH5urMgWzw80Ic1zKAYtBq99AWlaKQ5U2CAAYIXiv8U0H1nhbzqO2f
0gStberm0aXH0JTcAVMaBQUVCljAxEpvChA3rlABU4WrAnuffc1dBM0VW8EsQFbzArARy0WGj8qA
h9zOWTMlo6IpB4aPdB7GdkywozelhwkbKwwUj4lUqt6dUp5v1tELX+NU/pq1Vt/Fegl3jlQOFQpl
du8zYQmqHr/DbGMYSUsWi2qcREoIQUZryq6f21p4S7B3E1McGYBIxSSDzDD1yI/Cq89LLcSmKrjz
hpVeThS+04Xn9Z8FC8Vx4lMMKpssumbSQwVrX9vSbIbmaPSUpPH3SYFpuqV6IXspzNLt2r2v+gOz
QrkbT6bteRsbeoU+vImvQj7kYAcB2JseZfsk49becFaYqe6rfQNyOp5DWmhbKrJ6vrVgSyHOl4+F
kLP4wIp4JB2hOadatzR8YKOC6QcA4FC9dcsuTjQhjAVkAfRVdoSkfX8g90aTgfmO1Fj8jdY/vZuU
w0PJO6u5ZJZzdKRDkxQdxhu2wIX+GM9sLTpfTc6JkEYf1zp3hhnVApdve2sDo+VD9S6POALN/sBQ
mTj2tUyr4zFwpZjtonvZqX85YTfFS7BxrLhPj8K57wyjFZU/iuxBfX8l5C8Cplk8hSpX5npNu+JD
bAoq7ThnaSBz3E0u17peH4qscW4xxJ8INNBZZ4SAD/W4gwNbAnv1xY6/IH97iTP3x+lhLj4oblAV
EwgqnLjcqiSqrE1rbgnnCBZ4/zC0FiQVOzhfFquTvSbYM98927bmNeD/5q813t6i3FU7jixfTfcL
ZOWpoIMDt0JTBrZc6lgDzXaDwNoAaZEVWbd56ZjKmZbBZo1Q4jNxuKQT0V/GBxZNlZrbiCY3Gt0J
w1mgfQsa2ZAHqkzaFlSFFBjCfW8ElgVNua9wy65cm5jHk5OPd/bYDo0khRG3OpdByHAAtwydBnzT
kZQHvYpDAscC/8Y4f0uj52ktrexgOt73CB6x8577IlHkWvH2ltW88BNoouJsJwpgHiRLlkh6CqQ/
j8Bs7T/d/rybxZMsPc+KQEARPsPOZvoPMe4XMBtUgLQq8qV0X9HqQkzcecNGct39cnu94LcVLL7n
HV5JOGkyW+THAp0F/N9kMoU3Hln8k4W8mxKyuojY28dm4NF5BaRBcQNFfQvu7aYjuIjz7klSxh8H
1kW7rQKETsFQCFNGsaE00jXWdatnuIw+RUAyuUoU+AtR895n1kkBQq24ANXpNb5cuWyftV7P4PnX
n9UeLbBRVRdW+feY63He1r4oA6RZapeLSDvr5rBZhDTgmMUj304sd/GQInCiCyqMwn+j0jRvww+c
CuakRYXxxkqFSHPHQDnQF7hXjj6b2LFbPA0JAmPjpjn+t9bohGu2HuGXysxfocjVg1RjUWk0vIVi
xS/rZHiWLsCLdCVtj1qDPJwuf+KUHlbU3AiavDr97/698JZVx5gCsPIGkAE2maYRPQ4YKrbFOmHp
4KAlecMpxfDR3USPH5NiCbAC8obs/hrmpYEGMY4FnpT8gia2IXbyjFUaMOgaq7niccLYbTWA5HLq
q9lKHYb/51rlUWfCKgYm0eUlnD81479oN9r3iZ8lmb2dyk650213Iq3ENDKOQRivtnTjnUTi7mU4
QSBYtrUkZs2y6wcoDweaNniCK8B0H6QFesL51PleTwH45H2mh9kQ9bzIJsLZOK0WBXF8AHWNmqzQ
PBUJZFatV1tR2CPzddGFlI1udzNidPTqkdrk5GibdOrohmrtr+9CUNXepatqgKz5boBh7fndtuml
yQJLc/d7fXv17425ca5tyR6YkUFrQKSJbI9VMcR4GtjNFjItPBTR00PTyj7msX3e1bANE3cxWXIu
gh86dQJfKmxU7d0j1rMQaxFK28ZhhnxLS4ZeVMCUkolRp3Y++CjRt/V+CO54WdSxmqbZhem1Ghpi
LOjTlw/KyENSwnoadv6+QZjjPLuN8lVCCvDtiHaZt9MKIlhX9cpk08eZriSIeVBoyMmhuGgaxgVD
FURRKtDKL1Za00tmdqOMFSWZlRRxJHesta9dJh0XmkTl1bD7NBkkH7RyD1NnmJWzNHAVztdPXMCu
W/5MLtrdl7ORhN1R65x4TJY3uDzF9li+/hWzd22ACyGkrOW6C1cjby4omNfxodbj4ZQhLmS+RyUN
laIUvrJuCMHBYMbtEWLcVIjSe3XzvY4PBOiFoEQOtaiiFSUMwGD2xQAKzBtDvTaavISKxxCeAKSh
qLwtoYFJE5f0eMVDeEriaEOyEn5HnwCOMQNpIRV69YVxpDF0Np+nhMOorWYqYHMoDdqUBmwniOdh
9/4BP0LbEMvSDhrEni1UPopxp+DU79DT3rEwhL4u5HV6NIGzk9khUN6j69+sxOGSL1hgFGVwqxiF
0I0jg3FMnOM92cltgqhD34/FeSCr8USkIWF2GMH1jTbBL5tZmA/eLQM12vY+3M8MaoxdBxwzp0Wr
aQTZJxFGOW8dIKkG+3IpVedJ/gcJC1dN5aDoqatyfsnKtJpxuqGca3QNZ9FFOiQvkYsEJ5cNpYvi
Z3l7ufkiW20Us12JweeQ7MRxjaXXe0lxnTjbjFMBNZekTKSlvPUdox+98lwzyXV+ccwZFnzFthbz
lAlugVVlMJhFtM/uEvP2rNXMGNjs7pH77QfMFRtrmdVgxLcqtsaO/52pqqA0fj1drKRl24gCNeN3
yL0ZzaeNohGnLIiA0CQrY7pwKMOd5IWmaKLgCPpR/O2/u/kli/7lE3ai/OcsaTqNIczOy9Q0IfDo
1zWOYn/ue2BPUUPBYx4lq2Ay4exiLdHeMcQhnY+gBo8OndBBJ5nJZkpwNvJMBcBdzzaj38eqHhGS
6Y0+FUNKZxenqF5rebPZmOd/4rvcoZ/eFMdebVLLCy56QAUcdFKG9uzANIdlXm/omsB2cDIERiY0
CI3gl6/d1b6O8Iq9f2oXCaRALf3LbUbGwU69ilUp0SoQn5WUhlX5Ag20TzJoWFM8IbhX11cvkcvf
y+sZqsotYnbnVe7RJ2TzZrzTIz9X4AeOflku1FkjidUW+/6LPO/OKBJ/fYqnpvvfdqV5EqZ5izb8
yoP3FXPBiop92xJZpQPGzIpVGdUBzqaBL9NE8op+ezH0XT6LDKbQiMEwfm8ekVjaxkdbD7zWDH3V
20MWrvG2lpZm/kxkRda4VXE4fB/JYbDWrfqM9+CWFxtEFFzkw7q5MobMWnAurdYtsAkxQtaRS2Sv
1oKEVBd1zPzB1Yf2OBCJDkNlbTYUEafPRfOrGwm1fkLflkEIS4pD+gynM4llUJqWO2aCXzLvhyLo
cvCwVKSaX0pRUqz4U87sAtUQENi7DixjDWk5mm+WZqY9hpD/TmKvuXomg8DAxgHfPJnMUT55gQfz
PnGaJk8orjJVFPzszzFppm28dD0wmP/tAe+YNNOC5SGo7uFA1RU4uoYe2GDmJ+swxgH+B4Yuu0oS
MvHJIYJX78/4KmAIUmdqNf3kM1IjvFoBz/9bAyLZboWkV1uuDidxwqjTl2uHyMviDomH3CZBhgYh
fjzN6kdzty5IoK4DY42w11Cf0qDjSPA7XzlSAR3wT1EvrSqvvq9taUVVXFugKy7bllgtOAWoyNCN
EKaX2G9pIvuwfCf9nuMT4bWriPYCgE9vLpDtnHP9e3LQdPhlUqBCnIQjhLo2o1K3J50f+rOiUudD
4LjC2un99LOpj28E6skCnA3u4ux4jfTvGdiO2sLmRH8Jr6Lidz1AtmcDh0bijU2Ma7S3Zpl8O38p
fhJdGTRKKJlM66RYuJSmU2bQBTWDFrl2gSvtLHQCJgl+ZmJW59qoklvK2PhW29uvy0ToNbhsYbq+
OyhrEL3RFZ3InIb5Kwqz7YsAIs3eS2Y3atxE0psg4VKy9dV4C9SCg1EkhEKieI4p5+83NkXgnw3O
qo6NNt7y+q5u0zo172U0mFRTQg0McwVtJfR5Na0lzDgCFaA8znUKEs3Yvuq4ygSOYAFptPK6y31S
HZ6bKCmI6kcEam2lokwRCQlR8ybT+aAGIjLa0IxfkWxgymUgZrpYLB+/mA801IHSBcWDlCE9Cfjk
OIFHTZ+A/+3ys13a77g0ndDnMFwuGfM/OOur+ly8yBP6T2mOZI7Olc2W3tZRFvrhApOtnA8zKnwl
0jSuBEkvOxRvYJ8KVFuAK3moSQqtQ8JtSHRELcClZgXprO4hMVwA6KPPmdeGBNy9b11XSydU0m40
77fXh/LUILWHBIDom1Pz8OIFL0LBsAaJDJUIROu7EWeuRPnpoIoruxbeWqLi2y9pJSBSOKzQkoW0
+k88r0sJdHC2XFwIKpPDiTOgWgHyh44IaiaDlC7En46BNp3asLPI4MZNi/SyssYKe60Y8rC2drvw
5sCl3X6QkJ+DkuEwvbVHHNsX0r9hTNZXzc7XPkVUo8G493XxeuVOha23l3Dc4p5w/kA5MdhGRSX6
kCgiJnoUcte26FJMaLLJbOqidAUVq54scrdbZc3L0NclV3TiCCvqLaki90311tTGPXitjeZ68abH
HrxAFH2/pJQw5V5jRzjAMWBeJuOhrlETieIXqSyjFyG2sAHHJQufLnGCQNAnYm1DKJqH28F2/mMb
yE3ratQ5fCpnjyamhA6g4/PjlcuxWuWkvUdZxbJHC/ZXQlJ2y+BX+m+i/18UHn35VgkshXcckzCy
ZwVNhDBMiPM6y2oh5n4lC05IAd/P8fA2CpdKyjxNBIFpvq5RetJe8VEiiUWylygD88L6YYXQQgar
UFJ+B6h516xkEUFOWMkDyFsR9iLW8ERY4vfO9ra0olaxCqKfv7clIhhV3Enzp0VsMj9kKbE6GPJO
Xlk+iAcwMQznb62WFK6KzinxjMkGLkQjTcM2K79vrWENkYBPYnOHAatX4zCuZ2IDqWJxwNpjMe0/
dfh+k5A2abHJGPfo8I25mye/sChNUH7iWdvfUTqE0u9HlzjJ+mZGabtPD/kSwoI/wVcNBzeT5Q/+
dOa+boILeZxi3o2ZHIc5Ivw7zpeZy5hbc08RlfaAJeWXKieL07rbyXYb9ZNpDsbQknCiefVnN7gk
IcEGJsw3wheXli7m6gXf0m7nUjiVx2dSGXlYEz+2CPpLTimIGxzd8eTyVJhMmjuNJIuu00NCUjGN
qCbq6zZuq9peY28lGtPLQNanHK3zCWMbJM4conYqBlR8WlUHqjZMJH7ULRpZZN3CBXxNCAMAOVB8
F8mtEpTI1EOImtq7o0YOnE4CZJnybes2D1n6LdHn+J8IT31fRx82NerEFQrDf6fiRBNbgSQHyYV2
5z8D63UJXBdzx70hB74RiJfSi/u4LIAmirR7SIPbVUD+UELf50hvGVdsR6NEN/H09dbC5hkXA4qn
rKYr79yDveTH/aAnVCgXDyDRyVH/xQ5ddXIR0K9ENSTP0zzelj6q32fD8519Yi3HwiKbEbqAyZR3
GGzL3w/i1OCB7dmCsPNgT/mIxAdYcGyPqEscouQf6ei3NAn4mk3Dr6eQsosbOZI032qSYxvrX2uh
GHvF7ZdnKfFRzWZTCjQSSvofnvB0n7Er8kueylgG/XVpDfIO04n76qrP0R19SEm6AlGMH0Qab2Ul
t+Dt0AWOzrV0J/8QYnuv2TnARLJmQrn2ZYybA8ugcanIjq0gIi/XmhT0uBK1K/No7eGTrnfPbf0p
46qnLaxVaofuHm/MFurBgV9dYgyOQn7GdOXqtdY/dHHwxlhUH86mbRRYetCD7dhVoSfsmg8Y94I/
4Bxycp+fewgLkYklZFj4cZMcmrotMclYANaDJf8I/p16Gu4JoW2ajZXhtx/5NT7nDixG2SJsfWfT
fngdBBZBD+lpo2IstGJTzG4u2PUn4Kc2Ru9eGx6r1tKWqidLsPzfRS3EOPhdW0YtvbajhguSRmmP
Ar/yoz5tRZoN8KUBA7v7BcTpixFC0/aMLZoyaPqNjEHXL5Hy7Jd37EF1GuKRcd6WK1FHsM6zI2/n
OSqS5Gl+fqrMf/GxILti6iabMCYUTV6+EmxnesPWyXVLDvB8lyK8zXgFcoHDh2cGU9cMANobsH1L
TR6ybip/LSuzncgc4Hfl/I7EA6yOT5MAW8Cl8eddOsjuSuConJZ6IqiPA6g4scfuGVINQutWNIuq
Zht6nk49aTHItnfRp+JQ/laW06I0TC2PRjHh6HjqpFRvRuUlQG4bnyM3sAyTWkLW//EWu1dLtisM
kbtidcTejW9OMjEv12e/rHaXcW1zKRcmuCzttSSxeGay/R55qxpF2peRCQGHHNRKzbJDG1XOlXgE
PBgRnaP8O1Xy3hiCm2zvJzLquRyhmVrFvEdASuuerEOU1KjbLJiJ4qfVELrSHrL4PG9Q2fu3Mt3E
3He3N7MfVHDqjlcrKhA5E+jucUqdwPdnvBLBft1F1H19htgHgPTxhWxo6WIchYsv0rjwIFGfF/6s
X+jAnO+6rNv7djZ4iPxzugtmJvGYf+J57Ev2Sc/dYjvutQ==
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
