defmodule LogLevel do
  def to_label(level, legacy?) do
    cond do
      0 === level and not legacy? -> :trace
      1 === level -> :debug
      2 === level -> :info
      3 === level -> :warning
      4 === level -> :error
      5 === level and not legacy? -> :fatal
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)
    cond do
      label === :error or label === :fatal -> :ops
      label === :unknown and legacy? -> :dev1
      label === :unknown -> :dev2
      true -> false
    end
  end
end
