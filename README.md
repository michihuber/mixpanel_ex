# MixpanelEx

An Elixir client for the Mixpanel HTTP API. See mixpanel.com.

## Usage
1) Add mixpanel to your deps:

```
{:mixpanel, "0.0.1"}
```

2) Add `:mixpanel` to your applications.

3) Add your mixpanel token to your `config/config.exs` (or similar):

```
config :mixpanel, token: <YOUR API TOKEN HERE>
```

4) Track events with `Mixpanel.track`:

```
Mixpanel.track("login", [distinct_id: 123])
Mixpanel.track("visited TOS")
```

## License
MIT

