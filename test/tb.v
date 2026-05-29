import cocotb
from cocotb.triggers import Timer


@cocotb.test()
async def test_4bit_comparator(dut):

    # Test Case 1 : A > B
    dut.ui_in.value = 0b00110101   # B=0011 (3), A=0101 (5)
    await Timer(10, units="ns")

    assert dut.uo_out.value & 0b001 == 1, "A > B failed"
    assert (dut.uo_out.value >> 1) & 1 == 0
    assert (dut.uo_out.value >> 2) & 1 == 0


    # Test Case 2 : A == B
    dut.ui_in.value = 0b01100110   # B=0110 (6), A=0110 (6)
    await Timer(10, units="ns")

    assert (dut.uo_out.value >> 1) & 1 == 1, "A == B failed"
    assert dut.uo_out.value & 1 == 0
    assert (dut.uo_out.value >> 2) & 1 == 0


    # Test Case 3 : A < B
    dut.ui_in.value = 0b01000010   # B=0100 (4), A=0010 (2)
    await Timer(10, units="ns")

    assert (dut.uo_out.value >> 2) & 1 == 1, "A < B failed"
    assert dut.uo_out.value & 1 == 0
    assert (dut.uo_out.value >> 1) & 1 == 0


    print("All 4-bit comparator test cases passed!")
