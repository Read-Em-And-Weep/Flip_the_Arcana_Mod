local GUIFile = rom.path.combine(rom.paths.Content(), "Game\\Animations\\GUI_Screens_VFX.sjson")

local newCardArtOrder = {
    "Name",
    "InheritFrom",
    "FilePath",
}

local newCardArtData = {
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
    Name = "FlippedCardArt_14",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\14._The_Strategist"
},
{
    Name = "FlippedCardArt_14_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\14._The_Strategist",
},
}

sjson.hook(GUIFile, function(data)
    for _, newCardArt in ipairs(newCardArtData) do
        table.insert(data.Animations, sjson.to_object(newCardArt, newCardArtOrder))
    end
end)