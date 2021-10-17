defmodule Username do
  def sanitize(username) do
    Enum.map(username, fn char ->
      case char do
        ?ä -> 'ae'
        ?ö -> 'oe'
        ?ü -> 'ue'
        ?ß -> 'ss'
        _ -> char
      end
     end)
     |> List.flatten()
     |> Enum.filter(& &1 >= ?a and &1 <= ?z or &1 == ?_)
  end
end
