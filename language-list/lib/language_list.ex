defmodule LanguageList do
  def new(), do: []

  def add(list, language), do: [language | list]

  def remove([_ | list]), do: list

  def first([item | _]), do: item

  def count(list), do: length(list)

  def exciting_list?(list), do: "Elixir" in list
end
