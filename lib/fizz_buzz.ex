defmodule FizzBuzz do
  def print do
    print(100, [])
  end

  def print(0, result) do
    result
  end

  def print(current, result) do
    IO.puts(current)
    print(current - 1, [ current | result] )
  end

  def generate(number) do
    cond do
      rem(number, 3) == 0 and rem(number, 5) == 0 -> "FizzBuzz"
      rem(number, 3) == 0 -> "Fizz"
      rem(number, 5) == 0 -> "Buzz"
      true -> number
    end
  end
end
