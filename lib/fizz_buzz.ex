defmodule FizzBuzz do
  def print, do: downto(100, [])
  def downto(0, result), do: result
  def downto(current, result) do
    value = generate(current)
    IO.puts(value)
    downto(current - 1, [ value | result] )
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
