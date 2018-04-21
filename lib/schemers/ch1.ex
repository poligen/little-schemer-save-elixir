defmodule Schemers.Toy do

  def car([head | _]), do: head

  def cdr([_ | tail]), do: tail

  def cons(head, tail), do: [head | tail]

  def eq?(a, a) when is_atom(a), do: true
  def eq?(a, b) when is_atom(a) and is_atom(b), do: false

  def null?([]), do: true
  def null?(_), do: false

end
