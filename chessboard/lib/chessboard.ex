defmodule Chessboard do
  def rank_range, do: 1..8

  def file_range, do: ?A..?H

  def ranks, do: rank_range() |> Enum.into([])

  def files, do: file_range() |> Enum.into([], & <<&1>>)
end
