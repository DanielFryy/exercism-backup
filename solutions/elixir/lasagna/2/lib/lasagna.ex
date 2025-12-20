defmodule Lasagna do
  def expected_minutes_in_oven(), do: 40
  def remaining_minutes_in_oven(time) do
    remaining_time = expected_minutes_in_oven() - time
    remaining_time
  end
  def preparation_time_in_minutes(layers), do: layers * 2
  def total_time_in_minutes(layers, time) do
    preparation_time = preparation_time_in_minutes(layers)
    time + preparation_time
  end
  def alarm(), do: "Ding!"
end
