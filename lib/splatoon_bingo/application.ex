defmodule SplatoonBingo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SplatoonBingoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: SplatoonBingo.PubSub},
      # Start the Endpoint (http/https)
      SplatoonBingoWeb.Endpoint,
      {Task, fn -> shutdown_when_inactive(:timer.minutes(10)) end}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SplatoonBingo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SplatoonBingoWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp shutdown_when_inactive(every_ms) do
    Process.sleep(every_ms)

    if :ranch.procs(SplatoonBingoWeb.Endpoint.HTTP, :connections) == [] do
      System.stop(0)
    else
      shutdown_when_inactive(every_ms)
    end
  end
end
