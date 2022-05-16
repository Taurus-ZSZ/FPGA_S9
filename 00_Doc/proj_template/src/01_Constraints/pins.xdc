
set_property PACKAGE_PIN K17 [get_ports osc_clk]
set_property IOSTANDARD LVCMOS33 [get_ports osc_clk]

set_property PACKAGE_PIN M19 [get_ports {leds[0]}]
set_property PACKAGE_PIN M17 [get_ports {leds[1]}]
set_property PACKAGE_PIN F16 [get_ports {GPIO_0_0_tri_io[0]}]
set_property PACKAGE_PIN L19 [get_ports {GPIO_0_0_tri_io[1]}]

set_property IOSTANDARD LVCMOS33 [get_ports {leds[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_0_0_tri_io[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_0_0_tri_io[1]}]

# set_property PACKAGE_PIN U17 [get_ports {uart[0]}]
# set_property PACKAGE_PIN V15 [get_ports {rxd[0]}]
# set_property PACKAGE_PIN W15 [get_ports {rxd[1]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {uart[0]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {rxd[0]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {rxd[1]}]

create_clock -period 20.000 -name osc_clk -waveform {0.000 10.000} -add [get_ports osc_clk]
