local newHelpTextOrder =
{
    "Id",
    "InheritFrom",
    "DisplayName",
    "Description",
}

local newHelpTextData = {
    {
      Id = "Hint_StrifeDoubleUp",
      DisplayName = "{#CombatTextHighlightFormat}Blesssed by Strife{#Prev}!",
    },
    {
      Id = "Hint_FamineSpawnKill",
      DisplayName = "{#CombatTextHighlightFormat}Famine{#Prev}!"
    },
    {
      Id = "ExtraArcanaWorldUpgradeCardFlip",
      DisplayName = "Expanding of the Deck",
      Description = "Enhance the {$Keywords.CardTable} so that you can flip your {$Keywords.CardPlural} using the same button you use to pin them, unlocking a new set of {$Keywords.CardPlural} to unlock and upgrade.",
    },
    {
      Id = "ExtraArcanaWorldUpgradeCardFlip_Flavor",
      Description = "The sufficiently experienced and well-traveled witch can look within herself and find more powers within her grasp.",
    },
}

local helpTextFile = rom.path.combine(rom.paths.Content(), 'Game/Text/en/HelpText.en.sjson')

sjson.hook(helpTextFile, function(data)
    for _, newHelpText in ipairs(newHelpTextData) do
        table.insert(data.Texts, sjson.to_object(newHelpText, newHelpTextOrder))
    end
end)