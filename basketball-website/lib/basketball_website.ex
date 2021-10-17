defmodule BasketballWebsite do
  def get_value([], data), do: data
  def get_value([head | tail], data), do: get_value(tail, data[head])

  def extract_from_path(data, path) do
    String.split(path,".")
    |> get_value(data)
  end

  def get_in_path(data, path), do: Kernel.get_in(data,String.split(path, "."))
end
