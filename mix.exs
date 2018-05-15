defmodule Phxtest.MixProject do
  use Mix.Project

  def project do
    [
      app: :phxtest,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: false,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:phoenix, "~> 1.3.0"}
    ]
  end
end
