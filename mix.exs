defmodule Elistix.Mixfile do
  use Mix.Project

  def project do
    [app: :elistix,
     version: "0.1.2",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description,
     package: package,
     deps: deps()]
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
      name: :elistix,
      maintainers: ["Leandro Costantini"],
      licenses: ["GPL 3.0"],
      links: %{"GitHub" => "https://github.com/lcostantini/elistix"}
    ]
  end

  defp deps do
    [{:httpoison, "~> 0.10.0"},
     {:poison, "~> 2.0"},
     {:inch_ex, "~> 0.5", only: [:dev, :test]},
     {:ex_doc, "~> 0.14", only: :dev}]
  end
end
