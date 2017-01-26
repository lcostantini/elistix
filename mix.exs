defmodule Elistix.Mixfile do
  use Mix.Project

  def project do
    [app: :elistix,
     version: "1.0.1",
     elixir: "~> 1.3",
     name: "Elistix",
     description: description(),
     package: package(),
     deps: deps(),
     source_url: "https://github.com/lcostantini/elistix"]
  end

  def application do
    [applications: [:logger, :httpoison]]
  end

  defp description do
    """
    Use Elasticsearch along with your Elixir app without learn any new DSL.
    """
  end

  defp package do
    [
      files: ["lib", "README.md", "LICENSE", "mix.exs"],
      maintainers: ["Leandro Costantini"],
      licenses: ["GPL 3.0"],
      links: %{"GitHub" => "https://github.com/lcostantini/elistix"}
    ]
  end

  defp deps do
    [{:httpoison, "~> 0.11"},
     {:inch_ex, "~> 0.5", only: [:dev, :test]},
     {:ex_doc, "~> 0.14", only: :dev}]
  end
end
