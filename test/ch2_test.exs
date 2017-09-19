defmodule AgainTest do
  use ExUnit.Case
  import Schemers.Again

  test "lat?" do
    l = [:Jack, :Spart, :could, :eat, :no, :chicken, :fat]
    l2 = [[:Jack], :Spart, :could, :eat, :no, :chicken, :fat]

    assert lat?(l) == true
    assert lat?(l2) == false
  end

  test "member?" do
    a = :meat
    lat = [:potatoes, :and, :meat, :gravy]

    assert member?(a, lat) == true
  end
end

