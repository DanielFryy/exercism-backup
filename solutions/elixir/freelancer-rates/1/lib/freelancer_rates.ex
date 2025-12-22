defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount * (1 - discount / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    raw_daily_rate = daily_rate(hourly_rate)
    raw_monthly_rate = raw_daily_rate * 22
    discounted_monthly_rate = apply_discount(raw_monthly_rate, discount)
    rounded_up = Float.ceil(discounted_monthly_rate)
    trunc(rounded_up)
  end

  def days_in_budget(budget, hourly_rate, discount) do
    raw_daily_rate = daily_rate(hourly_rate)
    discounted_daily_rate = apply_discount(raw_daily_rate, discount)
    total_days = budget / discounted_daily_rate
    Float.floor(total_days, 1)
  end
end
