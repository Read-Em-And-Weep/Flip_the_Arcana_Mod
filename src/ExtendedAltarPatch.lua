--I have absolutely ripped this off of Extended Altar of Ashes. Unfortunately since the functions are local, I cannot access them. All credit goes to BlueRaja - if you have an issue with it, please let me know!


local function multiplyCosts(costTable, multiplier)
    local result = {}
    for key, value in pairs(costTable) do
        result[key] = math.ceil(value * multiplier)
    end
    return result
end



local function addAdditionalUpgrades(upgradeTable, skipLegendary)
    local lastUpgrade = upgradeTable.UpgradeResourceCost[#upgradeTable.UpgradeResourceCost]
    if lastUpgrade then
        table.insert(upgradeTable.UpgradeResourceCost, multiplyCosts(lastUpgrade, 1.5))
        if not skipLegendary then
            table.insert(upgradeTable.UpgradeResourceCost, multiplyCosts(lastUpgrade, 2))
        end
    end
end

local function addLegendaryMultiplier(traitName)
    local oldEpic = game.TraitData[traitName].RarityLevels.Epic.Multiplier
    local oldHeroic = game.TraitData[traitName].RarityLevels.Heroic.Multiplier
    game.TraitData[traitName].RarityLevels["Legendary"] = {Multiplier = (2 * oldHeroic - oldEpic) }
    return
end


addAdditionalUpgrades(MetaUpgradeCardData.ReversedChanneledCast, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedHealthRegen, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedLowManaDamageBonus, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedMagicCrit, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedBonusDodge, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedCastBuff, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedBonusHealth, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedManaOverTime, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedSorceryRegenUpgrade, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedChanneledBlock, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedSprintShield, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedLastStand, false) 
addAdditionalUpgrades(MetaUpgradeCardData.ReversedMaxHealthPerRoom, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedCastCount, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedLowHealthBonus, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedDoorReroll, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedStartingGold, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedStatusVulnerability, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedRarityBoost, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedBonusRarity, true)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedTradeOff, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedScreenReroll, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedMetaToRunUpgrade, false)  
addAdditionalUpgrades(MetaUpgradeCardData.ReversedEpicRarityBoost, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedCardDraw, false)

addLegendaryMultiplier("ReversedChanneledCastMetaUpgrade")
addLegendaryMultiplier("ReversedHealthRegenMetaUpgrade")
addLegendaryMultiplier("ReversedLowManaDamageBonusMetaUpgrade")
addLegendaryMultiplier("ReversedCastCountMetaUpgrade")
addLegendaryMultiplier("ReversedSorceryRegenMetaUpgrade")
addLegendaryMultiplier("ReversedCastBuffMetaUpgrade")
addLegendaryMultiplier("ReversedBonusHealthMetaUpgrade")
addLegendaryMultiplier("ReversedBonusDodgeMetaUpgrade")
addLegendaryMultiplier("ReversedManaOverTimeMetaUpgrade")
addLegendaryMultiplier("ReversedMagicCritMetaUpgrade")
addLegendaryMultiplier("ReversedSprintShieldMetaUpgrade")
addLegendaryMultiplier("ReversedMaxHealthPerRoomMetaUpgrade")
addLegendaryMultiplier("ReversedStatusVulnerabilityMetaUpgrade")
addLegendaryMultiplier("ReversedLastStand")
addLegendaryMultiplier("ReversedChanneledBlockMetaUpgrade")
addLegendaryMultiplier("ReversedDoorRerollMetaUpgrade")
addLegendaryMultiplier("ReversedStartingGoldMetaUpgrade")
addLegendaryMultiplier("ReversedMetaToRunUpgradeMetaUpgrade")
addLegendaryMultiplier("ReversedRarityBoostMetaUpgrade")
addLegendaryMultiplier("ReversedTradeOffMetaUpgrade")
addLegendaryMultiplier("ReversedScreenRerollMetaUpgrade")
addLegendaryMultiplier("ReversedLowHealthBonusMetaUpgrade")
addLegendaryMultiplier("ReversedEpicRarityBoostMetaUpgrade")
addLegendaryMultiplier("ReversedEpicRarityBoostMetaUpgrade")
addLegendaryMultiplier("ReversedCardDrawMetaUpgrade")

for newMetaUpgradeCardName, newMetaUpgradeCardData in pairs(NewMetaUpgradeCardData) do
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