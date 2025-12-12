local newButton =
{
    FlipCardButton =
    {
        Graphic = "ContextualActionButton",
        GroupName = "HUD_Backing",
        Requirements ={},
        Data =
        {
            OnMouseOverFunctionName = "MouseOverContextualAction",
            OnMouseOffFunctionName = "MouseOffContextualAction",
            OnPressedFunctionName = _PLUGIN.guid ..  "." .. "AttemptCardFlip",
            ControlHotkeys = { "Reroll", },
        },
        Text = "MetaUpgradeMem_FlipCard",
        TextArgs = UIData.ContextualButtonFormatRight,
    },
}

local newUpgradeButton = {
    FlipUpgradeCardButton =
    {
        Graphic = "ContextualActionButton",
        GroupName = "HUD_Backing",
        Requirements ={},
        Data =
        {
            OnMouseOverFunctionName = "MouseOverContextualAction",
            OnMouseOffFunctionName = "MouseOffContextualAction",
            OnPressedFunctionName = _PLUGIN.guid ..  "." .. "AttemptUpgradeCardFlip",
            ControlHotkeys = { "Reroll", },
        },
        Text = "MetaUpgradeMem_FlipCard",
        TextArgs = UIData.ContextualButtonFormatRight,
    },
}

for newButtonName, newButtonData in pairs(newButton) do
    table.insert(game.ScreenData.MetaUpgradeCardLayout.ComponentData.ActionBar.ChildrenOrder, newButtonName)
    game.ScreenData.MetaUpgradeCardLayout.ComponentData.ActionBar.Children.FlipCardButton=newButtonData
end

for newButtonName, newButtonData in pairs(newUpgradeButton) do
    table.insert(game.ScreenData.MetaUpgradeCardUpgradeLayout.ComponentData.ActionBar.ChildrenOrder, newButtonName)
    game.ScreenData.MetaUpgradeCardUpgradeLayout.ComponentData.ActionBar.Children.FlipCardButton=newButtonData
end