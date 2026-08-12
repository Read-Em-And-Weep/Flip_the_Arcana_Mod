mod.NewMetaUpgradeCardData = 
{

	------------ ROW 1 ----------------
	ReversedChanneledCast = -- Bloodlust, Ares
	{
		InheritFrom = { "BaseMetaUpgrade" },
        Column = 1,
        Row = 1,
		Flipped = 1,
        StartUnlocked = false,
		Cost = 1,
		Image = "FlippedCardArt_01",
		--StartEquipped = true,
		TraitName = "ReversedChanneledCastMetaUpgrade",
		Type = "Time",

		ResourceCost = 
		{
			MetaCardPointsCommon = 15,
			ModsNikkelMHadesBiomes_PlantTartarus = 3,
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 2, ModsNikkelMHadesBiomes_PlantTartarus = 4},
			{ CardUpgradePoints = 5, ModsNikkelMHadesBiomes_PlantTartarus = 8, ModsNikkelMHadesBiomes_BossResourceStyx = 2 },
		},

		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

				{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedChanneledCast_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedHealthRegen = -- Faithful Daughter, Melinoe
	{
		Cost = 1,
        InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 1,
        Column = 2,
        Row = 1,
		StartUnlocked = false,
		Image = "FlippedCardArt_02",
		TraitName = "ReversedHealthRegenMetaUpgrade",
		Type = "Life",

		ResourceCost = 
		{
			MetaCardPointsCommon = 20,
			MixerShadow = 1,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 2, MixerShadow = 1},
			{ CardUpgradePoints = 1, MixerShadow = 2, ModsNikkelMHadesBiomes_BossResourceElysium = 2, },
		},

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

				{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedHealthRegen_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedLowManaDamageBonus = -- Performance, Apollo
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 1,
		TraitName = "ReversedLowManaDamageBonusMetaUpgrade",
        Column = 3,
        Row = 1,

		Image = "FlippedCardArt_03",
		Cost = 2,
		ResourceCost = 
		{
			MetaCardPointsCommon = 30,
			ModsNikkelMHadesBiomes_PlantElysium = 5,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3, ModsNikkelMHadesBiomes_PlantElysium = 6, GiftPoints = 3 },
			{ CardUpgradePoints = 6, ModsNikkelMHadesBiomes_PlantElysium = 10, ModsNikkelMHadesBiomes_BossResourceAsphodel = 2 },
		},

		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedLowManaDamageBonus_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedCastCount = -- The Hydra, Lernie
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 1,
		TraitName = "ReversedCastCountMetaUpgrade",
        Column = 4,
        Row = 1,
		Cost = 3,
		RandomDrawChance = 0.1,
		Image = "FlippedCardArt_04",
		ResourceCost = 
		{
			MetaCardPointsCommon = 30,
			ModsNikkelMHadesBiomes_PlantAsphodel = 3
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 4, ModsNikkelMHadesBiomes_PlantAsphodel = 5 , ModsNikkelMHadesBiomes_BossResourceAsphodel = 1},
			{ CardUpgradePoints = 6, ModsNikkelMHadesBiomes_PlantAsphodel = 6, ModsNikkelMHadesBiomes_BossResourceAsphodel = 2 },
		},

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedCastCount_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedSorceryRegenUpgrade = -- The Loyal Protector, Cerberus
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 1,
		TraitName = "ReversedSorceryRegenMetaUpgrade",
        Column = 5,
        Row = 1,
		Cost = 0,
		Image = "FlippedCardArt_05",
		ResourceCost = 
		{
			MetaCardPointsCommon = 35,
			MixerGBoss = 1,
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3, MixerGBoss = 2 },
			{ CardUpgradePoints = 6, ModsNikkelMHadesBiomes_OreStyx = 8, MixerGBoss = 2, },
		},

		--[[CustomTextWithShrineUpgrade = 
		{
			ShrineUpgradeName = "HealingReductionShrineUpgrade",
			CardTitle = "ReversedSorceryRegenUpgrade_Vow",
		},]]

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		AutoEquipRequirements = 
		{
			SurroundEquipped = true,
			MetaUpgradeName = "ReversedSorceryRegenUpgrade"
		},
		AutoEquipText = "SorceryRegenUpgrade_AutoEquip",

		FlavorTextData = 
		{
			{
				Name = "ReversedSorceryRegenMetaUpgrade_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	------------ ROW 2 ----------------
	ReversedCastBuff = -- The Gorgon, Dusa
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 1,
        Column = 1,
        Row = 2,
		Cost = 2,
		Image = "FlippedCardArt_06",
		StartUnlocked = false,
		TraitName = "ReversedCastBuffMetaUpgrade",
		Type = "Death",

		ResourceCost = 
		{
			MetaCardPointsCommon = 35,
			ModsNikkelMHadesBiomes_OreAsphodel = 5,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3, ModsNikkelMHadesBiomes_OreAsphodel = 6, GiftPointsRare = 3 },
			{ CardUpgradePoints = 5, ModsNikkelMHadesBiomes_OreAsphodel = 9, ModsNikkelMHadesBiomes_BossResourceTartarus = 2, },
		},

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedCastBuff_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedBonusHealth = -- The Hearth, Hestia
	{
		InheritFrom = { "BaseBonusMetaUpgrade" },
		Flipped = 1,
		Cost = 2,
        Column = 2,
        Row = 2,
		Image = "FlippedCardArt_07",
		ResourceCost = 
		{
			MetaCardPointsCommon = 35,
			ModsNikkelMHadesBiomes_CropAsphodel = 5
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3, ModsNikkelMHadesBiomes_CropAsphodel = 7, MixerFBoss = 1 },
			{ CardUpgradePoints = 6, ModsNikkelMHadesBiomes_CropAsphodel = 9, MixerFBoss = 2 },
		},
		TraitName = "ReversedBonusHealthMetaUpgrade",
		--CustomTrayText = "HealthManaBonusMetaUpgrade_Tray",

		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedBonusHealth_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedBonusDodge = -- The Blacksmith, Hephaestus
	{
		InheritFrom = { "BaseBonusMetaUpgrade" },
		Flipped = 1,
        Column = 3,
        Row = 2,
		Cost = 1,
		Image = "FlippedCardArt_08",
		ResourceCost = 
		{
			MetaCardPointsCommon = 20,
			OrePAdamant = 3,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3, OrePAdamant = 6, ModsNikkelMHadesBiomes_PlantAsphodel = 8},
			{ CardUpgradePoints = 6, OrePAdamant = 8, ModsNikkelMHadesBiomes_BossResourceAsphodel = 2, },
		},
		--[[
		AutoEquipRequirements = 
		{
			MinDuplicateCount = 3,
		},
		]]
		TraitName = "ReversedBonusDodgeMetaUpgrade",

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },

		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		--AutoEquipText = "BonusDodge_AutoEquip",
		FlavorTextData = 
		{
			{
				Name = "ReversedBonusDodge_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedManaOverTime = -- Bounty, Poseidon
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 1,
        Column = 4,
        Row = 2,
		TraitName = "ReversedManaOverTimeMetaUpgrade",
		Type = "Soul",
		Cost = 5,
		Image = "FlippedCardArt_09",
		ResourceCost = 
		{
			MetaCardPointsCommon = 50,
			ModsNikkelMHadesBiomes_OreElysium = 5,
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 5, ModsNikkelMHadesBiomes_OreElysium = 8 },
			{ CardUpgradePoints = 10, ModsNikkelMHadesBiomes_OreElysium = 10, MixerGBoss = 2, },
		},

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedManaOverTime_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedMagicCrit = -- Retribution, Nemesis
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 1,
        Column = 5,
        Row = 2,

		TraitName = "ReversedMagicCritMetaUpgrade",
		Cost = 2,
		

		Image = "FlippedCardArt_10",
		ResourceCost = 
		{
			MetaCardPointsCommon = 35,
			ModsNikkelMHadesBiomes_CropTartarus = 2
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3,ModsNikkelMHadesBiomes_CropTartarus = 4 },
			{ CardUpgradePoints = 6, ModsNikkelMHadesBiomes_CropTartarus = 6, ModsNikkelMHadesBiomes_BossResourceTartarus = 2 },
		},

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedMagicCrit_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	------------ ROW 3 ----------------
	ReversedSprintShield = -- The Cyclops, Polyphemus
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 1,
        Column = 1,
        Row = 3,

		Cost = 1,
		Image = "FlippedCardArt_11",
		ResourceCost = 
		{
			MetaCardPointsCommon = 20,
			MixerNBoss = 1
		},
		TraitName = "ReversedSprintShieldMetaUpgrade",
		ActiveWhileDead = true,
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 1,ModsNikkelMHadesBiomes_CropStyx = 3, MixerNBoss = 1},
			{ CardUpgradePoints = 3, ModsNikkelMHadesBiomes_CropStyx = 6, MixerNBoss = 2 },
		},

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedSprintShield_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedLastStand = -- Sleep, Hypnos
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 1,
        Column = 2,
        Row = 3,

		Cost = 4,
		Image = "FlippedCardArt_12",
		ResourceCost = 
		{
			MetaCardPointsCommon = 40,
			PlantIPoppy = 3,
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 6 , PlantIPoppy = 6, ModsNikkelMHadesBiomes_BossResourceElysium = 2 },
			{ CardUpgradePoints = 12, PlantIPoppy = 8, MixerIBoss = 2 },
		},
		TraitName = "ReversedLastStandMetaUpgrade",
		--OnGrantedFunctionName = "GrantMetaUpgradeLastStands",
		--OnUpgradedFunctionName = "UpgradeMetaUpgradeLastStands",
		--need to set up like strength putting up an alert

		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedLastStand_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedMaxHealthPerRoom = -- The Wanderer, Odysseus
	{
		InheritFrom = { "BaseBonusMetaUpgrade" },
		Flipped = 1,
        Column = 3,
        Row = 3,

		Cost = 0,
		Image = "FlippedCardArt_13",
		ResourceCost = 
		{
			MetaCardPointsCommon = 30,
			GiftPointsEpic = 2,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3, PlantFMoly = 5, ModsNikkelMHadesBiomes_BossResourceTartarus = 2},
			{ CardUpgradePoints = 6, PlantPOlive = 6, MixerNBoss = 2 },
		},

		AutoEquipRequirements = 
		{
			MetaUpgradeName = "ReversedMaxHealthPerRoom",
			HasCostsThrough = 5
		},

		TraitName = "ReversedMaxHealthPerRoomMetaUpgrade",

		AutoEquipText = "ReversedMaxHealthPerRoom_AutoEquip",

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedMaxHealthPerRoom_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedStatusVulnerability = -- The Strategist, Athena
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 1,
        Column = 4,
        Row = 3,

		TraitName = "ReversedStatusVulnerabilityMetaUpgrade",
		Cost = 5,
		Image = "FlippedCardArt_14",
		ResourceCost = 
		{
			MetaCardPointsCommon = 45,
			PlantPOlive = 3,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 5, PlantPOlive = 5, ModsNikkelMHadesBiomes_BossResourceStyx = 2},
			{ CardUpgradePoints = 10, PlantPOlive = 7, MixerQBoss = 2 },
		},

		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedStatusVulnerability_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},		
	},
	ReversedChanneledBlock = -- Beauty, Aphrodite
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 1,
        Column = 5,
        Row = 3,

		TraitName = "ReversedChanneledBlockMetaUpgrade",
		Cost = 3,
		Image = "FlippedCardArt_15",
		ResourceCost = 
		{
			MetaCardPointsCommon = 40,
			ModsNikkelMHadesBiomes_CropElysium = 3
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 4, GiftPoints = 6, ModsNikkelMHadesBiomes_CropElysium = 6 },
			{ CardUpgradePoints = 6, SuperGiftPoints = 6, MixerOBoss = 2 },
		},
		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedChanneledBlock_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	------------ ROW 4 ----------------
	ReversedDoorReroll = -- Strife, Eris
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 1,
        Column = 1,
        Row = 4,

		Cost = 3,
		Image = "FlippedCardArt_16",

		ResourceCost = 
		{
			MetaCardPointsCommon = 40,
			TrashPoints = 15
		},
		TraitName = "ReversedDoorRerollMetaUpgrade",
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3 , MixerShadow = 3, ModsNikkelMHadesBiomes_PlantStyx = 10},
			{ CardUpgradePoints = 6, ModsNikkelMHadesBiomes_BossResourceStyx = 3, MixerOBoss = 2 },
		},

		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedDoorReroll_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedStartingGold = -- The Weaver, Arachne
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 1,
        Column = 2,
        Row = 4,

		Cost = 5,
		Image = "FlippedCardArt_17",
		ResourceCost = 
		{
			MetaCardPointsCommon = 50,
			MetaFabric = 4,
		},
		TraitName = "ReversedStartingGoldMetaUpgrade",
		--OnGrantedFunctionName = "GrantMetaUpgradeCurrency",
		--OnUpgradedFunctionName = "UpgradeMetaUpgradeCurrency",

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 5, MetaFabric = 6, ModsNikkelMHadesBiomes_OreStyx = 5 },
			{ CardUpgradePoints = 10, MetaFabric = 10, MixerFBoss = 2 },
		},

		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedStartingGold_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedMetaToRunUpgrade = -- Longing, Echo & Narcissus
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 1,
        Column = 3,
        Row = 4,

		TraitName = "ReversedMetaToRunUpgradeMetaUpgrade",
		Cost = 3,
		Image = "FlippedCardArt_18",
		ResourceCost = 
		{
			MetaCardPointsCommon = 35,
			OreHGlassrock = 4,
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3 , OreHGlassrock = 3, PlantGLotus = 6},
			{ CardUpgradePoints = 5, ModsNikkelMHadesBiomes_CropElysium = 8, MixerHBoss = 3 },
		},


		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedMetaToRunUpgrade_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedRarityBoost = -- Famine, Demeter
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 1,
        Column = 4,
        Row = 4,

		Cost = 5,
		Image = "FlippedCardArt_19",
		ResourceCost = 
		{
			MetaCardPointsCommon = 50,
			PlantHWheat = 5,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 4,ModsNikkelMHadesBiomes_CropStyx = 8, MixerIBoss = 2 },
			{ CardUpgradePoints = 10, ModsNikkelMHadesBiomes_PlantStyx = 12, WeaponPointsRare = 2 },
		},

		TraitName = "ReversedRarityBoostMetaUpgrade",

		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedRarityBoost_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedBonusRarity = -- Companionship, Familiars
	{
		InheritFrom = { "BaseBonusMetaUpgrade" },
		Flipped = 1,
        Column = 5,
        Row = 4,

		Cost = 0,
		Image = "FlippedCardArt_20",
		ResourceCost = 
		{
			MetaCardPointsCommon = 45,
			FamiliarPoints = 5,
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3, FamiliarPoints = 6 },
			{ CardUpgradePoints = 5, ModsNikkelMHadesBiomes_BossResourceElysium = 3, MixerHBoss = 2, },
		},
		AutoEquipRequirements = 
		{
			MetaUpgradeName = "ReversedBonusRarity",
			MaxDuplicateCount = 2,
			RequiredMetaUpgradesMin = 1,
		},
		TraitName = "ReversedBonusRarityMetaUpgrade",

		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		AutoEquipText = "BonusRarity_AutoEquip",
		FlavorTextData = 
		{
			{
				Name = "ReversedBonusRarity_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	------------ ROW 5 ----------------
	ReversedTradeOff = -- Doom, Moros
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 1,
        Column = 1,
        Row = 5,

		Cost = 0,
		Image = "FlippedCardArt_21",
		ResourceCost = 
		{
			MetaCardPointsCommon = 45,
			WeaponPointsRare = 2,
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 5, ModsNikkelMHadesBiomes_BossResourceStyx = 3, ModsNikkelMHadesBiomes_BossResourceElysium = 5},
			{ CardUpgradePoints = 10, MixerIBoss = 2, MixerQBoss = 2 },
		},
		TraitName = "ReversedTradeOffMetaUpgrade",

		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		AutoEquipRequirements = 
		{
			SurroundAllEquipped = true,
			MetaUpgradeName = "ReversedTradeOff"
		},

		AutoEquipText = "TradeOff_AutoEquip",
		FlavorTextData = 
		{
			{
				Name = "ReversedTradeOff_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedScreenReroll = -- Revelry, Dionysus
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 1,
        Column = 2,
        Row = 5,

		Cost = 4,
		Image = "FlippedCardArt_22",
		ResourceCost = 
		{
			MetaCardPointsCommon = 40,
			SuperGiftPoints = 3,
		},
		TraitName = "ReversedScreenRerollMetaUpgrade",

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 5, SuperGiftPoints = 3, GiftPoints = 5},
			{ CardUpgradePoints = 10, MixerPBoss = 2, ModsNikkelMHadesBiomes_BossResourceElysium =2 },
		},

		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedScreenReroll_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedLowHealthBonus = -- Futility, Sisyphus & Bouldy
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 1,
        Column = 3,
        Row = 5,

		TraitName = "ReversedLowHealthBonusMetaUpgrade",
		Cost = 4,
		Image = "FlippedCardArt_23",
		ResourceCost = 
		{
			MetaCardPointsCommon = 40,
			ModsNikkelMHadesBiomes_OreTartarus = 4,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 6, ModsNikkelMHadesBiomes_OreTartarus = 6, OreOIron = 6},
			{ CardUpgradePoints = 12,OreOIron = 5, ModsNikkelMHadesBiomes_BossResourceTartarus = 2 },
		},

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedLowHealthBonus_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedEpicRarityBoost = -- Encouragement, Supportive Shade
	{
		InheritFrom = { "BaseBonusMetaUpgrade" },
		Flipped = 1,
        Column = 4,
        Row = 5,
        
        Cost = 0,
		Image = "FlippedCardArt_24",
		ResourceCost = 
		{
			MetaCardPointsCommon = 45,
			PlantIShaderot = 8,
		},
		TraitName = "ReversedEpicRarityBoostMetaUpgrade",
		
		AutoEquipText = "EpicRarity_AutoEquip_Alt",
		AutoEquipRequirements = 
		{
			MetaUpgradeName = "ReversedEpicRarityBoost",
			OtherRowOrColumnEquipped = true,
			CardsRequired = 5, -- used for text
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 5, SuperGiftPoints = 4, ModsNikkelMHadesBiomes_OreTartarus = 7 },
			{ CardUpgradePoints = 10, Mixer5Common = 4, ModsNikkelMHadesBiomes_BossResourceElysium = 2},
		},

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedEpicRarityBoost_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedCardDraw = -- Monstrosity, Typhon
	{
		InheritFrom = { "BaseBonusMetaUpgrade" },
		Flipped = 1,
        Column = 5,
        Row = 5,

		Image = "FlippedCardArt_25",
        Cost = 0,
		ResourceCost = 
		{
			MetaCardPointsCommon = 60,
			MixerShadow = 5,
		},
		TraitName = "ReversedCardDrawMetaUpgrade",
		
		AutoEquipText = "CardDraw_AutoEquip",
		AutoEquipRequirements = 
		{
			MetaUpgradeName = "ReversedCardDraw",
			RequiredMetaUpgradesMax = 3,
			RequiredMetaUpgradesMin = 1,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 10, ModsNikkelMHadesBiomes_BossResourceStyx = 3, WeaponPointsRare = 2 },
			{ CardUpgradePoints = 20, MixerQBoss = 3, WeaponPointsRare = 3 },
		},

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedCardDraw_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedDoorCashCard = -- Greed, Midas
	{
		InheritFrom = { "BaseMetaUpgrade" },
        Column = 1,
        Row = 1,
		Flipped = 2,
        StartUnlocked = false,
		Cost = 1,
		Image = "FlippedCardArt_Greed",
		--StartEquipped = true,
		TraitName = "ReversedDoorCashMetaUpgrade", 
		Type = "Time",

		ResourceCost = 
		{
			MetaCardPointsCommon = 15,
			ModsNikkelMHadesBiomes_OreStyx = 4,
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 2, OreNBronze = 4},
			{ CardUpgradePoints = 5, ModsNikkelMHadesBiomes_OreStyx = 8, MixerOBoss = 2 },
		},

		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

				{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedDoorCashCard_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedManaPerRoomCard = -- Beloved Child, Macaria
	{
		Cost = 1,
        InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 2,
        Column = 2,
        Row = 1,
		StartUnlocked = false,
		Image = "FlippedCardArt_Beloved_Child",
		TraitName = "ReversedManaPerRoomMetaUpgrade",
		Type = "Life",

		ResourceCost = 
		{
			MetaCardPointsCommon = 20,
			MixerShadow = 1,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 2, MixerShadow = 1, ModsNikkelMHadesBiomes_CropAsphodel = 4},
			{ CardUpgradePoints = 2, MixerShadow = 2, MixerIBoss = 2, },
		},

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

				{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedManaPerRoomCard_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedLowHealthCrit = -- The Trapper, Orion
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 2,
		TraitName = "ReversedLowHealthCritMetaUpgrade",
        Column = 3,
        Row = 1,

		Image = "FlippedCardArt_Trapper",
		Cost = 2,
		ResourceCost = 
		{
			MetaCardPointsCommon = 30,
			PlantQFang = 5,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3, OreQScales = 6, PlantNMoss = 3 },
			{ CardUpgradePoints = 6, ModsNikkelMHadesBiomes_PlantTartarus = 10, MixerHBoss = 2 },
		},

		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedLowHealthCrit_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedSturdyChannel = -- The Sky, Ouranos
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 2,
		TraitName = "ReversedSturdyChannelMetaUpgrade",
        Column = 4,
        Row = 1,
		Cost = 3,
		RandomDrawChance = 0.1,
		Image = "FlippedCardArt_Sky",
		ResourceCost = 
		{
			MetaCardPointsCommon = 30,
			MixerShadow = 1
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 4, ModsNikkelMHadesBiomes_OreElysium = 5 , WeaponPointsRare = 1},
			{ CardUpgradePoints = 6, ModsNikkelMHadesBiomes_BossResourceElysium = 2, MixerPBoss = 2 },
		},

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedSturdyChannel_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedCharmedEnemy = -- The Witch, Pasiphaë
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 2,
		TraitName = "ReversedCharmedEnemyMetaUpgrade",
        Column = 5,
        Row = 1,
		Cost = 0,
		Image = "FlippedCardArt_Witch",
		ResourceCost = 
		{
			MetaCardPointsCommon = 35,
			MixerFBoss = 1,
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3, GiftPoints = 3 , ModsNikkelMHadesBiomes_PlantElysium = 5},
			{ CardUpgradePoints = 6, SuperGiftPoints = 3, MixerFBoss = 2, },
		},

		--[[CustomTextWithShrineUpgrade = 
		{
			ShrineUpgradeName = "HealingReductionShrineUpgrade",
			CardTitle = "ReversedSorceryRegenUpgrade_Vow",
		},]]

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		AutoEquipRequirements = 
		{
			SurroundEquipped = true,
			MetaUpgradeName = "ReversedCharmedEnemy"
		},
		AutoEquipText = "SorceryRegenUpgrade_AutoEquip",

		FlavorTextData = 
		{
			{
				Name = "ReversedCharmedEnemy_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	------------ ROW 2 ----------------
	ReversedCrowdDamage = -- The Sirens, Scylla, Jetty and Roxy
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 2,
        Column = 1,
        Row = 2,
		Cost = 2,
		Image = "FlippedCardArt_Sirens",
		StartUnlocked = false,
		TraitName = "ReversedCrowdDamageMetaUpgrade",
		Type = "Death",

		ResourceCost = 
		{
			MetaCardPointsCommon = 35,
			MixerGBoss = 1,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3, PlantGLotus = 6, MixerGBoss = 1 },
			{ CardUpgradePoints = 5, PlantGLotus = 9, MixerGBoss = 2, },
		},

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedCrowdDamage_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedSharedRunProgress = -- Curiosity, Dora
	{
		InheritFrom = { "BaseBonusMetaUpgrade" },
		Flipped = 2,
		Cost = 2,
        Column = 2,
        Row = 2,
		Image = "FlippedCardArt_Curiousity",
		ResourceCost = 
		{
			MetaCardPointsCommon = 35,
			MemPointsCommon = 120
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3, PlantIShaderot = 7, MixerShadow = 1 },
			{ CardUpgradePoints = 6, ModsNikkelMHadesBiomes_CropStyx = 7, MixerHBoss = 2 },
		},
		TraitName = "ReversedSharedRunProgressMetaUpgrade",

		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedSharedRunProgress_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedOlympianDamage = -- The Automaton, Talos
	{
		InheritFrom = { "BaseBonusMetaUpgrade" },
		Flipped = 2,
        Column = 3,
        Row = 2,
		Cost = 1,
		Image = "FlippedCardArt_Automaton",
		ResourceCost = 
		{
			MetaCardPointsCommon = 20,
			OrePAdamant = 3,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3, OrePAdamant = 6, OreChaosProtoplasm = 8},
			{ CardUpgradePoints = 6, OrePAdamant = 8, ModsNikkelMHadesBiomes_BossResourceAsphodel = 2, },
		},
		--[[
		AutoEquipRequirements = 
		{
			MinDuplicateCount = 3,
		},
		]]
		TraitName = "ReversedOlympianDamageMetaUpgrade",

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },

		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		--AutoEquipText = "BonusDodge_AutoEquip",
		FlavorTextData = 
		{
			{
				Name = "ReversedOlympianDamage_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedExtraPurchase = -- The Steadfast Shades, Head Chef, Wretched Broker, 
	--Resource Director, House Contractor, Music Maker, Record Keeper, Learned Sage, Spirit Mixer, etc.
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 2,
        Column = 4,
        Row = 2,
		TraitName = "ReversedExtraPurchaseMetaUpgrade",
		Type = "Soul",
		Cost = 5,
		Image = "FlippedCardArt_Shades",
		ResourceCost = 
		{
			MetaCardPointsCommon = 50,
			Mixer6Common = 3,
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 5, Mixer6Common = 5 },
			{ CardUpgradePoints = 10, ModsNikkelMHadesBiomes_BossResourceTartarus = 5, MixerIBoss = 2, },
		},

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedExtraPurchase_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedPomBiomeStart = -- The Heir, Telemachus
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 2,
        Column = 5,
        Row = 2,

		TraitName = "ReversedPomBiomeStartMetaUpgrade",
		Cost = 2,
		

		Image = "FlippedCardArt_Heir",
		ResourceCost = 
		{
			MetaCardPointsCommon = 35,
			OreOIron = 4
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3,OreOIron = 6 },
			{ CardUpgradePoints = 6, OreOIron = 6, MixerOBoss = 2 },
		},

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedPomBiomeStart_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	------------ ROW 3 ----------------
	ReversedStrongRush = -- Betrayal, Arke
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 2,
        Column = 1,
        Row = 3,

		Cost = 1,
		Image = "FlippedCardArt_Betrayal",
		ResourceCost = 
		{
			MetaCardPointsCommon = 20,
			OreOIron = 4
		},
		TraitName = "ReversedStrongRushMetaUpgrade",
		ActiveWhileDead = true,
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 1,OrePAdamant = 6, ModsNikkelMHadesBiomes_CropTartarus = 5},
			{ CardUpgradePoints = 3, MixerPBoss = 2, ModsNikkelMHadesBiomes_BossResourceStyx = 2 },
		},

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedStrongRush_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedRenewableDD = -- Discipline, Skelly
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 2,
        Column = 2,
        Row = 3,

		Cost = 4,
		Image = "FlippedCardArt_Discipline",
		ResourceCost = 
		{
			MetaCardPointsCommon = 40,
			MetaCurrency = 50,
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 6 , MetaCurrency = 50, ModsNikkelMHadesBiomes_PlantAsphodel = 2 },
			{ CardUpgradePoints = 12, MetaCurrency = 100, MixerQBoss = 2 },
		},
		TraitName = "ReversedRenewableDDMetaUpgrade",
		--OnGrantedFunctionName = _PLUGIN.guid..".GrantRenewableMetaUpgradeLastStands",
		--OnUpgradedFunctionName = "UpgradeMetaUpgradeLastStands",
		--need to set up like strength putting up an alert

		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedRenewableDD_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedArmorPerRoom = -- Cunning, Penelope
	{
		InheritFrom = { "BaseBonusMetaUpgrade" },
		Flipped = 2,
        Column = 3,
        Row = 3,

		Cost = 0,
		Image = "FlippedCardArt_Cunning",
		ResourceCost = 
		{
			MetaCardPointsCommon = 30,
			MixerNBoss = 1,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3, MetaFabric = 5, ModsNikkelMHadesBiomes_OreTartarus = 6},
			{ CardUpgradePoints = 6, PlantPOlive = 6, MixerNBoss = 2 },
		},

		AutoEquipRequirements = 
		{
			MetaUpgradeName = "ReversedArmorPerRoom",
			HasCostsThrough = 5
		},

		TraitName = "ReversedArmorPerRoomMetaUpgrade",

		AutoEquipText = "ReversedMaxHealthPerRoom_AutoEquip",

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedArmorPerRoom_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedStatusCrit = -- The Titaness, Rhea
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 2,
        Column = 4,
        Row = 3,

		TraitName = "ReversedStatusCritMetaUpgrade",
		Cost = 5,
		Image = "FlippedCardArt_Titaness",
		ResourceCost = 
		{
			MetaCardPointsCommon = 45,
			OreQScales = 4,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 5, OreQScales = 5, MixerIBoss = 1},
			{ CardUpgradePoints = 10, ModsNikkelMHadesBiomes_BossResourceStyx = 1, MixerQBoss = 2 },
		},

		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedStatusCrit_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},		
	},
	ReversedEncounterHeal = -- Soul, Psyche and Eros
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 2,
        Column = 5,
        Row = 3,

		CustomTextWithShrineUpgrade = 
		{
			ShrineUpgradeName = "HealingReductionShrineUpgrade",
			CardTitle = "ReversedEncounterHeal_Vow", --TODO: REMEMBER TO DO THIS!
		},

		TraitName = "ReversedEncounterHealMetaUpgrade",
		Cost = 3,
		Image = "FlippedCardArt_Soul",
		ResourceCost = 
		{
			MetaCardPointsCommon = 40,
			MemPointsCommon = 150
		},
		
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 4, GiftPoints = 6, ModsNikkelMHadesBiomes_OreTartarus = 5 },
			{ CardUpgradePoints = 6, ModsNikkelMHadesBiomes_BossResourceElysium = 1, MixerPBoss = 2 },
		},
		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedEncounterHeal_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	------------ ROW 4 ----------------
	ReversedExtraFeatures = -- Duty, Iris
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 2,
        Column = 1,
        Row = 4,

		Cost = 3,
		Image = "FlippedCardArt_Duty",

		ResourceCost = 
		{
			MetaCardPointsCommon = 40,
			PlantPIris = 5
		},
		TraitName = "ReversedExtraFeaturesMetaUpgrade",
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3 , ModsNikkelMHadesBiomes_OreStyx = 4, PlantPIris = 6},
			{ CardUpgradePoints = 6, MixerShadow = 2, MixerPBoss = 2 },
		},

		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedExtraFeatures_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedPerfectClearBoost = -- The Tides, Triton
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 2,
        Column = 2,
        Row = 4,

		Cost = 5,
		Image = "FlippedCardArt_Tides",
		ResourceCost = 
		{
			MetaCardPointsCommon = 50,
			PlantGCattail = 4,
		},
		TraitName = "ReversedPerfectClearBoostMetaUpgrade",
		CustomTrayText = "ReversedPerfectClearBoostMetaUpgrade_Tray",

		OnUpgradedFunctionName = _PLUGIN.guid..".UpgradeIncreaseAccumulatedDamageBonus",


		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 5, PlantGCattail = 6, PlantGLotus = 6 },
			{ CardUpgradePoints = 10, ModsNikkelMHadesBiomes_OreElysium = 10, MixerHBoss = 2 },
		},

		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedPerfectClearBoost_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedHeroicRarity = -- Labyrinth, Ariadne
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 2,
        Column = 3,
        Row = 4,

		TraitName = "ReversedHeroicRarityMetaUpgrade",
		Cost = 3,
		Image = "FlippedCardArt_Labyrinth",
		ResourceCost = 
		{
			MetaCardPointsCommon = 35,
			OreGLime = 4,
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3 , ModsNikkelMHadesBiomes_OreAsphodel = 3, OreGLime = 6},
			{ CardUpgradePoints = 5, MetaFabric = 8, ModsNikkelMHadesBiomes_BossResourceTartarus = 2 },
		},


		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedHeroicRarity_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedSacrificeForLevels = -- Sacrifice, Iphigenia
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 2,
        Column = 4,
        Row = 4,

		Cost = 5,
		Image = "FlippedCardArt_Sacrifice",
		ResourceCost = 
		{
			MetaCardPointsCommon = 50,
			ModsNikkelMHadesBiomes_CropTartarus = 5,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 4,ModsNikkelMHadesBiomes_PlantAsphodel = 6, Mixer5Common = 2 },
			{ CardUpgradePoints = 10, MixerShadow = 5, MixerHBoss = 2 },
		},

		TraitName = "ReversedSacrificeForLevelsMetaUpgrade",

		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedSacrificeForLevels_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedGatherRarity = -- The Earth, Gaia
	{
		InheritFrom = { "BaseBonusMetaUpgrade" },
		Flipped = 2,
        Column = 5,
        Row = 4,

		Cost = 0,
		Image = "FlippedCardArt_Earth",
		ResourceCost = 
		{
			MetaCardPointsCommon = 45,
			SeedMystery = 3,
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3, OreGLime = 6, ModsNikkelMHadesBiomes_OreAsphodel = 5 },
			{ CardUpgradePoints = 5, ModsNikkelMHadesBiomes_BossResourceAsphodel = 2, MixerOBoss = 2, },
		},
		AutoEquipRequirements = 
		{
			MetaUpgradeName = "ReversedGatherRarity",
			MaxDuplicateCount = 2,
			RequiredMetaUpgradesMin = 1,
		},
		TraitName = "ReversedGatherRarityMetaUpgrade",

		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		AutoEquipText = "BonusRarity_AutoEquip",
		FlavorTextData = 
		{
			{
				Name = "ReversedGatherRarity_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	------------ ROW 5 ----------------
	ReversedPerfectPower = -- Victory, Nike
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 2,
        Column = 1,
        Row = 5,

		Cost = 0,
		Image = "FlippedCardArt_Victory",
		ResourceCost = 
		{
			MetaCardPointsCommon = 45,
			WeaponPointsRare = 2,
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 5, ModsNikkelMHadesBiomes_PlantElysium = 5, ModsNikkelMHadesBiomes_BossResourceStyx = 1},
			{ CardUpgradePoints = 10, MixerIBoss = 2, MixerQBoss = 2 },
		},
		TraitName = "ReversedPerfectPowerMetaUpgrade",

		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		AutoEquipRequirements = 
		{
			SurroundAllEquipped = true,
			MetaUpgradeName = "ReversedPerfectPower"
		},

		AutoEquipText = "TradeOff_AutoEquip",
		FlavorTextData = 
		{
			{
				Name = "ReversedPerfectPower_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedUnFatedReward = -- The Prophet, Cassandra
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 2,
        Column = 2,
        Row = 5,

		Cost = 4,
		Image = "FlippedCardArt_Prophet",
		ResourceCost = 
		{
			MetaCardPointsCommon = 40,
			MetaFabric = 3,
		},
		TraitName = "ReversedUnFatedRewardMetaUpgrade",

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 5, ModsNikkelMHadesBiomes_PlantAsphodel = 5, WeaponPointsRare = 2},
			{ CardUpgradePoints = 10, PlantOMandrake = 7, ModsNikkelMHadesBiomes_BossResourceTartarus =2 },
		},

		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedUnFatedReward_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedFullDefiance = -- The Final Farewell, Hector, Andromache and Astyanax
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 2,
        Column = 3,
        Row = 5,

		TraitName = "ReversedFullDefianceMetaUpgrade",
		Cost = 4,
		Image = "FlippedCardArt_Farewell",
		ResourceCost = 
		{
			MetaCardPointsCommon = 40,
			OreOIron = 4,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 6, ModsNikkelMHadesBiomes_CropAsphodel = 6, OreFSilver = 6},
			{ CardUpgradePoints = 12,MixerNBoss = 2, ModsNikkelMHadesBiomes_BossResourceAsphodel = 2 },
		},

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedFullDefiance_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedRandomBonusLevels = -- Temptation, Ganymede
	{
		InheritFrom = { "BaseBonusMetaUpgrade" },
		Flipped = 2,
        Column = 4,
        Row = 5,
        
        Cost = 0,
		Image = "FlippedCardArt_Temptation",
		ResourceCost = 
		{
			MetaCardPointsCommon = 45,
			PlantChaosThalamus = 6,
		},
		TraitName = "ReversedRandomBonusLevelsMetaUpgrade",
		
		AutoEquipText = "EpicRarity_AutoEquip_Alt",
		AutoEquipRequirements = 
		{
			MetaUpgradeName = "ReversedRandomBonusLevels",
			OtherRowOrColumnEquipped = true,
			CardsRequired = 5, -- used for text
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 5, SuperGiftPoints = 4, ModsNikkelMHadesBiomes_CropElysium = 7 },
			{ CardUpgradePoints = 10, ModsNikkelMHadesBiomes_BossResourceAsphodel = 2, MixerGBoss = 2},
		},

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedRandomBonusLevels_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedKeepsakeReAdd = -- Regret, Epimetheus
	{
		InheritFrom = { "BaseBonusMetaUpgrade" },
		Flipped = 2,
        Column = 5,
        Row = 5,

		Image = "FlippedCardArt_Regret",
        Cost = 0,
		ResourceCost = 
		{
			MetaCardPointsCommon = 60,
			MixerShadow = 5,
		},
		TraitName = "ReversedKeepsakeReAddMetaUpgrade",
		
		AutoEquipText = "CardDraw_AutoEquip",
		AutoEquipRequirements = 
		{
			MetaUpgradeName = "ReversedKeepsakeReAdd",
			RequiredMetaUpgradesMax = 3,
			RequiredMetaUpgradesMin = 1,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 10, MixerShadow = 5, WeaponPointsRare = 2 },
			{ CardUpgradePoints = 20, MixerQBoss = 3, WeaponPointsRare = 3 },
		},

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedKeepsakeReAdd_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedCheaperChannel = -- Seer, Tiresias
	{
		InheritFrom = { "BaseMetaUpgrade" },
        Column = 1,
        Row = 1,
		Flipped = 3,
        StartUnlocked = false,
		Cost = 1,
		Image = "FlippedCardArt_Seer",
		--StartEquipped = true,
		TraitName = "ReversedCheaperChannelMetaUpgrade", 
		Type = "Time",

		ResourceCost = 
		{
			MetaCardPointsCommon = 15,
			OreChaosProtoplasm = 3,
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 2, OreChaosProtoplasm = 4, Mixer6Common = 4},
			{ CardUpgradePoints = 5, MixerShadow = 6, ModsNikkelMHadesBiomes_BossResourceElysium = 2 },
		},

		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

				{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedCheaperChannel_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedPotentDefiance = -- Hatred, Styx
	{
		Cost = 1,
        InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 3,
        Column = 2,
        Row = 1,
		StartUnlocked = false,
		Image = "FlippedCardArt_Hatred",
		TraitName = "ReversedPotentDefianceMetaUpgrade",
		Type = "Life",

		ResourceCost = 
		{
			MetaCardPointsCommon = 20,
			MixerShadow = 1,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 2, MixerShadow = 1, ModsNikkelMHadesBiomes_PlantTartarus = 5},
			{ CardUpgradePoints = 1, MixerShadow = 2, MixerIBoss = 2, },
		},

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

				{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedPotentDefiance_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedBackstab = -- The Heroine, Atalanta
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 3,
		TraitName = "ReversedBackstabMetaUpgrade",
        Column = 3,
        Row = 1,

		Image = "FlippedCardArt_Heroine",
		Cost = 2,
		ResourceCost = 
		{
			MetaCardPointsCommon = 30,
			OreFSilver = 5,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3, OreFSilver = 6, PlantHMyrtle = 3 },
			{ CardUpgradePoints = 6, PlantHMyrtle = 10, MixerPBoss = 2 },
		},

		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedBackstab_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedBonusTalent = -- Idolation, Endymion
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 3,
		TraitName = "ReversedBonusTalentMetaUpgrade",
        Column = 4,
        Row = 1,
		Cost = 3,
		RandomDrawChance = 0.1,
		Image = "FlippedCardArt_Idolation",
		ResourceCost = 
		{
			MetaCardPointsCommon = 30,
			OreFSilver = 6
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 4, OreFSilver = 8 , Mixer6Common = 1},
			{ CardUpgradePoints = 6, OreFSilver = 9, MixerGBoss = 2 },
		},

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedBonusTalent_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedSpellDamage = -- Dawn, Eos
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 3,
		TraitName = "ReversedSpellDamageMetaUpgrade",
        Column = 5,
        Row = 1,
		Cost = 0,
		Image = "FlippedCardArt_Dawn",
		ResourceCost = 
		{
			MetaCardPointsCommon = 35,
			MixerFBoss = 1,
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3, ModsNikkelMHadesBiomes_PlantStyx = 5, MixerFBoss = 2 },
			{ CardUpgradePoints = 6, Mixer5Common = 4, MixerFBoss = 2, },
		},

		--[[CustomTextWithShrineUpgrade = 
		{
			ShrineUpgradeName = "HealingReductionShrineUpgrade",
			CardTitle = "ReversedSorceryRegenUpgrade_Vow",
		},]]

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		AutoEquipRequirements = 
		{
			SurroundEquipped = true,
			MetaUpgradeName = "ReversedSpellDamage"
		},
		AutoEquipText = "SorceryRegenUpgrade_AutoEquip",

		FlavorTextData = 
		{
			{
				Name = "ReversedSpellDamage_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	------------ ROW 2 ----------------
	ReversedFirstHitTransform = -- Metamorphosis, Io
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 3,
        Column = 1,
        Row = 2,
		Cost = 2,
		Image = "FlippedCardArt_Metamorphosis",
		StartUnlocked = false,
		TraitName = "ReversedFirstHitTransformMetaUpgrade",
		Type = "Death",

		ResourceCost = 
		{
			MetaCardPointsCommon = 35,
			PlantFMoly = 3,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3, PlantFMoly = 4, GiftPointsRare = 3 },
			{ CardUpgradePoints = 5, PlantFMoly = 6, MixerNBoss = 2, },
		},

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedFirstHitTransform_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedHealthWithBoons = -- Youth, Hebe
	{
		InheritFrom = { "BaseBonusMetaUpgrade" },
		Flipped = 3,
		Cost = 2,
        Column = 2,
        Row = 2,
		Image = "FlippedCardArt_Youth",
		ResourceCost = 
		{
			MetaCardPointsCommon = 35,
			GiftPoints = 5
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3, GiftPoints = 7, SuperGiftPoints = 3 },
			{ CardUpgradePoints = 6, SuperGiftPoints = 3, MixerOBoss = 2 },
		},
		TraitName = "ReversedHealthWithBoonsMetaUpgrade",

		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedHealthWithBoons_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedProjectileSlow = -- The Winds, Aeolus + the Anemoi
	{
		InheritFrom = { "BaseBonusMetaUpgrade" },
		Flipped = 3,
        Column = 3,
        Row = 2,
		Cost = 1,
		Image = "FlippedCardArt_Winds",
		ResourceCost = 
		{
			MetaCardPointsCommon = 20,
			ModsNikkelMHadesBiomes_PlantAsphodel = 3,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3, ModsNikkelMHadesBiomes_PlantAsphodel = 3, PlantGCattail = 3},
			{ CardUpgradePoints = 6, ModsNikkelMHadesBiomes_PlantAsphodel= 5, MixerPBoss= 2, },
		},
		--[[
		AutoEquipRequirements = 
		{
			MinDuplicateCount = 3,
		},
		]]
		TraitName = "ReversedProjectileSlowMetaUpgrade",

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },

		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		--AutoEquipText = "BonusDodge_AutoEquip",
		FlavorTextData = 
		{
			{
				Name = "ReversedProjectileSlow_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedCursedLegendaryBoost = -- The Sun, Helios 
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 3,
        Column = 4,
        Row = 2,
		TraitName = "ReversedCursedLegendaryBoostMetaUpgrade",
		Type = "Soul",
		Cost = 5,
		Image = "FlippedCardArt_Sun",
		ResourceCost = 
		{
			MetaCardPointsCommon = 50,
			ModsNikkelMHadesBiomes_CropAsphodel = 5,
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 5, ModsNikkelMHadesBiomes_CropAsphodel = 8, ModsNikkelMHadesBiomes_PlantAsphodel = 6 },
			{ CardUpgradePoints = 10, MixerQBoss = 2, MixerFBoss = 2, },
		},

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedCursedLegendaryBoost_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedFreeOmega = -- Elegance, Helen
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 3,
        Column = 5,
        Row = 2,

		TraitName = "ReversedFreeOmegaMetaUpgrade",
		Cost = 2,
		

		Image = "FlippedCardArt_Elegance",
		ResourceCost = 
		{
			MetaCardPointsCommon = 35,
			OreChaosProtoplasm = 5
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3,PlantGLotus = 4, PlantHMyrtle = 6 },
			{ CardUpgradePoints = 6, ModsNikkelMHadesBiomes_CropElysium = 6, MixerOBoss = 2 },
		},

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedFreeOmega_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	------------ ROW 3 ----------------
	ReversedDashRecovery = -- Flight, Bellerophon and Pegasus
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 3,
        Column = 1,
        Row = 3,

		Cost = 1,
		Image = "FlippedCardArt_Flight",
		ResourceCost = 
		{
			MetaCardPointsCommon = 20,
			MixerPBoss = 1
		},
		TraitName = "ReversedDashRecoveryMetaUpgrade",
		ActiveWhileDead = true,
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 1,PlantPIris = 3, MixerPBoss = 1},
			{ CardUpgradePoints = 3, PlantPIris = 6, MixerPBoss = 2 },
		},

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedDashRecovery_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedProtectionCooldown = -- Burden, Atlas
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 3,
        Column = 2,
        Row = 3,

		Cost = 4,
		Image = "FlippedCardArt_Burden",
		ResourceCost = 
		{
			MetaCardPointsCommon = 40,
			OreOIron = 5,
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 6 , OreOIron = 9, Mixer5Common = 3 },
			{ CardUpgradePoints = 12, ModsNikkelMHadesBiomes_BossResourceStyx = 2, MixerQBoss = 2 },
		},
		TraitName = "ReversedProtectionCooldownMetaUpgrade",
		--OnGrantedFunctionName = _PLUGIN.guid..".GrantRenewableMetaUpgradeLastStands",
		--OnUpgradedFunctionName = "UpgradeMetaUpgradeLastStands",
		--need to set up like strength putting up an alert

		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedProtectionCooldown_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedElementRoom = -- Solitude, Calypso
	{
		InheritFrom = { "BaseBonusMetaUpgrade" },
		Flipped = 3,
        Column = 3,
        Row = 3,

		Cost = 0,
		Image = "FlippedCardArt_Isolation",
		ResourceCost = 
		{
			MetaCardPointsCommon = 30,
			GiftPoints = 2,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3, ModsNikkelMHadesBiomes_CropStyx = 5, SuperGiftPoints = 2},
			{ CardUpgradePoints = 6, PlantOMandrake = 6, MixerNBoss = 2 },
		},

		AutoEquipRequirements = 
		{
			MetaUpgradeName = "ReversedElementRoom",
			HasCostsThrough = 5
		},

		TraitName = "ReversedElementRoomMetaUpgrade",

		AutoEquipText = "ReversedMaxHealthPerRoom_AutoEquip",

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedElementRoom_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedUniqueGod = -- The Muses, Muses (I can't be bothered to list them)
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 3,
        Column = 4,
        Row = 3,

		TraitName = "ReversedUniqueGodMetaUpgrade",
		Cost = 5,
		Image = "FlippedCardArt_Muses",
		ResourceCost = 
		{
			MetaCardPointsCommon = 45,
			ModsNikkelMHadesBiomes_OreElysium = 3,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 5, PlantNGarlic = 5, MixerNBoss = 2},
			{ CardUpgradePoints = 10, PlantChaosThalamus = 7, MixerGBoss = 2 },
		},
		CustomTrayText = "ReversedUniqueGodMetaUpgrade_Tray",
		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedUniqueGod_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},		
	},
	ReversedManaShield = -- The Sculptor, Pygmalion and Galatea 
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 3,
        Column = 5,
        Row = 3,

		TraitName = "ReversedManaShieldMetaUpgrade",
		Cost = 3,
		Image = "FlippedCardArt_Sculptor",
		ResourceCost = 
		{
			MetaCardPointsCommon = 40,
			OreIMarble = 3
		},
		
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 4, ModsNikkelMHadesBiomes_OreAsphodel = 4, OreGLime = 6 },
			{ CardUpgradePoints = 6, OreIMarble = 8, MixerGBoss = 2 },
		},
		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedManaShield_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	------------ ROW 4 ----------------
	ReversedRandomSacrifice = -- The Coven, Graeae
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 3,
        Column = 1,
        Row = 4,

		Cost = 3,
		Image = "FlippedCardArt_Coven",

		ResourceCost = 
		{
			MetaCardPointsCommon = 40,
			PlantOMandrake = 4
		},
		TraitName = "ReversedRandomSacrificeMetaUpgrade",
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3 , ModsNikkelMHadesBiomes_PlantStyx = 5, PlantOMandrake = 5},
			{ CardUpgradePoints = 6, MixerShadow = 3, MixerFBoss = 2 },
		},

		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedRandomSacrifice_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedAdditionalOmegaChance = -- Mockery, Momus
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 3,
        Column = 2,
        Row = 4,

		Cost = 5,
		Image = "FlippedCardArt_Mockery",
		ResourceCost = 
		{
			MetaCardPointsCommon = 50,
			OreGLime = 4,
		},
		TraitName = "ReversedAdditionalOmegaChanceMetaUpgrade",


		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 5, OreGLime = 6, PlantNGarlic = 5 },
			{ CardUpgradePoints = 10, ModsNikkelMHadesBiomes_PlantStyx = 6, MixerGBoss = 2 },
		},

		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedAdditionalOmegaChance_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedRiposteKill = -- The Warrioresses, The Amazons
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 3,
        Column = 3,
        Row = 4,

		TraitName = "ReversedRiposteKillMetaUpgrade",
		Cost = 3,
		Image = "FlippedCardArt_Warrioresses",
		ResourceCost = 
		{
			MetaCardPointsCommon = 35,
			PlantQFang = 3,
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3 , PlantQFang = 3, OreOIron = 6},
			{ CardUpgradePoints = 5, MixerShadow = 6, ModsNikkelMHadesBiomes_BossResourceTartarus = 3 },
		},


		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedRiposteKill_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedRandomCards = -- The Wild, Pan
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 3,
        Column = 4,
        Row = 4,

		Cost = 5,
		Image = "FlippedCardArt_Wild",
		ResourceCost = 
		{
			MetaCardPointsCommon = 50,
			PlantNMoss = 5,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 4,PlantNMoss = 8, PlantQFang = 5 },
			{ CardUpgradePoints = 10, Mixer5Common = 4, MixerOBoss = 2 },
		},

		TraitName = "ReversedRandomCardsMetaUpgrade",

		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedRandomCards_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedBossResistance = -- The Ruse, Trojan Horse
	{
		InheritFrom = { "BaseBonusMetaUpgrade" },
		Flipped = 3,
        Column = 5,
        Row = 4,

		Cost = 0,
		Image = "FlippedCardArt_Ruse",
		ResourceCost = 
		{
			MetaCardPointsCommon = 45,
			PlantODriftwood = 5,
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3, PlantODriftwood = 6, PlantHWheat = 5 },
			{ CardUpgradePoints = 5, PlantPOliveSeed = 3, MixerHBoss = 2, },
		},
		AutoEquipRequirements = 
		{
			MetaUpgradeName = "ReversedBossResistance",
			MaxDuplicateCount = 2,
			RequiredMetaUpgradesMin = 1,
		},
		TraitName = "ReversedBossResistanceMetaUpgrade",

		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		AutoEquipText = "BonusRarity_AutoEquip",
		FlavorTextData = 
		{
			{
				Name = "ReversedBossResistance_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	------------ ROW 5 ----------------
	ReversedArtemisKeepsake = -- Beasts, Monsters
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 3,
        Column = 1,
        Row = 5,

		Cost = 0,
		Image = "FlippedCardArt_Beasts",
		ResourceCost = 
		{
			MetaCardPointsCommon = 45,
			MixerQBoss = 1,
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 5, PlantQFang = 6, MixerQBoss = 1},
			{ CardUpgradePoints = 10, ModsNikkelMHadesBiomes_BossResourceStyx = 2, MixerQBoss = 2 },
		},
		TraitName = "ReversedArtemisKeepsakeMetaUpgrade",

		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		AutoEquipRequirements = 
		{
			SurroundAllEquipped = true,
			MetaUpgradeName = "ReversedArtemisKeepsake"
		},

		AutoEquipText = "TradeOff_AutoEquip",
		FlavorTextData = 
		{
			{
				Name = "ReversedArtemisKeepsake_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedFountainGold = -- The King, Agamemnon
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 3,
        Column = 2,
        Row = 5,

		Cost = 4,
		Image = "FlippedCardArt_King",
		ResourceCost = 
		{
			MetaCardPointsCommon = 40,
			ModsNikkelMHadesBiomes_BossResourceAsphodel = 1,
		},
		TraitName = "ReversedFountainGoldMetaUpgrade",

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 5, SuperGiftPoints = 3, ModsNikkelMHadesBiomes_BossResourceAsphodel = 1},
			{ CardUpgradePoints = 10, MixerGBoss = 2, ModsNikkelMHadesBiomes_BossResourceAsphodel =2 },
		},

		UnlockedCardVoiceLines =
		{
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedFountainGold_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedDDRefillBiomeStart = -- The Physician, Asclepius
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = 3,
        Column = 3,
        Row = 5,

		TraitName = "ReversedDDRefillBiomeStartMetaUpgrade",
		Cost = 4,
		Image = "FlippedCardArt_Physician",
		ResourceCost = 
		{
			MetaCardPointsCommon = 40,
			MixerHBoss = 1,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 6, PlantIPoppySeed = 5, PlantNMoss = 2},
			{ CardUpgradePoints = 12,ModsNikkelMHadesBiomes_BossResourceElysium = 2, MixerNBoss = 2 },
		},

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedDDRefillBiomeStart_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedMoreSacrifices = -- The Garden, Lovers transformed into Plants
	{
		InheritFrom = { "BaseBonusMetaUpgrade" },
		Flipped = 3,
        Column = 4,
        Row = 5,
        
        Cost = 0,
		Image = "FlippedCardArt_Garden",
		ResourceCost = 
		{
			MetaCardPointsCommon = 45,
			GiftPoints = 8,
		},
		TraitName = "ReversedMoreSacrificesMetaUpgrade",
		
		AutoEquipText = "EpicRarity_AutoEquip_Alt",
		AutoEquipRequirements = 
		{
			MetaUpgradeName = "ReversedMoreSacrifices",
			OtherRowOrColumnEquipped = true,
			CardsRequired = 5, -- used for text
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 5, SuperGiftPoints = 4, PlantGCattail = 7 },
			{ CardUpgradePoints = 10, ModsNikkelMHadesBiomes_CropElysium = 7, MixerHBoss = 2},
		},

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedMoreSacrifices_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
	ReversedRandomBuild = -- Good Fortune, Tyche
	{
		InheritFrom = { "BaseBonusMetaUpgrade" },
		Flipped = 3,
        Column = 5,
        Row = 5,

		Image = "FlippedCardArt_Fortune",
        Cost = 0,
		ResourceCost = 
		{
			MetaCardPointsCommon = 60,
			MixerOBoss = 1,
		},
		TraitName = "ReversedRandomBuildMetaUpgrade",
		
		AutoEquipText = "CardDraw_AutoEquip",
		AutoEquipRequirements = 
		{
			MetaUpgradeName = "ReversedRandomBuild",
			RequiredMetaUpgradesMax = 3,
			RequiredMetaUpgradesMin = 1,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 10, MixerOBoss = 2, WeaponPointsRare = 1 },
			{ CardUpgradePoints = 20, MixerIBoss = 3, ModsNikkelMHadesBiomes_BossResourceAsphodel = 2 },
		},

		UnlockedCardVoiceLines =
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,

	{ Cue = "/VO/Melinoe_0545", Text = "Another Card..." },
		},
		EquipVoiceLines =
		{
			{ GlobalVoiceLines = "CardInspectVoiceLines" },
		},

		FlavorTextData = 
		{
			{
				Name = "ReversedRandomBuild_FlavorText01",
				GameStateRequirements =
				{
					{
						--
					}
				},
			}
		},
	},
}


for newMetaUpgradeCardName, newMetaUpgradeCardData in pairs(mod.NewMetaUpgradeCardData) do
    game.ProcessDataInheritance(newMetaUpgradeCardData, game.MetaUpgradeCardData)
    game.MetaUpgradeCardData[newMetaUpgradeCardName]=newMetaUpgradeCardData
	game.MetaUpgradeCardData[newMetaUpgradeCardName].Name = newMetaUpgradeCardName
	if newMetaUpgradeCardData.UpgradeResourceCost then
		for i, upgradeCost in pairs( newMetaUpgradeCardData.UpgradeResourceCost ) do
				local upgradeName = newMetaUpgradeCardName..i
				game.MetaUpgradeCardUpgradeData[upgradeName] =
				{
					Name = upgradeName,
					DisplayName = newMetaUpgradeCardName,
					Cost = upgradeCost,
					Image = newMetaUpgradeCardData.Image,
					IconScale = MetaUpgradeCardData.ChanneledCast.IconScale
				}
			end
	end
end

local oldMetaUpgradeDefaultCardLayout = 
{
	{ "ChanneledCast",			"HealthRegen",			"LowManaDamageBonus",	"CastCount",			"SorceryRegenUpgrade", 	},
	{ "CastBuff",				"BonusHealth",			"BonusDodge",			"ManaOverTime",			"MagicCrit" 			},
	{ "SprintShield",			"LastStand",			"MaxHealthPerRoom",		"StatusVulnerability",	"ChanneledBlock" 		},
	{ "DoorReroll",				"StartingGold",			"MetaToRunUpgrade",		"RarityBoost", 			"BonusRarity" 			},
	{ "TradeOff",				"ScreenReroll",			"LowHealthBonus",		"EpicRarityBoost",		"CardDraw" 				},
}


for row, rowData in pairs(oldMetaUpgradeDefaultCardLayout) do
    for column, cardName in pairs(rowData) do
        game.MetaUpgradeCardData[cardName].Row = row
        game.MetaUpgradeCardData[cardName].Column = column
    end
end


--game.OverwriteTableKeys(game.MetaUpgradeCardData, NewMetaUpgradeCardData)
local autoEquipCards = {"SorceryRegenUpgrade", "MaxHealthPerRoom", "BonusRarity", "TradeOff", "EpicRarityBoost", "CardDraw"}
for i, cardName in ipairs(autoEquipCards) do
	game.MetaUpgradeCardData[cardName].AutoEquipRequirements.MetaUpgradeName = cardName
end