defmodule PhxtestTest do
  use ExUnit.Case

  test "Raises an error when not enough arguments are passed" do
    assert_raise(Mix.Error, "No module name given. Check out mix phx.test help for more information", fn ->
      Phxtest.run_command(:test, ["c"])
    end)
  end

  test "Raises an error when an invalid type is passed" do
    assert_raise(Mix.Error, "Invalid type given. Check out mix phx.test help for more information", fn ->
      Phxtest.run_command(:test, ["o", "user"])
    end)
  end

  test "Generates proper path for user controller" do
    assert "test/phxtest_web/controllers/user_controller_test.exs" == Phxtest.create_test_path("c", "user")
  end

  test "Generates proper path for user controller with line" do
    assert "test/phxtest_web/controllers/user_controller_test.exs:12" == Phxtest.create_test_path("c", "user", "12")
  end

  test "Generates proper path for user view" do
    assert "test/phxtest_web/views/user_view_test.exs" == Phxtest.create_test_path("v", "user")
  end

  test "Generates proper path for user view with line" do
    assert "test/phxtest_web/views/user_view_test.exs:33" == Phxtest.create_test_path("v", "user", "33")
  end

  test "Generates proper path for auth plug" do
    assert "test/phxtest_web/plug/auth_plug_test.exs" == Phxtest.create_test_path("p", "auth")
  end

  test "Generates proper path for auth plug with line" do
    assert "test/phxtest_web/plug/auth_plug_test.exs:10" == Phxtest.create_test_path("p", "auth", "10")
  end
end
