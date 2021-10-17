defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position :: position) :: integer
  def score({x, y}) do
    dist = x * x + y * y
    case dist do
      dist when dist <= 1 -> 10
      dist when dist <= 25 -> 5
      dist when dist <= 100 -> 1
      _ -> 0
    end
  end
end
