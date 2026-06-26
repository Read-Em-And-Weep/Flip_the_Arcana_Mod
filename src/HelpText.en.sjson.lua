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
      Id = "FlipTheArcanaPerfectClearDamageBonus",
      DisplayName = "{#CombatTextHighlightFormat}King Tide{#Prev}!",
    },
    {
      Id = "FlipTheArcanaBonusLevelsAwarded",
      DisplayName = "{#CombatTextHighlightFormat}The Heir{#Prev}!",
    },
    {
      Id = "FlipTheArcanaDDRestoreProcess",
      DisplayName = "{#CombatTextHighlightFormat}The Physician{#Prev}!",
    },
    {
      Id = "FlipTheArcanaBuildRandomised",
      DisplayName = "{#CombatTextHighlightFormat}Good Fortune{#Prev}!",
    },
    {
      Id = "Hint_FamineSpawnKill",
      DisplayName = "{#CombatTextHighlightFormat}Famine{#Prev}!"
    },
    {
      Id = "FlipTheArcanaUnyieldingRestored",
      DisplayName = "{#CombatTextHighlightFormat}Unyielding Regained{#Prev}!"
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
    },
    {
      Id = "FlipArcanaExtraChanceSkelly",
      InheritFrom = "BaseTooltip",
      DisplayName = "{!Icons.ExtraChanceNoTooltip} Death Defiance",
      Description = "When you fall to {#PenaltyFormat}0{#Prev}{!Icons.Health}, automatically restore {#BoldFormat}{$TooltipData.ExtractData.LastStandHeal}%{#Prev}{!Icons.Health} and {!Icons.Mana}. Used before similar effects.",
    },
    {
      Id = "FlipTheArcanaPointsOfInterest",
      InheritFrom = "BaseTooltip",
      DisplayName = "Points of Interest",
      Description = "Features such as Wells of Charon, Shrines of Hermes, Infernal Troves, and Moon Monuments that offer the chance at additional rewards.",
    },
    {
      Id = "FlipTheArcanaPerfectPowerStacks",
      InheritFrom = "BaseTooltip",
      DisplayName = "Triumph",
      Description = "A fleeting bonus of +{$TooltipData.ExtractData.PowerPerStack} {$Keywords.BaseDamage} per stack, lost upon taking damage.",
    },
    {
      Id = "FlipTheArcanaRiposte",
      InheritFrom = "BaseTooltip",
      DisplayName = "Riposte",
      Description = "Your next {#BoldFormatGraft}{$TooltipData.ExtractData.Count} {#Prev}strikes have {#BoldFormatGraft}{$TooltipData.ExtractData.CritChance:P} {#Prev}{$Keywords.Crit} chance.",
    },
    {
      Id = "FlipTheArcanaTraitExchange",
      InheritFrom = "BaseTooltip",
      DisplayName = "Sacrifice",
      Description = "{$Keywords.GodBoonPlural} with improved {$Keywords.Rarity} which require you to give up another in their stead.",
    },
    {
      Id = "FlipTheArcanaRandomisedCard",
      InheritFrom = "BaseTooltip",
      DisplayName = "Fortunate Card",
      Description = "This {$Keywords.Card} has been randomly drawn due to the effects of {#BoldFormat} Good Fortune{#Prev}. You will lose this at the start of the next {$Keywords.Biome}.",
    },
    {
      Id = "FlipTheArcanaRandomisedCardBase",
      InheritFrom = "BaseTooltip",
      DisplayName = "{$Keywords.FlipTheArcanaRandomisedCard}",
    },
    {
      Id = "FlipTheArcanaUnyielding",
      InheritFrom = "BaseTooltip",
      DisplayName = "Unyielding",
      Description = "When you are next hit, take {#PenaltyFormat} 1 {#Prev} damage instead. Regain this after {$TooltipData.ExtractData.Cooldown} Sec.",
    },
}

table.insert(game.KeywordList, "FlipArcanaExtraChanceSkelly")
table.insert(game.KeywordList, "FlipTheArcanaPointsOfInterest")
table.insert(game.KeywordList, "FlipTheArcanaPerfectPowerStacks")
table.insert(game.KeywordList, "FlipTheArcanaRiposte")
table.insert(game.KeywordList, "FlipTheArcanaTraitExchange")
table.insert(game.KeywordList, "FlipTheArcanaRandomisedCard")
table.insert(game.KeywordList, "FlipTheArcanaUnyielding")

ResetKeywords()


local helpTextFile = rom.path.combine(rom.paths.Content(), 'Game/Text/en/HelpText.en.sjson')

sjson.hook(helpTextFile, function(data)
    for _, newHelpText in ipairs(newHelpTextData) do
        table.insert(data.Texts, sjson.to_object(newHelpText, newHelpTextOrder))
    end
end)
