defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, &(&1.price), :asc)
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, fn item -> item.price === nil end)
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn item ->
      if String.contains?(item.name, old_word) do
        Map.update(item, :name, old_word, fn name -> String.replace(name, old_word, new_word) end)
      else
        item
      end
    end)
  end

  def increase_quantity(item, count) do
    Map.update(item, :quantity_by_size, 0, fn quantity_by_size ->
      Map.new(quantity_by_size, fn {key, value} -> {key, value + count} end)
    end)
  end

  def total_quantity(item) do
    Enum.reduce(item[:quantity_by_size], 0, fn {_key, value}, acc -> acc + value end)
  end
end
