# Copyright lowRISC contributors (OpenTitan project).
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
# Xilinx ZCU104 Evaluation Kit.

# FPGA Part
set_property PART xczu7ev-ffvc1156-2-e [current_project]
# Clock Signal - 125MHz Differential User Clock from Si570
set_property -dict { PACKAGE_PIN AD12 IOSTANDARD LVDS } [get_ports { SYS_CLK_P }]; # CLK_P, bank 28
set_property -dict { PACKAGE_PIN AD11 IOSTANDARD LVDS } [get_ports { SYS_CLK_N }]; # CLK_N, bank 28
# Clock constraints
create_clock -period 8.000 -name sys_clk [get_ports SYS_CLK_P]; # 125MHz
# Power-on Reset - Use push button SW2 (center) for POR_N
set_property -dict { PACKAGE_PIN AL11 IOSTANDARD LVCMOS33 PULLTYPE PULLUP } [get_ports { POR_N }]; # Bank 87, active low
# Configuration options
set_property CONFIG_VOLTAGE 1.8 [current_design]
set_property CFGBVS GND [current_design]
# MIOs (Muxed IO) - Map to PMOD JA for simple access (bank 65, VADJ=1.8V default, LVCMOS18)
# IOA bank - Example mappings; adjust as needed
set_property -dict { PACKAGE_PIN G19 IOSTANDARD LVCMOS18 } [get_ports { IOA0 }]; # UART2_RX on JA1
set_property -dict { PACKAGE_PIN G20 IOSTANDARD LVCMOS18 } [get_ports { IOA1 }]; # UART2_TX on JA2
set_property -dict { PACKAGE_PIN F19 IOSTANDARD LVCMOS18 } [get_ports { IOA2 }]; # GPIO on JA3
set_property -dict { PACKAGE_PIN F20 IOSTANDARD LVCMOS18 } [get_ports { IOA3 }]; # GPIO on JA4
set_property -dict { PACKAGE_PIN E18 IOSTANDARD LVCMOS18 } [get_ports { IOA4 }]; # UART3_RX on JA7
set_property -dict { PACKAGE_PIN D18 IOSTANDARD LVCMOS18 } [get_ports { IOA5 }]; # UART3_TX on JA8
set_property -dict { PACKAGE_PIN E19 IOSTANDARD LVCMOS18 } [get_ports { IOA6 }]; # GPIO on JA9
set_property -dict { PACKAGE_PIN D19 IOSTANDARD LVCMOS18 } [get_ports { IOA7 }]; # SPI_TPM_CSB/I2C_TARGET_SDA on JA10
set_property -dict { PACKAGE_PIN C20 IOSTANDARD LVCMOS18 } [get_ports { IOA8 }]; # I2C_TARGET_SCL (use nearby pin if extending)
# IOB bank - Map to PMOD JB or FMC for more IO (example to PMOD JB, bank 65)
set_property -dict { PACKAGE_PIN J19 IOSTANDARD LVCMOS18 } [get_ports { IOB0 }]; # SPI_HOST1_CSB on JB1
set_property -dict { PACKAGE_PIN J20 IOSTANDARD LVCMOS18 } [get_ports { IOB1 }]; # SPI_HOST1_CSB on JB2
set_property -dict { PACKAGE_PIN H20 IOSTANDARD LVCMOS18 } [get_ports { IOB2 }]; # SPI_HOST1_CSB on JB3
set_property -dict { PACKAGE_PIN G15 IOSTANDARD LVCMOS18 } [get_ports { IOB3 }]; # SPI_HOST1_CSB on JB4
set_property -dict { PACKAGE_PIN J18 IOSTANDARD LVCMOS18 } [get_ports { IOB4 }]; # UART1_RX on JB7
set_property -dict { PACKAGE_PIN H18 IOSTANDARD LVCMOS18 } [get_ports { IOB5 }]; # UART1_TX on JB8
set_property -dict { PACKAGE_PIN H17 IOSTANDARD LVCMOS18 } [get_ports { IOB6 }]; # GPIO on JB9
set_property -dict { PACKAGE_PIN H16 IOSTANDARD LVCMOS18 } [get_ports { IOB7 }]; # GPIO on JB10
set_property -dict { PACKAGE_PIN K17 IOSTANDARD LVCMOS18 } [get_ports { IOB8 }]; # GPIO (extend if needed)
set_property -dict { PACKAGE_PIN K18 IOSTANDARD LVCMOS18 } [get_ports { IOB9 }]; # I2C_HOST_SDA
set_property -dict { PACKAGE_PIN L17 IOSTANDARD LVCMOS18 } [get_ports { IOB10 }]; # I2C_HOST_SCL
set_property -dict { PACKAGE_PIN L18 IOSTANDARD LVCMOS18 } [get_ports { IOB11 }]; # I2C_HOST_SCL
set_property -dict { PACKAGE_PIN M17 IOSTANDARD LVCMOS18 } [get_ports { IOB12 }]; # I2C_HOST_SDA
# IOC bank - Straps and UART0 to PMOD or buttons
set_property -dict { PACKAGE_PIN K19 IOSTANDARD LVCMOS18 PULLTYPE PULLDOWN } [get_ports { IOC0 }]; # SW_STRAP0
set_property -dict { PACKAGE_PIN K20 IOSTANDARD LVCMOS18 PULLTYPE PULLDOWN } [get_ports { IOC1 }]; # SW_STRAP1
set_property -dict { PACKAGE_PIN J16 IOSTANDARD LVCMOS18 PULLTYPE PULLDOWN } [get_ports { IOC2 }]; # SW_STRAP2
set_property -dict { PACKAGE_PIN H19 IOSTANDARD LVCMOS18 } [get_ports { IOC3 }]; # UART0_RX
set_property -dict { PACKAGE_PIN G18 IOSTANDARD LVCMOS18 } [get_ports { IOC4 }]; # UART0_TX
set_property -dict { PACKAGE_PIN F17 IOSTANDARD LVCMOS18 PULLTYPE PULLDOWN } [get_ports { IOC5 }]; # TAP_STRAP1
set_property -dict { PACKAGE_PIN F16 IOSTANDARD LVCMOS18 } [get_ports { IOC6 }]; # GPIO
set_property -dict { PACKAGE_PIN E17 IOSTANDARD LVCMOS18 } [get_ports { IOC7 }]; # VBUS_DETECT (if USB)
set_property -dict { PACKAGE_PIN D17 IOSTANDARD LVCMOS18 PULLTYPE PULLDOWN } [get_ports { IOC8 }]; # TAP_STRAP0
set_property -dict { PACKAGE_PIN C17 IOSTANDARD LVCMOS18 } [get_ports { IOC9 }]; # GPIO
set_property -dict { PACKAGE_PIN B17 IOSTANDARD LVCMOS18 } [get_ports { IOC10 }]; # GPIO
set_property -dict { PACKAGE_PIN C18 IOSTANDARD LVCMOS18 } [get_ports { IOC11 }]; # GPIO
set_property -dict { PACKAGE_PIN C19 IOSTANDARD LVCMOS18 } [get_ports { IOC12 }]; # GPIO
# IOR bank - JTAG and GPIO to FMC or LEDs (bank 26 for LEDs)
# JTAG to FMC example (bank 65)
set_property -dict { PACKAGE_PIN A17 IOSTANDARD LVCMOS18 PULLTYPE PULLUP } [get_ports { IOR0 }]; # JTAG_TMS on FMC_LA00_P
set_property -dict { PACKAGE_PIN A18 IOSTANDARD LVCMOS18 PULLTYPE PULLUP } [get_ports { IOR1 }]; # JTAG_TDO on FMC_LA00_N
set_property -dict { PACKAGE_PIN B19 IOSTANDARD LVCMOS18 PULLTYPE PULLUP } [get_ports { IOR2 }]; # JTAG_TDI on FMC_LA01_P
set_property -dict { PACKAGE_PIN B20 IOSTANDARD LVCMOS18 PULLTYPE PULLUP } [get_ports { IOR3 }]; # JTAG_TCK on FMC_LA01_N
set_property -dict { PACKAGE_PIN A20 IOSTANDARD LVCMOS18 PULLTYPE PULLUP } [get_ports { IOR4 }]; # JTAG_TRSTn on FMC_LA02_P
set_property -dict { PACKAGE_PIN A19 IOSTANDARD LVCMOS18 } [get_ports { IOR5 }]; # DFT Strap 0 on FMC_LA02_N
set_property -dict { PACKAGE_PIN AP8 DRIVE 8 IOSTANDARD LVCMOS33 } [get_ports { IOR6 }]; # GPIO/LED on DS1 (bank 26)
set_property -dict { PACKAGE_PIN AN8 DRIVE 8 IOSTANDARD LVCMOS33 } [get_ports { IOR7 }]; # DFT Strap 1 on DS2
set_property -dict { PACKAGE_PIN AM8 DRIVE 8 IOSTANDARD LVCMOS33 } [get_ports { IOR8 }]; # GPIO/LED on DS3
set_property -dict { PACKAGE_PIN AL8 DRIVE 8 IOSTANDARD LVCMOS33 } [get_ports { IOR9 }]; # GPIO/LED on DS4
set_property -dict { PACKAGE_PIN AK8 DRIVE 8 IOSTANDARD LVCMOS33 } [get_ports { IOR10 }]; # GPIO on DS5
set_property -dict { PACKAGE_PIN AJ8 DRIVE 8 IOSTANDARD LVCMOS33 } [get_ports { IOR11 }]; # GPIO on DS6
set_property -dict { PACKAGE_PIN AH8 DRIVE 8 IOSTANDARD LVCMOS33 } [get_ports { IOR12 }]; # GPIO on DS7
set_property -dict { PACKAGE_PIN AG8 DRIVE 8 IOSTANDARD LVCMOS33 } [get_ports { IOR13 }]; # GPIO on DS8
# DIOs - Map SPI to FMC (example, bank 66, LVCMOS18)
# SPI device
set_property -dict { PACKAGE_PIN G10 IOSTANDARD LVCMOS18 } [get_ports { SPI_DEV_CLK }]; # FMC_LA17_CC_P
set_property -dict { PACKAGE_PIN F10 IOSTANDARD LVCMOS18 } [get_ports { SPI_DEV_D0 }]; # FMC_LA17_CC_N
set_property -dict { PACKAGE_PIN E10 IOSTANDARD LVCMOS18 } [get_ports { SPI_DEV_D1 }]; # FMC_LA18_CC_P
set_property -dict { PACKAGE_PIN D10 IOSTANDARD LVCMOS18 } [get_ports { SPI_DEV_D2 }]; # FMC_LA18_CC_N
set_property -dict { PACKAGE_PIN C11 IOSTANDARD LVCMOS18 } [get_ports { SPI_DEV_D3 }]; # FMC_LA19_P
set_property -dict { PACKAGE_PIN B11 IOSTANDARD LVCMOS18 } [get_ports { SPI_DEV_CS_L }]; # FMC_LA19_N
# SPI HOST
set_property -dict { PACKAGE_PIN A12 IOSTANDARD LVCMOS18 } [get_ports { SPI_HOST_CLK }]; # FMC_LA20_P
set_property -dict { PACKAGE_PIN A11 IOSTANDARD LVCMOS18 PULLTYPE PULLUP } [get_ports { SPI_HOST_D0 }]; # FMC_LA20_N
set_property -dict { PACKAGE_PIN B13 IOSTANDARD LVCMOS18 PULLTYPE PULLUP } [get_ports { SPI_HOST_D1 }]; # FMC_LA21_P
set_property -dict { PACKAGE_PIN A13 IOSTANDARD LVCMOS18 PULLTYPE PULLUP } [get_ports { SPI_HOST_D2 }]; # FMC_LA21_N
set_property -dict { PACKAGE_PIN C13 IOSTANDARD LVCMOS18 PULLTYPE PULLUP } [get_ports { SPI_HOST_D3 }]; # FMC_LA22_P
set_property -dict { PACKAGE_PIN C12 IOSTANDARD LVCMOS18 } [get_ports { SPI_HOST_CS_L }]; # FMC_LA22_N
# USB Emulation - If added in HJSON (example to FMC)
set_property -dict { PACKAGE_PIN D13 IOSTANDARD LVCMOS18 } [get_ports { IO_USB_DP_TX }]; # FMC_LA23_P
set_property -dict { PACKAGE_PIN D12 IOSTANDARD LVCMOS18 } [get_ports { IO_USB_DN_TX }]; # FMC_LA23_N
set_property -dict { PACKAGE_PIN E13 IOSTANDARD LVCMOS18 } [get_ports { IO_USB_DP_RX }]; # FMC_LA24_P
set_property -dict { PACKAGE_PIN E12 IOSTANDARD LVCMOS18 } [get_ports { IO_USB_DN_RX }]; # FMC_LA24_N
set_property -dict { PACKAGE_PIN F11 IOSTANDARD LVCMOS18 } [get_ports { IO_USB_CONNECT }]; # FMC_LA25_P
set_property -dict { PACKAGE_PIN E11 IOSTANDARD LVCMOS18 } [get_ports { IO_USB_OE_N }]; # FMC_LA25_N
set_property -dict { PACKAGE_PIN G11 IOSTANDARD LVCMOS18 } [get_ports { IO_USB_D_RX }]; # FMC_LA26_P
set_property -dict { PACKAGE_PIN F12 IOSTANDARD LVCMOS18 } [get_ports { IO_USB_SPEED }]; # FMC_LA26_N
set_property -dict { PACKAGE_PIN H11 IOSTANDARD LVCMOS18 } [get_ports { IO_USB_SUSPEND }]; # FMC_LA27_P
# Timing Constraints
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets SYS_CLK_P_IBUF]; # If non-dedicated routing needed
set_false_path -from [get_ports POR_N]; # Async reset
# Add more false paths or multicycle if timing issues arise during build.