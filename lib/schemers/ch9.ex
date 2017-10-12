defmodule Schemers.AndAgain do
  import Schemers.NumbersGames, only: [pick: 2]
  # import Schemers.FriendsAndRelations, only: [build: 2, first: 1, second: 1]

  def keep_looking(a, sorn, lat) when is_integer(sorn) do
    keep_looking(a, pick(sorn, lat), lat)
  end
  def keep_looking(a, a, _), do: true
  def keep_looking(_, _, _), do: false

  def looking(a, lat = [head | _tail]) do
    keep_looking(a, head, lat)
  end

  def shift([[h1, h2], h3])  do
    [h1, [h2, h3]]
  end
end

