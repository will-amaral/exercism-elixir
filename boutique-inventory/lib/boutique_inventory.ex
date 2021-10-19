defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort(inventory, &(&1.price <= &2.price))
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, &is_nil(&1.price))
  end

  def increase_quantity(%{quantity_by_size: quantity} = item, count) do
    quantity = quantity
    |> Enum.map(fn {k, v} -> {k, v + count} end)
    |> Enum.into(%{})
    %{ item | quantity_by_size: quantity }
  end

  def total_quantity(%{quantity_by_size: quantity}) do
    quantity
    |> Enum.map(& elem(&1, 1))
    |> Enum.sum()
  end
end
