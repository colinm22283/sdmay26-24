#include <defs.h>
#include <stub.h>

// Valid addresses between USER_SPACE_ADDR and USER_SPACE_ADDR + USER_SPACE_SIZE
#define REG0 (*((volatile uint32_t *)0x30123400))
#define REG1 (*((volatile uint32_t *)0x30123500))
#define REG2 (*((volatile uint32_t *)0x30123600))

void main()
{
  reg_mprj_xfer = 1;
  while (reg_mprj_xfer == 1);

  reg_wb_enable = 1;

  if (REG0 != 0x01010101)
    test_fail();
  if (REG1 != 0x01010101)
    test_fail();
  if (REG2 != 0x00000101)
    test_fail();

  REG0 = 0x12345678;
  REG1 = 0x12345678;
  REG2 = 0x12345678;

  if (REG0 != 0x12345678)
    test_fail();
  if (REG1 != 0x12340000)
    test_fail();
  if (REG2 != 0x00005678)
    test_fail();
  test_pass();
}
