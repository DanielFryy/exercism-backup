defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount * (1 - discount / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    daily_rate(hourly_rate) * 22
    |> apply_discount(discount)
    |> Float.ceil()
    |> trunc()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    raw_daily_rate = daily_rate(hourly_rate)
    discounted_daily_rate = apply_discount(raw_daily_rate, discount)
    budget / discounted_daily_rate
    |> Float.floor(1)
  end
end
