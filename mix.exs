defmodule Phxtest.MixProject do
  use Mix.Project

  def project do
    [
      app: :phxtest,
      version: "0.1.0",
      elixir: "~> 1.6",
      build_embedded: false,
      start_permanent: false,
      description: description(),
      package: package(),
      deps: deps(),
      name: "mix-phxtest",
      source_url: "https://github.com/cybrox/mix-phxtest"
    ]
  end

  def application do
    []
  end

  defp deps do
    [
      {:phoenix, "~> 1.3.0"}
    ]
  end

  defp description do
    """
    Mix task for running specific tests in your [phoenix](https://github.com/phoenixframework/phoenix) 
    project via `mix test` (ex_unit) and `mix watch` ([mix-test.watch](https://github.com/lpil/mix-test.watch)) 
    more conveniently.   

    Let's admit it, we're all lazy and running specific tests in a phoenix project can be a bit of a 
    hassle when specifying the full path. I for one, would prefer to strip the boilerplate text from 
    the command. So, here's a fitting library.
    """
  end

  defp package do
    [
      maintainers: ["Sven Gehring"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/cybrox/mix-phxtest"
      }
    ]
  end
end
