## Problem Statement
Implement a 4-to-1 multiplexer using a 2-bit select line.

### Selection Table

| `sel` | Output |
|-------|--------|
| 00    | in0    |
| 01    | in1    |
| 10    | in2    |
| 11    | in3    |
| other | 32'hDEADBEEF |

### Inputs
- `in0`, `in1`, `in2`, `in3` (each 32-bit)
- `sel` (2-bit)

### Output
- `out` (32-bit)
