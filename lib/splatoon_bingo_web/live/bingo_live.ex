defmodule SplatoonBingoWeb.BingoLive do
  use Phoenix.LiveView, layout: {SplatoonBingoWeb.LayoutView, "live.html"}

  require Logger

  import Phoenix.LiveView.Helpers

  alias SplatoonBingo.BingoBoard
  alias SplatoonBingoWeb.BingoView

  @impl true
  def mount(%{"seed" => seed}, _session, socket) do
    seed = String.to_integer(seed)
    board = generate_board(seed)
    socket = assign(socket, seed: seed, board: board)
    {:ok, socket}
  end

  def mount(params, _session, socket) do
    seed = random_seed()
    socket = push_redirect(socket, to: "/?seed=#{seed}")
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <h1>SPLATOON BINGO</h1>

    <BingoView.board board={@board}/>

    <p>Click a cell to toggle it marked or locked</p>

    <%= live_patch "Create New Board", to: "/?seed=#{@seed + 1}" %>

    <h2>Rules</h2>

    <ol>
      <li>If you win a match with a weapon, you may mark it off (green).</li>
      <li>If you lose a match, all opponents' weapons become locked (red).</li>
      <li>Cells marked off or locked may not be changed.</li>
      <li>You may play any mode you like.</li>
      <li>If you lose a Turf War match, you must leave the group.</li>
      <li>You win if you mark a row, column, or diagonal.</li>
    </ol>
    """
  end

  @impl true
  def handle_event("change-weapon-state", %{"name" => name}, socket) do
    board = BingoBoard.change_weapon_state(socket.assigns.board, name)
    socket = assign(socket, board: board)

    {:noreply, socket}
  end

  def handle_event(event, params, socket) do
    Logger.warn("Unhandled event #{inspect({event, params})}")
    {:noreply, socket}
  end

  @impl true
  def handle_params(%{"seed" => seed}, _uri, socket) do
    seed = String.to_integer(seed)
    board = generate_board(seed)
    socket = assign(socket, seed: seed, board: board)

    {:noreply, socket}
  end

  def handle_params(_params, _uri, socket) do
    {:noreply, socket}
  end

  defp random_seed() do
    :erlang.monotonic_time()
  end

  defp parse_seed(string) when is_binary(string) do
    case Integer.parse(string) do
      {n, _} ->
        n

      _ ->
        nil
    end
  end

  defp parse_seed(_), do: nil

  defp generate_board(seed) when is_integer(seed) do
    :rand.seed(:exsss, seed)
    BingoBoard.new()
  end
end
