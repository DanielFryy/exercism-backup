defmodule LibraryFees do
  def datetime_from_string(string) do
    {_, date} = NaiveDateTime.from_iso8601(string)
    date
  end

  def before_noon?(datetime), do: datetime.hour < 12

  def return_date(checkout_datetime) do
    days = if before_noon?(checkout_datetime), do: 28, else: 29
    checkout_datetime
    |> NaiveDateTime.shift(day: days)
    |> NaiveDateTime.to_date()
  end

  def days_late(planned_return_date, actual_return_datetime) do
    diff = actual_return_datetime
    |> NaiveDateTime.to_date()
    |> Date.diff(planned_return_date)
    if diff <= 0, do: 0, else: diff
  end

  def monday?(datetime) do
    Date.day_of_week(datetime) === 1
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout_datetime = datetime_from_string(checkout)
    actual_return_datetime = datetime_from_string(return)
    planned_date = return_date(checkout_datetime)
    is_monday? = monday?(actual_return_datetime)
    days_late = days_late(planned_date, actual_return_datetime)
    multiplier = if is_monday?, do: 0.5, else: 1
    floor(days_late * rate * multiplier)
  end
end
