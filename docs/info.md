## How it works

This project implements a 4-bit binary counter using Verilog. The counter increases its value by one on every rising edge of the clock signal. When the reset signal is activated, the counter is cleared to 0000. The output displays the current count value in binary. After reaching 1111 (decimal 15), the counter wraps around to 0000 and continues counting.

## How to test

1. Apply a clock signal to the design.
2. Set rst_n = 0 and verify that the output becomes 0000.
3. Set rst_n = 1 to release the reset.
4. Observe the output on each clock cycle.
5. The output should follow the sequence:

   0000 → 0001 → 0010 → 0011 → 0100 → 0101 → 0110 → 0111 →
   1000 → 1001 → 1010 → 1011 → 1100 → 1101 → 1110 → 1111 → 0000

6. Verify that the counting sequence repeats continuously.

## External hardware

No external hardware is required. The output can optionally be connected to LEDs to visualize the binary count value.
