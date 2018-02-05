defmodule CalcTest do
  use ExUnit.Case
  # 5 2 - 3 + 2 -      2  6
  test "without parenthesis" do
    assert Calc.main("278 + 3") == 281
    assert Calc.main("5 * 7") == 35
    assert Calc.main("16 / 2") == 8
    assert Calc.main("5 - 2 + 3 - 2") == 4
    assert Calc.main("8 + 4 * 3 - 10 / 5 + 5 * 7") == 53
    assert Calc.main("3 + 4 + 7 * 2 - 1 - 9") == 11
    assert Calc.main("12 * 7 + 4 - 7 / 3 * 9") == 67
    assert_in_delta Calc.main("424 / 212 + 21 - 22 * 3"), -43, 0.001
  end

  test "with parenthesis" do
    assert Calc.main("( ( ( ( 1 * ( 2 + 3 ) ) - 3 ) + 4 ) * 5 )") == 30.0
    assert Calc.main("3 * 2 + 3 * ( 5 + 2 * 3 )") == 39
    assert Calc.main("((3-1)/2)*3+5") == 8.0
    assert Calc.main("15 + 14 * (6 - 6) * 8 * 11") == 15
  end

  test "special test" do
    assert_in_delta Calc.main("7 / 5 - 2"), -0.600, 0.01
    assert_in_delta Calc.main("2 / 3 + 1"), 1.666666, 0.0001

  end

end
