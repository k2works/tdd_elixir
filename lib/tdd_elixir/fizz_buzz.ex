defmodule FizzBuzz do
  @moduledoc false
  def print do
    print(100, [])
  end

  def print(0, result) do
    result
  end

  def print(current, result) do
    IO.puts(current)
    print(current - 1, [current | result])
  end

  def generate(number) do
    result = number
    if rem(number, 3) == 0 do
      result = "Fizz"
    else
      result = number
    end
    result
  end
end
