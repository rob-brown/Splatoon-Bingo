defmodule SplatoonBingo.Application do
  @moduledoc false

  use Application

  require Logger

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SplatoonBingoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: SplatoonBingo.PubSub},
      # Start the Endpoint 
      SplatoonBingoWeb.Endpoint,
      SplatoonBingo.Broker,
      {Task, fn -> shutdown_when_inactive(:timer.minutes(10)) end}
    ]

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

  defp shutdown_when_inactive(delay_ms) do
    Process.sleep(delay_ms)

    connections = :ranch.procs(SplatoonBingoWeb.Endpoint.HTTP, :connections)

    if connections == [] do
      Logger.warn("Server idle, shutting down in 3 seconds")
      Process.sleep(:timer.seconds(3))
      System.stop(0)
    else
      Logger.warn("Idle check: #{length(connections)} connections open, checking again in #{delay_ms} ms.")
      shutdown_when_inactive(delay_ms)
    end
  end
end
