# es_r4
Programming the Renesas RA4M1 on the UNOWIFIR4 with pure C/C++ and its FSP 

!CURRENTLY ONLY TESTED ON LINUX!

Use "./builder.sh" to build the project and 

"./builder.sh U" to build and upload the project onto your UNOWIFIR4


### DEPENDENCIES:
Arduino Renesas Core: https://github.com/arduino/ArduinoCore-renesas

BOSSA Flash Programmer [ARDUINO]: https://github.com/shumatech/BOSSA/tree/arduino

arm-none-eabi toolchain: https://developer.arm.com/downloads/-/gnu-rm (you can also download it through a package manager)


### FEATURES:
- Really small bin sizes, thus faster uploads
- Stone cold FSP function calls
- BLINKING LEDS !!!
- Clangd support
