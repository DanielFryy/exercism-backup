defmodule LogParser do
  def valid_line?(line) do
    cond do
      line =~ ~r/^\[DEBUG\]/ -> true
      line =~ ~r/^\[INFO\]/ -> true
      line =~ ~r/^\[WARNING\]/ -> true
      line =~ ~r/^\[ERROR\]/ -> true
      true -> false
    end
  end

  def split_line(line) do
    regex = ~r/<[~*=-]*>/
    String.split(line, regex, trim: true)
  end

  def remove_artifacts(line) do
    regex = ~r/end-of-line\d+/i
    Regex.replace(regex, line, "")
  end

  def tag_with_user_name(line) do
    case Regex.run(~r/User\s+(\S+)/, line) do
      [_full_match, user_name] -> "[USER] #{user_name} #{line}"
      nil -> line
    end
  end
end
