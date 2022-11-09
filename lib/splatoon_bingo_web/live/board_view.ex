defmodule SplatoonBingoWeb.BingoView do
  use Phoenix.LiveComponent

  def board(assigns) do
    ~H"""
    <div class="bingo-board">
      <%= for row <- @board.rows do %>
        <.row row={row}/>
      <% end %>
    </div>
    """
  end

  def row(assigns) do
    ~H"""
    <div class="bingo-row">
      <%= for weapon <- @row do %>
        <.cell weapon={weapon}/>
      <% end %>
    </div>
    """
  end

  def cell(assigns) do
    ~H"""
    <div class={"cell cell-#{@weapon.state}"}phx-click="change-weapon-state" phx-value-name={@weapon.name}>
      <img src={"images/" <> @weapon.image} alt={@weapon.name} />
      <div class="label"><%= @weapon.name %></div>
    </div>
    """
  end
end
