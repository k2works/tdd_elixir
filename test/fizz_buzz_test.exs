defmodule FizzBuzzTest do
  use ExUnit.Case

  alias FizzBuzz

  @moduletag :capture_log

  doctest FizzBuzz

  test "1から100までの数をプリントする" do
    FizzBuzz.print()
  end
end
