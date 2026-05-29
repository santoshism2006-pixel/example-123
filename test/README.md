# 4-Bit Comparator - Tiny Tapeout Project

## Description

This project implements a 4-bit comparator using Verilog HDL for Tiny Tapeout.

The design compares two 4-bit binary numbers:
- A = ui_in[3:0]
- B = ui_in[7:4]

Based on the comparison result, the circuit generates three outputs:
- uo_out[0] = 1 when A > B
- uo_out[1] = 1 when A == B
- uo_out[2] = 1 when A < B

Only one output is HIGH at a time.

---

## Features

- 4-bit binary comparison
- Combinational logic design
- Tiny Tapeout compatible
- Implemented in Verilog HDL

---

## Input Mapping

| Input Pins | Function |
|------------|----------|
| ui_in[3:0] | 4-bit input A |
| ui_in[7:4] | 4-bit input B |

---

## Output Mapping

| Output Pins | Function |
|-------------|----------|
| uo_out[0] | A > B |
| uo_out[1] | A == B |
| uo_out[2] | A < B |

---

## Example

| A | B | Result |
|---|---|--------|
| 0101 | 0011 | A > B |
| 0110 | 0110 | A == B |
| 0010 | 0100 | A < B |

---

## Tools Used

- Verilog HDL
- Tiny Tapeout
- GitHub
- Icarus Verilog
- Cocotb

---

## Author

Lyra
