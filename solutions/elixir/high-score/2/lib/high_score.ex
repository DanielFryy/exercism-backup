defmodule HighScore do
  @constant_number 0
  
  def new(), do: Map.new()

  def add_player(scores, name, score \\ @constant_number), do: Map.put(scores, name, score)

  def remove_player(scores, name), do: Map.delete(scores, name)

  def reset_score(scores, name) do
    Map.update(scores, name, @constant_number, fn _score -> @constant_number end)
  end

  def update_score(scores, name, score) do
    Map.update(scores, name, score, fn prev_score -> prev_score + score end)
  end

  def get_players(scores), do: Map.keys(scores)
end
