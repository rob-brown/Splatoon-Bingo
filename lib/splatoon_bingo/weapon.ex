defmodule SplatoonBingo.Weapon do
  @enforce_keys [:name, :image, :state]
  defstruct [:name, :image, :state]

  def new(name, image) when is_binary(name) and is_binary(image) do
    %__MODULE__{name: name, image: image, state: :empty}
  end

  def weapons_list() do
    [
      %SplatoonBingo.Weapon{
        name: "Flingza Roller",
        image: "Flingza_Roller.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Rapid Blaster",
        image: "Rapid_Blaster.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Octobrush",
        image: "Octobrush.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Mini Splatling",
        image: "Mini_Splatling.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "L-3 Nozzlenose",
        image: "L-3_Nozzlenose.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Splattershot",
        image: "Splattershot.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Goo Tuber",
        image: "Goo_Tuber.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "E-liter 4K Scope",
        image: "E-liter_4K_Scope.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Dualie Squelchers",
        image: "Dualie_Squelchers.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "H-3 Nozzlenose",
        image: "H-3_Nozzlenose.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Explosher",
        image: "Explosher.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Sloshing Machine",
        image: "Sloshing_Machine.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Slosher",
        image: "Slosher.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Dark Tetra Dualies",
        image: "Dark_Tetra_Dualies.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Clash Blaster",
        image: "Clash_Blaster.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Splash-o-matic",
        image: "Splash-o-matic.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Tenta Brella",
        image: "Tenta_Brella.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Undercover Brella",
        image: "Undercover_Brella.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Splatterscope",
        image: "Splatterscope.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Blaster",
        image: "Blaster.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Jet Squelcher",
        image: "Jet_Squelcher.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Splat Brella",
        image: "Splat_Brella.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Splatana Stamper",
        image: "Splatana_Stamper.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Rapid Blaster Pro",
        image: "Rapid_Blaster_Pro.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Inkbrush",
        image: "Inkbrush.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Range Blaster",
        image: "Range_Blaster.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Sploosh-o-matic",
        image: "Sploosh-o-matic.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "REEF-LUX 450",
        image: "REEF-LUX_450.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Hydra Splatling",
        image: "Hydra_Splatling.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Tri-Stringer",
        image: "Tri-Stringer.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Aerospray MG",
        image: "Aerospray_MG.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Splattershot Jr.",
        image: "Splattershot_Jr..png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Splat Charger",
        image: "Splat_Charger.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Heavy Splatling",
        image: "Heavy_Splatling.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "E-liter 4K",
        image: "E-liter_4K.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Dynamo Roller",
        image: "Dynamo_Roller.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Nautilus 47",
        image: "Nautilus_47.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Bloblobber",
        image: "Bloblobber.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Tri-Slosher",
        image: "Tri-Slosher.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Dapple Dualies",
        image: "Dapple_Dualies.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Carbon Roller",
        image: "Carbon_Roller.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Splat Roller",
        image: "Splat_Roller.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Classic Squiffer",
        image: "Classic_Squiffer.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Glooga Dualies",
        image: "Glooga_Dualies.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Squeezer",
        image: "Squeezer.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Bamboozler 14 Mk I",
        image: "Bamboozler_14_Mk_I.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Luna Blaster",
        image: "Luna_Blaster.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Ballpoint Splatling",
        image: "Ballpoint_Splatling.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Hero Shot Replica",
        image: "Hero_Shot_Replica.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Splatana Wiper",
        image: "Splatana_Wiper.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Splat Dualies",
        image: "Splat_Dualies.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Splattershot Pro",
        image: "Splattershot_Pro.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Splattershot Nova",
        image: "Splattershot_Nova.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Zink Mini Splatling",
        image: "Zink_Mini_Splatling.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Custom Splattershot Jr.",
        image: "Custom_Splattershot_Jr..png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Dapple Dualies Nouveau",
        image: "Dapple_Dualies_Nouveau.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Big Swig Roller",
        image: "Big_Swig_Roller.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Luna Blaster Neo",
        image: "Luna_Blaster_Neo.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Carbon Roller Deco",
        image: "Carbon_Roller_Deco.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Snipewriter 5H",
        image: "Snipewriter_5H.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Tentatek Splattershot",
        image: "Tentatek_Splattershot.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Slosher Deco",
        image: "Slosher_Deco.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Forge Splattershot Pro",
        image: "Forge_Splattershot_Pro.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Inkbrush Nouveau",
        image: "Inkbrush_Nouveau.png",
        state: :empty
      },
      %SplatoonBingo.Weapon{
        name: "Aerospray RG",
        image: "Aerospray_RG.png",
        state: :empty
      }
    ]
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
