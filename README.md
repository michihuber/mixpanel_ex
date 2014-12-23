# MixpanelEx

An Elixir client for the Mixpanel HTTP API. See mixpanel.com.

## Usage
1) Add mixpanel to your deps:

```elixir
{:mixpanel, "0.0.1"}
```

2) Add `:mixpanel` to the list of application dependencies in your `mix.exs`.

```elixir
  def application do
    [applications: [:logger, :mixpanel]]
  end
```

3) Add your mixpanel token to your `config/config.exs` (or similar):

```elixir
config :mixpanel, token: "<YOUR API TOKEN HERE>"
```

4) Track events with `Mixpanel.track`:

```elixir
Mixpanel.track("login", distinct_id: 123)
Mixpanel.track("visited TOS")
```

## License
MIT

