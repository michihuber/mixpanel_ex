require Logger

defmodule Mixpanel.Client do
  @events_endpoint 'https://api.mixpanel.com/track'
  @success_response_body '1'

  use GenServer

  def start_link(token) do
    {:ok, conn} = :inets.start(:httpc, [profile: :mixpanel_http_profile])
    :httpc.set_options([pipeline_timeout: 30000], conn)

    state = %{connection: conn, token: token}
    GenServer.start_link(__MODULE__, state, [name: :mixpanel_client])
  end

  def track(event, properties) do
    GenServer.cast(:mixpanel_client, {:track, event, properties})
  end

  def handle_cast({:track, event, properties}, state)  do
    properties = Dict.put(properties, :token, state.token)
    {:ok, json} = JSX.encode([event: event, properties: properties])
    body = String.to_char_list("data=#{ :base64.encode(json) }")

    request = {@events_endpoint, _headers = [], _content_type = 'text/plain', body}
    result = :httpc.request(:post, request, _http_opts=[], _opts=[], state.connection)
    case result do
      {:ok, {_, _, @success_response_body}} -> :ok
      _ -> Logger.warn("Problem tracking mixpanel event: " <> inspect(result))
    end

    {:noreply, state}
  end
end

