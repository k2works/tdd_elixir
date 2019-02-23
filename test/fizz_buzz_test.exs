defmodule FizzBuzzTest do
  @moduledoc false

  use ExUnit.Case
  doctest FizzBuzz

  test "1から100までの数をプリントする" do
    list = FizzBuzz.print()
    assert List.first(list) == 1
    assert List.last(list) == 100
  end
end
