defmodule Phxtest do
  @moduledoc """
  Mix tasks for running specific tests via `mix test` (ex_unit) and `mix watch` ([extension](https://github.com/lpil/mix-test.watch)) fast.  
  """

  @doc """
  Run the mix command.

  This is offloaded into a separate module, since both, the test
  and watch command essentially do the same but need separate files
  """
  def run_command(command, params) do
    type = Enum.at(params, 0)
    name = Enum.at(params, 1)
    line = Enum.at(params, 2)

    if Enum.member?(["help", nil], type) do
      show_usage_information()
    else
      generate_command(command, type, name, line)
    end
  end

  @doc """
  Show helpful usage information from README
  """
  def show_usage_information do
    Mix.shell.info """
      Usage: mix phxtest <type> <name> [line]
            mix phxwatch <type> <name> [line]

      type:  c - controller (/test/myapp_web/controllers/)
            v - view       (/test/myapp_web/views/)
            p - plug       (/test/myapp_web/plug/)
            w - web        (/test/myapp_web/)
            l - lib        (/test/myapp/)

      name:  The name of your file, you can add additional
            subdirectories here, if needed.

      line:  The line of the test, if you only want to execute
            a single test. This is optional.
            

      idea:  The phxtest and phxwatch are just aliases that
            perform simple string interpolation. The commands
            you are generating are composed like this:
            $ mix phxtest c user 12
            $ mix test /test/controllers/user_controller_test.exs:12
    """
  end

  @doc """
  Generate a test/watch command with the given parameters

  This implementation also catches the minimum param count (2)
  """
  def generate_command(command, type, name, line) when is_binary(name) do
    path = Phxtest.create_test_path(type, name, line)
    
    case command do
      :test ->
        Mix.Tasks.Test.run([path])
      :watch ->
        if Code.ensure_compiled?(Mix.Tasks.Watch) do
          Mix.Task.run("watch #{path}")
        else
          Mix.raise "You need to have lpil/mix-test.watch installed to use phx.watch"
        end
    end
  end

  def generate_command(_command, _type, _name, _line) do
    Mix.raise("No module name given. Check out mix phx.test help for more information")
  end

  @doc """
  Create the test/watch path with the given parameters

  This utilizes all private functions for generating what
  you would usually have to type in your shell manually
  """
  def create_test_path(type, name, line \\ nil) do
    base = path_to_subdirectory(type)
    module = typed_module_name(type, name)
    specific = if line == nil, do: "", else: ":#{line}"

    "#{base}#{module}#{specific}"
  end

  defp typed_module_name(type, name) do
    case type do
      "c" -> "#{name}_controller_test.exs"
      "v" -> "#{name}_view_test.exs"
      "p" -> "#{name}_plug_test.exs"
      _ -> "#{name}_test.exs"
    end
  end

  defp path_to_subdirectory(type) do
    case type do
      "c" -> "test/#{path_to_codebase(:web)}/controllers/"
      "v" -> "test/#{path_to_codebase(:web)}/views/"
      "p" -> "test/#{path_to_codebase(:web)}/plug/"
      "w" -> "test/#{path_to_codebase(:web)}/"
      "l" -> "test/#{path_to_codebase(:lib)}/"
      _ -> Mix.raise("Invalid type given. Check out mix phx.test help for more information")
    end
  end

  defp path_to_codebase(lib) do
    case lib do
      :lib ->
        parent_otp_app()
      
      :web ->
        "#{parent_otp_app()}_web"
    end
  end

  defp parent_otp_app() do
    if Code.ensure_compiled?(Mix.Phoenix) do
      Mix.Phoenix.otp_app()
    else
      :unknown
    end
  end
end
