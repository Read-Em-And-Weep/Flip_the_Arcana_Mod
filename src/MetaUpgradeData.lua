NewMetaUpgradeCardData = 
{

	------------ ROW 1 ----------------
	ReversedChanneledCast = -- Bloodlust, Ares
	{
		InheritFrom = { "BaseMetaUpgrade" },
        Column = 1,
        Row = 1,
		Flipped = true,
        StartUnlocked = false,
		Cost = 1,
		Image = "CardArt_25",
		--StartEquipped = true,
		TraitName = "ReversedChanneledCastMetaUpgrade",
		Type = "Time",

		ResourceCost = 
		{
			MetaCardPointsCommon = 1,
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 1 },
			{ CardUpgradePoints = 3, MixerHBoss = 1 },
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
		Flipped = true,
        Column = 2,
        Row = 1,
		StartUnlocked = false,
		Image = "CardArt_25",
		TraitName = "ReversedHealthRegenMetaUpgrade",
		CustomTrayText = "DodgeBonusMetaUpgrade_Tray",
		Type = "Life",

		ResourceCost = 
		{
			MetaCardPointsCommon = 3,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 2 },
			{ CardUpgradePoints = 3, MixerFBoss = 1, },
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
		Flipped = true,
		TraitName = "ReversedLowManaDamageBonusMetaUpgrade",
        Column = 3,
        Row = 1,

		Image = "CardArt_25",
		Cost = 2,
		ResourceCost = 
		{
			MetaCardPointsCommon = 15,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 2 },
			{ CardUpgradePoints = 3, MixerNBoss = 2, },
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
		Flipped = true,
		TraitName = "ReversedCastCountMetaUpgrade",
        Column = 4,
        Row = 1,
		Cost = 3,
		RandomDrawChance = 0.1,
		Image = "CardArt_25",
		ResourceCost = 
		{
			MetaCardPointsCommon = 25,
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 2 },
			{ CardUpgradePoints = 3, MixerHBoss = 2 },
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
	ReversedSorceryRegenUpgrade = -- Harvest, Demeter
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = true,
		TraitName = "ReversedSorceryRegenMetaUpgrade",
        Column = 5,
        Row = 1,
		Cost = 0,
		Image = "CardArt_25",
		ResourceCost = 
		{
			MetaCardPointsCommon = 30,
			MixerGBoss = 1,
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3 },
			{ CardUpgradePoints = 6, MixerGBoss = 2, },
		},

		CustomTextWithShrineUpgrade = 
		{
			ShrineUpgradeName = "HealingReductionShrineUpgrade",
			CardTitle = "ReversedSorceryRegenUpgrade_Vow",
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
		Flipped = true,
        Column = 1,
        Row = 2,
		Cost = 2,
		Image = "CardArt_25",
		StartUnlocked = false,
		TraitName = "ReversedCastBuffMetaUpgrade",
		Type = "Death",

		ResourceCost = 
		{
			MetaCardPointsCommon = 3,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 2 },
			{ CardUpgradePoints = 3, MixerFBoss = 1, },
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
		Flipped = true,
		Cost = 2,
        Column = 2,
        Row = 2,
		Image = "CardArt_25",
		ResourceCost = 
		{
			MetaCardPointsCommon = 10,
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 2 },
			{ CardUpgradePoints = 4, MixerPBoss = 1 },
		},
		TraitName = "ReversedBonusHealthMetaUpgrade",
		CustomTrayText = "HealthManaBonusMetaUpgrade_Tray",

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
		Flipped = true,
        Column = 3,
        Row = 2,
		Cost = 1,
		Image = "CardArt_25",
		ResourceCost = 
		{
			MetaCardPointsCommon = 20,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 1 },
			{ CardUpgradePoints = 3, MixerPBoss = 1, },
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
	ReversedManaOverTime = -- Abundance, Poseidon
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = true,
        Column = 4,
        Row = 2,
		TraitName = "ReversedManaOverTimeMetaUpgrade",
		Type = "Soul",
		Cost = 5,
		Image = "CardArt_25",
		ResourceCost = 
		{
			MetaCardPointsCommon = 30,
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 5 },
			{ CardUpgradePoints = 10, MixerHBoss = 2, },
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
				Name = "ManaOverTime_FlavorText01",
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
		Flipped = true,
        Column = 5,
        Row = 2,

		TraitName = "ReversedMagicCritMetaUpgrade",
		Cost = 2,
		

		Image = "CardArt_25",
		ResourceCost = 
		{
			MetaCardPointsCommon = 35,
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 2, },
			{ CardUpgradePoints = 4, Mixer6Common = 1 },
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
		Flipped = true,
        Column = 1,
        Row = 3,

		Cost = 1,
		Image = "CardArt_25",
		ResourceCost = 
		{
			MetaCardPointsCommon = 15,
		},
		TraitName = "ReversedSprintShieldMetaUpgrade",
		ActiveWhileDead = true,
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 1, },
			{ CardUpgradePoints = 3, MixerFBoss = 1 },
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
		Flipped = true,
        Column = 2,
        Row = 3,

		Cost = 4,
		Image = "CardArt_25",
		ResourceCost = 
		{
			MetaCardPointsCommon = 25,
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 6 },
			{ CardUpgradePoints = 12, Mixer5Common = 1 },
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
		Flipped = true,
        Column = 3,
        Row = 3,

		Cost = 0,
		Image = "CardArt_25",
		ResourceCost = 
		{
			MetaCardPointsCommon = 30,
			MixerFBoss = 1,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3, },
			{ CardUpgradePoints = 6, MixerOBoss = 1 },
		},

		AutoEquipRequirements = 
		{
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
		Flipped = true,
        Column = 4,
        Row = 3,

		TraitName = "ReversedStatusVulnerabilityMetaUpgrade",
		Cost = 5,
		Image = "CardArt_25",
		ResourceCost = 
		{
			MetaCardPointsCommon = 35,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 5 },
			{ CardUpgradePoints = 10, MixerShadow = 1, },
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
		Flipped = true,
        Column = 5,
        Row = 3,

		TraitName = "ReversedChanneledBlockMetaUpgrade",
		Cost = 3,
		Image = "CardArt_25",
		ResourceCost = 
		{
			MetaCardPointsCommon = 40,
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3 },
			{ CardUpgradePoints = 5, MixerHBoss = 2 },
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
		Flipped = true,
        Column = 1,
        Row = 4,

		Cost = 3,
		Image = "CardArt_25",

		ResourceCost = 
		{
			MetaCardPointsCommon = 25,
		},
		TraitName = "ReversedDoorRerollMetaUpgrade",
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3 },
			{ CardUpgradePoints = 5, MixerGBoss = 2 },
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
		Flipped = true,
        Column = 2,
        Row = 4,

		Cost = 5,
		Image = "CardArt_25",
		ResourceCost = 
		{
			MetaCardPointsCommon = 30,
		},
		TraitName = "ReversedStartingGoldMetaUpgrade",
		OnGrantedFunctionName = "GrantMetaUpgradeCurrency",
		OnUpgradedFunctionName = "UpgradeMetaUpgradeCurrency",

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 5 },
			{ CardUpgradePoints = 10, CharonPoints = 1 },
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
		Flipped = true,
        Column = 3,
        Row = 4,

		TraitName = "ReversedMetaToRunUpgradeMetaUpgrade",
		Cost = 3,
		Image = "CardArt_25",
		ResourceCost = 
		{
			MetaCardPointsCommon = 35,
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3 },
			{ CardUpgradePoints = 5, MixerNBoss = 2 },
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
	ReversedRarityBoost = -- The Loyal Protector, Cerberus
	{
		InheritFrom = { "BaseMetaUpgrade" },
		Flipped = true,
        Column = 4,
        Row = 4,

		Cost = 5,
		Image = "CardArt_25",
		ResourceCost = 
		{
			MetaCardPointsCommon = 40,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 4 },
			{ CardUpgradePoints = 6, MixerNBoss = 2 },
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
		Flipped = true,
        Column = 5,
        Row = 4,

		Cost = 0,
		Image = "CardArt_25",
		ResourceCost = 
		{
			MetaCardPointsCommon = 45,
			MixerHBoss = 1,
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 2 },
			{ CardUpgradePoints = 4, MixerGBoss = 2, },
		},
		AutoEquipRequirements = 
		{
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
		Flipped = true,
        Column = 1,
        Row = 5,

		Cost = 0,
		Image = "CardArt_25",
		ResourceCost = 
		{
			MetaCardPointsCommon = 30,
			MixerNBoss = 1,
		},
		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 3 },
			{ CardUpgradePoints = 6, MixerNBoss = 2, },
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
		Flipped = true,
        Column = 2,
        Row = 5,

		Cost = 4,
		Image = "CardArt_25",
		ResourceCost = 
		{
			MetaCardPointsCommon = 35,
		},
		TraitName = "ReversedScreenRerollMetaUpgrade",

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 5 },
			{ CardUpgradePoints = 10, MixerOBoss = 2, },
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
		Flipped = true,
        Column = 3,
        Row = 5,

		TraitName = "ReversedLowHealthBonusMetaUpgrade",
		Cost = 4,
		Image = "CardArt_25",
		ResourceCost = 
		{
			MetaCardPointsCommon = 40,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 6 },
			{ CardUpgradePoints = 12, MixerPBoss = 2 },
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
		Flipped = true,
        Column = 4,
        Row = 5,
        
        Cost = 0,
		Image = "CardArt_25",
		ResourceCost = 
		{
			MetaCardPointsCommon = 45,
			MixerOBoss = 1,
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
			{ CardUpgradePoints = 5 },
			{ CardUpgradePoints = 10, MixerPBoss = 2, },
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
		Flipped = true,
        Column = 5,
        Row = 5,

		Image = "CardArt_25",
        Cost = 0,
		ResourceCost = 
		{
			MetaCardPointsCommon = 50,
			MixerPBoss = 1,
		},
		TraitName = "ReversedCardDrawMetaUpgrade",
		
		AutoEquipText = "CardDraw_AutoEquip",
		AutoEquipRequirements = 
		{
			RequiredMetaUpgradesMax = 3,
			RequiredMetaUpgradesMin = 1,
		},

		UpgradeResourceCost = 
		{
			{ CardUpgradePoints = 10, },
			{ CardUpgradePoints = 20, MetaFabric = 20 },
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
}


for newMetaUpgradeCardName, newMetaUpgradeCardData in pairs(NewMetaUpgradeCardData) do
    game.ProcessDataInheritance(newMetaUpgradeCardData, game.MetaUpgradeCardData)
    game.MetaUpgradeCardData[newMetaUpgradeCardName]=newMetaUpgradeCardData
end

OldMetaUpgradeDefaultCardLayout = 
{
	{ "ChanneledCast",			"HealthRegen",			"LowManaDamageBonus",	"CastCount",			"SorceryRegenUpgrade", 	},
	{ "CastBuff",				"BonusHealth",			"BonusDodge",			"ManaOverTime",			"MagicCrit" 			},
	{ "SprintShield",			"LastStand",			"MaxHealthPerRoom",		"StatusVulnerability",	"ChanneledBlock" 		},
	{ "DoorReroll",				"StartingGold",			"MetaToRunUpgrade",		"RarityBoost", 			"BonusRarity" 			},
	{ "TradeOff",				"ScreenReroll",			"LowHealthBonus",		"EpicRarityBoost",		"CardDraw" 				},
}


for row, rowData in pairs(OldMetaUpgradeDefaultCardLayout) do
    for column, cardName in pairs(rowData) do
        game.MetaUpgradeCardData[cardName].Row = row
        game.MetaUpgradeCardData[cardName].Column = column
    end
end


--game.OverwriteTableKeys(game.MetaUpgradeCardData, NewMetaUpgradeCardData)

