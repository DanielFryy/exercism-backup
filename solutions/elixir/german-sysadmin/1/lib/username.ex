defmodule Username do
  def sanitize(username) do
    case username do
      [] -> []
      [head | tail] ->
        case head do
          char when char >= ?a and char <= ?z or char === ?_ ->
            [char | sanitize(tail)]
          ?ä -> ~c"ae" ++ sanitize(tail)
          ?ö -> ~c"oe" ++ sanitize(tail)
          ?ü -> ~c"ue" ++ sanitize(tail)
          ?ß -> ~c"ss" ++ sanitize(tail)
          _ ->
            sanitize(tail)
        end
    end
  end
end
