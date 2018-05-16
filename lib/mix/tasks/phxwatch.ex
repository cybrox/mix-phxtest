defmodule Mix.Tasks.Phxwatch do
  use Mix.Task

  @shortdoc "Build a phoenix compatible mix watch command"
  def run(params) do
    Phxtest.run_command(:watch, params)
  end
end
