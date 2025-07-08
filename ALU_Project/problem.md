## Problem Statement
Design a 32-bit Arithmetic Logic Unit (ALU) in Verilog.

### Operations

| Opcode | Operation      |
|--------|----------------|
| 0000   | a + b          |
| 0001   | a - b          |
| 0010   | a & b          |
| 0011   | a \| b         |
| 0100   | a ^ b          |
| 0101   | ~a             |
| 0110   | a << b         |
| 0111   | a >> b         |
| other  | 32'hDEADBEEF   |

### Inputs
- `a` (32-bit)
- `b` (32-bit)
- `op_code` (4-bit)

### Output
- `result` (32-bit)

---
## Bash Commands

To compile and run using Icarus Verilog:

```bash
iverilog -o alu_tb alu.v alu_tb.v
vvp alu_tb
