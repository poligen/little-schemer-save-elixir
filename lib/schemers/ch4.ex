defmodule Schemers.NumbersGames do
  def plus(n, 0), do: n
  def plus(n, m), do: 1 + plus( n, (m - 1) )

  def minus(n, 0), do: n
  def minus(n, m ), do: minus(n, (m - 1)) - 1

  def addtup([]), do: 0
  def addtup([head | tail]), do: head + addtup(tail)

  def multiply(_, 0), do: 0
  def multiply(n, m), do: n + multiply(n, (m - 1))


  def tupplus([], []), do: []
  def tupplus(t1, []), do: t1
  def tupplus([], t2), do: t2
  def tupplus([h1 | t1], [h2 | t2]) do
    [ h1 + h2 | tupplus(t1, t2)]
  end

  def greater_than(0, 0), do: false
  def greater_than(_, 0), do: true
  def greater_than(0, _), do: false
  def greater_than(m, n) do
    greater_than((m - 1), (n - 1))
  end


  def less_than(0, 0), do: false
  def less_than(_, 0), do: false
  def less_than(0, _), do: true
  def less_than(m, n) do
    less_than((m - 1), (n - 1))
  end

  def power(m, 1), do: m
  def power(m, n), do: m * power(m, (n - 1))

  def divide(m, n) when m < n, do: 0
  def divide(m, n), do: 1 + divide((m - n), n)


  def lengthS([]), do: 0
  def lengthS([_ | tail]), do: 1 + length(tail)

  def pick(_, []), do: []
  def pick(1, [head | _] ), do: head
  def pick(n, [ _head | tail ]),  do: pick(( n - 1 ), tail)

  def rempick(_, []), do: []
  def rempick(1, [_head | tail]), do: tail
  def rempick(n, [head | tail]), do: [head | rempick((n - 1), tail)]


  def nonums([]), do: []
  def nonums([head | tail]) when is_number(head), do: nonums(tail)
  def nonums([head | tail]), do: [head | nonums(tail)]


  def allnums([]), do: []
  def allnums([head | tail]) when is_number(head), do: [head | allnums(tail)]
  def allnums([_ | tail]), do: allnums(tail)

  def occur(_word, []), do: 0
  def occur(word, [word | tail]), do: 1 + occur(word, tail)
  def occur(word, [_head | tail]), do: occur(word, tail)
end
