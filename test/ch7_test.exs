defmodule FriendsTest do
  use ExUnit.Case
  import Schemers.Friends

  test "set?" do
    lat = [:apples, :peaches, :pears, :plums]
    lat2 = [:apples, :peaches, :apples, :plums]

    assert set?(lat) == true
    assert set?(lat2) == false
  end

  test "makeset" do
    lat = [:apple, :peach, :pear, :peach,
          :plum, :apple, :lemon, :peach]

    assert makeset(lat) == [:pear, :plum, :apple, :lemon, :peach]
  end

  test "subset?" do
    set1 = [5, :chicken, :wings]
    set2 = [5, :hamburgers,
            2, :pieces, :fried, :chicken, :and,
            :light, :duckling, :wings]
    assert subset?(set1, set2) == true
  end

  test "another subset?" do
    set1 = [4, :pounds, :of, :horseradish]
    set2 = [:four, :pounds, :chicken, :and,
            5, :ounces, :horseradish]

    assert subset?(set1, set2) == false
  end

  test "eqset?" do
    set1 = [6, :large, :chickens, :with, :wings]
    set2 = [6, :chickens, :with,  :large,:wings]

    assert eqset?(set1, set2) == true
  end

  test "intersect?" do
    set1 = [:stewed, :tomatoes, :and, :macaroni]
    set2 = [:macaroni, :and, :cheese]

    assert intersect?(set1, set2) == true
  end

  test "intersect" do
    set1 = [:stewed, :tomatoes, :and, :macaroni]
    set2 = [:macaroni, :and, :cheese]

    assert intersect(set1, set2) == [:and, :macaroni]
  end

  test "union" do
    set1 = [:stewed, :tomatoes, :and,
            :macaroni, :casserole]
    set2 = [:macaroni, :and, :cheese]

    assert union(set1, set2) == [:stewed, :tomatoes, :casserole, :macaroni, :and, :cheese]
  end

  test "setdifference" do
    set1 = [:stewed, :tomatoes, :and, :macaroni]
    set2 = [:macaroni, :and, :cheese]

    assert setdifference(set1, set2) == [:stewed, :tomatoes]
  end

  test "intersectall" do
    l_set = [[:a, :b, :c], [:c, :a, :d, :e], [:e, :f, :g, :h, :a, :b]]
    assert intersectall(l_set) == [:a]
  end

  test "another intersect" do
   l_set = [[6, :pears, :and],
            [3, :peaches, :and, 6, :peppers],
            [8, :pears, :and, 6, :plums],
            [:and, 6, :prunes, :with, :some, :apples]]

    assert intersectall(l_set) == [6, :and]
  end




end


