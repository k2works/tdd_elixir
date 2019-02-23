defmodule TddElixir do

  import TddElixir.FizzBuzz, only: [print: 0]

  @moduledoc """
  Documentation for TddElixir.
  """

  @doc """
  FizzBuzz

  ## Examples

      iex> TddElixir.fizz_buzz_print()
      TddElixir.FizzBuzz.print()

  """
  def fizz_buzz_print do
    print()
  end
end
