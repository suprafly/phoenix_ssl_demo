defmodule PhoenixSslDemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PhoenixSslDemoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhoenixSslDemo.PubSub},
      # Start Finch
      {Finch, name: PhoenixSslDemo.Finch},
      # Start the Endpoint (http/https)
      {SiteEncrypt.Phoenix, PhoenixSslDemoWeb.Endpoint}

      # Start a worker by calling: PhoenixSslDemo.Worker.start_link(arg)
      # {PhoenixSslDemo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixSslDemo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhoenixSslDemoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
