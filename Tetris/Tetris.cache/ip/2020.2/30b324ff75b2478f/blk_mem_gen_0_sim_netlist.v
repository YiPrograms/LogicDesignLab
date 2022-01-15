// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Sat Jan 15 14:58:03 2022
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
    enb,
    web,
    addrb,
    dinb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [4:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [39:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [39:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [0:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [4:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [39:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [39:0]doutb;

  wire [4:0]addra;
  wire [4:0]addrb;
  wire clka;
  wire clkb;
  wire [39:0]dina;
  wire [39:0]dinb;
  wire [39:0]douta;
  wire [39:0]doutb;
  wire enb;
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
  wire [4:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [4:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [39:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "5" *) 
  (* C_ADDRB_WIDTH = "5" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     8.205425 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "1" *) 
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
  (* C_READ_DEPTH_A = "20" *) 
  (* C_READ_DEPTH_B = "20" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "40" *) 
  (* C_READ_WIDTH_B = "40" *) 
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
  (* C_WRITE_DEPTH_A = "20" *) 
  (* C_WRITE_DEPTH_B = "20" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "40" *) 
  (* C_WRITE_WIDTH_B = "40" *) 
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
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[4:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[4:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[39:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 41472)
`pragma protect data_block
SL9O7XM22LWiwClB0XnvhKbnnz/VeKf2wcIMI48XhnhW76QXMqV1niZ2L9CrgQnwUePs4JGgLRBo
AYIfiWAFilCX03GTaHFdTmmOjxnkRRisW6RnUZ+Zj/rkST0+a5F6FfdUChNFesW5tnMJk0oh33cc
k2p8E0vT2AWJ8dQZt8ES5CUsqetwIoJM292rL9lOSVo/1mZhOZE/py/MwRRACtgBuG3c2Le+lDd3
sSWwPE/5KJOcxGp4mRFY+7BCe+m0459MBUdcfszvry7TlMGGl4tTZbWfYOLapqVrCUo1POjgE62P
4802yecGkrLg38wmwFT+4XAF47jnagiqpOrwO+WEKPBTEpm25ohKiLiCCdn7Q8AGlWia1JnrzHpJ
6G7FFWLLWV8OvPxcUa9TunAzjFlQaNo/G+zE3N5RBzgwOIij0CJRwoobl7gTiGjtZ1fxnx0gBekM
S726iFp6VTFLXx57J5lYLGGL5WP1ppjLuTyzSRP2b1qGijWl8dj/uKxV6re7FWHx5dNiBxGuztxH
ZfTFeJxZQy86alDBS1x1EEVUF0YRl2EHpl4U0F17BpQ5SzZP1AGP9NwJJ2vDETTEaRmBPwEhRsY9
2/IjX4inkUtAgLwx1NhzWNkga95JElAELFoYEmzMjqoPNVLZYfIiRc7NtbqNnbJBTp+g2PpY8Fkl
baXBxrNjfyIoMDgye6//h8I3VVdwIqT6owzOFwZhjv7cmuGOZTsRV5TjtY3yklWRoiDiIDh7Esbe
QTM5TJLo6JwAyWWq0arfqDD/dXEGiJKHkzei58j6B4IiO9u+89+OyW7tHH3MoqMDx28kkR/4HA+r
HQDTmcSmqCusAJkXV8KVWIKhKs3Qh+3eShfjFtS6qrul3gf/4WDkTa9m+x6Y46wsGmPFgBsDsimh
L2zJJ/s4cYiOuGHLfIK9Yf1auxu8fd3v0lfJkJgBaSTo0Rv2z++KlLnnVr7sbBWF+pVSJaZy3kt7
MHGJUsYTMtHfy+/vhCymHdx/ABJayXyZk8b+5w5nNrKUL6kq1Z+oBFZSn9XCUbU/Em34vK/ALu9P
BLnJ9KQW6CmEbJgp3NgVg6RA8PXgzQj0NG3v2XzApvlm7fpchKlgwQKCP4hEq0bbyYb6NVd6q7w3
0xxqnsE8v0wxeLna2MwwVu5tcQJaNkm8dVii7aEc+p08sMlevZ1UmZzsGSAlZrTXU53IVrSqSI0m
WFafDMqPtUmO8IlueOzUuIFmaiV434PSuw/Whql+nRA0/bsMCokxOGISDtjyR3IU/n4PzQwPDLHY
bneBX0SWlBIAB9JdLK3OAiqZC6TxlSFFQyAfrLsWjqzj9Z4ffZvpuQ2W1DCG/mOOxjDL2sce6T01
67cnPd4kz8Y+xUZER+YEzSMmKbrSUmEI4HM2dNEfRXFWB5R1nsb9fDMRenaedimApksdgFhKGwTS
o74HuJBQAEmjj/0OwS1mwU5T4oBzjBoiF81vN85nexs3BJngjRM89J05uKUKp/vvmfbTmwRsKBap
5jqnaAYpEsIcOl5AdPIYVe7G/35KI7LSoFmgchg+hwrIzUNp0lPl0IQTkRAcrXsBFGoNoXspE3th
CHiGKRjx5o8xq6KntMEZMT94afKP5NnOKJ3OxXiiqVMaYtGTu7WhxnsoFmSF6Q3SXAlBDreofpvt
tVg1+nnTm7N7Rh4ZJR+lsW5MPmd7jUKOt2aXECAK8w7ALI4ttoPRyoCzsSdCXCk6yH09oLsDek+J
uHP0SooOjyDs+CD+RqUA0VsPWST8UXrIvbDmh2141M1FcCclDoKNCSUhtNsekhibOEl5RWyHtrcI
VKPigi+A4J3nXAS25X2FWAAG0clfcHxF6qLkxBAg8Pjy5BX6xw57Z5kbBMY+MsAuSVFy7hZeUUk2
rrObe2vrLnhb9NUIlekz2n8NY/jQQ+mJi8VFkaI+SzSErthxK/WDnQuFqRdO10LcaHhq3Yv4RUq9
WesTujhmdkFtCktTJW8x+8436d4SAYCTY8fiyGHjW86JAAIyfnNZJfAfSyLzYN0N86FysOmS4txI
Ypqnuwnh2AUhNorSEEnaPXQkUnaPwTRGPWiTzUgRZa6UrEeSV8bMBbOM+AN3LfEQpDvecj/UcNWF
wqFJGCIIAU3fynbt8N9vp23qGdUcgAmTCcHelZ2twEyX4EXDdPoTjus0Yq6Ztq8ZrWIpl7Ns2t+W
4wZ5zUeVwzNflqkvNJXZ/9n6OtRfmxCUl42dy8hqZ/ZoeWjTGilBXxo1wZ/qPNC71vA76vpVVOGy
58ET1NPLdY1pDg8vl2RqQR5lmoZy1+uquoo/JzDR5/GGEQbb/tLKRCfv8/WW6SjUmGofekDinoKD
3TSdiaD3QPEBC6HowMrtai/aE5GlJjFMU+t0ZUxpSlMmGBLWvy4eVZ/AG/nPX2wc7QdWizzwNkg/
f6ZMfWt540yiC29sPhxmwjDaf/cJTutVRl4OMDrrNFEF/dWdr81SO+aaeZ63OKGr1sxAh+V9T9CM
+wBFvICWq8BcqXETbJtW9LQQE6jU4KRlWAnFM/XbXLpLbpFyXjPIvUPaMryThCQi369WOIIYSXON
vIeSAUP5iDB88vv5QSJ8uRIRDNyP4ZP66sHVvAn8CYU3o+jFsS3YPgNthpFDJIz3/BigVtNUX2xo
iVN0mHBjDHvwzAgN06zfABcSzwP9wCcTlBnKTP2gNSJaxL9uAieGGa4nW91O1Yixd2oxtCpdgsO+
BonvSWOLs39nR9nqo8E5x/rrz+EUjvzjSspWctgMAMVw4HKBBLTPR7BVU9Ri/MIQK2TIGHLVrWLX
WHwFzrw4cQoYQqT+mdOC3a+50SHwITXbecOhN3NHbZOlfGsw/ccxykjPrBl7i014VmhMzLMuv4yG
4UXzK/JyC9tQIxE4NF651y1S3yr+x7492GgEH+YnIsjatfX9P95wS6L5LJfVJ1I9P0TfuvLwqfNu
mk8c8pczxYpv+qusk/GggNfnmkbIn1e1ih+cYkZuuQ/fOw6KhlZEoPd1RBQIRADoZm9oB9wB3o7v
tAhHItSxtvCVOfIaiBpDs/6qFRSDT+DpbCK9KrYCU64EEmpE/k3lXrImxt20gwV9o6CGk18j7u15
MxFAyz9g7wl3Pub7AiC34R0wqAZ2JJVizg4vQS1XD32PrSJmAUWyD581x81qzy6/mfBwAqO+983Z
4BUCpN1ztjewwCBha1G/T37Liu9yScq1BwmiMxn1mir2r3ZPgsgyj/4MqBNwpdvFRnPEhfGd7aL6
M6DSXfVoV10ZuqSeNOavAr/FDg46S+gDOK5xb6cu/qATB2pfxzTPpJCAaO/qsRoKcGzsLp71l4lx
hzd7yXChvm90fQYBOnkwIUhfvo2jAZN01lVYm8kQ/p9cE7hcGbZcy1Zn38AForQCi/iao/luOvZn
xe4BMFBRmX+aU8binfzFmrrq0LsPYInwbrkcIYaJIvKDhaXqyMTUI2/PE+4+Q3+5IJ5xvdj7Bk7i
/exUiEFdmUcVbYp74OtfL325xGWu9bCRDUVLOOtgv2/AzbzjuQRXrmGQC9skuICbBd6nQKYi/Mxf
UM/uEC2CdXSUxZDbh6OXU9mzXw+iXbgwCWiqBaMpqikj1IoMdEKD4ojDSZpUilNkfLWk5OtYhclV
pt9C+ax2f3eRH0kP8r+WN41vHyimTBmYy50iCsShe6LvZKBOrAvAV0xyX+xJ6Lb4aaGtJ0JM3ztO
CbAD8l0cT6wZnpBOcIemHvgg4d/L5r2B+XgU2Imeb0nQCWO8hKiyFJWfv+RUEBP+rubPV11d27cj
5Nlk3UYMWIdMjep+ID+nAO6FnbeKK15exYHsU2CFbYnzOrvDa8U2OAGtLQFod4tyqW3rlT4HmIhg
L0QE7OCyiuWLAKwdKQTPcbWI1qiCIYIZM3WI8zvhaGB03HK1ycgUU0Aq45IdNyBPX8SWyI/abNIt
R57Ytl725UFbCZn1d0ms2Igbi2kHoONq8QkOHx94B/ILTujfJinK1QlF7egip78es3A6rUnQ2UaS
bAzcCIisIH4gys9xnaMSUAApVzFS5wquK3eZqtVS3Yj4yDucHwcrIQaNO2tmMNC64oPlmw8XfWhj
MUfMg3qrZMj++DP54nAukS0/q7Qi01WoSotdEiLfKTY+DkKXmeYDGU6Rq3F/TCq9OaCEi0+7RxyM
qZUoWg5U+w+t6zHYy8ab0lsslpPYW9sE4dOafnWrcSg/twfg6wAG3TIrPL+/tBWiTTs84E7M5Fiv
VuPceCggdc92Uaz3OO0M72Sopao+ydVHv2cuReSiVPRzMcRaEa05z5VwzWTZzH0FvzHqlH+UHQrX
kzoCWNrRgRC1mgVuAotnVOpSPNG8ZCOPa8MPPq98U0oZJs7ty3tIVnH2Bhc2OmtHYRXt2UInX5JE
3jucifl/2d1UTIl8+eMLtHUA4hllabd8pjV772CBw5BobpEfFFrpW6jr+58SFb/DmBUEjYq37dID
W9hAR9CmB7qGEUQh+fsLjzObz+upwTYgQMpmbdsjAiGPLvaHcb6LXgsW6z8JcucpcrtFCVroasln
aNTlhjBU4n7a1vM3BhYqtOBE8iu1hmyCgHUlkVMBH9cgblJn8dt4dVgKIl8IbFDntx3l+sKHM8/O
Fs2SNlyXSY4H0UFd+sA+KTk/nFaWQ5Shc5Yx/qcWN3FvwTWnbPMoTnErAg/s0ammeGhGIRUJKKDd
ld5fuqLDJrEoQ7z9VqozANdOuT6lvOU8nJToZMXyoBCBuOehJk+G7B5BtWy1DCHy25vrNtHvf92u
OkrJdftM67dbURWLdhC8aqwvtNkSiNCS3gsjqfSTbCPOYXLVuS18gTUqNor6BDRBfWegEWJ2N4Ba
W8AQLttpKeobrAi7/ks5xOQ/2rhOFTAp5zwc3qzJepxJ2JD1R66kgKX5j1v9D34r1xRuouK8G2Jc
zSWsDAtYqzny6GaC3oS65q+vl/QuhDqVx6AOOPkewhJn2XoPLHIxHRnzQcDSwLS9jQz42cXRV3gP
/SptCA4MQ9cN6EFhCx4KZStL5/jcOBcyaQ9y4CLI/EQlJELJ49QJpuW1wgwCESaqIsNzYuWhxC0A
qBXdDCSB8Of7T199v79kYE9IjgJTU3TDkGG7yqId1oKQBGFhF6pWlXOjVFPhflSvwu2hsg66yQXQ
Za0LpAVihNcMBe7c4RoIjLrsEknAVxP96yzBp+kJmRHvPJlAB+Iql7Gq5xffqxu21EFoRrLLUvYJ
PFg9CnYuOCefU4Ilqc6JIBP/Exr+B68uKIoNkJHSU3W5L6jEzbuhv+OdhV1DahiVuxFpA2WE6tEC
5kKMX2CKs7T3/XFXAdput83jd5JD4uQdNoB/zpuwoaCdh+BHPwvyIwBPwgbnQn9HkBYgFB0+iWk7
iC+SIcNTnieJ5WVzeItCR/dyTrkFIcKS/GaSsXU+LpD8ku3geUxHXjDPDonthbYApshTLj2a2Q6L
7LGPy74WgUZiHb9t9zsQo04xoYU18bSTWv9Nc6AMOTqWta4RujkxW+ZgjXATRwdEB4k2x1m+qY07
rEK8RkLIGF89mwQFHVM9qAJGpvLLNwj7axKAHctPBnQMD970Ti9ZrUUxdv+z0oy+l8xnAdGLR0FJ
ECSfqHPGrzOcbBj6iV9FdCQPG+sFczMR1fZ/9WU6GebD59Q51nTXjrQgitsmuAlDRYhpyV0+hbhb
PsbgJZQxSLoWJAKbSUIvvAecjTulI3s8LfkYWz2HtRaVHoRUjU+Xc8T2xKE8TmO1MGQUsBrYXBGH
TndIdgflQUb3mu+FCozD+xQSqdmVSZ12pxIS4kEL/3mh/9iug9jDul6XHq1FaXo6+OuWugV9pwii
t4Ov0HMB63Wza+vAhj8FnM0Svml6H1XPtktn0zhlT5FspoBnHNHBLREnlC9Xq7jdDc8RRttAQfgu
dyuSUuVeyQi8pmVcqANYfy8IVIbQk/KlD0GE/Ulvmvjnkwvxn1f1iS22HyWbgcAER130wnzhjL9K
KMkrSftyM8/w6potH6vw0jgxSBBy1rig6TnxYjWaUqDYEGkviTB1CYC+u1hDMFMaXUEbd97wyyvu
IPLeqfZFB8+bWuUBfVIp5yeKL4bGpsGtMYdmjCXL9nNQ7r/9teVnl1ym4TuNCcv6wIR07x/p8MQP
QHUP/RI1ssUDDIVB4nOB7CU5Z16tsSsX2WAtw7hEqahEfU8fgWm6HeB4Q0nBIrnYuccUhkVMKamC
203+Giwkdph/vf+fqpSxuzqXo79Y8b1UokTLrP3V0tZB/FlAHP5MY8jD4l0+i0tgETr58BixPJDt
JqxH48/t5WximBF0qP5L7kiFPuSG3w9RjoKmcdwLSBlicrhNGYtXFphbjLGnanRRtws0OWz7nE5y
1abooJFiSBfejTrOLjtvXtjrU8Uf5zPSYGEbVENt+HzWWMbBfUw7hUz+cH4dcpc1l+GLWuvA89i1
S4Vs7i8+iF5FeIgerZo9L1Jgs7eeBdNo84A+nwkLiESw+C3p2xYIMORMwS0JoicXa1hGuiL43nYQ
27uiMB3j168mtu6/I1SDo2bDCA628ij6RghT2VToK78LHnTauM4G/xP+oHziPPHKuMdHS7tFwE3X
MnsOweAb885qljKkAurraXILADoIsg5+HGM1UNCzqZRLisVnFrmnQQpMDmJZdEgHYkkOKm1H9cms
KCIO74GV/Oxn1P9+5mFLNZL0BNFlcz4cZjAdMGTO6JXZV/rHgik87m9eV59/gFVAIxS1Uup9FUFa
JB7sszwMzPCOf2b/w5oXGRjRnD+8J14xc+yKdYW+PwcKlPW4fc5kqHirRdJyaBiBQnkN1xLXUhKf
Vw0Pvdoj4jSOm7zyxUjfOK6aI3SDgzrKS6+L3WJjnII5FM2CFwAsVIrgJy1kWEGUn/I1ku3d0LTr
VU9GmQxc3CENMiHyOI7h4u4YpJg+A3kF72VLaYR0YBbcxsZJ3U3xQHnWzPRRk5B4Ysh1APSfCbhk
v/0UdgM3nkeDr95W0hANJ8NY/AUrFi84mHEjvGgv4G0XVqf5zN3GyQVChpU+RiZSHmgkSM7XSv5o
bmRnx0PoI63TAC25mTlH9iwXdsFsyrs/nk3NcJ34hjPqZa/c6Gj99DCbpbSdHfNs4X8RW0qDFg7f
RXKMmUXimmVGMs1L3n1pEUNyDM/z1LB1dzMhMigpI+hA/yRNd1WwcWnztKXTiAHc0qdMa8urdpgW
ccd3K8Bj7mvcl/imkB2wcgh3ZNgxOZ/vrAl7VhTt1vRlM2DphembHAYRXo1Z37FXdTa1bl9AOD86
M/NNAsBnvd3UiiLS506DBdWR//36pXI71fTiGACN6YmmNAxDoy1zXE39URXSlOZKWxVKmITti/0/
8jU/y/c/OUyt7o8XNWuqm/2LEmCyLQQIuzw2qL+7Z/qJGdVRO8d4gLGCwior7+SCak5I10O7N2l8
9sDtLYEDrFRi2Dgo1+ibwwr3EXD/WZLH+Sh0eCG5Er0qQd9gFIwRUlTc0j87X+/Z1jFbQYAXtKsl
nfUmj0QN4RxSi55JtRpDTMcj1/wNaudO6ub+FiczYSSBfrg5h/lnWQsSWJ1BE6+QFzv824YM+AR1
js3NzpZ9SXr5avZy+7jPk94fOyBq50FuuCowEmM8JKeV0YiBPPkuNyNWoZ4coT1gouuY9AnidKGs
+oOXm0KOYOotLvn7OfLBGv8krxfm02y327Es5S+Q53+0DvyM/kZ1S/ug/hGB0D3wwEKoHyUEvgTY
Axev00ZmYDW0C0doLw6PibRmL0aNW2WmD+FMDKA8jP55sIY6kXJRZPxQwtzPbgJh1apefADjR2+R
IvHbatQSCrGYIIjGlO2EFDkxS+0dKg+PpiWE5V6a6HpcBk6JXgRQQ3TQYucMl8vJauI/YRMnYQcG
W5z8OpW8iPgNCa9txXqYv4mmRTe0rFxa59S+Bd0xtMkjB7eard8kIAE+jmLFjISOhqi1scImJdz6
CckJhz78T8zy9ryboiY0B3AxZOl5rR1biL210ghLE3Fpc2itv/8cCz3II88JnrA6+rUi324OZWT8
8FWwElaqJV5b7OSyH3vM7A3WDltbHVzjDRXA4/e3P34ODm9iPm+kf4MHLJoj9LLGZeRlC+bccBTD
WNwza/daGe9z9R86IPcfiEzXuQGHEJK2OTzAkLh63BjpXvlrJSgLZk93LlOOHTvJZfV/5ayhL0ws
dm5sgkxe8z6dNqRl90QW4gDvCjMJnQl1MgKZDqpywqkgwC/rThNi4kgEXj3saisv01fke+Vfb+11
aUeNEVXT6nkVREcjxmTGMxAeZECzLUEjvLh/pBrcldrF790WdnewVMaFAio481H9n1lRDdML7Kqg
7FTACDkofZ8SYq/0Fg6v1Y61BBTjeJp4B6gWspe+EJn0AUv1LR2QZyOgr8Afig0RvuTRqU261gx/
lSTQNRvoei+bepQH8M+70LqWUFhqTpqBsHv8aDwVWKJWB23Qz3AzZiGtsICVOwladhrICrJez54K
qtdQ1P78qVWaNLrxBy8ZxFwibkO+xyPd00MlwJf+I0z8umkP8gIOa9HwBWmKGzJ/rsjZclvRvNCx
NqpzDjlYlyBse48pYBGVVwacBUUnZps4x6Gnj4s40PJO5yXH8ySwbq6IQ+sug9kSBt+2lJ4NcQpH
m9L8cL2usZU4QO7c7esEfffFxPwJxlYifBHY6K6jZ0POUycnMfqV8ceiWTUker/xSN2xVvbGetKh
szGn7vLoiPK/khxn2cIaPMu1sjBTUYt5QoKsC8ad/FxuSTcLOS5SJNgySX2pIuD0wACbjLi0MqmF
e955+v8QSGNyZWoTXACXo0p398QoN6ZVoxW5Lik23o8Yut/k9NfHpZyHGAppJX0dhL/EVI/JwtL6
dMxzlknKQfTtzTBHKDI1yzmVUPlw4WoT2t+vrknYMNOV6V+B2EZsiFFfoYhDx7+jiJBr22FR/wzt
hasYXyHpzZ/OsVWXIwEU5AzNEf4zcD7kHfYwcVLvid99uvzOvL2nZiw8bba3cSOYMqDuNDxDHkO8
SDvZ9VUaiEjGDyqBErE7Pnji4LDncV28MvNS/9o2ip0KTYge4DP2JkUpBAL+XF3eu3X+VGjObA5/
Ruo8rAdgRt2xQtPqXRT32GzZWFBEtekAC3l6zxfzDot3XH7Dp6SpOLIjfY8dQ8zJfyMUPlIXMtmw
hRCIkVe6Fvv8uL0gI+6JpVjwPzepUaaZW8yH2tT4ncFnc/EUHYjxuhN4qCaGwvoXL/XOLlkwE8ya
+ew7K7UX1tqs6Yxba+C3uxPm1y3N/tj7yWceV0qcvYNeJPwIs3/FI/wM/ZPgCdeKNobb/KAnVtPr
lHhaZ05DVspNUq+ml5BQ4So6mfRaYpoO7ANkZG8qiPGqi6DVp1mPkSxzhKY57AGKzdfDWXfO6OCV
0D9U7jUaPbStGfGjZkN+eQZudGkEGzix6PC6McXdIBXZBknlGANHc+f6Wv/PJ7hp/moRYIQX155R
p/6l1LOtet1m54IxHN4ctQkgL0GKpP2UQmIivOEzt+CJqZkRsOcPdYtnqaBHanSVJNZ7t/ax8HVH
XnMKPztaZKRdQFv5hJ/f8+royQxnB7Y/r7e4la/qaWBqonVy8HyNGuNY1CO8qDw0Mvxp33F2ZfQG
7rXa5MjVFjFY/lDLZbEakrsKUx648rs9ChJVmn1K0gvAKUXH9yTRDOnFkBlsIpfLAXNIxBgW6uI2
BpORd3JcP6RaBOfogwfMQWQBFypeYLrAKKSQAM/0pW7aKsxKXRVPAwmLN793LMXy3ZY7CfIHWZFC
TyBnEom8tEITtjyOB/Lxm5iBbvi2JcM3uXq4nbFn81dwToGYRGDxh2QZslin8q4q0SHrf0QSsfVO
b4ZTbbdXgzdqshiMayRcVTfw2unhYvQga0OB+Vasq+/HU7wY+kvC0mtZVF/MaQEjJonwV+23Vyc6
T+up5Mw+ygXm6VZnadLAcyEDNCE54yCDQpMCGAybnmbfBRgzTyFlJRZapxLKzv7NIidKE3LZ+x2R
iugG+wdPvdpauoofVoyT4biK4ah/E5VMEIOmnJalAxj/QT+iRX5cqjZHm2+ubSlDbXCusnCTxQ2d
vdIbAoJ1jcVbeNRTxXv7Ndo98a3T6A6vxze8Wdxd0Blx0qfW0zDiR8nN3wtkDFvPMrcnqCkzpVh/
qW/PMd+4wWwlwgyYmPspTGpFv34xCuoPgvPzHP9QPrgYEO1y/5rJp1RcqDpRJyDEy3pcceuEA/gR
gR4gOZs1IhWT0diaMT7BKChznST/GWFvZvuHOW0+y16WTwNVuVSCPzuGeoBpjg6U6Jp2ZKFg781Q
nYFiPGTv7ZNNSEUed41am0kpKyzNs2e6XaZ13DJRpwCVZdNMsv6rbqjdnP6e4qJRMZ9RlOx0VCj/
otevZm06AsLLgcYKZs1MkfwYsDdmmw+dJ4VzBPlDu2FsA/TzF2LeQLjzX9Q7fZHkLEj1kaiGL/g3
nPMXk1V06qq+wHUpNRrOA5k0M8Gmg0HcrBQuQVKst7JLnHpQvFAsqjxkAAFrJTQg/P6EEH0F3tuD
c9TtF6ld4YrYfJE5ZkX10dQfcCi0eYpHzM5sUfPSpv0nl9Xlm5YK11jyb6WLkEF9PaBy6c1VTRqt
CIlk6rHnWpfGI6t43pDQl74fK6/78zyzNqZ9QmLFEX37yZQ0p6DmdJ79p7z3KvZ4yEQo2TfzyDc9
TTLtvLvAHlD5czuS9ll4vQyOyZhx+Wr5gZdv3BopqNZx2wdOkWvbE4gEdWOsomYb9RyeTh9d+avu
FyyuMJTc5tKHliTJqwVsTigB0WA0uDD6r5FRnr9O6lneLwsKsajiW4t5x6BEx+HDi1Jpr1NZ6c4P
xXnbaNq5KWwwkIG/1uwYiciIKsIWZ39z1968QITbrpAKWOeou/SF0LposRfA+nPJ3LPgSeI5RF5U
awAuyiFxQIQqOOwlJ8fmeiq9NX1HjKMcVDABOt4vJDaaq0oy5DOzacEIXitT6ULvKDXAI6SrxQGS
w/+CnKu63I69XceJPfLOGzSvcUWTXFlUPg45NjYD/CFENR5qyCT33MMlUvdk8Vj/ehFr7iOc9mVN
p8MQ1slgqH3XkdaGSxGLIY6l0JULIrC7nNBOcxCa0YZeQAq8G977/nW8TrZGGMtbZScra6OS3DCD
hxlxtUI4nAsnkB1HvKSqhUL+4LngzPTk7pO48lYTwrx2JUZmGYuUUJQLK3pblv/vb5NP8qBW7oHj
i7qxN3p1QNtOjpPUoXrZD2jU33Ckr2o7CEceeuBUIs5hFyXXZZkfZE+mOF4Uw5LwdJvNvMIT8CQo
AQ9UVRS6/CkksIGlkXBlEqVf06QnRA/ng9S+Vj7trnr32hM7Q1cypfekteAD/ECATaur+5GnvNyc
z2jdWVRcq27JkA1q97IImk+qAvq9omqkBWFtaZWGJT40am4j3Yu8Vh21omtYeLBgXu+724fDkXUF
Hc4iMEWgiIW/zayG2sg4VX7d4TyRzC8AglMcGTPV4rRlekkzQY95bQdu3cqUiMMESClkRbp7MyvD
nihJHQsET94zioHaHge6XixrsSPW6NyvZPlQY3AlvejsOpJWZDWolLSJgeyOrwqxpAZxtgc5tY3N
BeoRzfG6nnOCB8SonncSD668FHo64XFlaC1joTq7+wQms0hjNiFVZWEk/7swOn0bSqQv5fbKthrI
AbGuKYAxSsdblaoUr1gvZXbAopKhoC/ISmeeMEpwNmNi6CI4ALfnNrm7FAxdNo1GpdJUQP19YBCZ
FpUOXr+d3tDsUSuSloxGAOQ07b8wfSm7A5aziKJyEDIG4a7JZRlom5CyAhv16Oebq3HQlvMDn4yZ
9opbP3tkHlXMBSI3lS4gcyswzfNmouEYnusPexiR+xL+itZDBWFnDrDnn4t/g6p6QRtGOw7pgcgX
DeADq5mi5NJh+5zxh45/dJcvX+owrara8V2w9UeZi2IdSfPHz2ZmRbfCalSDLmyxkRlJqkVUBs1q
T0xJtDUMsvVuIFkE8yooxsHGRDltmYKuP3pEdc0BT9PaSjkC5fiSvFhbWQFO046/EZj9m5oEBmJ3
ea1yCeXZDK8+mF+1BYmGZ7qZ5QZBU5YWMGP2RdVdJEwDxfdIYyfJpO8koTrGdgm/+nYkaB5p5ONU
lmsaAwWbCZ7qgyGG61vVYVNHAeYmK5MLd21HASY+UoBRjsTHFzgSPDMiPtYFp6geQaKaWM5nAgkx
kxdJ7Ah/Vi/V2QJMv0wSfD0yyHEHQ6wQ0Fsv+nOfEqK/wmMslOmkdUxaLw9rX7CjoaftIB3dHULM
xbDiVkdBk3K4JPn9MX3cbKQF/xj+QyyVAlYeG8j26szdu5xz11zN+8SLOGswIzEqJKDjmGeoKQ97
QtaMHmibCvgoHzvLrRH6O7F7MecQXl4kHZQCYuzRgEczRp6XmdnPu/9CXH1ELpB8BEYMgpZfQFtI
Vq/doQOkckyGCPxaTKr0mwZDmkG166F8EY3yNlNH+3wSH/VYijCoOS2vNvRA7CBAohIjcarAbLj2
O0J6gWfGF0oKZhW9K3Aearo71jMwplh74F0OlaY1HVMYdeyFboEH8huEjaxWbnYUYpGGEfTQh0EV
FrCkd3stiMyu5GX0avDXiM7VuO5qnLe3yfPgmdSuphp9mo0uqpqa2zeH+xV/f0vR5HKgToSjCHWM
P1syk9dklSnxImtXwA+qYBYVC/6GWGedh8+WSxQZhQiKwcAvCPgtfhtN6cUtm4cgheWWyVQ6ErfP
dqDehov3XrtyZF7CDxs1kufCu1i8VATQmi6AU/k4hnEtp+mdmO/oIAMh2gEe5grBF6yf2l2wq0yn
gG8ljmtNJWbzMwd1vpJrjdAkf6R1Z9Mmc4ukOeFdWPFvpQVywa49k6PyOeNjIyhGZ2QZmlEQ/0S3
uFNv0cNkZzo8+SmGJntAwY26Sg9jviY5yGZcc4wKrnvZ3b6HBSG1qGk+nI1pQxSDlv5HkmNo8/uJ
M6j1QX2oN2c+Pip4XDyhPlamOkW4SeMF5/v0elBUlKKkJL6fHpP8cDPWamMwIxcAnqDTctmzzVBk
laL2JlwcDb8Oi+ITgEjl1qZn0lMX4VLSwId6AiX0qEZgiYksS42eLQIT4u7EzI6m7sRh6mSVGGje
dIhrn2L3f5pHhMBjo3tfQbtp2rVZyY741EBZEaWnmml+WfucBXcl1nBJ9IptC4Wf0bXTE7O+9uFX
v27AFXTAm6NRIgZNNm9hnGBI/K1+YBjBEXRE6wqneZSOY8Nw63g0nI+mq24KsGcnhB3CQrGVgSr0
O4cNAenZrcfbGu2CC5QSFnFbFioqMI9CIOl8rxZcyk+HJmaV+cbpEQvxTqsGH4pnleuXyqUrwk9E
gqoJuWBoVrsL10RysrcBf8+yJxMORbUSKSPda6MZ+Z7B0R95w0hsPceg+XYt513c825xFpmB5aIg
Vj2jpgOiPNg8mRQ7mQ7lMwzduocBmmA5CFBDCBSJqVJWOpAOMGIqM0Y/tToQ7VKqR0Eprk7htSwh
dw64DmNR5D2UxKYSVDl0yxfqjr9CSSkeFEFL004OPHfrqXGnEazXokCQ/cIAFPexT/+IVhwilzB9
7OwaKD9e6rjA/snBj3ppFCJNN5m6ArfGUnTTHr3k3J7n+Ag4YzQAR4dD4LT+EJLkjLYkdOczguXz
Ob/5TO5ZWetwKo6PVU9lY/g4FjGpeFkb/gdUDdFdno2J3WI9XNMNbgl22qwb8ii/Zg+Yid1TZzvj
LwT2yuzvaikPrq3pLNMiRnvtxlNz0hlzGtoF24CtwlIp8F8kqafb/1zAVMOHgQZyexD9ZuzCKpVU
/JvorIQNyCIZ4jBVzwr4V1KovQ4jHB6aOoAEEzrKvocyVe/LlOXNk9j2Nz1rrVyg5LQZ2HkF+JeC
JdN4H8MCwuQNpMsu2JIPWrae04F6HdXQw1uZRTyYHoKEoi4qY1A0XyiZwfuNkyLMf/ub4sTsTyif
fkVNApA9QRc0kLNhMLwn1wcRE6WUHbCSB90alBchOgVtfhOcrppozAusjEGiQ1oDP2YcmLP3GRO+
j4WY7pK15C1GurVWjAheOFdJrkqGTIdhrPuOCTBdDjBoh5WC3zJq6/jpugVcNkg2JasFYYqLHoS0
WoXZ05oTzu7Vt4T4bXE+AdU2wA0w1gT7xKf8r7DtcOhttobgyi4kKeiL1yxoUfYj+QOKMuhSGf8m
jdFsqgpql/iCDpe4vJfmlTgP1OCfgdsNT1S3mRcQj7xsz1TFUgGFixOid33WAUQYecN67m7sXQfh
K0CasebcV0g5Kf5QILc/gUwl3FB370w13w2yMmNp92lXbP+AG/71qInd0J0ol0rQszKIUWZhvKxJ
AB+8i/R3U345D+C5Bb38QYXDahOVMJAmcrUi28eEaoiA2TbgZXbfUvUGuc7iqjM8PPz39BYpYYt7
8BRdOUHf+nnfzXTLXYblaFVHmc189GHh/8RaaB5d2tMaUgsogtL279oH8WP2bZJYnt9AuxFoiJHt
DXNBmkXwFfYPjw31OfKXnScaN1z3nmvNTcf3ThunHtV00ypGtSVR95m6/0nVLNT7as1Q0XgFB2oz
tYxVTwcT+Q733CLRSlg9ri42szvpJwnyAWFi7RpsrWAvReHxyXZ/Mt77RwTl2Gqd0p9g/n2mYVel
z0U+teExHDzUQRbjm3s5acTItYKTQAzdlM1reMknwcHJsZ2MoWs5ZPQTUMPe0wIPXHHODel5BiAe
rV9AejnVK6pfncJCEkmWmNZbq32ezMq4lTNVtRC5KHaSiNgFYqZ4uT9HYzihZS/hlCluEQ8TYmWV
BXcqap10DXMA4Z5Zg0xA4OHL5WZ+jEPPRBrdrnGpE0Pg1KP00g7Rm7jrOLcguQIsUdulQV6gqWcE
OWLDZLyNqEsGplu/SsZGLVjprxEI+CM5ppQ4BeX6UqBAQkM8E05f+3wKbAY7nlA3TKMrXTCH6GSK
vUmB5eskmGxSSeuUvyQdyRy+K1/LWcqxN9OXCQXYQgZ4GVDrYkAbq2wcClCx+ggaU5ZtTg9A2q4s
ktGApQvc0tc5ZNbzD1tehi+xEl3WkkYsc4b23ZR7E9WhLnHOw2I21i5priLSpyuhD0q0+jLiy+8s
fQh7QDi3aGtGTsdBkPcI6whrue1rRN+RjCeDQd6wkjR7DJoMK/cNI0KFtGUQTa6ExVdzfpRp2llI
HW8tOyZZe5giIw3CJVIsH0oI+4KEq1wLAHvk4voESpLZSimv928zOZu5yeUHJrsq16P36ybH/dJr
N8thWLTDyRYpUnRQL6rWGPlsAa7Gwf6t2iaNFDgxm+CWgG5HMVkj+6WNCO46+v4mtqzS+d1022by
GsRnnKmrBZLSyrX9VBMFiKPFxKAM0xNxQ5f7Vht1zjx4gsjwnmzbPVtNQSPBwR+DLs/CK9kq8VpN
vA8Y+nMyw/cycmV9f7BTbX0khR2SSESqZuCBSRuxNtWlcSZHCQObfnOhu+sI3/KQx4GgMYqJTnFL
d3VtRVX/1uErELABt7ZJ+94YhylWDcSaLUlNxXdGqwXQEqzLaIxDMc7jk7dy6hVw8BK3HrVBsfES
pYujOWNDBeW8G23ZhCax8ReFniEArmuPDNxuln8h+prxhkXZbkoD+ARFA8vjaXNJYlgD3bQSUZJ9
OVlTwPJVlk9o7Ha4WDB91z4Ub3MHy4eunjsF0u7IjrJ7WoyMAkv8WKXzImTtFjfJvPlYLTdxrXK0
NYkA3/pXMlejWrn0JA6G4QMsXk3Pao7jXTWvmz4YFQfDU+7cO6Qg0eeG/0l9WtyLD+9JmquM2pwK
9F4+2DOl5Rq/ocXZLW1TAQai5lBX4Ry7X+nD36hPVjpglcy0Hv68RSGcYRzx/O9cus9hzsRmHVly
a3GM4c7BXKgo0Hf83CUQmhIahVexqaLA51RvnW7c53x3CyiIspY9WCBXrr8rXl1TqMuULJpxM6fz
AzD5y30Jz1sPM8AWDSXwHvHjVKcseVclaRJEn/DOoAHlYEO7R2n7RKEu4r6u7zwSKHv3vx82rPzO
kA/yfv+WVQGvWarnX1Vsypd1FElQRDiVTGsZ67J9L+Uy+2PSSzeZt036v3PwcnProfkDLQEgwu9k
QXE1WuuLR1t8uOCcTB9uQbXViDVYUtEC3xzmG0hPebg2NmEnYu50ZWoTIYrIxr9Nw1YslRj9orbj
Bd9QKqU5qqYts37A9hbs9yfLm9TXlYA5sn5Yj4LG5o+XAcG8ghjLULB51zenePFXpf1bZvGi2eQd
aRm/BMhpdyhytQdE9F/942gDbC2O14rPqngI3xLdy9jlX+qfQsPJ1HmlqSbJeUCt9N6NrJiCHfVD
eIATwZehPezWEXdRZyjisgQM82MTaXy70lKwUHA8HXYbEV61Hxoty0G1WiMyAsxjbo+jA5GQdI5V
U43CpCk2CuT8mjcw1nnpPRiSYrD2Dv+fHfzjUQpDhYqMiccekKCG9wbaagNS21r/ao8s4NeHcxGl
Tv9Wrh05HRTAQ73RWlNO3+of+RkKYhDouyFEZiwbTrYa0hnwedYc5Ujw2ClPD8AVW8oXNG4lIg/P
srpJwcGvTTL4RimUH0Obp8JI7y/wYzUJR7kSpek94W1ZtfvnNWzqbyAOY5D/eLftbX7IXJdFyY0u
GMq8wNWpCuKvghF0ftgNgdJIvqEubgDZfgrNNsWj4qhdYlis4TZFRtfvK36LsHXnw8FPkaytIDzW
qNyeFbipTx3o+4TzHeoESQw3L/q1zUxsYiZ/QXTpJNDfxnHWfOIlDVXQEOI3FWhjgrerJFQa2/Vv
8PsVB2MJ5EYUvJ4TSwY8RwrIIHLztIbV/Bx6YWiX3LHb8/R7sqzAKovN2m/koNStd3ArYn/CPIO/
6gS2WrN5fkqKEIQlkmBAXlUlsTUD0A7ctTppMt1AXDKTKchhQeiY42hUQEgGUOKDu8J2wfxUM+2M
AvaTgZCKVoun4mOfAkqU1FT9vPrmBpULMdLN5X0fPlkPj7oigZCG8aY4lyBcG8gLAPjNoHYAO5/1
BbDtKM/M8e6fFhqmRuZjual3KXVYO2cnGd7a5E92Gy/xzWRCnadjDauhKOhQPlE7CLtmkoW1t38F
roQs+yXXOsIpRuoXo1DwtMu9qDl2AhfuL34lvAiePCeYE4rdonCXlGRSqD0tvKT/RBaj3GV526aC
ptUNNyBc+vP6ua6rS17DFUoiZa4wiBZqabg7KPYnFNs1HADcnq9owpS3hWWmiag1soKOmvNoNwkJ
PYxsFPeWyKv+T6h4FXmiGBU7uPWHjTP6IbInR8bmVmp5nIzdEnadz9xR9u/kKrMdQJIgh1K5FYPu
yF+2rE5daLtCcjqTkrMF/7zcxATTRjTR2CczRNzN0Uot/O/qI2l4et2bILexViHthZuI+vyIm+NE
XXqK29tozeLe9AUfw7OY0eyRXd2jYcYswy6RFHWtXkV//Hhlno/7O5mXQlOTAAPLZja/fsg2SI28
tKGZXyA/WzGDsTV6epUEdZToB+Fp8dJjGIKoAEi6V/JY4lAdliaEKrIOMoAHUeKP0KaEbR+V6cO4
zCTufz0h7mJ6zEh1FsYEQOXWq1r+mV0T7A+uD8LAHG/p0jgeQ9wnXsXytzJXOuWXicr0OIbw4Sc+
0K4irsRserT0s2stPmctVuHZyuMXwtNXSsscrWvVK++LLGzt9UPr5pquu/g6tU7UXktjRIJLzbmi
Er32I32+lR2CfDj+8h4KQqStGTz1aubaELxQQLfhaG3w9BaUFGiXiMNmirK5P7OvHD9AWkXbCqcH
TwK2p+75VBHxYkuXBNQikowy70/x0iI5FNfYAargP7AKNKSI4y7FMtEHIgRSdXPmxGs175rm/AR2
HR0Nn8CFiRMWg7SflLCVEuitLM6yLRjwasZ4ALyxAGYJRKKQIxmp9K06wTh0E0ZJJerhfUUZH+Mn
nPNn4kmE+W8yjOu9B2qCuxvJTb8wvPNstrEDgD5OQVsuzy9wUa5Z0m8uR1e9Vw4JUSxUb2085Ivt
hI4r1AfkzwcBKrrkQxAZnzZPdjK3yb9CqNO8R5PwfNOhHKTitdPVQxOwSm5AT+ebXfLdnziIgREV
+oExwkEN+Ddzb0J6ZuVlmCk87uKvccngQF7+rSYYBkXdXb+ad8cS8PvPKBOLcIm0OLTdy/Kubotb
eZlzK1gKPodcQnZlHGQUUqw4q74tkugCj2HaAXW0bE1zMhioIk4p9ymC70r2ScbTOuoJW5l/kVbz
fyChkYN/aHriXoqsF3T82l5Q7ql01vfIFikKHKrlbbC2EwDb33RYe2gjbpvUOyN/54qXYYDkEDLT
UYJib/vOITJa/kEha6ZY22vXKiF3DYEKi1AyYYi1YdDbinWcCz0SPZP9EKigU4EQ2wlxHKrmcljA
dU4QRhq3KD76J2bslqItik9hP81YZtqmmxZSt/YFN60n6QjK+GZWJzwei0SVy5C47vdAItYp+Hl/
ktdy71CZHRcIqu9UJpaxBz+dGd0aossu5kqMQhzDAzYFiYFPJdW+/k0f6IMKJnKVsNxqHhEwKwXs
+tH6/cO5QQR2Zj9ZR+6fMwLZI43DKL4nwv3K4P7QmL2d41K0jqbKv5Cbf8F5fnGYyWbF33FB1k0l
Jg0mFLoQ9OsEVoqEdyCjpsbNckk9wK/XF0/sukifXoWYrjpHWDsvDekJ1YWffk9aRszUE+ott9uN
T0hoUPqhp/Po4yfcGVlG1mBBRppq/c13Lg82okLfklfcUrahPNIyKKvEhAwU6Xi8gU55szYP8wkz
9SCq97Lbd0ZKS8fxR6wl0wllRN7Z+rDpAp9pcQFIBDOacl1Hl8JELj3Sr48cwNtFymFuP4jHROKu
M0oo69cG2f65zjWJEy83SggHp7YgeRO3PYaJuBsktXl3I1UgvqD/Tza2XQX/ThNiQKCSzWaon2MY
xq0Pcmy8MjmyN1yXloeXQjcaCcr4bmfoYFMlNDzqDpcUM6eIBgFc1pV7kzLfX0WuWNHdZWNWAyhO
QPb+hCwDP4kcYVBWxgDj7eDYVfi/3gk4FiyFiWoQSaBG+f9AGNEk5BpCLs/VMLc2JPPG4RcTjSB5
LYmm4M/Q062W0WzezU+j7dBtBnysIoCtw6S4W8+nCm4qYsrKs2q9A3H6kUCuQ7CHui2wZ3hn0yxF
CPDG4OPUtPFkJLVCKkaB+U1EBftywy/QjNz95aJKGpOdzEiX2cYZVR9ekCFWrTFlz4fnZV0uUp29
szRKnTeaGVbr+GumC40PCTko5f7ibgyXMDa1TMHX5SnMETkZOTOk21p0YdPtZtqqg4R3mM16JzhR
FgzkkDarq5gDRIF3NAWKEiZVJp9mqZat5F/CfjR0VGC56QbjYg9hKeAqlgzwnF4sQfbfWrTxgs9I
qdirYffTOGHg312SjYFgMg18ySkjq7kzl3OHiIV+9gToUPjWAhn7+P1Fsbi9n6LOw5VJmc9zZ9YO
KSiGcc5QrTE2q2HOmXTfetWSFyyklkJL7UHv447Y4bYTXXgBBzVFPVzAF0y/MuGFW/6ZWsPzZrl9
CK4cOP7WJLfiv3QVDVwmmBJ9ULahBxHTVDZrRmzplNB8AUhniDmXtPHjcgD+lPSbMdyP+oP6AWg5
melrKf3AXW6MPZWNlxkT+GspRUpK3w6eKoey5f+equ+CE5P10ybd8HjCpEwjDdy1FiU5yc11dlEp
fapvTyz2O8o7dB6acRqmxUHQDggrExQAaOEYEK4WdN7ISru/51zsAKRB7i2plTIxb81KP2ROTaTl
TXEVhFW2G2Pgb9LGL6ZGXp8FQ2p8WhaaPa4ISsjGiNBDWd4Zf3UCsk2tMuREbezmUxuMcIgf/fdv
WxLp3E8RsaY0+DlaOQ67/WUXn7EzqyFrU7GvQ3MKZHn45Qo23Q9az89yJESO4sXKpMLbzrxb4Yga
0phxJMmzChvyYiJyx6WNJkxhgy/dR6jOzg2PYCxvV84IuSca4+T3C1c6w+Mn9ay28ETrD4iQW8Ss
wcLEM09U+sdT9v+9hHJU5Xql1P1gUPm2zMZk9G95G5c0n8Ug4Z8j38AKRuMT4xVSZlpzJ9sw9Vub
Xai2aw1AxipBnSkQexu67ChQlotU1dQNj32Bkot+BUacUZbRxsHGkZw48KtVfjKgif9fCKXFb7dX
2oBWxl5jdOhdhvNyhHXj/9gi7vgisQxJMQ2TkaabHU7Yd5wQJaxHgQxW/AO+qcRF1M6LnqYWVuJN
tWI1XI/irqQgWVq6e1fnYOSiBOhq1MBX2oxwDSEXpYy8K8ac2Lzb180+rEqS+MWddLX04P+OhaJK
DCRm7gk7gzhzrjetg+wYTEf+2h/iCfNylPxDD1W8UFCUJwWpbF/Xj+mQgrzDlSQ6c4xcsr05KevS
lgRS4lrqGuTKgIavoRVjJRffCws8Z/8gtCmWwa39BHyuu+MhC2fe25dtWLPLQS9iMXqeGViFTAYd
KQLeNsxwib+JbHWfyxJqw4ghX5/G+HhAVIBbS/OmHh+NNsUQTT0zfamyeUTKPMs2skXMA6nHR0px
TQzcuausFIolroBHPSna7f0PMuCDi1Nae3Xlu4yOrXOrjdxWv74eaflJz3Qp5fhZMGivXXLwp/Uv
3zRK/1pR/w59ykO6Hyxn+/p26t2xOud6O5kK0hCRdFeu/XJZ29uCHCXTsUAWZlqOyF4Q0Z7kFI1P
xs0g6o5sSvUd0YoS1O8Z8xBCJyJIjRHwbQv6op6RkFxdCa6dSrn5rlEJe30jZ8F0dGp/9WqSfbZH
z3zWgPwdaq1dF5D1nLJReMv1GxJOm+XOfM3qNWh0nkDYzIk1w9q0Tfk311wZ+W/bR914pBnPm/Nz
hCtNWzaClEQ/JVrPZzp0mtR3dgaVls0FPo/XXnFP7huBxVhitnWzly/+jWsteP6x4PvQDP7jj+yP
QzYs9jAh32msHpe4tm/2r329Tb02eNnYipJ+RDyWEazs5bbA23UhWGt7rvRBLzZwEphIWyxzBXxK
AEyoyp1wf2eAw8fZkcIyxEKSHUtHPcQ06w0EB51XV9M+j2wGGYMvNL30llwX7UKjdcD+GE8+jNtb
SG659ULiyrk9wZhBb6NTs1FmbPVWZK7TK5qgdTUiWX0rwOFi9UE4MXX3rZ0cITtMAsGYdLgmhwQ6
bFVfX9KTJ1w1lXjfxZH/Z0xo5dUM/MwASrF0e5V9lrnNPg8jl4Um6VbdLGPU3OndyiaugswYtqzO
Yk8Z8jDl+B7Su1RxcsbUYjKLlPskpcA1AU2CHHYt5Tu9jKutTk3+mncGxolqdV0KAxS+CywXnI3W
nEXWFItSFPv016JFCm8i130n65yMWWMe5Xw8wgB0e5lJljFM15R62fNOpAVRLewo5419v/Q4DdEY
8SBZW5PeeOhj6ekPX+bkeDCy8SZPv2pdJoSeXv6XiUWdDdJMt+R+sSsihnpIRQwJ8lvdQzLjwc1B
7e246h1IlqoiwNPsc9KAhmseWwRh04uWq4aPzIMhM6ddfEtGUieiC1Z6/5YgDXCwvHZdBis7uLSO
9Ot7FARm+EOk+TuEaYZCO2r7nMDPqz0+IE4INMspOLc+Iyf3jBMKUNNCP9ufZObI3akQdm/Cx7te
HUUlt3eH4gbN5pSgTW7ekxJT3BO/qsa10IMhuuK7mZCLN+kTIknYTHN342esLaHh+h1l+UeaFuFk
C60XGCG560YCHsbV/R0N8M+YtoehWs+Kfo3EhHHPWNAAcKYryxf49gPhDUcpiS4nptes1QQ2DMBI
3dTTMQuioh5y5Sp6rorMViluS1GcBVnpVqxAmDpYrheRVtGB88XRGJdbBCyUV4RRKXtmNb5rp+H3
G4i0zjTci1/IYEiJaND3OX1wNTswc32bgbOSpa9ywhrMcWJaCgmm4zNTsZYUprX/bYeDXk7az00K
wmP30wOsnKbrD3XPu5cap5d91Ss3ndGhLwX9deARRJ4nI5dOuUkadZ0iJZQv//S2wjHb6BXd8dpG
W5tYwEqcl0192BqHZWNvjE6p/DxkxI3hrssc5ZHsCmd0Lcgs5eRGnNEo90mtK8JB7j0g/TncK3Nn
BSGJF07Vj9Kk4+/Mil3kAJD6IpnMeby2blDRUOJ2lhkMnE7fpUCOcb14OwvX/Om459HbUgfje7fb
uJ31+Ugw93wkzBqS6jBGp5wSpTGTFW/gnnMNJVJ6Ygtr2jLQcVEjh37ZEuwW7s55HfqJFdsSalVH
NeAFoqTKaSpGB9rmy9QyCf4/G+mtn2Jg+nXEBUZew03lmEDuP1aLyx8UHGetwqNsXZ68TrdLj42t
Jniu11TQKRzPG/TTSrEC2t9Ax0Sk1Tg2um1VPtkzRGSTVi6DVHsnNCMgFduisb0/PLk7ELwrTvk5
NaeCLwHctK3bVD1Cr0KGN5Msjl5dEiobT4GYWkNlvgBsUBG25yhu6o0MxnhO8KzJjPUGBgq1viah
aEyN0z8YSRI0lxsqco+DtG6fsPRjCCVKzGCmIVjr5TGdl/zLnIQYgc3EZ2hZXLxaRncsK2k1HMOL
KmSqwEy9dHXfaOLR6N+6dUokYvlhAH2ComgkXo6O2Z6XzBXfH9zlh97if8p7rF78tr2cqQhZ3fzX
MsXZEJy7FiF3BHaHPfYgURb+iB4ToMVHHfhdowxpXIgK9raDjyKFjnn6NeThwFGMOs1dNihU5KPs
JYPaBHwKizMd1lbyUfd8E+ehixBJ4elHR5rGL5+0Kckk4Bq0YTYvLNlQo01ZDlubCJICL3W1U5Mi
KH8ZZaVALrfghf9syALjfGSoZ1nxQzfUhj84UrpJDAj+pPiWl+GIlsoe/nLfrg8hw5CMFcR2ztus
K48IERs7kQms0RhpzTMOtO+gifIAXtl8tKizlYUW84Kj0TMUb8F2EDV+lqYfYkVzMi5rkhnPj2hl
D8ClJJirjoM7Q7bN5JkVMgvH5gB4UpQKAjy9lnrwCxhFm3mOq4v0kB/wzLi8UOetw7pdcYKhKjiM
iBtw/wMP1xF16C4Ox7S9siv0SFLd84aFly18tIZY5T1ulaqjy6WsD85BmvCq01K2DyDkKlP/ty8P
tBmwoKW084nTSiJGNZ9eVtNDpS29IaWw85uUHG4NruRCpy/77sInOIf/9s3k3wFSM3xscBQMDERG
j8cqx150QQz96T6zd8FMHhCBO8Rxjj5wEzuEhhFEnD4qYYTxJ+zKgmBZDZ4ChvqOWPAJcclGuDt8
oUDJ9INtDvPY76/GIj9LMLdQ4FXF1FeIKvAq6kfdAA8fx1dr038fHB85SgwwhGhTJ2AiitWaV6Zh
xcNrj9Qos9LEfH/72iX6MR9ohY2Tw+mQ3H4QAfPtEzToJ1eu3y2trfCzUqeklpXAWfZZXhaTIPbY
7r3ciwjs6ty71G2nOuyBloGWOIg4DV4YRRMvBDAJk0lHsjRauMuB+Jkr17njl6aQWJ7Vr/EyTa/b
kI7doTZ3rInxh9hhC6Fb2YBnkXY+vUsGDyOWFkkiNCTepXi5+HNyz3YKsKlO7kuS4uNSDCLEIy3d
5NJgW6fjJJhZI62fyQ3fUgSAX+doFduxkcgH7bU5jOw12ew2F8kRa0n9hXtO+Xz2LF/uZalsfi/o
bwHxKQfI81mZB2BnP9DJpQ4yk91BAd1XNC3/Kbhdwayzrq9YMDIRTGf8naQf82ADt2SavNDR89Y3
hfErWgu+2FpNn3xHloCuQ2z8o3L67Cbhw7ACN1sNQcDG7aexrp00nR4myxnf4jv4uqgyfmgwSRzx
v+DVb/AdhI4ZhBjzKE6NrombCA2S6ZJZvrOO0gMFRJV/54krm46UV/FLRp7enOHmCe3G5SgHWz+G
lNwFTUUl25BohraK1lkwsRFeACt6DcoCRdIKASPr8H0xDJzLpz5kbQXWYG7/mXDbmbOoMCQ3I3VM
AwZ8mNtI2o3T+WPSKz68rf6DVlAdCsFKVMoVU9vp87QdCirE1xf738cP9kW8hev76rudEL3LxdQ9
j9toaP31fgRmMQjcYFq0SbNb409cuqiShvUW9r+MqQk9GlnMnv7FtPn63+h0Ji28yOtM02rpQl9g
VHebX/aBWY6Ah+0xgzwFNYCC/FJbV+kjLmLrBkcoKmxuqIT0ErI51T0t/ZTwoCNCfv/RKueNJhsB
mlK+jZcFmMYHvE+2s8PWlBElKTPhz4PaAIsOHYpLDgVTXPqKhaXqzA1fFLyVaFlaYw/DHCjQk93c
3IuRkZxsXsTlclOLlu1PX89fD2nGowNdR/pw9rCK61KIEvezh+kR8QgVD4XS6gKaYAX/b9AZOSkN
4tZMW28QSAWf2uZJX2tcA2Am4rrFIxU786qfNjC+vKHCjpNUbrVE0nvUz+ON2zOxri1vdG5b/35f
y9X2pseZdpaPTjQV15R4RY25Cu6hnlPNDDxnpd1q6UOX68S/RkiNiZCxkMcE3XNGucApEBnvHxTn
/bo9TB/UU4lSkS/bAZ9bZacmDwvPK4rge7DYQenEx9A9/bou8oCGLBFHtYyKMgC0U6YM+7QZG62Y
hpRZw1E6bO0O/9owGGv0l8YotF+l+29hMVPfQAjTJqcWeUURHiYh7RodebTJW7mcemnG2oSpBh6b
f9fKe/HcUXeJnWBEEAkbCWgIyFdFtlCk7w+3eKBBsSMDmpksem3iia6ExOb2t/eLz8+ShVE9SpEa
fxwJyc7qIb+M9nAurK2NffYK7XUItQzPJy3FWE1Nw/zdWehVRcv6zV4hYYMyncEKukSlLaoklH/S
n/+pHSzjeL2pfEWGOCIzgDgve61fgJleuo/VG4eSK9u2GwBPDpxSoetypP1upYsY/7g5V6Yb2rHA
dqoczAO7k1wGMoCqmSQKWP+iRHa33MNgyB27ympsfksymT5RPWSf//hpZmPj3zd6qdnTcVSNxxO8
iogjxjexcAJi7RtDvPXm0dy4eMATXT10ohPZFXBhOd3FfzimjB7SjF/YBKvJW0oQeDYYfRckGbBa
2zmcgKZRB3tlGKb6bk9LAzHIRRGZoZnBa8RerHryqtW5YOB9mOFj1WRniriFnN6B0z2mwQYroN4h
l5mgX91H5VYNYMGmmHr94TCg6bUP1wYq1OBvbzY8zwwwkT5P7IqMnNX7Lwuj+JXCRuzMZYdOyM0Y
xlXn8wdvq2k7hKkqUHinjOKWXI3dlNSfKq0VAijtGmK0TP6MpVymmuQ1T8k8LqgQTBaxGtvdT9rl
19KkKKAaJ8korSjMbR/SJCevDHhEyF0IYJZG8P6HUwj14uZB9N5k7WZDwud7Lq639gCN58e0+1ad
tcSY/zGcugRDIveOhhgHxRqqMz/n4PqD9K82gY+JK5m6uwsDgzg/gs0e48S1KKerEIYOxs8E9JqT
Ru7FmM6e80simunLjFtP0vC0Jyyj6QISWV2QoKIWil70NqebmyCbSel7GUmcZerGBOWYwgFVzUlY
QNelnsy/kDUQ/oT+pOJZm+HS4LeClZE5g7bWxjr+mv8yNn76aqQHlCRS85hPOcoOceGmJ3CPNPMW
6nLLsF0vymLgIty/m+EN63FrMoja+r4MG74F008i5Ef5CH28qFLVg3PaHYq+2ytzQEbhK8QOZUiC
SoJ0t52zIhIx5AQFLbzNXM+wAQQaxOhkax+XQN0Gwmzrf15frh/babEJfVpwjtODikLGueNP9Qg2
usmmz56lqsXMpmlJaTX8lZAdMdq1RA6jNjJwyaBNL9Hh4GfYzT2AxAORKKtHOcLPsk18S49n+YPt
e1Dr3gsRnFsTcuT1Vvg9G3LcQXR+TrMwx3LSP692h2Plaoy1Io2hREvR4YsfbKoGYsVccEGlEMrq
g4xCn0f8SbExExXsdlCkWpOyU1B1Bni8DUXM5u/m/ExjobRxXy4nARlpAqtl8BtxXIxo9u1DXrCG
YGFd3XFbbp0YlXyrVii1/rDaWuTEEUt84/cnAWDnckC/rA5aG5aU20xAzUhnp48EgCfSIc1pphkD
iVrbHVR63lSAuj945nsfe7eZ5AkszNgkr1At0ypv9y0SmWk5LiyHETBgpOfUEktvUMwSh6uKkkqA
R6Ca/nHEHbamxGMIDqMRmkDgsawpZ2NNgMUHr1GwdEBlsjonLvfFMYJNlSA/+xA7c1A7jtyCACEv
bEKct0YriSHoR5MC7fQh1LAM/n8d0CB8ZHoimlUfjHev4asCgfd4CJoXav/X5QHvZUOvKqOcAR2U
u2SMMZIjQ7NJJkkzuWykvPCP/XVhtVW8ouBxFH/Hl0Zm20XK2rrRWT1YvltMzp/8tCjIooBHppIN
jm93Bm5gN8CzNxbSra7BHqrD8RtXHqun1VL3IUnMxf9v6zPC+KAxQ2Ze3womtnyrH1Qc4+znmNxx
/o4My3iImaBOkIXpzOs3lMfAHd61G/ozkJqqxX5ZllI3q6lMo4BsNqJrguAqpQsBSo6e+K7p4jNh
mbTgvZO2X9Hnfs+lyJlg06Wd99DFv8CoB2FS3KBZjAYhGWr5MmjBr+NGUZ5GuQ9X3nAOo4PfRaf6
HW3QPTrnL6pZ5GtyBJB1IWoVYSh4DBcviDPqiVmCMc5/YQxaIwCZrhG877jYVBcyXk5IwU/blaW8
dPUvKWxXxvGoNL6UxUjNo/iQDh8oZlZVcBbn2rNe1lZCVC5rAy5ol7vXl203JNJ7O1LaWYHBACph
WpyNejpjs/IJsJQenAahHA/LUXLC5B7dWc/sa+Gu7NdB2bxx9lxChAJk8U66DQ6L4+6MYSmQeFr7
oPOkjFIHt6LU+aq4zR9hrw/DocBGDPVBRraP2fxg2aXAewyek9c18Z13lV0uerPXt/rvL33PPjwK
7WZ8eFyQy+mw7JNmLYFb28MQnxp9bLWm7sOJp7kfsSjCnXFwh06nzwtki37cR/ziib6mtpNWI4hS
K8QArSShOc7+VVye0lBm66JyZCB0hvvy6mp+HHuXXlZveYD6XxViga+C3lJQAEyGwiS49Eu+YBQp
KQdJ+yZnsPntdGIKXks/4wTSsVQJ9iKyROdLOYPp5YZjifGGRAKeXa6D6R2t8npsGCs3Guy+CbW/
VO+aP78jSvCVS80qlH5tQOtJ/q80Bd9WLJGmfiLOqBpa9xL5oiHmFSEla10L+xXNq/aFIaAllhW2
ze1CBXBBjdL89XqwdIuWnB+NIkVfaXCzgZU+rXZ8lSUetrLVRoMlE2UrnyHkGMTmbzG6OPv8flWk
Ws37Aml719/RcKYOP/kT1Tvz0ODCIwxcyLXF4VfM/eDWTAISdUN0rK2vw8TyZIl49e9jo5jppUVg
eWy378dTrYoTFkiGf4eyv26EkN6TZjFXQhdsXVvSLmKH1kK+ccn/CihqIoc62LQ7ojUDZIoNlqHb
gUNOgXF75uZW5DaTh2PWZdfAAnRk9/Ii8aiKMdn+V/eXiS4UbNmlSpMJdWTtCD/lVNtehloJG2QK
HatZ2mo/iXQDprzcue2UA+V6uqEFcY+fBieuWatiwdgN8PxTmKypVF3YBWaDEDmNkDLZW/ouMW9H
Aszpm47OBeMeRqurrEqwBLEwKtqkkcjCDd8ShPJa09pAyRgxNTXHdyayPt9aNj/YqCi+T/qpCz/Y
zecGTX7sH/jc1AvCNvLnFF6Bm+hygqJeMo3nEAEwkR5Etuli9xvW40n3nck3bIQKKu68AElz6ncI
Zf421C/HwikgsRusmCgbKt503eYEyNWe47KGDmJ1THhj9Ke9GdjAlKRfP+2CergWCVfABwX5dflA
8vTQ1Ue75UPJoAa3HWs6KUIWd5dm604i2YEepd/CY36Ok+Gf2KtuqtdaeQbr/LlMet0M9jUfPzzx
eBnjDSRAHCJ6cwZQFKhKrlzkjcoJiJ/5TIgutYrqOhqkoFI57Nn0HA3Ub/XdfQ0LQJOXl1Up6qzW
wC7tgdp9R/10qRCUm+nyojTTn9AZOgXGvol44KAGyfz0Pfa7Ve9SLJCzGxwa0Sg/colaGQUtVOVK
lV8TlBxu9uXw+SSdLlhruvIJ5gGXUnSAFZS1WC1a8tRb5oG+HXKi06tmpf6c/HXUMKzPjlI/25Lb
wau1gFB+yDAAhHh9/S2icqB3gqzWhQjZIyH9OCJd2/WNw+3hkw2Nsu23tCZ8/xxCJdM9K/2TuZSF
DlRg1baipN82U/qXJ67u5hdB/V+HAR7g4IhnZ+H8w8TmLu5M9armRYBjd/a+cHPWmrsAzPZtTuP0
7lRLQRH8EUQeIQLJeYPr8nGCLHY1q9x6K14AhEclKwfuDghNOFFLw8MF4NvfdWiC0fYZ0/HArI5F
ee1c3DROaJhdWYIRK3V5y1alZo1576rIEcKwxlEbmtHF9YVvvRcy08Ab3/HUg4CKRs9KMQijb+1z
VmUnU/dwwau5JvQWoPd+3Cw0nUrtv1SHe/y1asKEnqx5kHmqWP9Oul3toJx2dliTTtYIjoVT9rms
HHAYM9FkRA1nkLIkM94kdp2Rjx9dg1KN5kmyKaPhM1AyEUf5DGGsRop8NektRpdNKLowvUh1OVp+
WAqiBofuiRDKio+JyzsmATrnp+3pOgybCqTL5sPXfun3U6eigJi/KPXRlgMLYf8eKIbXgrqEQojj
SgocoTRA7mXWw1n2EanI/VMPUgwnKHpG6WlXEj3NcNXfVldUT+zui9+q+SmJznoG94aqmVaVoj4x
spmwDujsc7b/X2Z5QTySDMtj08+2+q2B8FhPj275BgFDFfBZGs+HMOyJMOeWUtCTmxSbke5M13AY
EBSK0uNHINojqJxOQ41fU+jOItWrN4GBDGZLNbQcSjZqTDmWgySqEWsjaXjdk9VpZrls1E2fsqJ4
MMWfoDgp/T8lFt2SZqVLy2/7/t323m7G1XmDKUqqXEyYRREdBQ52AuecgoJd4mwnfOcc1XM7EXzG
lsAo/rDqDJkFPqPW1/8wA9geL1jNm5urHG8m3NhmzVxSGgXVZ8msj9j6MNW/UNIVgmElrdPReEqt
aZY84PXms+4BaMI0WIWJrnxu5Q+wUkX0YVAydD9NAhsKP+gzfCvWjsLE9D7Xjo641IjvufHNwemm
bUraoezna+Hrw86Xk9Z8rduDQUnoq1MNzK3jR6CMJsGqI0GY1bsjqtkiDGjV10HZ7Lisf99dKYng
S4QLfflcfYa5Il12HvcG6vfVlsOw7OapQqDndwzH390tzkc9c0ReT7AFMlDJ9eNyH5a9ZzpI2eVp
T2GzVMEVkjzZRy3DCUc0mE3U8RY/chuM999GAIGkcjBknfqE6yzofSQjs1lkFsat/Zkkp7goeOiN
vpPJ6sgC+VzC1DJFDxJjCOJyyBD1ywLkHRqr7N8N479rZZEuKuH4H0MqvaSuf9UN2OSQTpI9rs6C
F8D81iG9QwReSueEUWB/RGYoJ8NPUqBcw2mJwHvk5pH95n62L2BxhccrW8JqiO4drMalE0cj3wU1
Y1rQqoR+ATM7c5yszqmgy+M61puW3Epl2OL7dvFEmaaTLidp3xa5J46j7g+dQvMBUCeiOMwOUsl3
zr6Ykx1f4IMLtd9meQR2CvWj8TqSm+I2Ps8VKN408aMnaYUu+FNsQzymhJveR5ePl7Yw2h4QltZI
t9346S0nYaw5XLxrz7KcunsLWmc5mUt3M31+0u1ZQr8UEy+DRNiShm3EHVezqUSSximi8UP2K0CK
FpYb7carbqsRMuAL5hwus1q/IHxEG4Oa5Sb129xPHL8UD3G9ybhfhpWr+jM/HrGiLEYv9JK99Rsa
nW5ia8MVTkvQmO5eVHEmsXZB7w1LDJvx4Ry6zi1XkSaSJrBnSqXmuriyj6JH72Dgt8ohoJWI4H8L
u6OF/xdW3X39OwX6TGbqQEaeURxvRgqx8IryPI5AiwlgDszqvDXJ7LBmd+gOvE30cwqF30D/K3Vt
lHhfkPVWqrsyBVWOyHv64ZBwHUxaaCon5qVl5+Fxfy+C2hpsCRcxDzvo4MhL4W8tc67eHRtRF8k9
x/1mjdW9/a3bExCK3+BziKvwOrB0bgVaHmUUw4i4DZESBVZyhAqfmbVQ5L9QQiOQ05rXjVHxlQDq
5Nij3wl9qK+q7p45TKlxilUOfubEEjrkh3C/aNm4cC1nKbyZGRn4j+aYN4V9pFcAdl1cJHl1psOx
v1qWjRP7VzJxE26Hdc1Yx2s6FqA4otYAq426siV77qrUcW8lZGvSuJ9xuJq/iPcEVyQ4vZ5iqdIa
sRnyXHAZFghjyvqlvfppESWWt5A4KQzDoZUAig6a9HFvZXewyyknhyIddZaPtyxHkTUx4g70g49w
VWKEisnN0Ujb/iPUcGhyiyedpPsBhX1kbwYfnEi4cj19n8I1XssXadOP3JQ3e4Yz2RLxhheK/FlJ
iT+5CIvvpgq6DJrybwBIZkAGXX0O0fILdK09vX1kLCFum7/guHzcAP9vHyPQuk5iMcEjgSM5emZ0
qKVQz1OoVMXO3CsLH8plZ2aCrLo9YWxeI2XbxOMuJNhlpS92pXOoAOg7bkLRs6HE34bXZiW5oUec
vaO84VFMBOh9lO+COUrPRv93hJnskhI9gbXXqYJuTmKiDFEHr+zFAITzH33aiIXJuB8ZMLU6TM5S
I31Xtd5WAXC7XkXRyT5M3GcllBnweXanjkfDCDdSFQuam2Dhq5+7kd63dcqpwXJznGVTHBdJQMoB
M+An6BcXmSd5yXhxTnnjRrGSaAe8ZFxZtDXKlP2LAxB0abMN/3Y1wWwPQBG+V/AGoQ+XjDJ7mXka
rd392vkYiuzsyOCbpEn87mwz7H9sWQrUyScjDDI/+WruwsKeVkrJ/cS5COtFpIzaZ3P6Yca1w/uM
4P0D3PesgN68P6NA58OXKhoJJfPgr/GfjhCCU5RRbgM+bmCafPnA0lbvvZ+q/tYBxM3bvUHrX+Od
W/YEpsnZiIpk4kOPGGLzVsHj0bsEkDmc98kQYVcm2pGOZwbvtB/bdDU2K4QrEqIZg4D8iTh7/SRz
YUMLzlOzsZp5CXVkkj1cgwVaKzKb25utbGLmomVLEWU5jrpRkFv+VPrgVTxyOKuT8GhaMTYvh98z
JkoSkrptZKgIPPPUdHxN6GbHuhRcCn2CKoHp0I0elDoVdjIPrBqenX1A15AsBxmjEFrhGBtHpzxO
FuRAATDRj+YkSuDBeX5Se4HpxfdKAQPi0x5bevEW13r4VImMKhzQPUq90EbukQaHDXAiuhRF7iRi
mEiy3Q0/z9gHvOR84ciQv+L1hiHQDrJLr8ydISA/Ult5+CM6uSgzPCGzSB4eBHJ3cWqi+ECVU0v9
kKuhfghbjcfsl8RpVNR+doDi0g3hHchuHJs1duMfkJ/9JxR4xzRHILmWvYqGGkIv9C/HhnJVaqH8
G054ZEJrpsQnUZkvnI8LYZ12QhAXflOJkXs5vIy9O8YmLvs32jJaJFIn0sqqYOSx78awG6E/6aab
iY7sWhLIqEvcwnu1izaqr4+NGhTL3wBJqGRNqDJ+IP4PJTs96GRvaY/2hEixVVv8BwkHUpAh2P2R
352ML6n5XhnNcDzj8z3njSJBuzASZSOxTqoGu3zY5EwxdkPyvfQb4q6XQq7/pAewx29qXhJhalHv
BrbWVL1s3E+m4cU4sW/b106OH7IvshUPZePF9BXpzcUNT+/Rp25804L0JbOAGRJM7GpENDLAJnP4
KqxL4w+hBDhXO5WYEVXWM1O+smTilpsXSY7DwFeu8WZLbPFVx57NvcU9q/82FDV5d35UEUpz4VON
UwT5A62+IbpwPgxLLFVa0UjlhB9PrwqWLtL/Pw5/B7AjdIc5LRPtWQjEMxWkBs+PL+7aBYRqLTCp
PzzeIHhZMfH5nLsEFi3TlpCGq6bcosNUu/o9j9rch7N+zR9eGdQNcpgaWyztqTsO8vNWfB2WMmQM
OOJBU6Ug35TDIJqrDPExL8oYdJU5h4AKQ0kibh+yMZ5Gp31meVRDIXcsBdMDQySRijTKknocfJxN
CYTY6O11suqNJ60emKL51Z+fSNVAHLZdFfQ53+buudOrayCJd30H6TZKO60feE2LjpWxApiaA03r
vjQBbKD8JXm6JsQvMVWOT1zZAbcA10Bs/tQOUqClZSWz81/MsoXRscJZtn4M45IEeIx8TG2r4zQx
iYKEu9dDFQD2X5Ilp7Ak0mMk87S9hzPSccG5j+7WesiYJBQj3/ZNUG5EW1QQu8TvU/ZeYBWxRRu8
zutFG4E6oNXSTtWDpGqjoTNMEcPQvuoseaG0xqdm/pRAVpdMfuYShrv7CmDRLpmfKwzXv8NShXAU
0U/6F4d9HX4qFfRKqOXTUtAWYZHXFrOtfx3aFddBYdlrXukhGuf7iR3BD+Q10Dgf13A1XsrHnc30
7sBUJftkWeJ1hmYRSmSAt8hrCXdYOjnLewn2egS7Gb/3jAjef4HRB9QNzPTqfioqJgXvF6oblUTi
dcsv7j5smTrf3/W8c80YGM6aaVtHd+dX0qmZAvPMd7Q3U7sGWCJEnvC/YQb1cPp5fqga/Dp/gjWG
vrwBNo6mSE2Rv3+NJT76ShJFEgfZelqq+fx+lRDwCebXXw1ordWWeDJKsitV2M4Qx61FxSJvhPYZ
pRtEikFXfi8a3nJuWx3TzrlIVVtogbr4ZW6xqcpvDBkYKRjkcUGjkYqnw8Vc8cgb9B/KJaJ5x+n4
052MI5xl5xxUGAhfPxipJyrg3Ljb+oWdQJX0yAAtN8PIgDi8G3VkHKLnR5645yUqcXeGoW4b8VQG
tlMfrNfKqK65bbLJpB+Y1AG6yg5dXZ0pSKsFgybACqKSnoD/HoaN9bvOGQEv7t9ihOKSBIlfx0Nn
7q2o8CxO2m767G6FT83xcHKhbdFvxaBQw9aDX+083B7tkwT6Eozh+qGFK0YcbcpgNynkcJhJscsv
7OQIxQj9sJSJymiOte0jH9uIV4VsDg/sB/pftogJwZgsONcIo9L+HAbKcmqsLLD3Vcup0f+qmuAl
DY5h4OdKZQs2ZX6xcTwVb0DyaniICUTHzb3YIp1N9aw1VV/36KuBPhdsFZUkdMpNH0Vzg5I6Fl2O
XtFD7ggCSMzt6+cSUNuGgObklDPXnlprcyrE67mbPBxxCyeMFOI0/cvrlsEh7pYhmRHOBgvmTO7d
fbpHG8thBeWvEOQs8v2ilDtssEeJKntk6pTetSKh1WEz7JryHyvXMk0er4g4jphW5yqA8bUHmzE7
ZVrzQMihDoMqWxNNbo3s6UkYs9DEiEwwpj6hDAV2mgVJDeLI5oV+adlzELyGH0RIAW+72nXmIkHN
MnLh6mkM0FoGGE2ajvdct9nYZCecYoIsCGPSta+0spvsmHC0mNgYySReUXfnzNeAeCM/T80Im6nK
9Y23+bYZvB/d/1nJwVlKi94Bnc5V/s/w5g48qxzcNYtXODn83SqHt2x1N2qScN8vU0CawgF1mJnZ
pZ2h5QgEDYEvxXYhs6x6dsyRDrt2gCRfsa8ipTRg5/2cTWf8YX9e5bZy96EdIsfuyCC0aJs5bBAP
wYPo5TiVBQXAXBD/CMxMkzFUcNQIYTEucwqLR87E/dEWE6aq12RK1Gr+foW8+eoV4QyiiyXJLycm
kdLJxA7s720Guau3Dln3yr95eaEKzgJQUTC6sTUyqVbumfyIGEiYjCzQtN8nehTWmnDBUvYjU6OC
TWhvWSr/m4jpww/vCQwgG79Rbh60R4mgUMkoEnJmz9Yxu7xcMRu2+L3P1TcMlzRDPIpb6xI4egpF
irog7TlDSsN5oi+OWIl6BJTnwZE6osWQsUC/JJLmgWgMslKzvY4U58Iyxakrm4MN+q/Iuiq8pMrK
6U+CUUk5LsDKDcNFTxH1mtMmByQkBkdhiBMRGfLHeqr6FpEtkuEnl1zHYgpYn7ijOVCgEEtwOrAq
sUoNt4J4p7z6KuA6/fDTocDmi44H1nFxrXLWGBV9aV01PGYoQ/GbcPxLVuPBlE9ZSP+DkuEl9Wou
CJfkHKE38e56qoqT7cBBnKHC2QYrr8EF5GXn5RTkwvHIdkrAGifSYpvO6SaSfOD+1giqgH5SeCUw
0QtpZiVmsQ+Ju0iA3kO4fZXFvdkQnS+1I0u1d3Wn046gB71l6QMnkj9/m2nAgkhOrzszot3I+n2Z
nLBbNbz/x9o+6H37mlHG8JpTot4oRDLFP+kYZe+hn8w493zJQrdLVd5z/vZ6gh0iQ5I89mWGBQg9
bqK7tXDlJt1YGPlHyUYeVfnTSfeolKc1jK2sc+ypqSUYE4JeCAjMyEj6Tq3wIBrR8rb+vazxvQzK
j8zwPzGa91kLTFeLXZeDV+yfiQj0cu0H5syBTAGW5eI8Ep1zf2a/9oOySOydf+GcVsUCXg2z/2LF
/pTcDmitDFjyy5BxDjFE21Y6DDTF5UZteU1YbDU8tuGBW1m2unnFe7o+C7ZKLWmsqourLCYIYh/7
SWcaL8QiVeKpm2oTbAt6zvnNaI2Zldmg/HzL4r+/uk0c1dq/5ophiQC0xfzW1LjgN/yX41uR2x/f
Abur5clXPSxz2KeV8VwfomLvHY1k602ckoohG2HZ/1zsVIn2Vj0Bsztg2A2gSs+GbrdJTkNBj+uB
aJcpY5r3DMDiPtdNdArugjZYJ/l0sH1V/iEmTILHeJPO7KmF3iQbD0/ok6t1H0jYtMSfYqfHY56t
28fGYNRL+wrN7+oFR4VixrwYsZ5AZikxlTNJXsEXBt94YYZRi3t54Tb32atN3LHdfIlyS3xS/gIx
8TNuAe4XzioIfGpldESy/qFAch0koD4p5XNygtCcgDV+wUBC2cmYd1HHhF2aAeDZUoNsnwzBDM8d
XfuXcxb6+x41CFycKn3E6iC7OPtr2YgRJ1D6xhWMsc64Rf+BvN2gFycIXJAD3E4kC+azMITaw4DU
D4lkv2RP/gqN1DyHJlJnOkud4cKhbdB4GVuNwtVCf2GwZfE3lVVtE6GTKlnlrGS7Rd8Q2dw7huAV
iZWJZfKd12zXXsOwAAYyMsyqtMUWg1cUI8w2ALVslIybqXFVrM6h7cC2nwfqnHHLqt9+rFaSpqDm
5P3pb6lSGk9EtQCZ7sGby0HREHFYhhzHgX2klpZsQsr5HZigVykNTXw6aY54IIpV6GobsMGJ8OnP
Sglixg/q2O1Q9kckZjKIf83jFlmFy/g4uHPI6zh+ZzqJePWco+vWhhTWs+lHMKz6OGpDUVO6dkXI
cY7ufVvzi2INkW4256JWCflwHOTLOP/J4e9vVr9p+aQQ7/WvFz2HlYpnK7kmQ4wwPAnwWX8js638
imi9JGelAjtzTZQ8N/Eouy8mVYCsS0FTTJkkNvIRDcG/PJEzBSO3d+dp0F7VLHUVeo6/9kUAySjE
kO3neVSwYsoWPbSSi/SBXo1SSZj1ElYP5E4FZiBwkuRhOh8nuhViN9K3YP5DSbUZG/mKKHnpMieH
o5iVj/VqbYDFdQV5HRWSM8g3fgiEquqVChlMV/iotHHs/MEkzwHnKJHJV/5ooT8+ON35Runq3iaC
ZwVyznkFGJQTmVxDSFCyygsQi21xAvFclV7ZLepSCG+AxdHInWpU2Un7DFICvpC3rzCS8quKCmNe
3bIng+T5uX1fLvl/CmIdmlkeyECsatMj/4aRI0auEAcrvC54Ince3mDs4PM0LapVKeB7tzG97B7I
Q056388BDa8RnTDqnPBPl/LqbhTp7y5Jykz+614YglhKZ6Yve/gkhGMcNENNu2LyS5+HoP1H6u5k
CdWN6VAghLghXsk/V/smhGMK2kA+ftQAvYgnSsp6vOBdsHzulHv2m1Qx2ojlLQd/qe0LahFGXohw
wuPxcxOItaZ5ignzue/jP3qhh0xgK+ly7Bw5MTlnSjksK9uZfn2QJtCvKQIG6BlpCyj0uqmWdOc1
Vk+K1U/3WlazkacDVLKuAHShIIkSkoSCtH93sRkLX+48E69N85i45GiayetuMboaZpQjUoan/MIL
v7ruTmEjj3WzNjfaCtynGq/crH4QN8xzwmR4CFmxA4k7icgX5UDOUfaux2xzm5sydnwTUHiesIPV
j/l2Wmef0LrMvlJyP03MsFNeW0fA3OP3UM+4sDecFo+S4PqoB8JlOzlo8PWmuo9drXVsm3ZoOQ9M
valxpWlpYKiGfMC97y4YPsgc3PaiEJtGQrD2visIz1pwPMEuEl1K1bUeIUTDtj/g+gq9VxUo/EpF
W1Mm/mesGbeHkJ8yD6o4Kz1VorveG+euQjkBvgL4QMbPSMc+Di22AwwGeYRXoCkARuuoDjDRDXWC
WTY5/m7Rcwa4mnQyqYo/BoQgcBp1cwFzz6gjdQHMMm1Y8/PF0RHomjrrQvRZPGiqGJoJN8ICIptx
EZHfPcvH/R5NOYG9s/yUu59DJSqlAjvEwVU5LF7cqUsIbWTNQkCtGrBaTRH+rGX1YdgTAqRKQHLY
HITSOClXLxSZU0nVe7YcCYmef8XeK5hMTSQddaPUI6uKG/xcXEyILyqkQSjSu2b9rridWEeNYwVV
FBYwSfNq+BGwwrISDF57/tvp54uLW+7cVCwoRyg0fsZjToU2Ot4Y5KRzWRnaNeo/scqL+S34XHxh
FTONdiUCMHrOyUhecaK42FgVD3trWNDakBbppGRyhMHBvNyQ/nxVQDFPBtbQh3dWtEbCvqsPl/vX
jsOTu5PdVBkxap2wMtawrr5bH/ppCSeoz/ZtiBhjbeaOqw6dzni/oAv8t9XgHkxsmgf2oVVhCom+
VqTLz93/F5NQGZzMx406GyDvsUAqaRAE7pkwuQO5s2DnGC9Bep7nwA+q3ETlRdz8eLBIorQptKFT
QV4sZXalqCekp8tvJfn982PMhg3HVoEG+KfNxjj+7tq8OvoMP3UPWLBxNIbOm7YTP2UjfC34ehXN
qnJzgtBYr93e9mitiEzUWWB3h1ObLbeugpco2jFpCUqTcBlqGB7owvcRbhsBiFm0YORqAiSAfc6v
lcw2gNDasfKuHLUTBJkxR0Ddj/fJi0mgcS30gTGjeH8dhn6S48zAkFYB1l0QeROPOWXQO/xxVSfM
BlGfthdHa828uqORjD7DQ/m8NGAafFUMXWOXtiyaAkulaJprR5tYzUI6AMHH9dGUa8WLEMjRAs2z
fnFVU42tLq77woQDUEn+3zhqngFZWsa8EuiKA/lyiPnijSfHoAnxOl1y0fFeXI+xs7yKzCGNaLTZ
beZdr2iW8WK++w3zdHdV3v2ELDoAtRWiB6rwKERcT5V+j3glLpkz/qPlt8vEkQ6BzLwEKYM9QAca
83Fzh9mIZ2Vd5bCz+hOEtXwaKhm6hXvt+VAPGQ5sqW7NO5GCtkrl21m9BhaCKdvuCcdTCI1XV+n5
dyzW3T8H7qhBAbNeQp4mJzuDn27j2IyN2amfqr0KgZDWuiMeIRMnuqhmYZCacH8hNJ41Komh6fO1
vHhcWQH1/TedQhDr1w1PHxWWNq3kUWC+z12dJv2pHjc1VqmZLtePD+3u6nm/QxB0Mm3LQsLlTKZf
9bvnLiRzPTk7C0NgWvpmEm9tVHf49lsTF838rxxnWePxyAlc56BnMgEOJXM+F5Ndu5nLMDn6CS3K
rfUDPLs0GXNX9rBZUM3gKJDFiBrc9X7+Zknan73ShpKVxbJOWywBxPhFTiinLXNtzsrPwgQNKRId
ld8oXJscIO5v5ctHSeC2ZTFGVvzPhfPByWoZF4wTTZwAy2Rj4mM5NjIK/hHTI+8lc0ijBE2hY7HW
VWzwoNT+Lek7xhph/tgQzjDtSk3tbo9QOtospsfuIhv4Quz99Ht7FSO0++miNozv7AnNTk4whvRQ
SLiSGKgdokbN1QbTP3YIS8KHWStnRnziOMOe1VHZLfnTZ/vgQpFfA7kYJs5RMJfXDYg+MLey78dw
S6mVOCCcIp2NGHuGQvvkWkpqWFgQoGvRSFDZs2yqe9/mllpU6DebD/GH8Yl+i+kJRCtqLAPgR21y
nzI97/JFZsWvgQn6Csfych2LJ7YkBOmY0wf+sWQSDKrmWm9sm/R/A9U5mxXUDrCe1zKh2wEZHkgv
WrF9rsvqQwWxr0qGqu8v2fK9auq1yaJl0u8nfGATe8TeyiIqEsy7/XMK7ZN2w6bsjsOfBcgvrmj9
PVzx19MoTMGSyaCcDXcg3mdZAlifqWp2NffJd+OfQCyEOdPtAGgj/ssRrCbC2J3PjWOjaijOPJrU
p+DrsqHhpcJg9P4sDt3AYAQ8qT8vuMG8tfd/mlNPzUpnQd83BuB8MeAtgx5QTtzbyvm18+CWWn9S
DMEzhm72sYwdhlGfWW2GmDc9MjoNlWukk1z2hfyztMSj40HvA4ieIcpYr2BdYs9lZkj4OMZdDIjm
kPydGfcd+g/C1vIBrOSy6iauxyVpqYTbEmMEKFifGuxL8RDR9PTtQddUAcuX5foi/l1iZdSJehXt
Pyk7/NhAN/knjWfuEDNwB2FqtIy6IefPN80ovDDVcO2a0jZpTEnzMad3Vd3tBPiD/te4VsUDov5j
Iq5HE0EHxez5qLg4PpIbFWBnnknHcTRjKF2v0b+ii+ah7WisOxZE2tjqTSE8auebLdKia+XwD9w0
xQdcSA4dkddAQsGomSFVehmatZwaR5wY5jDGRC0YwgYmE2dLlD5b8Nu9BT63IquLRN0xH05cEE15
2XgoHBTdCh/yDAfufFE1XaBbdO+QHXyMGrMmBMCCRS+uqUq+Zae5mmHV1li4+0xnisZ2Rd9hsmtV
TTKIUA9Izm/DC5waA/Tfbu4ZrH5W37GeGqvBgQJQjt5mDc9T0EQV6UJzRYYwNi2Yt9v27PY5Sihu
a2me8AQKYjUUJXYALHKgOlCtgiGlKNOst2/4gPH8CLruPjk74xZRxic700gPGtz85GbVbiuVSO77
390tBeicAk9ODY0QHmqTHK77HzMvDdnXWusdHyMeq4eoVJ3s9iwz1pnbRFsrF3LVLP/x1JLxTCG5
xsD9yYxHMKMGaxHHHHXeZ/Vg6SWmwwKqTcRHoCHoLre/mbO/JgPKRqH0D5MI02LJlMgB3s0I+8y+
NpyNijm7kJomnqKFJkfBnMtB7wehGZyJDw89IChlryi0ozlU1EiF3zmfXrs3z0kxIyID0BxlP9Z1
d+KygY9KfnvuVnLvJpK4e8gEOw5eiQfL8MyZ/jCsPHZaSplHp3PLpDMrMZLkZdvPJK1OiKdXa4xg
rsr2QvyhH2M0FbwyV+Uo0cXWzNlFfWtKbncPrzv0Lvot37Ef7KiZBpB95TA4oD9gCpo4Qg8e6xJu
59BhV/W6jnTZ9HIdOSzxy4i0KEBd3QjMKf9IFbCX+CMpP+gfR/LsaUYoHcVs0LKv9je/2cpV106s
FdbdSmFBFN1PEvkrwnCXYwcWa0mZ1TBbkzAnQFKVcYxOaJHELluHSsdE4Y+H8nppDUjKnVAywawn
TjAmqwNrePVTb8MRORGWk9FvYzFv3D/O9QLeMutgn1Qh6xzMNgQT65iIg6iOiRiCAWnseNj7zB4N
AFRkwTsS8bad5f2b4A+pYuHcE/i2mRL36sbJQsZwz2t3hhQDGtbAcQUZdnpw3kPdLtSSq4btDt6J
U7F7slsBQzclAfazyOILsUVBvmWr2mXNfr+XFIhJjeLMhspXm0tuvRO7ixK0Zzl2q/p/u0x4BwCp
xAVHylXwnhHKitzi0CIvRHcN39wx1rUzgbTL2Pr5QRr8GJx6unRKoeuaiGIEXZsR7jziQ+hWEXBJ
73qkspGgS5f8n8KoAXopQ5+4CaKKEIiOMS8XbM54dBcP3g/XjfajKQfFi9whxTli8J12OUc0kL9O
hBJM/aUo4bpWp1Zy3uTVdOgWd5fieztO4Tba7++4J409+BO60l5DhTf3anIo/0NDrbdw0x6PIqRV
m9GFYDMWO8n82r3hV4O3YxucZa7oBlXvcIEWqIa6DUeeCIud+YvuJ1xGv7CNZEwzQP2KXChZQ/k8
hr/V3grCJ1kYCiJatMW0TlzqlzkN7gKLdl2KCPIynrhpriJ1tasVs44SINaIS4Y1rcqbqd+rhCPF
Yb063/LRTdtFHdawq8WCoZfJrWXl0jbRic9hnyjpDrRTRNmSqZfd9rM0++/jM2AsxbZn0sKp+ab5
ldLdAd6AQzCxLX4rARzhkK+rpVO5Cv4xFSzxrmj5pcEQJ5Fe5porT9sV6MQVrRxXA+WOoHnTJTni
45VClfJ8B4IzvSpgS72UBsvSwSAdphxU3KSRKeTiT6OaQQVeWz3orpJCfGfa6oWjNIo7GXQ2Gu7q
9LeqHE48IE7NpTnbFkqupIwwzIAwE6SprcczgI0ZDLe8mr0Ns9XUNK49bGkPAOaIdOGEGBLGefhz
bkFiyWuQJe3ajJF1lpSvD5+4s4cU0t+sl8vjN691H8GkhSZ1tf6fE6xTjpU/XCCLmSontTdxcDuL
Z6Ily38BB//JBAc7ydReQi+0UBWCmBVzHoUW1gPDB8GPKZjS/Y5EQkvPwl9e5QuSdwargO5mNa4F
r5u3v1Ja66npeqZV1DHTcOyBijkLxZnPe8mdFiK3TPn/F6BHbe+8H6ueHPOfsTMt0Gar9TC5lIFf
67d/W3WM1gMhi6VwXkT9YrJx7co5s1n+jVe89w0weQSvNDCmK7YToCMA2cNh4gty5ZiP4/cm5xdU
r1JQpCSEyX17Lo+3zNzHn0ArYyD8cq4thYcbvJXHE7NCBFNLRuBh6jayj1pUGsJgyAmg4qLiD0FG
Ax0lz6HTGbu7FDprmkV1Jeu1gXIb+v4acJh5ov/l30vg+ywLxwMXBslbxpZFgB4cmAQ2SMJayQI/
jZJ+24CuHNpv1pHZBOg3pAskBZvvfogaZc2uW0skyMFWEiHqR7vmgnIHdIFqoQdnXfUiSun6v0B1
BroJhvZpRWnz31GFQHw3OugfvGeqMRgYoMFWLnt3dG82z9XBfk1CL4DtCNzw7L6jl9xkWW0bNpwL
tdsgqK2b/+wFQfSkNhyyKfRv02auqd7armWP+A0DOP21QAI3mGgX+YeauYOL5Jot/3jHZ9v7ZNJQ
rVNEnRze+CCqzJDpV/n8QHYJlOgDDa8h2aOQDD549z8hyQNSsiKws48OPmkAVeMEks5BLaJ1RJYj
Qpta9ufDJtK1pwX5CcsB14joi1aancGB0tpnz9HAAA8lgFwXrUgbLwyDx0cH7WnDlIywV3TMd2kV
lsFaD7gublkcMB2VKQ4X7R9Z6DvXHUmgfTc65w5Oso/EFSO8LPZEB1sItkFTWJeVCfuKx2oFWLEK
ScFydicBmwetErgVY8zYUtVV3dKca6uRO9LyzNvRtQcT4R+6uuxW6lzwhN+doePlnf0pLV8rtuAd
1igx3TSe6aGNP6Nreum8g2oK4lxOTOxIrd5giZj6BuVlkUm0yZ3yAQr4Sl1wxxhYdoq3Lc+NbWos
4cMSEMroRyJgzixARCUtxKpD5zelsQXoFCIoreoRZ7NLR1GuP1hXLZfy1GY91R+kqL6tlhU9XcYJ
4X4ELlenmlbHXPJCLgzWU5reDFDqbqD4P2FRvYvsYl6Sghv0mRSFNcQLV1Xq9mFecGIlUa2BlYNG
TAq/IMLM+Gk/t3wDI4mub24ngAeORyPjNUaNKDzXzl5PEwhAdO7jJuaaF/j+WIEKT6ZuwH2+LhrD
9ucx8xYtoiPvxL9dPUNSni6y3DNJkzRYMbsZlUfcc/O8SDqA+a4sEUoM/P/6D/ly6Eqs47mPQbXt
mB0a7BJbTWNtUF6AeG+yVkl1TPcIzZt5Ldh1F9hNddhPzpuQg9W3cq0tx4h+sjMOpMP72f05xmMN
Gz/qICk1qGUOu3G8ycTskVJFFnufs5xU+3T6sqRKFfXmtgKD1K0DpsLgf569FNO+FDUbV8Yi00E7
HG51wOxMoChA/SBk0l0mU1PjB0rLrZSCuyd710rj83Dkd+a37nFE0fbP3uH3OOQj5L8ppMuP7OuF
r+hEzuVSyI2LKpxwRjp5ejyhZz2QNscoTIoq3X7HRcrCxEVJDZ8cZxhPGqTOvJJp0sKYt47RGAZu
OnbxZFxOFCpuhOSZr9jTqTKAUGOMUlZ2GpD1cMJO0pXmgPgvP1qvonA6hbFPTMJNsZk+4hAgpzn8
v9QQsLF6sLkLkN7lIG/vcem1ltfyM63yAO72c9ghnpT5yJJQtr5rjbz7Kf57uFPVY/BGQPEjiha8
/mm0ocD9PMl4auc8sEF5MLTymuArb+zUZVI9u70Z5xnmYHY7JKyoURTR3pi7OcF64i6mEyR2sMOS
p0xqtIMuMR1cbkcNalC70jB6GKBJXQ0msgkk/riuo1IfUdSjgWd2cRRPwe3SPvm89bwrykQcjyAb
D2dIL3FsW0MeDiAS/M6Ch81AJXw0isah9TyAIe4Z9VDknmbmU8ico6/A5d85hMhskF8c/9VN1B9s
b4GZTioYGLiCYBu5EYIub8ek2HYJoMxf7pI5CUxOnV5DrYPFO5nPTQFCUx65p2YLQ9MuW5noSTW5
/1kgf0pLMtLcB6g9U8M+2Ot+z4yU7SbFD9SxAAMoxiQ/xa9ggY65XNux5ouSq6nTA30flNjFxPTU
QHN/Q1S0gQpg8flzEI7Y0Yp47gmtPlfdtFeDg4Fc9Y8F8s8Pp+1tFn/UiMheibfr2r8xQiWKqOHk
tFX9ZruzXakUwzH4XP3vF8d2Ah+BBEKwJJ29QbgNk9ljmTN7AaJZxbg2uSx2/gpnmR0rfkrMM0Ec
EF8s9I0AUSA4BZ3BZh8XPmW79BxYhzTk1/eP55Rt9gnmWDUsGTozj6mBmi0hR18l9KHOJb5/Fix3
PlGgEX3NEjBoc8K2uPE8vwYOMT5o1Mb4Hw8V/HfxAnICIodKVArEgQ+X4lUvGt2ZM52lkaSLvQj9
3O/HJSy+hSHnUG37vaqDdLMbRl7gDN0BKLko0i5E3YiRv15cnpVGVl8hABJ6sCV2ssym+McaGB4e
Tu5NHsdWrAtuFku7AwLyxVffBKtjp8HFZnyiHQnZFoP2fvOgcc4Lj5QJQ541uCratRtdIHRDcdQQ
z7ZcELWbxIcPbs1IGSG9OdEr4ypoEPlyoyf7+2cRlZLG+lH6EG2G0H60SUHQh+LzbAKN374KypUH
RzvaCrNEyoFhKTdoYdRqBJb2tPY26ivhk2ZiuioAhnjWeGF2JHCid+6okeJD3RwuTMi6dLkvPP5x
3Gw3T5v6oE+AV2G6RMmuMfooFQadC2kau0R1dWzd4R1xBFq/i2KtiJf5/uPmVlo2M/+Lgoen0Gba
fNgZ69nBBUDZCmE8XT1KNfVRybH52Ubyi/F7IZO0OujD22hD3hKUrDJvTRyJq8DtMCGBBxCcEwDg
p99EhFVnhQW2RZBBLMhJBQHwXKK4VkjICYUbjp9ruiVYAaPGl38aRGRefqWo/r7uVi1pp60A8sfq
UV6lwiSXWNRNhY7lsY6JWl/AM3lLwKQNA+pf0tt46q3E5eVp5EWaqAtsG67VMEdH1JNf07ivkSHH
oeNneNWGCPQvCI7tvmZ4oipibUqktC+ob9WLc3D2V0fX+LA5t4TNYe8OHmP3hxTSSBWkOTrur2pE
f9Ag2trrnuKYhkLM65cHZUf/MUDipP9pB109OvXSwTRAI9cIdvcKhjtNoKySAI+WRYnPbW6ys78V
BmP0u4i1Uu6PZXm8yvG5UxjTqXrhtSVMlrFXm5th+ht6tojw6ATkf5YaZpRC2w2eTd2ovFc1ZXCd
IlLCZWsLl0KShd0xIootjAHi3N1+sNwuMF8sK/gMKuGJPOvMNmK/xHe808vojC6nr0immthRn3Cn
ZfIgWrnXllfMLqq2egVithATdEE3MDxh5PeE5lE0zKfRgNWn1Oji/xinUaDykkgbMXlKGE7fypmC
10/w+5Eow3DF9hj0pxypSeWCgp1f+CdIUiEJPh0fIkyjDBOHObClvCzl00zs0c7dz+7rUprocXqB
LZ4Ydj4iHsFIyH95HLOtBrRQ2EOyONyh7J4S/JJGxWEXT2pO5Ga8w1rXySbtZ6eK9AN3noPd7nL9
y7NVuw0CcvVo3WzpHUqTItC26l0CmmxaKrZA/mACNaL5kZMbjZcl3Fitj4LUmeo0nhmEjhCQHQsh
NX/Kg0IXNt8fo1t9lwku1tyuokbW8ObYPEu6F+thCHQPBG8STAmI7TEF2jRsc8+9V9KmjG/0dGQE
dJYCHYy8hoR1GSdMX21o1hNnEFWKxtfJUE5NxRbZoJZ1hTePyIti5lw8z0zk9fUvZsJySK9/DK1V
VojzrUJ8TgXZx67HEUC9dLXWp8MqMKjgRjzBU9f+0mlYeofNyeudwwV8dMg3GH2NyXkZnbZTKC6H
yl5K5R3rGXn6gYDD6fnCH/Jg3U+ItX2ViRb+zwbJ527xkDnslIsIG75/Z/KvlsleOjePENmXPg6B
8UkAunKyaVNTzXkQaeCXHWHEIFdHcejQfR+q7ezoii9ci8mK24GABzdEaX/5ZR46gE6px6KOmosY
pfZH8WiKoOXp8FMERFEtDANf+pvDZ9w9iJJH3uohI9e2FgszaGtXeswnp7kmYslkZTa3EKG2eewy
YAM4Jsr4dAsb5zS8Rz8tzC7kEocgldDFWLKikYstwJNKZGHZ9ZQQZn6lCGrSjuSzMUGgwTwzzUpr
Eaf4PqiHLsNz9Gq19sUQBSw6O7wyHqwZyFVnpEbBBqPFwp5DMf80fbKxDRA+5cTCBFLxPuY6V3lT
MSeEbO0OcYR+2uhp1mYqTX7YMyQNgWyN4H3utYxaXWEq6utcOYsvCUV3CXltbxPPTvOxpCL+GURb
an6hnAHBvtWt+3zweXI9mzAQDX4nCAkOWxxJVuu8hTmo/xlpYDOWpsONc8oU8kag9XIdEuSBP/rZ
Cjvu0xUY1/tcI7aRe3gaDlM1eJ3OhHdXaiWBzkXvsDcy1wpBCnzCM2KDuHQFT1t1uqsTy6mKyzie
IdVwyLeBFj48sD79PDTwJTX5vkmScweCkxFpsBuNRwot/eZ3TnIMZFDFKPF6nmyHc0z8eHeEHZUn
fW+SDXOFcOw5kUZrCDK6ytMhWkj7LqHII6CZ6hQ43wAhp4EJHK6hQbl8u7hF4tqm19WeG8nzamDe
9adJj/nh91yqU0Z+Yw2GWqpbGWWTePEpkvfGhXVKjGS2DXj2pj8ln2v/+HKXplh2ntGWj4iMq9nm
TEbUmdCLU1VQpBh25RUZCKL+E3TWY/drBbIp31kxP2L5uw2IcAeMomauaW0wNYItxwBg69L8BVhR
chmz2BDnSTkfwIyZYpbOvZJn4tyNSs+TNzabBsOOJc3kaxfZOsMT1OySCmYxkx28Pb2aDNY73wT5
Qs8hgOD/SpPsT6ktA6tGp1GaQaHUl3e6d4MPOtu16xHXDx56uWBZTlWiVhzSrASLvSS1otkfNs1d
amKB80axmrnftzX9wZ9w9i2H7ROVJVdLfYYEpeYrJvzcFEWfpzqiAPSdw4E36lCoPxe33XmO1Dga
3/XlD4hZHk3JR3Zy25Esq890ghC9aWBlcp65WctybEXKwx9leGoafiz3HJ8kSAweBSDMVgoQujAd
/3AehILgVQ5oNwaOXMw4Vibqk3/QYvS107zti2O3gim1adnUk+HL1Ax55PbMXI9nzHquYKK9SX8x
0Qd9AWWErZlHIiwrLBYYNrVe0bFaICldPG8ALXTvEzCE/I9/QuAA8I3dSJnD4fLIH1eMlElpNN+L
q6+J3yPkHLVmVnHLqjnFL3C9rmOhNT+8jsOSKpXJggIop0njJWwlYjFRZSl/eQIc3qlgxQOEtWz7
KS7c3f8W6PnFVSjgqzAxcEZwNXfA3iQcwymiKX8MaNhkk7oXudCgxIv3v2jckAI43luvIa41CyFG
5DsAgWDoq+Pi9i5nsN9gHYlzWPuRuQfZCX/d8/iGq/e8xNz0T2Xx8x6Eh5eKm1nhwN66E1b3SZ2i
eqn7AzkhnJxwRBm/iA7gZv+m9tZrXNZvQ2iH6KQfmvKRdm8QnLTHJo2p4DaKV2i76Pq0Y5YD0jEN
0LMj+aAecFLd/94I3HW8qt78F2bV4btyfwRKZXGr/zJm2t6g2NzcC9ipSKSsyJpQHKHEoI88Su2W
nvSxfdjYGMhGT2UzdhlMtAIGWIk543lw2YWtO97km0em4hfEuBdcEFtNOLZJGcN2sY0o+FVAaPwx
xqfl7pkMMOoH0EhNSoUcJE3N1gYbA5yrFfDxVKdr2uD+p4iW27e/dRV53RtdVb4aBE+p6xciL9+O
DGvjhYPADWYqfaTYy/yw3/00YCVEkLRR1DtlmdKTJLfenJxD23JoHF++M8xxooaa2kxOmh7ixZFe
/gLfPcx7400KRTZGWciYxwVhQvVn8brCNlINbfomMuaWDC2yh+9TTDyMNvXi1nHd61rtMC09/aNG
RyAjrrT8c95wHs7TxEYfdwOOse9bT6LUUs09B1mL5HOlVF4kw3u8JR2YSgukwleUK1A1opyR9MI8
jsh2F5mVAP8qF7P2bA8psoWdDkANk7LNg9cot1O/UaSKAXGY9TYWWf1NeSOdmuMJDM1NPTNacWcz
rj7I8f5M7HrQMZwLKgDPqyCHCQPegYBptCY6LqVEzm9ZT2nswPz31IsU4I7yolQgEtagbNvesxsD
e6TvYdNZOShM0txsDCw9R9qDBWmGX/29Ph0n4a9xlnxd/luNLNQvxeYL5o5Kh1KFRW33FARVppmA
XfmLMSITaGgCAFCrVRBZPU4P9RcwNE0tBB53H0cAc2dexktU7bQsjYVs6WR/T02cZfc0YjnYkwUg
SyVClti0s0hsISeQs7xI9TWdENUqlkokZLWLc2uFPwGA+l3Y/PMa9UPnHwVLHDZo4JNti9W/WjfG
kKe3kqLT9YW70A82QJ92ZHaE9HvkLFXDe1bPGEp+sQbmSHmd+1L1Z3DRMJruN5QXzMC/+klX/qrN
I6Sg5rqTYWLtb1Q2Wk51WrUo0rp7znJ7g2rE7XzOB/P8q2Dk8FlTIG5muhCGOs6sBZtc/dB5349f
zuvPdyMSa8vhxmY6uA44Ec9QWTQhGxCJJaI+0c/YAYi4Qh7lPSPcolMskuRrZRc2MC4NJK1IpjTF
igGnBeDOL2GL3TLKZdJCI2i5iCvSmloBNlmLpprEzR6Y1VePRO0BerPm2x/hWTdAMdtO0w5hfuY1
hADbcgV6sg09hbarihgOZVZ/6pNhIKouhLM+Lx1O3gGHwsTGXQevqFP/la5/Zi3MwHRiZ6EptnIx
KmU8TDeVzfBEuHqavJtgu6dqHuGOndDgb2spxY0EqONNtRx6MRcBf1q/boNoVtNHCCkeDL/E1L9m
nP5g//EySiDls5uxp+jXOcTzg08GBnTagYRLkEwJDfqSlvHuWQqK7DzdPNJB0wtD7L6PBfG5v6kE
vDwW+CQV3mmwZDgM8dZ8rkNkQjqmDvhB93cvKd6be/tqY6KJ9I06lskoyroE3Btl0V1+t3e33oDB
QgZ9hkKftj9+LQzXqxArg00E7v/lH+GydzqKdaq6SyKmQJ/cNexHkbUUPCkKy3fF5dEiHm4Yo8y9
9GqGMvTUmpVhvhWpsfmO4KIsi0zLMNpyKo2uDOPegc5GazPlI02FuCJ7MXnmq//vIFU3oaFDPEb0
QK42zohRhOH+5grBdWrbayreBYTEssT/Zmk3UTo3NBfbol1x5emGM5VZimI8ZHDYWFaSsV4XTkaZ
9Uo8D6FpAeFMRigw40F0mUYZD5LAhLAwysOJM5U/BHwvmo2XsfYTkEk5NErs4jX3wjfZHnfROb2W
wkJfO3tF+vUvAEjxoHiqAdbNSfzgvMPUzKiXRFa4i2MaG7O1g2GjDj0Y29eF5i3+nmOKqLsEUkhb
KUsdcvTl2B/X/qrid++ZkhbG0b877T/1AZ+9LZCLWBir+SyhF8USUI/0MQETEdVDvKmh4GKXl3Og
SpsCxYH+J3DAPDvOJimbUQVOvo4pRoEvjbQdWiIuvVf/zOXmxmcqxpRL/Ta+9xGLr2cnuAHnbATT
wv0MaRYbpGd7u3qwulGxpVeYlrlyy7w9mXZh4MRgEc98RNMxTIgsctdjdDURhkpA2oswrTTgxmA4
CfxcQs8zumAg+0Al11CI1zx6J+NbdoMX5jLLfZn2SZGGEHVynw7ifWaryUM3LvsP6rNKSugXN0P8
+wQDV2sz0mXs8ryShbRMycFa0qh96G4wyaC+tLdjWFKd5mHbNJ/qdCbkT2/myVtSG5TdABVidii5
6fHBA4bhQf+Wt9ToE4XFCU8y2Tx8cTtuwhsS82Y8PsWDVuW2JBprN0zGL4YK52SLaXNpqzmMZFPw
RZ7n9QJ2AQnpDC02dIIo5lb4bAe6wlOpjdkew3S/cEMPe0sr7mOYZ8pGLldwMAXBd/1dxbVtjYRp
6PtunOEOHLdN88cABPa3LuUa3ChE2lPFPQPY+hQbmNwZBKmiLWw18EZqi2v0T+6kQjQ2vSVvVOej
mV3NR2r/9kGPg0QSKP/0ptryr6NC+tDqVFFx8sjvjCkAsDxpa28f+vRBPUlLzWr4YP3qJ8XKJjt8
W1Jp02Zk0AGdSgORrFd4nLanWtrRpb2U2X7iZu4dohEymq4P6Dzw7ezBqnKKi0rGcsVeAr4PKMMa
SvQUNimbRrKXVOZ0haXhNEyMcs+WW1WyOvDx7tnezbIcc3IXI3Mi1fnAqVVFcV9BXKtPKLrC8QTi
YktJaivx9PEtlgjNjEYzANNXJKD5M674mm1T/3T10ntuZH3BKaFcvdenpKh7Qqw/8BqE7XKj7UWV
y6lLcqQux+18KrRW/mzlSLx9IIQers2G8WckTK867VKBA+dwkzIguSihbR494I2hw6s3Ow10hmX6
+YISG44x0EGw7bsZM2CKrLicxOVnVpc2C49MO4tRM6Y/8aEDPXA9w5MzhgqpDQSJivp4mMQl3zzr
33WgDMnCcA+BHo+bDcOjsmfJkBz6/HD7SJG2MAMAH1xWamplx/7AhCJcm3r3wK4IRV9sEKuxYra7
YCtxQgaYEUdccn0JOxKhnxDD5I0oXKZ1qMg868InKARI5yStptBtjMYnSG1Ng7ix7CGh8o0CVjb2
8RM4GyppGiFwPEo0RcUcAx7GDA/e8kyuSmTzcfwIoccfWP/0dUNrVN5l0CsrxW5j6Vd3FmslJ6yp
wk3PcyjpPjSlUhoIYcBd1scooCEi4fTloKPolLByLzNaPm+HGwI36UTVIh3rICaQt+ysdEdeKtoA
TbDJN00KjRf+3mrbd3kar91M5yII09R2qeCsDYCDFVMuh3W2QE/4Fsp+TBSQWR6/KptVsHRtM5MA
pCTn+ON9Mtsc+nfvlQ58ErGJST9eJ2mMEr6q138fbjlRQ9OyqhBxZ2PL+/qm+idrQs1hlzu/7Pqg
IrWNybRGel1fXOL8VAu2FcSchDoQt4manQsLMLktIimcjhEkbNsziLkZDLl3keD9a7Y+ANNjNr7q
Pbtw+DAh8fWSEogq9cAV2iDCYzPDoyPXTN8c1OGKW+hYAK3kTg9E1t4rTFox8ZaPIVJdcsWz4rmd
oEpobv5rKM5Jxqq/NQWxbxldggictP0Efoc94UhZX3Wu0b4RlyNrxxcyCVJR1xMMeBLu6k25lHNj
4NrysuMW6DZ9df6VOJTmZMf9fiXfwge9JSYGZ2YMSsxoDfwr3lWK1wgkvffFTAXqPyYmoKU5lnLN
O67taDgd3wGhTcU5ZAiGIGQloG2A7cP5FBv6g44jalDGBZBTHDbQJWWMAu+hYHfH05yLNExvUS7w
g4AKMU4/OA2vHcbzBHZZRbUl7iK5lsQ5NxK3RoGmJOA1dpt8E0mFMSLcy1lEMEsDf+zxlOnmMg0w
I2imJZ38PW2ojhfFB1Dl1Oa5mHdCvz4P7+KVKXW6gPoPPtnWAtSXvf5OgAIDC/4Oc9aA85SAQt8n
Gr+NUwuWC+45czX2zafehM66sOVbBqZwlrF5aYStAnbOxuXIowYUyWUc+uRoQqZhF5FDbbdHCDe7
q0LYQTnPfJiKtBf8VJONhB4ohsVuhkgFDqvhgyzRn1xzXbuouHdvpwyqWlrCHMDIf+uXXVWmwHMn
LUg7jjRZE0TD8k6IafaQJSU0s4DbZGeXWAUpMkcedcmgcYZLXO3xSHKaiMSmH5XWUYLQ7BxPRHYI
avokJmzBs9yg2Owi56lAVZTvAZ2RhWjjkNQsN0VNeZt1WRL1PQmRNNugCIoB2vNDs3fu8AfM0A6N
nPvre0q3rr6x+cEe2mLbg9vmR//tRGWBY4Eyi2OsVYr8cKaXufcDbBycdKgbOqnCEHsEfF19Dm2T
kXRKMZlkPwQdTgpaqnbKb+FXBdEvy3gNARQuTuBo9Usf8g5uZQwENgaXJyZEEnDWkxmtqOV3bo82
LMwAZ0sbLgqfVaEkEERycuwiLU1KA7ZF5IZB87SJHq68Y0GHo6LvMxx0TD9WZvBkSUxgX9H2xhlN
Nkd4ue4x/plBKFhv1iWuFDe9lqqbBVWrDkwygXgcDK2/dbINvlOdeCQZoUwqn4QA9vvaFqCJOq+G
gSOOAieYGoelVbz/AYUFswQ5JtWuP6+erEqweFYlQUHJRoUAITQ+83uprL9E3dBO2OqY0jcNX29G
5lc+ptbcqT1Rq7Cypmt0cZmzHQLV/nSBNisgIGgAWdtlbVRNn9jjf+5vz9qUlfd7dmnysjyljVbH
bOLNH1Ot911x13vfImdPh8baHIiU0YOnMn7VcwErS4NVapKJhW1SIsCq3o2f2NV9+KUSSgc+ph9+
e969vFqhEZ7OmCGD5sPMCaOYMUkWpBcto2vQmd63FLI+enBcQ7RxCmVKxFcATCG+ywifX3RavfDu
+i2eDCxclzqmumlbbuJmS06s0Ql1vf13Frbrt+hy06WpBK8YZkerN55GtvGDoAPiNSSAQO+ze7G4
K55Y2R3+RbFRLjE9H4Wc+0xcXddtk5zZtAjll73V4FRCXAcJEhAScQ/sHygntk8/4XDURUiFtwXd
Rh+KqaJenNpKtyukMiNGcQ27S7T/HD32P3dNjerugBfkhQgY12cRDCK2Ft6sm2RbvBy7bmlzkSoh
kYQJww/0COX9w6FXEmN/VAayQYRXANXV59IF3LwaCm8kmubDCnsQWsi5UHrb5mUsHLgDW0WLo7cx
/y0p3+8v8RQ9iET0n7qtfrCCyGHtT8HkLU58I1QqNxqrFHL7hbA0FFoTT5M29oBX02f4AAyoFN+9
N97IOX+hKi5kGY+PARn7kyRzsU5h1xksQyFKGl2Gccd55uCn8qYgoj8Mkjb27waKGD7xAyaPpQHw
/X2gWEoZsFyjqcaoWRYCK05PF+J6vKLtRlp1hMtskFIQHUI9+Rk0Mnst9qFInwNGIHqvUzZLU9bM
OrlkZd1OTPTg1uOS+fxNDzIr3Y085uheSQrp/Odw/D64YpSIYnXdZomRU4zgNso05Jb9IcnAikH4
0TncBGLlY5N2c82p/dq2ES5SfSxjuYi7vJxDOUFvat5EUfa2XMphqX6o7qkfmqvyPCL14duCRw+Z
99ab1fvV+v9I1Ivot+SSpL1ATIXSxaJQi+QMR2+w9wxDV2DN6gMTxJKMXqNf3segLe4blwOuzsh7
DZ1CXMVTl55UCFRk7QmrS5RZSbuYJgygjMf4X204MT5PmdjAns0N8bzQYS3C/+QYRC3I055/MoTr
GFUF9dHWM/CIQwgpqVgSzFl6+W835nb2Hu5QzhyA7lZMdJwmzcqrn9rE2cEaBGgF8LAFA1F9kIiN
hO2jVT8deCGB3ex/LKDFe+bbYBqhxby7i99MoXDHyX9yOPuA3LjTUfhjnDNP6r+5CXwwjwIuJeBj
QXLOuBaSY/XwrIQB+cOJ7Gid0LxlTCpVE3rz9V8JZm2XqhUre/ph52eKJkRbzkYlO0/YRjm2SScu
fIwiBvIwf9mmmo5xS9jCczKv+OxmnzGcUiVKAVgE4R51E0//dIqIuyVIxfNaNY3ofNFGMM7xq5+o
R1MJ1ndDA+6oCnEJZFsudljc47JidGrsSIBNlI7WXpkSZJCP6KdcwPVSQrlHmVHkB4xJKvhIv7o+
DhdzaEFzyLp+pVkddFWacL66pzgixzDZEljCMjxXUYBomghLY2CwQqD1TvQCkNnHDb2TmUScH7ji
TM5IliUEzL2KcfLooFSFlrNXi1Js7XyMEX46qJiP0J94q9YJlOsmBNA5VTB159WlgYlTmON6suRe
TZyyruFNCeJt6iUfrNbD8FsuuwhR0TDcvaHKtQgLHJvzdLWaHhk5P2ai5CKYisc/Yv8wgIf0Oj79
1ONdCjHB0WgmOriewNaZS1PcdU7Z6aC5YGnU4g6gQ5yHYMsxQXq6a4CKOuElgBPfYBt0t2ACktn0
13d2dgRm+0pURuz7Z0Xv5T2Qp5mMyOkyYXTZ9DGAWxDOggz/JWE60zDS3CjewRK0bsnvn3G5Rcn4
INXPQR08aSJyXKoz73btHvdR5kFMquOicVG/l/eoZgbyKWmAYp4UeH6YSVnTgpDQvhjVAH+GsVVR
WvfPyv61Pppf+FqLgms64TPwIkQ79Kzt7QFdNYpKvudK4cKQ8rdzIkCmXGt7xMohdBlNc+/rgvQ+
aIcYcmJkce1kCGBGVfDcMt1QvZDvGI40mzEskwUE4SB6R/SxCUnI4ttlc2hhHyYcxntgEHJO08e0
Ne6Hx5hrzUUC9kGxNNCOb1FCv3J+AM8nsbiWAO6JnWS2IS0uSxlOFkEzaWUWyt8LezD0o6WXKbeR
nhoDQszKZFrcKGcqEdlY0uZcIGx/VQFdAXVlaS1L4R2DGfX/CETrM1Q9oGdu86PapUIHjd/i9Ujt
FEotxrbpQFhxwFkKKmwcIgcRahy09SdfO1w/twfvFbswOBRiVvtM01Uk0N/Vpkf1zENuijpDLq2e
/YALhbAXE02Ud2+Pp8Yq7Wt2BmFcGcjz8HkTxyadesESDOJtykYjVt9oMTwnQti5lNWH+FA87d0M
ZRTi3HJ5EBzO2BdUkoHNjpcl1C2vjJ9Z3IFnyZU7z7zEQqu2HgnCkHi7an8tYnF3Xc+oJr8nhHZ6
I6tO0vFSj9WwEmzeyDpIYeInvlK3DU7gCUKCT6MgK5WVEKefOiulJR5eE303Vq7PUPS36CcXD9+e
c1c2LRPYS6py3SLViYg5zMsfCaMWZUCujevWoSuE5ee4k9FAlf66DweL1aRPPcsivjmD8svUJv9h
aOC9GAfY01BojLb+6y3cBZH5Ex0SF3fw2kb19+J0JJ6Duvwp3FUM5sR8Y+/N9YoCAiO6mfSsAfjD
ztFShYblv9jAgvSev96bIvflSYg8WxrKt27mitzbDq+GE4dLlydMDiqLcxiQS3MhcuRSBDTGrC07
MQI05OiWyIjhww0MjRJ5fLwU3d9VSmZjlqKSR3tkiclSTPfkPHFH/xxqp2v5C9pyy2LiIi1nQ1H4
LoAvWwEP4CwrxLy+PgGfmUp8l1WeY2Vvhmlw3ZZ+kYe+aFzW9FtLBj9EOeryk/Soz410GcnS22tx
tjnjJIlfzrgG5MlV1VBaK/hQw6m/7vtEXjiUf765XK/ibkg2Ps/dFjKZBIHEd0DVwI7YNRtoRhJW
wDecWFTfsO6lzlvq8qCl0wDWzTCh8YffzrJqdefffdbrpA7trWql10ai1WHUJZDiu1yoUEY0nbDM
aXIqkJUpJXKYwy3lOjo/BsU6gBaLJdQWdLs4M5W4aNHPZgvV7gfwHEb8yGcHa7fRme6hur6FqT4a
hfS1gOXFOds3GogcAi8SoaoyRBdDWI0Vfd31bqnFIP/6ITNfQgZUyh+zj9v6sEDYdWux/Jf9rCY5
+1a3rBo/fuuofVUSrxQrE5ZvSJ6WJksqwfIQNLgfTopfgRVwuImKXgwD/3F6BhY/ZJhAP+EMSYxn
xFvnaOXn0KQV5Nnwpj/Tad2PtZqGpGZBcPckWo8BOfmbs63fHHDkDaPYpvSuKVXtHGRH4gAUlYhK
Fdo/uYG8ga1DOQFnHiIGwkWY7e/7gib1gb8ifn1yukdv40vY8F9T4z4KlL/1rPt/jqDu0E60YgiO
j54iY3V3Dy+s/LgijRsIhpwtMVYgeskZ+1ZRo6cup3ERzF3S+qllhZZtICjDbXQPhAQQ0fw8kY/2
VRLv6N/cWS3RKxCEdU+jR+Moy84HCHiV+WQ+yWGKbP0dgsbC+ThhBa0LpPySgz1f3BucYZ/tk4Y6
ZsG4F5dSK8u49pWd2446ZD+lkbRFn+sVTKqA7So9n7zY+mirFQk1eH9okiqaXMJL5a9BY2pz3bSx
bhqoEHUt5tK58GQKL8mxhy4hnRiwGyXefeUcnS6afvjuP+k+d1Jb0LiDPz38vHJtBnDn1ZKRDJJY
Jkf1SEmtX04AABDHGiYDj657wKoshkYcXMvI5zvYfmEkFfFrTI/X/OenNXcAlcsK+XZGDsdaGX4Q
rPjmJsFqHZHu15YDShyU6Z0kHyzDqkvE5oqwMNAEAhkosnmMP31Ief3G3DBTgO3XesgdzceOO0Sy
2mnCzN0Qur2cy9LiGHYEAknh2MOGg7YQhGtvFJ0H3lbtWd392q99+33wUcW2CQ5Nq54LQK9nkqk+
Q5AmXMFFxoU07zoj1ghfKnj6y2fqc7S9U5JdOa3uS14gg36ZaEsgduNmcZKpA+Q70yi6NIxr2+YJ
cH46wDxGAk2bvnXiUX9cc4KfnbzLfH2AUEz6rXoFWJpIeSVi9Ir0JXcugZOFAsnpAaQzKE1GQ0Su
7MWvRBfSmObARx+zxBiHcRIiSVA6hv7NmVp3FXaFXq5+nG9P9hpNIIVpnVt+RUOG/ZgCE2MmiBKz
1zSc7Ni5TNNAgldkkz88fE19w2ltIKXiQAg6ccZ5vdBugZpWgnr+lqCU/sYsFjkS9hibntrhpQUB
/MleSJm11M9so/m04g/QJ12Qt2tPKdjfI4dtlQYc1aCfVK5JrXXO7RGLFHVko1mbLndmA2cWuhIg
Jnta7q2/u4hNL0JY8kntsgSvzzRy04YQDyEyI+G6jxEqMB+EQo7XiR5YbMRn1Zrv5yg42GE/V0kW
ah02LzkEhGlXAN4en7gReYhV/x3bgD2laxnKK4jVvnFXH9jAkP+gV2L7S4aIoDWJvVccL5e2gjtm
RT+Cgp9/50uEnkWKbZWloTDG3kz9sEsiBKLlrDTtqL4ep5rBPzXoLlYwc1JpPM6g3Ix+K1srswHB
CRFkQNQK1kLznwqtraxpWWC25I2iP+mvBYjh33P7Fg/Rf9E/sfFzJddEZAjfu0fGcojlukNc7IeO
7saXEHqAKfDMnU+aIYZO32BtGKF9qYoKMLHrVTUsay5GAUYMIckRUMcheGqYi+SkUhKXkUK2sYoA
bwml58bWE4TuCQzEx/HTPUQeuQbnsEtIheTM7q10aDKkbFXxYvBXrolVAOjDY407vX4A95EkL4pu
sKjKnRRALrOb3C7atP3ug8BeXTMB2WDJcyzobdY09BRgDHJ8T3IzhVdBHlI8bUdE5EUjP72Gl/os
/CMH/0/yYcmWjuPJC+BFEsVBqI3tfX0pSfJWgfnfIytSZ08B7KgwJtneJVpK3a/NWlYNd18HLqO8
8CK2duSbHocO4iUqBHbFyL3uqmhtsGqMhSVzXYi6SZx3
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
