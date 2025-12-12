local monstor_loot_obstacle = {
		Name = "MonstrosityMetaUpgradeUpgrade",
		InheritFrom = "BaseLoot",
		DisplayInEditor = true,
		Thing = 
		{
			EditorOutlineDrawBounds = false,
			Graphic = "MonstrosityMetaUpgradeUpgrade",
			AmbientSound = "/SFX/Player Sounds/HammerDropLoop",
			Points =
			{
				{ X = 0, Y = 24 },
				{ X = 48, Y = 0 },
				{ X = 0, Y = -24 },
				{ X = -48, Y = 0 },
			}
		},
}


local gameplay = rom.path.combine(rom.paths.Content(), 'Game\\Obstacles\\Gameplay.sjson')

sjson.hook(gameplay,function (data)
    table.insert(data.Obstacles,(monstor_loot_obstacle))
end)