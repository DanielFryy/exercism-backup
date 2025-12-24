defmodule Year do
  @spec leap_year?(non_neg_integer) :: boolean
  def leap_year?(year) do
    cond do
       rem(year, 400) === 0 -> true
       rem(year, 100) === 0 -> false
       rem(year, 4) === 0 -> true
       true -> false
    end
  end
end
