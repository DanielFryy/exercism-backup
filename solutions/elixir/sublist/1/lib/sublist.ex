defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b -> :equal
      sublist?(a, b) -> :sublist
      sublist?(b, a) -> :superlist
      true -> :unequal
    end
  end

  defp sublist?([], _), do: true

  defp sublist?(_, []), do: false

  defp sublist?(a, [_ | tail] = b) do
    if starts_with?(a, b) do
      true
    else
      sublist?(a, tail)
    end
  end

  defp starts_with?([], _), do: true

  defp starts_with?(_, []), do: false

  defp starts_with?([h | tail1], [h | tail2]) do
    starts_with?(tail1, tail2)
  end

  defp starts_with?(_, _), do: false
end
