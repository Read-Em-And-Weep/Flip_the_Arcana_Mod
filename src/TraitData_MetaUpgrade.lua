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
			PercentThreshold = 0.85,
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
				Threshold = 0.85,
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
		CustomTrayText = "ReversedSorceryRegenUpgrade_Tray",
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
				Multiplier = 6,
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
        }
    },
	ReversedCastBuffMetaUpgrade = {
        Name = "ReversedCastBuffMetaUpgrade",
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
		EncounterStartInvulnerabilityDuration = {BaseValue = 1},
		OnEncounterStartFunction = {
			Name = _PLUGIN.guid .. ".AwardStartingInvulnerability",
			Args = {
				EffectName = "AthenaInvulnerable",
				Duration = {BaseValue = 1},
				ReportValues = {ReportedDuration = "Duration"}
			}
		},
        ExtractValues = 
		{
			{
				Key = "ReportedDuration",
				ExtractAs = "Duration",
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
				Multiplier = 10.0,
			},
		},
        RarityUpgradeData = 
		{
			RequireNotExcludeFromLastRunBoon = true,
			MultiUse = true,
			Uses = { BaseValue = 1 },
			MaxRarity = 5,
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
				Multiplier = 2.0,
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
			ValidWeaponMultiplier = 1.35,
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
				Multiplier = 20
			},
			Rare =
			{
				Multiplier = 30
			},
			Epic =
			{
				Multiplier = 35
			},
			Heroic =
			{
				Multiplier = 45
			},
		},
		FirstHitMultiplier = {
			BaseValue = .01,
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
				Multiplier = 1.5,
			},
			Rare =
			{
				Multiplier = 1.3,
			},
			Epic =
			{
				Multiplier = 1.1,
			},
			Heroic =
			{
				Multiplier = 0.9,
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
				Multiplier =8/7,
			},
			Rare =
			{
				Multiplier = 1,
			},
			Epic =
			{
				Multiplier = 6/7,
			},
			Heroic =
			{
				Multiplier = 5/7,
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
				BaseValue = 0.04,
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
				Multiplier = 3.0,
			},
			Epic =
			{
				Multiplier = 5.0,
			},
			Heroic =
			{
				Multiplier = 7.0,
			},
		},
        ModdedDoubleRewardChance = {BaseValue = 0.01},
		ExtractValues =
		{
			{
				Key = "ModdedDoubleRewardChance",
				ExtractAs = "Chance",
				Format = "LuckModifiedPercent"
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
				Multiplier = 20,
			},
			Rare =
			{
				Multiplier = 25,
			},
			Epic =
			{
				Multiplier = 30,
			},
			Heroic =
			{
				Multiplier = 35,
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
				Multiplier = 5,
			},
			Rare =
			{
				Multiplier = 10,
			},
			Epic =
			{
				Multiplier = 15,
			},
			Heroic =
			{
				Multiplier = 20,
			},
		},
        OnEnemyDamagedAction =
		{
			FunctionName = _PLUGIN.guid..".CheckSpawnDemeterDamage",
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
				Multiplier = 1,
			},
			Rare =
			{
				Multiplier = 3,
			},
			Epic =
			{
				Multiplier = 5,
			},
			Heroic =
			{
				Multiplier = 7,
			},
		},
        FatedDDChance = { BaseValue = 0.01,},
        ExtractValues = 
		{
			{
				Key = "FatedDDChance",
				ExtractAs = "Chance",
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
				Multiplier = 1.5,
			},
			Rare =
			{
				Multiplier = 2.1,
			},
			Epic =
			{
				Multiplier = 2.7,
			},
			Heroic =
			{
				Multiplier = 3.3,
			},
		},
		ModdedUpgradeChance = {BaseValue = .1},
        ExtractValues = 
		{
			{
				Key = "ModdedUpgradeChance",
				ExtractAs = "Chance",
				Format = "LuckModifiedPercent"
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
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 3.0,
			},
			Epic =
			{
				Multiplier = 5.0,
			},
			Heroic =
			{
				Multiplier = 7.0,
			},
		},
		ModdedDoubleDamageChancePerDD = {BaseValue = 0.01},
		ExtractValues = 
		{
			{
				Key = "ModdedDoubleDamageChancePerDD",
				ExtractAs = "DamageIncrease",
				Format = "LuckModifiedPercent"
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
				Multiplier = 4,
			},
			Rare =
			{
				Multiplier = 6,
			},
			Epic =
			{
				Multiplier = 8,
			},
			Heroic =
			{
				Multiplier = 10,
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
		Icon = "MiniMonstrosityTraitTrayIcon",
        InheritFrom = { "MetaUpgradeTrait" },
		CustomTrayText = "ReversedCardDrawMetaUpgrade_Tray",
        RarityLevels =
		{

			Common =
			{
				Multiplier = 6,
			},
			Rare =
			{
				Multiplier = 9,
			},
			Epic =
			{
				Multiplier = 12,
			},
			Heroic =
			{
				Multiplier = 15,
			},
		},
		Uses = {BaseValue = 1},
		ShowInHUD = true,
		ExtractValues = 
		{
			{
				Key = "Uses",
				ExtractAs = "TooltipAmount",
				IncludeSigns = false,
			},
		},
    },
	ReversedEncounterHealMetaUpgrade = {
		Name = "ReversedEncounterHealMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{
			Common =
			{
				Multiplier = 1.5,
			},
			Rare =
			{
				Multiplier = 2.5,
			},
			Epic = 
			{
				Multiplier = 3.5,
			},
			Heroic = 
			{
				Multiplier = 4.5,
			}
		},
		OnEncounterStartFunction =
		{
			Name = "RecordDamageSnapshot",
		},
		EncounterEndFunctionName = "EndEncounterHeal",
		EncounterEndFunctionArgs =
		{
			EncounterHealMultiplier = { BaseValue = 0.1 },
			ReportValues = { ReportedEncounterHealMultiplier = "EncounterHealMultiplier" }
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
				Key = "ReportedEncounterHealMultiplier",
				ExtractAs = "EncounterHeal",
				Format =  "PercentHeal",
				HideSigns = true,
			},
		}
	},
	ReversedPerfectClearBoostMetaUpgrade = {
		Name = "ReversedPerfectClearBoostMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
				CustomTrayText = "ReversedPerfectClearBoostMetaUpgrade_Tray",
        RarityLevels =
		{
			Common =
			{
				Multiplier = 0.5,
			},
			Rare =
			{
				Multiplier = 1,
			},
			Epic = 
			{
				Multiplier = 1.5,
			},
			Heroic = 
			{
				Multiplier = 2,
			}
		},
		FlipArcanaPerfectClearDamageBonus =
        {
            BaseValue = 1.01,
            SourceIsMultiplier = true,
            DecimalPlaces = 3,
        },
        AddOutgoingDamageModifiers =
        {
            UseTraitValue = "AccumulatedDamageBonus",
        },
        AccumulatedDamageBonus = 1,
        OnEncounterStartFunction =
        {
            Name = "RecordDamageSnapshot",
        },
        EncounterEndFunctionName = _PLUGIN.guid .. ".FlipArcanaCheckPerfectClear",
        EncounterEndFunctionArgs = {
            PerfectFunctionName = _PLUGIN.guid .. ".FlipArcanaIncreaseAccumulatedDamageBonus"
        },

		
		ExtractValues =
		{
			{
            Key = "FlipArcanaPerfectClearDamageBonus",
            ExtractAs = "Multiplier",
            DecimalPlaces = 1,
            Format = "PercentDelta",
        },
        {
				Key = "AccumulatedDamageBonus",
				ExtractAs = "TooltipAccumulatedBonus",
				Format = "PercentDelta",
				DecimalPlaces = 1,
			},
		}
	},
	ReversedCheaperChannelMetaUpgrade = {
		Name = "ReversedCheaperChannelMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{
			Common =
			{
				Multiplier = 1,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic = 
			{
				Multiplier = 2.0,
			},
			Heroic = 
			{
				Multiplier = 2.5,
			}
		},
		ManaCostModifiers = 
		{
			ManaCostMultiplier = { BaseValue = 0.8, SourceIsMultiplier = true },
			ReportValues = { ReportedManaCost = "ManaCostMultiplier" }
		},
		
		ExtractValues =
		{
			{
				Key = "ReportedManaCost",
				ExtractAs = "ManaCost",
				Format = "NegativePercentDelta",
				HideSigns = true,
			},
		},
	},
	ReversedStrongRushMetaUpgrade = {
		Name = "ReversedStrongRushMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{
			Common =
			{
				Multiplier = 1,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic = 
			{
				Multiplier = 2.0,
			},
			Heroic = 
			{
				Multiplier = 2.5,
			}
		},
		AddOutgoingDamageModifiers =
		{
			ValidProjectiles = WeaponSets.SprintProjectileNames,
			ValidWeaponMultiplier =
			{
				BaseValue = 1.10,
				SourceIsMultiplier = true,
			},
			ReportValues = { ReportedMultiplier = "ValidWeaponMultiplier"},
		},
		
		ExtractValues =
		{
			{
				Key = "ReportedMultiplier",
				ExtractAs = "SprintDamageBonus",
				Format = "PercentDelta",
			},
		}
	},
	ReversedDoorCashMetaUpgrade = {
		Name = "ReversedDoorCashMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{
			Common =
			{
				Multiplier = 1,
			},
			Rare =
			{
				Multiplier = 3,
			},
			Epic = 
			{
				Multiplier = 5,
			},
			Heroic = 
			{
				Multiplier = 7,
			}
		},
		LeaveRoomFunctionName = _PLUGIN.guid .. ".DoReversedDoorCash",
		FlipTheArcanaDoorCash = {BaseValue = 1},
		ExtractValues =
		{
			{
				Key = "FlipTheArcanaDoorCash",
				ExtractAs = "TooltipCash",
			},
		}
	},
	ReversedRenewableDDMetaUpgrade = {
		Name = "ReversedRenewableDDMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{
			Common =
			{
				Multiplier = 0.5,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic = 
			{
				Multiplier = 2.5,
			},
			Heroic = 
			{
				Multiplier = 3.5,
			}
		},
		SetupFunction =
        {
            Name = _PLUGIN.guid .. ".RenewLastStand",
            Args =
            {
                RestoreFraction =
                {
                    BaseValue = 0.1,
                },
                ReportValues = { LastStandHealFraction = "RestoreFraction" }
            },
        },
		FlipArcanaRestoreFraction = {BaseValue = 0.1},
        --[[AcquireFunctionName = _PLUGIN.guid..".GrantRenewableMetaUpgradeLastStands",
        AcquireFunctionArgs = {
            Name = "FlipTheArcanaRenewableLastStand",
            Icon = "ExtraLifeSkelly",
            HealFraction = {BaseValue = 0.1},
            ManaFraction = {BaseValue = 0.1},
            ValidityFunctionName = _PLUGIN.guid .. ".IsRenewableLastStandEligible",
            IncreaseMax = true,
        },]]
		ExtractValues =
		{
			{
				Key = "LastStandHealFraction",
				ExtractAs = "LastStandHeal",
				Format = "Percent",
				SkipAutoExtract = true,
			},
		}
	},
	ReversedHeroicRarityMetaUpgrade = {
		Name = "ReversedHeroicRarityMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{
			Common =
			{
				Multiplier = 0.5,
			},
			Rare =
			{
				Multiplier = 1,
			},
			Epic = 
			{
				Multiplier =1.5,
			},
			Heroic = 
			{
				Multiplier = 2.0,
			}
		},
		FlipTheArcanaUpgradeToHeroicChance = {BaseValue = 0.1},
		ExtractValues =
		{
			{
				Key = "FlipTheArcanaUpgradeToHeroicChance",
				ExtractAs = "RarityBonus",
				Format = "Percent",
			},
		}
	},
	ReversedSharedRunProgressMetaUpgrade = {
		Name = "ReversedSharedRunProgressMetaUpgrade",
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
			}
		},
		FlipTheArcanaSharedRatio = {BaseValue = 0.1},
		ExtractValues =
		{
			{
				Key = "FlipTheArcanaSharedRatio",
				ExtractAs = "HealthBonus",
				Format = "Percent",
			},
		}
	},
	ReversedPomBiomeStartMetaUpgrade = {
		Name = "ReversedPomBiomeStartMetaUpgrade",
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
			}
		},
		FlipTheArcanaBonusLevels = {BaseValue = 1},
		ExtractValues =
		{
			{
				Key = "FlipTheArcanaBonusLevels",
				ExtractAs = "BonusLevels",
			},
		}
	},
	ReversedArmorPerRoomMetaUpgrade = {
        Name = "ReversedArmorPerRoomMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{

			Common =
			{
				Multiplier = 8/9,
			},
			Rare =
			{
				Multiplier = 7/9,
			},
			Epic =
			{
				Multiplier = 6/9,
			},
			Heroic =
			{
				Multiplier = 5/9,
			},
		},
        RoomsPerUpgrade = {
			Amount = {
				BaseValue = 9,
			},
			DropResources = 
			{
				Delay = 0.5,
				NotRequiredPickup = true,
				ForceToValidLocation = true,
				UseSurfaceSpawnPoints = true,
				KeepCollision = true,
				LootOptions =
				{
					{
						Name = "ArmorBoost",
						Amount = 1,
					},
				}
			},			
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
	ReversedStatusCritMetaUpgrade = {
        Name = "ReversedStatusCritMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{
			Common =
			{
				Multiplier = 10
			},
			Rare =
			{
				Multiplier = 15
			},
			Epic =
			{
				Multiplier = 20
			},
			Heroic =
			{
				Multiplier = 25
			},
		},
        FlipTheArcanaStatusCrit = {
			MinRequiredVulnerabilityEffects = 4,
			Chance = {BaseValue = 0.01},
			ReportValues = { ReportedChance = "Chance"},
		},
		ExtractValues = { 
            {
				Key = "ReportedChance",
				ExtractAs = "CritBonus",
				Format = "LuckModifiedPercent",            
			} 
        },
    },
	ReversedManaPerRoomMetaUpgrade =
    {
        Name = "ReversedManaPerRoomMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
        {
			Common =
			{
				Multiplier = 1
			},
			Rare =
			{
				Multiplier = 3
			},
			Epic =
			{
				Multiplier = 5
			},
			Heroic =
			{
				Multiplier = 7
			},
        },
        RoomsPerUpgrade = {
			Amount = 1,
			MaxMana = {BaseValue = 1},
			ReportValues = {
				GivenMaxMana = "MaxMana",
			},
		},
		CurrentRoom = 0,
		ExtractValues = { 
            {
                Key = "GivenMaxMana",
			    ExtractAs = "GrowthValue",
				IncludeSigns = true,
            } 
        },
    },
	ReversedOlympianDamageMetaUpgrade =
    {
        Name = "ReversedOlympianDamageMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
        {
			Common =
			{
				Multiplier = 1.09
			},
			Rare =
			{
				Multiplier = 1.11
			},
			Epic =
			{
				Multiplier = 1.13
			},
			Heroic =
			{
				Multiplier = 1.15
			},
        },
        AddOutgoingDamageModifiersArray = 
		{
			{
				ValidProjectiles = WeaponSets.OlympianProjectileNames,
				ValidWeaponMultiplier = {BaseValue = 1},
				ReportValues = { ReportedMultiplier = "ValidWeaponMultiplier"}
			},
			{
				ValidEffects = WeaponSets.OlympianEffectNames,
				ValidWeaponMultiplier = {BaseValue = 1},
			}
		},
		ExtractValues = { 
            {
				Key = "ReportedMultiplier",
				ExtractAs = "Multiplier",
				Format = "PercentDelta",
			},
        },
    },
	ReversedLowHealthCritMetaUpgrade =
    {
        Name = "ReversedLowHealthCritMetaUpgrade",
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
        FlipTheArcanaLowHealthCritData = {
			Threshold = {BaseValue = 0.1},
			CritChance = 0.15,
			ReportValues = 
				{ 
					ReportedThreshold = "Threshold",
					ReportedCritChance = "CritChance",
				}
		},
		ExtractValues = { 
            {
				Key = "ReportedThreshold",
				ExtractAs = "Threshold",
				SkipAutoExtract = true,
				Format = "Percent",
				IncludeSigns = false
			},
			{
				Key = "ReportedCritChance",
				ExtractAs = "CritBonus",
				Format = "LuckModifiedPercent",            
			} 
        },
    },
	ReversedSturdyChannelMetaUpgrade =
    {
        Name = "ReversedSturdyChannelMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
        {
			Common =
			{
				Multiplier = 2
			},
			Rare =
			{
				Multiplier = 2.5
			},
			Epic =
			{
				Multiplier = 3
			},
			Heroic =
			{
				Multiplier = 3.5
			},
        },
        OnWeaponChargeFunctions = 
		{
			ValidWeapons = { "WeaponStaffSwing5", "WeaponDagger5", "WeaponStaffBall", "WeaponDaggerThrow", "WeaponAxeSpecialSwing", "WeaponAxeSpin", "WeaponTorch", "WeaponTorchSpecial", "WeaponLob", "WeaponLobSpecial", "WeaponCastArm", "WeaponCastProjectileHades", "WeaponCastProjectile", "WeaponAnywhereCast", "WeaponCastLob", "WeaponSuitCharged", "WeaponSuitRanged"},
			FunctionName = _PLUGIN.guid..".StartChannelSturdy",
			FunctionArgs =
			{
				DamageTakenModifier = {BaseValue = 0.9, SourceIsMultiplier = true },
				ReportValues = 
				{ 
					ReportedSturdyModifier = "DamageTakenModifier" 
				},
			},
		},
		OnWeaponFiredFunctions = 
		{
			ValidWeapons = { "WeaponStaffSwing5", "WeaponDagger5", "WeaponStaffBall", "WeaponDaggerThrow", "WeaponAxeSpecialSwing", "WeaponAxeSpin", "WeaponTorch", "WeaponTorchSpecial", "WeaponLob", "WeaponLobSpecial", "WeaponCastArm", "WeaponCastProjectileHades", "WeaponCastProjectile", "WeaponAnywhereCast", "WeaponCastLob", "WeaponSuitCharged", "WeaponSuitRanged"},
			FunctionName = _PLUGIN.guid..".EndChannelSturdy",
		},
		OnWeaponChargeCanceledFunctions = 
		{
			ValidWeapons = { "WeaponStaffSwing5", "WeaponDagger5", "WeaponStaffBall", "WeaponDaggerThrow", "WeaponAxeSpecialSwing", "WeaponAxeSpin", "WeaponTorch", "WeaponTorchSpecial", "WeaponLob", "WeaponLobSpecial", "WeaponCastArm", "WeaponCastProjectileHades", "WeaponCastProjectile", "WeaponAnywhereCast", "WeaponCastLob", "WeaponSuitCharged", "WeaponSuitRanged"},
			FunctionName = _PLUGIN.guid..".EndChannelSturdy",
		},
		ExtractValues = { 
            {
				Key = "ReportedSturdyModifier",
				ExtractAs = "SturdyModifier",
				Format = "NegativePercentDelta",
			},
        },
    },
	ReversedUnFatedRewardMetaUpgrade =
    {
        Name = "ReversedUnFatedRewardMetaUpgrade",
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
        FlipTheArcanaUnFatedMajorFindChance = {BaseValue = 0.1},
		ExtractValues = { 
            {
				Key = "FlipTheArcanaUnFatedMajorFindChance",
				ExtractAs = "Chance",
				Format = "LuckModifiedPercent"
			},
        },
    },
	ReversedCharmedEnemyMetaUpgrade =
    {
        Name = "ReversedCharmedEnemyMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
        {
			Common =
			{
				Multiplier = 20
			},
			Rare =
			{
				Multiplier = 30
			},
			Epic =
			{
				Multiplier = 40
			},
			Heroic =
			{
				Multiplier = 50
			},
        },
        CharmedEnemyMultiplier = {BaseValue = .01},
		SetupFunction =
		{
			Threaded = true,
			Name = _PLUGIN.guid ..".CharmCrowd",
			Args =
			{
				Minimum = 4,
						-- Need to correct this is trait text manually
				ReportValues = { ReportedMinimum = "Minimum"},
				EffectName = "Charm",
			},
		},
		ExtractValues = {
			{
				Key = "CharmedEnemyMultiplier",
				ExtractAs = "OutgoingDamage",
				Format = "Percent",
				IncludeSigns = true
			},
			{
				Key = "ReportedMinimum",
				ExtractAs = "TooltipMinimum",
			},
		}
    },
	ReversedCrowdDamageMetaUpgrade = {
		Name = "ReversedCrowdDamageMetaUpgrade",
		InheritFrom = { "MetaUpgradeTrait" },
		RarityLevels =
		{

			Common =
			{
				Multiplier = 15
			},
			Rare =
			{
				Multiplier = 20
			},
			Epic =
			{
				Multiplier = 25
			},
			Heroic =
			{
				Multiplier = 30
			},
		},
		FlipTheArcanaCrowdDamage = {
			BaseValue = .01,
		},
		FlipTheArcanaCrowdThreshold = 5,
		-- Need to correct this is trait text manually
		ExtractValues = {
			{
				Key = "FlipTheArcanaCrowdDamage",
				ExtractAs = "OutgoingDamage",
				Format = "Percent",
				IncludeSigns = true
			},
		}
    },
	ReversedExtraPurchaseMetaUpgrade = {
		Name = "ReversedExtraPurchaseMetaUpgrade",
		InheritFrom = { "MetaUpgradeTrait" },
		RarityLevels =
		{

			Common =
			{
				Multiplier = 0.4
			},
			Rare =
			{
				Multiplier = 0.7
			},
			Epic =
			{
				Multiplier = 1.0
			},
			Heroic =
			{
				Multiplier = 1.3
			},
		},
		MoneyMultiplier = { BaseValue = 1.1, 
				SourceIsMultiplier = true},
		ExtractValues = {
			{
				Key = "MoneyMultiplier",
				ExtractAs = "TooltipCashBonus",
				Format = "PercentDelta",
			},
		}
    },
	ReversedGatherRarityMetaUpgrade = {
		Name = "ReversedGatherRarityMetaUpgrade",
		InheritFrom = { "MetaUpgradeTrait" },
		RarityLevels =
		{

			Common =
			{
				Multiplier = 5
			},
			Rare =
			{
				Multiplier = 10
			},
			Epic =
			{
				Multiplier = 15
			},
			Heroic =
			{
				Multiplier = 20
			},
		},
		FlipTheArcanaUpgradeArcanaChance = { BaseValue = 0.01},
		ExtractValues = {
			{
				Key = "FlipTheArcanaUpgradeArcanaChance",
				ExtractAs = "Chance",
				Format = "LuckModifiedPercent"
			},
		}
    },
	ReversedKeepsakeReAddMetaUpgrade = {
		Name = "ReversedKeepsakeReAddMetaUpgrade",
		InheritFrom = { "MetaUpgradeTrait" },
		RarityLevels =
		{

			Common =
			{
				Multiplier = 17
			},
			Rare =
			{
				Multiplier = 21
			},
			Epic =
			{
				Multiplier = 25
			},
			Heroic =
			{
				Multiplier = 29
			},
		},
		--FlipTheArcanaReuseKeepsakeRarity = { BaseValue = 1},
		FlipTheArcanaRandomCards = {BaseValue = 1},
		BaseCardLossChance = 0.5, 
		-- NOTE: THE ABOVE VALUE needs to be updated maunally in the Help Text
		--CardLossChanceGrowth = 0.1,
		--CurrentCardLossChance = 0.5,
		ExtractValues = {
			--[[{
				Key = "FlipTheArcanaReuseKeepsakeRarity",
				ExtractAs = "KeepsakeRarity",
				Format = "FlipArcanaKeepsakeRarity"
			},]]
			{
				Key = "FlipTheArcanaRandomCards",
				ExtractAs = "Count",
				IncludeSigns = true,
			},
			{
				Key = "BaseCardLossChance",
				ExtractAs = "Chance",
				Format = "Percent",
			},
		}
    },
	ReversedSacrificeForLevelsMetaUpgrade = {
        Name = "ReversedSacrificeForLevelsMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
		CustomTrayText = "ReversedSacrificeForLevelsMetaUpgrade_Tray",
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
		Uses = 3,
		BonusLevels = {BaseValue = 1},
		ExtractValues = 
		{
			{
				Key = "BonusLevels",
				ExtractAs = "TooltipAmount",
				IncludeSigns = true,
			},
			{
				Key = "Uses",
				ExtractAs = "Uses",
				IncludeSigns = false,
			},
		},
    },
	ReversedRandomBonusLevelsMetaUpgrade = {
        Name = "ReversedRandomBonusLevelsMetaUpgrade",
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
		MaxBonusLevels = {BaseValue = 1},
		ExtractValues = 
		{
			{
				Key = "MaxBonusLevels",
				ExtractAs = "TooltipAmount",
				IncludeSigns = true,
			},
		},
    },
	ReversedExtraFeaturesMetaUpgrade = {
		Name = "ReversedExtraFeaturesMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{
			Common =
			{
				Multiplier = 2.5,
			},
			Rare =
			{
				Multiplier = 3,
			},
			Epic = 
			{
				Multiplier = 3.5,
			},
			Heroic = 
			{
				Multiplier = 4,
			}
		},
		FlipTheArcanaExtraFeatureChance = {BaseValue = 0.1},
		ExtractValues =
		{
			{
				Key = "FlipTheArcanaExtraFeatureChance",
				ExtractAs = "Chance",
				Format = "Percent",
			},
		}
	},
	ReversedPerfectPowerMetaUpgrade = {
		Name = "ReversedPerfectPowerMetaUpgrade",
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
			}
		},
		CustomTrayText = "ReversedPerfectPowerMetaUpgrade_Tray",
		FlipTheArcanaMaxBonusStacks = {BaseValue = 1},
		FlipTheArcanaCurrentBonusStacks = 0,
		FlipTheArcanaPowerPerStack = 1,
		OnEnemyDamagedAction = 
		{
			ValidWeapons = WeaponSets.HeroAllWeapons,
			FunctionName = _PLUGIN.guid .. ".CheckPerfectPower",
			FirstHitOnly = true,
			Args = 
			{
			}
		},
		OnSelfDamagedFunction = 
		{
			Name =_PLUGIN.guid .. ".ResetPerfectPower",
			NotDamagingRetaliate = true,
		},
		ExtractValues =
		{
			{
				Key = "FlipTheArcanaMaxBonusStacks",
				ExtractAs = "MaxStacks",
			},
			{
				Key = "FlipTheArcanaCurrentBonusStacks",
				ExtractAs = "CurrentStacks",
			},
			{
				Key = "FlipTheArcanaPowerPerStack",
				ExtractAs = "PowerPerStack",
				SkipAutoExtract = true,
			}
		}
	},
	ReversedFullDefianceMetaUpgrade = {
		Name = "ReversedFullDefianceMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{
			Common =
			{
				Multiplier = 2,
			},
			Rare =
			{
				Multiplier = 2.5,
			},
			Epic = 
			{
				Multiplier = 3,
			},
			Heroic = 
			{
				Multiplier = 3.5,
			}
		},
		FlipTheArcanaFullDDDodgeChance = 0.15,
		OnEncounterStartFunction =
		{
			Name = _PLUGIN.guid .. ".CheckFarewellBuff",
		},
		EncounterEndFunctionName =  _PLUGIN.guid .. ".RemoveFarewellBuff",
		FlipTheArcanaFullLastStandDamageMultiplier = {BaseValue = 0.1},
		ExtractValues =
		{
			{
				Key = "FlipTheArcanaFullDDDodgeChance",
				ExtractAs = "DodgeChance",
				Format = "Percent",
			},
			{
				Key = "FlipTheArcanaFullLastStandDamageMultiplier",
				ExtractAs = "DamageMultiplier",
				Format = "Percent",
			},
		}
	},
	ReversedArtemisKeepsakeMetaUpgrade = {
		Name = "ReversedArtemisKeepsakeMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{
			Common =
			{
				Multiplier = 1,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic = 
			{
				Multiplier =2,
			},
			Heroic = 
			{
				Multiplier = 2.5,
			}
		},
		CapMaxHealth = 30,
		AddOutgoingCritModifiers =
		{
			Chance = { BaseValue = 0.1 },
			ReportValues = { ReportedCritBonus = "Chance"}
		},
		ExtractValues =
		{
			{
				Key = "CapMaxHealth",
				ExtractAs = "Health",
				HideSigns = true,
			},
			{
				Key = "ReportedCritBonus",
				ExtractAs = "Chance",
				Format = "LuckModifiedPercent",
			},
		},
	},
	ReversedBackstabMetaUpgrade = {
		Name = "ReversedBackstabMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{
			Common =
			{
				Multiplier = 3,
			},
			Rare =
			{
				Multiplier = 4,
			},
			Epic = 
			{
				Multiplier =5,
			},
			Heroic = 
			{
				Multiplier = 6,
			}
		},
		AddOutgoingDamageModifiers =
		{
			HitVulnerabilityMultiplier =
			{
				BaseValue = 1.10,
				SourceIsMultiplier = true,
			},
			ReportValues = { ReportedMultiplier = "HitVulnerabilityMultiplier"},

		},
		ExtractValues =
		{
			{
				Key = "ReportedMultiplier",
				ExtractAs = "Damage",
				Format = "PercentDelta",
			},
		},
	},
	ReversedPotentDefianceMetaUpgrade = {
		Name = "ReversedPotentDefianceMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			},
			Heroic =
			{
				Multiplier = 2.5,
			},
		},
		LastStandHealFraction = {BaseValue = 0.1 },
		ExtractValues =
		{
			{
				Key = "LastStandHealFraction",
				ExtractAs = "BonusHeal",
				Format = "Percent",
			},
		},
	},
	ReversedSpellDamageMetaUpgrade = {
		Name = "ReversedSpellDamageMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{
			Common =
			{
				Multiplier = 1.1/1.1,
			},
			Rare =
			{
				Multiplier = 1.15/1.1,
			},
			Epic =
			{
				Multiplier = 1.2/1.1,
			},
			Heroic =
			{
				Multiplier = 1.25/1.1,
			},
		},
		AllyDataModifiers = 
		{			
			AddOutgoingDamageModifiers =
			{
				{
					NonPlayerMultiplier = { BaseValue = 1.1 },
				},
			},
		},
		AddOutgoingDamageModifiers = 
		{
			-- Match this to above ally data modifier too!
			ValidProjectiles = WeaponSets.SpellProjectileNames,
			ValidWeaponMultiplier = { BaseValue = 1.1 },
			ReportValues = { ReportedMultiplier = "ValidWeaponMultiplier"},
		},
		ExtractValues =
		{
			{
				Key = "ReportedMultiplier",
				ExtractAs = "Bonus",
				Format = "PercentDelta",
			},
		}
	},
	ReversedBonusTalentMetaUpgrade = {
        Name = "ReversedBonusTalentMetaUpgrade",
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
		FlipTheArcanaBonusTalentPoints = {BaseValue = 1},
		ExtractValues = 
		{
			{
				Key = "FlipTheArcanaBonusTalentPoints",
				ExtractAs = "Count",
				IncludeSigns = true,
			},
		},
    },
	ReversedProjectileSlowMetaUpgrade = {
        Name = "ReversedProjectileSlowMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{
			Common =
			{
				Multiplier = 2/3,
			},
			Rare =
			{
				Multiplier = 1,
			},
			Epic =
			{
				Multiplier = 4/3,
			},
			Heroic =
			{
				Multiplier = 5/3,
			}
		},
		EnemyProjectileSpeedMultiplier = { BaseValue = 0.7, SourceIsMultiplier = true },		
		ExtractValues = 
		{
			{
				Key = "EnemyProjectileSpeedMultiplier",
				ExtractAs = "TooltipDodgeBonus",
				Format = "NegativePercentDelta",
				HideSigns = true,
			},
		},
    },
	ReversedDashRecoveryMetaUpgrade = {
        Name = "ReversedDashRecoveryMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{
			Common =
				{
					Multiplier = 1.00,
				},
			Rare =
				{
					Multiplier = 1.15384,
				},
			Epic =
				{
					Multiplier = 1.2962,
				},
			Heroic =
				{
					Multiplier = 1.425000,
				}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroBlinkWeapons,
				WeaponProperty = "ClipRegenInterval",
				BaseValue = 0.8,
				SourceIsMultiplier = true,
				DecimalPlaces = 3,
				ChangeType = "Multiply",
				ReportValues = { ReportedReduction = "ChangeValue"},
			},
		},		
		ExtractValues = 
		{
			{
				Key = "ReportedReduction",
				ExtractAs = "TooltipMultiplier",
				Format = "PercentReciprocalDelta",
			},
		},
    },
	ReversedElementRoomMetaUpgrade =
    {
        Name = "ReversedElementRoomMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
        {

            Common =
            {
                Multiplier = 10,
            },
            Rare =
            {
                Multiplier = 9,
            },
            Epic =
            {
                Multiplier = 8,
            },
            Heroic =
            {
                Multiplier = 7,
            },
        },
        RoomsPerUpgrade = {
			Amount = {BaseValue = 1},
			FlipTheArcanaRandomElement = 1,
			ReportValues = {
			--	GivenRandomElement = "FlipTheArcanaRandomElement",
			ReportedRoomsPerElement = "Amount",
			},
		},
		CurrentRoom = 0,
		ExtractValues = { 
            {
                Key = "ReportedRoomsPerElement",
			    ExtractAs = "TooltipRoomInterval",
            } 
        },
    },
	ReversedRandomCardsMetaUpgrade = {
        Name = "ReversedRandomCardsMetaUpgrade",
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
		FlipTheArcanaRandomCards = {BaseValue = 1},
		ExtractValues = 
		{
			{
				Key = "FlipTheArcanaRandomCards",
				ExtractAs = "Count",
				IncludeSigns = true,
			},
		},
    },
	ReversedAdditionalOmegaChanceMetaUpgrade = {
        Name = "ReversedAdditionalOmegaChanceMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{

			Common =
			{
				Multiplier = 1.7,
			},
			Rare =
			{
				Multiplier = 2.0,
			},
			Epic =
			{
				Multiplier = 2.3,
			},
			Heroic =
			{
				Multiplier = 2.6,
			},
		},
		
		ReportedChance = {BaseValue = 0.1}, --Best to update this seperately
		ChargeStageModifiersArray = {
			{
				ValidWeapons = WeaponSets.HeroPrimarySecondaryWeapons, --{"WeaponTorch"},
				InvalidWeapon = 
				{
					WeaponName = "WeaponTorchSpecial",
				},
				ExWeapons = true,
				AddWeaponProperties = 
				{
					AdditionalProjectileWaveChance = {BaseValue = 0.1},
					ProjectileWaveInterval = 0.2,
				},
			},
		},
		PropertyChanges = {
			{
				WeaponNames = 
				{
	"WeaponStaffSwing5",
	"WeaponDagger5",
	--"WeaponTorch",
	--"WeaponAxeSpin",
	--"WeaponLobChargedPulse",
	--"WeaponSuitCharged",
				},
				ExcludeLinked = true,
				WeaponProperty = "AdditionalProjectileWaveChance",
				BaseValue = 0.1,
			},
		},
		ExtractValues = 
		{
			{
				Key = "ReportedChance",
				ExtractAs = "DoubleChance",
				Format = "LuckModifiedPercent",
			},
		},
    },
	ReversedFreeOmegaMetaUpgrade = {
        Name = "ReversedFreeOmegaMetaUpgrade",
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
		FlipTheArcanaFreeOmegas = {BaseValue = 1},
		OnWeaponFiredFunctions =
		{
			WeaponNames = WeaponSets.HeroAllWeapons,
			FunctionName = _PLUGIN.guid..".IncreaseOmegaCount",
			FunctionArgs =
			{
				IsEx = true,
			},
		},
		ExtractValues = 
		{
			{
				Key = "FlipTheArcanaFreeOmegas",
				ExtractAs = "Count",
				IncludeSigns = false,
			},
		},
    },
	ReversedMoreSacrificesMetaUpgrade = {
        Name = "ReversedMoreSacrificesMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{

			Common =
			{
				Multiplier = 0.5,
			},
			Rare =
			{
				Multiplier = 1,
			},
			Epic =
			{
				Multiplier = 1.5,
			},
			Heroic =
			{
				Multiplier = 2,
			},
		},
		ExchangeLevelBonus = 1,
		FlipTheArcanaBonusSacrificeChance = {BaseValue = 0.1}, 
		ExtractValues = 
		{

			{
				Key = "ExchangeLevelBonus",
				ExtractAs = "Count",
				IncludeSigns = true,
			},
			{
				Key = "FlipTheArcanaBonusSacrificeChance",
				ExtractAs = "BonusChance",
				Format = "Percent",
			},
		},
    },
	ReversedFirstHitTransformMetaUpgrade = {
        Name = "ReversedFirstHitTransformMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{
			Common =
			{
				Multiplier = 40,
			},
			Rare =
			{
				Multiplier = 45,
			},
			Epic =
			{
				Multiplier = 50,
			},
			Heroic =
			{
				Multiplier = 55,
			},
		},
        OnEnemyDamagedAction =
		{
			FunctionName = _PLUGIN.guid..".FirstHitPolymorph",
			Args = 
			{
				Chance = {BaseValue = 0.01},
				Duration = 2,
				ReportValues = { ReportedChance = "Chance",
			ReportedDuration = "Duration"},
			}
		},
        ExtractValues = 
		{
			{
				Key = "ReportedChance",
				ExtractAs = "Chance",
				Format = "Percent",
				HideSigns = true,
			},
			{
				--[[External = true,
				BaseType = "EffectData",
				BaseName = "PolymorphTag",
				BaseProperty = "Duration",]]
				Format = "Duration",
				Key = "ReportedDuration",
				ExtractAs = "PolymorphDuration",
				SkipAutoExtract = true,
			},
			{
				External = true,
				BaseType = "ProjectileBase",
				BaseName = "MorphDamageProjectile",
				BaseProperty = "Damage",
				ExtractAs = "PolymorphDamage",
				SkipAutoExtract = true,
			},
        }
    },
	ReversedUniqueGodMetaUpgrade = {
        Name = "ReversedUniqueGodMetaUpgrade",
		CustomTrayText = "ReversedUniqueGodMetaUpgrade_Tray",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{
			Common =
			{
				Multiplier = 4/3,
			},
			Rare =
			{
				Multiplier = 6/3,
			},
			Epic =
			{
				Multiplier = 8/3,
			},
			Heroic =
			{
				Multiplier = 10/3,
			},
		},
        AddOutgoingDamageModifiers =
		{
			PerUniqueGodMultiplier =
				{
					BaseValue = 1.03,
					SourceIsMultiplier = true,
				},
				ReportValues = { ReportedMultiplier = "PerUniqueGodMultiplier"}
		},
        ExtractValues = 
		{
			{
				Key = "ReportedMultiplier",
				ExtractAs = "OlympianMultiplier",
				Format = "PercentDelta",
			},
			{
				Key = "ReportedMultiplier",
				ExtractAs = "TotalOlympianMultiplier",
				Format = "UniqueGodPercentDelta",
				SkipAutoExtract = true
			},
		},
	},
	ReversedRiposteKillMetaUpgrade = {
        Name = "ReversedRiposteKillMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{

			Common =
			{
				Multiplier = 1,
			},
			Rare =
			{
				Multiplier = 3,
			},
			Epic =
			{
				Multiplier = 5,
			},
			Heroic =
			{
				Multiplier = 7,
			},
		},
		OnWeaponFiredFunctions = 
		{
			ValidWeapons = CombineTables( WeaponSets.HeroPrimarySecondaryWeapons, {"WeaponTransformAttack","WeaponTransformSpecial", } ),
			FunctionName = _PLUGIN.guid..".CheckDaggerCritCharges",
		},
		OnProjectileDeathFunction = 
		{
			Name = _PLUGIN.guid..".RemoveCritVolley",
		},
		
			FlipTheArcanaValidVolleyChance = 0.35,
		OnEnemyDeathFunction = 
		{
			Name = _PLUGIN.guid .. ".SetupArtemisDaggerTicks",
			FunctionArgs = 
			{
				CritCount = {BaseValue = 1},
                ReportValues = { ReportedCount = "CritCount" }
			},
		},
		ExtractValues = 
		{
			{
				Key = "ReportedCount",
				ExtractAs = "Count",
			},
			{
				Key = "FlipTheArcanaValidVolleyChance",
				ExtractAs = "CritChance",
				SkipAutoExtract = true,
				Format = "LuckModifiedPercent",
			},
		},
    },
	ReversedDDRefillBiomeStartMetaUpgrade = {
		Name = "ReversedDDRefillBiomeStartMetaUpgrade",
		CustomTrayText = "ReversedDDRefillBiomeStartMetaUpgrade_Tray",
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
			}
		},
		FlipTheArcanaDDRestored = {BaseValue = 1},
		ExtractValues =
		{
			{
				Key = "FlipTheArcanaDDRestored",
				ExtractAs = "RestoredDefiances",
			},
			{
				External = true,
				BaseType = "HeroData",
				BaseName = "LastStandData",
				BaseProperty = "Heal",
				Format = "Percent",
				ExtractAs = "LastStandHeal",
				SkipAutoExtract = true,
			},
		}
	},
	ReversedHealthWithBoonsMetaUpgrade = {
        Name = "ReversedHealthWithBoonsMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{

			Common =
			{
				Multiplier = 4,
			},
			Rare =
			{
				Multiplier = 7,
			},
			Epic =
			{
				Multiplier = 10,
			},
			Heroic =
			{
				Multiplier = 13,
			},
		},
		FlipTheArcanaHealthWithBoons = {BaseValue = 1}, 
		ExtractValues = 
		{

			{
				Key = "FlipTheArcanaHealthWithBoons",
				ExtractAs = "MaxHealth",
				IncludeSigns = true,
			},
		},
    },
	ReversedRandomSacrificeMetaUpgrade = {
        Name = "ReversedRandomSacrificeMetaUpgrade",
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
		FlipTheArcanaRandomSacrificeChance = {BaseValue = 0.01}, 
		ExchangeLevelBonus = 1,
		ExtractValues = 
		{
			{
				Key = "FlipTheArcanaRandomSacrificeChance",
				ExtractAs = "Chance",
				Format = "Percent",
				IncludeSigns = true,
			},
			{
				Key = "ExchangeLevelBonus",
				ExtractAs = "BonusLevel",
				IncludeSigns = true,
			},
		},
	},
	ReversedManaShieldMetaUpgrade = {
        Name = "ReversedManaShieldMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{

			Common =
			{
				Multiplier = 1,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2,
			},
			Heroic =
			{
				Multiplier = 2.5,
			},
		},
		FlipTheArcanaManaShieldData = 
		{
			DamageBlocked = {BaseValue = 0.1},					--Percent of damage that is redirected
			ManaPerDamageBlocked =	15,							-- Amount of mana burned per damage blocked
			ReportValues = 
			{ 
				ReportedDamageBlocked = "DamageBlocked",
				ReportedManaConversion = "ManaPerDamageBlocked",
			}
		},
		ExtractValues = 
		{
			{
				Key = "ReportedManaConversion",
				ExtractAs = "TooltipManaConversion",
			},
			{
				Key = "ReportedDamageBlocked",
				ExtractAs = "TooltipDamageBlocked",
				Format = "Percent",
				SkipAutoExtract = true,
			},
		},
    },
	ReversedFountainGoldMetaUpgrade = {
        Name = "ReversedFountainGoldMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{

			Common =
			{
				Multiplier = 70,
			},
			Rare =
			{
				Multiplier = 80,
			},
			Epic =
			{
				Multiplier = 90,
			},
			Heroic =
			{
				Multiplier = 100,
			},
		},
		FlipTheArcanaFountainGold = {BaseValue = 1}, 
		ExtractValues = 
		{
			{
				Key = "FlipTheArcanaFountainGold",
				ExtractAs = "FountainGold",
				IncludeSigns = true,
			},
		},
	},
	ReversedCursedLegendaryBoostMetaUpgrade = {
        Name = "ReversedCursedLegendaryBoostMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{

			Common =
			{
				Multiplier = 1.34,
			},
			Rare =
			{
				Multiplier = 1.67,
			},
			Epic =
			{
				Multiplier = 2.00,
			},
			Heroic = 
			{
				Multiplier = 2.34,
			}
		},
		RarityBonus =
		{
			Rare = -0.35,
			Epic = -0.35,
			--Epic = { BaseValue = 0.20 },
			--Duo = { BaseValue = 0.50 },
			--Legendary = { BaseValue = 0.10 },
			ReportValues = { ReportedRarityBonus = "Rare"}			
		},
		MultiplicativeRarityBonus = 
		{
			Legendary = { BaseValue = 1.3, SourceIsMultiplier = true },
			ReportValues = { ReportedLegendaryBonus = "Legendary"}
		},
		ExtractValues = 
		{
			{
				Key = "ReportedRarityBonus",
				ExtractAs = "RarityBonus",
				Format = "Percent",
				IncludeSigns = true,
			},
			{
				Key = "ReportedLegendaryBonus",
				ExtractAs = "LegendaryBonus",
				Format = "PercentDelta",
			},
		},
	},
	ReversedBossResistanceMetaUpgrade = {
        Name = "ReversedBossResistanceMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{

			Common =
			{
				Multiplier = 0.2/0.1,
			},
			Rare =
			{
				Multiplier = 0.3/0.1,
			},
			Epic =
			{
				Multiplier = 0.4/0.1,
			},
			Heroic = 
			{
				Multiplier = 0.5/0.1,
			}
		},
		AddIncomingDamageModifiers =
		{
			HealthOnly = true,
			BossDamageMultiplier = {BaseValue = 0.90, SourceIsMultiplier = true},
			ReportValues = { ReportedResistance = "BossDamageMultiplier" }
		},
		ExtractValues = 
		{
			{
				Key = "ReportedResistance",
				ExtractAs = "Defense",
				Format = "FlatPercentDelta",
			},
		},
	},
	ReversedRandomBuildMetaUpgrade = {
        Name = "ReversedRandomBuildMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{

			Common =
			{
				Multiplier = 5,
			},
			Rare =
			{
				Multiplier = 10,
			},
			Epic =
			{
				Multiplier = 15,
			},
			Heroic = 
			{
				Multiplier = 20,
			}
		},
		FlipTheArcanaRandomCardsDrawn = {BaseValue = 1},
		ExtractValues = 
		{
			{
				Key = "FlipTheArcanaRandomCardsDrawn",
				ExtractAs = "Count",
			},
		},
	},
	ReversedProtectionCooldownMetaUpgrade = {
        Name = "ReversedProtectionCooldownMetaUpgrade",
        InheritFrom = { "MetaUpgradeTrait" },
        RarityLevels =
		{
			Common =
			{
				Multiplier = 30,
			},
			Rare =
			{
				Multiplier = 25,
			},
			Epic =
			{
				Multiplier = 20,
			},
			Heroic =
			{
				Multiplier = 15,
			},
		},
        FlipTheArcanaUnyieldingCooldown = {BaseValue = 1},
		SetupFunction = {
			Name = _PLUGIN.guid..".SetupUnyielding",
			Threaded = true,
		},
        ExtractValues = 
		{
			{
				Key = "FlipTheArcanaUnyieldingCooldown",
				ExtractAs = "Cooldown",
			},
		},
	},
}

for newMetaUpgradeTraitName, newMetaUpgradeTraitData in pairs(NewMetaUpgradeTraitData) do
    game.ProcessDataInheritance(newMetaUpgradeTraitData, game.TraitData)
    game.TraitData[newMetaUpgradeTraitName]=newMetaUpgradeTraitData
end
