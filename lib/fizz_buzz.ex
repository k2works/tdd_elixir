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
    if rem(number, 3) == 0 do
      "Fizz"
    else
      number
    end
  end
end
