defmodule Htmex.MixProject do
  use Mix.Project

  def project do
    [
      app: :htmex,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      name: "HTMeX",
      source_url: "https://github.com/AnthonyMujic/htmex"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug, ">= 1.10.0"},
      {:phoenix, ">= 1.6.0"},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false}
    ]
  end

  defp description() do
    """
      HTMeX simplifies working with the HTMX javascript library to progressively enhance dead views
      in a Phoenix web application.
    """
  end

  defp package() do
    [
      # These are the default files included in the package
      files: ~w(lib .formatter.exs mix.exs README* LICENSE*
                CHANGELOG*),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/AnthonyMujic/htmex"}
    ]
  end
end
