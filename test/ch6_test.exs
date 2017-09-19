defmodule ShadowsTest do
  use ExUnit.Case
  import Schemers.Shadows

  test "numberred?" do
    x = 1
    y = [3, :+, [ 4, :*, 5 ]]
    z = [2, :*, :sausage]
    assert numberred?(x) == true
    assert numberred?(y)== true
    assert numberred?(z)== false
  end

  test "value" do
    u = 13
    x = [1, :+, 3]
    y = [1, :+, [3, :^, 4]]

    assert value(u) == 13
    assert value(x) == 4
    assert value(y) == 82
  end
end
