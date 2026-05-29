/*
 * 4-Bit Comparator - Tiny Tapeout Project
 */

`default_nettype none

module tt_um_4bit_comparator (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path
    input  wire       ena,      // Enable signal
    input  wire       clk,      // Clock
    input  wire       rst_n     // Reset
);

    // First 4-bit number
    wire [3:0] A = ui_in[3:0];

    // Second 4-bit number
    wire [3:0] B = ui_in[7:4];

    // Comparator outputs
    wire A_greater;
    wire A_equal;
    wire A_less;

    assign A_greater = (A > B);
    assign A_equal   = (A == B);
    assign A_less    = (A < B);

    // Output mapping
    // uo_out[0] = A > B
    // uo_out[1] = A == B
    // uo_out[2] = A < B

    assign uo_out[0] = A_greater;
    assign uo_out[1] = A_equal;
    assign uo_out[2] = A_less;

    // Remaining outputs unused
    assign uo_out[7:3] = 5'b00000;

    // Unused bidirectional IOs
    assign uio_out = 8'b00000000;
    assign uio_oe  = 8'b00000000;

endmodule
