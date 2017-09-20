defmodule Schemers.LambdaTheUltimate do
  # import Schemers.GawdStars, only: [equal?: 2]

  def rember_f(_, _, []), do: []
  def rember_f(f, a, [h|t]) do
    case f.(a, h) do
      true -> t
      false -> [h | rember_f(f, a, t)]
    end
  end


  def eq_c(a), do: fn (x) -> a == x end

  def eq_salad, do: eq_c(:salad)

  def insertR_f(test_fn) do
    fn(_, _, []) -> []
      (new, old, [head | tail]) ->
        case test_fn.(old, head) do
          true -> [head, new | tail ]
          false -> [ head | insertR_f(test_fn).(new, old, tail)]
        end
    end
  end

  def insertL_f(test_fn) do
    fn(_, _, []) -> []
      (new, old, [head | tail] = list) ->
        case test_fn.(old, head) do
          true -> [new | list ]
          false -> [ head | insertR_f(test_fn).(new, old, tail)]
        end
    end
  end

  def seqL(new, old, list), do: [new, old | list]
  def seqR(new, old, list), do: [old, new | list]

  # p147


end

