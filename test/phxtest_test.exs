defmodule PhxtestTest do
  use ExUnit.Case
  doctest Phxtest

  test "greets the world" do
    assert Phxtest.hello() == :world
  end
end
