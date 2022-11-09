defmodule SplatoonBingo.BingoBoard do
  @enforce_keys [:rows]
  defstruct [:rows]

  def new() do
    SplatoonBingo.Weapon.weapons_list()
    |> Enum.take_random(25)
    |> new()
  end

  def new(weapons) do
    weapons
    |> Enum.chunk_every(5)
    |> then(&%__MODULE__{rows: &1})
  end

  def change_weapon_state(board = %__MODULE__{}, weapon_name) do
    board.rows
    |> Enum.flat_map(&Function.identity/1)
    |> Enum.map(&change_weapon(&1, weapon_name))
    |> new()
  end

  defp change_weapon(weapon, name) do
    if weapon.name == name do
      SplatoonBingo.Weapon.change_state(weapon)
    else
      weapon
    end
  end
end
