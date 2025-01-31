defmodule Mark.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MarkWeb.Telemetry,
      Mark.Repo,
      {DNSCluster, query: Application.get_env(:mark, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Mark.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Mark.Finch},
      # Start a worker by calling: Mark.Worker.start_link(arg)
      # {Mark.Worker, arg},
      # Start to serve requests, typically the last entry
      MarkWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Mark.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MarkWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
