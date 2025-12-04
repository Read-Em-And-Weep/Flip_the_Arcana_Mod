local GUIFile = rom.path.combine(rom.paths.Content(), "Game\\Animations\\GUI_Screens_VFX.sjson")

local newCardArtOrder = {
    "Name",
    "InheritFrom",
    "FilePath",
}

local newCardArtData = {
{
    Name = "FlippedCardArt_01",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\1._Bloodlust"
},
{
    Name = "FlippedCardArt_01_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\1._Bloodlust_inactive"
},
{
    Name = "FlippedCardArt_03",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\3._Performance"
},
{
    Name = "FlippedCardArt_03_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\3._Performance_inactive"
},
{
    Name = "FlippedCardArt_04",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\4._The_Hydra"
},
{
    Name = "FlippedCardArt_04_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\4._The_Hydra_inactive"
},
{
    Name = "FlippedCardArt_06",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\6._The_Gorgon"
},
{
    Name = "FlippedCardArt_06_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\6._The_Gorgon_inactive"
},
{
    Name = "FlippedCardArt_07",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\7._The_Hearth"
},
{
    Name = "FlippedCardArt_07_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\7._The_Hearth_inactive"
},
{
    Name = "FlippedCardArt_08",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\8._The_Blacksmith"
},
{
    Name = "FlippedCardArt_08_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\8._The_Blacksmith_inactive"
},
{
    Name = "FlippedCardArt_09",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\9._Bounty"
},
{
    Name = "FlippedCardArt_09_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\9._Bounty_inactive"
},
{
    Name = "FlippedCardArt_10",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\10._Retribution"
},
{
    Name = "FlippedCardArt_10_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\10._Retribution_inactive"
},
{
    Name = "FlippedCardArt_11",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\11._The_Cyclops"
},
{
    Name = "FlippedCardArt_11_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\11._The_Cyclops_inactive"
},
{
    Name = "FlippedCardArt_15",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\15._Beauty"
},
{
    Name = "FlippedCardArt_15_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\15._Beauty_inactive",
},
{
    Name = "FlippedCardArt_02",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\2._The_Faithful_Daughter_"
},
{
    Name = "FlippedCardArt_02_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\2._The_Faithful_Daughter_inactive",
},
{
    Name = "FlippedCardArt_05",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\5._The_Loyal_Protector"
},
{
    Name = "FlippedCardArt_05_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\5._The_Loyal_Protector_inactive",
},
{
    Name = "FlippedCardArt_13",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\13._The_Wanderer"
},
{
    Name = "FlippedCardArt_13_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\13._The_Wanderer_inactive",
},
{
    Name = "FlippedCardArt_14",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\14._The_Strategist"
},
{
    Name = "FlippedCardArt_14_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\14._The_Strategist_inactive",
},
}

sjson.hook(GUIFile, function(data)
    for _, newCardArt in ipairs(newCardArtData) do
        table.insert(data.Animations, sjson.to_object(newCardArt, newCardArtOrder))
    end
end)