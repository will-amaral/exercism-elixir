defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    text = String.trim(input)
    capitals? = String.upcase(text) == text
    question? = String.last(text) == "?"
    case {text, capitals?, question?} do
      {"", _, _} -> "Fine. Be that way!"
      {_, false, true} -> "Sure."
      {_, true, false} -> "Whoa, chill out!"
      {_, true, true} -> "Calm down, I know what I'm doing!"
      _ -> "Whatever."
    end
  end
end
