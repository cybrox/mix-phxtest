defmodule Phxtest.MixProject do
  use Mix.Project

  def project do
    [
      app: :mix_phxtest,
      version: "0.2.1",
      elixir: "~> 1.6",
      build_embedded: false,
      start_permanent: false,
      description: description(),
      package: package(),
      deps: deps(),
      name: "mix_phxtest",
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
    Mix task for running specific tests in your phoenix project via 'mix test' (ex_unit) and 
    'mix watch' (mix-test.watch, not included) more conveniently, using short path aliases.
    """
  end

  defp package do
    [
      name: "mix_phxtest",
      maintainers: ["Sven Gehring"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/cybrox/mix-phxtest"
      }
    ]
  end
end
