defmodule Schemers.Again do

  def lat?([]), do: true
  def lat?([ head | tail]), do: is_atom(head) && lat?(tail)


  def member?(_, []), do: false
  def member?(a, [a | _ ]), do: true
  def member?(a, [_ | tail]), do: member?(a, tail)

end
