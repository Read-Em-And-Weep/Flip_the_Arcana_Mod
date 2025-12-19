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

 
modutil.mod.Path.Wrap("CreateMetaUpgradeCards", function(base, screen, cardArgs)
    base(screen, cardArgs)
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
            mod.ReverseCard(screen, buttonToFlip, false, cardArgs)
        end
    end
    for row, rowData in pairs( GameState.MetaUpgradeCardLayout ) do
		for column, cardName in pairs( rowData ) do
			if not GameState.FlipTheArcanaHasRun then
				if (GameState.MetaUpgradeState[mod.GetFlippedCardName(cardName)].Equipped) then
					row = MetaUpgradeCardData[cardName].Row
            		column = MetaUpgradeCardData[cardName].Column
            		buttonToFlip = screen.Components[GetMetaUpgradeKey(row, column)]
            		mod.ReverseCard(screen, buttonToFlip, false, cardArgs)
				end
			end
            GameState.MetaUpgradeState[cardName].Visible = true
        end
    end
	GameState.FlipTheArcanaHasRun = true
    CheckAutoEquipCards()
end)

modutil.mod.Path.Wrap("MetaUpgradeCardAction", function(base, screen, button)
    base(screen, button)
    if GameState.MetaUpgradeState[button.CardName].Enabled then
        GameState.MetaUpgradeState[button.CardName].Visible = true
    end
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
		SetColor({Id = newObstacle.EquippedHighlightId, Color = Color.MediumPurple})
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

modutil.mod.Path.Override("MetaUpgradeCardUpgradeScreenInspect", function(screen, button)
    --turn off inspecting cards so that you can flip on upgrade screen
    return
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
    local basevalue = base(requirementData)

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



modutil.mod.Path.Override("CloseMetaUpgradeCardScreen", function(screen, args)
    args = args or {}
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
    if not IsEmpty(GameState.SavedMetaUpgradeLayouts[GameState.CurrentMetaUpgradeLayout]) and not IsEmpty(GameState.SavedMetaUpgradeLayoutsVisibility[GameState.CurrentMetaUpgradeLayout]) then
		for metaUpgradeName in pairs( GameState.SavedMetaUpgradeLayouts[GameState.CurrentMetaUpgradeLayout] ) do
			if (GameState.SavedMetaUpgradeLayoutsVisibility[GameState.CurrentMetaUpgradeLayout][metaUpgradeName] ~= GameState.MetaUpgradeState[metaUpgradeName].Visible) then
                if MetaUpgradeCardData[metaUpgradeName].Flipped then
                    local row = MetaUpgradeCardData[metaUpgradeName].Row
                    local column = MetaUpgradeCardData[metaUpgradeName].Column
                else
                    local row = MetaUpgradeCardData[GetFlippedCardName(metaUpgradeName)].Row
                    local column = MetaUpgradeCardData[GetFlippedCardName(metaUpgradeName)].Column
                local cardToFlip = screen.Components[GetMetaUpgradeKey(row, column)]
                ReverseCard(screen, cardToFlip, false)
                end
            if GameState.SavedMetaUpgradeLayouts[GameState.CurrentMetaUpgradeLayout][metaUpgradeName] then
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
    if not IsEmpty(GameState.SavedMetaUpgradeLayouts[GameState.CurrentMetaUpgradeLayout]) then
		for metaUpgradeName in pairs( GameState.SavedMetaUpgradeLayouts[GameState.CurrentMetaUpgradeLayout] ) do
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

    if not IsEmpty(GameState.SavedMetaUpgradeLayouts[GameState.CurrentMetaUpgradeLayout]) then
		for metaUpgradeName in pairs( GameState.SavedMetaUpgradeLayouts[GameState.CurrentMetaUpgradeLayout] ) do
            --[[local row, column = MetaUpgradeCardData[metaUpgradeName].Row, MetaUpgradeCardData[metaUpgradeName].Column
            local cardAtCoords = GameState.MetaUpgradeCardLayout[row][column]
            if GameState.SavedMetaUpgradeLayouts[GameState.CurrentMetaUpgradeLayout][GetFlippedCardName(cardAtCoords)] then
                buttonToFlip = screen.Components[GetMetaUpgradeKey(row,column)]
                ReverseCard(screen, buttonToFlip, false)
            end]]
            for row, rowData in pairs(GameState.MetaUpgradeCardLayout) do
                for column, cardName in pairs(rowData) do
                    if mod.GetFlippedCardName(GameState.MetaUpgradeCardLayout[row][column]) == metaUpgradeName then
                        buttonToFlip = screen.Components[GetMetaUpgradeKey(row,column)]
                        mod.ReverseCard(screen, buttonToFlip, false, {})
                    end
                end
             end
        end
    end
    return base(screen,button)
    

end)







    --[[if not IsEmpty(GameState.SavedMetaUpgradeLayouts[GameState.CurrentMetaUpgradeLayout]) then
		for metaUpgradeName in pairs( GameState.SavedMetaUpgradeLayouts[GameState.CurrentMetaUpgradeLayout] ) do
			if GameState.MetaUpgradeState[GetFlippedCardName(metaUpgradeName)].Equipped == true then
                row, column = LookupRowandColumn(GetFlippedCardName(metaUpgradeName))
                print("row")
                print(row)
                print("column")
                print(column)
                --local buttonToFlip = screen.Components[GetMetaUpgradeKey(row, column)]
                --ReverseCard(screen, buttonToFlip)
            end
		end
	end]]



modutil.mod.Path.Override("CheckAutoEquipCards", function(screen)
    local autoEquipMetaUpgrades = {}
	if not GameState.FlipTheArcanaHasRun then
		return
	end
	for metaUpgradeName, metaUpgradeData in pairs( GameState.MetaUpgradeState ) do
		if metaUpgradeData.Unlocked and MetaUpgradeCardData[metaUpgradeName].AutoEquipRequirements then
			if CheckAutoEquipRequirements(MetaUpgradeCardData[metaUpgradeName].AutoEquipRequirements) and GameState.MetaUpgradeState[metaUpgradeName].Visible then
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

function mod.GetFlippedCardName(cardName)
    local MetaUpgradeReversePairs = 
    {
        { "ChanneledCast", "ReversedChanneledCast" }, { "HealthRegen", "ReversedHealthRegen" }, { "LowManaDamageBonus", "ReversedLowManaDamageBonus" }, { "CastCount", "ReversedCastCount" }, { "SorceryRegenUpgrade", "ReversedSorceryRegenUpgrade" },
        { "CastBuff",      "ReversedCastBuff" }, { "BonusHealth", "ReversedBonusHealth" }, { "BonusDodge", "ReversedBonusDodge" }, { "ManaOverTime", "ReversedManaOverTime" }, { "MagicCrit", "ReversedMagicCrit" },
        { "SprintShield", "ReversedSprintShield" }, { "LastStand", "ReversedLastStand" }, { "MaxHealthPerRoom", "ReversedMaxHealthPerRoom" }, { "StatusVulnerability", "ReversedStatusVulnerability" }, { "ChanneledBlock", "ReversedChanneledBlock" },
        { "DoorReroll",   "ReversedDoorReroll" }, { "StartingGold", "ReversedStartingGold" }, { "MetaToRunUpgrade", "ReversedMetaToRunUpgrade" }, { "RarityBoost", "ReversedRarityBoost" }, { "BonusRarity", "ReversedBonusRarity" },
        { "TradeOff", "ReversedTradeOff" }, { "ScreenReroll", "ReversedScreenReroll" }, { "LowHealthBonus", "ReversedLowHealthBonus" }, { "EpicRarityBoost", "ReversedEpicRarityBoost" }, { "CardDraw", "ReversedCardDraw" },
    }
    for _, pair in ipairs(MetaUpgradeReversePairs) do
        local a, b = pair[1], pair[2]
        if cardName == a then
            return b
        elseif cardName == b then
            return a
        end
    end
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
    local combinedMetaUpgradeDefaultCardLayout = {
        { "ChanneledCast",			"HealthRegen",			"LowManaDamageBonus",	"CastCount",			"SorceryRegenUpgrade", 	},
	{ "CastBuff",				"BonusHealth",			"BonusDodge",			"ManaOverTime",			"MagicCrit" 			},
	{ "SprintShield",			"LastStand",			"MaxHealthPerRoom",		"StatusVulnerability",	"ChanneledBlock" 		},
	{ "DoorReroll",				"StartingGold",			"MetaToRunUpgrade",		"RarityBoost", 			"BonusRarity" 			},
	{ "TradeOff",				"ScreenReroll",			"LowHealthBonus",		"EpicRarityBoost",		"CardDraw" 				},
    { "ReversedChanneledCast",			"ReversedHealthRegen",			"ReversedLowManaDamageBonus",	"ReversedCastCount",			"ReversedSorceryRegenUpgrade", 	},
	{ "ReversedCastBuff",				"ReversedBonusHealth",			"ReversedBonusDodge",			"ReversedManaOverTime",			"ReversedMagicCrit" 			},
	{ "ReversedSprintShield",			"ReversedLastStand",			"ReversedMaxHealthPerRoom",		"ReversedStatusVulnerability",	"ReversedChanneledBlock" 		},
	{ "ReversedDoorReroll",				"ReversedStartingGold",			"ReversedMetaToRunUpgrade",		"ReversedRarityBoost", 			"ReversedBonusRarity" 			},
	{ "ReversedTradeOff",				"ReversedScreenReroll",			"ReversedLowHealthBonus",		"ReversedEpicRarityBoost",		"ReversedCardDraw" 				},
    }
	for rowIndex, row in ipairs( combinedMetaUpgradeDefaultCardLayout ) do
		for colIndex, metaUpgradeName in ipairs( row ) do
			local metaUpgradeState = GameState.MetaUpgradeState[metaUpgradeName]
			if metaUpgradeState ~= nil and metaUpgradeState.Equipped then
				--DebugPrint({ Text = "metaUpgradeName = "..metaUpgradeName })
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
	for _, traitData in ipairs( CurrentRun.Hero.Traits ) do
		if traitData.RarityUpgradeData then
			if not traitData.RarityUpgradeData.LootName and ( button.LootData.GodLoot or button.LootData.TreatAsGodLootByShops) and (not traitData.RarityUpgradeData.RequireNotExcludeFromLastRunBoon or not button.LootData.ExcludeFromLastRunBoon ) then
				upgradeTraitData = traitData
                if upgradeTraitData.RarityUpgradeData.RequireFated and not IsFateValid() then
                else 
                    uses = uses + upgradeTraitData.RarityUpgradeData.Uses
                end
			end
			if lootData.Name == traitData.RarityUpgradeData.LootName then
				-- More specific upgrades always take priority over general ones
				upgradeTraitData = traitData
                uses = uses + upgradeTraitData.RarityUpgradeData.Uses
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
				if not traitData.BlockMenuRarify and traitData.Name == upgradeData.ItemName and GetUpgradedRarity(traitData.Rarity) ~= nil and traitData.RarityLevels[GetUpgradedRarity(traitData.Rarity)] ~= nil and GetRarityValue( traitData.Rarity ) <= upgradeTraitData.RarityUpgradeData.MaxRarity then
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
            end
        end
    end    
end)

modutil.mod.Path.Wrap("Kill", function(base, victim, triggerArgs)
	if victim and victim.IsBoss and not victim.BlockPostBossMetaUpgrades and ( not victim.UseGroupHealthBar or victim.GroupHealthBarOwner ) then
		if HeroHasTrait("ReversedBonusRarityMetaUpgrade") then
			local addFamiliarsTrait = GetHeroTrait("ReversedBonusRarityMetaUpgrade")
			mod.AwardExtraPassiveFamiliarTrait(addFamiliarsTrait.RankAwarded)
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
	if encounter.EncounterType == "Boss" and not encounter.SkipBossTraits and HeroHasTrait("ReversedSorceryRegenMetaUpgrade") then
		local healingTrait = GetHeroTrait("ReversedSorceryRegenMetaUpgrade")
		local healingMultiplier = CalculateHealingMultiplier()
		local healAmount = (healingTrait.HealAmount.Amount) * healingMultiplier
		Heal(CurrentRun.Hero, {HealFraction = healAmount})
	end
	if HeroHasTrait("ReversedStartingGoldMetaUpgrade") then
		local armorTrait = GetHeroTrait("ReversedStartingGoldMetaUpgrade")
		local armorAmount = armorTrait.ArmorGranted
		if CurrentRun.Hero.HealthBuffer < 15 then
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
	if newTrait.Name == "ReversedEpicRarityBoostMetaUpgrade" then
		mod.AddEncouragementElements(newTrait.ElementsGranted)
		GrantBoons({BoonSets = {{ "ElementalDamageBoon", "ElementalOlympianDamageBoon", "ElementalBaseDamageBoon", "ElementalRallyBoon", "ElementalDamageFloorBoon", "ElementalDodgeBoon", "ElementalHealthBoon", "ElementalDamageCapBoon", "ElementalUnifiedBoon" },}}, nil)
	end
	return base(unit, traitData, args)
end)

function mod.AddEncouragementElements(elementsToAdd)
	local elementsAdded = 0 
	while elementsAdded < elementsToAdd do
		AddTraitToHero({TraitName = "ElementalEssence"})
		elementsAdded = elementsAdded + 1
	end
end

function mod.NoLastStandRegeneration( unit, args )
	while CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead do
		game.wait(args.Interval, "NoLastStandRegeneration")
		if CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead and (IsCombatEncounterActive( CurrentRun ) or ((not IsEmpty(ActiveEnemies)) and CurrentRun.CurrentRoom.Encounter.EncounterType == "Boss")) and not HasLastStand( CurrentRun.Hero ) and CurrentRun.Hero.Health < CurrentRun.Hero.MaxHealth and CurrentRun.CurrentRoom.Encounter.EncounterType == "Boss" then
			Heal( CurrentRun.Hero, { HealAmount = 1, SourceName = "NoLastStandRegeneration", Silent = true })
			FrameState.RequestUpdateHealthUI = true
			CreateAnimation({ Name = "HealthSparkleShower", DestinationId = CurrentRun.Hero.ObjectId, Group = "Overlay" })
		end
	end
end

function mod.AwardExtraPassiveFamiliarTrait(rank)
	local traitTable = { "CompanionshipHealthFamiliar", "CompanionshipCritFamiliar", "CompanionshipDigFamiliar",
		"CompanionshipDodgeFamiliar", "CompanionshipLastStandFamiliar" }
	if HeroHasTrait("HealthFamiliar") or HeroHasTrait("CompanionshipHealthFamiliar") then
		for k, v in pairs(traitTable) do
			if v == "CompanionshipHealthFamiliar" then
				table.remove(traitTable, k)
			end
		end
	end
	if HeroHasTrait("CritFamiliar") or HeroHasTrait("CompanionshipCritFamiliar") then
		for k, v in pairs(traitTable) do
			if v == "CompanionshipCritFamiliar" then
				table.remove(traitTable, k)
			end
		end
	end
	if HeroHasTrait("DigFamiliar") or HeroHasTrait("CompanionshipDigFamiliar") then
		for k, v in pairs(traitTable) do
			if v == "CompanionshipDigFamiliar" then
				table.remove(traitTable, k)
			end
		end
	end
	if HeroHasTrait("DodgeFamiliar") or HeroHasTrait("CompanionshipDodgeFamiliar") then
		for k, v in pairs(traitTable) do
			if v == "CompanionshipDodgeFamiliar" then
				table.remove(traitTable, k)
			end
		end
	end
	if HeroHasTrait("LastStandFamiliar") or HeroHasTrait("CompanionshipLastStandFamiliar") or not HeroHasTrait("LastStand") then
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
if traitArgs.Vfx == "DemeterBossIceShatter" then
	wait(0.1, RoomThreadName )
	CreateAnimation({ Name = traitArgs.Vfx, DestinationId = enemy.ObjectId, Group = "FX_Standing_Top" })
	thread( mod.FamineSpawnKillPresentation, enemy )
	thread( Damage, enemy, { AttackerId = CurrentRun.Hero.ObjectId, AttackerTable = CurrentRun.Hero, SourceProjectile = "ZeusOnSpawn", DamageAmount = damageAmount, Silent = false, PureDamage = true, IgnoreHealthBuffer = true } )
else
	return base(enemy,traitArgs,damageAmount)
end
end)

function mod.FamineSpawnKillPresentation(unit)
	PlaySound({ Name = "/Leftovers/SFX/PlayerKilledNEW", Id = unit.ObjectId })
	if CheckCooldown( "SpawnKillPresentationCooldown", 1.0 ) then
		thread( InCombatText, CurrentRun.Hero.ObjectId, "Hint_FamineSpawnKill", 0.75, { PreDelay = 0.25 } )
	end
end

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
	local args = args or {}

	local upgradeData = button.Data

	if HeroHasTrait("ReversedScreenRerollMetaUpgrade") and IsFateValid() and (source.GodLoot or name == "HermesUpgrade") then
		local chanceUpgradeBoon = GetHeroTrait("ReversedScreenRerollMetaUpgrade")
		if chanceUpgradeBoon and RandomChance(chanceUpgradeBoon.ModdedUpgradeChance) then
			thread(AddStackToTraits, { NumStacks = 1})
			wait(0.8)
			thread(AddStackToTraits, { NumStacks = 1})
		end
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
	end
	return outcome
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
		if victim and not victim.HasBeenHit then
			victim.HasBeenHit = true
			local firstHitTrait = GetHeroTrait("ReversedSprintShieldMetaUpgrade")
			originalDamageMultiplier = originalDamageMultiplier * (1+firstHitTrait.FirstHitMultiplier)
		end
	end
	if attacker == CurrentRun.Hero and HeroHasTrait("ReversedMagicCritMetaUpgrade") and victim and GameState.SpentShrinePointsCache then
		local fearMultipliedTrait = GetHeroTrait("ReversedMagicCritMetaUpgrade")
		originalDamageMultiplier = originalDamageMultiplier * (1+fearMultipliedTrait.FearMultipliedMultiplier * GameState.SpentShrinePointsCache/10000)
	end
	if attacker.ActiveEffects["ImpactSlow"] and HeroHasTrait("ReversedCastBuffMetaUpgrade") then
		local decreasedDamageInCastTrait = GetHeroTrait("ReversedCastBuffMetaUpgrade")
		originalDamageMultiplier = originalDamageMultiplier * decreasedDamageInCastTrait.LessDamageDealt
	end
	if attacker == CurrentRun.Hero and HeroHasTrait("ReversedStatusVulnerabilityMetaUpgrade") and victim then
		local noStatusDamageTrait = GetHeroTrait("ReversedStatusVulnerabilityMetaUpgrade")
		if TableLength( victim.VulnerabilityEffects ) == nil or TableLength( victim.VulnerabilityEffects ) < 1 then
			originalDamageMultiplier = originalDamageMultiplier * (1+noStatusDamageTrait.NoStatusBonusDamage)
		elseif TableLength( victim.VulnerabilityEffects ) == 1 then
			originalDamageMultiplier = originalDamageMultiplier * (1+0.5*noStatusDamageTrait.NoStatusBonusDamage)
		end
	end
end
	return originalDamageMultiplier
end)

modutil.mod.Path.Wrap("CalculateCritChance", function(base, attacker, victim, weaponData, triggerArgs) 
	local originalCritChance = base(attacker,victim,weaponData, triggerArgs)
	if HeroHasTrait("ReversedTradeOffMetaUpgrade") and IsFateValid() and victim and victim ~= CurrentRun.Hero then
		local fatedCritTrait = GetHeroTrait("ReversedTradeOffMetaUpgrade")
		originalCritChance = originalCritChance + fatedCritTrait.FatedCritcalChance
	end
	return originalCritChance
end)

modutil.mod.Path.Override("AddRandomMetaUpgrades", function(numCards, args)
args = args or {}
	numCards = numCards or 3
	local delay = args.Delay or 3
	local unequippedUnlockedMetaupgrades = {}
	local skippedLowPriorityMetaupgrade = {}
	local equippedMetaUpgrades = {}
	local combinedMetaUpgradeDefaultCardLayout = {
        { "ChanneledCast",			"HealthRegen",			"LowManaDamageBonus",	"CastCount",			"SorceryRegenUpgrade", 	},
	{ "CastBuff",				"BonusHealth",			"BonusDodge",			"ManaOverTime",			"MagicCrit" 			},
	{ "SprintShield",			"LastStand",			"MaxHealthPerRoom",		"StatusVulnerability",	"ChanneledBlock" 		},
	{ "DoorReroll",				"StartingGold",			"MetaToRunUpgrade",		"RarityBoost", 			"BonusRarity" 			},
	{ "TradeOff",				"ScreenReroll",			"LowHealthBonus",		"EpicRarityBoost",		"CardDraw" 				},
    { "ReversedChanneledCast",			"ReversedHealthRegen",			"ReversedLowManaDamageBonus",	"ReversedCastCount",			"ReversedSorceryRegenUpgrade", 	},
	{ "ReversedCastBuff",				"ReversedBonusHealth",			"ReversedBonusDodge",			"ReversedManaOverTime",			"ReversedMagicCrit" 			},
	{ "ReversedSprintShield",			"ReversedLastStand",			"ReversedMaxHealthPerRoom",		"ReversedStatusVulnerability",	"ReversedChanneledBlock" 		},
	{ "ReversedDoorReroll",				"ReversedStartingGold",			"ReversedMetaToRunUpgrade",		"ReversedRarityBoost", 			"ReversedBonusRarity" 			},
	{ "ReversedTradeOff",				"ReversedScreenReroll",			"ReversedLowHealthBonus",		"ReversedEpicRarityBoost",		"ReversedCardDraw" 				},
    }
	for cardName, cardData in pairs(GameState.MetaUpgradeState) do
		if cardData.Equipped then		
			equippedMetaUpgrades[cardName] = true
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
	local combinedMetaUpgradeDefaultCardLayout = {
        { "ChanneledCast",			"HealthRegen",			"LowManaDamageBonus",	"CastCount",			"SorceryRegenUpgrade", 	},
	{ "CastBuff",				"BonusHealth",			"BonusDodge",			"ManaOverTime",			"MagicCrit" 			},
	{ "SprintShield",			"LastStand",			"MaxHealthPerRoom",		"StatusVulnerability",	"ChanneledBlock" 		},
	{ "DoorReroll",				"StartingGold",			"MetaToRunUpgrade",		"RarityBoost", 			"BonusRarity" 			},
	{ "TradeOff",				"ScreenReroll",			"LowHealthBonus",		"EpicRarityBoost",		"CardDraw" 				},
    { "ReversedChanneledCast",			"ReversedHealthRegen",			"ReversedLowManaDamageBonus",	"ReversedCastCount",			"ReversedSorceryRegenUpgrade", 	},
	{ "ReversedCastBuff",				"ReversedBonusHealth",			"ReversedBonusDodge",			"ReversedManaOverTime",			"ReversedMagicCrit" 			},
	{ "ReversedSprintShield",			"ReversedLastStand",			"ReversedMaxHealthPerRoom",		"ReversedStatusVulnerability",	"ReversedChanneledBlock" 		},
	{ "ReversedDoorReroll",				"ReversedStartingGold",			"ReversedMetaToRunUpgrade",		"ReversedRarityBoost", 			"ReversedBonusRarity" 			},
	{ "ReversedTradeOff",				"ReversedScreenReroll",			"ReversedLowHealthBonus",		"ReversedEpicRarityBoost",		"ReversedCardDraw" 				},
    }
	for row, rowData in pairs( combinedMetaUpgradeDefaultCardLayout ) do
		for column, cardName in pairs( rowData ) do
			local metaUpgradeData = MetaUpgradeCardData[cardName]
			if metaUpgradeData.TraitName == traitName then
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

modutil.mod.Path.Wrap("CanSpecialInteract", function(base, source)
	if source.ResourceCosts ~= nil and HasResourceCost( source.ResourceCosts ) then
		return false
	end
	if mod.CanCardifyReward(source) then
		return true
	else
		return base(source)
	end
end)

modutil.mod.Path.Wrap("ShowUseButton", function(base,objectId, useTarget)
	if mod.CanCardifyReward(useTarget) and not (CanGoldifyReward(useTarget) and HeroHasTrait("GoldifyKeepsake")) then
		useTarget = ShallowCopyTable(useTarget)
		useTarget.UseTextTalkAndSpecial = "CardifyUseLootAndConsume"
		useTarget.UseTextTalkGiftAndSpecial = "CardifyUseLootGiftAndConsume"
		if useTarget.ReplaceSpecialForGoldify then
			useTarget.UseTextTalkAndSpecial = "CardifyUseLootAndConsume"
			useTarget.UseTextTalkGiftAndSpecial = "CardifyUseLootGiftAndConsume"
		end
	end
	return base(objectId, useTarget)
end)

game.OnControlPressed({ "SpecialInteract", function(triggerArgs)
	if not IsEmpty(ActiveScreens) then
		return
	end

	local target = triggerArgs.UseTarget
	if target ~= nil and mod.CanCardifyReward( target ) then
		
		EndAutoSprint({ Halt = true, EndWeapon = true })
		if mod.CanCardifyReward(target) and IsUseable({ Id = target.ObjectId }) then
			
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
			Destroy({ Id = target.ObjectId })
			cardDrawMetaTrait.Uses = cardDrawMetaTrait.Uses - 1
			UpdateTraitNumber(cardDrawMetaTrait)

			if target.MenuNotify then
				NotifyResultsTable[ target.MenuNotify ] = target.Name
				notifyExistingWaiters( target.MenuNotify )
			end
			if target.NotifyName then
				notifyExistingWaiters( target.NotifyName )
			end
			if CheckRoomExitsReady(CurrentRun.CurrentRoom) then
				UnlockRoomExits(CurrentRun, CurrentRun.CurrentRoom)
			end
		end
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
		print("room.Encounter.LootAName = "..tostring(room.Encounter.LootAName))
		print("room.Encounter.LootBName = "..tostring(room.Encounter.LootBName))
		if room.Encounter.LootBName == "MonstrosityMetaUpgradeUpgrade" then
			room.Encounter.LootBName = GetRandomValue(GetEligibleLootNames({room.Encounter.LootAName }))
		end
	end
	return base(exitDoor, chosenRewardType, chosenLootName, index, args)
end)