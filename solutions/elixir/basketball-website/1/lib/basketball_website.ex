defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    keys = String.split(path, ".")
    search(data, keys)
  end

  defp search(current_data, []), do: current_data

  defp search(current_data, [key | rest]) do
    new_data = current_data[key]
    search(new_data, rest)
  end

  def get_in_path(data, path) do
    keys = String.split(path, ".")
    get_in(data, keys)
  end
end
