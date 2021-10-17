defmodule NameBadge do
  def get_dept(value) do
    if value do
      String.upcase(value)
    else
      "OWNER"
    end
  end

  def print(nil, name, department), do: "#{name} - #{get_dept(department)}"
  def print(id, name, department), do: "[#{id}] - #{name} - #{get_dept(department)}"
end
