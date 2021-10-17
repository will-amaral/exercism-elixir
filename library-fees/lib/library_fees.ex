defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    datetime.hour < 12
  end

  def return_date(checkout_datetime) do
    days = if before_noon?(checkout_datetime), do: 28, else: 29
    NaiveDateTime.to_date(checkout_datetime) |> Date.add(days)
  end

  def days_late(planned_return_date, actual_return_datetime) do
    NaiveDateTime.to_date(actual_return_datetime)
    |> Date.diff(planned_return_date)
    |> (& if &1 > 0, do: &1, else: 0).()
  end

  def monday?(datetime) do
    case NaiveDateTime.to_date(datetime) |> Date.day_of_week() do
      1 -> true
      _ -> false
    end
  end

  def calculate_late_fee(checkout, return, rate) do
    today = datetime_from_string(return)
    days = datetime_from_string(checkout)  |> return_date()  |> days_late(today)
    case monday?(today) do
      true -> trunc(rate * days * 0.5)
      false -> rate * days
    end
  end
end
