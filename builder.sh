#!/bin/bash

#OPTIONS
#############################################################################################################################################################
#PATH TO arm-none-eabi BIN FOLDER
ARM_NONE_EABI_BIN_PATH="/home/user/.arduino15/packages/arduino/tools/arm-none-eabi-gcc/7-2017q4/bin"

#PATH TO SPECIAL ARDUINO BOSSAC PROGRAM
ARDUINO_BOSSAC_PATH="/home/user/.arduino15/packages/arduino/tools/bossac/1.9.1-arduino5"

#PATH TO THE ArduinoCore-renesas UNOWIFIR4 folder
ARDUINOCORE_RENESAS_VARIANT_UNOWIFIR4_PATH="/home/user/.arduino15/packages/arduino/hardware/renesas_uno/1.0.5/variants/UNOWIFIR4"

#NAME OF BIN
BIN_NAME="es_r4"

UNOWIFIR4_PORT="/dev/ttyACM0"
#############################################################################################################################################################

#cmake the project and put it all into the cmake folder
cmake -S . -B cmake/ -DCMAKE_C_COMPILER=$ARM_NONE_EABI_BIN_PATH/arm-none-eabi-gcc -DCMAKE_CXX_COMPILER=$ARM_NONE_EABI_BIN_PATH/arm-none-eabi-g++ -DARDUINOCORE_RENESAS_UNOWIFIR4:PATH=$ARDUINOCORE_RENESAS_VARIANT_UNOWIFIR4_PATH
#cd into the folder
cd cmake
#make the project
make

#compress and create bin
$ARM_NONE_EABI_BIN_PATH/arm-none-eabi-objcopy -O binary -j .text -j .data ./es_r4.elf ./$BIN_NAME.bin

echo "Binary size:"
echo | du -h ./$BIN_NAME.bin
if [[ $1 == U ]]; then
	echo "Baud touch......"
	#dir of the special arduino bossac programm
	$ARDUINO_BOSSAC_PATH/bossac --port=$UNOWIFIR4_PORT -a >/dev/null 2>&1
	$ARDUINO_BOSSAC_PATH/bossac --port=$UNOWIFIR4_PORT -d -U -e -w ./$BIN_NAME.bin -R
fi
