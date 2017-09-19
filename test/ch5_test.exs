defmodule GawdStarsTest do
  use ExUnit.Case
  import Schemers.GawdStars

  test "remberstar" do
    a = :cup
    l = [[:coffee], :cup, [[:tea], :cup], [:and, [:hick]], :cup]

    assert remberstar(a, l) == [[:coffee], [[:tea]], [:and, [:hick]]]
  end


  test " another remberstar" do
    a = :sauce
    l = [[[:tomato, :sauce]],
         [[:bean], :sauce],
         [:and, [[:flying]], :sauce]]

    assert remberstar(a, l) == [[[:tomato]],
                                [[:bean]],
                                [:and, [[:flying]]]]
  end


  test "insertRstar" do
    new = :roast
    old = :chuck
    l = [[:how, :much, [:wood]],
         :could,
         [[:a, [:wood], :chuck]],
         [[[:chuck]]],
         [:if, [:a], [[:wood, :chuck]]],
         :could, :chuck, :wood
        ]

    assert insertRstar(new, old, l) ==
      [[:how, :much, [:wood]],
       :could,
       [[:a, [:wood], :chuck, :roast]],
       [[[:chuck, :roast]]],
       [:if, [:a], [[:wood, :chuck, :roast]]],
       :could, :chuck, :roast, :wood
      ]

  end

  test "occurstar" do
    a = :banana
    l = [[:banana],
         [:split, [[[[:banana, :ice]]],
                   [:cream, [:banana]],
                   :sherbet]],
         [:banana],
         [:bread],
        [:banana, :brandy]]


    assert occurstar(a, l) == 5
  end

  test "subststar" do
    new = :orange
    old = :banana
    l = [[:banana],
         [:split, [[[[:banana, :ice]]],
                   [:cream, [:banana]],
                   :sherbet]],
         [:banana],
         [:bread],
         [:banana, :brandy]]

    assert subststar(new, old, l) == [[:orange],
                                      [:split, [[[[:orange, :ice]]],
                                                [:cream, [:orange]],
                                                :sherbet]],
                                      [:orange],
                                      [:bread],
                                      [:orange, :brandy]]
  end

  test "insertLstar" do
    new = :pecker
    old = :chuck
    l = [[:how, :much, [:wood]],
         :could,
         [[:a, [:wood], :chuck]],
         [[[:chuck]]],
         [:if, [:a], [[:wood, :chuck]]],
         :could, :chuck, :wood
        ]
    new_l = [[:how, :much, [:wood]],
             :could,
             [[:a, [:wood],:pecker, :chuck]],
             [[[:pecker, :chuck]]],
             [:if, [:a], [[:wood, :pecker, :chuck]]],
             :could, :pecker, :chuck, :wood
            ]

    assert insertLstar(new, old, l) == new_l

  end

  test "memberstar" do
    a = :chips
    l = [[:potato], [:chips, [[:with], :fish], [:chips]]]

    assert memberstar(a, l ) == true
  end

  test "leftmost" do
    l = [[:potato], [:chips, [[:with], :fish], [:chips]]]
    l2 = [[[:hot], [:tuna, [:and]]], :cheese]
    l3 = [[[[], :four]], 17, [:seventeen]]
    assert leftmost(l) == :potato
    assert leftmost(l2) == :hot
    assert leftmost(l3) == []
  end

  test "eqlist" do
    l1 = [:strawberry, :ice, :cream]
    l2 = [:strawberry, :ice, :cream]

    assert eqlist(l1, l2) == true
  end


  test "another eqlist" do
    l1 = [:strawberry, :ice, :cream]
    l2 = [:strawberry, :cream, :ice]

    assert eqlist(l1, l2) == false
  end


  test "inner list in eqlist" do
    l1 = [:banana, [[:split]]]
    l2 = [[:banana], [:split]]

    assert eqlist(l1, l2) == false
  end

  test "almost true in eqlist" do
    l1 = [:beef, [[:sausage]], [:and, [:soda]]]
    l2 = [:beef, [[:salami]], [:and, [:soda]]]

    assert eqlist(l1, l2) == false
  end

  test "It's true in eqlist" do
    l1 = [:beef, [[:sausage]], [:and, [:soda]]]
    l2 = [:beef, [[:sausage]], [:and, [:soda]]]

    assert eqlist(l1, l2) == true
  end
end
