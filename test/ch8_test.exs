defmodule TheUltimateTest do
  use ExUnit.Case

  import Schemers.LambdaTheUltimate
  import Schemers.GawdStars

  test "rember_f" do
    assert rember_f(&equal?/2, 5, [6, 2, 5, 3]) == [6, 2, 3]
    assert rember_f(&equal?/2, :jelly, [:jelly, :beans, :are, :good]) == [:beans, :are, :good]
    assert rember_f(&equal?/2, [:pop, :corn], [:lemonade, [:pop, :corn], :and, [:cake]]) == [:lemonade, :and, [:cake]]
  end

  test "insertR_f" do
    new = :roast
    old = :could
    l = [
         :could, :chuck, :wood
        ]

    assert insertR_f(&(&1 == &2)).(new, old, l) ==
      [
        :could, :roast, :chuck,  :wood
      ]

  end

  test "insertL_f" do
    new = :roast
    old = :chuck
    l = [
      :could, :chuck, :wood
    ]

    assert insertL_f(&(&1 == &2)).(new, old, l) ==
      [
        :could, :chuck, :roast, :wood
      ]

  end

  test "multiinsertLR" do
    assert multiinsertLR(:zap, :l, :r, [:l, :x, :r, :x])
    ==
    [:zap, :l, :x, :r, :zap, :x]
  end


end
