local config = {
  version = 0;
  enabled = true;
  AlwaysUnlockAfterPurge = false,
  AutoUnlockAndUpgradeCards = false,
  LimitMaxArcanaDrawn = true,
  MaxArcanaDrawn = 40
}

local configDesc = {
LimitMaxArcanaDrawn = "Should the game limit the maximum number of cards that can be randomly drawn?",
MaxArcanaDrawn = "If LimitMaxArcanaDrawn is true, what should the maximum be?"
}

return config,configDesc