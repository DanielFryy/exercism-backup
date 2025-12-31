defmodule BirdCount do
  def today(list) when length(list) <= 0, do: nil
  def today([head | _tail]), do: head
  # def today(list), do: List.first(list)

  def increment_day_count(list) when length(list) <= 0, do: [1]
  def increment_day_count([head | tail]), do: [head + 1 | tail]

  def has_day_without_birds?(list) when length(list) <= 0, do: false
  def has_day_without_birds?([head | _tail]) when head === 0, do: true
  def has_day_without_birds?([_head | tail]), do: has_day_without_birds?(tail)

  def total(list) when length(list) <= 0, do: 0
  def total([head | tail]), do: head + total(tail)

  def busy_days(list) when length(list) <= 0, do: 0
  def busy_days([head | tail]) when head >= 5, do: 1 + busy_days(tail)
  def busy_days([_head | tail]), do: 0 + busy_days(tail)
end
