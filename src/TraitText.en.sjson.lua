local newMetaUpgradeCardOrder =
{
    "Id",
    "InheritFrom",
    "DisplayName",
    "Description",
}

local newMetaUpgradeCardData = {
    {
        Id = "ReversedChanneledCast",
        DisplayName = "Bloodlust",
        Description = "Your {$Keywords.Attack}, {$Keywords.Special}, and {$Keywords.Cast} are {$TooltipData.StatDisplay1} faster.",
    },
    {
        Id = "ReversedChanneledCast_FlavorText01",
        DisplayName = "Bathed in his enemies' blood, he guided mortals to great victories and losses."
    },
    {
        Id = "ReversedChanneledCastMetaUpgrade",
        InheritFrom = "ReversedChanneledCast",
    },
    {
        Id = "ReversedHealthRegen",
        DisplayName = "The Faithful Daughter",
        Description = "After each {$Keywords.RoomAlt}, gain {#UpgradeFormat}{$TooltipData.StatDisplay1}{!Icons.HealthUpAlt}{#Prev}.",
    },
    {
        Id = "ReversedHealthRegen_FlavorText01",
        DisplayName = "Like her brother before her, she struggles against her family for freedom."
    },
    {
        Id = "ReversedHealthRegenMetaUpgrade",
        InheritFrom = "ReversedHealthRegen",
    },
    {
        Id = "ReversedLowManaDamageBonus",
        DisplayName = "Performance",
        Description = "While above {#UpgradeFormat} 85%{#Prev}{!Icons.Health}, deal {#UpgradeFormat}{$TooltipData.StatDisplay1} {#Prev} damage, else gain a tenth of this benefit.",
    },
    {
        Id = "ReversedLowManaDamageBonus_FlavorText01",
        DisplayName = "Under the shining Sun, he cultivated moving skills in the arts through talent and practice."
    },
    {
        Id = "ReversedLowManaDamageBonusMetaUpgrade",
        InheritFrom = "ReversedLowManaDamageBonus",
    },
    {
        Id = "ReversedCastCount",
        DisplayName = "The Hydra",
        Description = "Whenever you encounter a {$Keywords.Boss}, first deal {#UpgradeFormat} {$TooltipData.StatDisplay1}%{#Prev}{!Icons.EnemyHealth}.",
    },
    {
        Id = "ReversedCastCount_FlavorText01",
        DisplayName = "When a problem is too difficult to solve, or an enemy too hard to defeat, more heads are better than one."
    },
    {
        Id = "ReversedCastCountMetaUpgrade",
        InheritFrom = "ReversedCastCount",
    },
    {
      Id = "PreDamageHit_MetaUpgrade",
      DisplayName = "{#LegendaryFormat}The Hydra{#Prev}!",
    },
    {
        Id = "ReversedSorceryRegenUpgrade",
        DisplayName = "The Loyal Protector",
        Description = "Before facing a {$Keywords.Boss}, restore {$TooltipData.StatDisplay1}{!Icons.Health}."
    },
    {
        Id = "ReversedSorceryRegenUpgrade_Vow",
        DisplayName = "The Loyal Protector",
        Description = "Before facing a {$Keywords.Boss}, restore {$TooltipData.StatDisplay1}{!Icons.Health}, less than usual due to the {#PenaltyFormat}{$TooltipData.CustomStatLinesWithShrineUpgrade.ShrineUpgradeName}{#Prev}."
    },
    {
        Id = "ReversedSorceryRegenMetaUpgrade_FlavorText01",
        DisplayName = "His loyalty to the House of Hades is unmatched, as are the tales of his ferocity."
    },
    {
        Id = "ReversedSorceryRegenMetaUpgrade",
        InheritFrom = "ReversedSorceryRegenUpgrade",
    },
    {
        Id = "ReversedCastBuff",
        DisplayName = "The Gorgon",
        Description = "Foes in your cast deal {#UpgradeFormat} {$TooltipData.StatDisplay1} {#Prev} damage.",
    },
    {
        Id = "ReversedCastBuff_FlavorText01",
        DisplayName = "Dutiful in life and dutiful in death, she was feared for her menacing appearance despite her kindness."
    },
    {
        Id = "ReversedCastBuffMetaUpgrade",
        InheritFrom = "ReversedCastBuff",
    },
    {
        Id = "ReversedBonusHealth",
        DisplayName = "The Hearth",
        Description = "Gain {#UpgradeFormat} {$TooltipData.StatDisplay1} {#Prev}{!Icons.HealthUp} and {!Icons.ManaUp} now and for the rest of this night.",
    },
    {
        Id = "ReversedBonusHealth_FlavorText01",
        DisplayName = "Gods and mortals oft go to battle, comforted in knowing the hearth shines on for them to return."
    },
    {
        Id = "ReversedBonusHealthMetaUpgrade",
        InheritFrom = "ReversedBonusHealth",
    },
    {
        Id = "ReversedBonusDodge",
        DisplayName = "The Blacksmith",
        Description = "Whenever you take damage, take {#UpgradeFormat} {$TooltipData.StatDisplay1} {#Prev} less.",
    },
    {
        Id = "ReversedBonusDodge_FlavorText01",
        DisplayName = "Despite all the gods' incredible might, they would be powerless without his tools."
    },
    {
        Id = "ReversedBonusDodgeMetaUpgrade",
        InheritFrom = "ReversedBonusDodge",
    },
    {
        Id = "ReversedManaOverTime",
        DisplayName = "Bounty",
        Description = "You can {$Keywords.RarityUpgrade} Olympian blessings up to {#UpgradeFormat}{$TooltipData.StatDisplay1} {#Prev}times this night.",
    },
    {
        Id = "ReversedManaOverTime_FlavorText01",
        DisplayName = "As mortals know well, the sea gives and the sea takes away in turn."
    },
    {
        Id = "ReversedManaOverTimeMetaUpgrade",
        InheritFrom = "ReversedManaOverTime",
    },
    {
        Id = "ReversedMagicCrit",
        DisplayName = "Retribution",
        Description = "You deal {#UpgradeFormat} {$TooltipData.StatDisplay1} {#Prev} damage, however you take {#PenaltyFormat}+20% {#Prev} damage in return.",
    },
    {
        Id = "ReversedMagicCrit_FlavorText01",
        DisplayName = "Wielding a force strong enough to tear down civilisations, she carefully measures and executes the will of the scales."
    },
    {
        Id = "ReversedMagicCritMetaUpgrade",
        InheritFrom = "ReversedMagicCrit",
    },
    {
        Id = "ReversedSprintShield",
        DisplayName = "The Cyclops",
        Description = "When you first deal damage to an enemy, deal {#UpgradeFormat} {$TooltipData.StatDisplay1} {#Prev} more.",
    },
    {
        Id = "ReversedSprintShield_FlavorText01",
        DisplayName = "Without sight, one must rely on their other senses and learn to be utterly ruthless in battle."
    },
    {
        Id = "ReversedSprintShieldMetaUpgrade",
        InheritFrom = "ReversedSprintShield",
    },
    {
        Id = "ReversedLastStand",
        DisplayName = "Sleep",
        Description = "While you have no {!Icons.ExtraChance} {#BoldFormat} Death Defiances{#Prev}, regain {#UpgradeFormat}+1{!Icons.Health} {#Prev} every {#UpgradeFormat} {$TooltipData.StatDisplay1} second(s){#Prev}.",
    },
    {
        Id = "ReversedLastStand_FlavorText01",
        DisplayName = "Despite his easy-going exterior, it is said the gods fear him, for what is unending sleep to a god but death."
    },
    {
        Id = "ReversedLastStandMetaUpgrade",
        InheritFrom = "ReversedLastStand",
    },
    {
        Id = "ReversedMaxHealthPerRoom",
        DisplayName = "The Wanderer",
        Description = "You gain {#UpgradeFormat}+1{$Keywords.PomLevel} {#Prev} whenever you pass through {$TooltipData.StatDisplay1} {$Keywords.RoomPlural}.",
    },
    {
        Id = "ReversedMaxHealthPerRoom_FlavorText01",
        DisplayName = "The journey is always harder than the destination; one must, however, persist regardless."
    },
    {
        Id = "ReversedMaxHealthPerRoomMetaUpgrade",
        InheritFrom = "ReversedMaxHealthPerRoom",
    },
    {
      Id = "ReversedMaxHealthPerRoom_AutoEquip",
      DisplayName = "{$Keywords.AutoEquip}: {#ItalicLightFormat}Activate Cards that use {#GraspFormat}1{#Prev}{!Icons.ManaCrystal} through {#GraspFormat}5{!Icons.ManaCrystal}{#Prev}."
    },
    {
        Id = "ReversedStatusVulnerability",
        DisplayName = "The Strategist",
        Description = "You deal {$TooltipData.StatDisplay1} damage to foes with no {$Keywords.StatusPluralAlt} from different Olympians.",
    },
    {
        Id = "ReversedStatusVulnerability_FlavorText01",
        DisplayName = "Wars are started by passion and necessity, but ended by wisdom and strategy."
    },
    {
        Id = "ReversedStatusVulnerabilityMetaUpgrade",
        InheritFrom = "ReversedStatusVulnerability",
    },
    {
        Id = "ReversedChanneledBlock",
        DisplayName = "Beauty",
        Description = "You have a {#UpgradeFormat} {$TooltipData.StatDisplay1} {#Prev} chance to {$Keywords.Dodge} damage.",
    },
    {
        Id = "ReversedChanneledBlock_FlavorText01",
        DisplayName = "It is said that a thousand ships were launched in pursuit of beauty, yet she has it effortlessly."
    },
    {
        Id = "ReversedChanneledBlockMetaUpgrade",
        InheritFrom = "ReversedChanneledBlock",
    },
    {
        Id = "ReversedDoorReroll",
        DisplayName = "Strife",
        Description = "While at the {$Keywords.Random}, any {$Keywords.GodBoonPlural}, {$Keywords.PomPlural}, and {!Icons.Hammer} will be duplicated {#UpgradeFormat}{$TooltipData.StatDisplay1} {#Prev} of the time."
    },
    {
        Id = "ReversedDoorReroll_FlavorText01",
        DisplayName = "Life would be dull without it, but is unbearable with it."
    },
    {
        Id = "ReversedDoorRerollMetaUpgrade",
        InheritFrom = "ReversedDoorReroll",
    },
    {
        Id = "ReversedStartingGold",
        DisplayName = "The Weaver",
        Description = "Gain {#UpgradeFormat} {$TooltipData.StatDisplay1}{!Icons.ArmorTotal} {#Prev} every {$Keywords.RoomAlt}. If you have less than {#UpgradeFormat} 20{!Icons.ArmorTotal}{#Prev},  gain double.",
    },
    {
        Id = "ReversedStartingGold_FlavorText01",
        DisplayName = "As punishment for her hubris - whether deserved or not - she weaves for all eternity."
    },
    {
        Id = "ReversedStartingGoldMetaUpgrade",
        InheritFrom = "ReversedStartingGold",
    },
    {
        Id = "ReversedMetaToRunUpgrade",
        DisplayName = "Longing",
        Description = "Whenever you raise {$Keywords.PomLevel} of your {$Keywords.GodBoonPlural} from sources other than {$Keywords.PomPlural}, {#UpgradeFormat} {$TooltipData.StatDisplay1} {#Prev} of the time raise {$Keywords.PomLevel} of another {$Keywords.GodBoon}."
    },
    {
        Id = "ReversedMetaToRunUpgrade_FlavorText01",
        DisplayName = "To love another, one must first love themself; however, to love oneself, one must first love others."
    },
    {
        Id = "ReversedMetaToRunUpgradeMetaUpgrade",
        InheritFrom = "ReversedMetaToRunUpgrade",
    },
    {
        Id = "ReversedRarityBoost",
        DisplayName = "Famine",
        Description = "The first time you strike a foe you have a {$TooltipData.StatDisplay1} chance to kill them immediately."
    },
    {
        Id = "ReversedRarityBoost_FlavorText01",
        DisplayName = "It is said that the grief of losing her daughter was so great that nature itself refused to grow."
    },
    {
        Id = "ReversedRarityBoostMetaUpgrade",
        InheritFrom = "ReversedRarityBoost",
    },
    {
        Id = "ReversedBonusRarity",
        DisplayName = "Companionship",
        Description = "After vanquishing a {$Keywords.Boss}, gain the passive effect of an {$Keywords.Familiar} not with you at {#UpgradeFormat} Rank {$TooltipData.StatDisplay1}{#Prev}."
    },
    {
        Id = "ReversedBonusRarity_FlavorText01",
        DisplayName = "It is the greatest gift of all that we do not need to face our struggles alone."
    },
    {
        Id = "ReversedBonusRarityMetaUpgrade",
        InheritFrom = "ReversedBonusRarity",
    },
    {
        Id = "ReversedTradeOff",
        DisplayName = "Doom",
        Description = "While at the {$Keywords.Random}, you have a {#UpgradeFormat} {$TooltipData.StatDisplay1} {#Prev} chance for any damage you deal to be {$Keywords.Crit}."
    },
    {
        Id = "ReversedTradeOff_FlavorText01",
        DisplayName = "It makes for a lonely existence when all who see you fear you, but he endeavours to kindly do his duty regardless."
    },
    {
        Id = "ReversedTradeOffMetaUpgrade",
        InheritFrom = "ReversedTradeOff",
    },
    {
        Id = "ReversedScreenReroll",
        DisplayName = "Revelry",
        Description = "While at the {$Keywords.Random}, whenever you claim a {$Keywords.GodBoonPlural}, {#UpgradeFormat}{$TooltipData.StatDisplay1} {#Prev} of the time, a random boon will gain {#UpgradeFormat}+2{$Keywords.PomLevel}"
    },
    {
        Id = "ReversedScreenReroll_FlavorText01",
        DisplayName = "Even in the darkest of moments, there is joy to be found in good company."
    },
    {
        Id = "ReversedScreenRerollMetaUpgrade",
        InheritFrom = "ReversedScreenReroll",
    },
    {
        Id = "ReversedLowHealthBonus",
        DisplayName = "Futility",
        Description = "You deal {#UpgradeFormat} {$TooltipData.StatDisplay1} {#Prev} damage for each {!Icons.ExtraChance} {#BoldFormat} Death Defiance {#Prev} used this night."
    },
    {
        Id = "ReversedLowHealthBonus_FlavorText01",
        DisplayName = "Despite how meaningless his task is, one must imagine him happy."
    },
    {
        Id = "ReversedLowHealthBonusMetaUpgrade",
        InheritFrom = "ReversedLowHealthBonus",
    },
    {
      Id = "ReversedLowHealthBonusMetaUpgrade_Tray",
      DisplayName = "Futility",
      Description = "You deal {#UpgradeFormat} {$TooltipData.StatDisplay1} {#Prev} damage for each {!Icons.ExtraChanceMisc} used this night. {#ItalicFormat} Currently: {#Prev} {#UpgradeFormat} {$TooltipData.StatDisplay2} {#Prev}.",
    },
    {
        Id = "ReversedEpicRarityBoost",
        DisplayName = "Encouragement",
        Description = "Gain {#UpgradeFormat}{$TooltipData.StatDisplay1}{#Prev}{$ConsumableData.ElementalBoost.UseFunctionArgs.[1].TraitName}."
    },
    {
        Id = "ReversedEpicRarityBoost_FlavorText01",
        DisplayName = "No-one knows where he came from, nor what he desires, but he seems to have an inexplicable fondness for the children of Hades."
    },
    {
        Id = "ReversedEpicRarityBoostMetaUpgrade",
        InheritFrom = "ReversedEpicRarityBoost",
    },
    {
      Id = "CompanionshipHealthFamiliar",
      DisplayName = "Life Bond",
      Description = "{#BoldFormat}Frinos {#Prev} is with you tonight in spirit, giving you {#BoldFormat} increased{#Prev}{#UpgradeFormat}{!Icons.HealthUp}{#Prev}.",
    },
    {
      Id = "CompanionshipCritFamiliar",
      DisplayName = "Vision Bond",
      Description = "{#BoldFormat}Raki {#Prev} is you with tonight in spirit, giving you {#BoldFormat} increased {#Prev} chance for any damage you deal to be {$Keywords.Crit}.",
    },
    {
      Id = "CompanionshipDigFamiliar",
      DisplayName = "Spirit Bond",
      Description = "{#BoldFormat}Hecuba {#Prev} is you with tonight in spirit, giving you {#BoldFormat} increased{#Prev}{!Icons.ManaUp}.",
    },
    {
      Id = "CompanionshipDodgeFamiliar",
      DisplayName = "Veil Bond",
      Description = "{#BoldFormat}Gale {#Prev} is you with tonight in spirit, giving you {#BoldFormat} increased {#Prev} {$Keywords.Dodge} and move speed.",
    },
    {
      Id = "CompanionshipLastStandFamiliar",
      DisplayName = "Heart Bond",
      Description = "{#BoldFormat}Toula {#Prev} is you with tonight in spirit, giving you a {$Keywords.ExtraChanceCat}.",
    },    
    {
        Id = "ReversedCardDraw",
        DisplayName = "Monstrosity",
        Description = "After vanquishing a {$Keywords.Boss}, every {$Keywords.GodBoon} that can gain {#BoldFormat} Rarity {#Prev} does, up to {#UpgradeFormat} {$TooltipData.StatDisplay1} {#Prev} times this night."
    },
    {
        Id = "ReversedCardDraw_FlavorText01",
        DisplayName = "Hatred and Destruction Incarnate reigns terror on the world, however the daughter of Hades knows it can be vanquished."
    },
    {
        Id = "ReversedCardDrawMetaUpgrade",
        InheritFrom = "ReversedCardDraw",
    },
    {
      Id = "ReversedCardDrawMetaUpgrade_Tray",
      DisplayName = "Monstrosity",
      Description = "After vanquishing a {$Keywords.Boss}, every {$Keywords.GodBoon} that can gain {#BoldFormat} Rarity {#Prev} does, up to {#UpgradeFormat} {$TooltipData.StatDisplay1} {#Prev} more times this night.",
    },
    
}



local traitTextFile = rom.path.combine(rom.paths.Content(), 'Game/Text/en/TraitText.en.sjson')

sjson.hook(traitTextFile, function(data)
    for _, newMetaUpgradeCardText in ipairs(newMetaUpgradeCardData) do
        table.insert(data.Texts, sjson.to_object(newMetaUpgradeCardText, newMetaUpgradeCardOrder))
    end
end)

--[[ sjson.hook(traitTextFile, function(data)
    for _, newMetaFlavourText in ipairs(newMetaFlavourTextData) do
        table.insert(data.Texts, sjson.to_object(newMetaFlavourText, newMetaFlavourTextOrder))
    end
end)

sjson.hook(traitTextFile, function(data)
    for _, newMetaTraitText in ipairs(newMetaUpgradeTraitData) do
        table.insert(data.Texts, sjson.to_object(newMetaTraitText, newMetaUpgradeTraitOrder))
    end
end) ]]