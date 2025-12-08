NewMetaUpgradeTraitData = {
    ReversedChanneledCastMetaUpgrade =
	{
		Name = "ReversedChanneledCastMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
		RarityLevels =
		{

			Common =
			{
				Multiplier = 1.5,
			},
			Rare =
			{
				Multiplier = 2.0,
			},
			Epic =
			{
				Multiplier = 2.5,
			},
			Heroic =
			{
				Multiplier = 3.0,
			},
		},
		PropertyChanges = 
		{
			{
				WeaponNames = WeaponSets.HeroNonExWeapons,
				WeaponProperty = "FireFx2",
				ChangeValue = "HermesSwipeLineC_Sword3",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = WeaponSets.HeroNonExWeapons,
				BaseValue = 0.9,
				SourceIsMultiplier = true,
				SpeedPropertyChanges = true,
				ExcludeLinked = true,
				ReportValues = { ReportedWeaponMultiplier = "ChangeValue" }
			},
		},
		ExtractValues =
		{
			{
				Key = "ReportedWeaponMultiplier",
				ExtractAs = "TooltipDamageBonus",
				Format = "PercentDelta",
				HideSigns = true,
			},
		}
	},
    ReversedHealthRegenMetaUpgrade =
    {
        Name = "ReversedHealthRegenMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
        {

            Common =
            {
                Multiplier = 1.0,
            },
            Rare =
            {
                Multiplier = 2,
            },
            Epic =
            {
                Multiplier = 3,
            },
            Heroic =
            {
                Multiplier = 4,
            },
        },
        RoomsPerUpgrade = {
			Amount = 1,
			EmptyMaxHealth = {BaseValue = 1},
			ReportValues = {
				GivenEmptyMaxHealth = "EmptyMaxHealth",
			},
		},
		CurrentRoom = 0,
		ExtractValues = { 
            {
                Key = "GivenEmptyMaxHealth",
			    ExtractAs = "TooltipMaxHealth",
				Format = "MaxHealth"
            } 
        },
    },
	ReversedLowManaDamageBonusMetaUpgrade =
    {
        Name = "ReversedLowManaDamageBonusMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
        {

            Common =
            {
                Multiplier = 1.5,
            },
            Rare =
            {
                Multiplier = 2,
            },
            Epic =
            {
                Multiplier = 2.5,
            },
            Heroic =
            {
                Multiplier = 3,
            },
        },
        PriorityDisplay = true,
		ShowHighHealthIndicator = true,
		HighHealthThresholdText =
		{
			-- Display variable only, to change the data value change the value below under "HighHealthSourceMultiplierData"
			PercentThreshold = 0.90,
			--Text = "Hint_HighHealthDamageTraitDeactivated",
		},
		HighHealthDamageBonus = {
			Multiplier = {BaseValue = 1.10, SourceIsMultiplier = true},
			ReportValues = {ReportedMultiplier = "Multiplier"}
			--display variable only, change to match below
		},
		AddOutgoingDamageModifiers =
		{
			HighHealthSourceMultiplierData = 
			{ 
				Threshold = 0.90,
				ThresholdMultiplier = 10, --to double bonus when above threshold
				Multiplier = 
				{ 
					BaseValue = 1.01, 
					SourceIsMultiplier = true,
				},
				ReportValues = 
				{ 
					ReportedThreshold = "Threshold",
				}
			},
		},
		ExtractValues =
		{
			{
				Key = "ReportedMultiplier",
				ExtractAs = "Multiplier",
				Format = "PercentDelta",
			},
		}
    },
    ReversedCastCountMetaUpgrade =
    {
        Name = "ReversedCastCountMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
        {

            Common =
            {
                Multiplier = 7,
            },
            Rare =
            {
                Multiplier = 10,
            },
            Epic =
            {
                Multiplier = 13,
            },
            Heroic =
            {
                Multiplier = 16,
            },
        },
        EncounterPreDamage =
		{
			PreDamage = { BaseValue = 0.01 },
			EnemyType = "Boss",
            Text = "PreDamageHit_MetaUpgrade",
			DamageSourceName = "ReversedCastCountMetaUpgrade",
			Delay = 2.0,
			ReportValues = { ReportedDamage = "PreDamage" }
		},
        Uses = 10,
		ExtractValues = { 
            {
                Key = "ReportedDamage",
			    ExtractAs = "Damage",
				Format = "FlatPercent"
            } 
        },
    },
    ReversedSorceryRegenMetaUpgrade = {
        Name = "ReversedSorceryRegenMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{
			Common =
			{
				Multiplier = 6,
			},
			Rare =
			{
				Multiplier = 8,
			},
			Epic =
			{
				Multiplier = 10,
			},
			Heroic =
			{
				Multiplier = 12,
			},
		},
        HealAmount = {
            Amount = {BaseValue = .01},
            ReportValues = { ReportedHeal = "Amount"}
        },
		CustomStatLinesWithShrineUpgrade = 
		{
			ShrineUpgradeName = "HealingReductionShrineUpgrade",
			StatLines = 
			{
				"HealingReductionNotice",
			},
		},
        ExtractValues = 
		{
			{
				Key = "ReportedHeal",
				ExtractAs = "TooltipHeal",
				Format = "PercentHeal",

			},
        }
    },
	ReversedCastBuffMetaUpgrade = {
        Name = "ReversedCastBuffMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{

			Common =
			{
				Multiplier = 60, --40
			},
			Rare =
			{
				Multiplier = 55, --45
			},
			Epic =
			{
				Multiplier = 50, --50
			},
			Heroic =
			{
				Multiplier = 45, --55
			},
		},
        LessDamageDealt = {BaseValue = 0.01},
        ExtractValues = 
		{
			{
				Key = "LessDamageDealt",
				ExtractAs = "OutgoingDamage",
				Format = "PercentDelta"

			},
        }
    },
    ReversedBonusHealthMetaUpgrade = {
        Name = "ReversedBonusHealthMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{

			Common =
			{
				Multiplier = 2.0,
			},
			Rare =
			{
				Multiplier = 2.5,
			},
			Epic =
			{
				Multiplier = 3.0,
			},
			Heroic =
			{
				Multiplier = 3.5,
			},
		},
        MaxHealthMultiplier = { BaseValue = 1.10, SourceIsMultiplier = true}, 
		MaxManaMultiplier = { BaseValue = 1.10, SourceIsMultiplier = true}, 
		
		ExtractValues =
		{
			{
				Key = "MaxHealthMultiplier",
				ExtractAs = "HealthBonus",
				Format = "PercentDelta",
			},
		}
    },
    ReversedBonusDodgeMetaUpgrade = {
        Name = "ReversedBonusDodgeMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{

			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 2.0,
			},
			Epic =
			{
				Multiplier = 3.0,
			},
			Heroic =
			{
				Multiplier = 4.0,
			},
		},
        ActivatedDamageReductionThreshold = 20,
		ActivatedDamageReduction = 
		{ 
			BaseValue = 1, 
			AsInt = true,
			MinValue = -1,
			MinMultiplier = -2,
			IdenticalMultiplier =
			{
				Value = -1,
			},
		},
		ReportedValue = {BaseValue = 1},
		ExtractValues =
		{
			{
				Key = "ReportedValue",
				ExtractAs = "Damage",
				Negative = true,
			},
		}
    },    
    ReversedManaOverTimeMetaUpgrade = {
        Name = "ReversedManaOverTimeMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{

			Common =
			{
				Multiplier = 3.0,
			},
			Rare =
			{
				Multiplier = 5.0,
			},
			Epic =
			{
				Multiplier = 7.0,
			},
			Heroic =
			{
				Multiplier = 9.0,
			},
		},
        RarityUpgradeData = 
		{
			RequireNotExcludeFromLastRunBoon = true,
			MultiUse = true,
			Uses = { BaseValue = 1 },
			MaxRarity = 3,
			ReportValues = 
			{ 
				ReportedUpgrades = "Uses",
			},
		},
		ExtractValues = 
		{
			{
				Key = "ReportedUpgrades",
				ExtractAs = "Uses",
			},
		},
    },
    ReversedMagicCritMetaUpgrade = {
        Name = "ReversedMagicCritMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{

			Common =
			{
				Multiplier = 0.5,
			},
			Rare =
			{
				Multiplier = 1.0,
			},
			Epic =
			{
				Multiplier = 1.5,
			},
			Heroic =
			{
				Multiplier = 1.0,
			},
		},
		FearMultipliedMultiplier =
			{
				BaseValue = 100,
				SourceIsMultiplier = true,
				DecimalPlaces = 4,
			},
		DisplayValue = {BaseValue = 0.01, DecimalPlaces = 3,},
        AddIncomingDamageModifiers = 
		{
            HealthOnly = true,
			ValidWeaponMultiplier = 1.20,
            --does not update automatically in the traittext, make sure it matches
			ReportValues = { DamageTakenMultiplier = "ValidWeaponMultiplier"},
		},
		ExtractValues =
		{
			{
				Key = "DisplayValue",
				ExtractAs = "Chance",
				Format = "Percent",
				DecimalPlaces = 4,
			},
            {
				Key = "DamageTakenMultiplier",
				ExtractAs = "IncomingDamage",
				Format = "PercentDelta"
			},
		}
    },
	ReversedSprintShieldMetaUpgrade = {
		Name = "ReversedSprintShieldMetaUpgrade",
		InheritFrom = { "MetaUpgradeTrait" },
		RarityLevels =
		{

			Common =
			{
				Multiplier = 1
			},
			Rare =
			{
				Multiplier = 1.5
			},
			Epic =
			{
				Multiplier = 2
			},
			Heroic =
			{
				Multiplier = 2.5
			},
		},
		FirstHitMultiplier = {
			BaseValue = .25,
		},
		ExtractValues = {
			{
				Key = "FirstHitMultiplier",
				ExtractAs = "OutgoingDamage",
				Format = "Percent",
				IncludeSigns = true
			},
		}
    },
	ReversedLastStandMetaUpgrade = {
		Name = "ReversedLastStandMetaUpgrade",
		InheritFrom = { "MetaUpgradeTrait" },
		RarityLevels =
		{

			Common =
			{
				Multiplier = 1.8,
			},
			Rare =
			{
				Multiplier = 1.4,
			},
			Epic =
			{
				Multiplier = 1.0,
			},
			Heroic =
			{
				Multiplier = 0.6,
			},
		},
		ModdedSetupFunction =
		{
			Name = "SetUpNoLastStandRegeneration",
			Args =
			{
				Amount = 1,
				Interval = { BaseValue = 1},
				ReportValues = { ReportedInterval = "Interval" }
			},
			RunOnce = true,
		},
		ExtractValues =
		{
			{
				Key = "ReportedInterval",
				ExtractAs = "Interval",
				DecimalPlaces = 2,

			},
		}
    },
    ReversedMaxHealthPerRoomMetaUpgrade = {
        Name = "ReversedMaxHealthPerRoomMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{

			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 6/7,
			},
			Epic =
			{
				Multiplier = 5/7,
			},
			Heroic =
			{
				Multiplier = 4/7,
			},
		},
        RoomsPerUpgrade = {
			Amount = {
				BaseValue = 7,
			},
			TraitStacks = 1,
			ReportValues = {
				ReportedRoomsPerTraitStacks = "Amount",
			},
		},
		CurrentRoom = 0,
		ExtractValues = { 
            {
                Key = "ReportedRoomsPerTraitStacks",
			    ExtractAs = "TooltipRoomInterval",
            } 
        },
    },
	ReversedStatusVulnerabilityMetaUpgrade = {
        Name = "ReversedStatusVulnerabilityMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{
			Common =
			{
				Multiplier = 38
			},
			Rare =
			{
				Multiplier = 50
			},
			Epic =
			{
				Multiplier = 63
			},
			Heroic =
			{
				Multiplier = 76
			},
		},
        NoStatusBonusDamage = {BaseValue = 0.01},
		ExtractValues = { 
            {
				Key = "NoStatusBonusDamage",
				ExtractAs = "DamageBoost",
				Format = "Percent",
				IncludeSigns = true
            } 
        },
    },
    ReversedChanneledBlockMetaUpgrade = {
        Name = "ReversedChanneledBlockMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{

			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 2.0,
			},
			Epic =
			{
				Multiplier = 3.0,
			},
			Heroic =
			{
				Multiplier = 4.0,
			},
		},
        PropertyChanges =
		{
			{
				LifeProperty = "DodgeChance",
				BaseValue = 0.03,
                ChangeType = "Add",
				DataValue = false,
				ReportValues = { ReportedDodgeChance = "ChangeValue"},
            }
        },
		ExtractValues =
		{
			{
				Key = "ReportedDodgeChance",
				ExtractAs = "DodgeChance",
				Format = "Percent"
			},
		}
    },
	ReversedDoorRerollMetaUpgrade = {
        Name = "ReversedDoorRerollMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{

			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 4.0,
			},
			Epic =
			{
				Multiplier = 7.0,
			},
			Heroic =
			{
				Multiplier = 10.0,
			},
		},
        ModdedDoubleRewardChance = {BaseValue = 0.01},
		ExtractValues =
		{
			{
				Key = "ModdedDoubleRewardChance",
				ExtractAs = "Chance",
				Format = "Percent"
			},
		}
    },
	ReversedStartingGoldMetaUpgrade = {
        Name = "ReversedStartingGoldMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{
			Common =
			{
				Multiplier = 2,
			},
			Rare =
			{
				Multiplier = 3,
			},
			Epic =
			{
				Multiplier = 4,
			},
			Heroic =
			{
				Multiplier = 5,
			},
		},
        ArmorGranted = {BaseValue = 1},
		ExtractValues =
		{
			{
				Key = "ArmorGranted",
				ExtractAs = "TooltipAmount",
				IncludeSigns = true,
			},
		}
    },
	ReversedMetaToRunUpgradeMetaUpgrade = {
        Name = "ReversedMetaToRunUpgradeMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{
			Common =
			{
				Multiplier = 35,
			},
			Rare =
			{
				Multiplier = 40,
			},
			Epic =
			{
				Multiplier = 45,
			},
			Heroic =
			{
				Multiplier = 50,
			},
		},
        ExtraTraitChance = {BaseValue = 0.01},
		ExtractValues =
		{
			{
				Key = "ExtraTraitChance",
				ExtractAs = "Chance",
				Format = "LuckModifiedPercent",
			},
		}
    },
    ReversedRarityBoostMetaUpgrade = {
        Name = "ReversedRarityBoostMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{
			Common =
			{
				Multiplier = 10,
			},
			Rare =
			{
				Multiplier = 15,
			},
			Epic =
			{
				Multiplier = 20,
			},
			Heroic =
			{
				Multiplier = 25,
			},
		},
        OnEnemyDamagedAction =
		{
			FunctionName = "CheckSpawnZeusDamage",
			Args = 
			{
				Chance = {BaseValue = 0.01},
				Damage = 9999,
				Vfx = "DemeterBossIceShatter",
				ExcludeProjectileName = "MedeaCurse",
				ReportValues = { ReportedChance = "Chance" },
			}
		},
        ExtractValues = 
		{
			{
				Key = "ReportedChance",
				ExtractAs = "Chance",
				Format = "LuckModifiedPercent",
				HideSigns = true,
			},
        }
    },
	ReversedBonusRarityMetaUpgrade = {
        Name = "ReversedBonusRarityMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{
			Common =
			{
				Multiplier = 1,
			},
			Rare =
			{
				Multiplier = 2,
			},
			Epic =
			{
				Multiplier = 3,
			},
			Heroic =
			{
				Multiplier = 4,
			},
		},
        RankAwarded = {BaseValue = 1},
        ExtractValues = 
		{
			{
				Key = "RankAwarded",
				ExtractAs = "TooltipAmount",
			},
        }
    },
	CompanionshipHealthFamiliar = {
		Name = "CompanionshipHealthFamiliar",
		InheritFrom = {"BaseTrait"},
		BlockInRunRarify = true,
		Icon = "FamiliarShopIcon_FrogHealthBonus",
		RarityLevels = {
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 2.0,
			},
			Epic =
			{
				Multiplier = 3.0,
			},
			Heroic =
			{
				Multiplier = 6.0,
			},
		},
		PropertyChanges =
		{
			{
				LuaProperty = "MaxHealth",
				BaseValue = 10,
				ChangeType = "Add",
				MaintainDelta = true,
				ReportValues = { ReportedHealthBonus = "ChangeValue"}
			},
		},
		ExtractValues = 
		{
			{
				Key = "ReportedHealthBonus",
				ExtractAs = "HealthBonus"
			},
		},
		StatLines =
		{
			"BonusLifeStatDisplay1",
		},
	},
	CompanionshipCritFamiliar = {
		Name = "CompanionshipCritFamiliar",
		InheritFrom = {"BaseTrait"},
		BlockInRunRarify = true,
		Icon = "FamiliarShopIcon_RavenCritChanceBonus",
		RarityLevels = {
			Common =
			{
				Multiplier = 2.0,
			},
			Rare =
			{
				Multiplier = 3.0,
			},
			Epic =
			{
				Multiplier = 4.0,
			},
			Heroic =
			{
				Multiplier = 8.0,
			},
		},
		OutgoingUnmodifiedCritBonus = { BaseValue = 0.01 },
		ExtractValues = 
		{
			{
				Key = "OutgoingUnmodifiedCritBonus",
				ExtractAs = "CritBonus",
				Format = "Percent",
			},
		},
		StatLines =
		{
			"BonusCritStatDisplay1",
		},
	},
	CompanionshipDigFamiliar = {
		Name = "CompanionshipDigFamiliar",
		InheritFrom = {"BaseTrait"},
		BlockInRunRarify = true,
		Icon = "FamiliarShopIcon_HoundManaBonus",
		RarityLevels = {
			Common =
			{
				Multiplier = 2.0,
			},
			Rare =
			{
				Multiplier = 3.0,
			},
			Epic =
			{
				Multiplier = 4.0,
			},
			Heroic =
			{
				Multiplier = 8.0,
			},
		},
		PropertyChanges =
		{
			{
				LuaProperty = "MaxMana",
				BaseValue = 15,
				ChangeType = "Add",
				MaintainDelta = true,
				ReportValues = { ReportedManaBonus = "ChangeValue"}
			},
		},
		ExtractValues = 
		{
			{
				Key = "ReportedManaBonus",
				ExtractAs = "ManaBonus"
			},
		},
		StatLines =
		{
			"BonusMaxManaStatDisplay1",
		},
	},
	CompanionshipDodgeFamiliar = {
		Name = "CompanionshipDodgeFamiliar",
		InheritFrom = {"BaseTrait"},
		BlockInRunRarify = true,
		Icon = "FamiliarShopIcon_PolecatDodgeBonus",
		RarityLevels = {
			Common =
			{
				Multiplier = 4.0,
			},
			Rare =
			{
				Multiplier = 5.0,
			},
			Epic =
			{
				Multiplier = 6.0,
			},
			Heroic =
			{
				Multiplier = 12.0,
			},
		},
		PropertyChanges =
		{
			{
				LifeProperty = "DodgeChance",
				BaseValue = 0.01,
				ChangeType = "Add",
				DataValue = false,
				ReportValues = { ReportedDodgeChance = "ChangeValue" },
			},
		},
		ExtractValues = 
		{
			{
				Key = "ReportedDodgeChance",
				ExtractAs = "DodgeChance",
				Format = "Percent",
			},
		},
		StatLines =
		{
			"BonusDodgeStatDisplay1",
		},
	},
	CompanionshipLastStandFamiliar = {
		Name = "CompanionshipLastStandFamiliar",
		InheritFrom = {"BaseTrait"},
		BlockInRunRarify = true,
		Icon = "FamiliarShopIcon_CatLastStandHeal",
		RarityLevels = {
			Common =
			{
				Multiplier = 4.0,
			},
			Rare =
			{
				Multiplier = 6.0,
			},
			Epic =
			{
				Multiplier = 8.0,
			},
			Heroic =
			{
				Multiplier = 16.0,
			},
		},
		AcquireFunctionName = "AddLastStand",
		AcquireFunctionArgs = {
			Name = "LastStandFamiliar",
			Icon = "ExtraLifeCatFamiliar",
			InsertAtEnd = true,
			IncreaseMax = true,
			HealAmount = {BaseValue = 10},
			Silent = true,
			ReportValues = {FamiliarLastStandHealAmount = "HealAmount"}
		},
		ExtractValues = 
		{
			{
				Key = "FamiliarLastStandHealAmount",
				ExtractAs = "TooltipLastStandHealth",
			},
		},
		StatLines =
		{
			"LastStandStatDisplay1",
		},
	},
    ReversedTradeOffMetaUpgrade = {
        Name = "ReversedTradeOffMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{

			Common =
			{
				Multiplier = 10,
			},
			Rare =
			{
				Multiplier = 15,
			},
			Epic =
			{
				Multiplier = 20,
			},
			Heroic =
			{
				Multiplier = 25,
			},
		},
        FatedCritcalChance = { BaseValue = 0.01,},
        ExtractValues = 
		{
			{
				Key = "FatedCritcalChance",
				ExtractAs = "CritBonus",
				Format = "LuckModifiedPercent"
			},
		},
    },
	ReversedScreenRerollMetaUpgrade = {
        Name = "ReversedScreenRerollMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{

			Common =
			{
				Multiplier = 1.6,
			},
			Rare =
			{
				Multiplier = 2.3,
			},
			Epic =
			{
				Multiplier = 3.0,
			},
			Heroic =
			{
				Multiplier = 3.7,
			},
		},
		ModdedUpgradeChance = {BaseValue = .1},
        ExtractValues = 
		{
			{
				Key = "ModdedUpgradeChance",
				ExtractAs = "Chance",
				Format = "Percent"
			},
		},
    },
	ReversedLowHealthBonusMetaUpgrade = {
        Name = "ReversedLowHealthBonusMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
		CustomTrayText = "ReversedLowHealthBonusMetaUpgrade_Tray",
        RarityLevels =
		{

			Common =
			{
				Multiplier = 6.0,
			},
			Rare =
			{
				Multiplier = 9.0,
			},
			Epic =
			{
				Multiplier = 12.0,
			},
			Heroic =
			{
				Multiplier = 15.0,
			},
		},
		AddOutgoingDamageModifiers =
		{
			SpentLastStandMultiplier =
			{
				BaseValue = 0.01,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ReportValues = { ReportedWeaponMultiplier = "SpentLastStandMultiplier"},      
		},  
		ExtractValues = 
		{
			{
				Key = "ReportedWeaponMultiplier",
				ExtractAs = "DamageIncrease",
				Format = "Percent"
			},
			{
				Key = "ReportedWeaponMultiplier",
				MultiplyBySpentLastStands = true,
				ExtractAs = "CurrentDamageIncrease",
				Format = "Percent"
			},
		},
    },
	ReversedEpicRarityBoostMetaUpgrade = {
        Name = "ReversedEpicRarityBoostMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{

			Common =
			{
				Multiplier = 1,
			},
			Rare =
			{
				Multiplier = 2,
			},
			Epic =
			{
				Multiplier = 3,
			},
			Heroic =
			{
				Multiplier = 4,
			},
		},
		ElementsGranted = {BaseValue = 1},
		ExtractValues = 
		{
			{
				Key = "ElementsGranted",
				ExtractAs = "TooltipAmount",
				IncludeSigns = true,
			},
		},
    },
	ReversedCardDrawMetaUpgrade = {
        Name = "ReversedCardDrawMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
		CustomTrayText = "ReversedCardDrawMetaUpgrade_Tray",
        RarityLevels =
		{

			Common =
			{
				Multiplier = 1,
			},
			Rare =
			{
				Multiplier = 2,
			},
			Epic =
			{
				Multiplier = 3,
			},
			Heroic =
			{
				Multiplier = 4,
			},
		},
		Uses = {BaseValue = 1},
		ExtractValues = 
		{
			{
				Key = "Uses",
				ExtractAs = "TooltipAmount",
				IncludeSigns = false,
			},
		},
    },
}

for newMetaUpgradeTraitName, newMetaUpgradeTraitData in pairs(NewMetaUpgradeTraitData) do
    game.ProcessDataInheritance(newMetaUpgradeTraitData, game.TraitData)
    game.TraitData[newMetaUpgradeTraitName]=newMetaUpgradeTraitData
end
