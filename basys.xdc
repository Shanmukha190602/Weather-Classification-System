# ====================================================================================
# Updated Basys3 Constraints for DHT11 + LCD Display
# ====================================================================================

# System Clock - 100MHz
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.0 [get_ports clk]

# Reset Button (BTNU)
set_property PACKAGE_PIN U18 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

# DHT11 Data Pin (PMOD JA1)
set_property PACKAGE_PIN J1 [get_ports dht11_data]
set_property IOSTANDARD LVCMOS33 [get_ports dht11_data]

# LEDs (Keep existing assignments)
set_property PACKAGE_PIN U16 [get_ports {led[15]}]
set_property PACKAGE_PIN E19 [get_ports {led[14]}]
set_property PACKAGE_PIN U19 [get_ports {led[13]}]
set_property PACKAGE_PIN V19 [get_ports {led[12]}]
set_property PACKAGE_PIN W18 [get_ports {led[11]}]
set_property PACKAGE_PIN U15 [get_ports {led[10]}]
set_property PACKAGE_PIN U14 [get_ports {led[9]}]
set_property PACKAGE_PIN L1 [get_ports {led[0]}]
set_property PACKAGE_PIN P1 [get_ports {led[1]}]
set_property PACKAGE_PIN N3 [get_ports {led[2]}]
set_property PACKAGE_PIN P3 [get_ports {led[3]}]
set_property PACKAGE_PIN U3 [get_ports {led[4]}]
set_property PACKAGE_PIN W3 [get_ports {led[5]}]
set_property PACKAGE_PIN V3 [get_ports {led[6]}]
set_property PACKAGE_PIN V13 [get_ports {led[7]}]
set_property PACKAGE_PIN V14 [get_ports {led[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}                                                                                                       ]

# LCD Display Pins (Using PMOD JB and JC)
# LCD Register Select - PMOD JB1
set_property PACKAGE_PIN A14 [get_ports lcd_rs]
set_property IOSTANDARD LVCMOS33 [get_ports lcd_rs]

# LCD Enable - PMOD JB2  
set_property PACKAGE_PIN A16 [get_ports lcd_en]
set_property IOSTANDARD LVCMOS33 [get_ports lcd_en]

# LCD Data Bus (8-bit) - PMOD JB3,JB4,JB7,JB8,JB9,JB10 + PMOD JC1,JC2
set_property PACKAGE_PIN B15 [get_ports {lcd_data[0]}]  
set_property PACKAGE_PIN B16 [get_ports {lcd_data[1]}]  
set_property PACKAGE_PIN A15 [get_ports {lcd_data[2]}]  
set_property PACKAGE_PIN A17 [get_ports {lcd_data[3]}]  
set_property PACKAGE_PIN C15 [get_ports {lcd_data[4]}] 
set_property PACKAGE_PIN C16 [get_ports {lcd_data[5]}]  
set_property PACKAGE_PIN K17 [get_ports {lcd_data[6]}]  
set_property PACKAGE_PIN M18 [get_ports {lcd_data[7]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {lcd_data[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lcd_data[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lcd_data[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lcd_data[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lcd_data[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lcd_data[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lcd_data[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lcd_data[7]}]

# ====================================================================================
# Pin Assignment Summary:
# DHT11 Sensor: PMOD JA1 (J1)
# LCD Control: PMOD JB1-JB2 (A14, A16) 
# LCD Data: PMOD JB3,JB4,JB7-JB10,JC1,JC2 (B15,B16,A15,A17,C15,C16,K17,M18)
# ====================================================================================

# UART to PuTTY Terminal (USB-UART Bridge)
set_property PACKAGE_PIN A18 [get_ports uart_txd]
set_property IOSTANDARD LVCMOS33 [get_ports uart_txd]