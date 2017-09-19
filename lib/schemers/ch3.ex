defmodule Schemers.ConsTheMagnificent do
  def rember(_, []), do: []
  def rember(word, [word | tail]), do: tail
  def rember(word, [head | tail ]), do: [ head | rember(word, tail)]


  def firsts([]), do: []
  def firsts([head_list | tail_lists]) do
    [head | _ ] = head_list 
    [head | firsts(tail_lists) ]
  end



  def insertR(_, _, []), do: []
  def insertR(new, old, [ old | tail]) do
    [old, new | tail]
  end
  def insertR(new, old, [ head | tail]) do
    [ head | insertR(new, old, tail)]
  end

  def insertL(_, _, []), do: []
  def insertL(new, old, list = [ old | _] ) do
    [new | list]
  end
  def insertL(new, old, [ head | tail]) do
    [ head | insertL(new, old, tail)]
  end


  def subst(_, _, []), do: []
  def subst(new, old, [ old | tail ] ) do
    [new | tail ]
  end
  def subst(new, old, [ head | tail]) do
    [ head | subst(new, old, tail)]
  end

  def multirember(_, []), do: []
  def multirember(word, [word | tail]), do: multirember(word, tail)
  def multirember(word, [head | tail ]), do: [ head | multirember(word, tail)]

end
