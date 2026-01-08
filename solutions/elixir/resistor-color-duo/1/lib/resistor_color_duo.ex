defmodule ResistorColorDuo do
  @colors %{
    :black => 0,
    :brown => 1,
    :red => 2,
    :orange => 3,
    :yellow => 4,
    :green => 5,
    :blue => 6,
    :violet => 7,
    :grey => 8,
    :white => 9
  }
  @doc """
  Calculate a resistance value from two colors
  """
  @spec value(colors :: [atom]) :: integer
  def value(colors) do
    [color1, color2 | _] = colors
    code1 = Map.get(@colors, color1)
    code2 = Map.get(@colors, color2)
    {res, _} = Integer.parse("#{code1}#{code2}")
    res
  end
end
