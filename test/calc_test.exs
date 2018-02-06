defmodule CalcTest do
  use ExUnit.Case
  # 5 2 - 3 + 2 -      2  6
  test "without parenthesis" do
    assert Calc.make_post("278 + 3") == 281
    assert Calc.make_post("5 * 7") == 35
    assert Calc.make_post("16 / 2") == 8
    assert Calc.make_post("5 - 2 + 3 - 2") == 4
    assert Calc.make_post("8 + 4 * 3 - 10 / 5 + 5 * 7") == 53
    assert Calc.make_post("3 + 4 + 7 * 2 - 1 - 9") == 11
    assert Calc.make_post("12 * 7 + 4 - 7 / 3 * 9") == 67
    assert_in_delta Calc.make_post("424 / 212 + 21 - 22 * 3"), -43, 0.001
  end

  test "with parenthesis" do
    assert Calc.make_post("( ( (  ( 1 *  ( 2 + 3 ) ) - 3 ) + 4 ) * 5 )") == 30.0
    assert Calc.make_post("3 * 2 + 3 * ( 5 + 2 * 3 )") == 39
    assert Calc.make_post("((3-1)/2)*3+5") == 8.0
    assert Calc.make_post("15 + 14 * (6 - 6) * 8 * 11") == 15
  end

  test "special test" do
    assert_in_delta Calc.make_post("7 / 5 - 2"), -0.600, 0.01
    assert_in_delta Calc.make_post("2 / 3 + 1"), 1.666666, 0.0001

  end

end
