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
        Description = "While above {#UpgradeFormat} 85%{#Prev}{!Icons.Health}, deal {#UpgradeFormat}{$TooltipData.StatDisplay1} {#Prev} damage; else, gain a tenth of this benefit.",
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
        Description = "After vanquishing a {$Keywords.Boss} or {$Keywords.MiniBoss}, upgrade an {$Keywords.Card}, up to {$TooltipData.StatDisplay1} time(s). "
    },
    {
        Id = "ReversedSorceryRegenUpgrade_Tray",
        DisplayName = "The Loyal Protector",
        Description = "After vanquishing a {$Keywords.Boss} or {$Keywords.MiniBoss}, upgrade an {$Keywords.Card}, up to {$TooltipData.StatDisplay1} more time(s)."
    },
    {
        Id = "ReversedSorceryRegenUpgrade_Vow",
        DisplayName = "The Loyal Protector",
        Description = "Before facing a {$Keywords.Boss} or {$Keywords.MiniBoss}, restore {$TooltipData.StatDisplay1}{!Icons.Health}, less than usual due to the {#PenaltyFormat}{$TooltipData.CustomStatLinesWithShrineUpgrade.ShrineUpgradeName}{#Prev}."
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
        Description = "At the start of every {$Keywords.EncounterAlt}, become {$Keywords.Invulnerable} for {$TooltipData.StatDisplay1} {#Prev} seconds.",
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
        Description = "Whenever you take at least {#UpgradeFormat} 20 {#Prev} damage, take up to {#UpgradeFormat} {$TooltipData.StatDisplay1} {#Prev} less.",
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
        Description = "You deal {#UpgradeFormat} {$TooltipData.StatDisplay1} {#Prev} damage per {!Icons.ShrinePoint}, however you take {#PenaltyFormat}+35% {#Prev} damage in return.",
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
        Description = "While you have no {$Keywords.ExtraChanceMisc} and are facing a {$Keywords.Boss}, regain {#UpgradeFormat}+1{!Icons.Health} {#Prev} every {#UpgradeFormat} {$TooltipData.StatDisplay1} second(s){#Prev}.",
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
        Description = "A random {$Keywords.GodBoon} of yours gains {#UpgradeFormat}+1{$Keywords.PomLevel} {#Prev} whenever you pass through {$TooltipData.StatDisplay1} {$Keywords.RoomPlural}.",
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
        Description = "You deal {$TooltipData.StatDisplay1} damage to foes afflicted with no {$Keywords.StatusPlural} from any Olympian. Deal half of this benefit to foes with one {$Keywords.Status}, and no benefit if they have more.",
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
        Description = "You have a {#UpgradeFormat} {$TooltipData.StatDisplay1} {#Prev} chance to {$Keywords.Dodge}.",
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
        Description = "Gain {#UpgradeFormat} {$TooltipData.StatDisplay1}{!Icons.ArmorTotal} {#Prev} every {$Keywords.RoomAlt}. If you have less than {#UpgradeFormat} 10{!Icons.ArmorTotal}{#Prev},  gain double.",
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
        Description = "Whenever you raise {$Keywords.PomLevel} of your {$Keywords.GodBoonPlural} from sources other than {$Keywords.PomPlural}, {#UpgradeFormat} {$TooltipData.StatDisplay1} {#Prev} of the time raise {$Keywords.PomLevel} of up to 2 more {$Keywords.GodBoonPlural}."
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
        Description = "The first time you strike a foe, you have a {$TooltipData.StatDisplay1} chance to kill them immediately."
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
        Description = "While at the {$Keywords.Random}, you have a {#UpgradeFormat} {$TooltipData.StatDisplay1} {#Prev} chance for you to deal {$TraitData.AresStatusDoubleDamageBoon.DamagePercent:F} damage."
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
        Description = "While at the {$Keywords.Random}, {#UpgradeFormat}{$TooltipData.StatDisplay1} {#Prev} of the time, {$Keywords.PomPlural} will award twice the {$Keywords.PomLevel}"
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
        Description = "Have {#UpgradeFormat} {$TooltipData.StatDisplay1} {#Prev} chance to both deal and take {$TraitData.AresStatusDoubleDamageBoon.DamagePercent:F} damage for each empty {!Icons.ExtraChanceMisc} you have."
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
      Description = "Have {#UpgradeFormat} {$TooltipData.StatDisplay1} {#Prev} chance to both deal and take {$TraitData.AresStatusDoubleDamageBoon.DamagePercent:F} damage for each empty {!Icons.ExtraChanceMisc} you gave.",
    },
    {
        Id = "ReversedEpicRarityBoost",
        DisplayName = "Encouragement",
        Description = "Gain a {#BoldFormatGraft} random {#Prev} assortment of {#UpgradeFormat}{$TooltipData.StatDisplay1}{#Prev}{$ConsumableData.ElementalBoost.UseFunctionArgs.[1].TraitName}, and one {#BoldFormatGraft} random {#Prev}{$Keywords.Synergy} {$Keywords.GodBoonNoTooltip}."
    },
    {
        Id = "ReversedEpicRarityBoost_FlavorText01",
        DisplayName = "No-one knows where he came from, nor what he desires, but he has an inexplicable fondness for the children of Hades."
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
        Description = "You can purge most rewards for your choice from` 3 {#BoldFormatGraft}Arcana Cards{#Prev}, up to {#UpgradeFormat}{$TooltipData.StatDisplay1} {#Prev}time(s) this night."
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
        Description = "You can purge most rewards for your choice from 3 {#BoldFormatGraft}Arcana Cards{#Prev}, up to {#UpgradeFormat}{$TooltipData.StatDisplay1} {#Prev}more time(s) this night."
    },
    {
        Id = "ReversedEncounterHeal",
        DisplayName = "Soul",
        Description = "After each {$Keywords.EncounterAlt}, restore {$TooltipData.StatDisplay1} of the {!Icons.Health} lost in that {$Keywords.EncounterAlt}.",
    },
    {
        Id = "ReversedEncounterHeal_Vow",
        DisplayName = "Soul",
        Description = "After each {$Keywords.EncounterAlt}, restore {$TooltipData.StatDisplay1} of the {!Icons.Health} lost in that {$Keywords.EncounterAlt}, less than usual due to the {#PenaltyFormat}{$TooltipData.CustomStatLinesWithShrineUpgrade.ShrineUpgradeName}{#Prev}."
    },
    {
        Id = "ReversedEncounterHeal_FlavorText01",
        DisplayName = "They fight endlessly, against gods and mortals alike, for love is truly the most human thing of all."
    },
    {
        Id = "ReversedEncounterHealMetaUpgrade",
        InheritFrom = "ReversedEncounterHeal",
    },
    {
        Id = "ReversedPerfectClearBoost",
        DisplayName = "The Tides",
        Description = "Deal {#UpgradeFormat} {$TooltipData.StatDisplay1} {#Prev} bonus damage for every time you clear an {$Keywords.EncounterAlt} without getting hit."
    },
    {
        Id = "ReversedPerfectClearBoost_FlavorText01",
        DisplayName = "It is said that after his loss, the seas raged harder than every before, then stood completely still."
    },
    {
        Id = "ReversedPerfectClearBoostMetaUpgrade",
        InheritFrom = "ReversedPerfectClearBoost",
    },
    {
      Id = "ReversedPerfectClearBoostMetaUpgrade_Tray",
      DisplayName = "The Tides",
      Description = "Deal {#UpgradeFormat} {$TooltipData.StatDisplay1} {#Prev} bonus damage for every time you clear an {$Keywords.EncounterAlt} without getting hit. Currently: {#UpgradeFormat}{$TooltipData.ExtractData.TooltipAccumulatedBonus:P}",
    },
    {
        Id = "ReversedDoorCashCard",
        DisplayName = "Greed",
        Description = "Gain {#UpgradeFormat} {$TooltipData.StatDisplay1}{!Icons.Currency} {#Prev} whenever you exit a {$Keywords.RoomAlt}.",
    },
    {
        Id = "ReversedDoorCashCard_FlavorText01",
        DisplayName = "In lust for more, one often takes curses disguised as blessings."
    },
    {
        Id = "ReversedDoorCashMetaUpgrade",
        InheritFrom = "ReversedDoorCashCard",
    },
    {
        Id = "ReversedManaPerRoomCard",
        DisplayName = "The Beloved Child",
        Description = "After each {$Keywords.RoomAlt}, gain {#UpgradeFormat}{$TooltipData.StatDisplay1}{!Icons.ManaUp}{#Prev}.",
    },
    {
        Id = "ReversedManaPerRoomCard_FlavorText01",
        DisplayName = "Though you know not who this card refers to, something within you treasures and loves them none-the-less."
    },
    {
        Id = "ReversedManaPerRoomMetaUpgrade",
        InheritFrom = "ReversedManaPerRoomCard",
    },
    {
        Id = "ReversedLowHealthCrit",
        DisplayName = "The Trapper",
        Description = "While below {#UpgradeFormat}{$TooltipData.StatDisplay1}{#Prev}{!Icons.Health}, you have {#UpgradeFormat}+{$TooltipData.ExtractData.CritBonus}% {#Prev} chance to deal {$Keywords.Crit} damage.",
    },
    {
        Id = "ReversedLowHealthCrit_FlavorText01",
        DisplayName = "It is only when we struggle against the world that we may truly excell."
    },
    {
        Id = "ReversedLowHealthCritMetaUpgrade",
        InheritFrom = "ReversedLowHealthCrit",
    },
    {
        Id = "ReversedSturdyChannel",
        DisplayName = "The Sky",
        Description = "While you {$Keywords.Hold}, you take {#UpgradeFormat}{$TooltipData.StatDisplay1} {#Prev} less damage.",
    },
    {
        Id = "ReversedSturdyChannel_FlavorText01",
        DisplayName = "Though you know the tyrant has long been felled, you sometimes imagine eyes staring down at you."
    },
    {
        Id = "ReversedSturdyChannelMetaUpgrade",
        InheritFrom = "ReversedSturdyChannel",
    },
    {
        Id = "ReversedCharmedEnemy",
        DisplayName = "The Witch",
        Description = "While there are at least {#BoldFormat} 4 {#Prev} foes in an {$Keywords.EncounterAlt}, {$Keywords.Charm} one of them, which will deal {#UpgradeFormat}{$TooltipData.StatDisplay1} {#Prev} damage.",
    },
    {
        Id = "ReversedCharmedEnemy_FlavorText01",
        DisplayName = "Perhaps the greatest mistakes are the ones which inadvertently inflict curses on others."
    },
    {
        Id = "ReversedCharmedEnemyMetaUpgrade",
        InheritFrom = "ReversedCharmedEnemy",
    },
    {
        Id = "ReversedCrowdDamage",
        DisplayName = "The Sirens",
        Description = "While there are at least {#BoldFormat} 5 {#Prev} foes in an {$Keywords.EncounterAlt}, deal {#UpgradeFormat}{$TooltipData.StatDisplay1} {#Prev} more damage.",
    },
    {
        Id = "ReversedCrowdDamage_FlavorText01",
        DisplayName = "Though their music is not to your taste, you can admit that at least Jetty has style."
    },
    {
        Id = "ReversedCrowdDamageMetaUpgrade",
        InheritFrom = "ReversedCrowdDamage",
    },
    {
        Id = "ReversedSharedRunProgress",
        DisplayName = "Curiosity",
        Description = "Whenever you increase your {!Icons.ManaUp}, gain {#UpgradeFormat}{$TooltipData.StatDisplay1} {#Prev} of that as {!Icons.HealthUp}, and vice versa.",
    },
    {
        Id = "ReversedSharedRunProgress_FlavorText01",
        DisplayName = "Perhaps some things are better left unknown, but you are not the type to resist meddling."
    },
    {
        Id = "ReversedSharedRunProgressMetaUpgrade",
        InheritFrom = "ReversedSharedRunProgress",
    },
    {
        Id = "ReversedOlympianDamage",
        DisplayName = "The Automaton",
        Description = "Your damaging effects from Olympians deal {#UpgradeFormat}{$TooltipData.StatDisplay1} {#Prev} damage.",
    },
    {
        Id = "ReversedOlympianDamage_FlavorText01",
        DisplayName = "What determines life? Maybe someday, this creation can learn to love, or at least mimic it."
    },
    {
        Id = "ReversedOlympianDamageMetaUpgrade",
        InheritFrom = "ReversedOlympianDamage",
    },
    {
        Id = "ReversedExtraPurchase",
        DisplayName = "The Steadfast Shades",
        Description = "After your first purchase in each {$Keywords.RoomAlt}, another item appears afterward. Any {!Icons.Currency} you gain is worth {#UpgradeFormat}{$TooltipData.StatDisplay1} {#Prev} more.",
    },
    {
        Id = "ReversedExtraPurchase_FlavorText01",
        DisplayName = "The loyalty of the many shades of the Underworld to the House must be commended and rewarded."
    },
    {
        Id = "ReversedExtraPurchaseMetaUpgrade",
        InheritFrom = "ReversedExtraPurchase",
    },
    {
        Id = "ReversedPomBiomeStart",
        DisplayName = "The Heir",
        Description = "At the start of every {$Keywords.Biome}, gain {#UpgradeFormat}+1{#Prev}{$Keywords.PomLevel} spread across up to {$TooltipData.StatDisplay1} of your {$Keywords.GodBoonPlural}.",
    },
    {
        Id = "ReversedPomBiomeStart_FlavorText01",
        DisplayName = "You can desperately relate to the burden of growing up in the shadow of an absent father, and the yearn to be legendary yourself."
    },
    {
        Id = "ReversedPomBiomeStartMetaUpgrade",
        InheritFrom = "ReversedPomBiomeStart",
    },
    {
        Id = "ReversedStrongRush",
        DisplayName = "Betrayal",
        Description = "Your {$Keywords.SprintBoonAlt} deals {#UpgradeFormat}{$TooltipData.StatDisplay1} {#Prev} more damage.",
    },
    {
        Id = "ReversedStrongRush_FlavorText01",
        DisplayName = "The cost of betraying the gods is great indeed. Alas, they have long memories."
    },
    {
        Id = "ReversedStrongRushMetaUpgrade",
        InheritFrom = "ReversedStrongRush",
    },
    {
        Id = "ReversedRenewableDD",
        DisplayName = "Discipline",
        Description = "Gain {#BoldFormatGraft}+1 {#Prev}{$Keywords.FlipArcanaExtraChanceSkelly} that replenishes in each {$Keywords.RoomAlt} that heals {#UpgradeFormat}{$TooltipData.ExtractData.LastStandHeal}%{#Prev}{!Icons.Health} and {!Icons.Mana}.",
    },
    {
        Id = "ReversedRenewableDD_FlavorText01",
        DisplayName = "In his prime, the Commander, must have been incredible. Or at least, he would like you to think so."
    },
    {
        Id = "ReversedRenewableDDMetaUpgrade",
        InheritFrom = "ReversedRenewableDD",
    },
    {
        Id = "ReversedArmorPerRoom",
        DisplayName = "Cunning",
        Description = "Gain {#BoldFormatGraft}+20{!Icons.ArmorTotal} {#Prev} whenever you pass through {$TooltipData.StatDisplay1} {$Keywords.RoomPlural}.",
    },
    {
        Id = "ReversedArmorPerRoom_FlavorText01",
        DisplayName = "In her opinion, being underestimated is the most powerful position there is."
    },
    {
        Id = "ReversedArmorPerRoomMetaUpgrade",
        InheritFrom = "ReversedArmorPerRoom",
    },
    {
        Id = "ReversedStatusCrit",
        DisplayName = "The Titaness",
        Description = "You have {$TooltipData.StatDisplay1} chance to deal {$Keywords.Crit} damage to foes with at least {#BoldFormatGraft}4 {#Prev}{$Keywords.StatusPluralAlt} from different Olympians.",
    },
    {
        Id = "ReversedStatusCrit_FlavorText01",
        DisplayName = "If you think dealing with the gods is difficult, imagine raising them."
    },
    {
        Id = "ReversedStatusCritMetaUpgrade",
        InheritFrom = "ReversedStatusCrit",
    },
    {
        Id = "ReversedHeroicRarity",
        DisplayName = "The Labyrinth",
        Description = "Any {$Keywords.GodBoonPlural} you find have {$TooltipData.StatDisplay1} chance to include {$Keywords.Heroic} blessings.",
    },
    {
        Id = "ReversedHeroicRarity_FlavorText01",
        DisplayName = "Escaping from those who harm often requires more bravery than to face an unconquerable maze."
    },
    {
        Id = "ReversedHeroicRarityMetaUpgrade",
        InheritFrom = "ReversedHeroicRarity",
    },
    {
        Id = "ReversedSacrificeForLevels",
        DisplayName = "The Sacrifice",
        Description = "You can purge most rewards for {$TooltipData.StatDisplay1}{$Keywords.PomLevel} spread across your leftmost column {$Keywords.GodBoonPluralAlt}, up to {#UpgradeFormat}{$TooltipData.StatDisplay2} {#Prev} times this night.",
    },
    {
        Id = "ReversedSacrificeForLevels_FlavorText01",
        DisplayName = "Is there anything more tragic than knowningly walking to your doom to save the ones you love?"
    },
    {
        Id = "ReversedSacrificeForLevelsMetaUpgrade",
        InheritFrom = "ReversedSacrificeForLevels",
    },
    {
      Id = "ReversedSacrificeForLevelsMetaUpgrade_Tray",
      DisplayName = "The Sacrifice",
        Description = "You can purge most rewards for {$TooltipData.StatDisplay1}{$Keywords.PomLevel} spread across your leftmost column {$Keywords.GodBoonPluralAlt}, up to {#UpgradeFormat}{$TooltipData.StatDisplay2} {#Prev}more time(s) this night."
    },
    {
        Id = "ReversedGatherRarity",
        DisplayName = "The Earth",
        Description = "Whenever you gather resources, a random {$Keywords.GodBoon} — or {$TooltipData.StatDisplay1} of the time, an {$Keywords.Card} — gains {$Keywords.Rarity}.",
    },
    {
        Id = "ReversedGatherRarity_FlavorText01",
        DisplayName = "For a being that provides so many bounties to life, she is overwhelmingly cruel and capricious."
    },
    {
        Id = "ReversedGatherRarityMetaUpgrade",
        InheritFrom = "ReversedGatherRarity",
    },
    {
        Id = "ReversedUnFatedReward",
        DisplayName = "The Prophet",
        Description = "While not at the {$Keywords.Random}, {$Keywords.RoomPlural} are {$TooltipData.StatDisplay1} more likely to contain a {$Keywords.RunReward}.",
    },
    {
        Id = "ReversedUnFatedReward_FlavorText01",
        DisplayName = "Knowing what comes next is a curse on its own, but the inability to share you experiences is torture."
    },
    {
        Id = "ReversedUnFatedRewardMetaUpgrade",
        InheritFrom = "ReversedUnFatedReward",
    },
    {
        Id = "ReversedRandomBonusLevels",
        DisplayName = "Temptation",
        Description = "Some {$Keywords.GodBoonPlural} will have up to {#UpgradeFormat} {$TooltipData.StatDisplay1}{$Keywords.PomLevel}",
    },
    {
        Id = "ReversedRandomBonusLevels_FlavorText01",
        DisplayName = "His power lies in the dreams and desire of others, and he loves to wield it lavishly."
    },
    {
        Id = "ReversedRandomBonusLevelsMetaUpgrade",
        InheritFrom = "ReversedRandomBonusLevels",
    },
    {
        Id = "ReversedKeepsakeReAdd",
        DisplayName = "Regret",
        Description = "Gain {$TooltipData.StatDisplay1} {$Keywords.FlipTheArcanaFragileArcanaCards}.",
    },
    {
        Id = "ReversedKeepsakeReAdd_FlavorText01",
        DisplayName = "Despite bearing the burden of losing his family, his love, and cursing his beloved creations, he none-the-less endeavours to improve."
    },
    {
        Id = "ReversedKeepsakeReAddMetaUpgrade",
        InheritFrom = "ReversedKeepsakeReAdd",
    },
    {
        Id = "ReversedExtraFeatures",
        DisplayName = "Duty",
        Description = "{$Keywords.RoomPlural} are {$TooltipData.StatDisplay1} more likely to include {$Keywords.FlipTheArcanaPointsOfInterest}, if possible.",
    },
    {
        Id = "ReversedExtraFeatures_FlavorText01",
        DisplayName = "No matter how much they try to hide it, gods are just as multifaceted as the mortals that worship them."
    },
    {
        Id = "ReversedExtraFeaturesMetaUpgrade",
        InheritFrom = "ReversedExtraFeatures",
    },
    {
        Id = "ReversedPerfectPower",
        DisplayName = "Victory",
        Description = "Every strike grants {$Keywords.FlipTheArcanaPerfectPowerStacks}, up to a limit of {$TooltipData.StatDisplay1} stacks.",
    },
    {
        Id = "ReversedPerfectPower_FlavorText01",
        DisplayName = "May winged victory favour you on your endeavours, but if not, you know it is sweeter when you pry it from her claws."
    },
    {
        Id = "ReversedPerfectPowerMetaUpgrade_Tray",
        DisplayName = "Victory",
        Description = "Every strike grants {$Keywords.FlipTheArcanaPerfectPowerStacks}, up to a limit of {$TooltipData.StatDisplay1} stacks. Currently: {$TooltipData.ExtractData.CurrentStacks} stacks."
    },
    {
        Id = "ReversedPerfectPowerMetaUpgrade",
        InheritFrom = "ReversedPerfectPower",
    },
    {
        Id = "ReversedFullDefiance",
        DisplayName = "The Final Farewell",
        Description = "While you have all your {$Keywords.ExtraChanceMisc} (at least one), you deal {#UpgradeFormat}{$TooltipData.StatDisplay2} {#Prev}damage and have a {#UpgradeFormat}{$TooltipData.StatDisplay1} {#Prev} chance to {$Keywords.Dodge}.",
    },
    {
        Id = "ReversedFullDefiance_FlavorText01",
        DisplayName = "Hold those you love close, for you never know when you will lose the chance to."
    },
    {
        Id = "ReversedFullDefianceMetaUpgrade",
        InheritFrom = "ReversedFullDefiance",
    },
    {
        Id = "ReversedCheaperChannel",
        DisplayName = "The Seer",
        Description = "You use {#AltUpgradeFormat}-{$TooltipData.StatDisplay1}{#Prev}{!Icons.Mana}.",
    },
    {
        Id = "ReversedCheaperChannel_FlavorText01",
        DisplayName = "Though he may be blind, even the gods bow down to the wisdom he sees."
    },
    {
        Id = "ReversedCheaperChannelMetaUpgrade",
        InheritFrom = "ReversedCheaperChannel",
    },
    {
        Id = "ReversedArtemisKeepsake",
        DisplayName = "The Beasts",
        Description = "Gain {#AltUpgradeFormat}+{$TooltipData.ExtractData.Chance}% {#Prev}{$Keywords.Crit} damage chance, but you are limited to {#AltPenaltyFormat}{$TooltipData.ExtractData.Health}{!Icons.HealthDown}{#Prev}.",
    },
    {
        Id = "ReversedArtemisKeepsake_FlavorText01",
        DisplayName = "Perhaps it is telling that the gods bring out the ugliest parts of humanity, but that is something you try not to dwell on."
    },
    {
        Id = "ReversedArtemisKeepsakeMetaUpgrade",
        InheritFrom = "ReversedArtemisKeepsake",
    },
    {
        Id = "ReversedBackstab",
        DisplayName = "The Heroine",
        Description = "Deal {#UpgradeFormat}{$TooltipData.StatDisplay1} {#Prev} damage when striking from behind.",
    },
    {
        Id = "ReversedBackstab_FlavorText01",
        DisplayName = "Striking first, and often, is the best way to display that you are more than equal in weight."
    },
    {
        Id = "ReversedBackstabMetaUpgrade",
        InheritFrom = "ReversedBackstab",
    },
    {
        Id = "ReversedPotentDefiance",
        DisplayName = "Hatred",
        Description = "Your {$Keywords.ExtraChance} effects heal {#UpgradeFormat}{$TooltipData.StatDisplay1}{#Prev}{!Icons.Health} when used.",
    },
    {
        Id = "ReversedPotentDefiance_FlavorText01",
        DisplayName = "Though you never saw it in your prime, and it never embraced you as it did your brother, you know its love for the children of Hades."
    },
    {
        Id = "ReversedPotentDefianceMetaUpgrade",
        InheritFrom = "ReversedPotentDefiance",
    },
    {
        Id = "ReversedSpellDamage",
        DisplayName = "Dawn",
        Description = "Your {$Keywords.Spell} deals {#UpgradeFormat}{$TooltipData.ExtractData.Bonus:P} {#Prev}damage.",
    },
    {
        Id = "ReversedSpellDamage_FlavorText01",
        DisplayName = "Rosy-fingered and clad in saffron, she is who brings beauty and luminance at the start of every day, just as you hope to achieve."
    },
    {
        Id = "ReversedSpellDamageMetaUpgrade",
        InheritFrom = "ReversedSpellDamage",
    },
    {
        Id = "ReversedBonusTalent",
        DisplayName = "Idolation",
        Description = "The next {$Keywords.TalentPoint} you find grants {#UpgradeFormat}+{$TooltipData.ExtractData.Count} {#Prev}extra upgrades."
    },
    {
        Id = "ReversedBonusTalent_FlavorText01",
        DisplayName = "Though long is the shadow cast upon Selene, she too is granted love, or a facsimile of it, from the endlessly asleep."
    },
    {
        Id = "ReversedBonusTalentMetaUpgrade",
        InheritFrom = "ReversedBonusTalent",
    },
    {
        Id = "ReversedProjectileSlow",
        DisplayName = "The Winds",
        Description = "Most foes' ranged shots are {#UpgradeFormat}{$TooltipData.ExtractData.TooltipDodgeBonus:P} {#Prev} slower."
    },
    {
        Id = "ReversedProjectileSlow_FlavorText01",
        DisplayName = "They bring both beautiful breezes and destructive gales, and are as versatile as the seasons. Perhaps you could learn something from them."
    },
    {
        Id = "ReversedProjectileSlowMetaUpgrade",
        InheritFrom = "ReversedProjectileSlow",
    },
    {
        Id = "ReversedDashRecovery",
        DisplayName = "Flight",
        Description = "You can {$Keywords.Dash} {#UpgradeFormat}{$TooltipData.ExtractData.TooltipMultiplier:P} {#Prev} more frequently."
    },
    {
        Id = "ReversedDashRecovery_FlavorText01",
        DisplayName = "The ability to defy gravity, to be unlimited, where nothing brings you down... is that not what being a witch is all about?"
    },
    {
        Id = "ReversedDashRecoveryMetaUpgrade",
        InheritFrom = "ReversedDashRecovery",
    },
    {
        Id = "ReversedElementRoom",
        DisplayName = "Solitude",
        Description = "Gain {#BoldFormatGraft}+1 random {$ConsumableData.ElementalBoost.UseFunctionArgs.[1].TraitName} {#Prev} whenever you pass through {$TooltipData.StatDisplay1} {$Keywords.RoomPlural}."
    },
    {
        Id = "ReversedElementRoom_FlavorText01",
        DisplayName = "Having so much time on your own leads you to developing mastery of the skills you possess."
    },
    {
        Id = "ReversedElementRoomMetaUpgrade",
        InheritFrom = "ReversedElementRoom",
    },
    {
        Id = "ReversedRandomCards",
        DisplayName = "The Wild",
        Description = "Draw {#UpgradeFormat} {$TooltipData.ExtractData.Count} {#Prev} random inactive {$Keywords.MetaRank1} {#BoldFormatGraft}Arcana Cards{#Prev}."
    },
    {
        Id = "ReversedRandomCards_FlavorText01",
        DisplayName = "For all its beauty and idleness, nature can so easy flip to evoking panic and horror. May it never die."
    },
    {
        Id = "ReversedRandomCardsMetaUpgrade",
        InheritFrom = "ReversedRandomCards",
    },
    {
        Id = "ReversedAdditionalOmegaChance",
        DisplayName = "Mockery",
        Description = "Your {$Keywords.AttackEX} and {$Keywords.SpecialEX} have a {$TooltipData.StatDisplay1} chance to hit {$TraitData.DoubleStrikeChanceBoon.StringTextNumeral} times."
    },
    {
        Id = "ReversedAdditionalOmegaChance_FlavorText01",
        DisplayName = "They say imitation is the most sincere form of flattery. Somehow, you're not convinced."
    },
    {
        Id = "ReversedAdditionalOmegaChanceMetaUpgrade",
        InheritFrom = "ReversedAdditionalOmegaChance",
    },
    {
        Id = "ReversedFreeOmega",
        DisplayName = "Elegance",
        Description = "Your {$Keywords.AttackEX} or {$Keywords.SpecialEX} cost {#BoldFormat}0{!Icons.Mana}{#Prev} the first {$TooltipData.StatDisplay1} times you use them in each {$Keywords.RoomAlt}."
    },
    {
        Id = "ReversedFreeOmega_FlavorText01",
        DisplayName = "Is it lonely, being seen as an object to be desired, but longing to be a partner that is cherished?"
    },
    {
        Id = "ReversedFreeOmegaMetaUpgrade",
        InheritFrom = "ReversedFreeOmega",
    },
    {
        Id = "ReversedMoreSacrifices",
        DisplayName = "The Garden",
        Description = "{$Keywords.TraitExchangeAlt} have an additional {#UpgradeFormat}+{$TooltipData.ExtractData.BonusChance}% {#Prev} chance to be offered, and grant {#BoldFormat}+{$TooltipData.ExtractData.Count}{#Prev} {$Keywords.PomLevel}"
    },
    {
        Id = "ReversedMoreSacrifices_FlavorText01",
        DisplayName = "Gods are so unused to the concept of death that they deny endless rest to their lovers, transforming them into unfeeling beauties."
    },
    {
        Id = "ReversedMoreSacrificesMetaUpgrade",
        InheritFrom = "ReversedMoreSacrifices",
    },
    {
        Id = "ReversedFirstHitTransform",
        DisplayName = "Metamorphosis",
        Description = "When you first hit a susceptible foe, inflict {$Keywords.Polymorph} {#UpgradeFormat} {$TooltipData.ExtractData.Chance:F} {#Prev} of the time."
    },
    {
        Id = "ReversedFirstHitTransform_FlavorText01",
        DisplayName = "Do you think it terrifies mortals, knowing the gods can transform you entirely at their whims?"
    },
    {
        Id = "ReversedFirstHitTransformMetaUpgrade",
        InheritFrom = "ReversedFirstHitTransform",
    },
    {
        Id = "ReversedUniqueGod",
        DisplayName = "The Muses",
        Description = "You deal {#UpgradeFormat} {$TooltipData.StatDisplay1} {#Prev} damage for each {$Keywords.GodBoon}-giver you have.",
    },
    {
        Id = "ReversedUniqueGod_FlavorText01",
        DisplayName = "To produce art is to be alive, so it is no wonder its patrons are so ever-present and beloved."
    },
    {
        Id = "ReversedUniqueGodMetaUpgrade_Tray",
        DisplayName = "The Muses",
        Description = "You deal {#UpgradeFormat} {$TooltipData.StatDisplay1} {#Prev} damage for each {$Keywords.GodBoon}-giver you have. Currently: {#UpgradeFormat} {$TooltipData.ExtractData.TotalOlympianMultiplier:P}{#Prev}."
    },
    {
        Id = "ReversedUniqueGodMetaUpgrade",
        InheritFrom = "ReversedUniqueGod",
    },
    {
        Id = "ReversedRiposteKill",
        DisplayName = "The Warrioresses",
        Description = "Whenever you kill a foe, gain {#UpgradeFormat} {$TooltipData.StatDisplay1} {#Prev} uses of {$Keywords.FlipTheArcanaRiposte}."
    },
    {
        Id = "ReversedRiposteKill_FlavorText01",
        DisplayName = "To survive in this world, one must be strong and independent, but also willing to rely on others."
    },
    {
        Id = "ReversedRiposteKillMetaUpgrade",
        InheritFrom = "ReversedRiposteKill",
    },
    {
        Id = "ReversedDDRefillBiomeStart",
        DisplayName = "The Physician",
        Description = "At the start of every {$Keywords.Biome}, restore spent {#BoldFormatGraft}{$Keywords.ExtraChance}{#Prev}, up to {#UpgradeFormat} {$TooltipData.StatDisplay1} {#Prev} of them total this night."
    },
    {
        Id = "ReversedDDRefillBiomeStart_FlavorText01",
        DisplayName = "A doctor's goal is to improve the health of their patients, but the best have the ability to thwart Death itself."
    },
    {
        Id = "ReversedDDRefillBiomeStartMetaUpgrade",
        InheritFrom = "ReversedDDRefillBiomeStart",
    },
    {
      Id = "ReversedDDRefillBiomeStartMetaUpgrade_Tray",
      DisplayName = "The Physician",
        Description = "At the start of every {$Keywords.Biome}, restore spent {#BoldFormatGraft}{$Keywords.ExtraChance}{#Prev}, up to {#UpgradeFormat} {$TooltipData.StatDisplay1} {#Prev} more of them this night."
    },
    {
        Id = "ReversedHealthWithBoons",
        DisplayName = "Youth",
        Description = "Gain {#UpgradeFormat} {$TooltipData.StatDisplay1}{#Prev}{!Icons.HealthUp} whenever you claim a {$Keywords.GodBoon}."
    },
    {
        Id = "ReversedHealthWithBoons_FlavorText01",
        DisplayName = "They say youth is wasted on the young, but the gods enjoy her service and mercy forevermore."
    },
    {
        Id = "ReversedHealthWithBoonsMetaUpgrade",
        InheritFrom = "ReversedHealthWithBoons",
    },
    {
        Id = "ReversedRandomSacrifice",
        DisplayName = "The Coven",
        Description = "{#UpgradeFormat}{$TooltipData.StatDisplay1} {#Prev} of the time, {$Keywords.GodBoonPlural} will ask you to {$Keywords.FlipTheArcanaTraitExchange} a random blessing. {#BoldFormat} {$Keywords.FlipTheArcanaTraitExchange} Boons {#Prev} will grant {#BoldFormat} +{$TooltipData.ExtractData.BonusLevel}{$Keywords.PomLevel}"
    },
    {
        Id = "ReversedRandomSacrifice_FlavorText01",
        DisplayName = "With their one eye and tooth, they see naught but the future and taste naught but the truth."
    },
    {
        Id = "ReversedRandomSacrificeMetaUpgrade",
        InheritFrom = "ReversedRandomSacrifice",
    },
    {
        Id = "ReversedManaShield",
        DisplayName = "The Sculptor",
        Description = "Automatically use {#ManaFormat}{$TooltipData.StatDisplay1}{#Prev}{!Icons.Mana} per {!Icons.Health} to resist up to {#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamageBlocked}% {#Prev}of any damage."
    },
    {
        Id = "ReversedManaShield_FlavorText01",
        DisplayName = "May you too love something so much that your passion begets life on its own."
    },
    {
        Id = "ReversedManaShieldMetaUpgrade",
        InheritFrom = "ReversedManaShield",
    },
    {
        Id = "ReversedFountainGold",
        DisplayName = "The King",
        Description = "Whenever you use a {$Keywords.Fountain}, gain {#UpgradeFormat}+{$TooltipData.ExtractData.FountainGold}{#Prev}{!Icons.Currency}."
    },
    {
        Id = "ReversedFountainGold_FlavorText01",
        DisplayName = "Sometimes making tough choices means being hated, but when you rule, you must consider the needs of the many."
    },
    {
        Id = "ReversedFountainGoldMetaUpgrade",
        InheritFrom = "ReversedFountainGold",
    },
    {
        Id = "ReversedCursedLegendaryBoost",
        DisplayName = "The Sun",
        Description = "Any {$Keywords.GodBoonPlural} you find have {#UpgradeFormat} +{$TooltipData.ExtractData.LegendaryBonus}% {#Prev} chance to include {$Keywords.Legendary} blessings, but {#PenaltyFormat} {$TooltipData.ExtractData.RarityBonus}% {#Prev} chance to include {$Keywords.Rare} or {$Keywords.Epic} ones."
    },
    {
        Id = "ReversedCursedLegendaryBoost_FlavorText01",
        DisplayName = "Fly not too close, lest you burn up in its brilliance, but not too far, lest you be unable to grow."
    },
    {
        Id = "ReversedCursedLegendaryBoostMetaUpgrade",
        InheritFrom = "ReversedCursedLegendaryBoost",
    },
    {
        Id = "ReversedBossResistance",
        DisplayName = "The Ruse",
        Description = "Take {#UpgradeFormat}-{$TooltipData.ExtractData.Defense}% {#Prev}damage from {$Keywords.BossPlural}."
    },
    {
        Id = "ReversedBossResistance_FlavorText01",
        DisplayName = "The most brilliant plans are often the most simple, for who would ever suspect a trophy to be their demise?"
    },
    {
        Id = "ReversedBossResistanceMetaUpgrade",
        InheritFrom = "ReversedBossResistance",
    },
    {
        Id = "ReversedRandomBuild",
        DisplayName = "Good Fortune",
        Description = "Draw {#UpgradeFormat} {$TooltipData.StatDisplay1} {#Prev} random {#BoldFormat} Arcana Cards{#Prev}. Lose these for a new set at the start of the next {$Keywords.Biome}."
    },
    {
        Id = "ReversedRandomBuild_FlavorText01",
        DisplayName = "The way the dice fall is one of the things you cannot truly control, no matter how you try."
    },
    {
        Id = "ReversedRandomBuildMetaUpgrade",
        InheritFrom = "ReversedRandomBuild",
    },
    {
        Id = "ReversedProtectionCooldown",
        DisplayName = "Burden",
        Description = "Gain {$Keywords.FlipTheArcanaUnyielding}, which lasts until you are hit. Restore it after {#UpgradeFormat} {$TooltipData.StatDisplay1} {#Prev} Sec."
    },
    {
        Id = "ReversedProtectionCooldown_FlavorText01",
        DisplayName = "The gods' justice sentenced him to an eternity of suffering for the world to continue. Perhaps someday, he can rest."
    },
    {
        Id = "ReversedProtectionCooldownMetaUpgrade",
        InheritFrom = "ReversedProtectionCooldown",
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