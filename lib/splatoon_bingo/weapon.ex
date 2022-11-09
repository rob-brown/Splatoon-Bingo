defmodule SplatoonBingo.Weapon do
  @enforce_keys [:name, :image, :state]
  defstruct [:name, :image, :state]

  def new(name, image) when is_binary(name) and is_binary(image) do
    %__MODULE__{name: name, image: image, state: :empty}
  end

  def weapons_list() do
    weapons_path = Path.expand("../../assets/weapons", __DIR__)
    weapon_images = weapons_path |> File.ls!()

    for image <- weapon_images do
      image
      |> Path.basename()
      |> String.trim_trailing(".png")
      |> String.replace("_", " ")
      |> new(image)
    end
  end

  def change_state(weapon = %__MODULE__{}) do
    case weapon.state do
      :empty ->
        %__MODULE__{weapon | state: :marked}

      :marked ->
        %__MODULE__{weapon | state: :locked}

      :locked ->
        %__MODULE__{weapon | state: :empty}
    end
  end
end
