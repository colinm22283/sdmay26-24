# Top Level Design TB and Firmware
This folder contains the firmware for the full uGPU design.

The main C file is `top_level.c`, it must be named the same as the directory and Verilog testbench otherwise the Caravel makefiles won't find it properly.

To flash the FPGA or taped out chip during bringup: `make verify-top_level-flash`.

## Directories
- `../../../library/firmware_vexriscv/verilog/dv/firmware`: Caravel common defs
  - `defs.h`: Definitions for Caravel registers
  - `stub.h, stub.c`: Provided utility functions
- `../firmware/`: uGPU common defs
- `scripts/`: Python utilities
- `lib/`: C libraries
- `src/`: C sources
