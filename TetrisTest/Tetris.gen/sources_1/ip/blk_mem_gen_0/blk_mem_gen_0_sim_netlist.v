// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Sat Jan 15 13:31:35 2022
// Host        : YNB running 64-bit Arch Linux
// Command     : write_verilog -force -mode funcsim -rename_top blk_mem_gen_0 -prefix
//               blk_mem_gen_0_ blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
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
  blk_mem_gen_0_blk_mem_gen_v8_4_4 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 21232)
`pragma protect data_block
F3uIrjkJ5QsPeoZ+7ULlHvkbAAahcxB2uOc/HRV7v84Xx2CfTY5Gz1oIESSCxiQAzz76FnLQ6ols
zbPf0qRXGVVRqU9++NW3R8CoTW54bOhJKNJweyHU8Qhwqfj5Y+gqwN1LAipoWTBVMRD0vWPZgUw5
nd4nzhdw1nnWoQi8AyoPCWpww+OzGzDu4CAd1jJFgBm/0PMMIZpwgZ8JvDqg+XUs2uE4noxRt5Xs
GtUc0iLZcuk9l1x+RoMThav2kpHbQliQ2ARXfaY+R3aAeDnrSZnGc1Q8dG34Cwr5vh17gr08qIf1
nlnZtPzZbf73qNxacG3BboJkDHvE8upxEqMsGPOrLdvxqXvbIgCCzme2U/id5DWlA9hdO1nJhSk3
jOc5d/V5NImMD0bEubcCjHw2Ab7nLyQ4lZt4ArW76S0fPFNNpOyUz1oNxmg0YrgEX4zb5RL8Qb3n
3RO0iM4jb+aH23BC7Yr4ecO3MuealK9qXOpbCBroI9C8dIuCo7Ffuga7wC5br5H7gCwdLdy5kJnE
5lb5+BAXzOQAogUg+/KZ+9qYfktofEenDTMm8+Nf7R15gQhjm0BTFAln406iC62I2f4R5JM/sUsj
j4kV+FFlYiXITSzA97XZpjMMlD479K7mJYiDN8/gIj7uJ1EMaWvYkUF4t2C2HDiCyXE8G6VfpeMa
uLB2WhM3nuAc6QapNzKqLPrBYBH47b+VjuNoAk4P67VOrPNOXdn3Q1SoBjnHxbQsFJmCgC0K+Ex8
GNmUNioQBgcdJKKwUcd0X1nC5MI7qGjpDZcfJrErTx+6tSUna3FJbOib2NOQPhpiiuQyaLUBIn/m
SH6SgZgOM+KE2GwG+KV6fTh0eNf19XW66KUYPBvzFBZPZNsUVG9xdERLb1cUQArQ+HQt6erghS48
dd7jzvA2CJ962OjhB3IvQ3iToekM+k6tPl9eZzMcXqRNgudR96VBl/gdyvICG8E0UYDM6bncTzvV
0vOa90tqXbYz4lxlgEBE+bBUiKFI+iA22Cmm6ujWmdZjWHZ1UFFbdS21rw3JTdAESRZQNlJnu70M
dktOiWKyEx/92CntfnyxVfLC/7tXRR71qruv7aiXDTt9lkJzlxUaSxr+AAotJr+V+4aLeBgOvcjz
TK9IqKkKkPvdH4k8o339tEqq+53uq6eRTXOjNoJR2vnc4dX2bRGB0UzhnWIAUjHsQzuAgSom84gJ
Ml25UFUCyuHUp4lK5KH/QISQ5QIIvtwgM4DKPirSgj+vEPAk0VVfsFzUJYewnymJc9iVe/yRefS2
LBJfFNk8cOGx0qsX+zMWJGjA0OscIHmkT+DAgctO+pNeMvfYaIewiEwC2ixwV4AM/JF2ZewduTZX
pv5yJf7cMMpk/Ft6+Lt61B4F1Ooyzw1FaXx5SczRPJtpUA6Oqlls43Wn9Vp3lfj1o45IwTo1Mc5Q
TfncS8IXwOidZp/pxEq3NbluJtuFIuKkNJHVSBqYKfLgquas271RNImdwHvMNMGVR56k3q+ISEIp
e64l0Lv0dV74pHmEBvc2SvhkwadctrSlghKSXfQB6hECZjtRrFACfSBDFCiHTyFpe3KDQkny37+T
1cQR1QDV7Wx6dnDBuTBDkO3oKC4+OmnLh0cLblg29WKXhGpaQa8dDandhCyy67/b49p5hW/J8aWE
lKViXw9T9OQQhLkwmxv4saBDXjAePQNy/OPRyBpnid3gk3fLI0YXjUqcbRJerVxsJHfyGCA7gfZV
QycRQ1HlLP3cRSIeYuETeU4U7se3CSFQnrQQ3rinM2hhLLUr+RpspHWNkd9e4Ykn+5LGVGfAb/2Z
mRmnCNfPBwMFISpugeXkSBs9/GJ0GZfxP34LklMm1/8UyYC6StGUM+PZbLCv/WI959me8kMPXPiH
XvDHC8VcAVKwtOk2XgcPle+QT4cbr9Wlj0kwYnAavn3VCU8r+hXIRfF3jaOjywSHXQf/MUR6EDwE
RwOpaS+XHnfSWQeOLa2vd+cHBkWKIb55qzXRO45KExzjzcbxs2x37sLW9ijMjC+8OlsMGfaI9p43
TWNMV3Sy8i39oiht1qAs6Mey4IZpMwa8o6w86FWkIKCepKoPVEulIIGyMPrb2U9ncIp1RJWdVSto
8i87iDaH+5FhmeFrQReLGG03pvgUUc8rlzWJxKTGCFUUZK3SE+sNEBVYi3cQLaJSS8+elYcWiaO9
aitVGA8PWoSsxLJ4aMQ/Fewts3YnMd/WnsbhMhnd2ggUlgPmyX5mQCCr3MZGfvY3UTMsFZK8b/qx
Jx1tkYT6bYe5EP8F/11rvLttUDhV53X4AbwbdLpPiMxa5oVt+UjhBjfYLUzmBf7l57OYeZPuwPR8
KSoIjDt6e+j6a9x3dU+sLLuYZozvSXCfRVAbmTgf/Z7Q7EAc8DfWOeb3E8exfVEcTiOb/Hpjg9eR
LI9YHqwxOY+428W4mOGw+QQie17waOaET3nsoz9fKngEKT6ov+Ajpsehctx/NcqO74LNOHoHkFgb
yFdu9lqItMr/LYh3irsX5qJ4MBBd6bZGaG1uq/qXXh8WoBLdX5SaQZvHLkSpYcgD0S8ilX7WMwdp
YF2kDgFYXJfL3N0ermI5Y/yUrTyXlYgwUGKkE9UVdEAL7plvolVbcXQkHFigucvAB6RKGEWDm0Wn
SCoCUvGornlnHKVFd3pMEJyxb3H+kjKf18RnjQSN14k/4SPRFshZxwnGcTdET9MvFIe6wOTeTX6c
rnd/EfCMo+sJH3VewlKV2c8Y/r93+Z3z/O5U2sz5KSwlJiZmCwHkZS7kc4/Qqo7k6H1LclpFygCQ
EpIIYiSpYiKaqLoPiH3oTQQtFweH+vNDyyd1K+XObVUyUYcSiH29iFcLS6exiv05aNoRrCwlaHOT
ZZaDkpjlNhEerb/cwT98FMWZl+iL4DiAW9hvnDVGJqCuh5VRSHYqBl4DvedcIUm0jZ5aEIIrtdpv
H3aAzl3XJT5pi5wPil82hJef6uoGKM9dbm/ZgqOHS4vH5YgZFhRyKegAqN+zYjQSvQqnO5p1w6Xp
XWVHhvZOImCVZEex7x25yl2T5ohreJK6+rcVMTudDIkcR8xvtSUOCefxW410KRfEblzMFuwzThEC
C7az9xlfI7u1r8320h0IvqjDMlT6KwTeTaDeG3qes4MEKySZXxIug4sktma0iG8LBs8SUibVQVTQ
roobsDZjuNYBMreVIKhFCuRWfMpqye0z1vTnp8Xsq+QicPsiCmajZZBTc29FR/J/fMEcTuHaU8xJ
b25Rb40kpUya49UzdshcEE2d0wm4fn72EkzEA4/X64sSs5hz7Ss8PJNpe8/h/L9RM2NC8bU85UN1
OW2IW9eaF656n34CnnVf5hJli0irALTrZQuOfT4QT9Dr833SeknVpEEzP/eDRViQ/4alMm50QDo/
NaObGFW7UyAiZU7tbp0+1qc7QK7FN2277VAXVGl/TcA4MRSNEL4bHwvUp0gyxK9+IOKsCf2WMPxR
2/vihRC9Tze3l7kUqX0f3jeE9bD9jaBQ4JdybLCiif96ey5X3DJI0Ag6/VqttMSQcweWSZWgJEAc
TEBbFcTSqCHdGMNNSvNepq8TpCsaYA0/yk5C2oAYXQJjsqppgXUV09yuajNXaUeL8X+MJHywrY+r
Iq3ZDIFJiOK5dOEl2fQLcOdID4To3XnFqYsFetsurRC55fr+lrjPqnBz0XiSH9DstWkAtBXxaYQn
sJi+tS1lXRuBGBJJniunRbdNWiDMjMgSsutL741t3gfJ7UJZJaxnWOa/dgBIJvfyRC9FeamRalX5
DvopNE6+cQA4Z8nvyl5IdfAE/7ug40838dioCAE0E0sf3aTS/co9hca3wLdHkudBc1Wy61rxgoLo
I1BcOMWCBEWy4ULJzl+1kRo9nZWRCFULCtdGHHL3FfzsDLkmav1pVZhvr3rRIgbUVcXPjL41g4pR
p+k4mpcpB11X2OT5+x8iGCuepFl3V/tBRyqUSHXaBOX/42q8pCm63Jj+ugFB8ULXyZhYPAhYmOmV
HR+M6MVrQT+ro+TFNA52PB0x4UHF+XhM24MID+L449LCzqm8coIK6USpP+VdzsEhiQCfiVxOYW9R
cuw1PjrFOGMgo8901CKi274YHDCOodCR59rXeVogm4Wz77lto3aAjAaxX0zX1yr5tmyTTjfP1SAW
OUsgEVe9DPbZ6pFdmTkgPWUR4MD8e/rXH5z1Rqu0qX0s1EipOvqPWcuktGFau4SRH6sZTs91+D+C
dy7x/5v490a5eaEZEj0B4Dadwm6notmfnDU+/ApAopiJb8L8q+3lV/90TmRNo2yUbPmtG1jRvX+r
ERcduMTvdbCXI0hmwIVOpiKY/gBY5T1doIEOKMWnZcjV/PcAsn5Y5EO94oExwWptsHqrpy9vfSHW
g156s9FaBIFe+zqK+4GqX4fYVztqxLfhaqKDKDuxfPCqZLue1E9FpnTCuu+KiQa7iSiPYGVIApT/
ysmUcBeB8erNEmDYyDLXmjnRNbb+iYijdqEowJdBmldnHAH49N+eHI3jTt0DYQA0y7MLU0R5Wg0a
wLXsps1eTJNylhi3snYwf5GSXa3poHVpmCueAHUShHn9+mkktsBRoEoy3Dgb2re8GyVpr4Mq8WQT
DR8LlrgjmjyTKGNdZp99/yu0EjhEzW/bVfgZXdyq56tj16l3tI/q9vwPrqXZbBbs4tdoXRxQ+B8f
XbSw85VMh1EdmIxUdhx7UXDJh8xN4hLo49Q4JRUQ1sqajbcKkep3jzYGO/kwvcy70DJduQRTRISl
lzYvIXra9rAK8jzKvJiMOmlFagHBKp5iaPNcYhp6d5FeD/DXYoXsiTUM2Lcl0QHgkn3OnetTnKZI
UPctT6blKhZsUdWnR7wCcpmlSzMg+C69QF72UYi+Q5C5GBpl5bGGjgESA21VspvWAWAg2a6Zscnk
TrSwK+6QDnZB9BBendph+6BpsxpGNlhbKEKBOLNfJDsApvquvH+ZckeaEI8ylhyGggHwzNQMd/kG
TEfw1ArGZOVOeuV0/ajBZEnrnQTPHamORvQisaS+a/LjiPGMoe6HJ/WNpZ+DprJd9yg4aJmOk86n
/z3MOAXPEALqCQv0gBkPpzcgUnBv0OhbEGjXywmJBK2lRMCGWeWihzaKH8dmvyPwCDSGPB1VnFHd
a67tS8gq7vjfe0WTG36eEwO/6DEBMQdHRy0n5uYC0GbcAu6aHrZLyGu0+AIZQKhfpksQkv1/w6o3
lYxWyo6Ys/I4w70RYccTgyQb/pHpvfrSn/pkUu912KVAhs1SP8XuBC295fvHsp/8/kx78dXwHJ0W
Pa8vcyhJ8j0t19RbYrDgYa2AkaX2bRpEnj7LREaPk0bdP4vBQPhGo1h+M7uJ/AQTyelTXWDFDTQ5
7Xee88OVWARlsjJN34wZF2tcCleXbDWNuSvFvU8t+cC6Ezs2FaBbM5nzAswDWEMEdKnlXdUeYNeV
WGzKnG6b4+zKfCWEBQUsc6U7DBEpOXPexdHpXjrwIh9d7DXJkRfEx5o+HCQsTW1PrX2uT7kbAEFC
Zewf+Oj3GZxDLJeHq1Z8nfWxBHsxRFA+eMMCyTdgjhhVDVeEPc3oMok6UH9pfED4FscIXU1E1q5R
voM7HeZaB+XlYQmi3OAmBQ8FZsZ+Nx2lwPnWBN7mMvUJzpiqKG6cUzocjn81RM7PiSjP3Khdxu7+
YoDVFJhdMqzXeh/JE99QSdH8iuvz0FD+6UFqPyh1cOUctbMomd6RI8U/DR2ejstS04GtCa/qSHLS
nIdeWID6q/ig5VXSiIJx8tAQTkXu41vdFfuHs02ceH8CQxhBuAwCUDU5hs/g4DkZPu7PLhD2vm8K
QeLIcHATfxecvu37GOh6wTlhKXac/K4apj9I5VdOSlHgIR9QXwRhcL13hnWKBJ4NJCHCBc/v1rPi
p/SIqT3grgNBZosOd0ngEJsF/7GlSpvrYJhuDo8FNKLpp8UCWmOI1aQPcuwH+RHOf9WzcyH6ZMSz
+iQMuU0oOa7zxTibOPDqF+EjKaG/URfm7FFAlGqceAUok6kYNc9hr3GHuX09ILJTfkSoL1hT+kH1
XquCjD2UqkfeKN+T1ekB7icT+AbqhMVAZPCNI4LRxfA6BJ93n3GnPu9jFdRjhshwWOdOHLZaYrF3
EdKQgZtbuF7xNY2O5JDgD3RVrJfzGr93DArVHGrROUnD09wjw9WlQ+2CbqZdDQZ/SGNnngde/pbV
V2UXDH/A+aufaRSn5nue+l3qwf6IymnDI+oEm1CKqWC2JlQ1EK6q4UAneT3h06HQNUK1ftN7M99/
x5XUtnGsb/lxbKuxhStOR8/egyWe7eRjHscfmtWd7TCHtorHOXG3WivsWKtAFII7tt6aev8zIdHS
C3wBJzgsQI2DyuA9FFSZkRWV9QUbFTiJ278o7YVpT104aOJfbYy8d0RXwOCpKoGzXGMzOVIVeQji
VprdWUWkwirydS8Icq31QqaWVKYN/+NMcWgjaxf0LLM/dAMhQ9N0z6T/eebgPV1oVMHG+ago9IQr
Kwsw3E4jg+6c1g+iUnxoIXTakRmi6sWsNQ37SN8NUXDWlwJDLIzZ7G97peP6b1Y/B+lMxj4OpVXO
4pjCSkADGCa9UgFtIt59muM7F+jUVHA9kQyB/NK1NcZpy2Y1Ta6gTJb3Xyx333vdg5SBJjZthmzZ
T7EgrvC2ulGD5RhPZ/dR1m1wJGzXgEwRz1Fd/7qaBKPQShbWT2SIOCq9nuC6T+JIelYE25AHdbUo
jHxX3lOZEjHj7rqGVjrYd4RfqudMtwO2kLk6fIGud/kBjyfamBki4qK3PzgtPx0HeyAeP2FOajOs
sdJ3oIDED9vsOFsOJhdz3Sn3wRBIBowib2KOxTLj5U6WIogVn/agr0KSxkLx/ImjzoyTHxJT5jDm
UQLO21PRr2iFjzccjnkuL3rgrdXymsv2Q17skJMePAKS47KKHJJE7iHq5yEKqoS4bWyE1JQoD52S
1A6lnHtvxwpmk1xS2ubqjTiGX9js3/wwPRnoaa01Pm+bh4aNBkipczYGmKFmF0tGUPbkcvY61lys
uSJfIst/0rm34Plf7fQSg00hR8Sk1qWj+gvEcHw/IeY6hBhCws4y1NRSUgrI5mSh52BiEuBmzE3a
vhUV+ylQR1quMTbI+duNbWE4+q1mNwYI4e846NkxgBuFRsQDU+2yKcvZsIhkgV/pIbm8T9yPccgt
O5Oc66EWCGGcZ/GVosbh3qeLRzDddIciCichxorzHwvu6mAPIpmBn2s5y8bDRf16tSvE41rD8GWJ
/9OKE7EKL7Izd4qUHVF63uwj+IKw3036BdauB3CRg/Uik/+BQU0eb76FAVVsK3zAuK8r3stDW7u0
Vor/F8GFweR9F+PBXvwHth2LwOrMNN79ibmo9VqvWg0YMQsD/8DqTS542SbJCHVK5t/gfhA7Ti9S
IQ/+jdToIPaRmJXDuwT5t2IE5C+97IRExwfaUQ4df6H5ondbxiyOJKxfwz75/JTtx94HlL+cL+YO
eA+DrKH4s2hbv9oxsRaiM6yw8EsKL7FXUElLXfC/3bcd0v68L6x96k5jT+E0AcP0AICL+UKW0En9
QbOH5h8quhs+FaM8lJ9hfYJV3bQHgf3SF1p6j2gKeEyJVKiFbbYDun2GQifUMO+/I+0gNrHJbwz8
iOeQPwZHktkv2TREQsI3Oxx+AtiPm/j+fAuMcVGhNqz79axK+qGCenbtjtveeiHiXWez/JYwRxAk
KpJbdX6RikPNPuTsuKEgBJhWW1/vzUg2j9bgUysMrfWiutKlszYxJhm06ghUjd4DkF6CnqGxtpER
QUBnNVA5W8vVQzjffEthgUF/wwAL20vw9+MaMKw6ZqFz4O4M0zNbT0TPQ0+7CjUXl/K+0JCQoS5M
WsqzfN0kOQIvWpXvuYmfgXBZu5CIHc/zpjPOwu3ElhmRzwukUIVeYfKq1/ehFHIgEkg+uXPiGLr3
1uj4zPfnc6D61xkgyLwUA7YmxrmMG2Z/0FGwj2MqT1cnV3j7SW+MKeU+amUnxnQyhKRlIOBaJOgX
fzc2rfGZwqlqbpMuGLohVSC8UyCbPaBOL28Z1Gd5dqc8ua5ScD3W8V1JFGAg89aVRm2SV97xq5Vj
6hB59rSotJEszvnfpAqFFstTQVYc1pNtm/Sq/W/afvVc6A/6aJO/HBRMNpenokFnOMMeIIKi5DJJ
lQXWW0QnYAuibdybZ9j2VDz67x0znEv0Di0aYTTC77F5w6mijvHDSyTHPZytC4VlrpeGTSmILnVD
F1a51348eIR1UswaRlsWZs2mHKvRVd2oeziJ1tEwmcL9BYbn2K1morcQ8KZgAEvPgiZwInzcOn3D
tEQinY0pHSwrzVveCJ9K+t1ZFNWdhxpGaxX9T+jweX1V4UlGXMT92edS1RchI3E4GuxKBQCB64RN
4waBElyzGElqMyt9CjoSx/N+/IHHkDluGiP1wJK5EuSe7cEQSXUJlKp7Q/miAlyrX2VJ04aWgAkt
xdfNZTuN155+UosprsgS82lp3UQXcE30mwOWgiDWRcT+DOZd6X/nvMwnHlWePFgNt5tL8ljfPC2A
VJRIGItg18XwTy2KI8/AySxazfYqairn3hlftM48xRGF1cfZbj0si3XOjFkVIWcWnKGzOywDSD7V
V0x1mXPVuNlc3cuohq9Vuc0rnApC5otuTK31uYFaq830OzOX3o38LshoAjYMlx8NRJ+ht5vt/EVZ
wYti5HRKuKDexm5jD92YqxpWU4OFeVY4V1YwoG/19rgea8rkN8sEMSn3SxXKWh01VsavD1v6SmTx
y2x9O/g6LnDEXVxcXBafCoIhRGpF1hp7RH8gtTOuZ0IPEQ673lH/fq6cV6CnlAw8hZuKj3/6TD/U
qeC/7B3bymof1P8DnNlAmSExUouPwJdyJYJkYiTW5QqpTbQq9nsOkbmpmq59m+sxV0CiW2ATGV3l
n3ofRx9hFiT2wx/7CIcmzqp9E1TwjQYIZiNdT2ugXxV5goqZHThjdkx5PhdoaCDfxLRjkfBgyLJW
QvLB08YFQ639xwXAcdHiuG4UsgnqOUUXizO5nefa+XfpU2jE82Ml1ze/Y4j+sJNVW8hfwxcGwztE
9uWqArq34RskXQHBeQRvQBxZiWEdTzQWL8TfWlQg5q099FkcSYt0VoWnMEe/5cdsThcK2J0oX+aF
YkPRSNpKa/W4Vsplmbwl9o+wND0kOXmLP8mw2x1b9JeAbDsAO7uWmo6zGUsY9NbT48AqM3wBJhW2
uawqCEaXVlHuKVNR9nyUi8aQGMlL9eeczUwDF5k1VrAVNZSRmBSzMV5UkPDFGXYiQcb7/4JJo1gl
uhSlyQlyfhYv8zDbnwr2pBaH5VD59vdOF+/548zuyNDasmQpyP8lgkSGZQnGI8L3wMSdTYhlNY0/
LVBfwy9JhcM2A7BjYiMPdGCKdC5IaEQ6pNEn2b2crxQPC024zGb15pE/VHIqsUkqYRNljLWn2qH+
3rvim6FpnnAQ1802lR3bGiit0dowsqx3vwF3huOTGlM7X6+UXiFYMkSCXRu4O5+D96GH8UWXvE4Y
HfPzvHiWfu9fRePRGYYX520HWSzniqmeJsmpcAB9RitdXHcKNKcEtT6cV4lovbUPVsjWMQg+2+LL
OuEqXajgiqsbGwW+YZJSGmVfBLzqPhuMoQ9XWh/j2exoZV9VYFi3DXL/pK4NmwCWwKavBeYsEf4C
8ws9ZNhLFLoVVgVZj1cXTmIqixh2wAemtRBnjiRZljNlB9gl+GNpbfaXuUBMdqnRxruW/eZB3O8f
4Q+WNpdq30tgNGYTci0W8oyUeVw20p41exvJDB/MofOP/P8BA0TzSf4ZjfpYOF1B7oNAnpV7XwgT
IJ+vnQ77mZ3sqPGjLoeiLdiw/EzwV/PrFwxFefaZQdk/JMYxWKUepSQe+VzwiITZeZoGrmnGZGga
D1Gmig5J46O++4yiiTH6mMb80UefnJYCyKqidivSfICO08SDEa9DmH5+Q5UdbnjEi1R9JvNnExBz
ekYIaNdE9eGYr4RTuDHActS4GaTRL0hB1CQIuwwXkdw0weaqONW1tGcw9l+X3nJnZkoMCW4Dp4IK
HHVvFeCK6b+Gzoy7ulVYPY5mr3BiFGSFY4Pn2Hb5pk0rDePfgvWF4EArSiRUDv96th8tDrsP6RPI
MsPvDrD8kmJfR2BBX38cb9m9mutvsCEEUVxgzPbEzNjQX7bzBV6rDq67EC57H71LtejD5re1hTD+
snM7ipTr2xnkFwTcvG0AH4S1z+1LAYTZtqZkxBLCJEeGkyvijQOFUwg08xnegCHjOAOfcJB5i2EE
7DiveOj7PtHGfI7opty2BtmGOFV+OPxQVtbJBMMTcueZ4MtDeTMM6VgT9KJ2JLelws8fJ80HXaWj
3tPsvrztHU2asguj9F48ifQVfy+1REOtWxvpMAEIOoETb1k/eETrUwf4n53NEkxfqwPKJAr5y0qN
qtsevl4DxSEAL/Lte2yvKxDOluKz89HNObhr66h7bXAtsAE/wJF13RMImFw7GNXUQrOlHE5n3HTi
ZtQy1Y7Fs170hZ8YS0o+mtuZNzDPiF6w/aDPK53JB/j0BcseAE9MAZcfhefzd8V6fCBHcMcNvefm
BRFqLlXGUvLWsocwUqxgLIXJnajjoZFY6bFTHs7itlr1yUNcVHMc/w6EloWcNbL8Q6AmkhkLafwX
6v6TMCi+Dh2gWhIl48ZxAmhQD1gV8dhMOAHqP7tCPPpej2IYUqNr8AuoEtStUGwk3GY8RU5bB8Yb
vY1OxTvpkQsimAm0/OU0JCWFsTbm+moI2fdC6TTO7Z9U9JNCNsnAbKMcKIS8EvYVxi4Wh5kELKO8
ONGkMQ4HYkWcOgx70GPlu1m3p7TE+PM5xlA6L+ZvtN4jixwLKAAQ22pzvOG+5bhOy87uSIIul1Mn
wNFYzC3hoB6ybTozsn1ITGjVfMt6nItnq8KfSTbtKKhHDHMZDlU+vHiVoW/ed7ZEsXAuz0o4ysgb
O3R/80CmImpP7zQrMhsoJjnL+o4mb4RQKMpvGYEydUD2SgdkOStjNmKxqHzk8xnQXR2foEoHaGR9
VfK3PHxi3IxleHIMaxi2rEGAvMWrQsusBKcNyXpZPaXKIHnJMjumYOyI37GdGcC6lgZeCwhY2vY/
tjcm+sevLnD1uGLH6ySeNudAO0QPlGv/fqBC0Dfk+2gIuWILzgTBM24GaK0NguRSQg2vosSMGRUt
o84A3ju1U9F40pVdjMX18SSeyyXFNKyIE0g5IzZyqr9jqSN0btABGp45hbm6p3YvVFMMkN5LFrCP
Ps0QEIap8N5UJT5+ndDyEuOFHAkK2TGjlT5weKNriWVympZeYCgVX5DQ7CzG/OH+qV75iz9SHm2a
zCXzKehtqrSOlPI+YaqYLxNcNERWIFiaCySrtGE1N2BISY6TBIcLBIbJuYha1af0k5z5vhwGzaU3
KHN40safcVT1UfR/RNczd/ZVKqJHkTn5YoUjpa9+OmLyE00t/O9urMLtess417XIUROEOzg5Qcl0
yhQfvVOfWMwcUt+I+com4ElE9qL0Rs6xj2E8w78/D7Pn6RQ5pzp090yUaFYH4phYM6+pKebP6rkN
MGC78ijM7JiwepT0hWDFM5K+zKx77MfOiDq5/ZdUUE+/GYdxfdxIi9gYn/nfIP4td/0ywc+kBSGD
iCUka2DWXlDGMMKFp+kEQnJ5G/b67t3idPpUsxsbBQLDXKc5MNtvRAMtgHCpfVVeXaY6pyGd/mJC
Vg4fg0G+074mNrg+oTrsKcQO7mUuShh0AQjHP0To9dn+RtwhMTaz7ntGIOaN2pjPNaB5Sd+uHz95
B7ypIV+rKElXCwD+yvYJRCdrMMFrW+WmLX4duTKIsr1Ou66LUhN47R9bPsjPl/nWQlVJIDlwkRAK
UT5r9vq/RKWeQpDIzDR8sW7ilMyKssJW/rshgUhO2SuRzJfEBpeZTo5X5Cl8nX/93r+MY5iDVg2Q
EX9Ri+sgh6Gs6ZI1g+mXp042cQSMtJNHjsLetFLV5/07zrKv/V2Lie39j3Jy6h2zImcSyIMi2faW
/pwIGYMVFhlltVq5NSS4vLyEz929mjvrMkpw3dhoshSG3B4P+ppRSi/mHGzFPyS8ZBAo9jmwC16x
JpTOIRrAqxg2xZ+N/hrQqcx+vlJZEYlf/dfDSO3hYy1Qm064pmiwmFxxDN7FUk8bw9p4WqZplTXB
RvmEtkOvM3S0ok9LZIsCxG0asUxIp/RDJc1OlrnYJaXKoUEYNt65ILjK+ejAirHsmntSFRK2kbDG
0GvAM8Lf3RMtWwtBaCS/aZZqLo7vFCU7KtZrKoOGYDEgttwY/goLez1w9XyeNwRfIhmcrWNqVese
62T1o+8JYR51W9Xpk329MGROqiYqc20oueQHyYS/csHzyhSBd+BWiWhGPnA31rjCCUyHpjW3fZzr
1nHbo51iof8rPVHFCgAfJEeq4+IlIioHnnWQ02Sb1Idi6UAPejLqpqmArHRqVo5zbkEQ5Fe+/WYx
c00LsMgDf6/Pj8XBK6ACHLCPghetShieG9CFyVWI9zyOltdxbNNp2/UBaDV5bBwrp+XhZddsZG0K
ZngkByGILNQhzpywqG02Bz//XeIIx+0RiAPdNYDCyhcAlE/tkMnufEY6+oHvYsZZbbiwR+NDwLgm
7/NTq5vD4ssN11Bod4V8a0GkxAX0Zc99mGwdKSe7cXWyLjI05cPX5or3jAz1rYyRR1aeRwNMZI3S
EQcxvDU2NuA5HMAWbWqUS5UH8sLeLQFbOtNrTrumwXvh1E5Gl6aDTXR5jw0GQsshU7mltRIUxvm/
NwTNMg4TMPD1Cam5VAZDrYaqaWdgU3tpSJuqUD9RM/sW5YSPP9HJnbBivoyxwP4GkTiJkbwJVqqQ
Pq8qc2AVorvK/naAp2JNhK+IiDQBu40MomuQrRuMm+KmeDseNqDLjoVF7GNHHV34wdg0iizGqjM1
EfvKPIf316OE/8HiP071O8HmQGBSfpbRpAUR2TdtNmIKgLce/83t41/FTGD+IvxNnQIXLewKAs+f
Bd3thcblb1TCnpfZlq2yJKmXAJHtF7oqQ9FoJznMOFeagZxrOYng7KaJGMmw/hgI98nFIPTQmqnc
umwknMXjzRnDZUqRyfMGEXTiqoxm0kj8nU75BuuTy+ekJRO4goqEwGT0LFq1YLAcKzOKrbEkUT9I
Ak1uBhjyeYRhbo/6Nzqr+sMWu0fCjebGwkIl90tHnbDl+qTfMr5JNAjnQffPtVh2HOkne+z3xznj
hh/Zn8u6H6OYlMMoXMaH72flT+xm1PiU3niNiaHGV/CzqiynQtzo5vXFtkO8oJ3FRxxROpM1hDjl
byEJDIJYxq5F69acqi2Ocpjq9XqfshfJ7G2IzoLOJ72/K7y9dgt63bPcZ7ES1/xtklz9D/j6QpfZ
jxQ4hR1VMnjLeXtIk0hqOW+u+geEGDZ/0Fi+0pk+QsEa8G3MlXwF8hhLQNAWQWCEv4Yp2pf4U6KD
60+d7xLmZ+uexoPGsSH9wfi7a8VNS+Q88kciPJkxkv9Oe5ERtO+B4b9YmjkqvVdXDUfi+jYNSVDs
C3AczfU34h/F8E1efL8Vj/AK9B5oARwk8E1GyJpCFAvNkdbp6CsOVmqxaEL/0/I9bdCAiYdusNqV
JUerQOe84n4G7WHVoUbfSJPpgmHibwx4XeDxqiV77AlasMEtqz4Wfc8JFysAGh3AbhOkcODd0NBz
FnF3dxSauhTiXQTdnx3+gjCVkk1cFIZMqxk/nR8wfnwaZ+QHkEsXaFpMVAXa3dijGqYXoA1zMonX
aeOw1vcpTL0wUbQ/4oZmTg44hQQPFRVWyu152oyGSTTBocB7Yj9D/jQz3n7jGFxPbci9qsW17+Sb
xsykPuxzssgEL/du071F/gUNw1rmaAwJPvqrQL7QZkyicI3GV02v0Bi8Agwvo7LBJrFJ8PoNIwWH
9QWzaFG5Mulvx44ZbAk/DNjPSSiG8urEnJ72hEDo5JuR4N9w6UHCrVLsxewI1ExoAiRRPJFzIsfT
3tiSvhq7vyuHglV5GWP4Hr9g03tk1Cp5g1/174747lSAya4jvu4QPevuMtit8bggFFPWZ60YsI7m
C1LEsQ798e2V4gx5DNjFb0qwUjpVKseJ81twOTQ2YuIksEteoak4et3DXhDQ1/UWjyK3U5/RIM92
KTUT5qzZeZye684wdHUdnG06QYewrFRpkhnRixjRgIQteyOmBAbj5oDUzp29wwnxXtpPtF7sYTrh
I3130jA9szwFQ7w75UJ5HCi7EnfutuXpk7WDwJSAFUcUv7JWwAaqDWMzLt2q4I6NhGQKz4nFyfs5
YCSrAv/Z+h3im/lhtboZTU5Sx5aYmsfS+3q3PEs3CEL4iJ3Kk7mDRSiw4FaLmR4W/bqoC0NP7N6w
WxbvBZE+rfWQEo1r3yl1JeQLIe3UVAuHbxaVveX+d3amgeiq/vg5mW+foExRvIZxj6/5Evo8B6Oz
deSBKN/TN2cUVmMX6OzvVJJ9Yp4iOif3kad2uhKRgES+zoG6CaycnQna9P2MU0Ns8gn+bSne+FUe
dBxfavJ2xjCDr8Jljh4E3TdsxTvGWVRu5YoTd+NP1WTQhgtLrWhNL7FZK7mw/ggrqpW2JqYKKJ/7
+r3NK445wZQ7M7TKjXih/aErwiUQfEtF5hgFmyvomST9sZjP4840lCW60tmVcO1PFEinzi6Sl3v1
ztkaiuJD5sdU8w5iOLWEvMo4bt3ZFxyw7pE8x7qWrvE0+4pHNx6YzBf1Xk0CU0JHYzK24ywdsTpF
3kmbCy/VNZzCmSie7K2tLUxaHKrsxpTIkrwh9zyuB/WXdtLvjTBIoX0mA2PyijZ/5oRZdwZikYhE
EaW9oWBFQvSJ4vqtDNFVUocuSce6p0MTLoDiE0MTczPQHdKaluLTpt1DB60tAZN9aG84xCqfBIM0
2xMilFZxLIkSJnApX9y3FCsSnnPNh3R7MovSS+9JvH7aNZrPrURmeidgyMO3uIUiXVRLN72/5dfw
Z31tWhkig8eJcKRQdKlIa5Z4AZCl3/U48rDRPYqJPVXEhpFQxoEoV6fEcYNj7e8nNh7PUhYtOzGd
ZRPL4qEhOUHgoPLm3u7gg/lc4o7jaX4Ji7jUsfWr/QTR3/UP5uRnBKYFNtkaOEm3edv5aAmKOhir
H6I3toh35U0iXtDwWEDI+xPqL/Y+v/Hcag3H0rbMGrsDLP755Aos1NgKtsAc16yFMm5w2xzr66Q1
mP2reqQJokYiaj6c7gGmJYGJg16CaCpWKka9J1L1UD+jTGmXHuz5bSLxIT9Ns2WaMPgkZtoqzDfQ
WwgDu3zSSH6UQmA2Ci/VYrij2RqHrQKI970vGO5IcR/yfzTp/j+86DmwM0FfLlSO2N8UeSbZO8Yy
xAuHozCIEOsY3QhX5bDIdTZp33LPf5Rxb2XXWS2LcKjBvupwc68Ypy5ejae1Z+kLVKoY3ez98wsx
x2Q6aKkg9LER+lhZ2Mcgo1Ep7otvUdFwqrswmqtA+qpnsQS7RAx9aCCCNrHUcE1GshrfqC0I2+//
WkJIy0TeLMNPGRxISWzzYY58uYr8eLzwABsnnCwZb6zBVQvOoMdaCf04kZ9g8uu9VHERiJ+KLokd
0r9ya19gnrMeHPk+11cfAcZH8jAMMsUA6Tk22lgpZWAj51yFBT6lqiDXxYc5zG18t7HOzzoCtCIw
snuiMi9iPnN9wY+Fofh6PPSqvz4sJXYrTzbr6aJ6aNH+B+U/+onlbDYEG7KJKQ1IFE5Xv/t2j6wA
EtpUQM1p/7CHOEgaI91CBQbOnSGtbfUHHgApj/41ay5xTl59ezRTwiHRZEgGglK0HnBM44MHdzb5
deWyPTQbg+pIwgbgM+4gIoK5a2heyEffPx5KWuCzS4Dk7BiyNfWecmEHcq7S9YyzJVkU0SsywviP
UBHaDbyDivFuN6yiBJ82cSVhVqAYIOP5JelSZmImlo0aCK2X1YCoqGBcRiQegdlS5c5dlUTWeBwv
pymexdmtjLU2ic/t0ML+MeGIdY8M+Heft38O4RmeYZWpyLVjCIGUb+20pl8tZu6nNxxt+UKhkGqm
XBwN1XK9Ih8Ge/2ko+NlnrqeGtqgyFy5Zftl5eYBE3Kgx0BZQxKgDiZHU3PctI21hvJ4ZIoX1hM5
mD+MZPttvPMTcUrySPXEj+tCgizRPODZMAA5LB+nAfaaCbs8rPUJocpBJ2sGycF5iWUNfnAGmmaL
a3aCGY47E8YpewGfq49hIxXfpAtggWup0avMytxL/tpOjZNNIFiO+LJQi9OzUYrGGOjYiKpCCEu/
UPu5I+zdVQqmAkWtOy3Ta2wQSVauN/7wnAZKoq8DULmkN+2+SQPgsFrLCOXn69tNz+t8Ds2Cttbc
SRIyWNyCULBpo/6Gg8Jq/JjmvPJG1keLkzbUTJ1aOH84FhjadWQBUOc0MpN1aAUSWZWbdBcFb2cc
WHjIUFjRk5m15ixS1tT32U/vURrL3k3sVPS8uVMpCGkc4VI5guZ7LGO3/1LGqsxHyAcSVAKZmZks
t+IR2U9+urh11GDoPVBqn07h2c9v7cxkSAOnLIZ6iAk5mSJDG2p7syrP5rLOdhDNxK7Er9i8Klf1
EOkVJcBCGXFXtC9aAhwk3w3D1uRDkxmZT3DZvRPuZsDJ/cY6g8hf9Q6Vp45FLjqA02g6qqCBIXv9
nyqQxnmwEE/L6T6qJGxC8+xI+ThhVaMHi/GWOnhugIk7VKfcck/JCFlG8+96brWzwwJp04LjdUP4
vHh8bIRVp+BaXvBsigUuhehsqE9TT0WVR5KVnLTsMzFBuDRs0BVAL57BgyFFTA8NNi/GbOXXMvI8
CTDTypkKq7SLLldhzPFru1S7asASTYuILAProhLH2aoUm1t+Mu1EjwR2oS+FlJrQxXhgN9edSC3D
H5L7IVf4CvwRWNhh859gUDnafx0QakxhZE7Y1Z0TXydd0t+MSBj94JMKZbjoG4vmn6rJj5G2g/pp
MJeKAuY0kFMNd0mSdcFcEx6X0iTcbbcNufV3y3DseHJ1Y9E2vGM6Yq39wTG1+YDBzhxbVnEDclF4
ZsyJJHWeYmbSGJkFNW12ZpzDxHvkiWQehbaN4XHqGg+QPpr7UUqCo1pcw8G7L4EjRJ/clwlq54oA
Yi85IMTnz8bbyq/7dToepO49fN1rDaS/hKcBzhwjh8uwluYQS6bns/3bU4QFf55FFMcIzvP7FjBo
xGv3Hjez/KvRF+DA7Zvi33PSqQyKdM75tsFp1meEUOUJUyOD7FJ/yu/AVGm0r4qLDTzDTZfluCeF
RBPdndPYsUBylkb+XbxTlsHnT2jewfklpfvp9+EjKiGy0HAiRkXJ1tWVh5HZD7zVAmufan5tno3O
AaYmLiCir572UZqL9ewEBt51Kr8iZEwJbval8g+xxqfTW9eUyERFW2ChHY7BFzNWhqcZNkGuw968
wZx+elCiWSflOZjluxx2rZh6ChvC2o0mWbQBjgp2uFtMLrk+JLRhLJT5v+EplHtL7QHuboKvbwDB
KmJn+05ZsHERZCRwcC9ociN3mBOCKlP34bnAH7TEI6GWOLDfEgsXXQBJaS4Gk5IR9j75SNHkD0Sk
ORbcf7uKDzojfyEBQrmGy8kjy16ShHqg9kzlTJiiDx5HLktIFwUnFEGjkkPKFw2wo+u6Fi0f83PQ
wzvDuetU69cRarCY0r4gP5CCt1IXBq79Qs6XT74eeE77msQBN22ZRMSZxw78KuRmWXJwDA96Ensc
SBlIhE7lP0+6vj6mzspl1dR0ZKXwxAr0eKowUoD5xH/cBlbIVp0ITjixKGE37QTjYSj2YI4qmCmb
ccCntmjJIFCKnEk01hvAsvfZPm7FYpYNidOkvAcGv/T2L9LmlD5BG2tpX1ZKl8wpWuc3pbXa+ykh
PEmjL7oIMtUxbhcebdSplsnIWpnXa93DkB4FBTTIgXwCJXv45P193B7rgTgU94QjMYwR/gnxqCic
7zMSfUN6qJ7syJWhSIOLY/lM8k5oBMhmNn3gmYEi9BhNLA7GH23+MLFK9cyeRafkMO1+ae+uCjGM
cPIMcnNs7tM57Y1VQ6GTB0lU7QKbZnZMsRFzErvbOw4kgW17VqdwMApdSddfe8WXTt93dHSube67
7Du9Cbc66ql6a5d0Oxg1/HuUb9GNJU6lWwjiXlPUQsMxxe+s1SyJaG8duIXwyV79ju8Og8roScFH
PV+CuyaV9zErpG4MDzvjM8QzQNGMUE9egvb/wBRvyUePPJXv88WA9bcE+E5Sp+H4tQ4Bnm6XBSHZ
DHd/BWbsvjQmT11gY9pHJekjVFMVntnzyF2QBbEeJFRsEBdibnX9WEKsXkNn2YpdK0jz9S+MDnwq
ewM2gg1qSuTGBrjA/Vxt6wCpEjZqsHvBrTbJKBGAmhivuqqTT1SAS+2HUbPo1EnMpzJ/mNC0i63E
X8tB+G3ksSgtCptE6/X4AtuNQSOJab8ZgLQgr1G/6F024H8qL9ou9h2J4ZJNrPVP62VeI5JxY6ab
/q70PrzrCf2o0RYIxowGcRtCjM+fwUpKsqmM62ubrn6pbYg/LoKn4G0ZnJagyVBUxyqs78aQRiYw
2WnsD+Dze+MQoyQp3c+IYT/xI+AcXz3gceJhUdX1QOJ8GDI1xeh9jExXmCspdJCvyUKZaUGDRi2w
nK21qyUhO9VLuH3wGobiO4VRLXdEfF5Qxx4xnEPD8C1IhOyGxZcTOQ1bIk5P9+/ww+DurYCgBujk
wPSa9sC6tnFe+nb4wIWz6e7AXBOrYC3K4s2nHLV5NioD1x+UKaTc5do+ACc0thTxQZch4izv1J/Z
4Ri5YLaz7RYkeBOUDuO6gE84cANFWOcEdnVJZ/r8owm8rYQQbu5da0Xo3T7oVXTKLTneRpTvhceZ
ivav0Ft5UM2umv8GJP5afrG6rRrQ4wkuJSpNM4NNbIj6e0V027Eag7tLowjsoWXgRxAwjy0F2k2d
LoY/F8rkHWxAGb9FhBSqCO49qhSh6TQKMm4qd69v8dJozirs4TRsbZzWy2CFmyS/Etx2XF0cwTgq
sfMGdb3r/k/5ntsp403A3UrCAa6wOpMxrHdA6v1+k4Inpf36x1KrWjHASW3gGMqypO4xMVBv1Isn
lrFSvQAfgFS7fK2iK/CdpQn+sGA2GZT+Zn8vMHFtDahhbU+950xi/IWCeNqIO7Bq9DAfzw7rGBOW
FIliB9KWW5HpOEYAf3dRK10VYc4vL4KUO+MSiLc32PjK5BAuY5Hw+zZPxAD5ZmcVdHZ9SJlTZF8F
FVZE3ksSy3W9K+brDVAFTyDffUWzK/2qt/+cJRjCYwUv75M+g9N0Chj5EEmTm3hrrEcTrasIjLdl
MM3HCApLpNeN+jI/8xQ8TAeyNuv5cdGfve+LcRQMp+FEWxK1L/YJ52vtdHNdnkhua739so9IiiBs
q8rQJAmM6Z7swvvyxXpMDvuNlb0rGhZOIvN5eFeMGnK6aGfuKldzl7z2w6Jg6O07VfYm8cm5KN3w
V2SrO8ciwYFFXK9LFdoFQ7Tc5ECiF3Qf8UdLfcCV8935jP8ZedTc/zzHEUGY+Lv2rEwOeUb0Ee0e
W0iDoFCAdfETLVUNf5S+ZBLHoKCL7Upp92avjK9gRKkdgw44SvuIoR3ww9r6hxBip9ntWaR/bQ1g
9uTJOUvIw91CgD9LNJz+XnDT/q6X38lJ4PYklntTgbS0/gvvL+Wi169hwIwS6tRD3bIybEqd7WMR
ioiPQX9wQkYORVbb7xAL+s3HvxPuGwcJG0vjD9fiHRmfKFepl/R/CIzpQB8miXvtp4lJ3WqFaYOb
FEAKlDTpuZoMfAjQ0vOGJYYTgXiyGxnh10dWfhdJDJK9ORNEBqzMu1j8/90kGwUMhgT3lbfrHTiV
+SqavDp1py3BvefN19WuhVayK9h5EegqkG0AU34JVLYVh1uLMjcj+yg1NUaiQmlcNo7JLE0ZCnA5
DLUTwSDB9yppjyGL7f+EkMRFDWCemCPODemJA6le9yQc2388zc0ihwJ0MHnoisTqOt4smZ2Q2ck+
kavn6CJTV6NNq1LNaRqb/5JvSMA8tZzg9+F2h60J0RXSxb7g+mUMWD0wE2qgiBbIvag+SQ+2Clhv
AmBuusoBaNraAGsBodP7IEStKggJh8cyCH4WOc+NXCYFKgcdsmZqHS47mAfI78sZeeypqo8tgQk6
qSicdeGrblLtmExcD2A9/LnBpEa6tvizfdQ52HzjHCDlst1d07oJlC7AUvP9zoK5Vp0mxRhkTes+
wEPNZwZ8MBxVW7nR/L0TpBc0gM2dicYOj4+v+An/TTmA0yRW/hyAKekYrT/2KDZNltXcm2MPdNaw
cnaqDg/Kl+rbdCJ4/xcffAfpxgeO7P9/N2urXnaZNpzzg5izMDNlagw5jdyvY4rn6mkrG1qt5sfD
5ri9gug1UPIYWYsu+BFDMLMJ+W0QrC+k8kQX3pKAAO+Q/6TcgyDlKeSIiEWhmR5Zs2Pxtp7UQ9zP
lrusNFNkoADLzSXjzN7QUUb90qIADO7yV7KZYXpKwTvqEbNCyrN+/LCrrZtoSiXlqir9y70OHspr
M2nisIFflJ8Ms+Rvy8nElT9KKaAfvAvxsRnT6gTOAvuiRrGFTHkUc5fn9RzqZwU2zJYzBKKlSEj0
eQNwHzNFF7YLUvMMU6yjG6GN4pZsEPcvvNz4GVe1tk8hEk86m3JsQ6jmwsGY9aI8qqZIoeDepqtl
Q5PH7WhrqPCKCrb+c42jIt8CM/vRh6uQ4Sj7bZZLZbOEs1jR0vNfLBC/+L8tn9N/YQIa6m81Ju1R
lfFSLtP03cHrTvU/3XuD1OPfpa1EK6FNP4GIA0HuK0feyiJoyirSUxdsWAOQ5+Jv4hcez2hoSSyp
Aj0/YUdt/mTQSywAadfqgs85C6HYcZeqI8eTEYk0vyr3q1uxdPpVj7VFZ5Yh0Ctv0slk5iddyZT2
HP+mogfYxpRGT5fcZgnqExEPT4oxW0kOxZUFgR7lPATZGMw3A26HnGiXWuI0OYz7MDLlSqUCOZ92
f9KDYj6UmIF69lYLLE8UuqzyqbAwTbffzl41nCcsaTjTljCwpI2eCkXvY2d5BOjbeoFX4EyHKfr4
9FLyuxNtq3uRpWDtCS9AXbd6FTiUQdSJDtpoEIZdpuMPYru5l6gf8vQyLVPsSz3o5vgP3DyRwJGK
8R+mUyD937HtHwMPMwKJqg4ItQhhXkMTZTCBGAl87OmRZglSg5gFc0zQ+qvfz7jVRcK/z1CWEsbW
wLn54SZHjTBJeubsgSOPHDE5TycgcTw4Ccb3Z8ov8qSDxb/CkvWrFp68S0pqxIOI6Fdymnl0krQa
IKk20PlhJkM235uAEiWUMReGyJFE3069gdD+6yHROltxcuOfds3y1b5K2Sd5OaiJDhjOX65mx6qO
i2B9ZzWo0+5HA1pAA2KrX7d3aa36kJFgJtRQaEDaff7nlTpw4r+LZUdCTUCvHCFol5C6iZKmSGuJ
JqHNpvEsI6BAUCoE715/sO5viqk4Ieh7ywbSVzCH6PNX7Er94SvLvbLWFjc9RblJyuh+EFFKoD6b
gqAXBsMZgZ6H0LhVGsMLx647YgcKDNyGE5aQMdxIsveKKr76LgfkegEJONKCyLn/Xp9RnN4r1yUS
wW1KB5zF2e2KQSYkOqo1gY49xPYHF312hSbAaIFt75C/HaHhsCioSv0ZS20k2/yLuHHUsyoaTLWX
NRlg+eBjhjhb08ImMvg4LnbXyDos1MoXexqwv83LPeJ1eVQBMI9J/bgBZ4/1JrLUzZ4itsOGM7TH
YmtIaBrWiE9oek6srugHV88pYn3acF72O6Av4G5gly5iMNM9OdWOzWuqYhxjrKT4KNBlrIsAGuDW
DuBjNYloJk9kSOC/BQxj0Oczq/UwzGpM/UPzsju60TAmlkmsa9g32w4W2lpN1VFKMXKeIgO1u2++
9alCcS8A1aAGyF92rv7cn+sfvS7ozFO7hzyKl885oARZIEBY6xTm2Iri83072MO5bJv/AxUpa2gy
K8D6QA/bOXP0MAm5itST8bBHX3FVfWloEfBerKmpQc2t2FnXHaHaiIfKaaHQbVMG231jwXXrTNOE
HUk0BI8AOphAimbzREO6dW+tkqNFWkLlcoPPNokC9tUll89mXPz1Ie7DhA90ZJ8lpe03k33TB5w+
NHMdkxPGhetJh1PBPu0NFvwkcyNKEUUk5SYYjxIDj20kIpJ9VQn27BpEUuXtIYAWkAN+llTvAc8i
bMHsOHnXPHnHWF+RKT3p7/XgomHRTb1gWckGSVlDRjkDD/vgOqPMK0Lj8toWuVtP+rD1MSMgiUB8
UYI71tAxKbfewydyl6jUlExuBnz3REOKRtL1zjQDnGvP1PPCd/4zxAiXbLkLC/x/HP73ZjCiy+A9
6srUxVaeX/tljVLi/yAU5ydbXXR7bO2lp4EWkDbMyi/0EWl9ju4U99DT4niqYGL8QFhMqMkp0ovf
aIMLX7Am7Cm/m1vN7Cj1gY2NoyraF0ufwzpl9eeiWZIJhnBVFGlliYHCS+XV5zQOc54qzceN3LvD
XEkAlm5i5Tyb+GpTyGMpnU5UY/+tI7xeIK1NHZLpU0AIgf0iOewfZZa3qgU8XbR6uNAoiuEAmIll
XUv6TcCHyf+3yr8xBCpEzjJz4b7pp329W6an6hSTExCJEKQAQGRXrZfT4gBQZ6dBXD95S75YbtVW
Eo/Zz06i0rkIbSYKpnc1TOpZwPDwqGGhYb6TJ11Yo4yGaM7KexosP96NUxlJyTOz2w3hXjBCwb4d
i1ibtn/Ey7WR55xj8aNK4gq0XFfLKY18cH813+OQVkuuVLT8aCfKsYpokzjzHvtUdQg92T+GqR+V
fItAh4s/afjBMqKd0NeiKdXvg1PZLLek12jDeoYzxvJUqh62Qywz+Huqj27F/pJn6+mTyrW0fnAx
Dknz2n1mu3mjfT8RTT8UJv91eEdS2hxsofu8U/WF7RHiVEuB17P1SkNGtaomSzKTfOcZaw5/k0cR
Yx3oh7uZLj5tmtWAcw9+txilktJbJNXiaPcCraCxDSUraFXhUql8sy9jGd1X+99rB1q4f15WSYTA
scMIMdyvBtkF2zVmzIz3WNidlHOloTdfmGww9ll15uS6eFnlrb1+oRZ+LVEybepiPwTzG3cIdJvc
i36J73smpHFGUndwyHMZXjHrZz7spkOcPuvOEmaM/1J0wAAT2oo6eY3RQvYF9ua4t1KxZfQ8vY2O
NUi1FOAu4EkU4Vh0C2LTesMwLQU59lPUWvUV5PYS1X5PO3CoBLuMi8DyRAFVSluTsQr6SS42BRkx
AOauJOCNQ9o/c9/J5+fuU+6ngpA+70lu5pIJTA53Q/PpYnHqJPibUs7UNUZo1tE4A448l5TNOJ44
+hcbO35iIEOrELcQvXKTx1AwfSN2fhEnviVytGlcrdDowQDHJzMoedim0N++A8N3nWbpgu+KSsmF
+ptcXBM2wMWucHEMyRlCofwJxhEpk79zAGKvxwirdpawHbQPVBy9iS2LLcSC7nOeWzneb8sz75ti
b92vwiOpgOOaNBl9ebb9E3QBrFdFEFjsqL0LtFsEjsCVwsbt+yvPIOd2gGZ/wK0AcIezOUD6s+bs
dfl+94w0TS38bf3j/+NwT3Ip/1Ehl4N9xz4sjBvaMhIUf0/aCvc2zTxzjExYGhgjckJEx73EBel6
7FLWeML4mWwrY3x2W6jatG6OecYQM83cXTB+12t8+VPC1Bg9YqP21pH1xIfnN+VGgoUiKU2c3yqa
WK8HWYfBSOvWdseKilULvIpSK0srcmaV1Uj/bhVR7BMoPqbJq1cLe9SsLc2TziP628LvZqkY+lJE
N2bPmOsqb0tM186tqrycN8Wo1khhE82xx+Irn5+cH2cTRUR2a3Uw37ic5uU94vagqGhm1g8OR4QM
ZmfarcAdHp0IoAoJxRCSsYSjiGcsecdj7zpniGTsiphDPvSVyW2tmYNwXQEXVzjBU+gvdH8VV+UK
TzHZfC2IujHoKpAhw90rU8ru/ZcKNddyZ4045Fjy3//K1/XEkhqXYLPYyOuNI+xmEo1pW09wMOaN
Kjj/yYoo7t8UQ/pSV8KDCLRBp2sz34JTQDr+AbbXM6ONUrxzmAlg9wVHXq6T2xf/cjNSPtSzyXqD
uwLHB+4E5spLG7mmXQ/buTIzPs56rQmmSR2zX184jNJ3NBIYNhI3c6rWxJ7o/IN2efPk0re+/p9A
coAwEGZ6+hL26irJpD08kRgXCodKckWyCWMyeklTQVORAOSMhJsp5g9r+ChTyLuhQ3aXGGur1trs
L6xDt3JKKEDds3j9E/i8et2QV671S9jr37jnhma5EhYVyzn3yaF87zXsL/nZCM9q2RHdidKIJ8BN
aUA8kjkGyDDcUGCAqzH3nxLLhTG/ACUrXeXxnzYv0kcncio0rAN5HiqZhSXMVPWKtfkmQY3WW4A0
jxtrvj4APSa5FXs4Hi2D5KGm/84qV2AMmojCLOi2VieZ7dywM8CxndtkCo7pBRJ2z4XXvhdaJgng
bkMCuzySK5P2NZdnRFmbqP23IgQGrrVtRUqQ0lahxbh8j/G6wKEy5K8MCZKZVcDJEhiYzLWDjwxw
g5VXUpNy2iiiq9vJ4UXCo/8gPql9v7m1FezoDwyj891jRgDnj8w6m8AcJG9VIVx+WZamdw1CVPq7
bkAt/L8wgSA4sWwHKqw3o4+erA3mhjyMNvAOYomKuEvlrXZxN5xa2ZJnKMVJNOEXLTNm5MCjHLje
GZSOK4ZFnQQdotXRdOEUrKRI4AIhVaLPKeoaP3dJ0Px0xigxLZc5u8glQETLVfWhCfCMXzs8k5j7
bfyAtcfMwifshKa1gw/iKDD1aXDblmzjnMARxOgAWeDj7g5HpKre7dEzslAtEQomrd1D3y+wB7qJ
uvGVdXxL4+qe5MYLUVdwhzk0hv7XFOabsoKC0gCSEtCE/RGKr94BgW6cOUXDxe2f0BiRYvnccHxT
tp47tD2VRZoGsAIrj1oyxbN29rAI8iJZ5y7HONyP6PqS38MfxmjVlOBZ888LAflcjh4B8z/Y+VN4
MHbRpi4pKE6cRLHQgyw42oSTC9JEYTSCmjSLdJQtFgxpE9neNfGFC/SerO4O08ScK9HzFKdcEwDU
BiQP9rAzh9uyM7s9SPC56EAciVtTMcJE0Muh3BrLOAmefk5/PUUZMNAcBjfBsQ6bHNlL+2WzogRc
gGac0wocYIRoKsAEJMyMgYzUDxVbVqrR74UsThdWG8ICCPGZRGKqQsAqpsNRUtaC1tZCmq0r4K0H
PxM0d8KzoiitPIwHAetLi9iJwLlgfIOBa6cErEdt0vRJRuE3w33D9Sqej6Urt+bG6Fnnt7CIccSG
OUTfebNfv/3SgjGcJFK3NSZAN1YPf3OREm/OKUicnTZA5inAZXUw1ojiUZm5jpMI2tMDWQG7/WA/
S3HzpqlFgrwrYAYg7u87iDP4vfHprl8J2nzYKmVAnAG1rVmU5+HIpxVnaHQeXEr/UtDPVijWKD1C
6Tluxi2pt5LpQRFj2cnpEF0QpGAPj02WFGge+59qchbFdbK407gOLD1mdjAY/Rf/Hd5LHT0iK+dz
PuZuOcoHvOFonKTsO6LguCKl94OWihMfZPXQ/Z8C9UssNRfgRB5UJ1M0VllaVyHp7qaPwtT9swAk
p8Fc61WiqCNo7CtyviLyEmGEoFqBaQnDgKbF3owCK65DtuUYrtRn1/eF6fKUqucxulk/wrBFr4a5
y3y0bmkYWPO5B5B2Zm+vW0yxWIyFMXSBm4kkpdqt+eGe65ePsB8Sb/l5ptoIE/H8bP7Mkbe2aG91
tjbccuUVvH83AHveOTGjBRqNRGq2/jX/aZpJO/GKBVdved63ehLQ1hNYeqom3TEYCOPoeivkvTjH
UkLxaFAGYfddoVnrEPIxlONVM5iFMshMHk0Z7NGVcVa+95gUHIcjcZdjzZ8wnfWdtmO5Hw7cnTOa
NL6z2sc2yhRn/MgRs3FANt5z1M3jRSPlPpPxZJxXErzZ+DWMrKeVueURpvyFQ55l1j0AQv2vAEWy
H8BE7gqFLOtur8wKUb/dwxEm33t9q7kJjxjmeZiDiWRp3IJEgH4W28+h4T+weHixSpzLzcqlYOCZ
O8hey9XpmqDYl4bLn8S4rRKi/QB3IawLJQhWXNIyqaCAq6w9ptpEuF28iyR0X5Jf0BHfBECRQ7Ta
e4aYWp3TTy3wP6ilMyF5mdBnaDZXqwT5loI9UOJZ5Yseztxr0p3wKDlnYGogDvjAadep8tfnAD+c
leFWYEOKsM7L/A1B87CtIJAbRJa0jBRM2SCdg94ZDzyOK5yV6yimPLXpYzBubszcvKpOe3P93/yT
ZpFFHSI5Fc4x7egmFe3M/SGihpCwDo77UMWPeyI54HMO0MaesgSrbe09MSnN1MpsNNbIuFeu1ZI2
qjavGifNdZVfgiFry1ZNR/pIceUgWi2JC2ycMRg6noODGZ6tXjw67JHT80sUuECtNjxL5AWiPeck
V15TYgcX5gJSa9dwn2yDzyA+Jwu6Y410xmMMvoljSR5TAWwcEazK70UXyt7iAKjXiIuU9Pz/Gmej
wz2VchFUWyd/7KrACmohSm9YafIva+1rQff1PCjT/w3vXrSj8AvUP0Z52vBZ5PzOCl/MZs6/YrV3
fE3yE63b80IQtyZM5bh2YCurmbs8NnaeC6z6E6s7Pxpp3di2WL0UD6DzhL8bKnVn59KlLDGycrZ1
UcZIgSEV5nCMpliMNaUiCHPcafPtAIcYd4lXgep1Mp5Gyz7zxSzfpLSWiYjbAf7fkQCvWio0QMRk
X6HCrKSCRKnMAX0wtFNmefIOCOxY17PODBZr+LDwh3fHljn+q/xg3KIOzKcKD1rFQs8KQN9PNk+3
2LbTG9EGHbFWqsKsoRpLJ+MMfeTZOwrnZZMlQnlzdB2G6nz1zysTGycS7uyQ7lhMKBmiE8yXkLEB
nGs9Px7LfxmgEFHifOIw6jnAw7qIW2wba5Pi/6VwdIi8OxSA6hbjQ5qNwBnCe1HNCqK0zaRQG3iL
PqIQx3eA2o+JFTqNs3q05PLfRDFk1HlSw6zAfGADK9wSq72PvqRr9RgxYSiaOcVwL/i80S/h2mjv
MPQIgscXXKPCaTc4sxp2DTWnWcgf5wrKULiLrSgQJELmJ7tj3xzWftN0tR8JY4ehDW4BzWPSMQFZ
ALq6MQCa2wgv+RVr9RlHoR7seqXwJuPvlO84bSxmtlHO1akkiK2q7jykn9w3p97jmAujdTNZ6qon
YW5W6UD1+XDFvedwKdtiDnVyqeMn5Mf0kKOUFt93egQ58IqAQnSuIvqJTzf5y/geMpbRdlXqzCKU
/VDiCGSP5MwbocyUfF+FDuJAMYgvxAwwR+SquduJaxspMaWwT5A8Q/XO/6pOwgAjxfMewJVmFgAc
ixiXss1k27zPkCAtOswYMfFhvO0PMdfGPeCKbN4ZlhtTwPqHHXPlMgo9A59M2f/H4HOrAnoAt1KI
ldk2G9eK7hk1RArhdS6N5QAjpVl93chrn80YMsPTuS3kQgBHg1O9L5UZMnXewjNOuB3TlCQLt5jO
uHOeDyEaytjh/qajEgQVXbqlcEkj0KWxOOWXd6yAsz77Q0sKphitoEnB4gMeHVZNxf/M++Ien6s9
+3QiGlw7n+xtmJNu3qhPS4MemYEp/DilZislVgwAWW5eeM6HrsMlu8UwELnLSdd1fcpJQdjnIS6l
id6GSXpXEuBYltleSR39onn3m7T7uUGoiLVN+4J4YwwW3fApt8Ld0TJNSUh2YVmPRhxZcmdDDyyG
W5M9nV+02ZyTZh0HI1zwjSIEppamo3drPoRnjgIwl3taaev5hdFPlFvjvS+aDUM1ObnuezOhQPsF
j7Vl+jdfiG0yHxv1gdArflC3ZssStW+iW7oRg77DXL6AsZA5EYVMjujevQ47CKFVOXLF86+k17tT
1ZmLN63smcM/UbCB898CKDbsDcSjyGmX21rt2KNR73mQHP9PzNmE4ppnvzhPo9ktuAToeGUqRTGa
LM+alroo3x3Ym6Hjv2gAXxw1Bxc3hhHomzj+mTD5Nexv4GR5k74b+pgBMqG+APlELnjl5GjahTFs
nU32kFL7BfILDEkFS0SSl8cZMjMT//HvH8e8y6POoVhGdzfipDs3Lex0AuVnB9LjEo3JbPOPvP0f
OI5j/7HUw0sTTxe6EdMpLswEtQbpsn9vHG1rIvqwQscMmIq6Or3TyUxQkJhyzRst8zBkMx2qqwjE
v2IjpxwK61A/8PV0ho4efGQzy67V0cuE++tWKQ==
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
