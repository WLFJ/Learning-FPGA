-makelib ies_lib/xil_defaultlib -sv \
  "/home/yveswong/xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies_lib/xpm \
  "/home/yveswong/xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../ip_clk_wiz.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_clk_wiz.v" \
  "../../../../ip_clk_wiz.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

