defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) do
    if a > 0 and b > 0 and c > 0 do
      inequality_error = {:error, "side lengths violate triangle inequality"}
      cond do
        c > a + b -> inequality_error
        b > a + c -> inequality_error
        a > b + c -> inequality_error
        a === b and b === c -> {:ok, :equilateral}
        a === b or a === c or b === c -> {:ok, :isosceles}
        true -> {:ok, :scalene}
      end
    else
      {:error, "all side lengths must be positive"}
    end
  end
end
