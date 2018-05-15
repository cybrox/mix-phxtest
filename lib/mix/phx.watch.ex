defmodule Mix.Tasks.Phx.Watch do
  use Mix.Task

  @shortdoc "Build a phoenix compatible mix watch command"
  def run(params) do
    Phxtest.run_command(:watch, params)
  end
end
