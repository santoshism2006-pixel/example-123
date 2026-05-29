`default_nettype none
`timescale 1ns / 1ps

/*
 * Testbench for 4-Bit Comparator
 */

module tb;

    // Inputs
    reg  [7:0] ui_in;
    reg  [7:0] uio_in;
    reg        ena;
    reg        clk;
    reg        rst_n;

    // Outputs
    wire [7:0] uo_out;
    wire [7:0] uio_out;
    wire [7:0] uio_oe;

    // Instantiate the DUT
    tt_um_4bit_comparator dut (
        .ui_in(ui_in),
        .uo_out(uo_out),
        .uio_in(uio_in),
        .uio_out(uio_out),
        .uio_oe(uio_oe),
        .ena(ena),
        .clk(clk),
        .rst_n(rst_n)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin

        // Initialize signals
        ena    = 1'b1;
        rst_n  = 1'b0;
        ui_in  = 8'b00000000;
        uio_in = 8'b00000000;

        // Reset
        #20;
        rst_n = 1'b1;

        // --------------------------------
        // Test Case 1 : A > B
        // A = 0101 (5)
        // B = 0011 (3)
        // --------------------------------

        ui_in = 8'b00110101;

        #10;

        $display("Test 1: A > B");
        $display("uo_out = %b", uo_out);

        // --------------------------------
        // Test Case 2 : A == B
        // A = 0110 (6)
        // B = 0110 (6)
        // --------------------------------

        ui_in = 8'b01100110;

        #10;

        $display("Test 2: A == B");
        $display("uo_out = %b", uo_out);

        // --------------------------------
        // Test Case 3 : A < B
        // A = 0010 (2)
        // B = 0100 (4)
        // --------------------------------

        ui_in = 8'b01000010;

        #10;

        $display("Test 3: A < B");
        $display("uo_out = %b", uo_out);

        #20;

        $finish;
    end

endmodule
