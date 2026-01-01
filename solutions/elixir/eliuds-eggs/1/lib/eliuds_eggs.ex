defmodule EliudsEggs do
  @doc """
  Given the number, count the number of eggs.
  """
  @spec egg_count(number :: integer()) :: non_neg_integer()
  def egg_count(0), do: 0
  def egg_count(number) do
    last_bit = Bitwise.band(number, 1)
    remaining_bits = Bitwise.bsr(number, 1)
    last_bit + egg_count(remaining_bits)
  end
end
