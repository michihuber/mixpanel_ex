defmodule Mixpanel.Mixfile do
  use Mix.Project

  def project do
    [app: :mixpanel,
     version: "0.0.1",
     elixir: "~> 1.0",
     deps: deps]
  end

  def application do
    [applications: [:logger],
     env: [token: nil],
     mod: {Mixpanel, []}]
  end

  defp deps do
    [{:exjsx, "~> 3.1.0"}]
  end
end
