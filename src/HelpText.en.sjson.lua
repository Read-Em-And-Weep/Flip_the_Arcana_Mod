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
      Description = "Enhance the {$Keywords.CardTable} so that you can flip your {$Keywords.CardPlural} using the same button you use to pin them, or by using your reroll button, unlocking a new set of {$Keywords.CardPlural} to unlock and upgrade.",
    },
    {
      Id = "ExtraArcanaWorldUpgradeCardFlip_Flavor",
      Description = "The sufficiently experienced and well-traveled witch can look within herself and find more powers within her grasp.",
    },
   {
      Id = "CardifyUseLootAndConsume",
      DisplayName = "{I} Accept\n {SI} Purge"
    },
    {
      Id = "CardifyUseLootGiftAndConsume",
      DisplayName = "{I} Accept\n {G} Gift\n {SI} Purge"
    },
    {
      Id = "MonstrosityCardifyUpgrade_FlavorText01",
      DisplayName = "self-strength comes from self-improvement, which comes from self-reflection."
    },
    {
      Id = "MonstrosityCardifyUpgrade_FlavorText02",
      DisplayName = "the future can be found in the cards of the arcana; it is, however, yours to create."
    },
    {
      Id = "MonstrosityCardifyUpgrade_FlavorText03",
      DisplayName = "we draw our power from our bonds with others, and appreciating them makes it grow." 
    }
}

local helpTextFile = rom.path.combine(rom.paths.Content(), 'Game/Text/en/HelpText.en.sjson')

sjson.hook(helpTextFile, function(data)
    for _, newHelpText in ipairs(newHelpTextData) do
        table.insert(data.Texts, sjson.to_object(newHelpText, newHelpTextOrder))
    end
end)