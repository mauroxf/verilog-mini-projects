## Problem Statement
Implement a 2-to-4 line decoder with an enable (`en`) signal. When enabled, one of the 4 outputs is set high based on the 2-bit input. If disabled, all outputs are 0.

### Truth Table

| `en` | `in` | `out`    |
|------|------|----------|
| 0    |  --  | 0000     |
| 1    | 00   | 0001     |
| 1    | 01   | 0010     |
| 1    | 10   | 0100     |
| 1    | 11   | 1000     |

### Inputs
- `in` (2-bit): Selects the active output.
- `en` (1-bit): Enables the decoder.

### Output
- `out` (4-bit): One-hot output.

---

## Bash Commands

To compile and run with Icarus Verilog:

```bash
iverilog -o decoder_tb decoder2to4.v decoder2to4_tb.v
vvp decoder_tb
