cmake_minimum_required(VERSION 3.5)

set(CMAKE_TRY_COMPILE_TARGET_TYPE "STATIC_LIBRARY")
project(es_r4)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(PROJECT_SRCS
  "main.cpp")

set(CMAKE_C_FLAGS "-mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized -Wall -Wextra -Wmissing-declarations -Wconversion -Wpointer-arith -Wshadow  -Wlogical-op -Waggregate-return -Wfloat-equal")
set(CMAKE_CXX_FLAGS "-mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized -Wall -Wextra -Wmissing-declarations -Wconversion -Wpointer-arith -Wshadow  -Wlogical-op -Waggregate-return -Wfloat-equal")

include_directories(
  "${ARDUINOCORE_RENESAS_UNOWIFIR4}/includes/ra/fsp/inc/"
  "${ARDUINOCORE_RENESAS_UNOWIFIR4}/includes/ra/fsp/inc/instances/"
  "${ARDUINOCORE_RENESAS_UNOWIFIR4}/includes/ra/fsp/inc/api/"
  "${ARDUINOCORE_RENESAS_UNOWIFIR4}/includes/ra_cfg/fsp_cfg/"
  "${ARDUINOCORE_RENESAS_UNOWIFIR4}/includes/ra_cfg/fsp_cfg/bsp/"
  "${ARDUINOCORE_RENESAS_UNOWIFIR4}/includes/ra_gen/"
  "${ARDUINOCORE_RENESAS_UNOWIFIR4}/includes/ra/arm/CMSIS_5/CMSIS/Core/Include/"
  )

link_directories(
  "${ARDUINOCORE_RENESAS_UNOWIFIR4}"
  "${ARDUINOCORE_RENESAS_UNOWIFIR4}/libs"
  )

add_link_options("SHELL:-Wl,--gc-sections --specs=nano.specs --specs=nosys.specs -lstdc++ -lsupc++ -lm -lc -lgcc -lnosys")
add_executable(es_r4.elf ${PROJECT_SRCS})
target_link_libraries(es_r4.elf -T "${ARDUINOCORE_RENESAS_UNOWIFIR4}/fsp.ld" fsp)
