#include <bsp_api.h>
#include <r_ioport.h>

int main() {
  R_IOPORT_PinCfg(NULL, BSP_IO_PORT_01_PIN_02,
                  IOPORT_CFG_PORT_DIRECTION_OUTPUT);

  bsp_io_level_t level = BSP_IO_LEVEL_LOW;
  while (1) {
    if (BSP_IO_LEVEL_LOW == level) {
      level = BSP_IO_LEVEL_HIGH;
    } else {
      level = BSP_IO_LEVEL_LOW;
    }
    R_IOPORT_PinWrite(NULL, BSP_IO_PORT_01_PIN_02, level);
    R_BSP_SoftwareDelay(400, BSP_DELAY_UNITS_MILLISECONDS);
  }
  return 0;
}
