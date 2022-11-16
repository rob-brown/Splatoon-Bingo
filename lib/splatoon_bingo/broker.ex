defmodule SplatoonBingo.Broker do
  alias SplatoonBingo.BingoBoard

  require Logger

  @registry __MODULE__.Registry
  @agent __MODULE__.Agent

  def start_link(_) do
    children = [
      {Registry, keys: :duplicate, name: @registry, partitions: System.schedulers_online()},
      %{id: BingoAgent, start: {Agent, :start_link, [fn -> %{} end, [name: @agent]]}}
    ]

    opts = [strategy: :one_for_one, name: __MODULE__.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def child_spec(arg) do
    %{id: __MODULE__, start: {__MODULE__, :start_link, [arg]}}
  end

  def register(seed) when is_integer(seed) do
    Registry.register(@registry, seed, [])

    Agent.get_and_update(@agent, fn state ->
      board = Map.get(state, seed) || generate_board(seed)
      new_state = Map.put(state, seed, board)

      {board, new_state}
    end)
  end

  def unregister(seed) when is_integer(seed) do
    Registry.unregister(@registry, seed)

    if Registry.lookup(@registry, seed) == [] do
      Logger.info("Cleaning up #{seed}")
      Agent.update(@agent, &Map.delete(&1, seed))
    end
  end

  def notify(seed, board = %BingoBoard{}) when is_integer(seed) do
    Agent.update(@agent, &Map.put(&1, seed, board))

    Registry.dispatch(@registry, seed, fn entries ->
      for {pid, _} <- entries do
        send(pid, {:broadcast, seed, board})
      end
    end)
  end

  defp generate_board(seed) do
    :rand.seed(:exsss, seed)
    BingoBoard.new()
  end
end
