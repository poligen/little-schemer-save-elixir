defmodule Schemers.Friends do
  import Schemers.Again, only: [member?: 2]

  def set?([]), do: true
  def set?([ head | tail ]) do
    case member?(head, tail) do
      true -> false
      false -> set?(tail)
    end
  end

  def makeset([]), do: []
  def makeset([ head | tail]) do
    case member?(head, tail) do
      true -> makeset(tail)
      false -> [head | makeset(tail)]
    end
  end

  def subset?([], _), do: true
  def subset?([head | tail], set2) do
    case member?(head, set2) do
      true -> subset?(tail, set2)
      false -> false
    end
  end


  def eqset?([], []), do: true
  def eqset?(set1, set2) when length(set1) == length(set2) do
    subset?(set1, set2)
  end
  def eqset?(_, _), do: false


  def intersect?([], _), do: false
  def intersect?([head | tail], set2) do
    case member?(head, set2) do
      true -> true
      false -> intersect?(tail, set2)
    end
  end


  def intersect([], _), do: []
  def intersect([head | tail], set2) do
    case member?(head, set2) do
      true -> [head | intersect(tail, set2)]
      false -> intersect(tail, set2)
    end

  end

  def union([], set2), do: set2
  def union([head | tail], set2) do
    case member?(head, set2) do
      true -> union(tail, set2)
      false -> [head | union(tail, set2)]
    end
  end

  def setdifference([], _), do: []
  def setdifference([head | tail], set2) do
    case member?(head, set2) do
      true -> setdifference(tail, set2)
      false -> [head | setdifference(tail, set2)]
    end
  end

  def intersectall([set1 |[]]), do: set1
  def intersectall([ set1 | tail]), do: intersect(set1, intersectall(tail))

  def first([f|_]), do: f
  def second([_,s|_]), do: s
  def third([_,_,t|_]), do: t
  def build(s1, s2), do: [s1, s2]

end
