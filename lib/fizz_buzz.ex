defmodule FizzBuzz do
  def print() do
    list = _downto(100, [])
    Enum.map list, fn (value) -> IO.puts(value) end
  end

  defp _downto(0, result), do: result
  defp _downto(current, result) do
    value = generate(current)
    _downto(current - 1, [ value | result] )
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
