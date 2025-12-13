local monstor_loot_sjson = {
    Name = "MonstrosityMetaUpgradeUpgrade",
    --ChildAnimation = "BoonOrbFrontFlareHammer",
    CreateAnimation = "ItemSpawnFx",
    FilePath = "ReadEmAndWeep-Flip_the_Arcana_ModNewCardArt\\MonstrosityMetaUpgradeUpgrade\\MonstrosityMetaUpgradeUpgrade",
    VisualFx = "OlympusBoonStreaks",
    EndFrame = 60,
    Loop = true,
    NumFrames = 60,
    StartFrame = 1,
    PlaySpeed = 30,
    Scale = 1.1,
    OffsetZ = -30,
    Material = "Unlit",
    VisualFxIntervalMax = 0.1,
    VisualFxIntervalMin = 0.2,
    CreateAnimations = {
        { Name = "ResourceGlow_Base" },
    },
}

local itemsGeneralVfx = rom.path.combine(rom.paths.Content(), 'Game\\Animations\\Items_General_VFX.sjson')

sjson.hook(itemsGeneralVfx,function (data)
    table.insert(data.Animations,monstor_loot_sjson)
end)