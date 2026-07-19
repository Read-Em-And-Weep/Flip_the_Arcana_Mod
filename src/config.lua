local config = {
  enabled = true;
  AlwaysUnlockAfterPurge = false,
  AutoUnlockAndUpgradeCards = false,
  LimitMaxArcanaDrawn = true,
  MaxArcanaDrawn = 45,
  EnableBlueCards = true,
  EnableVioletCards = true,
  EnableRedCards = true,
}

local configDesc = { 
LimitMaxArcanaDrawn = "Should the game limit the maximum number of cards that can be randomly drawn?",
MaxArcanaDrawn = "If LimitMaxArcanaDrawn is true, what should the maximum be?",
EnableBlueCards = "Should the blue set of Arcana be enabled? Please unequip any equipped blue cards first.",
EnableVioletCards = "Should the violet set of Arcana be enabled? Please unequip any equipped violet cards first.",
EnableRedCards = "Should the red set of Arcana be enabled? Please unequip any equipped red cards first.",
}

return config,configDesc