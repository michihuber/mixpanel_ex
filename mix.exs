defmodule Mixpanel.Mixfile do
  use Mix.Project

  def project do
    [app: :mixpanel,
     version: "0.0.1",
     elixir: "~> 1.0",
     deps: deps,

     description: "A client for the Mixpanel HTTP API. See mixpanel.com.",
     package: [
       contributors: ["MSch", "michihuber"],
       licenses: ["MIT"],
       links: %{"Github" => "https://github.com/michihuber/mixpanel_ex"},
     ],
    ]
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

