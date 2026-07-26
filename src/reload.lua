mod.MetaUpgradeDefaultCardLayout = {
    { "ChanneledCast",			"HealthRegen",			"LowManaDamageBonus",	"CastCount",			"SorceryRegenUpgrade", 	},
	{ "CastBuff",				"BonusHealth",			"BonusDodge",			"ManaOverTime",			"MagicCrit" 			},
	{ "SprintShield",			"LastStand",			"MaxHealthPerRoom",		"StatusVulnerability",	"ChanneledBlock" 		},
	{ "DoorReroll",				"StartingGold",			"MetaToRunUpgrade",		"RarityBoost", 			"BonusRarity" 			},
	{ "TradeOff",				"ScreenReroll",			"LowHealthBonus",		"EpicRarityBoost",		"CardDraw" 				},}
mod.setsAdded = 0
if config and config.EnableBlueCards then
	mod.setsAdded = mod.setsAdded + 1
	local newSet = { 
					{ "ReversedChanneledCast", "ReversedHealthRegen", "ReversedLowManaDamageBonus", "ReversedCastCount", "ReversedSorceryRegenUpgrade", },
					{ "ReversedCastBuff",      "ReversedBonusHealth",  "ReversedBonusDodge",         "ReversedManaOverTime",        "ReversedMagicCrit" },
					{ "ReversedSprintShield",  "ReversedLastStand",    "ReversedMaxHealthPerRoom",   "ReversedStatusVulnerability", "ReversedChanneledBlock" },
					{ "ReversedDoorReroll",    "ReversedStartingGold", "ReversedMetaToRunUpgrade",   "ReversedRarityBoost",         "ReversedBonusRarity" },
					{ "ReversedTradeOff",      "ReversedScreenReroll", "ReversedLowHealthBonus",     "ReversedEpicRarityBoost",     "ReversedCardDraw" }, }
	for row, rowData in ipairs(newSet) do
		table.insert(mod.MetaUpgradeDefaultCardLayout, rowData)
	end
end
if config and config.EnableVioletCards then
	mod.setsAdded = mod.setsAdded + 1
	local newSet = { 
			{ "ReversedDoorCashCard",		"ReversedManaPerRoomCard",		"ReversedLowHealthCrit",	"ReversedSturdyChannel",		"ReversedCharmedEnemy", 	},
			{ "ReversedCrowdDamage",		"ReversedSharedRunProgress",	"ReversedOlympianDamage",	"ReversedExtraPurchase",		"ReversedPomBiomeStart" 			},
			{ "ReversedStrongRush",			"ReversedRenewableDD",			"ReversedArmorPerRoom",		"ReversedStatusCrit",			"ReversedEncounterHeal" 		},
			{ "ReversedExtraFeatures",		"ReversedPerfectClearBoost",	"ReversedHeroicRarity",		"ReversedSacrificeForLevels", 	"ReversedGatherRarity" 			},
			{ "ReversedPerfectPower",		"ReversedUnFatedReward",		"ReversedFullDefiance",		"ReversedRandomBonusLevels",	"ReversedKeepsakeReAdd" 				},}
	for row, rowData in ipairs(newSet) do
		table.insert(mod.MetaUpgradeDefaultCardLayout, rowData)
	end
end
if config and config.EnableRedCards then
	mod.setsAdded = mod.setsAdded + 1
	local newSet = { { "ReversedCheaperChannel",			"ReversedPotentDefiance",			"ReversedBackstab",	"ReversedBonusTalent",				"ReversedSpellDamage", 	},
	{ "ReversedFirstHitTransform",				"ReversedHealthWithBoons",			"ReversedProjectileSlow",			"ReversedCursedLegendaryBoost",			"ReversedFreeOmega" 			},
	{ "ReversedDashRecovery",			"ReversedProtectionCooldown",			"ReversedElementRoom",	"ReversedUniqueGod",		"ReversedManaShield" 		},
	{ "ReversedRandomSacrifice",			"ReversedAdditionalOmegaChance",		"ReversedRiposteKill",	"ReversedRandomCards", 			"ReversedBossResistance" 			},
	{ "ReversedArtemisKeepsake",				"ReversedFountainGold",		"ReversedDDRefillBiomeStart",		"ReversedMoreSacrifices",			"ReversedRandomBuild" 				}, }
	for row, rowData in ipairs(newSet) do
		table.insert(mod.MetaUpgradeDefaultCardLayout, rowData)
	end
end




modutil.mod.Path.Wrap("UnequipMetaUpgradeBonusCardPresentation", function(base, screen, button)
    if (button == nil) then
        return
    else
        return base(screen,button)
    end
end)

modutil.mod.Path.Wrap("EquipMetaUpgradeBonusCardPresentation", function(base, screen, button)
    if (button == nil) then
        return
    else
        return base(screen,button)
    end
end)

function mod.InitializeMetaUpgradeState()
	for metaUpgradeName, initialData in pairs( MetaUpgradeCardData ) do
		if not GameState.MetaUpgradeState[metaUpgradeName] then
			GameState.MetaUpgradeState[metaUpgradeName] = {}
		end
		GameState.MetaUpgradeState[metaUpgradeName].Level = GameState.MetaUpgradeState[metaUpgradeName].Level or 1
		local maxLevel = #initialData.UpgradeResourceCost + 1
		if GameState.MetaUpgradeState[metaUpgradeName].Level > maxLevel then
			-- Undo bad mod (Wow SuperGiant, tell me how you really feel)
			GameState.MetaUpgradeState[metaUpgradeName].Level = maxLevel
		end
	end
end

 
modutil.mod.Path.Wrap("CreateMetaUpgradeCards", function(base, screen, cardArgs)
	base(screen, cardArgs)
	mod.InitializeMetaUpgradeState()
    GameState.FlipTheArcanaHasRun = GameState.FlipTheArcanaHasRun or false
    for metaUpgradeName in pairs(GameState.MetaUpgradeState) do
        if GameState.MetaUpgradeState[metaUpgradeName].Equipped and not MetaUpgradeCardData[metaUpgradeName].Flipped and not GameState.FlipTheArcanaHasRun then
            GameState.MetaUpgradeState[metaUpgradeName].Visible = true
        else
            GameState.MetaUpgradeState[metaUpgradeName].Visible = false
        end
	end
	for metaUpgradeName in pairs(GameState.MetaUpgradeState) do
    if not Incantations.isIncantationEnabled("ExtraArcanaWorldUpgradeCardFlip") then
		GameState.FlipTheArcanaHasRun = true
		return
	end
        if (GameState.MetaUpgradeState[metaUpgradeName].Visible and MetaUpgradeCardData[metaUpgradeName].Flipped and not GameState.FlipTheArcanaHasRun) then
            local row = MetaUpgradeCardData[metaUpgradeName].Row
            local column = MetaUpgradeCardData[metaUpgradeName].Column
            local buttonToFlip = screen.Components[GetMetaUpgradeKey(row, column)]
            mod.ReverseCardToCard(screen, buttonToFlip, metaUpgradeName, false, cardArgs)
        end
    end
    for row, rowData in pairs( mod.MetaUpgradeDefaultCardLayout ) do
		for column, cardName in pairs( rowData ) do
			if not GameState.FlipTheArcanaHasRun then
				if (GameState.MetaUpgradeState[cardName].Equipped) then
					row = MetaUpgradeCardData[cardName].Row
            		column = MetaUpgradeCardData[cardName].Column
            		local buttonToFlip = screen.Components[GetMetaUpgradeKey(row, column)]
            		mod.ReverseCardToCard(screen, buttonToFlip, cardName, false, cardArgs)
				end
			end
            GameState.MetaUpgradeState[cardName].Visible = true
        end
    end
	for row, rowData in pairs( GameState.MetaUpgradeCardLayout ) do
		for column, cardName in pairs( rowData ) do
            GameState.MetaUpgradeState[cardName].Visible = true
        end
    end
	if not GameState.FlipTheArcanaHasRun then
		GameState.FlipTheArcanaHasRun = true
		for metaUpgradeName in pairs(GameState.MetaUpgradeState) do
        if GameState.MetaUpgradeState[metaUpgradeName].Equipped and not MetaUpgradeCardData[metaUpgradeName].Flipped and not GameState.FlipTheArcanaHasRun then
            GameState.MetaUpgradeState[metaUpgradeName].Visible = true
        else
            GameState.MetaUpgradeState[metaUpgradeName].Visible = false
        end
	end
	for metaUpgradeName in pairs(GameState.MetaUpgradeState) do
    if not Incantations.isIncantationEnabled("ExtraArcanaWorldUpgradeCardFlip") then
		GameState.FlipTheArcanaHasRun = true
		return
	end
        if (GameState.MetaUpgradeState[metaUpgradeName].Visible and MetaUpgradeCardData[metaUpgradeName].Flipped and not GameState.FlipTheArcanaHasRun) then
            local row = MetaUpgradeCardData[metaUpgradeName].Row
            local column = MetaUpgradeCardData[metaUpgradeName].Column
            local buttonToFlip = screen.Components[GetMetaUpgradeKey(row, column)]
            mod.ReverseCardToCard(screen, buttonToFlip, metaUpgradeName, false, cardArgs)
        end
    end
    for row, rowData in pairs( mod.MetaUpgradeDefaultCardLayout ) do
		for column, cardName in pairs( rowData ) do
			if not GameState.FlipTheArcanaHasRun then
				if (GameState.MetaUpgradeState[cardName].Equipped) then
					row = MetaUpgradeCardData[cardName].Row
            		column = MetaUpgradeCardData[cardName].Column
            		local buttonToFlip = screen.Components[GetMetaUpgradeKey(row, column)]
            		mod.ReverseCardToCard(screen, buttonToFlip, cardName, false, cardArgs)
				end
			end
            GameState.MetaUpgradeState[cardName].Visible = true
        end
    end
	for row, rowData in pairs( GameState.MetaUpgradeCardLayout ) do
		for column, cardName in pairs( rowData ) do
            GameState.MetaUpgradeState[cardName].Visible = true
        end
    end
	end
    CheckAutoEquipCards(screen)
end)

modutil.mod.Path.Wrap("MetaUpgradeCardAction", function(base, screen, button)
    base(screen, button)
    if GameState.MetaUpgradeState[button.CardName].Enabled then
        GameState.MetaUpgradeState[button.CardName].Visible = true
    end
end)

modutil.mod.Path.Wrap("CreateNewHero", function(base, prevRun, args )
	GameState.FlipTheArcanaHasRun = false
	return base(prevRun, args)
end)


modutil.mod.Path.Wrap("DeathAreaRoomTransition", function(base, source, args)
    if not game.CurrentHubRoom then return base(source,args) end
    if game.CurrentHubRoom.Name == "Hub_PreRun" then
        GameState.FlipTheArcanaHasRun = false
    end
    for metaUpgradeName in pairs(GameState.MetaUpgradeState) do
        if GameState.MetaUpgradeState[metaUpgradeName].Visible == nil then
            if MetaUpgradeCardData[metaUpgradeName].Flipped then
                GameState.MetaUpgradeState[metaUpgradeName].Visible = false
				GameState.MetaUpgradeState[mod.GetFlippedCardName(metaUpgradeName)].Visible = true
            else
                GameState.MetaUpgradeState[metaUpgradeName].Visible = true
                if GameState.MetaUpgradeState[mod.GetFlippedCardName(metaUpgradeName)] then
                    GameState.MetaUpgradeState[mod.GetFlippedCardName(metaUpgradeName)].Visible = false
                end
            end
        end
    end
    return base(source, args)
end)

modutil.mod.Path.Wrap("CreateMetaUpgradeCard", function(base, screen, row, column, cardName, args)

    GameState.MetaUpgradeState[cardName].Visible = true
    local newObstacle =  base(screen, row, column, cardName, args)
	if MetaUpgradeCardData[cardName].Flipped then
		if MetaUpgradeCardData[cardName].Flipped == 1 then
			SetColor({ Id = newObstacle.EquippedHighlightId, Color = Color.MediumPurple })
		elseif MetaUpgradeCardData[cardName].Flipped == 2 or MetaUpgradeCardData[cardName].Flipped == 3 then
			Destroy({ Ids = { newObstacle.EquippedHighlightId } })
			local color = nil
			if MetaUpgradeCardData[cardName].Flipped == 2 then
				color = Color.Violet
			elseif MetaUpgradeCardData[cardName].Flipped == 3 then
				color = Color.Firebrick
			end
	local scale = 5 / screen.ZoomLevel
	local scaleLerp = 1 - (screen.ZoomLevel - 3) / 2 
	local offsetX = screen.DefaultStartX 
	local offsetY = screen.DefaultStartY + screen.ScaledStartY * ( scaleLerp )
	local xSpacer = screen.DefaultTalentXSpacer
	local ySpacer = screen.DefaultTalentYSpacer
	
	local locationX = (column - 1) * xSpacer * scale + offsetX * scale + ScreenCenterNativeOffsetX
	local locationY = (row - 1) * ySpacer * scale + offsetY * scale + ScreenCenterNativeOffsetY
			
			local equippedHighlight = CreateScreenComponent({
				Name = "FlipTheArcanaCard_EquippedHighlight",
				X = locationX,
				Y = locationY,
				Group = screen.ComponentData.DefaultHighlightGroup,
				Scale = scale
			})
			newObstacle.EquippedHighlightId = equippedHighlight.Id
			SetColor({ Id = newObstacle.EquippedHighlightId, Color = color })
			SetAlpha({ Id = newObstacle.EquippedHighlightId, Fraction = 0, Duration = 0 })
			Attach({ Id = equippedHighlight.Id, DestinationId = newObstacle.Id, })
		end
		if GameState.MetaUpgradeState[cardName].Equipped then
			SetAlpha({ Id = newObstacle.EquippedHighlightId, Fraction = 1, Duration = 0.1 })
		else
			SetAlpha({ Id = newObstacle.EquippedHighlightId, Fraction = 0, Duration = 0 })
		end
	end
	return newObstacle
end)

--[[function InitializeNewMetaUpgradeState()
    if not game.GameState.MetaUpgradeState[ChanneledCast] then
        return
    end
    if not game.GameState.MetaUpgradeCardLayout or not GameState.MetaUpgradeState then
		game.InitializeMetaUpgradeState()
        InitializeNewMetaUpgradeState()
        return
	end
    if not game.GameState.MetaUpgradeState[ReversedChanneledCast] then
        for metaUpgradeName, initialData in pairs( NewMetaUpgradeCardData ) do
		if not game.GameState.MetaUpgradeState[metaUpgradeName] then
			game.GameState.MetaUpgradeState[metaUpgradeName] = {}
			if initialData.StartUnlocked then
				game.GameState.MetaUpgradeState[metaUpgradeName].Unlocked = true
			end
			if initialData.StartEquipped then
				game.GameState.MetaUpgradeState[metaUpgradeName].Equipped = true
			end
		end
		game.GameState.MetaUpgradeState[metaUpgradeName].Level = GameState.MetaUpgradeState[metaUpgradeName].Level or 1
	end
    end
end]]
modutil.mod.Path.Wrap("GetCurrentMetaUpgradeCost", function(base)
    for metaUpgradeName, metaUpgradeData in pairs( GameState.MetaUpgradeState ) do
		if (metaUpgradeName == "BaseMetaUpgrade" or metaUpgradeName
         == "BaseBonusMetaUpgrade") and metaUpgradeData.Equipped then
			metaUpgradeData.Equipped = false
		end
	end

    return base()
end)


function mod.ReverseCardToCard(screen, selectedButton, newCardName, doZoom, cardArgs)
    if not Incantations.isIncantationEnabled("ExtraArcanaWorldUpgradeCardFlip") then
		return
	end
	if not selectedButton then return end
    local metaUpgradeName = selectedButton.CardName
    local wasEquipped = false
    local newCardName = newCardName or mod.GetFlippedCardName(metaUpgradeName)

    if MetaUpgradeCardEquipped(metaUpgradeName) then
        screen.ChangeMade = true
        UnequipMetaUpgradeCardPresentation(screen, selectedButton)
        GameState.MetaUpgradeState[metaUpgradeName].Equipped = nil
        GameState.MetaUpgradeState[metaUpgradeName].Visible = false
        UpdateMetaUpgradeCardState(screen, selectedButton)
        wasEquipped = true
    end

    MouseOffMetaUpgrade(selectedButton)
    mod.RemoveOldCard(selectedButton)
    GameState.MetaUpgradeState[newCardName].Visible = true
    local newCard = CreateMetaUpgradeCard(screen, selectedButton.Row, selectedButton.Column,newCardName, cardArgs)
    GameState.MetaUpgradeCardLayout[selectedButton.Row][selectedButton.Column] = newCard.CardName
    if wasEquipped and newCard.CardState == "UNLOCKED"then
        EquipMetaUpgradeButton( screen, newCard )
    end
    UpdateMetaUpgradeCardState( screen, newCard )
    if doZoom then
        MouseOverMetaUpgrade(newCard)
    else
        MouseOffMetaUpgrade(newCard)
        UpdateMetaUpgradeCardAnimation(newCard)
    end
end


function mod.ReverseCard(screen, selectedButton, doZoom, cardArgs)
    if not Incantations.isIncantationEnabled("ExtraArcanaWorldUpgradeCardFlip") then
		return
	end
    local metaUpgradeName = selectedButton.CardName
    local wasEquipped = false
    
    if MetaUpgradeCardEquipped(metaUpgradeName) then
        screen.ChangeMade = true
        UnequipMetaUpgradeCardPresentation(screen, selectedButton)
        GameState.MetaUpgradeState[metaUpgradeName].Equipped = nil
        GameState.MetaUpgradeState[metaUpgradeName].Visible = false
        UpdateMetaUpgradeCardState(screen, selectedButton)
        wasEquipped = true
    end

    MouseOffMetaUpgrade(selectedButton)
    mod.RemoveOldCard(selectedButton)
    GameState.MetaUpgradeState[mod.GetFlippedCardName(metaUpgradeName)].Visible = true
    local newCard = CreateMetaUpgradeCard(screen, selectedButton.Row, selectedButton.Column,mod.GetFlippedCardName(metaUpgradeName) , cardArgs)
    GameState.MetaUpgradeCardLayout[selectedButton.Row][selectedButton.Column] = newCard.CardName
    if wasEquipped and newCard.CardState == "UNLOCKED"then
        EquipMetaUpgradeButton( screen, newCard )
    end
    UpdateMetaUpgradeCardState( screen, newCard )
    if doZoom then
        MouseOverMetaUpgrade(newCard)
    else
        MouseOffMetaUpgrade(newCard)
        UpdateMetaUpgradeCardAnimation(newCard)
    end
end


modutil.mod.Path.Wrap("MetaUpgradeCardScreenPinItem", function(base, screen, button)
    base(screen,button)
    if screen.SelectedButton == nil then
		return
	end

    local selectedButton = screen.SelectedButton

    if screen.SelectedButton.RedirectClick == "MemCostModule" then
		return
	end
	if selectedButton.CardName == button.Screen.LastMouseOffButtonCardName and selectedButton.Name ~= "MetaUpgradeMemCostBacking" then
		return
	end
    

    mod.ReverseCard(screen, selectedButton, true,{})
    GetCurrentMetaUpgradeCost()


end)

function mod.AttemptCardFlip(screen, button)
	
	
	if screen.SelectedButton == nil then
		return
	end

    local selectedButton = screen.SelectedButton

    if screen.SelectedButton.RedirectClick == "MemCostModule" then
		return
	end
	if selectedButton.CardName == button.Screen.LastMouseOffButtonCardName and selectedButton.Name ~= "MetaUpgradeMemCostBacking" then
		return
	end
    

    mod.ReverseCard(screen, selectedButton, true,{})
    GetCurrentMetaUpgradeCost()
end


function mod.AttemptUpgradeCardFlip(screen, button)
    
	if screen.SelectedButton == nil then
		return
	end
    local selectedButton = screen.SelectedButton

    if screen.SelectedButton.RedirectClick == "MemCostModule" then
		return
	end
	if selectedButton.CardName == button.Screen.LastMouseOffButtonCardName and selectedButton.Name ~= "MetaUpgradeMemCostBacking" then
		return
	end
    if not Incantations.isIncantationEnabled("ExtraArcanaWorldUpgradeCardFlip") then
		return
	end
    mod.ReverseCard(screen, selectedButton, true, { UpgradeStoreNames = true, ActionFunctionName = "UpgradeMetaUpgradeCardAction", HighlightFunctionName = "MouseOverUpgradeMetaUpgrade"})
end

modutil.mod.Path.Wrap("MetaUpgradeCardUpgradeScreenInspect", function(base,screen, button)
    if CanUpgradeMetaUpgrade(screen.SelectedButton.CardName) or CanUpgradeMetaUpgrade(mod.GetFlippedCardName(screen.SelectedButton.CardName)) then
		return
	--turn off inspecting cards so that you can flip on upgrade screen if either side is not fully updated
	else
		return base(screen, button)
	end
end)

modutil.mod.Path.Wrap("MetaUpgradeCardUpgradeScreenPinItem", function(base, screen, button)
    base(screen,button)
    if screen.SelectedButton == nil then
		return
	end
    local selectedButton = screen.SelectedButton

    if screen.SelectedButton.RedirectClick == "MemCostModule" then
		return
	end
	if selectedButton.CardName == button.Screen.LastMouseOffButtonCardName and selectedButton.Name ~= "MetaUpgradeMemCostBacking" then
		return
	end
    if not Incantations.isIncantationEnabled("ExtraArcanaWorldUpgradeCardFlip") then
		return
	end
	if not (CanUpgradeMetaUpgrade(screen.SelectedButton.CardName) or CanUpgradeMetaUpgrade(mod.GetFlippedCardName(screen.SelectedButton.CardName)) ) then
		return
	end
    mod.ReverseCard(screen, selectedButton, true, { UpgradeStoreNames = true, ActionFunctionName = "UpgradeMetaUpgradeCardAction", HighlightFunctionName = "MouseOverUpgradeMetaUpgrade"})
end)

--[[ modutil.mod.Path.Override("UpgradeMetaUpgradeCardAction", function( screen, button )
	local selectedButton = button
	
	if screen.PickedUpButton then
		screen.ChangeMade = true
		DoCardSwap( screen, button )
		return
	end
	local metaUpgradeName = selectedButton.CardName
	local zoomOutDelay = 0
	local revealCardData = {}
	local expandPsyche = false
	local components = button.Screen.Components
	if selectedButton.CardState == "UNLOCKED" then
		if not MetaUpgradeAtMaxLevel( metaUpgradeName ) then
			local metaUpgradeData = MetaUpgradeCardData[metaUpgradeName]
			local resourceCost = metaUpgradeData.UpgradeResourceCost[ GetMetaUpgradeLevel( metaUpgradeName )]
			
			if HasResources( resourceCost ) then
				screen.ChangeMade = true
				for resourceName, resourceCost in pairs( resourceCost ) do
					SpendResource( resourceName, resourceCost, metaUpgradeName, { TargetId = components["ResourceIconBacking"..resourceName].Id, UseScreenLocation = true, TextOffsetY = 11, TextAnchorOffsetY = -50, SkipQuestStatusCheck = true } )
				end
				UpdateAffordabilityStatus()

				RemoveStoreItemPin( selectedButton.CardName .. GetMetaUpgradeLevel( metaUpgradeName ), { Purchase = true } )
				RemoveStoreItemPinPresentation( selectedButton )
				IncrementTableValue(GameState.MetaUpgradeState[metaUpgradeName], "Level" )
				screen.UpgradedMetaUpgrades[metaUpgradeName] = true
				UpdateMetaUpgradeCardState( screen, selectedButton )
				GameState.Flags.HasUpgradedCards = true

				UpgradeMetaUpgradeCardPresentation( selectedButton )
				if MetaUpgradeAtMaxLevel( metaUpgradeName ) then
					MetaUpgradeCardMaxLevelPresentation( selectedButton )
					SetAlpha({ Id = button.UpgradeIconId, Fraction = 0, Duration = 0.2 })
					SetAlpha({ Id = components.MetaUpgradeMaxRank.Id, Fraction = 1, Duration = 0 })
					SetAnimation({ DestinationId = components.MetaUpgradeMaxRank.Id, Name = "MetaUpgradeUpgradeScreenMaxRankAchieved" })
				end
				
				MouseOverUpgradeMetaUpgrade( selectedButton )
				if GetMetaUpgradeLevel( selectedButton.CardName ) > 1 then 
					local rarity = TraitRarityData.RarityUpgradeOrder[ GetMetaUpgradeLevel( selectedButton.CardName )]
					SetAnimation({ DestinationId = selectedButton.CardCornersId, Name = "RarityCircle".. rarity })
					SetAnimation({ DestinationId = components.MetaUpgradeCardArtPatch.Id, Name = "RarityFrameLarge".. rarity .. "In" })
				end
				-- Update affordability state of all other cards
				
                for row, rowData in pairs( GameState.MetaUpgradeCardLayout ) do
					for column, cardName in pairs( rowData ) do
						local otherButton = screen.Components[GetMetaUpgradeKey( row, column )]
						if not MetaUpgradeAtMaxLevel( cardName ) then
							local metaUpgradeData = MetaUpgradeCardData[cardName]
							local resourceCost = metaUpgradeData.UpgradeResourceCost[ GetMetaUpgradeLevel( cardName )]
							if not HasResources(resourceCost) and otherButton then
								SetAlpha({ Id = otherButton.UpgradeIconId, Fraction = 0, Duration = 0.2 })
								SetAlpha({ Id = otherButton.Id, Fraction = 0.2, Duration = 0.2 })
								SetAlpha({ Id = otherButton.CardCornersId, Fraction = 0.2, Duration = 0.2 })
							end
						end
					end
				end

				CheckAchievement( screen, { Name = "AchAllArcanaMax" } )

			else
				ScreenCantAffordPresentation( screen, selectedButton, resourceCost )
			end
		else
			CannotUpgradeMaxLevelMetaUpgradePresentation( screen, selectedButton )
		end
	else
		InvalidMetaUpgradeCardAction( screen, selectedButton )
	end
	UpdateUpgradeMetaUpgradeCardInteractionText( screen, selectedButton )
end) ]]




modutil.mod.Path.Wrap("CheckAutoEquipRequirements", function(base, requirementData)
    if not Incantations.isIncantationEnabled("ExtraArcanaWorldUpgradeCardFlip") then
		return base(requirementData)
	end
	local basevalue = base(requirementData)

	if requirementData.MetaUpgradeName and GameState.MetaUpgradeState[requirementData.MetaUpgradeName] and not GameState.MetaUpgradeState[requirementData.MetaUpgradeName].Visible then
		return false
	end

    if requirementData.MetaUpgradeName == "TradeOff" or requirementData.MetaUpgradeName == "ReversedTradeOff" then
        local sourceCoords = {Row = 5, Column = 1}
        if not sourceCoords then
            return false
        end

        local coordsCheck = {{Row = 4, Column = 1},{Row = 4, Column = 2},{Row = 5, Column = 2}}
        basevalue = true
        for i, coords in pairs(coordsCheck) do
            local metaUpgradeName = GameState.MetaUpgradeCardLayout[coords.Row][coords.Column]
            if not GameState.MetaUpgradeState[metaUpgradeName] or not GameState.MetaUpgradeState[metaUpgradeName].Equipped then
                basevalue = false
            end
        end
        if requirementData.MetaUpgradeName == "TradeOff" then
            if not (GameState.MetaUpgradeState["ScreenReroll"].Equipped or GameState.MetaUpgradeState["DoorReroll"].Equipped) then
                basevalue = false
            end
        elseif requirementData.MetaUpgradeName == "ReversedTradeOff" then
            if (GameState.MetaUpgradeState["ScreenReroll"].Equipped or GameState.MetaUpgradeState["DoorReroll"].Equipped) then
                basevalue = false
            end
        end
    end
    return basevalue
end)



modutil.mod.Path.Wrap("CloseMetaUpgradeCardScreen", function(base, screen, args)
    if not Incantations.isIncantationEnabled("ExtraArcanaWorldUpgradeCardFlip") then
		return base(screen, args)
	else
	args = args or {}
	CheckAutoEquipCards(screen)
	CheckAutoEquipCards(screen)
    if not args.UpgradeTransition then
        if NoMetaUpgradeCardsUnlocked() then
            OpenNoUpgradeInfoScreen(screen)
            if not screen.Exit then
                exitCanceled = true
            end
        end
        if ShouldShowMetaUpgradeCapacityHint(screen) then
            OpenBelowLimitScreen(screen)
            if not screen.Exit then
                exitCanceled = true
            end
        end
        if exitCanceled then
            MetaUpgradeCardScreenResetCursor(screen)
            return
        end

        closeDelay = 0.15
        thread(CloseMetaUpgradeCardScreenPresentation, screen)
    end
    RecordMetaUpgradeChanges(screen)
    UpdateEscapeDoorForLimitGraspShrineUpgrade(nil, { EscapeDoorIds = { 420947, 555784 } })
	for metaUpgradeName, metaUpgradeData in pairs(GameState.MetaUpgradeState) do
		if metaUpgradeData.Equipped then
			local cardMultiplier = 1
			if GameState.MetaUpgradeState[metaUpgradeName].AdjacencyBonuses and GameState.MetaUpgradeState[metaUpgradeName].AdjacencyBonuses.CustomMultiplier then
				cardMultiplier = cardMultiplier +
					GameState.MetaUpgradeState[metaUpgradeName].AdjacencyBonuses.CustomMultiplier
			end
			if HeroHasTrait(MetaUpgradeCardData[metaUpgradeName].TraitName) then
				RemoveWeaponTrait(MetaUpgradeCardData[metaUpgradeName].TraitName, { Silent = true })
			end
			AddTraitToHero({
				SkipNewTraitHighlight = true,
				TraitName = MetaUpgradeCardData[metaUpgradeName].TraitName,
				Rarity = TraitRarityData.RarityUpgradeOrder[GetMetaUpgradeLevel(metaUpgradeName)],
				CustomMultiplier = cardMultiplier
			})
		else
			if HeroHasTrait(MetaUpgradeCardData[metaUpgradeName].TraitName) and not metaUpgradeData.Equipped then
				RemoveWeaponTrait(MetaUpgradeCardData[metaUpgradeName].TraitName, { Silent = true })
			end
		end
	end

    CurrentRun.NumRerolls = GetTotalHeroTraitValue( "RerollCount" )

	StopAnimation({ Names = { "MetaUpgradeHandLargeGlowIn", "MetaUpgradeHandLargeGlowLoop" }, DestinationId = screen.Components.MemCostModuleBackingFx.Id })

	local ids = GetAllIds( screen.Components )
	for row, rowData in pairs( GameState.MetaUpgradeCardLayout ) do
		for column, cardName in pairs( rowData ) do
		
			local button = screen.Components[GetMetaUpgradeKey( row, column )]
			if button then
				table.insert( ids, button.CardArtId )
				table.insert( ids, button.CardCornersId )
				table.insert( ids, button.UpgradeIconId )
				table.insert( ids, button.RarityBadgeId )
				table.insert( ids, button.EquippedHighlightId )
				table.insert( ids, button.PinButtonId )
				table.insert( ids, button.CostTextId )
			end
		end
	end
	for _, id in pairs(screen.CostRingIds) do
		table.insert( ids, id )
	end
	for _, id in pairs(screen.CostPipIds) do
		table.insert( ids, id )
	end
	table.insert( ids, screen.Components.MemCostModule.PinButtonId )
	OnScreenCloseStarted( screen )

	if screen.ChangeMade and GameState.CompletedObjectiveSets.CardPrompt then
		RequestPreRunLoadoutChangeSave()
	end

	CloseScreen( ids, closeDelay )
	
	if not args.UpgradeTransition then
		for weaponName, v in pairs( WeaponSetLookups.HeroSecondaryWeaponsLinked ) do
			if MapState.EquippedWeapons[weaponName] then
				SetWeaponProperty({ WeaponName = weaponName, DestinationId = CurrentRun.Hero.ObjectId, Property = "Enabled", Value = true  })
			end
		end
	end
	SetPlayerVulnerable( screen.Name )
	UpdateMetaUpgradeUnlockedCountCache()
	OnScreenCloseFinished( screen )
	
	if not args.IgnoreAspectRatioFrame then
		AltAspectRatioFramesHide()
	end
	ShowCombatUI( screen.Name )
	if not args.UpgradeTransition then
		UseableOn({ Id = screen.SourceId })
		if MapState.FamiliarUnit ~= nil then
			RemoveInteractBlock( MapState.FamiliarUnit, "CardScreen" )
		end
		if screen.StartingHealth ~= CurrentRun.Hero.MaxHealth then
			thread( MaxHealthChangedPresentation, CurrentRun.Hero.MaxHealth > screen.StartingHealth, 0.3)
		end
		if screen.StartingMana ~= CurrentRun.Hero.MaxMana then
			thread( MaxManaChangedPresentation, CurrentRun.Hero.MaxMana > screen.StartingMana, 0.3 )
		end
	end
	UpdateRerollUI( CurrentRun.NumRerolls )
	ValidateMaxHealth()
	ValidateMaxMana()
	if not IsGameStateEligible( screen, { { FunctionName = "RequireAffordableMetaUpgrade" } } ) then
		StopCurrentStatusAnimation( screen.OpenedFrom )
	end

	if not NoMetaUpgradeCardsUnlocked() then
		thread( MarkObjectiveComplete, "CardPrompt" )
	end

	local showLastStandState = false
	if SessionState.MetaUpgradeChanges.CardData.LowHealthBonus and SessionState.MetaUpgradeChanges.CardData.LowHealthBonus.Equipped then
		-- Equipping Strength always prompts the text	
		showLastStandState = true
	end
	if GameState.MetaUpgradeState.LowHealthBonus.Equipped and SessionState.MetaUpgradeChanges.CardData and SessionState.MetaUpgradeChanges.CardData.LastStand and SessionState.MetaUpgradeChanges.CardData.LastStand.Unequipped and not HasLastStand(CurrentRun.Hero) then	
		-- If Strength is equipped and you unequip Death to the point that you activate Strength, show the text
		showLastStandState = true
	end
	if GameState.MetaUpgradeState.LowHealthBonus.Equipped and SessionState.MetaUpgradeChanges.CardData and SessionState.MetaUpgradeChanges.CardData.LastStand and SessionState.MetaUpgradeChanges.CardData.LastStand.Equipped and not screen.StartingHasLastStand then	
		-- If Strength is equipped and you equip Death and it was your first source of DDs, show the text
		showLastStandState = true
	end
	local delay = 0
	if showLastStandState then
		thread( LowHealthBonusBuffStatePresentation )
		delay = delay + 0.5
	end
	
	if (FatedEnableKeepsakes[GameState.LastAwardTrait] or HeroHasTrait("ReversedTradeOffMetaUpgrade") or HeroHasTrait("ReversedScreenRerollMetaUpgrade") or HeroHasTrait("ReversedDoorRerollMetaUpgrade")) and screen.StartingFateValid ~= PreRunIsFateValid() then
		thread( FatedValidityStatePresentation, delay )
	end
end
ValidateMaxHealth()
	ValidateMaxMana()
end)

--[[ function LookupRowandColumn(metaUpgradeName)
    for rowNumber, rowData in pairs(GameState.MetaUpgradeCardLayout ) do
        for columnNumber, cardName in pairs(rowData) do
            if cardName == metaUpgradeName then
                return rowNumber, columnNumber
            end
        end
    end
end ]]



--[[ modutil.mod.Path.Override("LoadCurrentMetaUpgradeSet", function(screen, button)
    if not IsEmpty(GameState.FlipTheArcanaSavedMetaUpgradeLayouts[GameState.CurrentMetaUpgradeLayout]) and not IsEmpty(GameState.FlipTheArcanaSavedMetaUpgradeLayoutsVisibility[GameState.CurrentMetaUpgradeLayout]) then
		for metaUpgradeName in pairs( GameState.FlipTheArcanaSavedMetaUpgradeLayouts[GameState.CurrentMetaUpgradeLayout] ) do
			if (GameState.FlipTheArcanaSavedMetaUpgradeLayoutsVisibility[GameState.CurrentMetaUpgradeLayout][metaUpgradeName] ~= GameState.MetaUpgradeState[metaUpgradeName].Visible) then
                if MetaUpgradeCardData[metaUpgradeName].Flipped then
                    local row = MetaUpgradeCardData[metaUpgradeName].Row
                    local column = MetaUpgradeCardData[metaUpgradeName].Column
                else
                    local row = MetaUpgradeCardData[GetFlippedCardName(metaUpgradeName)].Row
                    local column = MetaUpgradeCardData[GetFlippedCardName(metaUpgradeName)].Column
                local cardToFlip = screen.Components[GetMetaUpgradeKey(row, column)]
                ReverseCard(screen, cardToFlip, false)
                end
            if GameState.FlipTheArcanaSavedMetaUpgradeLayouts[GameState.CurrentMetaUpgradeLayout][metaUpgradeName] then
                GameState.MetaUpgradeState[metaUpgradeName].Equipped = true
            else
                GameState.MetaUpgradeState[metaUpgradeName].Equipped = nil
            end
		    end
	    end
    end
    UpdateMetaUpgradeCostText( screen )
end) ]]
--[[ mod for row, rowData in pairs(GameState.MetaUpgradeCardLayout) do
        for column, cardName in pairs(rowData) do
            if MetaUpgradeCardData[cardName].Flipped then
                row = MetaUpgradeCardData[cardName].Row
                column = MetaUpgradeCardData[cardName].Column
                local buttonToFlip = screen.Components[GetMetaUpgradeKey(row, column)]
                ReverseCard(screen, buttonToFlip, false)
            end
        end
    end
    for metaUpgradeName, metaUpgradeState in pairs(GameState.MetaUpgradeState) do
        if GameState.MetaUpgradeState[metaUpgradeName].Equipped then
			GameState.MetaUpgradeState[metaUpgradeName].Equipped = nil
		end
    end
    if not IsEmpty(GameState.FlipTheArcanaSavedMetaUpgradeLayouts[GameState.CurrentMetaUpgradeLayout]) then
		for metaUpgradeName in pairs( GameState.FlipTheArcanaSavedMetaUpgradeLayouts[GameState.CurrentMetaUpgradeLayout] ) do
			GameState.MetaUpgradeState[metaUpgradeName].Equipped = true
            modutil.mod.Hades.PrintOverhead("IN PLACE ABC")
            if MetaUpgradeCardData[metaUpgradeName].Flipped then
                local buttonToFlip = screen.Components[GetMetaUpgradeKey(row, column)]
                ReverseCard(screen, buttonToFlip, false)
            end
		end
	end
    
    for row, rowData in pairs( GameState.MetaUpgradeCardLayout ) do
		for column, cardName in pairs( rowData ) do
			local button = screen.Components[GetMetaUpgradeKey( row, column )]
            if button then
				UpdateMetaUpgradeCardAnimation( button )
			end
		end
	end

    UpdateMetaUpgradeCostText( screen ) ]]





modutil.mod.Path.Wrap("LoadCurrentMetaUpgradeSet", function(base,screen,button)
    --[[ for row, rowData in pairs(GameState.MetaUpgradeCardLayout) do
        for column, cardName in pairs(rowData) do
            if MetaUpgradeCardData[cardName].Flipped then
                row = MetaUpgradeCardData[cardName].Row
                column = MetaUpgradeCardData[cardName].Column
                local buttonToFlip = screen.Components[GetMetaUpgradeKey(row, column)]
                ReverseCard(screen, buttonToFlip, false)
            end
        end
    end ]]

    if not IsEmpty(GameState.FlipTheArcanaSavedMetaUpgradeLayouts[GameState.CurrentMetaUpgradeLayout]) then
		for metaUpgradeName in pairs( GameState.FlipTheArcanaSavedMetaUpgradeLayouts[GameState.CurrentMetaUpgradeLayout] ) do
            --[[local row, column = MetaUpgradeCardData[metaUpgradeName].Row, MetaUpgradeCardData[metaUpgradeName].Column
            local cardAtCoords = GameState.MetaUpgradeCardLayout[row][column]
            if GameState.FlipTheArcanaSavedMetaUpgradeLayouts[GameState.CurrentMetaUpgradeLayout][GetFlippedCardName(cardAtCoords)] then
                buttonToFlip = screen.Components[GetMetaUpgradeKey(row,column)]
                ReverseCard(screen, buttonToFlip, false)
            end]]
			local row = game.MetaUpgradeCardData[metaUpgradeName].Row
			local column = game.MetaUpgradeCardData[metaUpgradeName].Column
			if GameState.MetaUpgradeCardLayout[row][column] ~= metaUpgradeName then
				local buttonToFlip = screen.Components[GetMetaUpgradeKey(row,column)]
				mod.ReverseCardToCard(screen, buttonToFlip, metaUpgradeName, false, {})
			end
            --[[for row, rowData in pairs(GameState.MetaUpgradeCardLayout) do
                for column, cardName in pairs(rowData) do
                    if mod.GetFlippedCardName(GameState.MetaUpgradeCardLayout[row][column]) == metaUpgradeName then
                        local buttonToFlip = screen.Components[GetMetaUpgradeKey(row,column)]
                        mod.ReverseCard(screen, buttonToFlip, false, {})
                    end
                end
             end]]
        end
    end
    return base(screen,button)
    

end)






modutil.mod.Path.Override("CheckAutoEquipCards", function(screen)
    if not Incantations.isIncantationEnabled("ExtraArcanaWorldUpgradeCardFlip") then
		local autoEquipMetaUpgrades = {}
	for metaUpgradeName, metaUpgradeData in pairs( GameState.MetaUpgradeState ) do
		if metaUpgradeData.Unlocked and MetaUpgradeCardData[metaUpgradeName].AutoEquipRequirements then
			if CheckAutoEquipRequirements(MetaUpgradeCardData[metaUpgradeName].AutoEquipRequirements) and (screen and GetMetaUpgradeCardButton(screen, metaUpgradeName)) then
				if not MetaUpgradeCardEquipped(metaUpgradeName) then
					autoEquipMetaUpgrades[ metaUpgradeName ] = true
				end
			elseif MetaUpgradeCardEquipped(metaUpgradeName) then
				autoEquipMetaUpgrades[ metaUpgradeName ] = false
			end
		end
	end
	for metaUpgradeName, equipValue in pairs( autoEquipMetaUpgrades ) do
		if equipValue then
			if screen then
				EquipMetaUpgradeBonusCardPresentation( screen, GetMetaUpgradeCardButton( screen, metaUpgradeName ))
			end
			GameState.MetaUpgradeState[metaUpgradeName].Equipped = true
		else			
			if screen then
				UnequipMetaUpgradeBonusCardPresentation( screen, GetMetaUpgradeCardButton( screen, metaUpgradeName ))
			end
			GameState.MetaUpgradeState[metaUpgradeName].Equipped = nil
		end
	end
	return
	end
	local autoEquipMetaUpgrades = {}
	if modutil.mod.Locals.Stacked(3).bountyData and modutil.mod.Locals.Stacked(3).bountyData.RandomMetaUpgradeCostTotal then
		local defaultAutoEquipCards = {}
		local cardCoordMap = {}
		for row, cardRow in ipairs(game.MetaUpgradeDefaultCardLayout) do
			for col, card in ipairs(cardRow) do
				if game.MetaUpgradeCardData[card].AutoEquipRequirements then
					table.insert(defaultAutoEquipCards, card)
					cardCoordMap[card] = {Row = row, Column = col}
				end
			end
		end
		local flippedAutoEquipCards = {}
		for index, card in ipairs(defaultAutoEquipCards) do
			flippedAutoEquipCards[card] = mod.GetLegalFlippedCandidates(card)
			for index, flippedCard in ipairs(flippedAutoEquipCards[card]) do
				autoEquipMetaUpgrades[flippedCard] = false
				game.GameState.MetaUpgradeState[flippedCard].Visible = false
			end
			local visibleCardIndex = game.RandomInt(1, #flippedAutoEquipCards[card])
			local visibleCard = flippedAutoEquipCards[card][visibleCardIndex]
			local row = cardCoordMap[card].Row
			local col = cardCoordMap[card].Column
			game.GameState.MetaUpgradeCardLayout[row][col] = visibleCard
			game.GameState.MetaUpgradeState[visibleCard].Visible = true
			if game.CheckAutoEquipRequirements(game.MetaUpgradeCardData[visibleCard].AutoEquipRequirements) then
				autoEquipMetaUpgrades[visibleCard] = true
			end
		end
		for metaUpgradeName, equipValue in pairs( autoEquipMetaUpgrades ) do
			if equipValue then
				GameState.MetaUpgradeState[metaUpgradeName].Equipped = true
			else		
				GameState.MetaUpgradeState[metaUpgradeName].Equipped = false
			end
		end
		return
	end
	if not GameState.FlipTheArcanaHasRun then
		return
	end
	for metaUpgradeName, metaUpgradeData in pairs( GameState.MetaUpgradeState ) do
		if metaUpgradeData.Unlocked and MetaUpgradeCardData[metaUpgradeName].AutoEquipRequirements then
			if CheckAutoEquipRequirements(MetaUpgradeCardData[metaUpgradeName].AutoEquipRequirements) and GameState.MetaUpgradeState[metaUpgradeName].Visible and (screen and GetMetaUpgradeCardButton(screen, metaUpgradeName)) then
				if not MetaUpgradeCardEquipped(metaUpgradeName) then
					autoEquipMetaUpgrades[ metaUpgradeName ] = true
				end
			elseif MetaUpgradeCardEquipped(metaUpgradeName) then
				autoEquipMetaUpgrades[ metaUpgradeName ] = false
			end
		end
	end
	for metaUpgradeName, equipValue in pairs( autoEquipMetaUpgrades ) do
		if equipValue then
			if screen then
				EquipMetaUpgradeBonusCardPresentation( screen, GetMetaUpgradeCardButton( screen, metaUpgradeName ))
			end
			GameState.MetaUpgradeState[metaUpgradeName].Equipped = true
		else			
			if screen then
				UnequipMetaUpgradeBonusCardPresentation( screen, GetMetaUpgradeCardButton( screen, metaUpgradeName ))
			end
			GameState.MetaUpgradeState[metaUpgradeName].Equipped = nil
		end
	end
end)


function mod.GetColumn(screen, button)
    local scale = 5 / screen.ZoomLevel
    local offsetX = screen.DefaultStartX 
    local xSpacer = screen.DefaultTalentXSpacer
    local column = ((button.X - ScreenCenterNativeOffsetX)-(offsetX * scale))/(xSpacer * scale)+1
    return column
end

function mod.GetRow(screen, button)
    local scale = 5 / screen.ZoomLevel
	local scaleLerp = 1 - (screen.ZoomLevel - 3) / 2
    local offsetY = screen.DefaultStartY + screen.ScaledStartY * ( scaleLerp )
    local ySpacer = screen.DefaultTalentYSpacer
    local row = ((button.Y-ScreenCenterNativeOffsetY)-(offsetY * scale))/(ySpacer * scale)+1
    return row
end

function mod.GetNextTableValue(tableArg, value)
	if not tableArg or not value then return end

	for k, v in ipairs(tableArg) do
		if v == value then
			return tableArg[(k % #tableArg) + 1]
		end
	end
end

function mod.FindTableContainingValue(tableArg, value)
	if not tableArg or not value then return end

	for k, table in ipairs(tableArg) do
		if Contains(table, value) then
			return table
		end
	end
end

function mod.GetFlippedCardName(cardName)
    --[[local metaUpgradeReversePairs = 
    {
        { "ChanneledCast", "ReversedChanneledCast" , "ReversedChanneledCast1","ReversedChanneledCast2"}, { "HealthRegen", "ReversedHealthRegen", "ReversedHealthRegen1" }, { "LowManaDamageBonus", "ReversedLowManaDamageBonus", "ReversedLowManaDamageBonus1" }, { "CastCount", "ReversedCastCount", "ReversedCastCount1" }, { "SorceryRegenUpgrade", "ReversedSorceryRegenUpgrade","ReversedSorceryRegenUpgrade1" },
        { "CastBuff",      "ReversedCastBuff", "ReversedCastBuff1" }, { "BonusHealth", "ReversedBonusHealth", "ReversedBonusHealth1" }, { "BonusDodge", "ReversedBonusDodge", "ReversedBonusDodge1" }, { "ManaOverTime", "ReversedManaOverTime", "ReversedManaOverTime1" }, { "MagicCrit", "ReversedMagicCrit", "ReversedMagicCrit1" },
        { "SprintShield", "ReversedSprintShield", "ReversedSprintShield1" }, { "LastStand", "ReversedLastStand", "ReversedLastStand" }, { "MaxHealthPerRoom", "ReversedMaxHealthPerRoom" }, { "StatusVulnerability", "ReversedStatusVulnerability" }, { "ChanneledBlock", "ReversedChanneledBlock" },
        { "DoorReroll",   "ReversedDoorReroll" }, { "StartingGold", "ReversedStartingGold" }, { "MetaToRunUpgrade", "ReversedMetaToRunUpgrade" }, { "RarityBoost", "ReversedRarityBoost" }, { "BonusRarity", "ReversedBonusRarity" },
        { "TradeOff", "ReversedTradeOff" }, { "ScreenReroll", "ReversedScreenReroll" }, { "LowHealthBonus", "ReversedLowHealthBonus" }, { "EpicRarityBoost", "ReversedEpicRarityBoost" }, { "CardDraw", "ReversedCardDraw" },
    }]]
	local metaUpgradeReversePairs = {}
	for i = 1,5 do
		for j = 1,5 do
			local newTable = {}
			table.insert(newTable, mod.MetaUpgradeDefaultCardLayout[i][j])
			if mod.setsAdded >= 1 then
			table.insert(newTable, mod.MetaUpgradeDefaultCardLayout[i+5][j])
			end
			if mod.setsAdded >= 2 then
			table.insert(newTable, mod.MetaUpgradeDefaultCardLayout[i+10][j])
			end
			if mod.setsAdded >= 3 then
			table.insert(newTable, mod.MetaUpgradeDefaultCardLayout[i+15][j])
			end
			table.insert(metaUpgradeReversePairs, newTable)
		end
	end
	local tableContainingValue = mod.FindTableContainingValue(metaUpgradeReversePairs, cardName)
	if not tableContainingValue then
		local metaUpgradeData = MetaUpgradeCardData[cardName]
		local row = metaUpgradeData.Row or 1
		local column = metaUpgradeData.Column or 1
		local rowData = mod.MetaUpgradeDefaultCardLayout[row]
		if rowData then
			if mod.MetaUpgradeDefaultCardLayout[row][column] then 
				return mod.MetaUpgradeDefaultCardLayout[row][column] 
			else 
				return mod.MetaUpgradeDefaultCardLayout[row][1] 
			end
		else 
			return mod.MetaUpgradeDefaultCardLayout[1][1]
		end
	end
	return mod.GetNextTableValue(tableContainingValue, cardName)
end


function mod.RemoveOldCard(button)
    local ids = {}
    table.insert(ids, button.CardArtId)
    table.insert(ids, button.CardCornersId)
    table.insert(ids, button.UpgradeIconId)
    table.insert(ids, button.RarityBadgeId)
    table.insert(ids, button.EquippedHighlightId)
    table.insert(ids, button.PinButtonId)
    table.insert(ids, button.CostTextId)
    Destroy({ Ids = ids })
end


modutil.mod.Path.Override("TraitTrayShowMetaUpgrades", function(screen, activeCategory, args)
	local equippedMetaUpgradesNum = 0
	for k, upgrade in pairs(GameState.MetaUpgradeState) do
		if upgrade.Equipped then
			equippedMetaUpgradesNum = equippedMetaUpgradesNum + 1
		end
	end

	local traitSpacingX = activeCategory.TraitSpacingX or screen.TraitSpacingX
	if equippedMetaUpgradesNum >= activeCategory.TraitsNeededForExtendedSpacing then
		traitSpacingX = activeCategory.ExtendedTraitSpacingX
	end

	local components = screen.Components
	local firstTrait = nil
	local highlightedTrait = nil
	local displayedTraitNum = 0
	local xOffset = activeCategory.TraitStartX or screen.TraitStartX
	local yOffset = ScreenHeight - (activeCategory.TraitStartBottomOffset or screen.TraitStartBottomOffset)
	--for metaUpgradeName, metaUpgradeState in pairs( GameState.MetaUpgradeState ) do
    local combinedMetaUpgradeDefaultCardLayout = DeepCopyTable(mod.MetaUpgradeDefaultCardLayout)
	local maxMetaUpgradesPerPage = 25
	local numMetaUpgradeCardsDrawn = 0
	local metaUpgradePageNum = activeCategory.MetaUpradePageIndex or 1
	for rowIndex, row in ipairs( combinedMetaUpgradeDefaultCardLayout ) do
		for colIndex, metaUpgradeName in ipairs( row ) do
			local metaUpgradeState = GameState.MetaUpgradeState[metaUpgradeName]
			if metaUpgradeState ~= nil and metaUpgradeState.Equipped then
				numMetaUpgradeCardsDrawn = numMetaUpgradeCardsDrawn + 1
				if not rom.mods["zerp-BoonOverflowFix"] or (numMetaUpgradeCardsDrawn > maxMetaUpgradesPerPage * (metaUpgradePageNum - 1) and numMetaUpgradeCardsDrawn <= maxMetaUpgradesPerPage * (metaUpgradePageNum)) then
					local metaUpgradeCardData = MetaUpgradeCardData[metaUpgradeName]
					if metaUpgradeCardData.TraitName ~= nil and HeroHasTrait(metaUpgradeCardData.TraitName) then
						local trait = GetHeroTrait( metaUpgradeCardData.TraitName )
						local traitFrameId = CreateScreenObstacle({ Name = "BlankObstacle", X = xOffset, Y = yOffset,  Group = screen.ComponentData.DefaultGroup, Scale = 0.7, Alpha = 0.0 })
						--Attach({ Id = traitFrameId, DestinationId = traitIcon.Id })
						SetAnimation({ Name = "DevCard_EquippedHighlight", DestinationId = traitFrameId })
						SetAlpha({ Id = traitFrameId, Fraction = 1.0, Duration = 0.1 })
						table.insert( screen.Frames, traitFrameId )

						local iconScale = 0.21
						local traitIcon = CreateScreenComponent({ Name = "TraitTrayIconButton", X = xOffset, Y = yOffset, Group = screen.ComponentData.DefaultGroup, Animation = metaUpgradeCardData.Image, Scale = iconScale, Alpha = 0.0 })
						AttachLua({ Id = traitIcon.Id, Table = traitIcon })
						traitIcon.Screen = screen
						traitIcon.OnMouseOverFunctionName = "TraitTrayIconButtonMouseOver"
						traitIcon.OnMouseOffFunctionName = "TraitTrayIconButtonMouseOff"
						traitIcon.OnPressedFunctionName = "PinTraitDetails"
						--trait.AnchorId = traitIcon.Id
						traitIcon.Icon = metaUpgradeCardData.Image
						traitIcon.IconScale = iconScale
						traitIcon.PinIconScale = 0.12
						traitIcon.PinIconFrameScale = 0.4
						traitIcon.OffsetX = xOffset
						traitIcon.OffsetY = yOffset
						traitIcon.HighlightAnim = "DevCard_Hover"
						traitIcon.HighlightAnimScale = 0.33
						traitIcon.PinAnimationIn = "TraitPinIn_Arcana"
						traitIcon.PinAnimationOut = "TraitPinOut_Arcana"
						traitIcon.TrayHighlightAnimScale = 1.5
						SetAlpha({ Id = traitIcon.Id, Fraction = 1.0, Duration = 0.1 })
						CreateTextBox({
							Id = traitIcon.Id,
							UseDescription = true,
							VariableAutoFormat = "BoldFormatGraft",
							Scale = 0.0,
							Hide = true,
						})

						if args.DisableTooltips then
							ModifyTextBox({ Id = traitIcon.Id, BlockTooltip = true })
						end

						table.insert( components, traitIcon )
						traitIcon.TraitData = trait
						screen.Icons[traitIcon.Id] = traitIcon

						if not firstTrait then
							highlightedTrait = traitIcon
							firstTrait = true
						end

						local uniqueTraitName = TraitTrayGetUniqueName( traitIcon )
						if uniqueTraitName == args.HighlightName or uniqueTraitName == activeCategory.PrevHighlightName then
							highlightedTrait = traitIcon
						end
						if trait.Name == MapState.TraitTrayMetaUpgradePriorityHighlight then
							highlightedTrait = traitIcon
							MapState.TraitTrayMetaUpgradePriorityHighlight = nil
						end

						screen.TraitComponentDictionary[uniqueTraitName] = traitIcon
						if screen.AutoPin and not activeCategory.OpenedOnce and IsPossibleMetaUpgradeAutoPin( trait ) then
							table.insert( screen.PossibleAutoPins, traitIcon )
						end
						
						if CurrentRun.FlipTheArcanaTycheMetaUpgrades and CurrentRun.FlipTheArcanaTycheMetaUpgrades[metaUpgradeName] then
							SetColor({ Id = traitIcon.Id, Color = { 192, 192, 192, 160 } })
							--ModifyTextBox({ Id = traitIcon.Id, Text = "{$Keywords.FlipTheArcanaRandomisedCard}" })
						end
						if CurrentRun.FlipTheArcanaRegretMetaUpgrades and CurrentRun.FlipTheArcanaRegretMetaUpgrades[metaUpgradeName] then
							SetColor({ Id = traitIcon.Id, Color = { 192, 192, 192, 160 } })
							--ModifyTextBox({ Id = traitIcon.Id, Text = "{$Keywords.FlipTheArcanaRandomisedCard}" })
						end

						displayedTraitNum = displayedTraitNum + 1
						if displayedTraitNum % (activeCategory.TraitsPerColumn or screen.TraitsPerColumn ) == 0 then
							xOffset = xOffset + traitSpacingX
							yOffset = ScreenHeight - (activeCategory.TraitStartBottomOffset or screen.TraitStartBottomOffset)
						else
							yOffset = yOffset + (activeCategory.TraitSpacingY or screen.TraitSpacingY)
						end
					end
				end
			end
		end
	end

	highlightedTrait = highlightedTrait
	if highlightedTrait ~= nil then
		wait( 0.02 )
		SetHighlightedTraitFrame( screen, highlightedTrait )
	end

	if firstTrait == nil and HeroHasTrait( "ChaosMetaUpgradeCurse" ) then
		SetAlpha({ Id = components.ChaosLock.Id, Fraction = 1.0, Duration = 0.1 })
	end
end)

modutil.mod.Path.Override("UpgradeMouseOverUpgradeChoice", function( screen, button ) 
	if screen.MouseOverButton == nil then
		return
	end
	local lootData = screen.Source

	if not lootData.GodLoot and not lootData.TreatAsGodLootByShops then
		return
	end
	local components = screen.Components
	local button = screen.MouseOverButton

	local upgradeTraitData = nil
	for _, traitData in ipairs( CurrentRun.Hero.Traits ) do
		if traitData.RarityUpgradeData then
			if not traitData.RarityUpgradeData.LootName and ( button.LootData.GodLoot or button.LootData.TreatAsGodLootByShops) and (not traitData.RarityUpgradeData.RequireNotExcludeFromLastRunBoon or not button.LootData.ExcludeFromLastRunBoon ) then
				if (not traitData.RarityUpgradeData.RequireFated  or ( traitData.RarityUpgradeData.RequireFated and IsFateValid())) and traitData.RarityUpgradeData.Uses >= 1 then 
					upgradeTraitData = traitData
				end
			end
			if lootData.Name == traitData.RarityUpgradeData.LootName and traitData.RarityUpgradeData.Uses >= 1 then
				-- More specific upgrades always take priority over general ones
				if not traitData.RarityUpgradeData.RequireFated  or ( traitData.RarityUpgradeData.RequireFated and IsFateValid()) then 
					upgradeTraitData = traitData
                    break
				end
			end
		end
	end
	
	if not upgradeTraitData or not upgradeTraitData.RarityUpgradeData.Uses or upgradeTraitData.RarityUpgradeData.Uses <= 0 then
		return
	end
	local traitData = button.Data
	if not traitData or ( upgradeTraitData.RarityUpgradeData.MaxRarity and GetRarityValue( traitData.Rarity ) > upgradeTraitData.RarityUpgradeData.MaxRarity ) then
		return
	end
	
	if screen.UpgradedRarity and not upgradeTraitData.RarityUpgradeData.MultiUse then
		return
	end

	if TryUpgradeBoon( lootData, screen, button ) then
		if not IsEmpty(upgradeTraitData.RarityUpgradeData.RarifyVoiceLines) then
			thread( PlayVoiceLines, upgradeTraitData.RarityUpgradeData.RarifyVoiceLines, true )
		end
		upgradeTraitData.RarityUpgradeData.Uses = upgradeTraitData.RarityUpgradeData.Uses - 1
		TraitUIUpdateText( GetHeroTrait( upgradeTraitData.Name ) )	
		if upgradeTraitData.RarityUpgradeData.Uses <= 0 then
			if not upgradeTraitData.Slot then
				RemoveTraitData( CurrentRun.Hero, upgradeTraitData )
			else
				ReduceTraitUses( upgradeTraitData, { Force = true })
			end
			if not upgradeTraitData.LootName and upgradeTraitData.ZeroBonusTrayText then
				upgradeTraitData.CustomName = upgradeTraitData.ZeroBonusTrayText
			end
		end
		screen.UpgradedRarity = true
		local notifyName = "ScreenInput"
		if screen.Name ~= nil then
			notifyName = notifyName..screen.Name
		end
		TeleportCursor({ DestinationId = button.Id, ForceUseCheck = true, })
		killTaggedThreads( "RarifyPulse" )
	end
end)

modutil.mod.Path.Override("UpgradeChoiceScreenCheckRarifyButton", function(screen, button)
	local textData = {}
	local lootData = button.LootData
    local uses = 0
	local upgradeTraitData = nil
	local multiUse = false
	local maxRarity = 0
	for _, traitData in ipairs( CurrentRun.Hero.Traits ) do
		if traitData.RarityUpgradeData then
			if not traitData.RarityUpgradeData.LootName and ( button.LootData.GodLoot or button.LootData.TreatAsGodLootByShops) and (not traitData.RarityUpgradeData.RequireNotExcludeFromLastRunBoon or not button.LootData.ExcludeFromLastRunBoon ) then
				upgradeTraitData = traitData
                if upgradeTraitData.RarityUpgradeData.RequireFated and not IsFateValid() then
                else 
                    uses = uses + upgradeTraitData.RarityUpgradeData.Uses
					if upgradeTraitData.RarityUpgradeData.MaxRarity > maxRarity then
						maxRarity = upgradeTraitData.RarityUpgradeData.MaxRarity
					end
                end
			end
			if lootData.Name == traitData.RarityUpgradeData.LootName then
				-- More specific upgrades always take priority over general ones
				upgradeTraitData = traitData
                uses = uses + upgradeTraitData.RarityUpgradeData.Uses
				if upgradeTraitData.RarityUpgradeData.MaxRarity > maxRarity then
				maxRarity = upgradeTraitData.RarityUpgradeData.MaxRarity
				end
			end
		end
	end
	
	local validUpgradeIndex = false
	if  upgradeTraitData and uses then
		if uses > 0 then
			local traitData = button.Data
			if traitData.MultiUse then
				multiUse = true
			end
			for i, upgradeData in pairs(lootData.UpgradeOptions) do
				if not traitData.BlockMenuRarify and traitData.Name == upgradeData.ItemName and GetUpgradedRarity(traitData.Rarity) ~= nil and traitData.RarityLevels[GetUpgradedRarity(traitData.Rarity)] ~= nil and GetRarityValue( traitData.Rarity ) <= maxRarity then
					upgradeData.Rarity = GetUpgradedRarity(traitData.Rarity)
					validUpgradeIndex = true
				end
			end
		end
	end
	local multiUse = false
	if upgradeTraitData and uses>0 then
		multiUse = true
	end
	if validUpgradeIndex and (not screen.UpgradedRarity or multiUse) and not screen.TraitTrayOpened then
		local text = "Boon_Upgrade"
		if multiUse then
			text = "Boon_Upgrade_Count"
		end
		screen.Components.RarifyButton.Visible = true
		SetAlpha({ Id = screen.Components.RarifyButton.Id, Fraction = 1.0, Duration = 0.2 })
		ModifyTextBox({ Id = screen.Components.RarifyButton.Id, Text = text, LuaKey = "TempTextData", LuaValue = { Amount = uses, MaxAmount = upgradeTraitData.RarityMultiplier } } )
		if not screen.FirstRarifyPrompt then
			thread( PulseContextActionPresentation, screen.Components.RarifyButton, { ThreadName = "RarifyPulse" } )
			screen.FirstRarifyPrompt = true
		end
	else
		screen.Components.RarifyButton.Visible = false
		SetAlpha({ Id = screen.Components.RarifyButton.Id, Fraction = 0.0, Duration = 0.2 })
	end
end)

modutil.mod.Path.Wrap("CheckChamberTraits", function(base)
    base()
    RandomSynchronize(GetRunDepth(CurrentRun))
    local textDelay = 0
    local totalEmptyAddedHealth = 0
    for i, trait in ipairs(CurrentRun.Hero.Traits) do
        if trait.RoomsPerUpgrade then
            if trait.RoomsPerUpgrade.Amount and trait.CurrentRoom == 0 then
                if trait.RoomsPerUpgrade.EmptyMaxHealth then
                    local addedEmptyHealth = round(trait.RoomsPerUpgrade.EmptyMaxHealth)
                    AddMaxHealth(addedEmptyHealth, trait.Name, { Thread = true, Delay = textDelay, NoHealing = true })
                    totalEmptyAddedHealth = totalEmptyAddedHealth + addedEmptyHealth
                end
				if trait.RoomsPerUpgrade.FlipTheArcanaRandomElement then
					mod.AddEncouragementElements(1)
				end
            end
        end
    end    
end)

modutil.mod.Path.Wrap("Kill", function(base, victim, triggerArgs)
	if victim and victim.IsBoss and not victim.BlockPostBossMetaUpgrades and (not victim.UseGroupHealthBar or victim.GroupHealthBarOwner) then
		local room = CurrentRun.CurrentRoom
		if room then
			local encounter = room.Encounter
			if encounter and encounter.SkipBossTraits then
			else
				if HeroHasTrait("ReversedBonusRarityMetaUpgrade") then
					local addFamiliarsTrait = GetHeroTrait("ReversedBonusRarityMetaUpgrade")
					mod.AwardExtraPassiveFamiliarTrait(addFamiliarsTrait.RankAwarded)
				end
			end
		end
	end
	return base(victim, triggerArgs)
end)

function mod.AwardDuosAndLegendaryTraits()
	local addedTraits = {}
	local DuoAndLegendaryTraits = {"RandomStatusBoon","DoubleExManaBoon","DoubleBloodDropBoon","InstantRootKill","WeaponUpgradeBoon","AllElementalBoon","BurnSprintBoon","AmplifyConeBoon","SpawnKillBoon","ManaBurstCountBoon","SprintEchoBoon","CharmCrowdBoon","AllCloseBoon","MaxHealthDamageBoon","BurnRefreshBoon","SlamManaBurstBoon","BloodManaBurstBoon","ApolloSecondStageCastBoon","RaiseDeadBoon","PoseidonSplashSprintBoon","StormSpawnBoon","CoverRegenerationBoon","BlindClearBoon","DoubleSwordBoon","SelfCastBoon","AutoRevengeBoon","BloodRetentionBoon","RapidSwordBoon","DoubleSplashBoon","FireballRendBoon","RootStrikeBoon","KeepsakeLevelBoon","GoodStuffBoon","BurnConsumeBoon","ClearRootBoon","ManaShieldBoon","ReboundingSparkBoon","MassiveCastBoon","DoubleMassiveAttackBoon","MoneyDamageBoon","ManaRestoreDamageBoon","SteamBoon","EchoBurnBoon","LightningVulnerabilityBoon",}
		local eligibleTraits = {}
		for s, traitName in pairs( DuoAndLegendaryTraits ) do
			if IsGameStateEligible(TraitData, game.TraitData[traitName].GameStateRequirements) and not HeroHasTrait( traitName ) then
				table.insert(eligibleTraits, traitName )
			end
		end
		if not IsEmpty(eligibleTraits) then
			local traitName  = GetRandomValue( eligibleTraits )
			AddTraitToHero({ TraitName = traitName, FromLoot = true, SkipActivatedTraitUpdate = true })
			addedTraits[traitName] = true
		end
	thread( BoonGrantedPresentation, addedTraits, 2.0 )
	
	CheckActivatedTraits( CurrentRun.Hero, { SkipPresentation = true } )
end

modutil.mod.Path.Wrap("HasNeighboringUnlockedCards", function(base, row, column)
	if Incantations.isIncantationEnabled("ExtraArcanaWorldUpgradeCardFlip") then
		return true
	else
		return base(row,column)
	end
end)

function mod.UpgradeAllTraits()
	local sourceTraitData = nil
	local traitDictionary = {}
	local upgradableTraits = {}
	local upgradedTraits = {}
	local delay = 1.5
	for i, traitData in ipairs( CurrentRun.Hero.Traits ) do
		if not traitDictionary[traitData.Name] and IsGodTrait(traitData.Name, { ForShop = true }) and TraitData[traitData.Name] and not traitData.BlockInRunRarify and not (traitData.Rarity == "Heroic" or traitData.Rarity == "Duo" or traitData.Rarity == "Legendary`") then
			table.insert(upgradableTraits, traitData )
			traitDictionary[traitData.Name] = true
		end
	end
	
	while not IsEmpty( upgradableTraits ) do
		local traitData = RemoveRandomValue( upgradableTraits )
		if traitData.Name == "BoonDecayBoon" then
			-- Kludge to make space for BoonDecayBoon's CreditMissingStacks presentation
			delay = delay + 1.5
		end
		upgradedTraits[traitData.Name] = true
		local numOldTrait = GetTraitCount( CurrentRun.Hero, { TraitData = traitData } )
		local OldRarity = traitData.Rarity
		local newRarity = "Heroic"
		if OldRarity == "Common" then
			newRarity = "Rare"
		elseif OldRarity == "Rare" then
			newRarity = "Epic"
		elseif OldRarity == "Epic" then
			newRarity = "Heroic"
		else
			newRarity = "Heroic"
		end
		RemoveTrait( CurrentRun.Hero, traitData.Name, { SkipActivatedTraitUpdate = true, SkipExpire = true })
		local persistentValues = {}
		for i, key in pairs( PersistentTraitKeys ) do
			persistentValues[key] = traitData[key]
		end

		local processedData = GetProcessedTraitData({ Unit = CurrentRun.Hero, StackNum = numOldTrait, TraitName = traitData.Name, Rarity = newRarity }) 
		for i, key in pairs( PersistentTraitKeys ) do
			processedData[key] = persistentValues[key]
		end
		processedData = AddTraitToHero({ TraitData = processedData, SkipActivatedTraitUpdate = true, SkipSetup = true })
	end
	thread( IncreasedTraitRarityPresentation, upgradedTraits, delay )
	if HeroHasTrait("CommonGlobalDamageBoon") then
		local trait = GetHeroTrait("CommonGlobalDamageBoon")
		if not trait.Activated then
			CheckActivatedTraits( CurrentRun.Hero, { OnlyCheckTraitName = trait.Name } )
		end
	end
end

modutil.mod.Path.Wrap("StartEncounterEffects", function(base, encounter)
	base(encounter)
	encounter = encounter or CurrentRun.CurrentRoom.Encounter
	--[[if (encounter.EncounterType == "Boss" or encounter.EncounterType == "Miniboss") and HeroHasTrait("ReversedSorceryRegenMetaUpgrade") then
		local heal = GetTotalHeroTraitValue("BossHealFraction") * CurrentRun.Hero.MaxHealth *CalculateHealingMultiplier()
		Heal(CurrentRun.Hero, {HealAmount = heal, Silent = true})
	end]]
	if HeroHasTrait("ReversedStartingGoldMetaUpgrade") then
		local armorTrait = GetHeroTrait("ReversedStartingGoldMetaUpgrade")
		local armorAmount = armorTrait.ArmorGranted
		if CurrentRun.Hero.HealthBuffer < 10 then
			armorAmount = 2*armorAmount
		end
		AddArmor(armorAmount, {Delay = 0.25})
		FrameState.RequestUpdateHealthUI = true
	end
	if HeroHasTrait("ReversedLastStandMetaUpgrade") then
		local lastStandHealTrait = GetHeroTrait("ReversedLastStandMetaUpgrade")
		thread(mod.NoLastStandRegeneration, unit, lastStandHealTrait.ModdedSetupFunction.Args)
	end
end)

modutil.mod.Path.Wrap("AddStackToTraits", function(base, source, args)
	if HeroHasTrait("ReversedMetaToRunUpgradeMetaUpgrade") then
		local increasedUpgradeTrait = GetHeroTrait("ReversedMetaToRunUpgradeMetaUpgrade")
		if not args then
			args = ShallowCopyTable(source)
			source = {} 
		end
		if RandomChance(increasedUpgradeTrait.ExtraTraitChance) then
			args.NumTraits = args.NumTraits or 1
			args.NumTraits = (args.NumTraits+1)
		end
	end
	return base(source, args)
end)

modutil.mod.Path.Wrap("AddTraitData", function(base, unit, traitData, args)
	local newTrait = DeepCopyTable( traitData )
	if newTrait and newTrait.Name == "ReversedEpicRarityBoostMetaUpgrade" and not (game.CurrentHubRoom and game.CurrentHubRoom.Name == "Hub_PreRun") then
		mod.AddEncouragementElements(newTrait.ElementsGranted)
		GrantBoons({BoonSets = {{ "ElementalDamageBoon", "ElementalOlympianDamageBoon", "ElementalBaseDamageBoon", "ElementalRallyBoon", "ElementalDamageFloorBoon", "ElementalDodgeBoon", "ElementalHealthBoon", "ElementalDamageCapBoon", "ElementalUnifiedBoon" },}}, nil)
	end
	if newTrait and newTrait.Name == "ReversedRandomCardsMetaUpgrade" and not (game.CurrentHubRoom and game.CurrentHubRoom.Name == "Hub_PreRun") then
		thread(AddRandomMetaUpgrades, newTrait.FlipTheArcanaRandomCards, {RarityLevel = 1, Delay = 4} )
	end
	if newTrait and newTrait.Name == "ReversedMoreSacrificesMetaUpgrade" and not (game.CurrentHubRoom and game.CurrentHubRoom.Name == "Hub_PreRun") then
		mod.IncreaseSacrificeChance(newTrait.FlipTheArcanaBonusSacrificeChance)
	end
	if newTrait and newTrait.Name == "ReversedKeepsakeReAddMetaUpgrade" and not CurrentRun.FlipTheArcanaRegretMetaUpgrades and not (game.CurrentHubRoom and game.CurrentHubRoom.Name == "Hub_PreRun") then
		thread(mod.AddFragileCards,newTrait.FlipTheArcanaRandomCards)
	end
	return base(unit, traitData, args)
end)



function mod.IncreaseSacrificeChance(amount)
	if not CurrentRun.FlipTheArcanaIncreasedSacrificeChance then
		CurrentRun.Hero.BoonData.ReplaceChance = CurrentRun.Hero.BoonData.ReplaceChance + amount
		CurrentRun.FlipTheArcanaIncreasedSacrificeChance = true
	end
end

modutil.mod.Path.Wrap("OpenTalentScreen", function(base, args, spellItem, contextArgs)
	args = args or {}
	if HeroHasTrait("ReversedBonusTalentMetaUpgrade") and not args.ReadOnly and spellItem and spellItem.AddTalentPoints then
		local trait = GetHeroTrait("ReversedBonusTalentMetaUpgrade")
		if trait.FlipTheArcanaBonusTalentPoints and trait.FlipTheArcanaBonusTalentPoints > 0 then
			CurrentRun.NumTalentPoints = CurrentRun.NumTalentPoints or 0
			CurrentRun.NumTalentPoints = CurrentRun.NumTalentPoints + trait.FlipTheArcanaBonusTalentPoints
			trait.FlipTheArcanaBonusTalentPoints = 0
		end
	end
	return base(args, spellItem, contextArgs)
end)



function mod.AddEncouragementElements(elementsToAdd)
	local elementsAdded = 0 
	local eligibleEssence = {"FireEssence", "WaterEssence","EarthEssence", "AirEssence"}
	local essenceToAdd = GetRandomValue(eligibleEssence)
	while elementsAdded < elementsToAdd do
		AddTraitToHero({TraitName = essenceToAdd})
		elementsAdded = elementsAdded + 1
		essenceToAdd = GetRandomValue(eligibleEssence)
	end
end

function mod.NoLastStandRegeneration( unit, args )
	while CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead do
		game.wait(args.Interval, "FlipTheArcanaNoLastStandRegeneration")
		if CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead and (IsCombatEncounterActive( CurrentRun ) or ((not IsEmpty(ActiveEnemies)) and CurrentRun.CurrentRoom.Encounter.EncounterType == "Boss")) and not HasLastStand( CurrentRun.Hero ) and CurrentRun.Hero.Health < CurrentRun.Hero.MaxHealth and CurrentRun.CurrentRoom.Encounter.EncounterType == "Boss" then
			Heal( CurrentRun.Hero, { HealAmount = 1, SourceName = "FlipTheArcanaNoLastStandRegeneration", Silent = true })
			FrameState.RequestUpdateHealthUI = true
			CreateAnimation({ Name = "HealthSparkleShower", DestinationId = CurrentRun.Hero.ObjectId, Group = "Overlay" })
		end
	end
end

function mod.AwardExtraPassiveFamiliarTrait(rank)
	local traitTable = { "CompanionshipHealthFamiliar", "CompanionshipCritFamiliar", "CompanionshipDigFamiliar",
		"CompanionshipDodgeFamiliar", "CompanionshipLastStandFamiliar" }
	if HeroHasTrait("HealthFamiliar") or HeroHasTrait("CompanionshipHealthFamiliar") or not GameState.FamiliarsUnlocked.FrogFamiliar then
		for k, v in pairs(traitTable) do
			if v == "CompanionshipHealthFamiliar" then
				table.remove(traitTable, k)
			end
		end
	end
	if HeroHasTrait("CritFamiliar") or HeroHasTrait("CompanionshipCritFamiliar") or not GameState.FamiliarsUnlocked.RavenFamiliar then
		for k, v in pairs(traitTable) do
			if v == "CompanionshipCritFamiliar" then
				table.remove(traitTable, k)
			end
		end
	end
	if HeroHasTrait("DigFamiliar") or HeroHasTrait("CompanionshipDigFamiliar") or not GameState.FamiliarsUnlocked.HoundFamiliar then
		for k, v in pairs(traitTable) do
			if v == "CompanionshipDigFamiliar" then
				table.remove(traitTable, k)
			end
		end
	end
	if HeroHasTrait("DodgeFamiliar") or HeroHasTrait("CompanionshipDodgeFamiliar") or not GameState.FamiliarsUnlocked.PolecatFamiliar then
		for k, v in pairs(traitTable) do
			if v == "CompanionshipDodgeFamiliar" then
				table.remove(traitTable, k)
			end
		end
	end
	if HeroHasTrait("LastStandFamiliar") or HeroHasTrait("CompanionshipLastStandFamiliar") or not HeroHasTrait("LastStand") or not GameState.FamiliarsUnlocked.CatFamiliar then
		for k, v in pairs(traitTable) do
			if v == "CompanionshipLastStandFamiliar" then
				table.remove(traitTable, k)
			end
		end
	end

	if #traitTable > 0 then
		local newFamiliarTrait = RemoveRandomValue(traitTable)
		local rarity = "Common"
		if rank == 1 then
			rarity = "Common"
		elseif rank == 2 then
			rarity = "Rare"
		elseif rank == 3 then
			rarity = "Epic"
		elseif rank == 4 then
			rarity = "Heroic"
		end
		AddTrait(CurrentRun.Hero, newFamiliarTrait, rarity)
		if newFamiliarTrait == "CompanionshipLastStandFamiliar" then
			local newCatTrait = GetHeroTrait("CompanionshipLastStandFamiliar")
			AddLastStand({
			Name = "LastStandFamiliar",
			Icon = "ExtraLifeCatFamiliar",
			InsertAtEnd = true,
			IncreaseMax = true,
			HealAmount = newCatTrait.AcquireFunctionArgs.HealAmount})
		end
	end
end

modutil.mod.Path.Wrap("DoZeusSpawnDamage", function(base, enemy, traitArgs, damageAmount)
if traitArgs.Vfx == "DemeterBossIceShatter" and not enemy.BlockCharm then
	wait(0.1, RoomThreadName )
	CreateAnimation({ Name = traitArgs.Vfx, DestinationId = enemy.ObjectId, Group = "FX_Standing_Top" })
	thread( mod.FamineSpawnKillPresentation, enemy )
	thread( Damage, enemy, { AttackerId = CurrentRun.Hero.ObjectId, AttackerTable = CurrentRun.Hero, SourceProjectile = "ZeusOnSpawn", DamageAmount = damageAmount, Silent = false, PureDamage = true, IgnoreHealthBuffer = true } )
else
	return base(enemy,traitArgs,damageAmount)
end
end)


modutil.mod.Path.Wrap("LowHealthBonusBuffStatePresentation", function(base,delay)
base(delay)
if HeroHasTrait("ReversedLastStandMetaUpgrade") then
	if HeroHasTrait("LowHealthBonusMetaUpgrade") then
		wait(delay)
	end
	if not HasLastStand( CurrentRun.Hero ) then
			thread( InCombatTextArgs, { TargetId = CurrentRun.Hero.ObjectId, Text = "NoLastStandsEffectActivated", ShadowScaleX = 1.5, SkipRise = false, SkipFlash = false, Duration = 1.5, OffsetY = offsetY, LuaKey = "TempTextData", LuaValue = { Name = "ReversedLastStandMetaUpgrade" }})	
			PlaySound({ Name = "/Leftovers/SFX/PlayerMovementPower", Id = CurrentRun.Hero.ObjectId })
		else
			thread( InCombatTextArgs, { TargetId = CurrentRun.Hero.ObjectId, Text = "NoLastStandsEffectDeactivated", ShadowScaleX = 1.5, SkipRise = false, SkipFlash = false, Duration = 1.5, OffsetY = offsetY, LuaKey = "TempTextData", LuaValue = { Name = "ReversedLastStandMetaUpgrade" }})	
			PlaySound({ Name = "/Leftovers/SFX/OutOfAmmo", Id = CurrentRun.Hero.ObjectId })
		end
end
end)

modutil.mod.Path.Wrap("HandleUpgradeChoiceSelection", function(base,screen,button,args)
	local source = screen.Source
	local spawnTarget = nil
	local duplicateOnClose = false
	local name = source.Name
	args = args or {}

	local upgradeData = button.Data
	if HeroHasTrait("ReversedHealthWithBoonsMetaUpgrade") and (source.GodLoot or name == "HermesUpgrade") then
		local trait = GetHeroTrait("ReversedHealthWithBoonsMetaUpgrade")
		AddMaxHealth(trait.FlipTheArcanaHealthWithBoons, trait, {Thread = true, Delay = 0.5})
	end
	if HeroHasTrait("ReversedDoorRerollMetaUpgrade") and IsFateValid() and not source.StrifeDuplicated and (source.GodLoot or source.CanDuplicate or name == "WeaponUpgrade" or name == "HermesUpgrade") then
		local doubleRewardTrait = GetHeroTrait("ReversedDoorRerollMetaUpgrade")
		if doubleRewardTrait and RandomChance(doubleRewardTrait.ModdedDoubleRewardChance * GetTotalHeroTraitValue( "LuckMultiplier", { IsMultiplier = true })) then
			duplicateOnClose = true
			spawnTarget = SpawnObstacle({ Name = "InvisibleTarget", Group = "Standing", DestinationId = source.ObjectId })
		end
	end
	if duplicateOnClose and spawnTarget then
		wait( 0.75 )
		local newLoot = CreateLoot({ Name = name, SpawnPoint = spawnTarget })
		newLoot.StrifeDuplicated = true
		thread( mod.StrifeDoubleRewardPresentation, newLoot.ObjectId )
		Destroy({ Id = spawnTarget })
	end
	local outcome = base(screen,button,args)
	if upgradeData.MetaUpgrade then
		local cardName = mod.GetCardFromTrait(upgradeData.Name)
		if MetaUpgradeCardData[ cardName ].OnGrantedFunctionName then
			thread( CallFunctionName, MetaUpgradeCardData[ cardName ].OnGrantedFunctionName, MetaUpgradeCardData[ cardName ].TraitName, MetaUpgradeCardData[ cardName ].OnGrantedFunctionArgs, args )
		end
		CurrentRun.TemporaryMetaUpgrades[cardName] = true
		GameState.MetaUpgradeState[cardName].Equipped = true
		if CheckRoomExitsReady(CurrentRun.CurrentRoom) then
			UnlockRoomExits(CurrentRun, CurrentRun.CurrentRoom)
		end
		if config.AlwaysUnlockAfterPurge then
			UnlockRoomExits(CurrentRun, CurrentRun.CurrentRoom)
		end
	end
	return outcome
end)

modutil.mod.Path.Wrap("CreateStackLoot", function(base, args)
	args = args or {}
	if args.StackNum == nil then
		args.StackNum = 1
	end
	if HeroHasTrait("ReversedScreenRerollMetaUpgrade") and IsFateValid() then
		local chanceUpgradeBoon = GetHeroTrait("ReversedScreenRerollMetaUpgrade")
		if chanceUpgradeBoon and RandomChance(chanceUpgradeBoon.ModdedUpgradeChance) then
		args.StackNum = args.StackNum * 2
		end
	end
	return base(args)
end)


function mod.StrifeDoubleRewardPresentation( objectId )
	CreateAnimation({ Name = "ErisCurseFx", DestinationId = objectId })
	ApplyUpwardForce({ Id = objectId, Speed = RandomFloat( 500, 700 ) })
	ApplyForce({ Id = objectId, Speed = RandomFloat( 75, 260 ), Angle = RandomFloat( 0, 360 ) })


	wait( 0.75 )
	PlaySound({ Name = "/SFX/Menu Sounds/PortraitEmoteSparklySFX" })
	local toastAnchor = SpawnObstacle({ Name = "BlankObstacle", DestinationId = CurrentRun.Hero.ObjectId, Group = "Combat_Menu_Additive" })
	DrawScreenRelative({ Id = toastAnchor })
	CreateAnimation({ Name = "BiomeStateGoldFx", DestinationId = toastAnchor, OffsetX = 0, OffsetY = 0, Group = "Combat_Menu_Additive" })
	thread( InCombatText, objectId, "Hint_StrifeDoubleUp", 0.75 )
end


modutil.mod.Path.Wrap("CalculateDamageMultipliers", function(base,attacker, victim, weaponData, triggerArgs) 
	local originalDamageMultiplier = base(attacker,victim,weaponData, triggerArgs)
	if attacker then
	if attacker == CurrentRun.Hero and HeroHasTrait("ReversedSprintShieldMetaUpgrade") then
		if victim and not victim.FliptheArcanaHasBeenHit then
			victim.FliptheArcanaHasBeenHit = true
			local firstHitTrait = GetHeroTrait("ReversedSprintShieldMetaUpgrade")
			originalDamageMultiplier = originalDamageMultiplier + (1+firstHitTrait.FirstHitMultiplier)
		end
	end
	if attacker == CurrentRun.Hero and HeroHasTrait("ReversedMagicCritMetaUpgrade") and victim and GameState.SpentShrinePointsCache then
		local fearMultipliedTrait = GetHeroTrait("ReversedMagicCritMetaUpgrade")
		originalDamageMultiplier = originalDamageMultiplier + (fearMultipliedTrait.FearMultipliedMultiplier * GameState.SpentShrinePointsCache/10000)
	end
	if attacker == CurrentRun.Hero and HeroHasTrait("ReversedStatusVulnerabilityMetaUpgrade") and victim then
		local noStatusDamageTrait = GetHeroTrait("ReversedStatusVulnerabilityMetaUpgrade")
		if TableLength( victim.VulnerabilityEffects ) == nil or TableLength( victim.VulnerabilityEffects ) < 1 then
			originalDamageMultiplier = originalDamageMultiplier + noStatusDamageTrait.NoStatusBonusDamage
		elseif TableLength( victim.VulnerabilityEffects ) == 1 then
			originalDamageMultiplier = originalDamageMultiplier + 0.5*noStatusDamageTrait.NoStatusBonusDamage
		end
	end
	if MapState and MapState.FlipTheArcanaCrowdCharmedEnemy and MapState.FlipTheArcanaCrowdCharmedEnemy.ObjectId and attacker == MapState.FlipTheArcanaCrowdCharmedEnemy.ObjectId and victim ~= CurrentRun.Hero and HeroHasTrait("ReversedCharmedEnemyMetaUpgrade") then
		local trait =GetHeroTrait("ReversedCharmedEnemyMetaUpgrade")
		originalDamageMultiplier = originalDamageMultiplier + trait.CharmedEnemyMultiplier
	end
	if attacker == CurrentRun.Hero and HeroHasTrait("ReversedCrowdDamageMetaUpgrade") and weaponData and IsExWeapon(weaponData.Name, { Combat = true }, triggerArgs) then
		local trait = GetHeroTrait("ReversedCrowdDamageMetaUpgrade")
		if mod.GetNumberofEnemies() >= trait.FlipTheArcanaCrowdThreshold then
		originalDamageMultiplier = originalDamageMultiplier + trait.FlipTheArcanaCrowdDamage
		end
	end
	if attacker == CurrentRun.Hero and HeroHasTrait("ReversedFullDefianceMetaUpgrade") and mod.AtFullDefiance() then
		local trait = GetHeroTrait("ReversedFullDefianceMetaUpgrade")
		originalDamageMultiplier = originalDamageMultiplier + trait.FlipTheArcanaFullLastStandDamageMultiplier
	end
end

	return originalDamageMultiplier
end)

--[[modutil.mod.Path.Wrap("CalculateCritChance", function(base, attacker, victim, weaponData, triggerArgs) 
	local originalCritChance = base(attacker,victim,weaponData, triggerArgs)
	if HeroHasTrait("ReversedTradeOffMetaUpgrade") and IsFateValid() and victim and victim ~= CurrentRun.Hero then
		local fatedCritTrait = GetHeroTrait("ReversedTradeOffMetaUpgrade")
		originalCritChance = originalCritChance + fatedCritTrait.FatedCritcalChance
	end
	return originalCritChance
end)]]

function mod.GetNumberOfCardsActive()
	local numCards = 0
	for cardName, cardData in pairs(GameState.MetaUpgradeState) do
		if cardData.Equipped then 
			numCards = numCards + 1
		end
	end
	return numCards
end

modutil.mod.Path.Override("AddRandomMetaUpgrades", function(numCards, args)
args = args or {}
	numCards = numCards or 3
	local totalMetaUpgradesEquipped = mod.GetNumberOfCardsActive()
	if config and config.LimitMaxArcanaDrawn and config.MaxArcanaDrawn then
		local maxArcanaDrawn = config.MaxArcanaDrawn or 40
		numCards = math.min(numCards, maxArcanaDrawn - totalMetaUpgradesEquipped)
		numCards = math.max(numCards, 0)
	end
	local delay = args.Delay or 3
	local unequippedUnlockedMetaupgrades = {}
	local skippedLowPriorityMetaupgrade = {}
	local equippedMetaUpgrades = {}
	local combinedMetaUpgradeDefaultCardLayout = DeepCopyTable(mod.MetaUpgradeDefaultCardLayout)
	for cardName, cardData in pairs(GameState.MetaUpgradeState) do
		if cardData.Equipped then		
			equippedMetaUpgrades[cardName] = true
		end
	end
	local drawCards = {"CardDraw", "ReversedCardDraw", "ReversedKeepsakeReAdd", "ReversedRandomBuild"}
	local hasADrawCard = false
	for _, cardName in pairs(drawCards) do
		local metaUpgradeData = GameState.MetaUpgradeState[cardName]
		if metaUpgradeData and metaUpgradeData.Equipped then
			hasADrawCard = true
		end
	end
	for row, rowData in pairs( combinedMetaUpgradeDefaultCardLayout ) do
		for column, cardName in pairs( rowData ) do
			local metaUpgradeData = GameState.MetaUpgradeState[cardName]
			if metaUpgradeData and metaUpgradeData.Unlocked and not metaUpgradeData.Equipped then
				local fateConflict = false
				if GameState.FatedStatus == "Fated" and FatedDisableMetaUpgrades[cardName] then
					fateConflict = true
				end
				if GameState.FatedStatus ~= "Fated" and (cardName == "ReversedDoorReroll" or cardName == "ReversedTradeOff" or cardName == "ReversedScreenReroll") then
					fateConflict = true
				end
				if not fateConflict and not (hasADrawCard and Contains(drawCards, cardName)) then
					if MetaUpgradeCardData[cardName].RandomDrawChance then
						if RandomChance(MetaUpgradeCardData[cardName].RandomDrawChance) then
							table.insert(unequippedUnlockedMetaupgrades, cardName)
						else
							table.insert(skippedLowPriorityMetaupgrade, cardName)
						end
					else
						table.insert(unequippedUnlockedMetaupgrades, cardName)
					end
				end
			end
		end
	end

	local addedMetaUpgrades = {}
	
	while (not IsEmpty( unequippedUnlockedMetaupgrades ) or not IsEmpty( skippedLowPriorityMetaupgrade )) and numCards > 0 do
		numCards = numCards - 1
		local metaUpgradeName = nil
		if not IsEmpty( unequippedUnlockedMetaupgrades ) then
			metaUpgradeName = RemoveRandomValue(unequippedUnlockedMetaupgrades)
		else
			metaUpgradeName = RemoveRandomValue(skippedLowPriorityMetaupgrade)
		end
		if MetaUpgradeCardData[metaUpgradeName].RequiredCardNames and not ContainsAnyKey( equippedMetaUpgrades, MetaUpgradeCardData[metaUpgradeName].RequiredCardNames ) and not IsEmpty(unequippedUnlockedMetaupgrades) then
			table.insert( skippedLowPriorityMetaupgrade, metaUpgradeName )
			metaUpgradeName = RemoveRandomValue( unequippedUnlockedMetaupgrades )
		end
		if Contains(drawCards, metaUpgradeName) then
			for _, cardName in pairs(drawCards) do
			RemoveValue(unequippedUnlockedMetaupgrades, cardName)
			RemoveValue(skippedLowPriorityMetaupgrade, cardName)
			end
		end
		CurrentRun.TemporaryMetaUpgrades[metaUpgradeName] = true
		GameState.MetaUpgradeState[metaUpgradeName].Equipped = true
		equippedMetaUpgrades[metaUpgradeName] = true

		table.insert( addedMetaUpgrades, metaUpgradeName )
		if MetaUpgradeCardData[ metaUpgradeName ].TraitName then
			local rarityLevel = GetMetaUpgradeLevel( metaUpgradeName )
			if args.RarityLevel then
				rarityLevel = args.RarityLevel
			end
			AddTraitToHero({ 
				SkipNewTraitHighlight = true, 
				TraitName = MetaUpgradeCardData[ metaUpgradeName ].TraitName, 
				Rarity = TraitRarityData.RarityUpgradeOrder[ rarityLevel ],
				CustomMultiplier = 1,
				SourceName = metaUpgradeName,
				})
		end
		if MetaUpgradeCardData[ metaUpgradeName ].OnGrantedFunctionName and CurrentRun.CurrentRoom then
			thread( CallFunctionName, MetaUpgradeCardData[ metaUpgradeName ].OnGrantedFunctionName, MetaUpgradeCardData[ metaUpgradeName ].TraitName, MetaUpgradeCardData[ metaUpgradeName ].OnGrantedFunctionArgs, args )
		end
	end
	if not IsEmpty(addedMetaUpgrades) then
	thread( AddedMetaUpgradePresentation, addedMetaUpgrades, delay )
	end
end)


modutil.mod.Path.Wrap("SetupMap", function(base)
	local packageName = _PLUGIN.guid .. "NewCardArt"
	game.LoadPackages({ Name = packageName })
	return base()
end)

modutil.mod.Path.Wrap("CreateUpgradeChoiceButton", function(base,screen, lootData, itemIndex, itemData, args)
	if lootData.IsMetaUpgradeSource and itemData.ItemName ~= "FallbackGold" then
		local output = base(screen, lootData, itemIndex, itemData, args)
		args = args or {}
		local components = screen.Components
		local icon = ShallowCopyTable( screen.Icon )
		local itemLocationY = (ScreenCenterY - 190) + screen.ButtonSpacingY * ( itemIndex - 1 ) + 50
		local itemLocationX = ScreenCenterX - 355
		local purchaseButtonKey = "PurchaseButton"..itemIndex
		local upgradeData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = itemData.ItemName, Rarity = itemData.Rarity })
		icon.X = screen.IconOffsetX + itemLocationX + screen.ButtonOffsetX
		icon.Y = screen.IconOffsetY + itemLocationY 
		icon.Animation = MetaUpgradeCardData[ mod.GetCardFromTrait(upgradeData.Name)].Image
		icon.Scale = 0.35
		icon.Group = args.ButtonGroupName or icon.Group
		components[purchaseButtonKey.."Icon"] = CreateScreenComponent( icon )
		
		return output
	else 
		return base(screen, lootData, itemIndex, itemData, args)
	end
end)


modutil.mod.Path.Wrap("ShowBoonInfoScreen", function(base, args)
	local screen = DeepCopyTable( ScreenData.BoonInfo )
	screen.LootName = args.LootName
	if not args.CodexEntryData then
		return
	else
		return base(args)
	end
end)

modutil.mod.Path.Wrap("SetTraitsOnLoot", function(base, lootData, args)
	if lootData.IsMetaUpgradeSource then
		local baseValue = base(lootData, args)
		for metaUpgradeName, metaUpgradeData in ipairs(lootData.UpgradeOptions) do
			metaUpgradeData.Rarity = TraitRarityData.RarityUpgradeOrder[GetMetaUpgradeLevel(mod.GetCardFromTrait(metaUpgradeData.ItemName))]
		end
		return baseValue
	else
		return base(lootData, args)
	end
end)


function mod.GetCardFromTrait(traitName)
	local combinedMetaUpgradeDefaultCardLayout = DeepCopyTable(mod.MetaUpgradeDefaultCardLayout)
	for row, rowData in pairs( combinedMetaUpgradeDefaultCardLayout ) do
		for column, cardName in pairs( rowData ) do
			local metaUpgradeData = MetaUpgradeCardData[cardName]
			if metaUpgradeData and metaUpgradeData.TraitName == traitName then
				return cardName
			end
		end
	end
end


function mod.SetTraitsOnLootforMonstrosity(lootData, args)
	local upgradeName = lootData.Name
	local upgradeChoiceData = lootData
	args = args or {}

	local upgradeOptions = {}
	
	lootData.Rarity = {}
	lootData.RarityRollOrder = lootData.RarityRollOrder or TraitRarityData.BoonRarityRollOrder

	if lootData.Traits then
		for _, traitName in pairs(lootData.Traits) do
			local traitData = TraitData[traitName]
			if (traitData.GameStateRequirements == nil or IsGameStateEligible(traitData, traitData.GameStateRequirements)) and traitData.PriorityRequirements and IsGameStateEligible(traitData, traitData.PriorityRequirements) then
				local rarity = "Common"
				local metaUpgradeName = mod.GetCardFromTrait(traitName)
				if GetMetaUpgradeLevel(metaUpgradeName) then
					rarity = TraitRarityData.RarityUpgradeOrder[GetMetaUpgradeLevel(metaUpgradeName)]
				end
				table.insert(upgradeOptions, { ItemName = traitName, Type = "Trait", Rarity = rarity })
			end
		end
	end

	if args and args.ExclusionNames then
		-- Remove values that are excluded
		for _, name in pairs(args.ExclusionNames) do
			for i, upgradeData in pairs(upgradeOptions) do
				if upgradeData.ItemName == name then
					upgradeOptions[i] = nil
				end
			end
		end
		upgradeOptions = CollapseTable(upgradeOptions)
	end
	local eligibleOptions = {}

	if TableLength(upgradeOptions) < 5 then
		-- don't bother with this expensive calculation if we've filled up on priority traits
		eligibleOptions = GetEligibleUpgrades(upgradeOptions, lootData, upgradeChoiceData)
	end

	-- build legal rarity table
	local rarityTable = {}
	for rarityName in pairs(TraitRarityData.RarityValues) do
		rarityTable[rarityName] = {}
	end

	for s, options in pairs({ upgradeOptions, eligibleOptions }) do
		for i, upgradeData in pairs(options) do
			local rarityLevels = nil
			if upgradeData.Type == "Trait" then
				rarityLevels = TraitData[upgradeData.ItemName].RarityLevels
			end
			if upgradeData.Type == "Consumable" then
				rarityLevels = ConsumableData[upgradeData.ItemName].RarityLevels
			end

			if rarityLevels == nil then
				rarityLevels = { Common = true }
			end

			for key, table in pairs(rarityTable) do
				if rarityLevels[key] ~= nil then
					table[upgradeData.ItemName] = upgradeData
				end
			end
		end
	end

	if args and args.ExclusionNames then
		-- Remove values that are excluded
		for i, name in pairs(args.ExclusionNames) do
			for key, table in pairs(rarityTable) do
				table[name] = nil
			end
		end
		upgradeOptions = CollapseTable(upgradeOptions)
	end

	-- process priority traits. priority traits determine rarity instead of the other way around
	for i, upgradeData in ipairs(upgradeOptions) do
		if upgradeData.Rarity then
			upgradeOptions[i].Rarity = upgradeData.Rarity
		else
			upgradeOptions[i].Rarity = "Common"
			for _, rarityName in ipairs(lootData.RarityRollOrder) do
				if rarityTable[rarityName][upgradeData.ItemName] and lootData.RarityChances and lootData.RarityChances[rarityName] and RandomChance(lootData.RarityChances[rarityName]) then
					upgradeOptions[i].Rarity = rarityName
				end
			end
		end

		for rarityName in pairs(TraitRarityData.RarityValues) do
			rarityTable[rarityName][upgradeData.ItemName] = nil
		end
	end

	-- fill rest with eligible traits
	for i = TableLength(upgradeOptions), GetTotalLootChoices() - 1 do
		local validRarities = {}

		for rarityName in pairs(TraitRarityData.RarityValues) do
			validRarities[rarityName] = not IsEmpty(rarityTable[rarityName])
		end

		local chosenUpgrade = GetRandomValue(rarityTable.Common)
		local chosenRarity = "Common"

		for _, rarityName in ipairs(lootData.RarityRollOrder) do
			if validRarities[rarityName] and lootData.RarityChances and lootData.RarityChances[rarityName] and RandomChance(lootData.RarityChances[rarityName]) then
				chosenRarity = rarityName
				chosenUpgrade = GetRandomValue(rarityTable[rarityName])
			end
		end

		if chosenUpgrade then
			chosenUpgrade.Rarity = chosenRarity
			table.insert(upgradeOptions, chosenUpgrade)

			for rarityName in pairs(TraitRarityData.RarityValues) do
				rarityTable[rarityName][chosenUpgrade.ItemName] = nil
			end
		end
	end

	-- Fill empty spots with exchange traits
	for i = TableLength(upgradeOptions), GetTotalLootChoices() - 1 do
		if IsEmpty(chosenPriorityTraits) then
			break
		end
		local chosenUpgrades = GetReplacementTraits(chosenPriorityTraits)
		if chosenUpgrades == nil or chosenUpgrades[1] == nil then
			break
		end
		local chosenUpgrade = chosenUpgrades[1]
		table.insert(upgradeOptions, chosenUpgrade)
		RemoveValueAndCollapse(chosenPriorityTraits, chosenUpgrade.ItemName)
	end

	-- Fill empty spots with any traits that failed the rarity check the first time around
	local numBans = MetaUpgradeData.BanUnpickedBoonsShrineUpgrade.ChangeValue
	if numBans <= 0 then
		for i = TableLength(upgradeOptions), GetTotalLootChoices() - 1 do
			local validRarities = {}

			for rarityName in pairs(TraitRarityData.RarityValues) do
				validRarities[rarityName] = not IsEmpty(rarityTable[rarityName])
			end

			local chosenUpgrade = GetRandomValue(rarityTable.Common)
			local chosenRarity = "Common"

			for _, rarityName in ipairs(lootData.RarityRollOrder) do
				if validRarities[rarityName] and lootData.RarityChances[rarityName] then
					chosenRarity = rarityName
					chosenUpgrade = GetRandomValue(rarityTable[rarityName])
				end
			end

			if chosenUpgrade then
				chosenUpgrade.Rarity = chosenRarity
				table.insert(upgradeOptions, chosenUpgrade)
				for rarityName in pairs(TraitRarityData.RarityValues) do
					rarityTable[rarityName][chosenUpgrade.ItemName] = nil
				end
			end
		end
	end

	-- Block rerolling if we truly have no options left
	local blockReroll = IsEmpty(chosenPriorityTraits) and (not args or IsEmpty(args.ExclusionNames))
	for rarity, validTraits in pairs(rarityTable) do
		if blockReroll and not IsEmpty(validTraits) then
			blockReroll = false
		end
	end
	lootData.BlockReroll = blockReroll
	lootData.UpgradeOptions = upgradeOptions
end

function mod.CanCardifyReward(reward)
	if not HeroHasTrait("ReversedCardDrawMetaUpgrade") then
		return false
	end
	if not reward then
		return false
	end
	if reward.ResourceCosts ~= nil and HasResourceCost( reward.ResourceCosts ) then
		return false
	end
	local cardDrawMetaTrait = GetHeroTrait("ReversedCardDrawMetaUpgrade")
	return reward.GoldConversionEligible and (cardDrawMetaTrait.Uses > 0)
end

function mod.CanSacrificeReward(reward)
	if not HeroHasTrait("ReversedSacrificeForLevelsMetaUpgrade") then
		return false
	end
	if not PommableSlottedTraitCountAtLeast("SacrificeReward", { 
					Count = 1, 
					Slots = 
					{ 
						Secondary = true,
						Rush = true, 
						Ranged = true, 
						Melee = true, 
						Mana = true, 
					}
				}) then
					return false
				end
	if not reward then
		return false
	end
	if reward.ResourceCosts ~= nil and HasResourceCost( reward.ResourceCosts ) then
		return false
	end
	local metaTrait = GetHeroTrait("ReversedSacrificeForLevelsMetaUpgrade")
	return reward.GoldConversionEligible and (metaTrait.Uses > 0)
end

modutil.mod.Path.Wrap("CanSpecialInteract", function(base, source)
	if source.ResourceCosts ~= nil and HasResourceCost( source.ResourceCosts ) then
		return false
	end
	if mod.CanCardifyReward(source) or mod.CanSacrificeReward(source) then
		return true
	else
		return base(source)
	end
end)

modutil.mod.Path.Wrap("ShowUseButton", function(base,objectId, useTarget)
	if (mod.CanCardifyReward(useTarget) or mod.CanSacrificeReward(useTarget)) and not (CanGoldifyReward(useTarget) and HeroHasTrait("GoldifyKeepsake")) then
		useTarget = ShallowCopyTable(useTarget)
		local specialText = false
		local extraSpecialText = false
		if useTarget.UseTextTalkGiftAndSpecial == "UseConvertOrGoldifyResourcePickup" then
			specialText = true
		end
		if useTarget.UseTextTalkGiftAndSpecial == "UseConvertOrGoldifyResourcePickupRunProgress" then
			extraSpecialText = true
		end
		useTarget.UseTextTalkAndSpecial = "CardifyUseLootAndConsume"
		useTarget.UseTextTalkGiftAndSpecial = "CardifyUseLootGiftAndConsume"
		if useTarget.ReplaceSpecialForGoldify then
			useTarget.UseTextTalkAndSpecial = "CardifyUseLootAndConsume"
			useTarget.UseTextTalkGiftAndSpecial = "CardifyUseLootGiftAndConsume"
			if specialText then
				useTarget.UseTextTalkGiftAndSpecial = "UseConvertOrCardifyResourcePickup"
			end
			if extraSpecialText then
				useTarget.UseTextTalkGiftAndSpecial = "UseConvertOrCardifyResourcePickupRunProgress"
			end
		end
	end
	return base(objectId, useTarget)
end)

game.OnControlPressed({ "SpecialInteract", function(triggerArgs)
	if not IsEmpty(ActiveScreens) then
		return
	end

	local target = triggerArgs.UseTarget
	if target ~= nil and (mod.CanCardifyReward( target ) or mod.CanSacrificeReward(target)) then
		
		EndAutoSprint({ Halt = true, EndWeapon = true })
		local destroyTarget = false
		if mod.CanCardifyReward(target) and IsUseable({ Id = target.ObjectId }) then
				AddInputBlock({ Name = "Cardifying" })
			local cardDrawMetaTrait = GetHeroTrait("ReversedCardDrawMetaUpgrade")
			local previouslyRequired = false
			if MapState.RoomRequiredObjects[target.ObjectId] then
				MapState.RoomRequiredObjects[target.ObjectId] = nil
				previouslyRequired = true
			end
			HideUseButton(target.ObjectId, target)
			if CurrentRun.CurrentRoom.Encounter ~= nil and CurrentRun.CurrentRoom.Encounter.RewardsToRestore ~= nil then
				CurrentRun.CurrentRoom.Encounter.RewardsToRestore[target.ObjectId] = nil
			end
			mod.CardifyPresentation(target)
			game.LootData.MonstrosityMetaUpgradeUpgrade.Name = "MonstrosityMetaUpgradeUpgrade"
			CreateLoot({Name = "MonstrosityMetaUpgradeUpgrade" , SpawnPoint = target.ObjectId })				
			local lootData = LootData["MonstrosityMetaUpgradeUpgrade"]
			destroyTarget = true
			cardDrawMetaTrait.Uses = cardDrawMetaTrait.Uses - 1
			UpdateTraitNumber(cardDrawMetaTrait)

			if target.MenuNotify then
				NotifyResultsTable[ target.MenuNotify ] = target.Name
				notifyExistingWaiters( target.MenuNotify )
			end
			if target.NotifyName then
				notifyExistingWaiters( target.NotifyName )
			end
		end
		if mod.CanSacrificeReward(target) and IsUseable({ Id = target.ObjectId }) then
			AddInputBlock({ Name = "Sacrificing" })
			local metaTrait = GetHeroTrait("ReversedSacrificeForLevelsMetaUpgrade")
			local previouslyRequired = false
			if MapState.RoomRequiredObjects[target.ObjectId] then
				MapState.RoomRequiredObjects[target.ObjectId] = nil
				previouslyRequired = true
			end
			HideUseButton(target.ObjectId, target)
			if CurrentRun.CurrentRoom.Encounter ~= nil and CurrentRun.CurrentRoom.Encounter.RewardsToRestore ~= nil then
				CurrentRun.CurrentRoom.Encounter.RewardsToRestore[target.ObjectId] = nil
			end
			mod.SacrificePresentation(target)
			destroyTarget = true
			DistributeLevels({
			Slots = { "Secondary", "Rush", "Ranged", "Melee", "Mana" },
			LevelBonus = metaTrait.BonusLevels})
			metaTrait.Uses = metaTrait.Uses - 1
			UpdateTraitNumber(metaTrait)

			if target.MenuNotify then
				NotifyResultsTable[ target.MenuNotify ] = target.Name
				notifyExistingWaiters( target.MenuNotify )
			end
			if target.NotifyName then
				notifyExistingWaiters( target.NotifyName )
			end
		end
		if destroyTarget then
			MapState.RoomRequiredObjects[target.ObjectId] = nil
			Destroy({ Id = target.ObjectId })
			if CheckRoomExitsReady(CurrentRun.CurrentRoom) then
			UnlockRoomExits(CurrentRun, CurrentRun.CurrentRoom)
			end
		end
			RemoveInputBlock({ Name = "Cardifying" })
			RemoveInputBlock({ Name = "Sacrificing" })
	end
end })

modutil.mod.Path.Wrap("GoldifyPresentation", function(base,source)
	local baseValue = base(source)
	if HeroHasTrait("ReversedCardDrawMetaUpgrade") then
		local cardDrawMetaTrait = GetHeroTrait("ReversedCardDrawMetaUpgrade")
		if cardDrawMetaTrait.Uses > 0 then
			game.LootData.MonstrosityMetaUpgradeUpgrade.Name = "MonstrosityMetaUpgradeUpgrade"
		CreateLoot({Name = "MonstrosityMetaUpgradeUpgrade", SpawnPoint = source.ObjectId })
		cardDrawMetaTrait.Uses = cardDrawMetaTrait.Uses - 1
		UpdateTraitNumber(cardDrawMetaTrait)
		end
	end
	if HeroHasTrait("ReversedSacrificeForLevelsMetaUpgrade") and PommableSlottedTraitCountAtLeast("SacrificeReward", { 
					Count = 1, 
					Slots = 
					{ 
						Secondary = true,
						Rush = true, 
						Ranged = true, 
						Melee = true, 
						Mana = true, 
					}
				}) then
		local metaTrait = GetHeroTrait("ReversedSacrificeForLevelsMetaUpgrade")
		if metaTrait.Uses > 0 then
						DistributeLevels({
			Slots = { "Secondary", "Rush", "Ranged", "Melee", "Mana" },
			LevelBonus = metaTrait.BonusLevels})

		metaTrait.Uses = metaTrait.Uses - 1
		UpdateTraitNumber(metaTrait)
		end
	end
	return baseValue
end)


function mod.CardifyPresentation( source )
	AddInputBlock({ Name = "CardifyPresentation" })
	SessionMapState.GoldifySource = source.Name
	Stop({ Id = CurrentRun.Hero.ObjectId })
	Halt({ Id = CurrentRun.Hero.ObjectId })
	wait( 0.02)
	PlaySound({ Name = "/SFX/Menu Sounds/PortraitEmoteSparklySFX" })
	PlayInteractAnimation( source.ObjectId, { Animation = GetEquippedWeaponValue( "WeaponInteractAnimation" ) })
	RemoveInputBlock({ Name = "CardifyPresentation" })
	wait( 0.2 )
	CreateAnimation({ Name = "ChronosGoldifyFx", DestinationId = source.ObjectId })
	ShakeScreen({ Speed = 200, Distance = 5, Angle = 90, Duration = 0.15 })
	wait( 0.1 )
end

function mod.SacrificePresentation( source )
	AddInputBlock({ Name = "SacrificePresentation" })
	SessionMapState.GoldifySource = source.Name
	Stop({ Id = CurrentRun.Hero.ObjectId })
	Halt({ Id = CurrentRun.Hero.ObjectId })
	wait( 0.02)
	PlaySound({ Name = "/SFX/Menu Sounds/PortraitEmoteSparklySFX" })
	PlayInteractAnimation( source.ObjectId, { Animation = GetEquippedWeaponValue( "WeaponInteractAnimation" ) })
	RemoveInputBlock({ Name = "SacrificePresentation" })
	wait( 0.2 )
	CreateAnimation({ Name = "RadialNovaPentagramCharged_Ares", DestinationId = source.ObjectId })
	ShakeScreen({ Speed = 200, Distance = 5, Angle = 90, Duration = 0.15 })
	wait( 0.1 )
end

--[[ function mod.TestingStuff()
	CreateLoot({ Name = "MonstrosityMetaUpgradeUpgrade" , OffsetX = 100, SpawnPoint = CurrentRun.Hero.ObjectId })
end

game.OnControlPressed({'Gift', function()
	return mod.TestingStuff()
end}) ]]

modutil.mod.Path.Wrap("GetEligibleLootNames", function(base, excludeLootNames)
	excludeLootNames = excludeLootNames or {}
	local output = base(excludeLootNames)
	game.RemoveValue( output, "MonstrosityMetaUpgradeUpgrade" )
	return output
end)

modutil.mod.Path.Wrap("IsShownInHUD", function(base, trait)
	if trait.Name == "ReversedCardDrawMetaUpgrade" and (trait.Uses or 0) > 0 and trait.ShowInHUD then
		return true
	else
		return base(trait)
	end
end)


modutil.mod.Path.Wrap("CreateDoorRewardPreview", function(base, exitDoor, chosenRewardType, chosenLootName, index, args)
	local room = exitDoor.Room 
	chosenRewardType = chosenRewardType or room.ChosenRewardType
	chosenLootName = chosenLootName or room.ForceLootName

	if chosenRewardType == "Devotion" then
		if room.Encounter.LootBName == "MonstrosityMetaUpgradeUpgrade" then
			room.Encounter.LootBName = GetRandomValue(GetEligibleLootNames({room.Encounter.LootAName }))
		end
	end
	return base(exitDoor, chosenRewardType, chosenLootName, index, args)
end)

function mod.AwardStartingInvulnerability(unit, args)
	local effectName = "AthenaInvulnerable"
	local dataProperties = ShallowCopyTable( EffectData[effectName].DataProperties )
	local duration = 0
	if HeroHasTrait("ReversedCastBuffMetaUpgrade") then
		local trait = GetHeroTrait("ReversedCastBuffMetaUpgrade")
		duration = trait.EncounterStartInvulnerabilityDuration
	end 
	dataProperties.Duration = duration
	ApplyEffect({
		DestinationId = CurrentRun.Hero.ObjectId,
		Id = CurrentRun.Hero.ObjectId,
		EffectName = effectName,
		DataProperties = dataProperties
	})
end

modutil.mod.Path.Wrap("DeathAreaRoomTransition", function(base, source, args)
	if config.AutoUnlockAndUpgradeCards and Incantations.isIncantationEnabled("ExtraArcanaWorldUpgradeCardFlip") then
		local oldMetaUpgradeCards = {    { "ChanneledCast",			"HealthRegen",			"LowManaDamageBonus",	"CastCount",			"SorceryRegenUpgrade", 	},
	{ "CastBuff",				"BonusHealth",			"BonusDodge",			"ManaOverTime",			"MagicCrit" 			},
	{ "SprintShield",			"LastStand",			"MaxHealthPerRoom",		"StatusVulnerability",	"ChanneledBlock" 		},
	{ "DoorReroll",				"StartingGold",			"MetaToRunUpgrade",		"RarityBoost", 			"BonusRarity" 			},
	{ "TradeOff",				"ScreenReroll",			"LowHealthBonus",		"EpicRarityBoost",		"CardDraw" 				},
}
for row, rowData in pairs(mod.MetaUpgradeDefaultCardLayout) do
	for column, cardName in pairs(rowData) do
		if not Contains(oldMetaUpgradeCards, cardName) then
		game.GameState.MetaUpgradeState[cardName].Unlocked = true
		if GameState.MetaUpgradeState[ cardName].Level and GameState.MetaUpgradeState[ cardName].Level < 3 then
		GameState.MetaUpgradeState[ cardName].Level = 3
		end
		end
	end
end
	end
	base(source,args) 
end)

function mod.GetLegalFlippedCandidates(card)
	local numFlips = 0
	if config and config.EnableBlueCards then
		numFlips = numFlips + 1
	end
	if config and config.EnableVioletCards then
		numFlips = numFlips + 1
	end
	if config and config.EnableRedCards then
		numFlips = numFlips + 1
	end
	local flipCandidate = card
	local legalFlips = {}
	for _ = 0, numFlips do
		if GameState.MetaUpgradeState[flipCandidate].Unlocked then
			table.insert(legalFlips, flipCandidate)
		end
		flipCandidate = mod.GetFlippedCardName(flipCandidate)
	end
	return legalFlips
end

modutil.mod.Path.Wrap("RandomBountyProcessMetaUpgrades", function(base, sum, remaining, index, budget, candidates, cardState)
	if sum == budget then
		local cardCoordMap = {}
		for row, cardRow in ipairs(game.MetaUpgradeDefaultCardLayout) do
			for col, card in ipairs(cardRow) do
				cardCoordMap[card] = {Row = row, Column = col}
			end
		end
		for card_index, card in ipairs(candidates) do
			local legalFlips = mod.GetLegalFlippedCandidates(candidates[card_index])
			for key, value in pairs(legalFlips) do
				game.GameState.MetaUpgradeState[value].Visible = false
			end
			candidates[card_index] = game.GetRandomValue(legalFlips)
			local row = cardCoordMap[card].Row
			local col = cardCoordMap[card].Column
			game.GameState.MetaUpgradeCardLayout[row][col] = candidates[card_index]
			game.GameState.MetaUpgradeState[candidates[card_index]].Visible = true
		end
	end
	return base(sum, remaining, index, budget, candidates, cardState)
end)

modutil.mod.Path.Wrap("StoredGameStateInit", function (base, originalState)
	base()
	game.StoredGameState.FlipTheArcanaHasRun = originalState.FlipTheArcanaHasRun
	game.StoredGameState.MetaUpgradeCardLayout = originalState.MetaUpgradeCardLayout
end)

modutil.mod.Path.Wrap("RestorePackagedBountyGameState", function (base)
	if game.StoredGameState then
		game.GameState.FlipTheArcanaHasRun = game.StoredGameState.FlipTheArcanaHasRun
		game.GameState.MetaUpgradeCardLayout = game.StoredGameState.MetaUpgradeCardLayout
	end
	return base()
end)

modutil.mod.Path.Wrap("UpgradeMetaUpgradeCardAction", function(base, screen, button)
if not Incantations.isIncantationEnabled("ExtraArcanaWorldUpgradeCardFlip") then
		return base(screen, button)
	end
local selectedButton = button
	
	if screen.PickedUpButton then
		screen.ChangeMade = true
		DoCardSwap( screen, button )
		return
	end
	local metaUpgradeName = selectedButton.CardName
	local zoomOutDelay = 0
	local revealCardData = {}
	local expandPsyche = false
	local components = button.Screen.Components
	if selectedButton.CardState == "UNLOCKED" then
		if not MetaUpgradeAtMaxLevel( metaUpgradeName ) then
			local metaUpgradeData = MetaUpgradeCardData[metaUpgradeName]
			local resourceCost = metaUpgradeData.UpgradeResourceCost[ GetMetaUpgradeLevel( metaUpgradeName )]
			
			if HasResources( resourceCost ) then
				screen.ChangeMade = true
				for resourceName, resourceCost in pairs( resourceCost ) do
					SpendResource( resourceName, resourceCost, metaUpgradeName, { TargetId = components["ResourceIconBacking"..resourceName].Id, UseScreenLocation = true, TextOffsetY = 11, TextAnchorOffsetY = -50, SkipQuestStatusCheck = true } )
				end
				UpdateAffordabilityStatus()

				RemoveStoreItemPin( selectedButton.CardName .. GetMetaUpgradeLevel( metaUpgradeName ), { Purchase = true } )
				RemoveStoreItemPinPresentation( selectedButton )
				IncrementTableValue(GameState.MetaUpgradeState[metaUpgradeName], "Level" )
				screen.UpgradedMetaUpgrades[metaUpgradeName] = true
				UpdateMetaUpgradeCardState( screen, selectedButton )
				GameState.Flags.HasUpgradedCards = true

				UpgradeMetaUpgradeCardPresentation( selectedButton )
				if MetaUpgradeAtMaxLevel( metaUpgradeName ) then
					MetaUpgradeCardMaxLevelPresentation( selectedButton )
					SetAlpha({ Id = button.UpgradeIconId, Fraction = 0, Duration = 0.2 })
					SetAlpha({ Id = components.MetaUpgradeMaxRank.Id, Fraction = 1, Duration = 0 })
					SetAnimation({ DestinationId = components.MetaUpgradeMaxRank.Id, Name = "MetaUpgradeUpgradeScreenMaxRankAchieved" })
				end
				
				MouseOverUpgradeMetaUpgrade( selectedButton )
				if GetMetaUpgradeLevel( selectedButton.CardName ) > 1 then 
					local rarity = TraitRarityData.RarityUpgradeOrder[ GetMetaUpgradeLevel( selectedButton.CardName )]
					SetAnimation({ DestinationId = selectedButton.CardCornersId, Name = "RarityCircle".. rarity })
					SetAnimation({ DestinationId = components.MetaUpgradeCardArtPatch.Id, Name = "RarityFrameLarge".. rarity .. "In" })
				end
				-- Update affordability state of all other cards
				for row, rowData in pairs( GameState.MetaUpgradeCardLayout ) do
					for column, cardName in pairs( rowData ) do
						local otherButton = screen.Components[GetMetaUpgradeKey( row, column )]
						if not MetaUpgradeAtMaxLevel( cardName ) then
							local metaUpgradeData = MetaUpgradeCardData[cardName]
							local resourceCost = metaUpgradeData.UpgradeResourceCost[ GetMetaUpgradeLevel( cardName )]
							if not HasResources(resourceCost) and otherButton then
								SetAlpha({ Id = otherButton.UpgradeIconId, Fraction = 0, Duration = 0.2 })
								SetAlpha({ Id = otherButton.Id, Fraction = 0.2, Duration = 0.2 })
								SetAlpha({ Id = otherButton.CardCornersId, Fraction = 0.2, Duration = 0.2 })
							end
						end
					end
				end

				CheckAchievement( screen, { Name = "AchAllArcanaMax" } )

			else
				ScreenCantAffordPresentation( screen, selectedButton, resourceCost )
			end
		else
			CannotUpgradeMaxLevelMetaUpgradePresentation( screen, selectedButton )
		end
	else
		InvalidMetaUpgradeCardAction( screen, selectedButton )
	end
	UpdateUpgradeMetaUpgradeCardInteractionText( screen, selectedButton )

end)

modutil.mod.Path.Wrap("RevealMetaUpgradeCardPresentation", function(base, screen, button, args)
if not Incantations.isIncantationEnabled("ExtraArcanaWorldUpgradeCardFlip") then
		return base(screen, button, args)
	end
IncrementTableValue(screen, "RevealingCards")
	if not button then return end
	SetAlpha({ Id = button.CostTextId, Fraction = 0, Duration = 0 })
	CreateAnimation({ 
		Name = "MetaUpgradeCardFlip", 
		DestinationId = button.Id,
		Group = "Combat_Menu_TraitTray_Overlay", 
		Scale = 5 / screen.ZoomLevel,
	})
	thread( MetaUpgradeCardRevealComplete, button, args )
	wait(0.12)
		
	SetAnimation({ Name = "Blank", DestinationId = button.CardArtId, Scale = screen.DefaultArtScale })
	PlaySound({ Name = "/SFX/Menu Sounds/HeartHighlightShimmer", Id = button.Id })

end)

function mod.WorkOutRemainingDefiances()
	local currentLastStandNum = TableLength( CurrentRun.Hero.LastStands )
	local maxLastStands = CurrentRun.Hero.MaxLastStands or 0
	if HeroHasTrait("FocusLastStandBoon") then
		local hasAthenaLastStand = false
		for i, lastStand in ipairs( CurrentRun.Hero.LastStands ) do
			if lastStand.Name == "Athena"  then
				hasAthenaLastStand = true
				break
			end
		end
		if not hasAthenaLastStand then
			currentLastStandNum = currentLastStandNum + 1
		end
	end
	return (maxLastStands - currentLastStandNum)
end

modutil.mod.Path.Wrap("CalculateDoubleDamageChance", function(base, attacker, victim, weaponData, triggerArgs)
	triggerArgs.DdChance = base(attacker, victim, weaponData, triggerArgs)

	if HeroHasTrait("ReversedLowHealthBonusMetaUpgrade") and ((attacker and attacker == CurrentRun.Hero) or (victim and victim == CurrentRun.Hero)) and not CurrentHubRoom then
		local lostLastStands = mod.WorkOutRemainingDefiances()
		lostLastStands = math.max(0, lostLastStands)
		local ddTrait = GetHeroTrait("ReversedLowHealthBonusMetaUpgrade")
		addDdMultiplier( {}, lostLastStands * ddTrait.ModdedDoubleDamageChancePerDD, triggerArgs )
	end
	if HeroHasTrait("ReversedTradeOffMetaUpgrade") and (attacker and attacker == CurrentRun.Hero) and not (victim and victim == CurrentRun.Hero) and IsFateValid() then
		local fatedDDTrait = GetHeroTrait("ReversedTradeOffMetaUpgrade")
		addDdMultiplier( {}, fatedDDTrait.FatedDDChance, triggerArgs )
	end
	return triggerArgs.DdChance
end)

modutil.mod.Path.Wrap("EndEncounterEffects", function(base, currentRun, currentRoom, currentEncounter)
	if currentEncounter == nil or currentEncounter.EncounterType == "NonCombat" or currentEncounter.SkipEndEncounterEffects then
		return base(currentRun, currentRoom, currentEncounter)
	end
	if (currentEncounter == currentRoom.Encounter or currentEncounter == MapState.EncounterOverride) and HeroHasTrait("ReversedSorceryRegenMetaUpgrade") and (currentEncounter.EncounterType == "Boss" or currentEncounter.EncounterType == "Miniboss") then
		local trait = GetHeroTrait("ReversedSorceryRegenMetaUpgrade")
		if trait and trait.Uses and trait.Uses > 0 then
			trait.Uses = trait.Uses - 1
			mod.CerbMetaUpgradeRarity({Count = 1})
		end
		end
	return base(currentRun, currentRoom, currentEncounter)
end)

modutil.mod.Path.Wrap("CirceMetaUpgradeRarity", function(base, args)
	local prevLayout = DeepCopyTable(GameState.MetaUpgradeCardLayout)
	GameState.MetaUpgradeCardLayout = DeepCopyTable(mod.MetaUpgradeDefaultCardLayout)
	base(args)
	GameState.MetaUpgradeCardLayout = prevLayout
end)

function mod.CerbMetaUpgradeRarity( args )
	args = args or {}
	local eligibleTraits = {}
	
	for row, rowData in pairs( mod.MetaUpgradeDefaultCardLayout ) do
		for column, cardName in pairs( rowData ) do
			if GameState.MetaUpgradeState[cardName].Equipped and MetaUpgradeCardData[ cardName ].TraitName and MetaUpgradeCardData[ cardName ].TraitName ~= "ReversedSorceryRegenMetaUpgrade" and HeroHasTrait(MetaUpgradeCardData[ cardName ].TraitName ) then
				local traitData = GetHeroTrait(MetaUpgradeCardData[ cardName ].TraitName )
				if traitData.Rarity ~= nil and GetUpgradedRarity(traitData.Rarity) ~= nil and traitData.RarityLevels[GetUpgradedRarity(traitData.Rarity)] ~= nil then
					table.insert(eligibleTraits, { TraitData = traitData, MetaUpgradeName = cardName })
				end
			end
		end
	end
	if IsEmpty(eligibleTraits) then
		return
	end
	local pickedTraits = {}
	local count = args.Count or 1
	while not IsEmpty(eligibleTraits) and count > 0 do
		local randomValue = RemoveRandomValue( eligibleTraits )
		local traitData = randomValue.TraitData
		local metaUpgradeName = randomValue.MetaUpgradeName
		RemoveWeaponTrait( traitData.Name )
		local processedData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = traitData.Name, Rarity = GetUpgradedRarity(traitData.Rarity) }) 
		AddTraitToHero({ TraitData = processedData })
		if MetaUpgradeCardData[metaUpgradeName].OnUpgradedFunctionName then
			CallFunctionName( MetaUpgradeCardData[metaUpgradeName].OnUpgradedFunctionName, traitData, processedData )
		end
		pickedTraits[traitData.Name] = true
		MapState.TraitTrayMetaUpgradePriorityHighlight = traitData.Name
		count = count - 1
	end
	thread( IncreasedTraitRarityPresentation, pickedTraits )
end

modutil.mod.Path.Wrap("RunHistoryScreenShowMetaUpgrades", function(base,screen, button )
	game.MetaUpgradeDefaultCardLayout = DeepCopyTable(mod.MetaUpgradeDefaultCardLayout)
	base(screen, button)
	local run = GameState.RunHistory[screen.RunIndex] or CurrentRun
	local components = screen.Components

	local locationX = screen.TraitStartX
	local locationY = screen.MetaUpgradeStartY

	screen.FirstItem = nil

	if run.TraitCache == nil then
		return
	end

	local allMetaUpgradeTraits = {}
	for traitName, count in pairs( run.TraitCache ) do
		local traitData = TraitData[traitName]
		if traitData ~= nil and traitData.MetaUpgrade then
			allMetaUpgradeTraits[traitName] = true
		end
	end

	local sortedTraits = {}
	for rowIndex, row in ipairs( MetaUpgradeDefaultCardLayout ) do
		for colIndex, metaUpgradeName in ipairs( row ) do
			local traitName = MetaUpgradeCardData[metaUpgradeName].TraitName
			if allMetaUpgradeTraits[traitName] then
				table.insert( sortedTraits, TraitData[traitName] )
			end
		end
	end

	local countInColumn = 0
	local columnIndex = 0
	for i, traitData in ipairs( sortedTraits ) do
		local metaUpgradeCardData = GetMetaUpgradeDataFromTraitName( traitData.Name )
		if metaUpgradeCardData ~= nil then
			local frameKey = "IconFrame"..traitData.Name
			if components[frameKey] then
				Destroy({Id = components[frameKey].Id})
			end

			local frame = CreateScreenComponent({ Name = "BlankObstacle", Group = screen.ComponentData.DefaultGroup, Scale = 0.7, X = locationX, Y = locationY, Animation = "DevCard_EquippedHighlight", Alpha = 0.0, AlphaTarget = 1.0, AlphaTargetDuration = 0.2 })
			components[frameKey] = frame
			table.insert( screen.IconIds, frame.Id )

			local iconKey = "Icon"..traitData.Name
			if components[iconKey] then
				Destroy({Id = components[iconKey].Id})
			end
			local button = CreateScreenComponent({ Name = "BlankInteractableObstacle", Group = screen.ComponentData.DefaultGroup, Scale = screen.MetaUpgradeIconScale, X = locationX, Y = locationY, Animation = metaUpgradeCardData.Image, Alpha = 0.0, AlphaTarget = 1.0, AlphaTargetDuration = 0.2 })
			button.Screen = screen
			button.OnMouseOverFunctionName = "MouseOverRunHistoryItem"
			button.OnMouseOffFunctionName = "MouseOffRunHistoryItem"
			button.Data = metaUpgradeCardData
			button.HighlightAnim = "DevCard_Hover"
			button.HighlightScale = screen.MetaUpgradeIconScale * 3.5
			if screen.FirstItem == nil then
				screen.FirstItem = button
			end
			components[iconKey] = button
			table.insert( screen.IconIds, button.Id )
			AttachLua({ Id = button.Id, Table = button })

			countInColumn = countInColumn + 1
			if countInColumn >= screen.MetaUpgradesPerColumn then
				locationX = locationX + screen.MetaUpgradeSpacingX
				locationY = screen.MetaUpgradeStartY
				countInColumn = 0
				columnIndex = columnIndex + 1
			else
				locationY = locationY + screen.MetaUpgradeSpacingY
			end
			if columnIndex >= screen.TraitMaxColumns then
				break
			end
		end
	end

	game.MetaUpgradeDefaultCardLayout = {
	{ "ChanneledCast",			"HealthRegen",			"LowManaDamageBonus",	"CastCount",			"SorceryRegenUpgrade", 	},
	{ "CastBuff",				"BonusHealth",			"BonusDodge",			"ManaOverTime",			"MagicCrit" 			},
	{ "SprintShield",			"LastStand",			"MaxHealthPerRoom",		"StatusVulnerability",	"ChanneledBlock" 		},
	{ "DoorReroll",				"StartingGold",			"MetaToRunUpgrade",		"RarityBoost", 			"BonusRarity" 			},
	{ "TradeOff",				"ScreenReroll",			"LowHealthBonus",		"EpicRarityBoost",		"CardDraw" 				},
}
end)

modutil.mod.Path.Wrap("HasAllWorldUpgradesRequiringResource", function(base,source,args)
	local baseValue = base(source,args)
	args = args or {}
	if baseValue == false then return false end
	local resourceName = args.ResourceName or GetFirstKey( source.Cost )
	for cardName, cardData in pairs(game.MetaUpgradeCardData) do
		if not (cardName == "BaseMetaUpgrade" or cardName == "BaseBonusMetaUpgrade") and not cardData.DebugOnly and GameState.MetaUpgradeState[cardName] and not GameState.MetaUpgradeState[cardName].Unlocked then
			if cardData.ResourceCost[resourceName] then 
				return false 
				end
		end
		if not (cardName == "BaseMetaUpgrade" or cardName == "BaseBonusMetaUpgrade") and not cardData.DebugOnly and cardData.UpgradeResourceCost then
			for upgradeLevel, upgradeCost in ipairs(cardData.UpgradeResourceCost) do
					if upgradeLevel >= GetMetaUpgradeLevel(cardName) and upgradeCost[resourceName] then
						return false
					end
			end
		end 
	end
	return baseValue
end)

function mod.CheckSpawnDemeterDamage( enemy, traitArgs, triggerArgs )
	if not enemy or not enemy.ObjectId or SessionMapState.SpawnKillRecord[enemy.ObjectId] or enemy == CurrentRun.Hero or (triggerArgs and traitArgs.ExcludeProjectileName and triggerArgs.SourceProjectile == traitArgs.ExcludeProjectileName ) then
		return
	end
	if enemy.IsBoss or enemy.UseBossHealthBar or not RandomChance(traitArgs.Chance * GetTotalHeroTraitValue( "LuckMultiplier", { IsMultiplier = true })) then
		SessionMapState.SpawnKillRecord[enemy.ObjectId] = true
		return
	end
	SessionMapState.SpawnKillRecord[enemy.ObjectId] = true
	local damageAmount = traitArgs.Damage
	thread( mod.DoDemeterSpawnDamage, enemy, traitArgs, damageAmount )
end

function mod.DoDemeterSpawnDamage( enemy, traitArgs, damageAmount )
	wait(0.1, RoomThreadName )
	CreateAnimation({ Name = traitArgs.Vfx or "DemeterBossIceShatter", DestinationId = enemy.ObjectId, Group = "FX_Standing_Top" })
	thread( mod.FamineSpawnKillPresentation, enemy )
	thread( Damage, enemy, { AttackerId = CurrentRun.Hero.ObjectId, AttackerTable = CurrentRun.Hero, SourceProjectile = "ZeusOnSpawn", DamageAmount = damageAmount, Silent = false, PureDamage = true, IgnoreHealthBuffer = true } )
end

function mod.FamineSpawnKillPresentation( unit )
	PlaySound({ Name = "/Leftovers/SFX/PlayerKilledNEW", Id = unit.ObjectId })
	if CheckCooldown( "SpawnKillPresentationCooldown", 1.0 ) then
		thread( InCombatText, CurrentRun.Hero.ObjectId, "Hint_FamineSpawnKill", 0.75, { PreDelay = 0.25 } )
	end
end

function mod.FlipArcanaCheckPerfectClear(traitData, args)
    if not SessionMapState.EncounterStartDamage then
		return
	end
	args = args or {}
    	local damageTaken = CurrentRun.TotalDamageTaken - SessionMapState.EncounterStartDamage
    if damageTaken <= 0 then
		if args.PerfectFunctionName then
		thread(CallFunctionName, args.PerfectFunctionName, traitData, args.PerfectFunctionArgs)
		end
    end
end

function mod.FlipArcanaIncreaseAccumulatedDamageBonus(traitData, args)
    traitData.AccumulatedDamageBonus = traitData.AccumulatedDamageBonus - (1-traitData.FlipArcanaPerfectClearDamageBonus)
	wait( 0.45, RoomThreadName )
	thread( InCombatText, CurrentRun.Hero.ObjectId, "FlipTheArcanaPerfectClearDamageBonus", 0.75, { PreDelay = 0.25 } )


	local soundId = PlaySound({ Name = "/SFX/Player Sounds/PoseidonWaterWrathAttackLoop" })
	SetVolume({ Id = soundId, Value = 0.3 })
	CreateAnimation({ Name = "PoseidonElementalKnockupFxAlt", DestinationId = CurrentRun.Hero.ObjectId })
	ShakeScreen({ Speed = 500, Distance = 4, FalloffSpeed = 1000, Duration = 0.3 })
    UpdateTraitNumber(traitData)
end

function mod.DoReversedDoorCash(currentRun, door)
	if HeroHasTrait("ReversedDoorCashMetaUpgrade") and not HasHeroTraitValue("BlockMoney") then
		local trait = GetHeroTrait("ReversedDoorCashMetaUpgrade")
		local money = round( trait.FlipTheArcanaDoorCash * GetTotalHeroTraitValue( "MoneyMultiplier", { IsMultiplier = true } ))
		AddResource( "Money", money, trait.Name )
		thread( DoorGoldCostumePresentation, money )
		IncrementTableValue( SessionMapState, "DoorTextCount" )
	end
end

function mod.RenewLastStand(unit,args)
	if CurrentRun.Hero.IsDead then return end
	if CurrentHubRoom then return end
	if CurrentRun.CurrentRoom and CurrentRun.CurrentRoom.BlockTraitSetup or not args then
		return
	end
		local hasRenewableLastStand = false
	for i, lastStand in pairs( unit.LastStands ) do
		if lastStand.Name == "FlipTheArcanaRenewableLastStand"  then
			hasRenewableLastStand = true
			return
		end
	end
	if not hasRenewableLastStand  then
		CurrentRun.Hero.LastStands = CurrentRun.Hero.LastStands or {}
		CurrentRun.Hero.MaxLastStands = CurrentRun.Hero.MaxLastStands or TableLength( CurrentRun.Hero.LastStands )
		local numLastStands = CurrentRun.Hero.MaxLastStands - TableLength( CurrentRun.Hero.LastStands )
		local startingLastStand = HasLastStand( CurrentRun.Hero )
		local trait = GetHeroTrait("ReversedRenewableDDMetaUpgrade")
		if not CurrentRun.Hero.FlipArcanaRenewableDDAdded then
		--if numLastStands > 0 then
			-- only run once
			AddLastStand({
				Name = "FlipTheArcanaRenewableLastStand",
				Icon = "ExtraLifeSkelly",
				ManaFraction = trait.FlipArcanaRestoreFraction/2,
				HealFraction = trait.FlipArcanaRestoreFraction/2,
				Silent = true,
				IncreaseMax = true,
			})
			CurrentRun.Hero.FlipArcanaRenewableDDAdded = true
			numLastStands = numLastStands - 1
			if startingLastStand ~= HasLastStand( CurrentRun.Hero ) then
				thread( RoomStartLowHealthBonusBuffStatePresentation  )
			end
		else
			AddLastStand({
				Name = "FlipTheArcanaRenewableLastStand",
				Icon = "ExtraLifeSkelly",
				ManaFraction = trait.FlipArcanaRestoreFraction/2,
				HealFraction = trait.FlipArcanaRestoreFraction/2,
				Silent = true,
			})
		end
		--end
	end
end

function mod.GrantRenewableMetaUpgradeLastStands(args)
	AddLastStand({
				Name = "FlipTheArcanaRenewableLastStand",
				Icon = "ExtraLifeSkelly",
				ManaFraction = args.ManaFraction,
				HealFraction = args.HealFraction,
				Silent = false,
				IncreaseMax = true,
				ValidityFunctionName = _PLUGIN.guid .. ".IsRenewableLastStandEligible",
			})
			RecreateLifePips()
end

function mod.IsRenewableLastStandEligible()
return not CurrentRun or not CurrentRun.Hero or IsEmpty(CurrentRun.Hero.Traits) or not HeroHasTrait("ReversedRenewableDDMetaUpgrade")
end

modutil.mod.Path.Wrap("SetTraitsOnLoot", function(base, lootData, args)
	base(lootData, args)
	if lootData.GodLoot and HeroHasTrait("ReversedHeroicRarityMetaUpgrade") then
		local trait = GetHeroTrait("ReversedHeroicRarityMetaUpgrade")
		for itemIndex, itemData in ipairs(lootData.UpgradeOptions) do
			if (itemData.Rarity == "Common" or itemData.Rarity == "Rare" or itemData.Rarity == "Epic") and not itemData.IsElementalTrait and RandomChance(trait.FlipTheArcanaUpgradeToHeroicChance) then
				itemData.Rarity = "Heroic"
			end
		end
	end
end)

modutil.mod.Path.Wrap("AddMaxHealth", function(base, healthGained, source, args)
	args = args or {}
	if HeroHasTrait("ReversedSharedRunProgressMetaUpgrade") and not args.Thread then
		local actualHealthGain = round(healthGained)
		actualHealthGain = round(actualHealthGain * GetTotalHeroTraitValue("MaxHealthMultiplier", { IsMultiplier = true }))
		local trait = GetHeroTrait("ReversedSharedRunProgressMetaUpgrade")
		local newArgs = {}
		if not IsEmpty(args) then
			newArgs = DeepCopyTable(args)
		end
		newArgs.PreDelay = newArgs.PreDelay or 0
		newArgs.PreDelay = newArgs.PreDelay + 0.5
		thread(mod.AddEchoMaxMana, actualHealthGain * trait.FlipTheArcanaSharedRatio, source, newArgs)
	end
	return base(healthGained, source, args)
end)

function mod.AddEchoMaxMana(manaGained, source, args)
args = args or {}
	if args.Thread then
		args.Thread = false
		thread( mod.AddEchoMaxMana, manaGained, source, args )
		return
	end
	local startingMana = CurrentRun.Hero.MaxMana
	wait( args.Delay )
	manaGained = round(manaGained)
	local traitName = "RoomRewardMaxManaTrait"

	local manaTraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = traitName })
	manaTraitData.PropertyChanges[1].ChangeValue = manaGained
	manaTraitData.Source = args.Source
	AddTraitToHero({ TraitData = manaTraitData })
	if not( args.Silent ) then
		thread( InCombatTextArgs, { TargetId = CurrentRun.Hero.ObjectId, UseProgressiveStack = true, Text = "MaxManaIncrease", PreDelay = args.PreDelay or 0, Duration = 0.7, LuaKey = "TooltipData", ShadowScale = 0.7, OffsetY = -100, LuaValue = { TooltipMana = manaGained }})
	end
end

modutil.mod.Path.Wrap("AddMaxMana", function(base, manaGained, source, args)
	args = args or {}
	if HeroHasTrait("ReversedSharedRunProgressMetaUpgrade") and not args.Thread then
		local actualManaGain = round(manaGained)
		local trait = GetHeroTrait("ReversedSharedRunProgressMetaUpgrade")
		local newArgs = {}
		if not IsEmpty(args) then
			newArgs = DeepCopyTable(args)
		end
		newArgs.PreDelay = newArgs.PreDelay or 0
		newArgs.PreDelay = newArgs.PreDelay + 0.5
		thread(mod.AddEchoMaxHealth, actualManaGain * trait.FlipTheArcanaSharedRatio, source)
	end
	return base(manaGained, source, args)
end)

function mod.AddEchoMaxHealth(healthGained, source, args)
	args = args or {}
	if args.Thread then
		args.Thread = false
		thread( mod.AddEchoMaxHealth, healthGained, source, args )
		return
	end
	local startingHealth = CurrentRun.Hero.MaxHealth
	wait( args.Delay )
	healthGained = round(healthGained)
	local traitName = "RoomRewardMaxHealthTrait"

	local healthTraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = traitName })
	healthTraitData.PropertyChanges[1].ChangeValue = healthGained
	AddTraitToHero({ TraitData = healthTraitData })
	if not( args.Silent ) then
		MaxHealthIncreaseText({ MaxHealthGained = CurrentRun.Hero.MaxHealth - startingHealth , SpecialText = "MaxHealthIncrease" })
		thread( UpdateHealthUI, { FalloffDelay = 0.0 } )
end
end


function mod.DistributeUpgradesToAllTraits(args)
	args = args or {}
	local pause = args.Wait or 0
	wait(pause)
	AddStackToTraits("TheHeir",{NumTraits = args.LevelBonus, NumStacks = 1, Thread = true})
end

modutil.mod.Path.Wrap("StartRoom", function(base,currentRun, currentRoom)
	base(currentRun, currentRoom)
	if currentRoom.BiomeStartRoom and (CurrentRun.EnteredBiomes and CurrentRun.EnteredBiomes > 1) and HeroHasTrait("ReversedPomBiomeStartMetaUpgrade") and CurrentRun.Hero.UpgradableTraitCount > 0 then
		local trait = GetHeroTrait("ReversedPomBiomeStartMetaUpgrade")
		thread( InCombatText, CurrentRun.Hero.ObjectId, "FlipTheArcanaBonusLevelsAwarded", 0.75, { PreDelay = 0.75 } )
		mod.DistributeUpgradesToAllTraits({LevelBonus = trait.FlipTheArcanaBonusLevels, Wait = 0.75})
	end
	if currentRoom.BiomeStartRoom and HeroHasTrait("ReversedDDRefillBiomeStartMetaUpgrade") then
		local trait = GetHeroTrait("ReversedDDRefillBiomeStartMetaUpgrade")
		mod.RefillDefiancesWithTrait(trait)
	end
	if currentRoom.BiomeStartRoom and HeroHasTrait("ReversedRandomBuildMetaUpgrade") then
		local trait = GetHeroTrait("ReversedRandomBuildMetaUpgrade")
		mod.RandomiseArcanaBuild(trait, {})
	end
end)

modutil.mod.Path.Wrap("CalculateCritChance", function(base, attacker, victim, weaponData, triggerArgs)
	local critChance = base(attacker, victim, weaponData, triggerArgs)
	if victim and attacker == CurrentRun.Hero and HeroHasTrait("ReversedStatusCritMetaUpgrade") then
		local trait = GetHeroTrait("ReversedStatusCritMetaUpgrade")
		if victim.VulnerabilityEffects and TableLength( victim.VulnerabilityEffects ) >= trait.FlipTheArcanaStatusCrit.MinRequiredVulnerabilityEffects then
			critChance = critChance + trait.FlipTheArcanaStatusCrit.Chance
		end
	end
	if attacker and attacker == CurrentRun.Hero and HeroHasTrait("ReversedLowHealthCritMetaUpgrade") then
		local trait = GetHeroTrait("ReversedLowHealthCritMetaUpgrade")
		if attacker.Health / attacker.MaxHealth <= trait.FlipTheArcanaLowHealthCritData.Threshold and trait.FlipTheArcanaLowHealthCritData.CritChance then
			critChance = critChance + trait.FlipTheArcanaLowHealthCritData.CritChance
		end
	end
	if attacker and attacker == CurrentRun.Hero and MapState.FlipTheArcanaCritVolleys and MapState.FlipTheArcanaCritVolleys [triggerArgs.SourceWeapon] and triggerArgs.SourceProjectileVolley and MapState.FlipTheArcanaCritVolleys[triggerArgs.SourceWeapon][triggerArgs.SourceProjectileVolley] then
		local chance = TraitData["ReversedRiposteKillMetaUpgrade"].FlipTheArcanaValidVolleyChance
		critChance = critChance + chance
	end
	if attacker and attacker == CurrentRun.Hero and MapState.FlipTheArcanaCritVolleys and MapState.FlipTheArcanaCritVolleys [triggerArgs.SourceWeapon] and triggerArgs.ProjectileId and MapState.FlipTheArcanaCritVolleys[triggerArgs.SourceWeapon][triggerArgs.ProjectileId] then
		local chance = TraitData["ReversedRiposteKillMetaUpgrade"].FlipTheArcanaValidVolleyChance
		critChance = critChance + chance
	elseif attacker and attacker == CurrentRun.Hero and MapState.FlipTheArcanaCritVolleys and MapState.FlipTheArcanaCritVolleys [triggerArgs.SourceWeapon] and triggerArgs.ProjectileId and MapState.FlipTheArcanaCritVolleys[triggerArgs.SourceWeapon]["BackupProjectile"] then
	local chance = TraitData["ReversedRiposteKillMetaUpgrade"].FlipTheArcanaValidVolleyChance
		critChance = critChance + chance
	end
	return critChance
end)

function mod.StartChannelSturdy( weaponData, args )
	AddIncomingDamageModifier( CurrentRun.Hero,
	{
		HealthOnly = true,
		Name = "FlipTheArcanaChannelSturdy",
		ValidWeaponMultiplier = args.DamageTakenModifier,
		Temporary = true,
	})
	CreateAnimation({ Name = "HyperArmorLoop", DestinationId = CurrentRun.Hero.ObjectId })
end

function mod.EndChannelSturdy()
	RemoveIncomingDamageModifier( CurrentRun.Hero, "FlipTheArcanaChannelSturdy" )
	StopAnimation({ Name = "HyperArmorLoop", DestinationId = CurrentRun.Hero.ObjectId })
end

modutil.mod.Path.Wrap("ChooseNextRewardStore", function(base, run)
	local prevRewardStore = base(run)

	if HeroHasTrait("ReversedUnFatedRewardMetaUpgrade") and not IsFateValid() then
		local trait = GetHeroTrait("ReversedUnFatedRewardMetaUpgrade")
		if RandomChance(trait.FlipTheArcanaUnFatedMajorFindChance*GetTotalHeroTraitValue( "LuckMultiplier", { IsMultiplier = true })) then
			run.NextRewardStoreName = "RunProgress"
			return "RunProgress"
		end
	end
	return prevRewardStore
end)

function mod.CharmCrowd(hero, args)
while true do
		local nearbyTargetIds = GetClosestIds({ Id = CurrentRun.Hero.ObjectId, DestinationName = "EnemyTeam", IgnoreInvulnerable = true, IgnoreHomingIneligible = true, IgnoreSelf = true, Distance = 2000 })
		local eligibleEnemies = {}
		for _, id in pairs(nearbyTargetIds) do
			if ActiveEnemies[id] and not ActiveEnemies[id].IsDead and not ActiveEnemies[id].SkipModifiers and not (MapState.CrowdCharmedEnemy and MapState.CrowdCharmedEnemy == ActiveEnemies[id]) then
				table.insert(eligibleEnemies, ActiveEnemies[id])
			end
		end
		if not IsEmpty(eligibleEnemies) and TableLength(eligibleEnemies) >= args.Minimum then
			if not MapState.FlipTheArcanaCrowdCharmedEnemy or MapState.FlipTheArcanaCrowdCharmedEnemy.IsDead then
				MapState.FlipTheArcanaCrowdCharmedEnemy = GetRandomValue(eligibleEnemies)
			end

			if MapState.FlipTheArcanaCrowdCharmedEnemy.IsBoss or MapState.FlipTheArcanaCrowdCharmedEnemy.BlockCharm then
				MapState.FlipTheArcanaCrowdCharmedEnemy = nil
			else
				ApplyEffect({ 
					Id = CurrentRun.Hero.ObjectId, 
					DestinationId = MapState.FlipTheArcanaCrowdCharmedEnemy.ObjectId, 
					EffectName = args.EffectName or "Charm",
					DataProperties = 
					{
						Type = "CHARM",
						Duration = 0.5,
						Active = true,
						TimeModifierFraction = 0,
					}
				})
			end
		end
		wait(0.3, RoomThreadName)
	end
end

function mod.GetNumberofEnemies()
	local nearbyTargetIds = GetClosestIds({ Id = CurrentRun.Hero.ObjectId, DestinationName = "EnemyTeam", IgnoreInvulnerable = true, IgnoreHomingIneligible = true, IgnoreSelf = true, Distance = 2000 })
		local eligibleEnemies = {}
		for _, id in pairs(nearbyTargetIds) do
			if ActiveEnemies[id] and not ActiveEnemies[id].IsDead and not ActiveEnemies[id].SkipModifiers then
				table.insert(eligibleEnemies, ActiveEnemies[id])
			end
		end
	return TableLength(eligibleEnemies)
end

modutil.mod.Path.Wrap("RemoveStoreItem", function(base, args)
	if HeroHasTrait("ReversedExtraPurchaseMetaUpgrade") then
	if CurrentRun == nil or CurrentRun.CurrentRoom == nil or CurrentRun.CurrentRoom.Store == nil or IsEmpty( CurrentRun.CurrentRoom.Store.StoreOptions ) then
		return base(args)
	end
	args = args or {}
	local wasFirstPurchase = not CurrentRun.CurrentRoom.FirstPurchase
	local removedItem = false
	local replacedKitId = nil
	local replacedIndex = nil
	for i, data in pairs( CurrentRun.CurrentRoom.Store.StoreOptions ) do
		local dataArgs = data.Args or {}
		if args.IsBoon and data.Type == "Boon" and data.Args and data.Args.ForceLootName == args.Name and TableLength(dataArgs.BoonRaritiesOverride) == TableLength(args.BoonRaritiesOverride) then
			if dataArgs.BoonRaritiesOverride == args.BoonRaritiesOverride then
				removedItem = true
				break
			elseif dataArgs.BoonRaritiesOverride ~= nil and args.BoonRaritiesOverride ~= nil and dataArgs.BoonRaritiesOverride.Epic == args.BoonRaritiesOverride.Epic and  dataArgs.BoonRaritiesOverride.Rare == args.BoonRaritiesOverride.Rare then
				removedItem = true
				break
			end
		elseif data.Name == ( args.Name .. "Drop" ) or data.Name == ( "Shop" .. args.Name )  then
			removedItem = true
			break
		elseif data.Name == args.Name then
			removedItem = true
			break
		end
	end
	if CurrentRun.CurrentRoom.Store.SpawnedStoreItems then
		for i, data in pairs(CurrentRun.CurrentRoom.Store.SpawnedStoreItems ) do
			if data.ObjectId == args.Id then
				replacedKitId = data.KitId
				replacedIndex = i
			end
		end 
	end
	base(args)
	if wasFirstPurchase and removedItem and not CurrentRun.CurrentRoom.DeliveredFlippedArcanaBonusSale and not HasHeroTraitValue("FirstPurchaseDiscount") then
		CurrentRun.CurrentRoom.FirstPurchase = true
		CurrentRun.CurrentRoom.DeliveredFlippedArcanaBonusSale = true
		local room = CurrentRun.CurrentRoom
			if room.StoreDataName ~= nil then
				local storeData = StoreData[room.StoreDataName]
				if storeData ~= nil then
					thread( RestockWorldItem, replacedIndex, replacedKitId, args )
				end
			end
	elseif not wasFirstPurchase and not CurrentRun.CurrentRoom.DeliveredFlippedArcanaBonusSale and HasHeroTraitValue("FirstPurchaseDiscount") then
		CurrentRun.CurrentRoom.DeliveredFlippedArcanaBonusSale = true
		local room = CurrentRun.CurrentRoom
			if room.StoreDataName ~= nil then
				local storeData = StoreData[room.StoreDataName]
				replacedIndex = 3
				if storeData ~= nil then
					thread( RestockWorldItem, replacedIndex, replacedKitId, args )
				end
			end
	end
else
	return base(args)
end
end)

modutil.mod.Path.Wrap("GetTotalHeroTraitValue", function(base,propertyName, args)
	if propertyName == "ResourceGatherHeal" and HeroHasTrait("ReversedGatherRarityMetaUpgrade") then
		mod.DoGatherUpgrade()
	end
	return base(propertyName, args)
end)

function mod.DoGatherUpgrade()
	if not HeroHasTrait("ReversedGatherRarityMetaUpgrade") then return end
	local trait = GetHeroTrait("ReversedGatherRarityMetaUpgrade")
	if RandomChance(trait.FlipTheArcanaUpgradeArcanaChance) then
		mod.CerbMetaUpgradeRarity({Count = 1})
	else
		AddRarityToTraits(trait, { NumTraits = 1,})
	end
end

--[[modutil.mod.Path.Wrap("KeepsakeScreenClose", function(base,screen,button)
	--Need to do this for GiftRackEquipRandomKeepsake
	if not CanFreeSwapKeepsakes() and screen.LastTrait ~= GameState.LastAwardTrait and GameState.LastAwardTrait and HeroHasTrait("ReversedKeepsakeReAddMetaUpgrade") then
		local trait = GetHeroTrait("ReversedKeepsakeReAddMetaUpgrade")
		trait.KeepsakeToCopy = screen.LastTrait
		--GameState.LastAwardTrait
	end
	base(screen, button)
	if HeroHasTrait("ReversedKeepsakeReAddMetaUpgrade") and not CanFreeSwapKeepsakes() then
		local traitData = GetHeroTrait("ReversedKeepsakeReAddMetaUpgrade")
		local keepsakeToCopy = traitData.KeepsakeToCopy
		traitData.KeepsakeToCopy = nil
		if not keepsakeToCopy then return end
		if Contains({ "AthenaEncounterKeepsake", "HadesAndPersephoneKeepsake", "EscalatingKeepsake", "FountainRarityKeepsake" }, keepsakeToCopy) then return end
		local baseRepeatedTraitData = TraitData[keepsakeToCopy]
		if baseRepeatedTraitData then
			local rarityTable = {"Common", "Rare", "Epic", "Heroic"}
			local rarityNum = traitData.FlipTheArcanaReuseKeepsakeRarity
			if rarityNum > 4 then
				rarityNum = 4
			end
			if rarityNum == 4 and not baseRepeatedTraitData.RarityLevels[rarityTable[rarityNum] ] then
				rarityNum = 3
			end
			local rarity = rarityTable[rarityNum]
			if baseRepeatedTraitData.Permanent and HeroHasTrait(keepsakeToCopy) then
				local trait = GetHeroTrait(keepsakeToCopy)
				local newTraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = keepsakeToCopy, Rarity = rarity})
				-- With only two cases I don't think it's worth making a generic solution
				if trait.Name == "GoldifyKeepsake" then
					trait.BoonConversionUses = trait.BoonConversionUses + newTraitData.BoonConversionUses
				elseif trait.Name == "RarifyKeepsake" then
					trait.RarityUpgradeData.Uses = trait.RarityUpgradeData.Uses + newTraitData.RarityUpgradeData.Uses
				end
			else
				EquipKeepsake( CurrentRun.Hero, keepsakeToCopy, { ForceRarity = rarity, FromLoot = true, OverwriteSlot = true, SkipAddToHUD = true })
				local newKeepsake = keepsakeToCopy
				if newKeepsake == "BonusMoneyKeepsake" then
					local newTraitData = GetHeroTrait("BonusMoneyKeepsake") 
					AddResource( "Money", round(newTraitData.BonusMoney * GetTotalHeroTraitValue( "MoneyMultiplier", { IsMultiplier = true } )), "BonusMoneyKeepsake" )
				end
			end
		end
	end
end)

modutil.mod.Path.Wrap("GiftRackEquipRandomKeepsake", function(base, source, args)
	if not CanFreeSwapKeepsakes() and GameState.LastAwardTrait and HeroHasTrait("ReversedKeepsakeReAddMetaUpgrade") then
		local trait = GetHeroTrait("ReversedKeepsakeReAddMetaUpgrade")
		trait.KeepsakeToCopy = GameState.LastAwardTrait
	end
	base(source, args)
	if HeroHasTrait("ReversedKeepsakeReAddMetaUpgrade") and not CanFreeSwapKeepsakes() then
		local traitData = GetHeroTrait("ReversedKeepsakeReAddMetaUpgrade")
		local keepsakeToCopy = traitData.KeepsakeToCopy
		traitData.KeepsakeToCopy = nil
		if not keepsakeToCopy then return end
		if Contains({ "AthenaEncounterKeepsake", "HadesAndPersephoneKeepsake", "EscalatingKeepsake", "FountainRarityKeepsake" }, keepsakeToCopy) then return end
		local baseRepeatedTraitData = TraitData[keepsakeToCopy]
		if baseRepeatedTraitData then
			local rarityTable = {"Common", "Rare", "Epic", "Heroic"}
			local rarityNum = traitData.FlipTheArcanaReuseKeepsakeRarity
			if rarityNum > "4" then
				rarityNum = 4
			end
			if rarityNum == "4" and not baseRepeatedTraitData.RarityLevels[rarityTable[rarityNum] ] then
				rarityNum = 3
			end
			local rarity = rarityTable[rarityNum]
			if baseRepeatedTraitData.Permanent and HeroHasTrait(keepsakeToCopy) then
				local trait = GetHeroTrait(keepsakeToCopy)
				local newTraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = keepsakeToCopy, Rarity = rarity})
				-- With only two cases I don't think it's worth making a generic solution
				if trait.Name == "GoldifyKeepsake" then
					trait.BoonConversionUses = trait.BoonConversionUses + newTraitData.BoonConversionUses
				elseif trait.Name == "RarifyKeepsake" then
					trait.RarityUpgradeData.Uses = trait.RarityUpgradeData.Uses + newTraitData.RarityUpgradeData.Uses
				end
			else
				EquipKeepsake( CurrentRun.Hero, keepsakeToCopy, { ForceRarity = rarity, FromLoot = true, OverwriteSlot = true, SkipAddToHUD = true })
				local newKeepsake = keepsakeToCopy
				if newKeepsake == "BonusMoneyKeepsake" then
					local newTraitData = GetHeroTrait("BonusMoneyKeepsake") 
					AddResource( "Money", round(newTraitData.BonusMoney * GetTotalHeroTraitValue( "MoneyMultiplier", { IsMultiplier = true } )), "BonusMoneyKeepsake" )
				end
			end
		end
	end
end)]]

modutil.mod.Path.Wrap("CreateUpgradeChoiceButton", function(base,screen, lootData, itemIndex, itemData, args )
	local upgradeData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = itemData.ItemName, Rarity = itemData.Rarity })
	args = args or {}
	if HeroHasTrait("ReversedRandomBonusLevelsMetaUpgrade") and not itemData.FlipTheArcanaRandomBonusLevelsRun and not upgradeData.BlockStacking and IsGodTrait(itemData.ItemName) and not lootData.IgnoreStackBoost then
		itemData.FlipTheArcanaRandomBonusLevelsRun = true
		if not itemData.StackNum then
					local stackNum = itemData.StackNum or 0

			local maxRank = GetTotalHeroTraitValue("MaxBonusBoonRankWeighted")
			local distribution = GetHeroTraitValues("MaxBonusBoonRankDistribution", { First = true })[1]
			if not IsEmpty( distribution ) and not IsEmpty(distribution[maxRank] ) then
				stackNum = GetRandomValueFromWeightedList( distribution[maxRank] )
			else
				stackNum = RandomInt( 0, maxRank )
			end
			if IsFateValid() and GetTotalHeroTraitValue("FatedBoonLevelBonus") > 0 then
				stackNum = stackNum + GetTotalHeroTraitValue("FatedBoonLevelBonus") + 1
			end
		local trait = GetHeroTrait("ReversedRandomBonusLevelsMetaUpgrade")
		if RandomChance(0.7) then
			stackNum = stackNum + RandomInt( 0, trait.MaxBonusLevels )
			if stackNum == 1 then stackNum = 0 end
		end
		itemData.StackNum = stackNum
	end
	end
	local traitData = TraitData[itemData.ItemName]
	if HeroHasTrait("ReversedRandomSacrificeMetaUpgrade") and not itemData.FlipTheArcanaRandomSacrificeRun and not traitData.Slot and not upgradeData.BlockStacking and IsGodTrait(itemData.ItemName) and not lootData.IgnoreStackBoost and (lootData.GodLoot and not lootData.TreatAsGodLootByShops) then
		local metaUpgradeTrait = GetHeroTrait("ReversedRandomSacrificeMetaUpgrade")
		itemData.FlipTheArcanaRandomSacrificeRun = true
		if not itemData.TraitToReplace and not screen.FlipTheArcanaTraitToReplaceName and itemData.Rarity ~= "Heroic" and RandomChance(metaUpgradeTrait.FlipTheArcanaRandomSacrificeChance) then
			local traitToReplaceName = mod.GetReplacementTrait()
			if traitToReplaceName then
				local traitToReplace = GetHeroTrait(traitToReplaceName)
				itemData.TraitToReplace = traitToReplaceName
				itemData.OldRarity = traitToReplace.Rarity
				itemData.Rarity = GetUpgradedRarity(traitToReplace.Rarity)
				screen.FlipTheArcanaTraitToReplaceName = traitToReplaceName
			end
		end
	end
	return base(screen, lootData, itemIndex, itemData, args)
end)

modutil.mod.Path.Wrap("FormatExtractedValue", function(base,value,extractData)
if extractData.Format and extractData.Format == "FlipArcanaKeepsakeRarity" then
    local table = {"AwardRank1","AwardRank2", "AwardRank3", "AwardRank4"}
    return "{!Icons." ..table[value].."}"
end
return base(value, extractData)
end)

modutil.mod.Path.Wrap("CreateRoom", function(base, roomData, args)
	if HeroHasTrait("ReversedExtraFeaturesMetaUpgrade") then 
	local room = base(roomData, args)
	local trait = GetHeroTrait("ReversedExtraFeaturesMetaUpgrade")
	local challengeBaseIds = GetIdsByType({ Name = "ChallengeSwitchBase" })

	if RandomChance(trait.FlipTheArcanaExtraFeatureChance) and challengeBaseIds and not (room.ChallengeChanceSuccess or room.WellShopChanceSuccess or room.SurfaceShopChanceSuccess) then
		local options = {}
		
		local requirements = roomData.ChallengeSpawnRequirements or RoomData.BaseRoom.ChallengeSpawnRequirements
		if IsGameStateEligible( room, requirements) then
			table.insert(options,"ForceEliteSwitch")
			table.insert(options,"ForceChallengeSwitch")
			table.insert(options,"ForcePerfectClearSwitch")
		end
		requirements = roomData.WellShopRequirements or RoomData.BaseRoom.WellShopRequirements
		if IsGameStateEligible( room, requirements)  then
			table.insert(options, "ForceWellShop")
		end
				
		requirements = roomData.SurfaceShopRequirements or RoomData.BaseRoom.SurfaceShopRequirements
		if IsGameStateEligible( room, requirements)then
			table.insert(options, "ForceSurfaceShop")
		end
		if not IsEmpty(options) then
		local success = RemoveRandomValue(options)
		room[success] = true
		end
	end
	return room
	else
		return base(roomData, args)
	end
end)

function mod.CheckPerfectPower(victim, args, triggerArgs)
	if IsExWeapon( triggerArgs.SourceWeapon, { Combat = true }, triggerArgs ) then
		return
	end
	if triggerArgs.SourceProjectile and ProjectileData[triggerArgs.SourceProjectile] and ProjectileData[triggerArgs.SourceProjectile].IsAdditionalCastProjectile then
		return
	end
	if not HeroHasTrait("ReversedPerfectPowerMetaUpgrade") then return end
	local trait = GetHeroTrait("ReversedPerfectPowerMetaUpgrade")
	local isUpdated = false
	if trait.FlipTheArcanaCurrentBonusStacks < trait.FlipTheArcanaMaxBonusStacks then
		trait.FlipTheArcanaCurrentBonusStacks = math.min(trait.FlipTheArcanaCurrentBonusStacks + 1, trait.FlipTheArcanaMaxBonusStacks)
		isUpdated = true
	end
	if isUpdated and trait.FlipTheArcanaCurrentBonusStacks == trait.FlipTheArcanaMaxBonusStacks then
		PlaySound({ Name = "/SFX/ThanatosCreepyBellStart", Id = CurrentRun.Hero.ObjectId })
	end
end

function mod.ResetPerfectPower( attacker, args, triggerArgs )
	if triggerArgs.ManuallyTriggered or not triggerArgs.DamageAmount or triggerArgs.DamageAmount <= 0 then
		return
	end
	local trait = GetHeroTrait( "ReversedPerfectPowerMetaUpgrade")
	trait.FlipTheArcanaCurrentBonusStacks = 0
end

modutil.mod.Path.Wrap("CalculateBaseDamageAdditions", function(base, attacker, victim, triggerArgs)
    local damageAddition = base(attacker, victim, triggerArgs)
	if HeroHasTrait("ReversedPerfectPowerMetaUpgrade") and (triggerArgs.SourceWeapon and IsExWeapon( triggerArgs.SourceWeapon , { Combat = true }, triggerArgs))  then
		local trait = GetHeroTrait("ReversedPerfectPowerMetaUpgrade")
		local stacks = trait.FlipTheArcanaCurrentBonusStacks or 0
		local powerPerStack = trait.FlipTheArcanaPowerPerStack or 0
		damageAddition = damageAddition + stacks * powerPerStack
	end
    return damageAddition
end)

function mod.CheckFarewellBuff()
	if not HeroHasTrait("ReversedFullDefianceMetaUpgrade") then return end
	if not mod.AtFullDefiance() then return end
	local trait = GetHeroTrait("ReversedFullDefianceMetaUpgrade")
	if not MapState.FlipTheArcanaFarewellDodge then
		local dodgeChance = trait.FlipTheArcanaFullDDDodgeChance
		MapState.FlipTheArcanaFarewellDodge = dodgeChance
		SetLifeProperty({ Property = "DodgeChance", Value = dodgeChance, ValueChangeType = "Add", DestinationId = CurrentRun.Hero.ObjectId, DataValue = false })
	end
end

function mod.RemoveFarewellBuff()
	if MapState.FlipTheArcanaFarewellDodge and MapState.FlipTheArcanaFarewellDodge > 0 then
		SetLifeProperty({ Property = "DodgeChance", Value = -MapState.FlipTheArcanaFarewellDodge, ValueChangeType = "Add", DestinationId = CurrentRun.Hero.ObjectId, DataValue = false })
		MapState.FlipTheArcanaFarewellDodge = nil
	end
end

function mod.AtFullDefiance()
	local currentLastStandNum = TableLength( CurrentRun.Hero.LastStands )
	local maxLastStands = CurrentRun.Hero.MaxLastStands or 0
	if HeroHasTrait("FocusLastStandBoon") then
		local hasAthenaLastStand = false
		for i, lastStand in ipairs( CurrentRun.Hero.LastStands ) do
			if lastStand.Name == "Athena"  then
				hasAthenaLastStand = true
				break
			end
		end
		if not hasAthenaLastStand then
			currentLastStandNum = currentLastStandNum + 1
		end
	end
	if currentLastStandNum < maxLastStands then return false end
	if maxLastStands == 0 then return false end
	if currentLastStandNum >= maxLastStands then return true end
end

modutil.mod.Path.Wrap("CheckLastStand", function(base, victim, triggerArgs)
	local value = base(victim, triggerArgs)
	if MapState.FlipTheArcanaFarewellDodge and MapState.FlipTheArcanaFarewellDodge > 0 and not mod.AtFullDefiance() then
		mod.RemoveFarewellBuff()
	end
	return value
end)

modutil.mod.Path.Wrap("HasHeroTraitValue", function(base, propertyName)
	if propertyName == "CapMaxHealth" and HeroHasTrait("ReversedArtemisKeepsakeMetaUpgrade") then
		local trait = GetHeroTrait("ReversedArtemisKeepsakeMetaUpgrade")
		return trait
	end
	return base(propertyName)
end)


function mod.IncreaseOmegaCount( weaponData, traitArgs, triggerArgs )
	if CurrentRun.Hero.Frozen or triggerArgs.UnitIdOverride then
		return
	end
	if traitArgs.IsEx and (not IsExWeapon( weaponData.Name , {Combat = true}, triggerArgs) and not triggerArgs.DisjointExCast) then
		return
	end
	if Contains({ "WeaponCast",  "WeaponCastArm", "WeaponCastVacuum", "WeaponAnywhereCast", "WeaponCastProjectile", "WeaponCastProjectileHades","WeaponCastLob", "WeaponSprint", "WeaponSprintEx",}, weaponData.Name)
	then return end
    SessionMapState.FlipTheArcanaOmegasUsed = SessionMapState.FlipTheArcanaOmegasUsed or 0
	SessionMapState.FlipTheArcanaOmegasUsed = SessionMapState.FlipTheArcanaOmegasUsed + 1
end

modutil.mod.Path.Wrap("GetManaCost", function(base,weaponData, useRequiredMana, args)
	if HeroHasTrait("ReversedFreeOmegaMetaUpgrade") then
		local trait = GetHeroTrait("ReversedFreeOmegaMetaUpgrade")
		if SessionMapState.FlipTheArcanaOmegasUsed and SessionMapState.FlipTheArcanaOmegasUsed >= trait.FlipTheArcanaFreeOmegas then
			return base(weaponData, useRequiredMana, args)
		else
			if IsExWeapon(weaponData.Name, {}, {}) and not Contains({ "WeaponCast",  "WeaponCastArm", "WeaponCastVacuum", "WeaponAnywhereCast", "WeaponCastProjectile", "WeaponCastProjectileHades","WeaponCastLob"}, weaponData.Name) then
				return 0
			end
			return base(weaponData, useRequiredMana, args)
		end
	end
	return base(weaponData, useRequiredMana, args)
end)

function mod.FirstHitPolymorph( victim, functionArgs, triggerArgs )
	if victim.FlipTheArcanaFirstHitPolymorphRun then return end
	victim.FlipTheArcanaFirstHitPolymorphRun = true
	if not RandomChance( functionArgs.Chance ) then
		return
	end
	if not victim then return end
	--[[if not IsExWeapon( triggerArgs.SourceWeapon, { Combat = true }, triggerArgs ) then
		return
	end]]

	if victim.ImmuneToPolymorph or victim.IsPolymorphed then
		return
	end

	
	if victim == CurrentRun.Hero then
		return
	end

	--[[if HeroHasTrait("ExPolymorphBoon") then
		TraitUIActivateTrait( GetHeroTrait("ExPolymorphBoon"), { FlashOnActive = true, Duration = functionArgs.Cooldown })
	end]]
	-- Kludgey, should move the effect data off of the polymorph projectile and into EffectData.
	local duration = 0
	local effectName = "PolymorphTag"
	local dataProperties = MergeAllTables({
		EffectData[effectName].DataProperties, 
		functionArgs.EffectArgs
	})
	duration = functionArgs.Duration
	dataProperties.Duration = duration
	
	SessionMapState.PolymorphIgnores[victim.ObjectId] = true
	ApplyEffect( { DestinationId = victim.ObjectId, Id = CurrentRun.Hero.ObjectId, EffectName = effectName, DataProperties = dataProperties } )
	
	effectName = "PolymorphDamageTaken"
	local dataProperties = MergeAllTables({
		EffectData[effectName].DataProperties, 
		functionArgs.EffectArgs
	})
	dataProperties.Duration = duration
	dataProperties.Modifier = GetTotalHeroTraitValue("PolymorphDamageMultiplier", { IsMultiplier = true })
	ApplyEffect( { DestinationId = victim.ObjectId, Id = CurrentRun.Hero.ObjectId, EffectName = effectName, DataProperties = dataProperties } )
end

function mod.CheckDaggerCritCharges( weaponData, functionArgs, triggerArgs )
	if MapState.FlipTheArcanaDaggerCharges and MapState.FlipTheArcanaDaggerCharges >= 1 then
		MapState.FlipTheArcanaCritVolleys = MapState.FlipTheArcanaCritVolleys or {}
		MapState.FlipTheArcanaCritVolleys[weaponData.Name] = MapState.FlipTheArcanaCritVolleys[weaponData.Name] or {}
		if triggerArgs.ProjectileVolley then
			IncrementTableValue(MapState.FlipTheArcanaCritVolleys[weaponData.Name], triggerArgs.ProjectileVolley, triggerArgs.NumProjectiles )
		else

			IncrementTableValue(MapState.FlipTheArcanaCritVolleys[weaponData.Name],"BackupProjectile", triggerArgs.NumProjectiles )
		end
		local numProjectiles = 1
		if weaponData.Name == "WeaponDaggerThrow" then
			numProjectiles = triggerArgs.NumProjectiles or numProjectiles
		end
		MapState.FlipTheArcanaDaggerCharges = MapState.FlipTheArcanaDaggerCharges - numProjectiles

		for k,v in ipairs( SessionMapState.FlipTheArcanaDaggerCritTicks ) do
			if k > MapState.FlipTheArcanaDaggerCharges then
				mod.RemoveArtemisDaggerTick( k )
				if not triggerArgs.ProjectileVolley then
					triggerArgs.WeaponName = weaponData.Name
					mod.RemoveCritVolley(triggerArgs)
				end
			end
		end

		if MapState.FlipTheArcanaDaggerCharges <= 0 then
			thread( DaggerBlockClearedPresentation, {ActivatedVfx = "DaggerBlockActiveFx"} )
			MapState.FlipTheArcanaDaggerCharges = 0
		end
	end
end

function mod.RemoveArtemisDaggerTick( index )
	if SessionMapState.FlipTheArcanaDaggerCritTicks[ index ] then 
		local daggerId = SessionMapState.FlipTheArcanaDaggerCritTicks[ index ]
		SetAnimation({ Name = "ArtemisCritDaggerTickOut", DestinationId = daggerId})
		wait( 0.13333 )
		if daggerId then
		Destroy({ Id = daggerId})
		end
	end
end

function mod.RemoveCritVolley(triggerArgs)
	if triggerArgs.WeaponName and MapState.FlipTheArcanaCritVolleys and MapState.FlipTheArcanaCritVolleys[triggerArgs.WeaponName] then
		if triggerArgs.ProjectileVolley then
		DecrementTableValue( MapState.FlipTheArcanaCritVolleys[triggerArgs.WeaponName], triggerArgs.ProjectileVolley )
		if MapState.FlipTheArcanaCritVolleys[triggerArgs.WeaponName][triggerArgs.ProjectileVolley] <= 0 then
			MapState.FlipTheArcanaCritVolleys[triggerArgs.WeaponName][triggerArgs.ProjectileVolley] = nil
		end
		else
			DecrementTableValue( MapState.FlipTheArcanaCritVolleys[triggerArgs.WeaponName], "BackupProjectile" )
		if MapState.FlipTheArcanaCritVolleys[triggerArgs.WeaponName]["BackupProjectile"] <= 0 then
			MapState.FlipTheArcanaCritVolleys[triggerArgs.WeaponName]["BackupProjectile"] = nil
		end	
		end
	end
end

function mod.SetupArtemisDaggerTicks( victim, functionArgs, triggerArgs )
	
	SessionMapState.FlipTheArcanaDaggerCritTicks = SessionMapState.FlipTheArcanaDaggerCritTicks or {}

	for k,v in ipairs( SessionMapState.FlipTheArcanaDaggerCritTicks ) do
		Destroy({ Id = SessionMapState.FlipTheArcanaDaggerCritTicks[ k ]})
	end

	MapState.FlipTheArcanaDaggerCharges = functionArgs.CritCount
	local daggerTicks = MapState.FlipTheArcanaDaggerCharges
	
Destroy({ Ids = SessionMapState.FlipTheArcanaDaggerCritTicks})

	for k,v in ipairs( SessionMapState.FlipTheArcanaDaggerCritTicks ) do
		Destroy({ Id = SessionMapState.FlipTheArcanaDaggerCritTicks[ k ]})
	end

	for i = 1, daggerTicks do
		if SessionMapState.FlipTheArcanaDaggerCritTicks[i] then
			Destroy({Id = SessionMapState.FlipTheArcanaDaggerCritTicks[i]})
		end
		SessionMapState.FlipTheArcanaDaggerCritTicks[i] = SpawnObstacle({ Name = "BlankObstacle", DestinationId = CurrentRun.Hero.ObjectId, Group = "Standing" })
		Attach({ Id = SessionMapState.FlipTheArcanaDaggerCritTicks[i], DestinationId = CurrentRun.Hero.ObjectId , OffsetY = -50})
		SetAnimation({ Name = "ArtemisCritDaggerTick", DestinationId = SessionMapState.FlipTheArcanaDaggerCritTicks[i] })
		wait( 0.01 )

		local centeredAngle = 90
		local angleSpread = 220
		local angleOffset = math.floor(i/2) / math.floor(daggerTicks/2) * angleSpread / 2

		angleOffset = angleOffset * ( i%2*2-1 )
		centeredAngle = centeredAngle  + angleOffset
		if daggerTicks % 2 == 0 then 
			centeredAngle = centeredAngle + ( angleSpread / daggerTicks / 2)
		end

		SetAngle({ Id = SessionMapState.FlipTheArcanaDaggerCritTicks[i], Angle = centeredAngle })
	end
end

function mod.RefillDefiancesWithTrait(trait)
	if not trait then return end
	if not trait.FlipTheArcanaDDRestored then return end
	local spentDD = mod.WorkOutRemainingDefiances()
	local refillNum = math.min(spentDD, trait.FlipTheArcanaDDRestored)
	mod.RefillSomeDD(refillNum)
	if refillNum > 0 then
		trait.FlipTheArcanaDDRestored = trait.FlipTheArcanaDDRestored - refillNum
		thread(InCombatText, CurrentRun.Hero.ObjectId, "FlipTheArcanaDDRestoreProcess", 0.5, { PreDelay = 0.5 })
	end
end

function mod.RefillSomeDD(refillNum)
if not CurrentRun.Hero.MaxLastStands then
		return	
	end
	args = args or {}
	local numLastStands = refillNum
	local hadLastStands = HasLastStand( CurrentRun.Hero )
	if numLastStands > 0 then
		local currentFraction = 0.4 
		while numLastStands > 0 do
			AddLastStand({
				Name = "Echo",
				Icon = "ExtraLifeStyx",
				ManaFraction = currentFraction,
				HealFraction = currentFraction,
				Silent = true,
			})
			numLastStands = numLastStands - 1
		end
		
		if not hadLastStands then
			thread( LowHealthBonusBuffStatePresentation, 0.5 )
		end
		RecreateLifePips()
	end
end

function mod.GetReplacementTrait( )
	

	local traitOptions = {}

	for i, traitData in ipairs( CurrentRun.Hero.Traits ) do
		if IsGodTrait(traitData.Name, { ForShop = true }) and not traitData.Slot and traitData.Rarity ~= nil and GetRarityValue( traitData.Rarity ) <= 3 and GetUpgradedRarity(traitData.Rarity) then
			table.insert(traitOptions, traitData.Name)
		end
	end
	if IsEmpty(traitOptions) then return nil end

	return GetRandomValue(traitOptions)
end

modutil.mod.Path.Wrap("Damage", function(base,victim, triggerArgs)
	if victim and triggerArgs and victim == CurrentRun.Hero and HeroHasTrait("ReversedProtectionCooldownMetaUpgrade") then
		local trait = GetHeroTrait("ReversedProtectionCooldownMetaUpgrade")
		if triggerArgs.DamageAmount > 0 and CheckCooldown("ReversedProtectionCooldownMetaUpgrade", trait.FlipTheArcanaUnyieldingCooldown) then
			StopAnimation({ Name = "MelShieldFront", DestinationId = CurrentRun.Hero.ObjectId })
			StopAnimation({ Name = "MelShieldBack", DestinationId = CurrentRun.Hero.ObjectId })
			triggerArgs.DamageAmount = 1
			thread(mod.RestoreUnyielding, trait.FlipTheArcanaUnyieldingCooldown)
		end
	end
	if victim and triggerArgs and triggerArgs.DamageAmount and triggerArgs.DamageAmount > 0 and victim == CurrentRun.Hero and HeroHasTrait("ReversedManaShieldMetaUpgrade") then
		local trait = GetHeroTrait("ReversedManaShieldMetaUpgrade")
		local manaShieldData = trait.FlipTheArcanaManaShieldData
		local manaCost = math.ceil(math.ceil(triggerArgs.DamageAmount * manaShieldData.DamageBlocked) * manaShieldData.ManaPerDamageBlocked)
		if manaCost > CurrentRun.Hero.Mana then
			manaCost = CurrentRun.Hero.Mana
		end
		triggerArgs.DamageAmount = triggerArgs.DamageAmount - math.ceil( manaCost / manaShieldData.ManaPerDamageBlocked )
		ManaDelta( -manaCost, { IgnoreSpend = true, ManaDrain = true })
	end
	if victim and victim == CurrentRun.Hero and CurrentRun.FlipTheArcanaRegretMetaUpgrades and triggerArgs and triggerArgs.DamageAmount and triggerArgs.DamageAmount > 0 then
		local lossChance = 0.6
		if HeroHasTrait("ReversedKeepsakeReAddMetaUpgrade") then
			local trait = GetHeroTrait("ReversedKeepsakeReAddMetaUpgrade")
			lossChance = trait.BaseCardLossChance
		end
		if RandomChance(lossChance) then
			mod.LossFragileCards(numCards)
		end
	end
	return base(victim, triggerArgs)
end)

modutil.mod.Path.Wrap("UseHealthFountain", function(base, used, user)
	if HeroHasTrait("ReversedFountainGoldMetaUpgrade") then
		local trait = GetHeroTrait("ReversedFountainGoldMetaUpgrade")
		thread( GushMoney, { Amount = trait.FlipTheArcanaFountainGold, LocationId = CurrentRun.Hero.ObjectId, Radius = 100, Source = "FlipTheArcana Gold Fountain Trait"})
	end
	return base(used, user)
end)

function mod.RestoreUnyielding(cooldown)
	wait(cooldown, RoomThreadName)
    PlaySound({ Name = "/SFX/WrathOver", Id = CurrentRun.Hero.ObjectId })
	thread( InCombatTextArgs, { TargetId = CurrentRun.Hero.ObjectId, Text = "FlipTheArcanaUnyieldingRestored", Duration = 1, PreDelay = 0 } )
	CreateAnimation({ Name = "MelShieldFront", DestinationId = CurrentRun.Hero.ObjectId })
end

function mod.SetupUnyielding()
CreateAnimation({ Name = "MelShieldFront", DestinationId = CurrentRun.Hero.ObjectId })
end

--[[function mod.GetCardAllSides(cardName)
	local metaUpgradeReversePairs = {}
	for i = 1,5 do
		for j = 1,5 do
			local newTable = {}
			table.insert(newTable, mod.MetaUpgradeDefaultCardLayout[i][j])
			table.insert(newTable, mod.MetaUpgradeDefaultCardLayout[i+5][j])
			table.insert(newTable, mod.MetaUpgradeDefaultCardLayout[i+10][j])
			table.insert(newTable, mod.MetaUpgradeDefaultCardLayout[i+15][j])
			table.insert(metaUpgradeReversePairs, newTable)
		end
	end
	return mod.FindTableContainingValue(metaUpgradeReversePairs, cardName)
end


function mod.DrawCardOtherSides(numCards, args)
	args = args or {}
	numCards = numCards or 3
	local delay = args.Delay or 3
	local unequippedUnlockedMetaupgrades = {}
	local skippedLowPriorityMetaupgrade = {}
	local equippedMetaUpgrades = {}
	local combinedMetaUpgradeDefaultCardLayout = DeepCopyTable(mod.MetaUpgradeDefaultCardLayout)
	wait(delay)
	local eligibleCards = {}
	for cardName, cardData in pairs(GameState.MetaUpgradeState) do
		if cardData.Equipped then		
			equippedMetaUpgrades[cardName] = true
		end
	end

	for _, cardName in paits(equippedMetaUpgrades) do
		if not Contains({"CardDraw", "ReversedCardDraw", "ReversedKeepsakeReAdd", "ReversedDrawOtherSides"}, cardName) then
			table.insert(eligibleCards, mod.GetCardAllSides(cardName))
		end
	end
	

	for row, rowData in pairs( eligibleCards ) do
		for column, cardName in pairs( rowData ) do
			local metaUpgradeData = GameState.MetaUpgradeState[cardName]
			if metaUpgradeData and metaUpgradeData.Unlocked and not metaUpgradeData.Equipped then
				local fateConflict = false
				if GameState.FatedStatus == "Fated" and FatedDisableMetaUpgrades[cardName] then
					fateConflict = true
				end
				if GameState.FatedStatus ~= "Fated" and (cardName == "ReversedDoorReroll" or cardName == "ReversedTradeOff" or cardName == "ReversedScreenReroll") then
					fateConflict = true
				end
				if not fateConflict and not (Contains(unequippedUnlockedMetaupgrades, cardName) or Contains(skippedLowPriorityMetaupgrade, cardName)) then
					if MetaUpgradeCardData[cardName].RandomDrawChance then
						if RandomChance(MetaUpgradeCardData[cardName].RandomDrawChance) then
							table.insert(unequippedUnlockedMetaupgrades, cardName)
						else
							table.insert(skippedLowPriorityMetaupgrade, cardName)
						end
					else
						table.insert(unequippedUnlockedMetaupgrades, cardName)
					end
				end
			end
		end
	end

	local addedMetaUpgrades = {}
	while (not IsEmpty( unequippedUnlockedMetaupgrades ) or not IsEmpty( skippedLowPriorityMetaupgrade )) and numCards > 0 do
		numCards = numCards - 1
		local metaUpgradeName = nil
		if not IsEmpty( unequippedUnlockedMetaupgrades ) then
			metaUpgradeName = RemoveRandomValue(unequippedUnlockedMetaupgrades)
		else
			metaUpgradeName = RemoveRandomValue(skippedLowPriorityMetaupgrade)
		end
		if MetaUpgradeCardData[metaUpgradeName].RequiredCardNames and not ContainsAnyKey( equippedMetaUpgrades, MetaUpgradeCardData[metaUpgradeName].RequiredCardNames ) and not IsEmpty(unequippedUnlockedMetaupgrades) then
			table.insert( skippedLowPriorityMetaupgrade, metaUpgradeName )
			metaUpgradeName = RemoveRandomValue( unequippedUnlockedMetaupgrades )
		end
		CurrentRun.TemporaryMetaUpgrades[metaUpgradeName] = true
		GameState.MetaUpgradeState[metaUpgradeName].Equipped = true
		equippedMetaUpgrades[metaUpgradeName] = true

		table.insert( addedMetaUpgrades, metaUpgradeName )
		if MetaUpgradeCardData[ metaUpgradeName ].TraitName then
			local rarityLevel = GetMetaUpgradeLevel( metaUpgradeName )
			if args.RarityLevel then
				rarityLevel = args.RarityLevel
			end
			AddTraitToHero({ 
				SkipNewTraitHighlight = true, 
				TraitName = MetaUpgradeCardData[ metaUpgradeName ].TraitName, 
				Rarity = TraitRarityData.RarityUpgradeOrder[ rarityLevel ],
				CustomMultiplier = 1,
				SourceName = metaUpgradeName,
				})
		end
		if MetaUpgradeCardData[ metaUpgradeName ].OnGrantedFunctionName then
			thread( CallFunctionName, MetaUpgradeCardData[ metaUpgradeName ].OnGrantedFunctionName, MetaUpgradeCardData[ metaUpgradeName ].TraitName, MetaUpgradeCardData[ metaUpgradeName ].OnGrantedFunctionArgs, args )
		end
	end

	thread( AddedMetaUpgradePresentation, addedMetaUpgrades, delay )
end]]

function mod.RandomiseArcanaBuild(trait,args)

		args = args or {}
	numCards = trait.FlipTheArcanaRandomCardsDrawn

	if CurrentRun.FlipTheArcanaTycheMetaUpgrades then
		for cardName in pairs(CurrentRun.FlipTheArcanaTycheMetaUpgrades) do
			GameState.MetaUpgradeState[cardName].Equipped = nil
			local metaUpgradeData = MetaUpgradeCardData[cardName]
			if cardName == "LastStand" then
				mod.RemoveLastStands(CurrentRun.Hero, "Default")
			elseif cardName == "ReversedRenewableDD" then
				mod.RemoveLastStands(CurrentRun.Hero, "FlipTheArcanaRenewableLastStand")
			end
			RemoveWeaponTrait( metaUpgradeData.TraitName, {Silent = true} )
		end
	end
	local delay = args.Delay or 3
	local unequippedUnlockedMetaupgrades = {}
	local skippedLowPriorityMetaupgrade = {}
	local equippedMetaUpgrades = {}
	for cardName, cardData in pairs(GameState.MetaUpgradeState) do
		if cardData.Equipped then		
			equippedMetaUpgrades[cardName] = true
		end
	end

	for row, rowData in pairs( mod.MetaUpgradeDefaultCardLayout ) do
		for column, cardName in pairs( rowData ) do
			local metaUpgradeData = GameState.MetaUpgradeState[cardName]
			if metaUpgradeData and metaUpgradeData.Unlocked and not metaUpgradeData.Equipped and not Contains({"CardDraw", "ReversedCardDraw", "ReversedKeepsakeReAdd", "ReversedRandomBuild", "ReversedRandomCards", "ReversedEpicRarityBoost", "StartingGold"}, cardName) then
				local fateConflict = false
				if GameState.FatedStatus == "Fated" and FatedDisableMetaUpgrades[cardName] then
					fateConflict = true
				end
				if not fateConflict then
					if MetaUpgradeCardData[cardName].RandomDrawChance then
						if RandomChance(MetaUpgradeCardData[cardName].RandomDrawChance) then
							table.insert(unequippedUnlockedMetaupgrades, cardName)
						else
							table.insert(skippedLowPriorityMetaupgrade, cardName)
						end
					else
						table.insert(unequippedUnlockedMetaupgrades, cardName)
					end
				end
			end
		end
	end

	local addedMetaUpgrades = {}
	CurrentRun.FlipTheArcanaTycheMetaUpgrades = {}
	while (not IsEmpty( unequippedUnlockedMetaupgrades ) or not IsEmpty( skippedLowPriorityMetaupgrade )) and numCards > 0 do
		numCards = numCards - 1
		local metaUpgradeName = nil
		if not IsEmpty( unequippedUnlockedMetaupgrades ) then
			metaUpgradeName = RemoveRandomValue(unequippedUnlockedMetaupgrades)
		else
			metaUpgradeName = RemoveRandomValue(skippedLowPriorityMetaupgrade)
		end
		if MetaUpgradeCardData[metaUpgradeName].RequiredCardNames and not ContainsAnyKey( equippedMetaUpgrades, MetaUpgradeCardData[metaUpgradeName].RequiredCardNames ) and not IsEmpty(unequippedUnlockedMetaupgrades) then
			table.insert( skippedLowPriorityMetaupgrade, metaUpgradeName )
			metaUpgradeName = RemoveRandomValue( unequippedUnlockedMetaupgrades )
		end
		CurrentRun.TemporaryMetaUpgrades[metaUpgradeName] = true
		CurrentRun.FlipTheArcanaTycheMetaUpgrades[metaUpgradeName] = true
		GameState.MetaUpgradeState[metaUpgradeName].Equipped = true
		equippedMetaUpgrades[metaUpgradeName] = true

		table.insert( addedMetaUpgrades, metaUpgradeName )
		if MetaUpgradeCardData[ metaUpgradeName ].TraitName then
			local rarityLevel = GetMetaUpgradeLevel( metaUpgradeName )
			if args.RarityLevel then
				rarityLevel = args.RarityLevel
			end
			AddTraitToHero({ 
				SkipNewTraitHighlight = true, 
				TraitName = MetaUpgradeCardData[ metaUpgradeName ].TraitName, 
				Rarity = TraitRarityData.RarityUpgradeOrder[ rarityLevel ],
				CustomMultiplier = 1,
				SourceName = metaUpgradeName,
				})
		end
		if MetaUpgradeCardData[ metaUpgradeName ].OnGrantedFunctionName then
			thread( CallFunctionName, MetaUpgradeCardData[ metaUpgradeName ].OnGrantedFunctionName, MetaUpgradeCardData[ metaUpgradeName ].TraitName, MetaUpgradeCardData[ metaUpgradeName ].OnGrantedFunctionArgs, args )
		end
	end
	if numCards > 0 and not IsEmpty(lowPriorityMetaupgrades) then
	
	end
	CurrentRun.NumRerolls = GetTotalHeroTraitValue( "RerollCount" )

	thread(InCombatText, CurrentRun.Hero.ObjectId, "FlipTheArcanaBuildRandomised", 0.5, { PreDelay = 0.1 })
	--thread( AddedMetaUpgradePresentation, addedMetaUpgrades, delay )

end

modutil.mod.Path.Wrap("SetTraitTrayDetails", function(base,args)
base(args)
local button = args.Button or {}
local traitData = args.TraitData or button.TraitData
if traitData and traitData.Name and traitData.MetaUpgrade and CurrentRun.FlipTheArcanaTycheMetaUpgrades and mod.GetCardFromTrait(traitData.Name) and CurrentRun.FlipTheArcanaTycheMetaUpgrades[mod.GetCardFromTrait(traitData.Name)] and button.Id then
				CreateTextBox({
					Text = "FlipTheArcanaRandomisedCardBase",
					Id = button.Id,
					UseDescription = true,
					TextSymbolScale = 0,
					Color = Color.Transparent,
				})
			end
			if traitData and traitData.Name and traitData.MetaUpgrade and CurrentRun.FlipTheArcanaRegretMetaUpgrades and mod.GetCardFromTrait(traitData.Name) and CurrentRun.FlipTheArcanaRegretMetaUpgrades[mod.GetCardFromTrait(traitData.Name)] and button.Id then
				CreateTextBox({
					Text = "FlipTheArcanaFragileCardBase",
					Id = button.Id,
					UseDescription = true,
					TextSymbolScale = 0,
					Color = Color.Transparent,
				})
			end
end)

function mod.AddFragileCards(numCards)
	local delay =  3
	local unequippedUnlockedMetaupgrades = {}
	local skippedLowPriorityMetaupgrade = {}
	local equippedMetaUpgrades = {}
	for cardName, cardData in pairs(GameState.MetaUpgradeState) do
		if cardData.Equipped then		
			equippedMetaUpgrades[cardName] = true
		end
	end

	for row, rowData in pairs( mod.MetaUpgradeDefaultCardLayout ) do
		for column, cardName in pairs( rowData ) do
			local metaUpgradeData = GameState.MetaUpgradeState[cardName]
			if metaUpgradeData and metaUpgradeData.Unlocked and not metaUpgradeData.Equipped and not Contains({"CardDraw", "ReversedCardDraw", "ReversedKeepsakeReAdd", "ReversedRandomBuild", "ReversedRandomCards", "ReversedEpicRarityBoost"}, cardName) then
				local fateConflict = false
				if GameState.FatedStatus == "Fated" and FatedDisableMetaUpgrades[cardName] then
					fateConflict = true
				end
				if not fateConflict then
					if MetaUpgradeCardData[cardName].RandomDrawChance then
						if RandomChance(MetaUpgradeCardData[cardName].RandomDrawChance) then
							table.insert(unequippedUnlockedMetaupgrades, cardName)
						else
							table.insert(skippedLowPriorityMetaupgrade, cardName)
						end
					else
						table.insert(unequippedUnlockedMetaupgrades, cardName)
					end
				end
			end
		end
	end

	local addedMetaUpgrades = {}
	CurrentRun.FlipTheArcanaRegretMetaUpgrades = CurrentRun.FlipTheArcanaRegretMetaUpgrades or {}
	while (not IsEmpty( unequippedUnlockedMetaupgrades ) or not IsEmpty( skippedLowPriorityMetaupgrade )) and numCards > 0 do
		numCards = numCards - 1
		local metaUpgradeName = nil
		if not IsEmpty( unequippedUnlockedMetaupgrades ) then
			metaUpgradeName = RemoveRandomValue(unequippedUnlockedMetaupgrades)
		else
			metaUpgradeName = RemoveRandomValue(skippedLowPriorityMetaupgrade)
		end
		if MetaUpgradeCardData[metaUpgradeName].RequiredCardNames and not ContainsAnyKey( equippedMetaUpgrades, MetaUpgradeCardData[metaUpgradeName].RequiredCardNames ) and not IsEmpty(unequippedUnlockedMetaupgrades) then
			table.insert( skippedLowPriorityMetaupgrade, metaUpgradeName )
			metaUpgradeName = RemoveRandomValue( unequippedUnlockedMetaupgrades )
		end
		CurrentRun.TemporaryMetaUpgrades[metaUpgradeName] = true
		CurrentRun.FlipTheArcanaRegretMetaUpgrades[metaUpgradeName] = true
		GameState.MetaUpgradeState[metaUpgradeName].Equipped = true
		equippedMetaUpgrades[metaUpgradeName] = true

		table.insert( addedMetaUpgrades, metaUpgradeName )
		if MetaUpgradeCardData[ metaUpgradeName ].TraitName then
			local rarityLevel = GetMetaUpgradeLevel( metaUpgradeName )
			
			AddTraitToHero({ 
				SkipNewTraitHighlight = true, 
				TraitName = MetaUpgradeCardData[ metaUpgradeName ].TraitName, 
				Rarity = TraitRarityData.RarityUpgradeOrder[ rarityLevel ],
				CustomMultiplier = 1,
				SourceName = metaUpgradeName,
				})
		end
		if MetaUpgradeCardData[ metaUpgradeName ].OnGrantedFunctionName then
			thread( CallFunctionName, MetaUpgradeCardData[ metaUpgradeName ].OnGrantedFunctionName, MetaUpgradeCardData[ metaUpgradeName ].TraitName, MetaUpgradeCardData[ metaUpgradeName ].OnGrantedFunctionArgs, args )
		end
	end
	if numCards > 0 and not IsEmpty(lowPriorityMetaupgrades) then
	
	end

	--thread(InCombatText, CurrentRun.Hero.ObjectId, "FlipTheArcanaBuildRandomised", 0.5, { PreDelay = 0.1 })
	--thread( AddedMetaUpgradePresentation, addedMetaUpgrades, delay )

end

function mod.LossFragileCards(numCards)
	numCards = numCards or 0
	if not CurrentRun.FlipTheArcanaRegretMetaUpgrades or IsEmpty(CurrentRun.FlipTheArcanaRegretMetaUpgrades) then return end
	local cardToRemove = RemoveRandomKey(CurrentRun.FlipTheArcanaRegretMetaUpgrades)
	if cardToRemove then
		hero = hero or CurrentRun.Hero
		if MetaUpgradeCardData[ cardToRemove ] and GameState.MetaUpgradeState[cardToRemove].Equipped and MetaUpgradeCardData[ cardToRemove ].TraitName then
			GameState.MetaUpgradeState[cardToRemove].Equipped = nil
			if cardToRemove == "LastStand" then
				mod.RemoveLastStands(CurrentRun.Hero, "Default", "ExtraLifeMel")
			elseif cardToRemove == "ReversedRenewableDD" then
				mod.RemoveLastStands(CurrentRun.Hero, "FlipTheArcanaRenewableLastStand", "ExtraLifeSkelly")
			end
			RemoveWeaponTrait(	MetaUpgradeCardData[ cardToRemove ].TraitName )
			thread( InCombatTextArgs, { TargetId= CurrentRun.Hero.ObjectId, Text = "FlipTheArcanaCardLost_CombatText", SkipRise = false, SkipFlash = false, Duration = 0.95, ShadowScale = 0.75, ShadowScaleX = 1.28, LuaKey = "TempTextData", LuaValue = { Name = cardToRemove }})
		end
	end

end

modutil.mod.Path.Wrap("AddRerolls", function(base, source, args)
	if not CurrentRun.NumRerolls then
		CurrentRun.NumRerolls = 0
	end
	return base(source, args)
end)

function mod.RemoveLastStands(heroUnit, name, icon )
	local unit = heroUnit or CurrentRun.Hero
	for i, lastStandData in pairs(unit.LastStands) do
		if lastStandData.Name == name and lastStandData.Icon == icon then
			table.remove(unit.LastStands, i )
			return
		end
	end
end