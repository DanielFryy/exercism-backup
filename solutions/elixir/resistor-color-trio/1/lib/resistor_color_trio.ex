defmodule ResistorColorTrio do
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
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label(colors) do
    [color1, color2, color3 | _] = colors
    code1 = Map.get(@colors, color1)
    code2 = Map.get(@colors, color2)
    zeros = Map.get(@colors, color3)
    value = (code1 * 10 + code2) * 10 ** zeros
    format_label(value)
  end
  
  defp format_label(value) do
    cond do
      value >= 10 ** 30 and rem(value, 10 ** 30) == 0 ->
        {div(value, 10 ** 30), :quettaohms}
      value >= 10 ** 27 and rem(value, 10 ** 27) == 0 ->
        {div(value, 10 ** 27), :ronnaohms}
      value >= 10 ** 24 and rem(value, 10 ** 24) == 0 ->
        {div(value, 10 ** 24), :yottaohms}
      value >= 10 ** 21 and rem(value, 10 ** 21) == 0 ->
        {div(value, 10 ** 21), :zettaohms}
      value >= 10 ** 18 and rem(value, 10 ** 18) == 0 ->
        {div(value, 10 ** 18), :exaohms}
      value >= 10 ** 15 and rem(value, 10 ** 15) == 0 ->
        {div(value, 10 ** 15), :petaohms}
      value >= 10 ** 12 and rem(value, 10 ** 12) == 0 ->
        {div(value, 10 ** 12), :teraohms}
      value >= 10 ** 9 and rem(value, 10 ** 9) == 0 ->
        {div(value, 10 ** 9), :gigaohms}
      value >= 10 ** 6 and rem(value, 10 ** 6) == 0 ->
        {div(value, 10 ** 6), :megaohms}
      value >= 10 ** 3 and rem(value, 10 ** 3) == 0 ->
        {div(value, 10 ** 3), :kiloohms}
      true -> {value, :ohms}
    end
  end
end
