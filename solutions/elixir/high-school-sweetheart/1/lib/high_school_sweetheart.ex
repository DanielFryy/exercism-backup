defmodule HighSchoolSweetheart do
  def first_letter(name) do
    String.trim(name)
    |> String.at(0)
  end

  def initial(name) do
    first_letter(name)
    |> String.upcase()
    |> Kernel.<>(".")
  end

  def initials(full_name) do
    [name, lastname] = String.split(full_name)
    formatted_name = initial(name)
    formatted_lastname = initial(lastname)
    formatted_name <> " " <> formatted_lastname
  end

  def pair(full_name1, full_name2) do
    sweetheart1 = initials(full_name1)
    sweetheart2 = initials(full_name2)
    """
    ❤-------------------❤
    |  #{sweetheart1}  +  #{sweetheart2}  |
    ❤-------------------❤
    """
  end
end
