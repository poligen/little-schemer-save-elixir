defmodule AndAgainTest do
  use ExUnit.Case

  import Schemers.AndAgain

  test "keep looking" do
    a = :caviar
    lat = [6, 2, 4, :caviar, 5, 7, 3]
    assert keep_looking(a, 3, lat)
  end

  test "looking and looking" do
    a = :caviar
    lat = [6, 2, 4, :caviar, 5, 7, 3]
    assert looking(a, lat)
  end

  test "looking and looking with grits" do
    a = :caviar
    lat = [6, 2, :grits, :caviar, 5, 7, 3]
    refute looking(a, lat)
  end

  test "shift a b c" do
    x = [[:a, :b], :c]
    assert shift(x) == [:a, [:b, :c]]
  end

  test "shift a b c d" do
    x = [[:a, :b], [:c, :d]]
    assert shift(x) == [:a, [:b, [:c, :d]]]
  end
end
