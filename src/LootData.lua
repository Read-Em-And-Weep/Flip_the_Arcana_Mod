local newLootData = {
    MonstrosityMetaUpgradeUpgrade =
	{
        InheritFrom = { "BaseLoot", "BaseSoundPackage" },
		IsMetaUpgradeSource = true,
		-- GameStateRequirements handled in RunProgress table
		BackgroundAnimation = "HammerScreen_In",
		GodLoot = false,
		CanReceiveGift = false,
		ForceCommon = true,
		UseText = "UseWeaponUpgrade",
		UseTextTalkAndSpecial = "UseWeaponUpgradeAndConsume",
		BlockedLootInteractionText = "UseWeaponUpgradeLocked",
		DebugOnly = true,
		Weight = 0,
		Icon = "Inactive_Card_Icon",
		DoorIcon = "WeaponUpgradePreview",
		BackgroundColor = { 255, 78, 0, 65 },
		Color = { 85, 214, 161, 255 },
		LightingColor = { 85, 214, 161, 255 },
		LootColor = { 85, 214, 161, 255 },
		BoonGetColor = { 85, 214, 161, 255 },
		MenuTitle = "MonstrosityCardifyUpgradeChoiceMenu_Title",
		SpawnSound = "/SFX/HadesPaperFinish",
		ConfirmSound = "/SFX/HadesPaperFinish",
		PortraitEnterSound = "/SFX/HadesPaperFinish",
		UpgradeSelectedSound = "/SFX/HadesPaperFinish",
		BoonInfoTitleText = "Codex_BoonInfo_Title_Hammer",
		BanUnpickedBoonsEligible = false,
		--PickupSound = "/SFX/WeaponUpgradeHammerDrop",
		GoldConversionEligible = false,

		FlavorTextIds =
		{
			"MonstrosityCardifyUpgrade_FlavorText01",
			"MonstrosityCardifyUpgrade_FlavorText02",
			"MonstrosityCardifyUpgrade_FlavorText03",
		},

		PriorityUpgrades = {},
		WeaponUpgrades = {},
		Traits =
		{
		"ChannelSlowMetaUpgrade",
        "ManaOverTimeMetaUpgrade",
        "DoorHealMetaUpgrade",
        "InsideCastBuffMetaUpgrade",
        "LowManaDamageMetaupgrade",
		"StartingGoldMetaUpgrade",
		"SprintShieldMetaUpgrade",
		"BossShieldMetaUpgrade",
		"LastStandSlowTimeMetaUpgrade",
		"CastDamageMetaUpgrade",
		"MagicCritMetaUpgrade",
		"ChamberHealthMetaUpgrade",
		"DoorRerollMetaUpgrade",
		"PanelRerollMetaUpgrade",
		"RerollTradeOffMetaUpgrade",
		"RarityBoostMetaUpgrade",
		"DuoRarityBoostMetaUpgrade",
		"EpicRarityBoostMetaUpgrade",
		"DodgeBonusMetaUpgrade",
		"HealthManaBonusMetaUpgrade",
		"EffectVulnerabilityMetaUpgrade",
		"SorceryRegenMetaUpgrade",
		"LowHealthBuffMetaUpgrade",
		"MetaToRunMetaUpgrade",
		"ReversedChanneledCastMetaUpgrade",
		"ReversedHealthRegenMetaUpgrade",
		"ReversedLowManaDamageBonusMetaUpgrade",
		"ReversedCastCountMetaUpgrade",
		"ReversedSorceryRegenMetaUpgrade",
		"ReversedCastBuffMetaUpgrade",
		"ReversedBonusHealthMetaUpgrade",
		"ReversedBonusDodgeMetaUpgrade",
		"ReversedManaOverTimeMetaUpgrade",
		"ReversedMagicCritMetaUpgrade",
		"ReversedSprintShieldMetaUpgrade",
		"ReversedLastStandMetaUpgrade",
		"ReversedMaxHealthPerRoomMetaUpgrade",
		"ReversedStatusVulnerabilityMetaUpgrade",
		"ReversedChanneledBlockMetaUpgrade",
		"ReversedDoorRerollMetaUpgrade",
		"ReversedStartingGoldMetaUpgrade",
		"ReversedMetaToRunUpgradeMetaUpgrade",
		"ReversedRarityBoostMetaUpgrade",
		"ReversedBonusRarityMetaUpgrade",
		"ReversedTradeOffMetaUpgrade",
		"ReversedScreenRerollMetaUpgrade",
		"ReversedLowHealthBonusMetaUpgrade",
		"ReversedEpicRarityBoostMetaUpgrade",
		},
		Consumables = {},

		FirstSpawnVoiceLines =
		{
			PreLineWait = 0.7,
			GameStateRequirements =
			{
			},
			{ },
		},

		OnSpawnVoiceLines =
		{
			BreakIfPlayed = true,
			RandomRemaining = true,
			PlayOnceFromTableThisRun = true,
			PreLineWait = 0.85,
			GameStateRequirements =
			{
				{
					--
				}
			},

			{ Cue = "/VO/Melinoe_5380", Text = "The Arcana and the Arms of Night go hand in hand..." },
				{ Cue = "/VO/Melinoe_0539", Text = "The Arcana..." },
						{ Cue = "/VO/Melinoe_0540", Text = "Strength and wisdom of my predecessors." },
		{ Cue = "/VO/Melinoe_1135", Text = "What say the Cards this eve?" },
		{ Cue = "/VO/Melinoe_1136", Text = "Which Cards reflect my path...?" },
		{ Cue = "/VO/Melinoe_1137", Text = "Know the past, know the future..." },
		{ Cue = "/VO/Melinoe_1138", Text = "What say the Arcana...?" },
		{ Cue = "/VO/Melinoe_1867", Text = "Wisdom of the ages..." },
		{ Cue = "/VO/Melinoe_1869", Text = "What is my path...?" },

		},


		PickupVoiceLines =
		{
			--
		},

		UpgradePickedVoiceLines =
		{
			GameStateRequirements =
			{
			},
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				PreLineWait = 1.05,
				SuccessiveChanceToPlayAll = 0.33,
				UsePlayerSource = true,
				Cooldowns =
				{
					{ Name = "MelinoeAnyQuipSpeech" },
				},
				{ Cue = "/VO/Melinoe_5380", Text = "The Arcana and the Arms of Night go hand in hand..." },
				{ Cue = "/VO/Melinoe_0539", Text = "The Arcana..." },
						{ Cue = "/VO/Melinoe_0540", Text = "Strength and wisdom of my predecessors." },
		{ Cue = "/VO/Melinoe_0541", Text = "Focus..." },
		{ Cue = "/VO/Melinoe_1135", Text = "What say the Cards this eve?" },
		{ Cue = "/VO/Melinoe_1136", Text = "Which Cards reflect my path...?" },
		{ Cue = "/VO/Melinoe_1137", Text = "Know the past, know the future..." },
		{ Cue = "/VO/Melinoe_1138", Text = "What say the Arcana...?" },
		{ Cue = "/VO/Melinoe_1139", Text = "I have this..." },
		{ Cue = "/VO/Melinoe_1867", Text = "Wisdom of the ages..." },
		{ Cue = "/VO/Melinoe_1868", Text = "{#Emph}<Sigh>" },
		{ Cue = "/VO/Melinoe_1869", Text = "What is my path...?" },
		{ Cue = "/VO/Melinoe_1870", Text = "Just breathe..." },


			},
		},

		SlottedVoiceLines =
		{

		},
	},
}

for newLootName, newLootData in pairs(newLootData) do
    game.ProcessDataInheritance(newLootData, game.LootData)
    game.LootData[newLootName]=newLootData
end
