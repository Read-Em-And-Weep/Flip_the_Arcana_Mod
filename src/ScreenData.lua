modutil.mod.Path.Wrap("LoadCurrentMetaUpgradeSet", function(base,screen, button)
    for metaUpgradeName, metaUpgradeState in pairs( GameState.MetaUpgradeState ) do
		if GameState.MetaUpgradeState[metaUpgradeName].Equipped then
			GameState.MetaUpgradeState[metaUpgradeName].Equipped = nil
		end
	end
	if not IsEmpty(GameState.FlipTheArcanaSavedMetaUpgradeLayouts[GameState.CurrentMetaUpgradeLayout]) then
		for metaUpgradeName in pairs( GameState.FlipTheArcanaSavedMetaUpgradeLayouts[GameState.CurrentMetaUpgradeLayout] ) do
			GameState.MetaUpgradeState[metaUpgradeName].Equipped = true
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
	UpdateMetaUpgradeCostText( screen )
end)

modutil.mod.Path.Wrap("SaveCurrentMetaUpgradeSet", function(base)
    GameState.FlipTheArcanaSavedMetaUpgradeLayouts[GameState.CurrentMetaUpgradeLayout] = {}
	for metaUpgradeName, metaUpgradeState in pairs( GameState.MetaUpgradeState ) do
		if GameState.MetaUpgradeState[metaUpgradeName].Equipped then
			GameState.FlipTheArcanaSavedMetaUpgradeLayouts[GameState.CurrentMetaUpgradeLayout][metaUpgradeName] = true
		end
	end
end)

modutil.mod.Path.Wrap("DoPatches", function(base)
    base()
	if not GameState then return end
    if not GameState.FlipTheArcanaSavedMetaUpgradeLayouts and GameState.SavedMetaUpgradeLayouts then
       GameState.FlipTheArcanaSavedMetaUpgradeLayouts = DeepCopyTable(GameState.SavedMetaUpgradeLayouts) or {}
    end
    GameState.FlipTheArcanaSavedMetaUpgradeLayouts = GameState.FlipTheArcanaSavedMetaUpgradeLayouts or {}
    for k,layout in pairs(GameState.SavedMetaUpgradeLayouts) do
        local valuesToRemove = {}
        for metaUpgradeName in pairs( layout ) do
			if MetaUpgradeCardData[metaUpgradeName].Flipped then
                table.insert(valuesToRemove, metaUpgradeName)
            end
		end
        for k1,value in pairs(valuesToRemove) do
            layout[value] = nil
        end
    end
end)

