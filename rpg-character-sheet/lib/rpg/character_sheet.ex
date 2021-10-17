defmodule RPG.CharacterSheet do

  def input(question), do: IO.gets(question) |> String.trim()
  def welcome(), do: IO.puts("Welcome! Let's fill out your character sheet together.")

  def ask_name(), do: input("What is your character's name?\n")

  def ask_class(), do: input("What is your character's class?\n")

  def ask_level(), do: input("What is your character's level?\n") |> String.to_integer()

  def run() do
    welcome()
    IO.inspect(%{name: ask_name(), class: ask_class(), level: ask_level()}, label: "Your character")
  end
end
