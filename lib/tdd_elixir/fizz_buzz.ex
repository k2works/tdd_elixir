defmodule TddElixir.FizzBuzz do
  @max_range 100
  @moduledoc false
  @type t :: binary()
  @spec print() :: [t()]
  def print, do: generate_list(@max_range) |> Enum.map(&IO.puts/1)
  @spec generate_list(pos_integer()) :: [t()]
  def generate_list(max_range), do: 1..max_range |> Enum.map(&generate/1)

  @fizz_buzz "FizzBuzz"
  @fizz "Fizz"
  @buzz "Buzz"
  @spec generate(pos_integer()) :: t()
  def generate(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: @fizz_buzz
  def generate(number) when rem(number, 3) == 0, do: @fizz
  def generate(number) when rem(number, 5) == 0, do: @buzz

  def generate(number) do
    unless is_number(number), do: raise(RuntimeError, message: "数字以外は処理できません")
    Integer.to_string(number)
  end
end
