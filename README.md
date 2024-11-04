# Multi-Cycle Processor Implementation in Verilog

## Project Overview

This project involves the design and implementation of a multi-cycle CPU in Verilog. Created as part of a study in computer architecture, this processor can handle a range of fundamental instructions, including arithmetic, memory, and control, to simulate key functions of a modern computer system. The project enhances foundational knowledge in CPU architecture by focusing on multi-cycle instruction processing and resource optimization.

### Goal
The goal of this project is to design a multi-cycle CPU that processes instructions in multiple cycles, each representing specific stages of instruction execution (fetch, decode, execute, memory access, and write-back). This approach allows the CPU to reuse hardware components across different cycles, improving resource utilization while enabling a more in-depth understanding of CPU operation at a microarchitectural level.

### Features

- **Instruction Handling**: Supports various types of instructions:
  - **Arithmetic** (e.g., addition, subtraction, etc.)
  - **Memory Access** (e.g., load and store operations)
  - **Control** (e.g., branching and jumping)
- **Multi-Cycle Operation**: Instructions are divided across multiple cycles, optimizing hardware usage and allowing different phases of execution to share resources.
- **Core Components**:
  - **256x32-bit RAM**: Provides memory space for data storage and retrieval.
  - **16x32-bit Register File**: Stores intermediate data and processor states.
  - **Decoder**: Interprets instructions to signal the appropriate operations.
  - **ALU**: Performs mathematical and logical operations, essential for instruction execution.

### Project Structure

The multi-cycle processor design incorporates the following key modules:

1. **RAM (256x32-bit)**: A memory module to store data, accessible by load and store instructions, and designed to handle 32-bit data across 256 addresses.
2. **Register File (16x32-bit)**: A set of 16 registers, each 32-bits wide, storing intermediate values and operands for faster CPU access compared to RAM.
3. **Decoder**: Decodes each instruction, breaking it down into control signals that guide the CPU in performing the correct operation in each cycle.
4. **ALU**: The arithmetic and logic unit responsible for executing mathematical and logical instructions, such as addition, subtraction, and bitwise operations.

### Execution Flow

The multi-cycle CPU operates in a series of stages that allow for efficient use of hardware components by dividing each instruction into multiple cycles:

1. **Fetch**: The instruction is retrieved from memory.
2. **Decode**: The instruction is decoded, and control signals are generated.
3. **Execute**: The ALU performs the required arithmetic or logical operation.
4. **Memory Access**: Load or store operations are carried out if specified by the instruction.
5. **Write-Back**: Results are written back to the register file.

This structured cycle approach supports a more efficient and scalable processor design by allowing hardware reuse and improved timing control for each instruction.

### Conclusion

This multi-cycle processor implementation in Verilog serves as a practical exploration into CPU architecture and design principles, with a focus on efficient hardware utilization. By completing this project, a deeper understanding of computer architecture fundamentals, such as multi-cycle processing, resource sharing, and the role of individual CPU components, has been achieved.
