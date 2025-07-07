## Problem Statement
Design a 4-bit Arithmetic Logic Unit (ALU) in Verilog with basic arithmetic and logic operations, implemented using a 3-stage pipeline architecture.

### Pipeline Stages
1. **Stage 1 – Input Latch:** Capture inputs `a`, `b`, and `ctrl` on rising clock edge.
2. **Stage 2 – ALU Logic:** Perform operation based on `ctrl`.
3. **Stage 3 – Output Latch:** Store final result in `z` and flag `zero`.

### Operations

| `ctrl` | Operation |
|--------|-----------|
| `00`   | `a + b`   |
| `01`   | `a - b`   |
| `10`   | `a & b`   |
| `11`   | `a ^ b`   |
| other  | `4'hF`    *(invalid ctrl signal)*

### Inputs
- `a` (4-bit)
- `b` (4-bit)
- `ctrl` (2-bit)
- `clk` (Clock)
- `rst` (Reset)

### Outputs
- `z` (4-bit result)
- `zero` (1-bit flag set if result is `0000`)

### Bash Commands

To compile and run using Icarus Verilog:
```bash
iverilog -o MiniALU_test MiniALU.v MiniALU_tb.v
vvp MiniALU_test
