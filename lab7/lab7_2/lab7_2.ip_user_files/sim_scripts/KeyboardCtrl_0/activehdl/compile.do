vlib work
vlib activehdl

vlib activehdl/xpm
vlib activehdl/xil_defaultlib

vmap xpm activehdl/xpm
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xpm  -sv2k12 \
"/opt/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/opt/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../lab7_2.gen/sources_1/ip/KeyboardCtrl_0/src/Ps2Interface.v" \
"../../../../lab7_2.gen/sources_1/ip/KeyboardCtrl_0/src/KeyboardCtrl.v" \
"../../../../lab7_2.gen/sources_1/ip/KeyboardCtrl_0/sim/KeyboardCtrl_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

