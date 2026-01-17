defmodule TakeANumber do
  def start(), do: spawn(fn -> loop(0) end)

  defp loop(state) do
    receive do
      {:report_state, sender_pid} -> report_state(state, sender_pid)
      {:take_a_number, sender_pid} -> take_a_number(state, sender_pid)
      :stop -> nil
      _ -> loop(state)
    end
  end

  defp report_state(state, sender_pid) do
    send(sender_pid, state)
    loop(state)
  end

  defp take_a_number(state, sender_pid) do
    incresed_state = state + 1
    send(sender_pid, incresed_state)
    loop(incresed_state)
  end
end
