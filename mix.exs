defmodule ExPVE.MixProject do
  use Mix.Project

  @source_url "https://github.com/kyleculp/ex_proxmox"
  @version "0.1.0"

  def project do
    [
      app: :ex_proxmox,
      version: @version,
      elixir: "~> 1.10",
      description: "Generic Proxmox client",
      name: "ExPVE",
      source_url: @source_url,
      deps: deps(),
      docs: docs(),
      dialyzer: [
        plt_add_apps: [:mix, :hackney, :configparser_ex, :jsx]
      ],
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      [extra_applications: [:logger, :crypto], mod: {ExPVE, []}]
      # extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:telemetry, "~> 0.4.3 or ~> 1.0"},
      {:mime, "~> 1.2 or ~> 2.0"},
      {:bypass, "~> 2.1", only: :test},
      {:configparser_ex, "~> 4.0", optional: true},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.16", only: [:dev, :test]},
      {:hackney, "~> 1.16", optional: true},
      {:jason, "~> 1.1", optional: true},
      {:jsx, "~> 2.8 or ~> 3.0", optional: true},
      {:mox, "~> 1.0", only: :test},
      {:excoveralls, "~> 0.10", only: :test},
      {:httpotion, "~> 3.1", only: :test}
    ]
  end

  defp package do
    [
      description: description(),
      files: ["priv", "lib", "config", "mix.exs", "README*", "LICENSE"],
      maintainers: ["Kyle Culp"],
      licenses: ["MIT"],
      links: %{
        Changelog: "#{@source_url}/blob/master/CHANGELOG.md",
        GitHub: @source_url
      }
    ]
  end

  defp description do
    """
    Proxmox client for Elixir. Heavily inspired by ex_aws. Tested on PVE 6, 7, 8.
    """
  end

  defp docs do
    [
      main: "readme",
      source_ref: "v#{@version}",
      source_url: @source_url,
      extras: ["README.md"]
    ]
  end
end
