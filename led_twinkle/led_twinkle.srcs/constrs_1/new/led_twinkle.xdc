set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]
set_property IOSTANDARD LVCMOS33 [get_ports sys_rst_n]
set_property PACKAGE_PIN L15 [get_ports {led[1]}]
set_property PACKAGE_PIN H15 [get_ports {led[0]}]
set_property PACKAGE_PIN U18 [get_ports sys_clk]
set_property PACKAGE_PIN N16 [get_ports sys_rst_n]

# 添加时钟约束
create_clock -name clk -period 20 [get_ports sys_clk]