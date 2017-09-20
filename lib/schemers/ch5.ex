defmodule Schemers.GawdStars do
  @moduledoc """
  The First Commandment
  (final version)
  When recurring on a list of atoms, lat, ask two questions about it: (null? tat) and else.
  When recurring on a number, n, ask two questions about it: (zero? n) and else.
  When recurring on a list of S-expressions, l, ask three question about it: (null? l), (atom? (car l», and else
  """

  def remberstar(_, []), do: []
  def remberstar(word, [word | tail]), do: remberstar(word, tail)
  def remberstar(word, [head | tail]) when is_list(head), do: [remberstar(word, head) | remberstar(word, tail)]
  def remberstar(word, [head | tail]), do: [head | remberstar(word, tail)]

  def insertRstar(_new, _old, []), do: []
  def insertRstar(new, word, [head | tail]) when is_list(head) do
    [insertRstar(new, word, head) | insertRstar(new, word, tail)]
  end
  def insertRstar(new, word, [ word | tail]) do
    [word, new | insertRstar(new, word, tail)]
  end
  def insertRstar(new, word, [head | tail]), do: [ head | insertRstar(new, word, tail)]


  def occurstar(_, []), do: 0
  def occurstar(word, [head |tail]) when is_list(head) do
    occurstar(word, head) + occurstar(word, tail)
  end
  def occurstar(word, [word | tail]) do
    1 + occurstar(word, tail)
  end
  def occurstar(word, [ _head | tail]) do
    occurstar(word, tail)
  end


  def subststar(_new, _old, []), do: []
  def subststar(new, old, [head | tail]) when is_list(head) do
    [subststar(new, old, head) | subststar(new, old, tail)]
  end
  def subststar(new, word, [word | tail]) do
    [new | subststar(new, word, tail)]
  end
  def subststar(new, old, [head | tail]) do
    [ head | subststar(new, old, tail) ]
  end


  def insertLstar(_new, _old, []), do: []
  def insertLstar(new, word, [head | tail]) when is_list(head) do
    [insertLstar(new, word, head) | insertLstar(new, word, tail)]
  end
  def insertLstar(new, word, [ word | tail]) do
    [new, word | insertLstar(new, word, tail)]
  end
  def insertLstar(new, word, [head | tail]), do: [ head | insertLstar(new, word, tail)]

  
  def memberstar(_word, []), do: false
  def memberstar(word, [ word | _tail]) when is_atom(word), do: true
  def memberstar(word, [ head | tail]) when is_atom(head), do: memberstar(word, tail)
  def memberstar(word, [ head | tail]), do: memberstar(word, head) || memberstar(word, tail)



  def leftmost([]), do: []
  def leftmost([head |_ ]) when is_atom(head), do: head
  def leftmost([head | _]), do: leftmost(head)


  def eqlist([], []), do: true
  def eqlist(_, []), do: false
  def eqlist([], _), do: false
  def eqlist([h | t1], [h| t2]) when is_atom(h), do: eqlist(t1, t2)
  def eqlist([h1 | _], [h2 | _]) when is_atom(h1) or is_atom(h2), do: false
  def eqlist([h1 | t1], [h2 | t2]), do: eqlist(h1, h2) && eqlist(t1, t2)


  def equal?(s, s), do: true
  def equal?(_, _), do: false

end
