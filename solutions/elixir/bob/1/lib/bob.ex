defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    cond do
      input === "" -> "Fine. Be that way!"
      shouting?(input) && String.ends_with?(input, "?") -> 
        "Calm down, I know what I'm doing!"
      shouting?(input) -> "Whoa, chill out!"
      input =~ ~r/^\s+$/ -> "Fine. Be that way!"
      input =~ ~r/.*\?\s*$/ -> "Sure." 
      true -> "Whatever."
    end
  end

  defp shouting?(input) do
    String.upcase(input) == input and String.downcase(input) != input
  end
end
