--I have absolutely ripped this off of Extended Altar of Ashes. Unfortunately since the functions are local, I cannot access them. All credit goes to BlueRaja - if you have an issue with it, please let me know!


local function multiplyCosts(costTable, multiplier)
    local result = {}
    for key, value in pairs(costTable) do
        result[key] = math.ceil(value * multiplier)
    end
    return result
end


local function addLegendaryMultiplier(traitName)
    local oldEpic = game.TraitData[traitName].RarityLevels.Epic.Multiplier
    local oldHeroic = game.TraitData[traitName].RarityLevels.Heroic.Multiplier
    game.TraitData[traitName].RarityLevels["Legendary"] = {Multiplier = (2 * oldHeroic - oldEpic) }
    return
end


local function addAdditionalUpgrades(upgradeTable, skipLegendary)
    local lastUpgrade = upgradeTable.UpgradeResourceCost[#upgradeTable.UpgradeResourceCost]
    if lastUpgrade then
        table.insert(upgradeTable.UpgradeResourceCost, multiplyCosts(lastUpgrade, 1.5))
        if not skipLegendary then
            addLegendaryMultiplier(upgradeTable.TraitName)
            table.insert(upgradeTable.UpgradeResourceCost, multiplyCosts(lastUpgrade, 2))
        end
    end
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
addAdditionalUpgrades(MetaUpgradeCardData.ReversedLastStand, true) 
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

addAdditionalUpgrades(MetaUpgradeCardData.ReversedDoorCashCard, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedManaPerRoomCard, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedLowHealthCrit, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedSturdyChannel, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedCharmedEnemy, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedCrowdDamage, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedSharedRunProgress, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedOlympianDamage, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedExtraPurchase, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedPomBiomeStart, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedStrongRush, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedRenewableDD, true) 
addAdditionalUpgrades(MetaUpgradeCardData.ReversedArmorPerRoom, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedStatusCrit, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedEncounterHeal, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedExtraFeatures, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedPerfectClearBoost, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedHeroicRarity, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedSacrificeForLevels, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedGatherRarity, true)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedPerfectPower, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedUnFatedReward, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedFullDefiance, false)  
addAdditionalUpgrades(MetaUpgradeCardData.ReversedRandomBonusLevels, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedKeepsakeReAdd, true)

addAdditionalUpgrades(MetaUpgradeCardData.ReversedCheaperChannel, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedPotentDefiance, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedBackstab, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedBonusTalent, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedSpellDamage, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedFirstHitTransform, true)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedHealthWithBoons, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedProjectileSlow, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedCursedLegendaryBoost, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedFreeOmega, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedDashRecovery, true)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedProtectionCooldown, true) 
addAdditionalUpgrades(MetaUpgradeCardData.ReversedElementRoom, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedUniqueGod, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedManaShield, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedRandomSacrifice, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedAdditionalOmegaChance, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedRiposteKill, true)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedRandomCards, true)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedBossResistance, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedArtemisKeepsake, true)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedFountainGold, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedDDRefillBiomeStart, false)  
addAdditionalUpgrades(MetaUpgradeCardData.ReversedMoreSacrifices, false)
addAdditionalUpgrades(MetaUpgradeCardData.ReversedRandomBuild, true)


--TODO: REMEMBER TO DO THIS FOR NEW CARDS

--[[addLegendaryMultiplier("ReversedChanneledCastMetaUpgrade")
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
addLegendaryMultiplier("ReversedChanneledBlockMetaUpgrade")
addLegendaryMultiplier("ReversedDoorRerollMetaUpgrade")
addLegendaryMultiplier("ReversedStartingGoldMetaUpgrade")
addLegendaryMultiplier("ReversedMetaToRunUpgradeMetaUpgrade")
addLegendaryMultiplier("ReversedRarityBoostMetaUpgrade")
addLegendaryMultiplier("ReversedTradeOffMetaUpgrade")
addLegendaryMultiplier("ReversedScreenRerollMetaUpgrade")
addLegendaryMultiplier("ReversedLowHealthBonusMetaUpgrade")
addLegendaryMultiplier("ReversedEpicRarityBoostMetaUpgrade")
addLegendaryMultiplier("ReversedCardDrawMetaUpgrade")]]

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