defmodule SchemersTest do
  use ExUnit.Case
  doctest Schemers

  test "greets the world" do
    assert Schemers.hello() == :world
  end
end
