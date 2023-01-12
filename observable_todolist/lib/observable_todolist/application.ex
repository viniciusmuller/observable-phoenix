defmodule ObservableTodolist.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ObservableTodolist.PromEx,
      # Start the Telemetry supervisor
      ObservableTodolistWeb.Telemetry,
      # Start the Ecto repository
      ObservableTodolist.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ObservableTodolist.PubSub},
      # Start Finch
      {Finch, name: ObservableTodolist.Finch},
      # Start the Endpoint (http/https)
      ObservableTodolistWeb.Endpoint
      # Start a worker by calling: ObservableTodolist.Worker.start_link(arg)
      # {ObservableTodolist.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ObservableTodolist.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ObservableTodolistWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
