defmodule FizzBuzzTest do
  use ExUnit.Case

  alias FizzBuzz

  @moduletag :capture_log

  doctest FizzBuzz

  test "Hello, world" do
    assert FizzBuzz.greeting() == "Hello, world!"
  end
end
