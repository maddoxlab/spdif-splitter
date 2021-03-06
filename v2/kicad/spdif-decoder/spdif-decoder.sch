EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:DB25_Female J1
U 1 1 6078C8A8
P 7450 3300
F 0 "J1" H 7630 3346 50  0000 L CNN
F 1 "DB25_Female" H 7630 3255 50  0000 L CNN
F 2 "Connector_Dsub:DSUB-25_Female_Horizontal_P2.77x2.84mm_EdgePinOffset9.90mm_Housed_MountingHolesOffset11.32mm" H 7450 3300 50  0001 C CNN
F 3 " ~" H 7450 3300 50  0001 C CNN
	1    7450 3300
	1    0    0    -1  
$EndComp
Text GLabel 4300 3400 0    50   Input ~ 0
SHIFT_ENABLE
Text GLabel 4300 3300 0    50   Input ~ 0
LATCH
Text GLabel 4300 3000 0    50   Input ~ 0
SPI_CLK
Text GLabel 4300 3100 0    50   Input ~ 0
REG_CLEAR
$Comp
L power:GND #PWR0105
U 1 1 6082792F
P 4700 3950
F 0 "#PWR0105" H 4700 3700 50  0001 C CNN
F 1 "GND" H 4705 3777 50  0000 C CNN
F 2 "" H 4700 3950 50  0001 C CNN
F 3 "" H 4700 3950 50  0001 C CNN
	1    4700 3950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0106
U 1 1 6082983E
P 4700 2600
F 0 "#PWR0106" H 4700 2450 50  0001 C CNN
F 1 "+5V" V 4715 2728 50  0000 L CNN
F 2 "" H 4700 2600 50  0001 C CNN
F 3 "" H 4700 2600 50  0001 C CNN
	1    4700 2600
	0    1    1    0   
$EndComp
Text GLabel 4300 1200 0    50   Input ~ 0
REG_CLEAR
Text GLabel 4300 1100 0    50   Input ~ 0
SPI_CLK
Text GLabel 4300 1400 0    50   Input ~ 0
LATCH
Text GLabel 4300 1500 0    50   Input ~ 0
SHIFT_ENABLE
Text GLabel 4300 900  0    50   Input ~ 0
SPI_MOSI
$Comp
L power:+5V #PWR0103
U 1 1 607CA876
P 4700 700
F 0 "#PWR0103" H 4700 550 50  0001 C CNN
F 1 "+5V" V 4715 828 50  0000 L CNN
F 2 "" H 4700 700 50  0001 C CNN
F 3 "" H 4700 700 50  0001 C CNN
	1    4700 700 
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 607BBBBB
P 4700 2050
F 0 "#PWR0102" H 4700 1800 50  0001 C CNN
F 1 "GND" H 4705 1877 50  0000 C CNN
F 2 "" H 4700 2050 50  0001 C CNN
F 3 "" H 4700 2050 50  0001 C CNN
	1    4700 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 2300 4300 2300
Wire Wire Line
	5100 4250 4300 4250
Wire Wire Line
	5100 1300 6200 1300
Wire Wire Line
	5100 1400 6150 1400
Wire Wire Line
	5100 1500 6100 1500
Wire Wire Line
	5100 1600 6050 1600
Wire Wire Line
	5100 2800 6000 2800
Wire Wire Line
	5100 2900 5950 2900
Wire Wire Line
	5100 3000 5900 3000
Wire Wire Line
	5100 3100 5850 3100
Wire Wire Line
	5100 3200 5800 3200
Wire Wire Line
	5100 3300 5750 3300
$Comp
L Device:C C1
U 1 1 608C9708
P 4300 2050
F 0 "C1" V 4048 2050 50  0000 C CNN
F 1 "0.1u" V 4139 2050 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 4338 1900 50  0001 C CNN
F 3 "~" H 4300 2050 50  0001 C CNN
	1    4300 2050
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0109
U 1 1 608CFD34
P 4100 2050
F 0 "#PWR0109" H 4100 1900 50  0001 C CNN
F 1 "+5V" H 4115 2223 50  0000 C CNN
F 2 "" H 4100 2050 50  0001 C CNN
F 3 "" H 4100 2050 50  0001 C CNN
	1    4100 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 608D6F66
P 4300 3950
F 0 "C2" V 4048 3950 50  0000 C CNN
F 1 "0.1u" V 4139 3950 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 4338 3800 50  0001 C CNN
F 3 "~" H 4300 3950 50  0001 C CNN
	1    4300 3950
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0110
U 1 1 608DF064
P 4100 3950
F 0 "#PWR0110" H 4100 3800 50  0001 C CNN
F 1 "+5V" H 4115 4123 50  0000 C CNN
F 2 "" H 4100 3950 50  0001 C CNN
F 3 "" H 4100 3950 50  0001 C CNN
	1    4100 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D3
U 1 1 60940EE2
P 2200 1650
F 0 "D3" V 2147 1730 50  0000 L CNN
F 1 "LED" V 2238 1730 50  0000 L CNN
F 2 "LED_THT:LED_D3.0mm" H 2200 1650 50  0001 C CNN
F 3 "~" H 2200 1650 50  0001 C CNN
	1    2200 1650
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 609411DE
P 2200 1000
F 0 "#PWR0114" H 2200 750 50  0001 C CNN
F 1 "GND" H 2205 827 50  0000 C CNN
F 2 "" H 2200 1000 50  0001 C CNN
F 3 "" H 2200 1000 50  0001 C CNN
	1    2200 1000
	-1   0    0    1   
$EndComp
$Comp
L Device:R R3
U 1 1 609411E8
P 2200 1250
F 0 "R3" H 2270 1296 50  0000 L CNN
F 1 "560" H 2270 1205 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 2130 1250 50  0001 C CNN
F 3 "~" H 2200 1250 50  0001 C CNN
	1    2200 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 1000 2200 1100
Wire Wire Line
	2200 1400 2200 1500
Wire Wire Line
	2500 1400 2500 1500
Wire Wire Line
	2500 1000 2500 1100
$Comp
L Device:R R4
U 1 1 6094A38B
P 2500 1250
F 0 "R4" H 2570 1296 50  0000 L CNN
F 1 "560" H 2570 1205 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 2430 1250 50  0001 C CNN
F 3 "~" H 2500 1250 50  0001 C CNN
	1    2500 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 6094A381
P 2500 1000
F 0 "#PWR0115" H 2500 750 50  0001 C CNN
F 1 "GND" H 2505 827 50  0000 C CNN
F 2 "" H 2500 1000 50  0001 C CNN
F 3 "" H 2500 1000 50  0001 C CNN
	1    2500 1000
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D4
U 1 1 6094A05D
P 2500 1650
F 0 "D4" V 2447 1730 50  0000 L CNN
F 1 "LED" V 2538 1730 50  0000 L CNN
F 2 "LED_THT:LED_D3.0mm" H 2500 1650 50  0001 C CNN
F 3 "~" H 2500 1650 50  0001 C CNN
	1    2500 1650
	0    1    1    0   
$EndComp
$Comp
L Device:LED D5
U 1 1 60979DE3
P 2800 1650
F 0 "D5" V 2747 1730 50  0000 L CNN
F 1 "LED" V 2838 1730 50  0000 L CNN
F 2 "LED_THT:LED_D3.0mm" H 2800 1650 50  0001 C CNN
F 3 "~" H 2800 1650 50  0001 C CNN
	1    2800 1650
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 60979F79
P 2800 1000
F 0 "#PWR0116" H 2800 750 50  0001 C CNN
F 1 "GND" H 2805 827 50  0000 C CNN
F 2 "" H 2800 1000 50  0001 C CNN
F 3 "" H 2800 1000 50  0001 C CNN
	1    2800 1000
	-1   0    0    1   
$EndComp
$Comp
L Device:R R5
U 1 1 60979F83
P 2800 1250
F 0 "R5" H 2870 1296 50  0000 L CNN
F 1 "560" H 2870 1205 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 2730 1250 50  0001 C CNN
F 3 "~" H 2800 1250 50  0001 C CNN
	1    2800 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 1000 2800 1100
Wire Wire Line
	2800 1400 2800 1500
Wire Wire Line
	3100 1400 3100 1500
Wire Wire Line
	3100 1000 3100 1100
$Comp
L Device:R R6
U 1 1 60979F91
P 3100 1250
F 0 "R6" H 3170 1296 50  0000 L CNN
F 1 "560" H 3170 1205 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 3030 1250 50  0001 C CNN
F 3 "~" H 3100 1250 50  0001 C CNN
	1    3100 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 60979F9B
P 3100 1000
F 0 "#PWR0117" H 3100 750 50  0001 C CNN
F 1 "GND" H 3105 827 50  0000 C CNN
F 2 "" H 3100 1000 50  0001 C CNN
F 3 "" H 3100 1000 50  0001 C CNN
	1    3100 1000
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D6
U 1 1 60979FA5
P 3100 1650
F 0 "D6" V 3047 1730 50  0000 L CNN
F 1 "LED" V 3138 1730 50  0000 L CNN
F 2 "LED_THT:LED_D3.0mm" H 3100 1650 50  0001 C CNN
F 3 "~" H 3100 1650 50  0001 C CNN
	1    3100 1650
	0    1    1    0   
$EndComp
$Comp
L Device:C C5
U 1 1 609B2731
P 1350 7150
F 0 "C5" V 1098 7150 50  0000 C CNN
F 1 "0.1u" V 1189 7150 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 1388 7000 50  0001 C CNN
F 3 "~" H 1350 7150 50  0001 C CNN
	1    1350 7150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 609B343C
P 1050 6950
F 0 "#PWR0118" H 1050 6700 50  0001 C CNN
F 1 "GND" H 1055 6777 50  0000 C CNN
F 2 "" H 1050 6950 50  0001 C CNN
F 3 "" H 1050 6950 50  0001 C CNN
	1    1050 6950
	1    0    0    -1  
$EndComp
Text GLabel 1100 6700 0    50   Input ~ 0
SPDIF_IN
Wire Wire Line
	4150 2050 4100 2050
Wire Wire Line
	4150 3950 4100 3950
Text Notes 2300 750  0    50   ~ 0
Bit 0-3 indicators
Wire Wire Line
	1600 7250 1200 7250
Wire Wire Line
	1600 7150 1500 7150
Connection ~ 1200 7250
$Comp
L power:+5V #PWR0120
U 1 1 60AEE821
P 600 7250
F 0 "#PWR0120" H 600 7100 50  0001 C CNN
F 1 "+5V" H 615 7423 50  0000 C CNN
F 2 "" H 600 7250 50  0001 C CNN
F 3 "" H 600 7250 50  0001 C CNN
	1    600  7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	700  7250 600  7250
Text Notes 900  750  0    50   ~ 0
Status indicators
Text GLabel 1450 1900 3    50   Input ~ 0
LED_SPDIF
Text GLabel 1000 1900 3    50   Input ~ 0
LED_POW
Wire Wire Line
	1450 1800 1450 1900
Wire Wire Line
	1450 1400 1450 1500
Wire Wire Line
	1450 1000 1450 1100
$Comp
L Device:R R2
U 1 1 60915BC2
P 1450 1250
F 0 "R2" H 1520 1296 50  0000 L CNN
F 1 "560" H 1520 1205 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 1380 1250 50  0001 C CNN
F 3 "~" H 1450 1250 50  0001 C CNN
	1    1450 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 60915BB8
P 1450 1000
F 0 "#PWR0113" H 1450 750 50  0001 C CNN
F 1 "GND" H 1455 827 50  0000 C CNN
F 2 "" H 1450 1000 50  0001 C CNN
F 3 "" H 1450 1000 50  0001 C CNN
	1    1450 1000
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D2
U 1 1 60915934
P 1450 1650
F 0 "D2" V 1397 1730 50  0000 L CNN
F 1 "LED" V 1488 1730 50  0000 L CNN
F 2 "LED_THT:LED_D3.0mm" H 1450 1650 50  0001 C CNN
F 3 "~" H 1450 1650 50  0001 C CNN
	1    1450 1650
	0    1    1    0   
$EndComp
Wire Wire Line
	1000 1800 1000 1900
Wire Wire Line
	1000 1400 1000 1500
Wire Wire Line
	1000 1000 1000 1100
$Comp
L Device:R R1
U 1 1 607D055C
P 1000 1250
F 0 "R1" H 1070 1296 50  0000 L CNN
F 1 "560" H 1070 1205 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 930 1250 50  0001 C CNN
F 3 "~" H 1000 1250 50  0001 C CNN
	1    1000 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 607D4B34
P 1000 1000
F 0 "#PWR0104" H 1000 750 50  0001 C CNN
F 1 "GND" H 1005 827 50  0000 C CNN
F 2 "" H 1000 1000 50  0001 C CNN
F 3 "" H 1000 1000 50  0001 C CNN
	1    1000 1000
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D1
U 1 1 607CE000
P 1000 1650
F 0 "D1" V 947 1730 50  0000 L CNN
F 1 "LED" V 1038 1730 50  0000 L CNN
F 2 "LED_THT:LED_D3.0mm" H 1000 1650 50  0001 C CNN
F 3 "~" H 1000 1650 50  0001 C CNN
	1    1000 1650
	0    1    1    0   
$EndComp
Text GLabel 3000 3750 2    50   Input ~ 0
SPDIF_IN
Text GLabel 3000 3650 2    50   Input ~ 0
LED_POW
Text GLabel 3000 3550 2    50   Input ~ 0
LED_SPDIF
$Comp
L power:GND #PWR0112
U 1 1 608E33F8
P 3000 5850
F 0 "#PWR0112" H 3000 5600 50  0001 C CNN
F 1 "GND" H 3005 5677 50  0000 C CNN
F 2 "" H 3000 5850 50  0001 C CNN
F 3 "" H 3000 5850 50  0001 C CNN
	1    3000 5850
	1    0    0    -1  
$EndComp
Text GLabel 3000 4950 2    50   Input ~ 0
REG_CLEAR
Text GLabel 3000 3950 2    50   Input ~ 0
SPI_CLK
Text GLabel 3000 4850 2    50   Input ~ 0
SHIFT_ENABLE
Text GLabel 3000 4750 2    50   Input ~ 0
LATCH
Text GLabel 3000 4650 2    50   Input ~ 0
SPI_MOSI
$Comp
L power:+5V #PWR0101
U 1 1 6076A88B
P 650 3550
F 0 "#PWR0101" H 650 3400 50  0001 C CNN
F 1 "+5V" H 665 3723 50  0000 C CNN
F 2 "" H 650 3550 50  0001 C CNN
F 3 "" H 650 3550 50  0001 C CNN
	1    650  3550
	1    0    0    -1  
$EndComp
$Comp
L teensy:Teensy4.0 U1
U 1 1 60766359
P 1900 4500
F 0 "U1" H 1900 6115 50  0000 C CNN
F 1 "Teensy4.0" H 1900 6024 50  0000 C CNN
F 2 "teensy:Teensy40" H 1500 4700 50  0001 C CNN
F 3 "" H 1500 4700 50  0001 C CNN
	1    1900 4500
	-1   0    0    1   
$EndComp
Wire Wire Line
	1600 6700 1600 7050
Wire Wire Line
	800  3550 650  3550
$Comp
L 74xx:74AHCT595 U4
U 1 1 607EA2BB
P 4700 5200
F 0 "U4" H 4700 5981 50  0000 C CNN
F 1 "74AHCT595" H 4700 5890 50  0000 C CNN
F 2 "digikey-footprints:DIP-16_W7.62mm" H 4700 5200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74AHC_AHCT595.pdf" H 4700 5200 50  0001 C CNN
	1    4700 5200
	1    0    0    -1  
$EndComp
Text GLabel 4300 5100 0    50   Input ~ 0
REG_CLEAR
Text GLabel 4300 5000 0    50   Input ~ 0
SPI_CLK
Text GLabel 4300 5300 0    50   Input ~ 0
LATCH
Text GLabel 4300 5400 0    50   Input ~ 0
SHIFT_ENABLE
$Comp
L power:+5V #PWR0123
U 1 1 6084B299
P 4700 4600
F 0 "#PWR0123" H 4700 4450 50  0001 C CNN
F 1 "+5V" V 4715 4728 50  0000 L CNN
F 2 "" H 4700 4600 50  0001 C CNN
F 3 "" H 4700 4600 50  0001 C CNN
	1    4700 4600
	0    1    1    0   
$EndComp
$Comp
L Device:C C3
U 1 1 60850845
P 4250 5900
F 0 "C3" V 3998 5900 50  0000 C CNN
F 1 "0.1u" V 4089 5900 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 4288 5750 50  0001 C CNN
F 3 "~" H 4250 5900 50  0001 C CNN
	1    4250 5900
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0124
U 1 1 60850F6F
P 4050 5900
F 0 "#PWR0124" H 4050 5750 50  0001 C CNN
F 1 "+5V" H 4065 6073 50  0000 C CNN
F 2 "" H 4050 5900 50  0001 C CNN
F 3 "" H 4050 5900 50  0001 C CNN
	1    4050 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 5900 4700 5900
Wire Wire Line
	4050 5900 4100 5900
$Comp
L power:GND #PWR0107
U 1 1 6088A877
P 4700 5900
F 0 "#PWR0107" H 4700 5650 50  0001 C CNN
F 1 "GND" H 4705 5727 50  0000 C CNN
F 2 "" H 4700 5900 50  0001 C CNN
F 3 "" H 4700 5900 50  0001 C CNN
	1    4700 5900
	1    0    0    -1  
$EndComp
Connection ~ 4700 5900
$Comp
L 74xx:74AHCT595 U3
U 1 1 608DDA09
P 4700 3200
F 0 "U3" H 4700 3981 50  0000 C CNN
F 1 "74AHCT595" H 4700 3890 50  0000 C CNN
F 2 "digikey-footprints:DIP-16_W7.62mm" H 4700 3200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74AHC_AHCT595.pdf" H 4700 3200 50  0001 C CNN
	1    4700 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 3900 4700 3950
Connection ~ 4700 3950
Wire Wire Line
	4300 2300 4300 2800
Wire Wire Line
	4300 4250 4300 4800
Wire Wire Line
	5100 3700 5100 4250
$Comp
L 74xx:74AHCT595 U2
U 1 1 609D5E97
P 4700 1300
F 0 "U2" H 4700 2081 50  0000 C CNN
F 1 "74AHCT595" H 4700 1990 50  0000 C CNN
F 2 "digikey-footprints:DIP-16_W7.62mm" H 4700 1300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74AHC_AHCT595.pdf" H 4700 1300 50  0001 C CNN
	1    4700 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 1800 5100 2300
Wire Wire Line
	4450 2050 4700 2050
Wire Wire Line
	4700 2000 4700 2050
Connection ~ 4700 2050
Wire Wire Line
	4450 3950 4700 3950
Text Notes 1800 6600 0    50   ~ 0
TOSLINK S/PDIF input 
Wire Wire Line
	5100 900  6400 900 
Wire Wire Line
	5100 1000 6350 1000
Wire Wire Line
	5100 1100 6300 1100
Wire Wire Line
	5100 1200 6250 1200
Wire Wire Line
	6400 900  6400 2100
Wire Wire Line
	6400 2100 7150 2100
Wire Wire Line
	6350 1000 6350 2300
Wire Wire Line
	6350 2300 7150 2300
Wire Wire Line
	6300 1100 6300 2500
Wire Wire Line
	6300 2500 7150 2500
Wire Wire Line
	6250 1200 6250 2700
Wire Wire Line
	6250 2700 7150 2700
Wire Wire Line
	6200 1300 6200 2900
Wire Wire Line
	6200 2900 7150 2900
Wire Wire Line
	6150 1400 6150 3100
Wire Wire Line
	6150 3100 7150 3100
Wire Wire Line
	6100 1500 6100 3300
Wire Wire Line
	6100 3300 7150 3300
Wire Wire Line
	6050 1600 6050 3500
Wire Wire Line
	6000 2800 6000 3700
Wire Wire Line
	6000 3700 7150 3700
Wire Wire Line
	5950 2900 5950 3900
Wire Wire Line
	5950 3900 7150 3900
Wire Wire Line
	5900 3000 5900 4100
Wire Wire Line
	5900 4100 7150 4100
Wire Wire Line
	5850 3100 5850 4300
Wire Wire Line
	5850 4300 7150 4300
Wire Wire Line
	5800 3200 5800 4500
Wire Wire Line
	5800 4500 7150 4500
Wire Wire Line
	5750 3300 5750 3250
Wire Wire Line
	5750 3250 6400 3250
Wire Wire Line
	6400 3250 6400 2200
Wire Wire Line
	6400 2200 7150 2200
Wire Wire Line
	6450 3400 6450 2400
Wire Wire Line
	6450 2400 7150 2400
Wire Wire Line
	5100 3400 6450 3400
Wire Wire Line
	6050 3500 7150 3500
Wire Wire Line
	5100 3500 5650 3500
Wire Wire Line
	5650 3500 5650 3450
Wire Wire Line
	5650 3450 6500 3450
Wire Wire Line
	6500 3450 6500 2600
Wire Wire Line
	6500 2600 7150 2600
Wire Wire Line
	6550 4800 6550 2800
Wire Wire Line
	6550 2800 7150 2800
Wire Wire Line
	5100 4800 6550 4800
Wire Wire Line
	6600 4900 6600 3000
Wire Wire Line
	6600 3000 7150 3000
Wire Wire Line
	5100 4900 6600 4900
Wire Wire Line
	6650 5000 6650 3200
Wire Wire Line
	6650 3200 7150 3200
Wire Wire Line
	5100 5000 6650 5000
Wire Wire Line
	6700 5100 6700 3400
Wire Wire Line
	6700 3400 7150 3400
Wire Wire Line
	5100 5100 6700 5100
Wire Wire Line
	6750 5200 6750 3600
Wire Wire Line
	6750 3600 7150 3600
Wire Wire Line
	5100 5200 6750 5200
Wire Wire Line
	6800 5300 6800 3800
Wire Wire Line
	6800 3800 7150 3800
Wire Wire Line
	5100 5300 6800 5300
Wire Wire Line
	6850 5400 6850 4000
Wire Wire Line
	6850 4000 7150 4000
Wire Wire Line
	5100 5400 6850 5400
Wire Wire Line
	6900 5500 6900 4200
Wire Wire Line
	6900 4200 7150 4200
Wire Wire Line
	5100 5500 6900 5500
$Comp
L 74xx:74AHCT595 U5
U 1 1 61367A0F
P 4700 7000
F 0 "U5" H 4700 7781 50  0000 C CNN
F 1 "74AHCT595" H 4700 7690 50  0000 C CNN
F 2 "digikey-footprints:DIP-16_W7.62mm" H 4700 7000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74AHC_AHCT595.pdf" H 4700 7000 50  0001 C CNN
	1    4700 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 5700 5100 6150
Wire Wire Line
	5100 6150 4300 6150
Wire Wire Line
	4300 6150 4300 6600
Text GLabel 4300 6800 0    50   Input ~ 0
SPI_CLK
Text GLabel 4300 6900 0    50   Input ~ 0
REG_CLEAR
Text GLabel 4300 7100 0    50   Input ~ 0
LATCH
Text GLabel 4300 7200 0    50   Input ~ 0
SHIFT_ENABLE
$Comp
L power:GND #PWR0108
U 1 1 61382C93
P 4700 7700
F 0 "#PWR0108" H 4700 7450 50  0001 C CNN
F 1 "GND" H 4705 7527 50  0000 C CNN
F 2 "" H 4700 7700 50  0001 C CNN
F 3 "" H 4700 7700 50  0001 C CNN
	1    4700 7700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 61383278
P 4250 7700
F 0 "C4" V 3998 7700 50  0000 C CNN
F 1 "0.1u" V 4089 7700 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 4288 7550 50  0001 C CNN
F 3 "~" H 4250 7700 50  0001 C CNN
	1    4250 7700
	0    1    1    0   
$EndComp
Wire Wire Line
	4400 7700 4700 7700
Connection ~ 4700 7700
$Comp
L power:+5V #PWR0111
U 1 1 6138B5ED
P 4050 7700
F 0 "#PWR0111" H 4050 7550 50  0001 C CNN
F 1 "+5V" H 4065 7873 50  0000 C CNN
F 2 "" H 4050 7700 50  0001 C CNN
F 3 "" H 4050 7700 50  0001 C CNN
	1    4050 7700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 7700 4050 7700
$Comp
L _Mouser:TORX1350A_F_ J2
U 1 1 613A56FE
P 1600 7050
F 0 "J2" H 2200 7315 50  0000 C CNN
F 1 "TORX1350A_F_" H 2200 7224 50  0000 C CNN
F 2 "TORX1350AF" H 2650 7150 50  0001 L CNN
F 3 "" H 2650 7050 50  0001 L CNN
F 4 "Fiber Optic Transmitters, Receivers, Transceivers GP Optical Module 10Mb 4.75V-5.25V" H 2650 6950 50  0001 L CNN "Description"
F 5 "8.8" H 2650 6850 50  0001 L CNN "Height"
F 6 "757-TORX1350AF" H 2650 6750 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.co.uk/ProductDetail/Toshiba/TORX1350AF/?qs=gev7jUp%252BQ%252BijxLReoxEUyA%3D%3D" H 2650 6650 50  0001 L CNN "Mouser Price/Stock"
F 8 "Toshiba" H 2650 6550 50  0001 L CNN "Manufacturer_Name"
F 9 "TORX1350A(F)" H 2650 6450 50  0001 L CNN "Manufacturer_Part_Number"
	1    1600 7050
	1    0    0    -1  
$EndComp
Text Notes 950  7650 0    50   ~ 0
Cap within 7 mm of pins
$Comp
L Device:L L1
U 1 1 609B2E8B
P 850 7250
F 0 "L1" V 669 7250 50  0000 C CNN
F 1 "47u" V 760 7250 50  0000 C CNN
F 2 "Inductor_THT:L_Axial_L5.3mm_D2.2mm_P2.54mm_Vertical_Vishay_IM-1" H 850 7250 50  0001 C CNN
F 3 "~" H 850 7250 50  0001 C CNN
	1    850  7250
	0    1    1    0   
$EndComp
NoConn ~ 2800 7050
NoConn ~ 2800 7150
Wire Wire Line
	5100 6600 6950 6600
Wire Wire Line
	6950 6600 6950 4400
Wire Wire Line
	6950 4400 7150 4400
Text GLabel 2200 1900 3    50   Input ~ 0
LED_BIT0
Text GLabel 2500 1900 3    50   Input ~ 0
LED_BIT1
Text GLabel 2800 1900 3    50   Input ~ 0
LED_BIT2
Text GLabel 3100 1900 3    50   Input ~ 0
LED_BIT3
Wire Wire Line
	2200 1800 2200 1900
Wire Wire Line
	2500 1800 2500 1900
Wire Wire Line
	2800 1800 2800 1900
Wire Wire Line
	3100 1800 3100 1900
Text GLabel 5100 6700 2    50   Input ~ 0
LED_BIT0
Text GLabel 5100 6800 2    50   Input ~ 0
LED_BIT1
Text GLabel 5100 6900 2    50   Input ~ 0
LED_BIT2
Text GLabel 5100 7000 2    50   Input ~ 0
LED_BIT3
$Comp
L power:GND #PWR0119
U 1 1 6147FA9C
P 7750 1100
F 0 "#PWR0119" H 7750 850 50  0001 C CNN
F 1 "GND" H 7755 927 50  0000 C CNN
F 2 "" H 7750 1100 50  0001 C CNN
F 3 "" H 7750 1100 50  0001 C CNN
	1    7750 1100
	1    0    0    -1  
$EndComp
Text GLabel 7350 1100 0    50   Input ~ 0
CONFIG
Text GLabel 3000 5250 2    50   Input ~ 0
CONFIG
$Comp
L Switch:SW_Push SW1
U 1 1 614ACBC6
P 7550 1100
F 0 "SW1" H 7550 1385 50  0000 C CNN
F 1 "SW_Push" H 7550 1294 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 7550 1300 50  0001 C CNN
F 3 "~" H 7550 1300 50  0001 C CNN
	1    7550 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 6700 1600 6700
Wire Wire Line
	1000 7250 1200 7250
Wire Wire Line
	1200 7250 1200 7150
Wire Wire Line
	1500 7150 1500 6800
Wire Wire Line
	1500 6800 1050 6800
Wire Wire Line
	1050 6800 1050 6950
Connection ~ 1500 7150
$Comp
L power:+5V #PWR0121
U 1 1 61576106
P 4700 6400
F 0 "#PWR0121" H 4700 6250 50  0001 C CNN
F 1 "+5V" V 4715 6528 50  0000 L CNN
F 2 "" H 4700 6400 50  0001 C CNN
F 3 "" H 4700 6400 50  0001 C CNN
	1    4700 6400
	0    1    1    0   
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 61594C32
P 9100 1300
F 0 "H1" H 9200 1346 50  0000 L CNN
F 1 "MountingHole" H 9200 1255 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9100 1300 50  0001 C CNN
F 3 "~" H 9100 1300 50  0001 C CNN
	1    9100 1300
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 615C6999
P 9100 1500
F 0 "H2" H 9200 1546 50  0000 L CNN
F 1 "MountingHole" H 9200 1455 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9100 1500 50  0001 C CNN
F 3 "~" H 9100 1500 50  0001 C CNN
	1    9100 1500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 615C6C1B
P 9100 1700
F 0 "H3" H 9200 1746 50  0000 L CNN
F 1 "MountingHole" H 9200 1655 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9100 1700 50  0001 C CNN
F 3 "~" H 9100 1700 50  0001 C CNN
	1    9100 1700
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 615C6ECB
P 9100 1900
F 0 "H4" H 9200 1946 50  0000 L CNN
F 1 "MountingHole" H 9200 1855 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9100 1900 50  0001 C CNN
F 3 "~" H 9100 1900 50  0001 C CNN
	1    9100 1900
	1    0    0    -1  
$EndComp
Text Notes 7050 750  0    50   ~ 0
Configuration boot switch
$EndSCHEMATC
