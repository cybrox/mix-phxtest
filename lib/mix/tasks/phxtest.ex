defmodule Mix.Tasks.Phxtest do
  use Mix.Task

  @shortdoc "Build a phoenix compatible mix test command"
  def run(params) do
    Phxtest.run_command(:test, params)
  end
end
