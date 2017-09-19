defmodule ToyTest do
  use ExUnit.Case

  import Schemers.Toy

  test "car" do
    l = [[[:hotdogs]],
         [:and],
         [:pickle],
         :relish
        ]
    assert car(l) == [[:hotdogs]]
  end

  test "cdr" do
    l = [:a, :b, :c]
    assert cdr(l) == [:b, :c]
  end

end
