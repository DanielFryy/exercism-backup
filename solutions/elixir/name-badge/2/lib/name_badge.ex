defmodule NameBadge do
  def print(id, name, department) do
    valid_id = if id, do: "[#{id}] - ", else: ""
    valid_department = if department, do: "#{department}", else: "owner"
    "#{valid_id}#{name} - #{String.upcase(valid_department)}"
  end
end
