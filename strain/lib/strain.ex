defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    split(list, fun, true, [])
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    split(list, fun, false, [])
  end

  defp split([head | tail], fun, validator, accumulator) do
    if fun.(head) == validator do
      split(tail, fun, validator, accumulator ++ [head])
    else
      split(tail, fun, validator, accumulator)
    end
  end

  defp split([], _fun, _validator, accumulator), do: accumulator
end
