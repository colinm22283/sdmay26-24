# Top Level Design TB and Firmware
This folder contains the firmware for the full uGPU design.

The main C file is `top_level.c`, it must be named the same as the directory and Verilog testbench otherwise the Caravel makefiles won't find it properly.

To flash the FPGA or taped out chip during bringup: `make verify-top_level-flash`.

## Directories
- `../../../library/firmware_vexriscv/verilog/dv/firmware`: Caravel common defs
  - `defs.h`: Definitions for Caravel registers
  - `stub.h, stub.c`: Provided utility functions
- `../firmware/`: uGPU common defs
- `assets/`: Test models to render with
  - `teapot.obj`: Utah Teapot, 6320 triangles. [Source](https://graphics.stanford.edu/courses/cs148-10-summer/as3/code/as3/teapot.obj)
- `lib/`: C libraries
- `scripts/`: Python utilities
- `src/`: C sources

## Scripts
All scripts should be run using the Caravel Python venv: `source [path_to_project_root]/venv/bin/activate` to activate.

Pip packages can be installed normally using `pip` after the venv has been activated: `(venv) user@pc $ pip install my_dependency`. Install the dependencies for the script you're trying to run, otherwise it won't work.

- `obj_to_rasterizer.py`: Convert an OBJ 3D model file to verilog code for the rasterizer testbench.
  - Usage: `obj_to_rasterizer.py [model.obj] [output.txt]`
  - Dependencies: `open3d, numpy`
