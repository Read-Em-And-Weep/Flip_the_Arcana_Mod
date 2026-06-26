local GUIFile = rom.path.combine(rom.paths.Content(), "Game\\Animations\\GUI_Screens_VFX.sjson")

local newCardArtOrder = {
    "Name",
    "InheritFrom",
    "FilePath",
    "Scale",
    "Offset",
	"ChildAnimation",
	"Duration",
		"StartAlpha",
		"EndAlpha",
		"PingPongColor",
		"EaseIn",
		"EaseOut",
		"NumFrames",
		"Loop",
		"Material",
		"RandomStartFrame",
		"ReRandomizeOnLoop",
		"PlaySpeed",
}

local newCardArtData = {
	{
		Name = "FlipTheArcanaDevCard_EquippedHighlight",
		InheritFrom = "DevCard",
		FilePath = _PLUGIN.guid .. "NewCardArt\\CardEquippedHighlighta",
		Scale = 0.281,
		ChildAnimation = "FlipTheArcanaCardEquippedHighlightBorder",
		Duration = 3,
		StartAlpha = 1,
		EndAlpha = 0.5,
		PingPongColor = true,
		EaseIn = 0,
		EaseOut = 1,
		Loop = true
	},
	{
		Name = "FlipTheArcanaCardEquippedHighlightBorder",
		FilePath = _PLUGIN.guid .. "NewCardArt\\CardEquippedHighlight\\CardEquippedHighlight",
		NumFrames = 45,
		Loop = true,
		Material = "Unlit",
		RandomStartFrame = true,
		ReRandomizeOnLoop = false,
		PlaySpeed = 30,
		Scale = 0.84,
	},
{
    Name = "FlippedCardArt_01",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\1._Bloodlust"
},
{
    Name = "FlippedCardArt_01_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\1._Bloodlust_inactive"
},
{
    Name = "FlippedCardArt_03",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\3._Performance"
},
{
    Name = "FlippedCardArt_03_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\3._Performance_inactive"
},
{
    Name = "FlippedCardArt_04",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\4._The_Hydra"
},
{
    Name = "FlippedCardArt_04_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\4._The_Hydra_inactive"
},
{
    Name = "FlippedCardArt_06",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\6._The_Gorgon"
},
{
    Name = "FlippedCardArt_06_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\6._The_Gorgon_inactive"
},
{
    Name = "FlippedCardArt_07",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\7._The_Hearth"
},
{
    Name = "FlippedCardArt_07_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\7._The_Hearth_inactive"
},
{
    Name = "FlippedCardArt_08",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\8._The_Blacksmith"
},
{
    Name = "FlippedCardArt_08_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\8._The_Blacksmith_inactive"
},
{
    Name = "FlippedCardArt_09",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\9._Bounty"
},
{
    Name = "FlippedCardArt_09_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\9._Bounty_inactive"
},
{
    Name = "FlippedCardArt_10",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\10._Retribution"
},
{
    Name = "FlippedCardArt_10_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\10._Retribution_inactive"
},
{
    Name = "FlippedCardArt_11",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\11._The_Cyclops"
},
{
    Name = "FlippedCardArt_11_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\11._The_Cyclops_inactive"
},
{
    Name = "FlippedCardArt_15",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\15._Beauty"
},
{
    Name = "FlippedCardArt_15_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\15._Beauty_inactive",
},
{
    Name = "FlippedCardArt_02",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\2._The_Faithful_Daughter_"
},
{
    Name = "FlippedCardArt_02_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\2._The_Faithful_Daughter_inactive",
},
{
    Name = "FlippedCardArt_05",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\5._The_Loyal_Protector"
},
{
    Name = "FlippedCardArt_05_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\5._The_Loyal_Protector_inactive",
},
{
    Name = "FlippedCardArt_13",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\13._The_Wanderer"
},
{
    Name = "FlippedCardArt_13_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\13._The_Wanderer_inactive",
},
{
    Name = "FlippedCardArt_14",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\14._The_Strategist"
},
{
    Name = "FlippedCardArt_14_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\14._The_Strategist_inactive",
},
{
    Name = "FlippedCardArt_12",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\12._Sleep"
},
{
    Name = "FlippedCardArt_12_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\12._Sleep_inactive",
},
{
    Name = "FlippedCardArt_16",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\16._Strife"
},
{
    Name = "FlippedCardArt_16_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\16._Strife_inactive",
},
{
    Name = "FlippedCardArt_17",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\17._The_Weaver"
},
{
    Name = "FlippedCardArt_17_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\17._The_Weaver_inactive",
},
{
    Name = "FlippedCardArt_18",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\18._Longing"
},
{
    Name = "FlippedCardArt_18_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\18._Longing_inactive",
},
{
    Name = "FlippedCardArt_19",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\19._Famine"
},
{
    Name = "FlippedCardArt_19_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\19._Famine_inactive",
},
{
    Name = "FlippedCardArt_20",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\20._Companionship"
},
{
    Name = "FlippedCardArt_20_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\20._Companionship_inactive",
},
{
    Name = "FlippedCardArt_21",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\21._Doom"
},
{
    Name = "FlippedCardArt_21_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\21._Doom_inactive",
},
{
    Name = "FlippedCardArt_22",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\22._Revelry"
},
{
    Name = "FlippedCardArt_22_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\22._Revelry_inactive",
},
{
    Name = "FlippedCardArt_23",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\23._Futility"
},
{
    Name = "FlippedCardArt_23_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\23._Futility_inactive",
},
{
    Name = "FlippedCardArt_24",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\24._Encouragement"
},
{
    Name = "FlippedCardArt_24_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\24._Encouragement_inactive",
},
{
    Name = "FlippedCardArt_25",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\25._Monstrosity"
},
{
    Name = "FlippedCardArt_25_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\25._Monstrosity_inactive",
},
{
    Name = "FlippedCardArt_Greed",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Greed_Active"
},
{
    Name = "FlippedCardArt_Greed_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Greed_Inactive",
},
{
    Name = "FlippedCardArt_Beloved_Child",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Beloved_Child_Active"
},
{
    Name = "FlippedCardArt_Beloved_Child_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Beloved_Child_Inactive",
},
{
    Name = "FlippedCardArt_Trapper",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Trapper_Active"
},
{
    Name = "FlippedCardArt_Trapper_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Trapper_Inactive",
},
{
    Name = "FlippedCardArt_Sky",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Sky_Active"
},
{
    Name = "FlippedCardArt_Sky_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Sky_Inactive",
},
{
    Name = "FlippedCardArt_Witch",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Witch_Active"
},
{
    Name = "FlippedCardArt_Witch_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Witch_Inactive",
},
{
    Name = "FlippedCardArt_Sirens",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Sirens_Active"
},
{
    Name = "FlippedCardArt_Sirens_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Sirens_Inactive",
},
{
    Name = "FlippedCardArt_Curiousity",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Curiousity_Active"
},
{
    Name = "FlippedCardArt_Curiousity_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Curiousity_Inactive",
},
{
    Name = "FlippedCardArt_Automaton",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Automaton_Active"
},
{
    Name = "FlippedCardArt_Automaton_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Automaton_Inactive",
},
{
    Name = "FlippedCardArt_Shades",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Shades_Active"
},
{
    Name = "FlippedCardArt_Shades_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Shades_Inactive",
},
{
    Name = "FlippedCardArt_Hatred",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Hatred_Active"
},
{
    Name = "FlippedCardArt_Hatred_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Hatred_Inactive",
},
{
    Name = "FlippedCardArt_Heroine",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Heroine_Active"
},
{
    Name = "FlippedCardArt_Heroine_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Heroine_Inactive",
},
{
    Name = "FlippedCardArt_Idolation",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Idolation_Active"
},
{
    Name = "FlippedCardArt_Idolation_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Idolation_Inactive",
},
{
    Name = "FlippedCardArt_Seer",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Seer_Active"
},
{
    Name = "FlippedCardArt_Seer_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Seer_Inactive",
},
{
    Name = "FlippedCardArt_Dawn",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Dawn_Active"
},
{
    Name = "FlippedCardArt_Dawn_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Dawn_Inactive",
},
{
    Name = "FlippedCardArt_Metamorphosis",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Metamorphosis_Active"
},
{
    Name = "FlippedCardArt_Metamorphosis_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Metamorphosis_Inactive",
},
{
    Name = "FlippedCardArt_Youth",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Youth_Active"
},
{
    Name = "FlippedCardArt_Youth_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Youth_Inactive",
},
{
    Name = "FlippedCardArt_Winds",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Winds_Active"
},
{
    Name = "FlippedCardArt_Winds_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Winds_Inactive",
},
{
    Name = "FlippedCardArt_Sun",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Sun_Active"
},
{
    Name = "FlippedCardArt_Sun_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Sun_Inactive",
},
{
    Name = "FlippedCardArt_Elegance",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Elegance_Active"
},
{
    Name = "FlippedCardArt_Elegance_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Elegance_Inactive",
},
{
    Name = "FlippedCardArt_Flight",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Flight_Active"
},
{
    Name = "FlippedCardArt_Flight_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Flight_Inactive",
},
{
    Name = "FlippedCardArt_Discipline",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Discipline_Active"
},
{
    Name = "FlippedCardArt_Discipline_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Discipline_Inactive",
},
{
    Name = "FlippedCardArt_Burden",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Burden_Active"
},
{
    Name = "FlippedCardArt_Burden_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Burden_Inactive",
},
{
    Name = "FlippedCardArt_Heir",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Heir_Active"
},
{
    Name = "FlippedCardArt_Heir_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Heir_Inactive",
},
{
    Name = "FlippedCardArt_Cunning",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Cunning_Active"
},
{
    Name = "FlippedCardArt_Cunning_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Cunning_Inactive",
},
{
    Name = "FlippedCardArt_Isolation",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Isolation_Active"
},
{
    Name = "FlippedCardArt_Isolation_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Isolation_Inactive",
},
{
    Name = "FlippedCardArt_Muses",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Muses_Active"
},
{
    Name = "FlippedCardArt_Muses_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Muses_Inactive",
},
{
    Name = "FlippedCardArt_Soul",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Soul_Active"
},
{
    Name = "FlippedCardArt_Soul_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Soul_Inactive",
},
{
    Name = "FlippedCardArt_Sculptor",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Sculptor_Active"
},
{
    Name = "FlippedCardArt_Sculptor_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Sculptor_Inactive",
},
{
    Name = "FlippedCardArt_Duty",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Duty_Active"
},
{
    Name = "FlippedCardArt_Duty_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Duty_Inactive",
},
{
    Name = "FlippedCardArt_Coven",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Coven_Active"
},
{
    Name = "FlippedCardArt_Coven_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Coven_Inactive",
},
{
    Name = "FlippedCardArt_Tides",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Tides_Active"
},
{
    Name = "FlippedCardArt_Tides_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Tides_Inactive",
},
{
    Name = "FlippedCardArt_Mockery",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Mockery_Active"
},
{
    Name = "FlippedCardArt_Mockery_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Mockery_Inactive",
},
{
    Name = "FlippedCardArt_Labyrinth",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Labyrinth_Active"
},
{
    Name = "FlippedCardArt_Labyrinth_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Labyrinth_Inactive",
},
{
    Name = "FlippedCardArt_Warrioresses",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Warrioresses_Active"
},
{
    Name = "FlippedCardArt_Warrioresses_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Warrioresses_Inactive",
},
{
    Name = "FlippedCardArt_Wild",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Wild_Active"
},
{
    Name = "FlippedCardArt_Wild_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Wild_Inactive",
},
{
    Name = "FlippedCardArt_Sacrifice",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Sacrifice_Active"
},
{
    Name = "FlippedCardArt_Sacrifice_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Sacrifice_Inactive",
},
{
    Name = "FlippedCardArt_Earth",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Earth_Active"
},
{
    Name = "FlippedCardArt_Earth_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Earth_Inactive",
},
{
    Name = "FlippedCardArt_Ruse",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Ruse_Active"
},
{
    Name = "FlippedCardArt_Ruse_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Ruse_Inactive",
},
{
    Name = "FlippedCardArt_Beasts",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Beasts_Active"
},
{
    Name = "FlippedCardArt_Beasts_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Beasts_Inactive",
},
{
    Name = "FlippedCardArt_Victory",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Victory_Active"
},
{
    Name = "FlippedCardArt_Victory_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Victory_Inactive",
},
{
    Name = "FlippedCardArt_Prophet",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Prophet_Active"
},
{
    Name = "FlippedCardArt_Prophet_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Prophet_Inactive",
},
{
    Name = "FlippedCardArt_King",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\King_Active"
},
{
    Name = "FlippedCardArt_King_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\King_Inactive",
},
{
    Name = "FlippedCardArt_Titaness",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Titaness_Active"
},
{
    Name = "FlippedCardArt_Titaness_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Titaness_Inactive",
},
{
    Name = "FlippedCardArt_Farewell",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Farewell_Active"
},
{
    Name = "FlippedCardArt_Farewell_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Farewell_Inactive",
},
{
    Name = "FlippedCardArt_Physician",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Physician_Active"
},
{
    Name = "FlippedCardArt_Physician_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Physician_Inactive",
},
{
    Name = "FlippedCardArt_Temptation",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Temptation_Active"
},
{
    Name = "FlippedCardArt_Temptation_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Temptation_Inactive",
},
{
    Name = "FlippedCardArt_Garden",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Garden_Active"
},
{
    Name = "FlippedCardArt_Garden_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Garden_Inactive",
},
{
    Name = "FlippedCardArt_Fortune",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Fortune_Active"
},
{
    Name = "FlippedCardArt_Fortune_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Fortune_Inactive",
},
{
    Name = "FlippedCardArt_Regret",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Regret_Active"
},
{
    Name = "FlippedCardArt_Regret_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Regret_Inactive",
},
{
    Name = "FlippedCardArt_Betrayal",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Betrayal_Active"
},
{
    Name = "FlippedCardArt_Betrayal_Inactive",
    InheritFrom = "CardArt_01",
    FilePath = _PLUGIN.guid .. "NewCardArt\\Betrayal_Inactive",
},
{
    Name = "Inactive_Card_Icon",
    InheritFrom = "BoonSymbolBase",
    FilePath = _PLUGIN.guid .. "NewCardArt\\MonstrosityCardDrawIcon",
    Scale = 0.68,
	OffsetY = -1,
},

}

sjson.hook(GUIFile, function(data)
    for _, newCardArt in ipairs(newCardArtData) do
        table.insert(data.Animations, sjson.to_object(newCardArt, newCardArtOrder))
    end
end)

local newTraitBoonIconsData = {
    {
		Name = "MiniMonstrosityTraitTrayIcon",
		InheritFrom = "BoonIcon",
		FilePath = _PLUGIN.guid .. "NewCardArt\\MonstrosityHUDIcon",
        Scale = 1.45
	},
}

local boonGUIFile =  rom.path.combine(rom.paths.Content(), "Game\\Animations\\GUI_Boons_VFX.sjson")

sjson.hook(boonGUIFile, function(data)
    for _, newBoonArt in ipairs(newTraitBoonIconsData) do
        table.insert(data.Animations, sjson.to_object(newBoonArt, newCardArtOrder))
    end
end)


for traitName, traitData in pairs( TraitData ) do
		traitData.Name = traitName
		ProcessDataInheritance( traitData, TraitData )
		local autoExpandProperties = 
		{
			WeaponProperties = "WeaponProperty",
			ProjectileProperties = "ProjectileProperty",
			EffectProperties = "EffectProperty",
		}

		if traitData.PropertyChanges ~= nil and not traitData.ExpandedProperties then
			local addlPropertyChanges = {}
			for k, propertyChange in pairs( traitData.PropertyChanges ) do
				for expandFromName, expandToName in pairs(autoExpandProperties) do 					
					if propertyChange[expandFromName] then
						for property, changeValue in pairs( propertyChange[expandFromName]) do
							if property ~= "ReportValues" then
								local newPropertyChange = ShallowCopyTable(propertyChange)
								for autoExpandPropertyName in pairs( autoExpandProperties ) do
									newPropertyChange[autoExpandPropertyName] = nil
								end
								newPropertyChange[expandToName] = property
								newPropertyChange.ChangeValue = changeValue
								newPropertyChange.ChangeType = "Absolute"
								if propertyChange[expandFromName].ReportValues then
									for reportKey, reportSourceName in pairs(propertyChange[expandFromName].ReportValues) do 
										if reportSourceName == property then
											newPropertyChange.ReportValues = {}
											newPropertyChange.ReportValues[reportKey] = "ChangeValue"
										end
									end
								end
								table.insert(addlPropertyChanges, newPropertyChange )
							end
						end
					end
				end
				if propertyChange.SpeedPropertyChanges then
					local weaponNames = ShallowCopyTable( propertyChange.WeaponNames )
					if weaponNames == nil then
						weaponNames = { propertyChange.WeaponName }
					end
					for q, weaponName in pairs(weaponNames) do
					
						local newPropertyChanges = DeepCopyTable(WeaponData.DefaultWeaponValues.DefaultSpeedPropertyChanges)
						if WeaponData[weaponName] and WeaponData[weaponName].SpeedPropertyChanges then
							newPropertyChanges = DeepCopyTable( WeaponData[weaponName].SpeedPropertyChanges)
						end
						for s, newPropertyChange in pairs(newPropertyChanges) do
							newPropertyChange = MergeTables( newPropertyChange, propertyChange )
							newPropertyChange.WeaponNames = nil
							newPropertyChange.WeaponName = weaponName
							newPropertyChange.ChangeType = "Multiply"
							if newPropertyChange.InvertSource then
								if newPropertyChange.ChangeValue then
									newPropertyChange.ChangeValue = 1 / newPropertyChange.ChangeValue
								end
								if newPropertyChange.BaseValue then
									newPropertyChange.BaseValue = 1 / newPropertyChange.BaseValue
								end
							end
							newPropertyChange.SpeedPropertyChanges = nil
							table.insert(addlPropertyChanges, newPropertyChange )
						end
					end
				end
			end
			if not IsEmpty(addlPropertyChanges) then
				ConcatTableValues( traitData.PropertyChanges, addlPropertyChanges )
				traitData.ExpandedProperties = true
			end
		end
		if not traitData.ExcludeLinked then
			if traitData.DamageOnFireWeapons and not traitData.DamageOnFireWeapons.ExcludeLinked then
				traitData.DamageOnFireWeapons.WeaponNames = AddLinkedWeapons( traitData.DamageOnFireWeapons.WeaponNames )
			end
			if traitData.AddOutgoingLifestealModifiers then
				if traitData.AddOutgoingLifestealModifiers.ValidWeapons then
					if not traitData.AddOutgoingLifestealModifiers.ExcludeLinked then
						traitData.AddOutgoingLifestealModifiers.ValidWeapons = AddLinkedWeapons( traitData.AddOutgoingLifestealModifiers.ValidWeapons )
					end
					traitData.AddOutgoingLifestealModifiers.ValidWeaponsLookup = ToLookup( traitData.AddOutgoingLifestealModifiers.ValidWeapons )
				end
			end
			if traitData.DamageClamps and traitData.DamageClamps.ValidProjectiles then
				traitData.DamageClamps.ValidProjectilesLookup = ToLookup( traitData.DamageClamps.ValidProjectiles )
			end
			if traitData.AddOutgoingDamageModifiers then
				if traitData.AddOutgoingDamageModifiers.ValidWeapons then
					if not traitData.AddOutgoingDamageModifiers.ExcludeLinked then
						traitData.AddOutgoingDamageModifiers.ValidWeapons = AddLinkedWeapons( traitData.AddOutgoingDamageModifiers.ValidWeapons )
					end
					traitData.AddOutgoingDamageModifiers.ValidWeaponsLookup = ToLookup( traitData.AddOutgoingDamageModifiers.ValidWeapons )
				end
				if traitData.AddOutgoingDamageModifiers.ValidProjectiles then
					traitData.AddOutgoingDamageModifiers.ValidProjectilesLookup = ToLookup( traitData.AddOutgoingDamageModifiers.ValidProjectiles )
				end
				if traitData.AddOutgoingDamageModifiers.ValidEnchantments and not traitData.AddOutgoingDamageModifiers.ExcludeLinked then
					for key, weaponNames in pairs(traitData.AddOutgoingDamageModifiers.ValidEnchantments.TraitDependentWeapons ) do
						traitData.AddOutgoingDamageModifiers.ValidEnchantments.TraitDependentWeapons[key] = AddLinkedWeapons( weaponNames )
					end

					if traitData.AddOutgoingDamageModifiers.ValidEnchantments.ValidWeapons then
						traitData.AddOutgoingDamageModifiers.ValidEnchantments.ValidWeapons = AddLinkedWeapons( traitData.AddOutgoingDamageModifiers.ValidEnchantments.ValidWeapons )
					end
				end
				if traitData.AddOutgoingDamageModifiers.EmptySlotValidData then
					for key, weaponNames in pairs(traitData.AddOutgoingDamageModifiers.EmptySlotValidData) do
						traitData.AddOutgoingDamageModifiers.EmptySlotValidData[key] = AddLinkedWeapons( weaponNames )
					end
				end
			end

			if traitData.AddOutgoingDamageModifiersArray then
				for i, data in pairs(traitData.AddOutgoingDamageModifiersArray) do
					if data.ValidWeapons then
						if not data.ExcludeLinked then
							data.ValidWeapons = AddLinkedWeapons( data.ValidWeapons )
						end
						data.ValidWeaponsLookup = ToLookup( data.ValidWeapons )
					end
					if data.ValidProjectiles then
						data.ValidProjectilesLookup = ToLookup( data.ValidProjectiles )
					end
					if data.ValidEnchantments and not data.ExcludeLinked then
						for key, weaponNames in pairs(data.ValidEnchantments.TraitDependentWeapons ) do
							data.ValidEnchantments.TraitDependentWeapons[key] = AddLinkedWeapons( weaponNames )
						end

						if data.ValidEnchantments.ValidWeapons then
							data.ValidEnchantments.ValidWeapons = AddLinkedWeapons( data.ValidEnchantments.ValidWeapons )
						end
					end
					if data.EmptySlotValidData then
						for key, weaponNames in pairs(data.EmptySlotValidData) do
							data.EmptySlotValidData[key] = AddLinkedWeapons( weaponNames )
						end
					end
				end
			end

			if traitData.AddOutgoingCritModifiers then
				if traitData.AddOutgoingCritModifiers.ValidWeapons then
					if not traitData.AddOutgoingCritModifiers.ExcludeLinked then
						traitData.AddOutgoingCritModifiers.ValidWeapons = AddLinkedWeapons( traitData.AddOutgoingCritModifiers.ValidWeapons )
					end
					traitData.AddOutgoingCritModifiers.ValidWeaponsLookup = ToLookup( traitData.AddOutgoingCritModifiers.ValidWeapons )
				end
				if traitData.AddOutgoingCritModifiers.ValidProjectiles then
					traitData.AddOutgoingCritModifiers.ValidProjectilesLookup = ToLookup( traitData.AddOutgoingCritModifiers.ValidProjectiles )
				end
			end
			if traitData.AddOutgoingDoubleDamageModifiers then
				if traitData.AddOutgoingDoubleDamageModifiers.ValidWeapons then
					if not traitData.AddOutgoingDoubleDamageModifiers.ExcludeLinked then
						traitData.AddOutgoingDoubleDamageModifiers.ValidWeapons = AddLinkedWeapons( traitData.AddOutgoingDoubleDamageModifiers.ValidWeapons )
					end
					traitData.AddOutgoingDoubleDamageModifiers.ValidWeaponsLookup = ToLookup( traitData.AddOutgoingDoubleDamageModifiers.ValidWeapons )
				end
			end
			
			if traitData.ChargeStageModifiers then
				if traitData.ChargeStageModifiers.ValidWeapons then
					if not traitData.ChargeStageModifiers.ExcludeLinked then
						traitData.ChargeStageModifiers.ValidWeapons = AddLinkedWeapons( traitData.ChargeStageModifiers.ValidWeapons )
					end
					traitData.ChargeStageModifiers.ValidWeaponsLookup = ToLookup( traitData.ChargeStageModifiers.ValidWeapons )
				end
			end
			
			if traitData.ChargeStageModifiersArray then
				for i, data in pairs( traitData.ChargeStageModifiersArray ) do
					if data.ValidWeapons then
						if not data.ExcludeLinked then
							data.ValidWeapons = AddLinkedWeapons( data.ValidWeapons )
						end
						data.ValidWeaponsLookup = ToLookup( data.ValidWeapons )
					end
				end
			end
			
			if traitData.OnWeaponChargeFunctions then
				if traitData.OnWeaponChargeFunctions.ValidWeapons then
					if not traitData.OnWeaponChargeFunctions.ExcludeLinked then
						traitData.OnWeaponChargeFunctions.ValidWeapons = AddLinkedWeapons( traitData.OnWeaponChargeFunctions.ValidWeapons )
					end
				end
			end
			if traitData.OnWeaponFiredFunctions then
				if traitData.OnWeaponFiredFunctions.ValidWeapons then
					if not traitData.OnWeaponFiredFunctions.ExcludeLinked then
						traitData.OnWeaponFiredFunctions.ValidWeapons = AddLinkedWeapons( traitData.OnWeaponFiredFunctions.ValidWeapons )
					end
					traitData.OnWeaponFiredFunctions.ValidWeaponsLookup = ToLookup( traitData.OnWeaponFiredFunctions.ValidWeapons )
				end
			end
			if traitData.OnWeaponChargeCanceledFunctions then
				if traitData.OnWeaponChargeCanceledFunctions.ValidWeapons then
					if not traitData.OnWeaponChargeCanceledFunctions.ExcludeLinked then
						traitData.OnWeaponChargeCanceledFunctions.ValidWeapons = AddLinkedWeapons( traitData.OnWeaponChargeCanceledFunctions.ValidWeapons )
					end
				end
			end
			if traitData.OnProjectileDeathFunction then
				if traitData.OnProjectileDeathFunction.ValidWeapons then
					if not traitData.OnProjectileDeathFunction.ExcludeLinked then
						traitData.OnProjectileDeathFunction.ValidWeapons = AddLinkedWeapons( traitData.OnProjectileDeathFunction.ValidWeapons )
					end
					traitData.OnProjectileDeathFunction.ValidWeaponsLookup = ToLookup( traitData.OnProjectileDeathFunction.ValidWeapons )
				end
				if traitData.OnProjectileDeathFunction.ValidProjectiles then
					traitData.OnProjectileDeathFunction.ValidProjectilesLookup = ToLookup( traitData.OnProjectileDeathFunction.ValidProjectiles )
				end
			end
			if traitData.OnProjectileCreationFunction then
				if traitData.OnProjectileCreationFunction.ValidProjectiles then
					traitData.OnProjectileCreationFunction.ValidProjectilesLookup = ToLookup( traitData.OnProjectileCreationFunction.ValidProjectiles )
				end
			end
			if traitData.OnEnemyDamagedAction then
				if traitData.OnEnemyDamagedAction.ValidWeapons then
					if not traitData.OnEnemyDamagedAction.ExcludeLinked then
						traitData.OnEnemyDamagedAction.ValidWeapons = AddLinkedWeapons( traitData.OnEnemyDamagedAction.ValidWeapons )
					end
					traitData.OnEnemyDamagedAction.ValidWeaponsLookup = ToLookup( traitData.OnEnemyDamagedAction.ValidWeapons )
				end
				if traitData.OnEnemyDamagedAction.ValidProjectiles then
					traitData.OnEnemyDamagedAction.ValidProjectilesLookup = ToLookup( traitData.OnEnemyDamagedAction.ValidProjectiles )
				end
				if traitData.OnEnemyDamagedAction.ExcludeProjectiles then
					traitData.OnEnemyDamagedAction.ExcludeProjectilesLookup = ToLookup( traitData.OnEnemyDamagedAction.ExcludeProjectiles )
				end
				if traitData.OnEnemyDamagedAction.Args then
					if traitData.OnEnemyDamagedAction.Args.TraitWeaponMappings then
						for traitName, weaponList in pairs ( traitData.OnEnemyDamagedAction.Args.TraitWeaponMappings ) do
							traitData.OnEnemyDamagedAction.Args.TraitWeaponMappings[traitName] = AddLinkedWeapons( weaponList )
						end
						traitData.OnEnemyDamagedAction.Args.TraitWeaponMappingsLookup = {}
						for traitName, weaponList in pairs ( traitData.OnEnemyDamagedAction.Args.TraitWeaponMappings ) do
							for i, weaponName in pairs( weaponList ) do
								traitData.OnEnemyDamagedAction.Args.TraitWeaponMappingsLookup[weaponName] = traitName
							end
						end
					end
					if traitData.OnEnemyDamagedAction.Args.MultihitWeaponWhitelist then
						if not traitData.OnEnemyDamagedAction.Args.ExcludeLinked then
							traitData.OnEnemyDamagedAction.Args.MultihitWeaponWhitelist = AddLinkedWeapons( traitData.OnEnemyDamagedAction.Args.MultihitWeaponWhitelist )
						end
						traitData.OnEnemyDamagedAction.Args.MultihitWeaponWhitelistLookup = ToLookup( traitData.OnEnemyDamagedAction.Args.MultihitWeaponWhitelist )
					end
					if traitData.OnEnemyDamagedAction.Args.MultihitProjectileWhitelist then
						traitData.OnEnemyDamagedAction.Args.MultihitProjectileWhitelistLookup = ToLookup( traitData.OnEnemyDamagedAction.Args.MultihitProjectileWhitelist )
					end
					if traitData.OnEnemyDamagedAction.Args.ValidProjectiles then
						traitData.OnEnemyDamagedAction.Args.ValidProjectilesLookup = ToLookup( traitData.OnEnemyDamagedAction.Args.ValidProjectiles )
					end
					if traitData.OnEnemyDamagedAction.Args.ValidEffectNames then
						traitData.OnEnemyDamagedAction.Args.ValidEffectNamesLookup = ToLookup( traitData.OnEnemyDamagedAction.Args.ValidEffectNames )
					end
				end
			end
		end
		if traitData.AddWeaponsToTraits and traitData.AddWeaponsToTraits.WeaponNames then
			if not traitData.AddWeaponsToTraits.ExcludeLinked then
				traitData.AddWeaponsToTraits.WeaponNames = AddLinkedWeapons( traitData.AddWeaponsToTraits.WeaponNames )
			end
			
			traitData.AddWeaponsToTraits.WeaponNamesLookup = ToLookup( traitData.AddWeaponsToTraits.WeaponNames )
		
		end
		if traitData.ManaCostModifiers and traitData.ManaCostModifiers.WeaponNames then	
			if not traitData.ManaCostModifiers.ExcludeLinked then
				traitData.ManaCostModifiers.WeaponNames = AddLinkedWeapons( traitData.ManaCostModifiers.WeaponNames )
			end
			
			traitData.ManaCostModifiers.WeaponNamesLookup = ToLookup( traitData.ManaCostModifiers.WeaponNames )
		end
		if traitData.WeaponSpeedMultiplier and traitData.WeaponSpeedMultiplier.WeaponNames then	
			if not traitData.WeaponSpeedMultiplier.ExcludeLinked then
				traitData.WeaponSpeedMultiplier.WeaponNames = AddLinkedWeapons( traitData.WeaponSpeedMultiplier.WeaponNames )
			end
			
			traitData.WeaponSpeedMultiplier.WeaponNamesLookup = ToLookup( traitData.WeaponSpeedMultiplier.WeaponNames )
		end
		if traitData.OnResourceMaxHealth then
			traitData.OnResourceMaxHealth.ResourceNamesLookup = ToLookup( traitData.OnResourceMaxHealth.ResourceNames )
		end
		if traitData.OnResourceMaxMana then
			traitData.OnResourceMaxMana.ResourceNamesLookup = ToLookup( traitData.OnResourceMaxMana.ResourceNames )
		end
		if traitData.WeaponDataOverride then
			for weaponName, weaponData in pairs(traitData.WeaponDataOverride) do

				if weaponData.Sounds ~= nil then
					for _, key in pairs ({"ChargeSounds", "ChargeStageSounds"}) do 
						if weaponData.Sounds[key] then
							for k, soundElement in pairs( weaponData.Sounds[key] ) do
								if soundElement.StoppedBy ~= nil then
									soundElement.StoppedByLookup = soundElement.StoppedByLookup or {}
									for k, eventName in pairs( soundElement.StoppedBy ) do
										soundElement.StoppedByLookup[eventName] = true
									end
								end
							end
						end
					end
				end
			end
		end
		local roomExitTraitKeys = 
		{
			DoorHeal = "CheckDoorHealTrait",
			DoorHealFixed = "CheckDoorHealTrait",
			DoorHealIgnorePenaltyFixed = "CheckDoorHealTrait",
			DoorFullHealThreshold = "CheckDoorHealTrait", 
			DoorHealThreshold = "CheckDoorHealTrait",
			DoorHealReserve = "CheckDoorHealTrait",
			DoorArmor = "CheckDoorArmorTrait",
			DoorCash = "CheckDoorGoldTrait",
		}

		for key, functionName in pairs(roomExitTraitKeys) do
			if traitData[key] then
				traitData.LeaveRoomFunctionName = functionName
			end
		end

		traitData.TraitOrderingValueCache = GetTraitOrderingValue( traitData )
	end

	local newObstacleData = {
		{
      Name = "FlipTheArcanaCard_EquippedHighlight",
      InheritFrom = "1_BaseGUIObstacle",
      DisplayInEditor = true,
      Thing =
      {
        EditorOutlineDrawBounds = false,
        Graphic = "FlipTheArcanaDevCard_EquippedHighlight",
      },
    }
	}
	local newObstacleOrder = {
		"Name",
		"InheritFrom",
		"DisplayInEditor",
		"Thing",
	}


local GUIFileObstacle = rom.path.combine(rom.paths.Content(), "Game\\Obstacles\\GUI.sjson")

	sjson.hook(GUIFileObstacle, function(data)
    for _, newCardArt in ipairs(newObstacleData) do
        table.insert(data.Obstacles, sjson.to_object(newCardArt, newObstacleOrder))
    end
end)
