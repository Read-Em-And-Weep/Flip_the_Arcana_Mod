---@meta _
-- grabbing our dependencies,
-- these funky (---@) comments are just there
--	 to help VS Code find the definitions of things

---@diagnostic disable-next-line: undefined-global
local mods = rom.mods

---@diagnostic disable: lowercase-global
---@module 'SGG_Modding-ENVY-auto'
mods['SGG_Modding-ENVY'].auto()

---@diagnostic disable-next-line: undefined-global
rom = rom
---@diagnostic disable-next-line: undefined-global
_PLUGIN = _PLUGIN

---@module 'SGG_Modding-Hades2GameDef-Globals'
game = rom.game

---@module 'SGG_Modding-SJSON'
sjson = mods['SGG_Modding-SJSON']

---@module 'SGG_Modding-ModUtil'
modutil = mods['SGG_Modding-ModUtil']

---@module 'SGG_Modding-Chalk'
chalk = mods["SGG_Modding-Chalk"]

---@module 'SGG_Modding-ReLoad'
reload = mods['SGG_Modding-ReLoad']

config = chalk.auto('config.lua')
public.config = config


Incantations = mods['BlueRaja-IncantationsAPI']

---@module 'game.import'
import_as_fallback(rom.game)

ExtendedAltar = mods['BlueRaja-ExtendedAltarOfAshesFixed']

local ZagreusJourney = mods['NikkelM-Zagreus_Journey']

local function on_ready()
	-- what to do when we are ready, but not re-do on reload.
	if config.enabled == false then return end
	
	mod = modutil.mod.Mod.Register(_PLUGIN.guid)
	
	import("ScreenText.en.sjson.lua")
	import("Items_General_VFX.sjson.lua")
	import("Gameplay.sjson.lua")
	import("ButtonPatching.lua")
	import("LootData.lua")
	import("WorldUpgradeData.lua")
	import("TraitData_MetaUpgrade.lua")
	import("TraitText.en.sjson.lua")
	import("HelpText.en.sjson.lua")
	import("ready.lua")
	if ZagreusJourney then
		import("ZagreusJourneyPatch.lua")
	else
		import("MetaUpgradeData.lua")
	end
	if ExtendedAltar then
		import("ExtendedAltarPatch.lua")
	end
end

local function on_reload()
	-- what to do when we are ready, but also again on every reload.
	-- only do things that are safe to run over and over.
	
	import("reload.lua")
end

-- this allows us to limit certain functions to not be reloaded.
local loader = reload.auto_single()

-- this runs only when modutil and the game's lua is ready
modutil.once_loaded.game(function()
	loader.load(on_ready, on_reload)
end)
