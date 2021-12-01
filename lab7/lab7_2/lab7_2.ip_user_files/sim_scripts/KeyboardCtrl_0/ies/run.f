-makelib ies_lib/xpm -sv \
  "/opt/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "/opt/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../lab7_2.gen/sources_1/ip/KeyboardCtrl_0/src/Ps2Interface.v" \
  "../../../../lab7_2.gen/sources_1/ip/KeyboardCtrl_0/src/KeyboardCtrl.v" \
  "../../../../lab7_2.gen/sources_1/ip/KeyboardCtrl_0/sim/KeyboardCtrl_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

