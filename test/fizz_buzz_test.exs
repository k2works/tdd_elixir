defmodule FizzBuzzTest do
  @moduledoc false

  use ExUnit.Case
  doctest FizzBuzz

  test "1から100までの数をプリントする" do
    list = FizzBuzz.print()
    assert List.first(list) == 1
    assert List.last(list) == 100
  end

  test "3で割り切れる場合はFizzを返す" do
    assert FizzBuzz.generate(3) == "Fizz"
    assert FizzBuzz.generate(1) == 1
  end

  test "5で割り切れる場合はBuzzを返す" do
    assert FizzBuzz.generate(5) == "Buzz"
  end
end
