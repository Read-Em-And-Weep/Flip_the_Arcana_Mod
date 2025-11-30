local newWorldUpgradeData = {
	ExtraArcanaWorldUpgradeCardFlip =
	{
		InheritFrom = { "DefaultHubItem", "DefaultCriticalItem" },
		Icon = "GUI\\Screens\\CriticalItemShop\\Icons\\cauldron_altar",
		Cost =
		{
			MetaFabric = 6,
			MixerFBoss = 1,
			MetaCardPointsCommon = 6,
			--Mixer5Common = 1,

		},
		GameStateRequirements =
		{
			{
                Path = { "GameState", "WorldUpgradesAdded"},
                HasAll = {"WorldUpgradeCardUpgradeSystem" },
            },
            {
				Path = { "GameState", "FamiliarsUnlocked" },
				HasAll = { "FrogFamiliar", "RavenFamiliar", "CatFamiliar", "HoundFamiliar", "PolecatFamiliar" },
			},
            {
				Path = { "GameState", "MetaUpgradeUnlockedCountCache" },
				Comparison = ">=",
				Value = 14,
			},
		},
		OfferedVoiceLines =
		{
			PreLineWait = 0.7,
			PlayOnce = true,
			TriggerCooldowns = { "MelCauldronSpellRevealedSpeech" },

			{ Cue = "/VO/Melinoe_3488", Text = "Our Altar can be purified..." },
		},
		IncantationVoiceLines =
		{
			{
				PreLineWait = 0.3,
				{ Cue = "/VO/Melinoe_3073", Text = "{#Emph}O Altar of Ashes beneath which I stand, \n {#Emph}Fulfill your purpose that I know firsthand." },
			},
		},
}
}

Incantations.addIncantation({
    Id = "ExtraArcanaWorldUpgradeCardFlip",
    Name = {
        en = "Expanding of the Deck"
    },
    Description = {
        en = "Enhance the {$Keywords.CardTable} so that you can flip your {$Keywords.CardPlural} using the same button you use to pin them, allowing access to a new set of {$Keywords.CardPlural} to unlock and upgrade."
    },
    FlavorText = {
        en = "The sufficiently experienced and well-traveled witch can look within herself and find more powers within her grasp."
    },
    WorldUpgradeData = {
        Icon = "GUI\\Screens\\CriticalItemShop\\Icons\\cauldron_altar",
		Cost =
		{
			MetaFabric = 6,
			MixerFBoss = 1,
			MetaCardPointsCommon = 6,
			--Mixer5Common = 1,

		},
        GameStateRequirements =
		{
			{
                Path = { "GameState", "WorldUpgradesAdded"},
                HasAll = {"WorldUpgradeCardUpgradeSystem" },
            },
            {
				Path = { "GameState", "FamiliarsUnlocked" },
				HasAll = { "FrogFamiliar", "RavenFamiliar", "CatFamiliar", "HoundFamiliar", "PolecatFamiliar" },
			},
    },
    IncantationVoiceLines =
		{
			{
				PreLineWait = 0.3,
				{ Cue = "/VO/Melinoe_3073", Text = "{#Emph}O Altar of Ashes beneath which I stand, \n {#Emph}Fulfill your purpose that I know firsthand." },
			},
		},
        RevealReactionVoiceLines = {
            { GlobalVoiceLines = "CauldronReactionVoiceLines" },
        },

    }
})