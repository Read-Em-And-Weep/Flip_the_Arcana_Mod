local newScreenTextOrder =
{
    "Id",
    "InheritFrom",
    "DisplayName",
    "Description",
}

local newScreenTextData = {
    {
      Id = "MonstrosityCardifyUpgradeChoiceMenu_Title",
      DisplayName = "The Arcana",
    },
    {
        Id = "MetaUpgradeMem_FlipCard",
        DisplayName = " ",
    }
}

local screenTextFile = rom.path.combine(rom.paths.Content(), 'Game/Text/en/ScreenText.en.sjson')

sjson.hook(screenTextFile, function(data)
    for _, newScreenText in ipairs(newScreenTextData) do
        table.insert(data.Texts, sjson.to_object(newScreenText, newScreenTextOrder))
    end
end)