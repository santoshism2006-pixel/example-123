# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles


@cocotb.test()
async def test_project(dut):
    dut._log.info("Start 4-Bit Comparator Test")

    # Create clock with 10 us period
    clock = Clock(dut.clk, 10, unit="us")
    cocotb.start_soon(clock.start())

    # Reset the design
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0

    await ClockCycles(dut.clk, 5)

    dut.rst_n.value = 1

    dut._log.info("Starting Comparator Tests")

    # ----------------------------------------
    # Test Case 1 : A > B
    # A = 0101 (5)
    # B = 0011 (3)
    # ----------------------------------------

    dut.ui_in.value = 0b00110101

    await ClockCycles(dut.clk, 1)

    assert dut.uo_out.value == 0b00000001, "A > B Test Failed"

    dut._log.info("A > B Test Passed")

    # ----------------------------------------
    # Test Case 2 : A == B
    # A = 0110 (6)
    # B = 0110 (6)
    # ----------------------------------------

    dut.ui_in.value = 0b01100110

    await ClockCycles(dut.clk, 1)

    assert dut.uo_out.value == 0b00000010, "A == B Test Failed"

    dut._log.info("A == B Test Passed")

    # ----------------------------------------
    # Test Case 3 : A < B
    # A = 0010 (2)
    # B = 0100 (4)
    # ----------------------------------------

    dut.ui_in.value = 0b01000010

    await ClockCycles(dut.clk, 1)

    assert dut.uo_out.value == 0b00000100, "A < B Test Failed"

    dut._log.info("A < B Test Passed")

    dut._log.info("All 4-Bit Comparator Tests Passed Successfully!")
