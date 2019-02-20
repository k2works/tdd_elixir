defmodule FizzBuzz do
  def print do
    print(1, 100, [])
  end

  def print(_current, 0, result) do
    Enum.reverse(result)
  end

  def print(current, left, result) do
    IO.puts(current)
    print(current + 1, left - 1, [ current | result] )
  end
end
