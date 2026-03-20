defmodule WebdslPlug.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      WebdslPlugWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:webdsl_plug, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: WebdslPlug.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: WebdslPlug.Finch},
      # Start a worker by calling: WebdslPlug.Worker.start_link(arg)
      # {WebdslPlug.Worker, arg},
      # Start to serve requests, typically the last entry
      WebdslPlugWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WebdslPlug.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    WebdslPlugWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
