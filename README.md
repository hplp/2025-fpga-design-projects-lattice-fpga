# Lattice FPGA Tutorial

## Team Name: Open Source Toolchain Tutorial for Lattice FPGAs

## Team Members:
- Garrett Delaney
- Nick Flora
- Robert Smith

## Project Title:
Implementing a multiple different Verilog Designs onto a Lattice FPGA Board

## Project Description:
The goal of this Project is to create a step-by-step tutorial to implement various Verilog onto a new board - The Lattice iCEbreaker V1. Once that is complete we will design a full lab, similar to the ones utilized in class, that can be ran through by new FPGA students with no issues.
## Key Objectives:
- Download Software for Lattice FPGA Board
- Implement 7-segment display onto the FPGA Board
- Create a fully operational lab using the steps that we ourselves used.

## Technology Stack:
- Board: [iCEBreaker](https://1bitsquared.com/products/icebreaker?srsltid=AfmBOooAh5g4leaGdWQUO7u2lhPpUcnAjkmURPF2zZcMg79j3SATimH3)
    - Here's a highlight of the features relevant to this project, see the full specs [here](https://docs.icebreaker-fpga.org/hardware/icebreaker/)
    - FPGA: Lattice iCE40 UltraPlus 5K
        - 5280 Logic Cells (4-LUT + Carry + FF)
    - QSPI-DDR-capable flash 128 MBit (16 MB)
    - 39 I/O capable pins
        - 3 PINs for RGB LED (pin header)
        - 2 LEDs (one on output-only PLL pin)
        - 1 Clock pin (on PLL GBIN)
        - 1 Push Button
        - 16 PINs on dual PMOD
        - 8 PINs on single PMOD / snap-off section
- Peripherals:
    - USB C cable
    - [1 Bit Squared PMOD 7-Segment Display](https://1bitsquared.com/products/pmod-7-segment-display?srsltid=AfmBOoqTvs5gFYn6XuRsQLZZ0BmuKskXW9ZFBNxfJExGojLuetX-dGLe)
- [APIO Software toolsuite](https://github.com/FPGAwars/apio): 
    - Synthesis: yosys
    - Place and route: nextpnr
    - Bitstream generation: icepack
    - Programmer: iceprog
        - Drivers: libusbK through Zadig
    - Simulation: Icarus Verilog
    - Wave Viewer: GTKWave
- RTL/HDL Lanuage: Verilog

## Expected Outcomes:
We hope to deliver a finished lab that will allow any student with the FPGA Board to run a 7-segment display or other files without the need of outside assistance.

## Tasks:
- Garrett Delaney - Design the initial tutorial to download and run the necessary software onto the board, debugging.
- Nick Flora- Design the initial tutorial to download and run the necessary software onto the board, debugging, first run of downloading software that would be used with board. Soldered Display onto board.
- Robert Smith - Introduction, Background, Questions, will be running through the tutorial after creation to confirm the tasks, make sure it can be done without any outside help

## Timeline:
- 4/11 - Fully implement the Background, Introduction, and other initial parts into the tutorial. Have the Verilog fully completed and able to be ran on the board.
- 4/18 - Fully write the lab with all instructions in one place, confirm that the board works with no issues and that it can be run.
- 4/18 - Finalize any tests or bugs that need to be made, confirm that it can be run without outside assistance by having Robert run through the lab without the software downloaded.
- 4/25 - Finalize whatever is necessary to complete the assignment.
