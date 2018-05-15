defmodule PhxtestTest do
  use ExUnit.Case
  doctest Phxtest

  test "Raises an error when not enough arguments are passed" do
    assert_raise(Mix.Error, "No module name given. Check out mix phx.test help for more information", fn ->
      Mix.Tasks.Phx.Test.run(["c"])
    end)
  end

  test "Raises an error when an invalid type is passed" do
    assert_raise(Mix.Error, "Invalid type given. Check out mix phx.test help for more information", fn ->
      Mix.Tasks.Phx.Test.run(["o", "user"])
    end)
  end

  test "Generates proper path for user controller" do
    assert "test/phxtest_web/controllers/user_controller_test.exs" == Mix.Tasks.Phx.Test.run(["c", "user"])
  end

  test "Generates proper path for user controller with line" do
    assert "test/phxtest_web/controllers/user_controller_test.exs:12" == Mix.Tasks.Phx.Test.run(["c", "user", "12"])
  end

  test "Generates proper path for user view" do
    assert "test/phxtest_web/views/user_view_test.exs" == Mix.Tasks.Phx.Test.run(["v", "user"])
  end

  test "Generates proper path for user view with line" do
    assert "test/phxtest_web/views/user_view_test.exs:33" == Mix.Tasks.Phx.Test.run(["v", "user", "33"])
  end

  test "Generates proper path for auth plug" do
    assert "test/phxtest_web/plug/auth_plug_test.exs" == Mix.Tasks.Phx.Test.run(["p", "auth"])
  end

  test "Generates proper path for auth plug with line" do
    assert "test/phxtest_web/plug/auth_plug_test.exs:10" == Mix.Tasks.Phx.Test.run(["p", "auth", "10"])
  end
end
