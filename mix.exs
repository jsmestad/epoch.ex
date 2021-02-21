defmodule Epoch.MixProject do
  use Mix.Project

  def project do
    [
      app: :epoch,
      version: "1.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "A library that converts between epoch and native Elixir DateTime",
      package: package(),
      source_url: "https://github.com/jsmestad/epoch.ex"
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "LICENSE"],
      maintainers: ["Justin Smestad"],
      licenses: ["Apache-2.0"],
      links: %{"Github" => "https://github.com/jsmestad/epoch.ex"}
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, ">= 0.19.0", only: :dev}
    ]
  end
end
