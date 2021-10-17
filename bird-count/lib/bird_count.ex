defmodule BirdCount do
  def today([head | _tail]), do: head
  def today([]), do: nil

  def increment_day_count([head | tail]), do: [head + 1 | tail]
  def increment_day_count([]), do: [1]

  def has_day_without_birds?([0 | _tail]), do: true
  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([_ | tail]), do: has_day_without_birds?(tail)

  def total(list, acc \\ 0)
  def total([], acc), do: acc
  def total([head | tail], acc), do: total(tail, head + acc)

  def busy_days(list, acc \\ 0)
  def busy_days([], acc), do: acc
  def busy_days([head | tail], acc) when head >= 5, do: busy_days(tail, acc + 1)
  def busy_days([_ | tail], acc), do: busy_days(tail, acc)
end
