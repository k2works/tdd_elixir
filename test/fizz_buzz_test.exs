defmodule FizzBuzzTest do
  @moduledoc false

  use ExUnit.Case
  doctest FizzBuzz

  test "1から100までの数をプリントする" do
    FizzBuzz.print()
  end
end
