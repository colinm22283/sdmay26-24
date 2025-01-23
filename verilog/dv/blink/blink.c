#include <defs.h>
#include <stub.h>

void main() {
  // Set GPIO output
  reg_gpio_mode1 = 1;
  reg_gpio_mode0 = 0;
  reg_gpio_ien   = 1;
  reg_gpio_oe    = 1;

  // uint32_t * test = (uint32_t *) 0x100;
  // *test = 1;

  for (int i = 0; i < 10; i++) {
    reg_gpio_out   = 1; // ON
    delay_ms(1);

    reg_gpio_out   = 0; // OFF
    delay_ms(1);

    reg_gpio_out   = 1;
    delay_ms(1);

    reg_gpio_out   = 0;
    delay_ms(1);
  }

  simulation_pass();
}
