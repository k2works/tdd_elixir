defmodule FizzBuzzTest do
  @moduledoc false

  use ExUnit.Case
  alias TddElixir.FizzBuzz, as: FizzBuzz
  doctest TddElixir.FizzBuzz

  test "1から100までの数をプリントする,ただし3で割り切れる場合はFizz,5で割り切れる場合はBuzz,両方で割り切れる場合はFizzBuzzをプリントする" do
    list = FizzBuzz.generate_list(100)
    assert List.first(list) == "1"
    assert Enum.at(list, 2) == "Fizz"
    assert Enum.at(list, 4) == "Buzz"
    assert Enum.at(list, 14) == "FizzBuzz"
    assert List.last(list) == "Buzz"
  end

  test "3で割り切れる場合はFizzを返す" do
    assert FizzBuzz.generate(3) == "Fizz"
    assert FizzBuzz.generate(1) == "1"
  end

  test "5で割り切れる場合はBuzzを返す" do
    assert FizzBuzz.generate(5) == "Buzz"
  end

  test "3と5で割り切れる場合はFizzBuzzを返す" do
    assert FizzBuzz.generate(15) == "FizzBuzz"
  end

  test "数字以外の場合は例外を発生させる" do
    assert_raise RuntimeError, fn ->
      FizzBuzz.generate('a')
    end
  end
end
