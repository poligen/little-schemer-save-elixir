defmodule NumbersGamesTest do
  use ExUnit.Case

  import Schemers.NumbersGames

  test "plus" do
    assert plus(15, 3) == 18
  end

  test "minus" do
    assert minus(17, 9) == 8
  end

  test "addtup" do
    assert addtup([3,5,2,8]) == 18
  end

  test "another addtup" do
    assert addtup([15, 6, 7, 12, 3]) == 43
  end

  test "multiply" do
    assert multiply(5, 3) == 15
  end

  test "tupplus" do
    tup1 = [3, 6, 9, 11, 4]
    tup2 = [8,5, 2, 0, 7]
    assert tupplus(tup1, tup2) == [11, 11, 11, 11, 11]
  end

  test "differnt length of tups" do
    tup1 = [3, 7]
    tup2 = [4, 8, 6, 1]
    assert tupplus(tup1, tup2) == [7, 15, 6, 1]
  end

  test "greater than" do
    assert greater_than(12, 133) == false
    assert greater_than(133, 12) == true
  end

  test "less than" do
    assert less_than(4, 6) == true
    assert less_than(8, 3) == false
    assert less_than(6, 6) == false
  end

  test "power" do
    assert power(1,1) == 1
    assert power(2,3) == 8
    assert power(5,3) == 125
  end

  test "divide" do
    assert divide(15, 4) == 3
    assert divide(18, 5) == 3
  end

  test "lengthS" do
    lat = [:hotdogs, :with, :mustard, :sauerkraut, :and, :pickles]
    lat2 = [:ham, :and, :cheese, :on, :rye]
    assert lengthS(lat) == 6
    assert lengthS(lat2) == 5
  end

  test "pick" do
    lat = [:lasagna, :spaghetti, :ravioli, :macaroni, :meatball]
    n = 4
    assert pick(n, lat) == :macaroni
  end

  test "rempick" do
    n = 3
    lat = [:hotdogs, :with, :hot, :mustard]

    assert rempick(n , lat) == [:hotdogs, :with, :mustard]
  end

  test "nonums" do
    lat = [5, :pears, 6, :prunes, 9, :dates]
    assert nonums(lat) == [:pears, :prunes, :dates]
  end

  test "allnums" do
    lat = [5, :pears, 6, :prunes, 9, :dates]
    assert allnums(lat) == [5, 6, 9]
  end

  test "occur" do
    a = :hot
    lat = [:hot, :dogs, :with, :hot, :mustard]
    assert occur(a, lat) == 2
  end

end
