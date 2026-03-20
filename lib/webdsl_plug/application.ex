defmodule WebdslPlug.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Finch, name: WebdslPlug.Finch},
      {Phoenix.PubSub, name: WebdslPlug.PubSub},
      WebdslPlugWeb.Telemetry,
      WebdslPlugWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: WebdslPlug.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    WebdslPlugWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
