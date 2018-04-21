defmodule ConsTheMagnificentTest do
  use ExUnit.Case

  import Schemers.ConsTheMagnificent

  test "rember" do
    a = :mint
    lat = [:lamb, :chops, :and, :mint, :jelly]
    assert rember(a, lat) == [:lamb, :chops, :and, :jelly]
  end

  test "firsts" do
    assert firsts([[:a, :b], [:c, :d], [:e, :f]])
    == [:a, :c, :e]
  end

  test "firsts with fruit" do
    l = [["apple", "peach", "pumpkin"],
         ["plum", "pear", "cherry"],
         ["grape", "raisin", "pea"],
         ["bean", "carrot", "eggplant"]
        ]
    assert firsts(l) == ["apple", "plum", "grape", "bean"]
  end

  test "insertR" do
    new = :topping
    old = :fudge
    lat = [:ice, :cream, :with, :fudge, :for, :dessert]

    assert insertR(new, old, lat) == [:ice, :cream, :with, :fudge, :topping, :for, :dessert]

  end

  test "another insertR" do
    new = :jalapeno
    old = :and
    lat = [:tacos, :tamales, :and, :salsa]

    assert insertR(new, old, lat) == [:tacos, :tamales, :and, :jalapeno, :salsa]

  end

  test "insertL" do
    new = :topping
    old = :fudge
    lat = [:ice, :cream, :with, :fudge, :for, :dessert]

    assert insertL(new, old, lat) == [:ice, :cream, :with, :topping, :fudge, :for, :dessert]

  end

  test "subst" do
    new = :topping
    old = :fudge
    lat = [:ice, :cream, :with, :fudge, :for, :dessert]

    assert subst(new, old, lat) == [:ice, :cream, :with, :topping, :for, :dessert]
  end

  test "multirember" do
    a = :mint
    lat = [:lamb, :chops, :and, :mint, :jelly, :mint, :fish]
    assert multirember(a, lat) == [:lamb, :chops, :and, :jelly, :fish]
  end

  test "multisubst" do
    a = :monkey
    b = :mint
    lat = [:lamb, :chops, :and, :mint, :jelly, :mint, :fish]
    assert multisubst(a, b, lat) == [:lamb, :chops, :and, :monkey, :jelly, :monkey, :fish]
  end


end

