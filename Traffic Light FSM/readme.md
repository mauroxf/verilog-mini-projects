## Problem Statement

Design a traffic light controller FSM that:

- Has 3 states: `S0`, `S1`, and `S2`
- Advances to the next state on each positive clock edge
- Drives a 3-bit `light` output to represent:
  - `RED`    = `3'b100`
  - `GREEN`  = `3'b010`
  - `YELLOW` = `3'b001`
- Defaults to `S0` on invalid states

---

### FSM State Transition Table

| Current State | Next State | Light Output |
|---------------|------------|--------------|
| `S0` (00)     | `S1`       | `RED`        |
| `S1` (10)     | `S2`       | `GREEN`      |
| `S2` (01)     | `S0`       | `YELLOW`     |
| Default       | `S0`       | `RED`        |

