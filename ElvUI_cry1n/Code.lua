--Don't worry about this
local addon, ns = ...
local Version = GetAddOnMetadata(addon, "Version")

--Cache Lua / WoW API
local format = string.format
local GetCVarBool = GetCVarBool
local ReloadUI = ReloadUI
local StopMusic = StopMusic

-- These are things we do not cache
-- GLOBALS: PluginInstallStepComplete, PluginInstallFrame

--Change this line and use a unique name for your plugin.
local MyPluginName = "ElvUI_cry1n"

--Create references to ElvUI internals
local E, L, V, P, G = unpack(ElvUI)

--Create reference to LibElvUIPlugin
local EP = LibStub("LibElvUIPlugin-1.0")

--Create a new ElvUI module so ElvUI can handle initialization when ready
local mod = E:NewModule(MyPluginName, "AceHook-3.0", "AceEvent-3.0", "AceTimer-3.0");

--This function will hold your layout settings
local function SetupLayout(layout)
	--[[
	--	PUT YOUR EXPORTED PROFILE/SETTINGS BELOW HERE
	--]]

	--LAYOUT GOES HERE
	E.db["actionbar"]["bar1"]["backdropSpacing"] = 4
E.db["actionbar"]["bar1"]["buttonSize"] = 29
E.db["actionbar"]["bar1"]["buttonSpacing"] = 4
E.db["actionbar"]["bar2"]["buttonSize"] = 29
E.db["actionbar"]["bar2"]["buttonSpacing"] = 4
E.db["actionbar"]["bar2"]["enabled"] = true
E.db["actionbar"]["bar2"]["heightMult"] = 2
E.db["actionbar"]["bar2"]["visibility"] = "[petbattle] hide; show"
E.db["actionbar"]["bar3"]["backdrop"] = true
E.db["actionbar"]["bar3"]["backdropSpacing"] = 4
E.db["actionbar"]["bar3"]["buttonSize"] = 29
E.db["actionbar"]["bar3"]["buttonSpacing"] = 4
E.db["actionbar"]["bar3"]["buttons"] = 10
E.db["actionbar"]["bar3"]["buttonsPerRow"] = 5
E.db["actionbar"]["bar3"]["showGrid"] = false
E.db["actionbar"]["bar3"]["visibility"] = "[petbattle] hide; show"
E.db["actionbar"]["bar4"]["buttonSize"] = 24
E.db["actionbar"]["bar4"]["buttons"] = 2
E.db["actionbar"]["bar4"]["visibility"] = "[petbattle] hide; show"
E.db["actionbar"]["bar5"]["backdrop"] = true
E.db["actionbar"]["bar5"]["backdropSpacing"] = 4
E.db["actionbar"]["bar5"]["buttonSize"] = 29
E.db["actionbar"]["bar5"]["buttonSpacing"] = 4
E.db["actionbar"]["bar5"]["buttons"] = 10
E.db["actionbar"]["bar5"]["buttonsPerRow"] = 5
E.db["actionbar"]["bar5"]["showGrid"] = false
E.db["actionbar"]["bar5"]["visibility"] = "[petbattle] hide; show"
E.db["actionbar"]["bar6"]["backdrop"] = true
E.db["actionbar"]["bar6"]["buttonSize"] = 24
E.db["actionbar"]["bar6"]["buttons"] = 2
E.db["actionbar"]["bar6"]["buttonsPerRow"] = 1
E.db["actionbar"]["bar6"]["enabled"] = true
E.db["actionbar"]["bar6"]["visibility"] = "[petbattle] hide; show"
E.db["actionbar"]["bar7"]["buttonSpacing"] = 0
E.db["actionbar"]["bar7"]["buttons"] = 1
E.db["actionbar"]["bar7"]["buttonsPerRow"] = 1
E.db["actionbar"]["bar8"]["buttonSpacing"] = 0
E.db["actionbar"]["bar8"]["buttons"] = 1
E.db["actionbar"]["bar8"]["buttonsPerRow"] = 1
E.db["actionbar"]["barPet"]["backdrop"] = false
E.db["actionbar"]["barPet"]["backdropSpacing"] = 4
E.db["actionbar"]["barPet"]["buttonSize"] = 19
E.db["actionbar"]["barPet"]["buttonSpacing"] = 6
E.db["actionbar"]["barPet"]["buttonsPerRow"] = 10
E.db["actionbar"]["barPet"]["point"] = "TOPLEFT"
E.db["actionbar"]["font"] = "Bui Visitor1"
E.db["actionbar"]["fontOutline"] = "MONOCROMEOUTLINE"
E.db["actionbar"]["stanceBar"]["buttonSize"] = 26
E.db["actionbar"]["stanceBar"]["buttonsPerRow"] = 2
E.db["actionbar"]["stanceBar"]["enabled"] = false
E.db["actionbar"]["transparent"] = true
E.db["auras"]["buffs"]["horizontalSpacing"] = 3
E.db["auras"]["buffs"]["size"] = 30
E.db["auras"]["debuffs"]["size"] = 30
E.db["bags"]["bagSize"] = 32
E.db["bags"]["bagWidth"] = 412
E.db["bags"]["bankSize"] = 32
E.db["bags"]["bankWidth"] = 412
E.db["bags"]["countFont"] = "Expressway"
E.db["bags"]["countFontOutline"] = "OUTLINE"
E.db["bags"]["itemLevelFont"] = "Expressway"
E.db["bags"]["itemLevelFontOutline"] = "OUTLINE"
E.db["bags"]["scrapIcon"] = true
E.db["bags"]["sortInverted"] = false
E.db["bags"]["transparent"] = true
E.db["bags"]["vendorGrays"]["enable"] = true
E.db["benikui"]["actionbars"]["style"]["bar2"] = false
E.db["benikui"]["actionbars"]["style"]["bar3"] = false
E.db["benikui"]["actionbars"]["style"]["bar4"] = false
E.db["benikui"]["actionbars"]["style"]["bar5"] = false
E.db["benikui"]["actionbars"]["style"]["bar6"] = false
E.db["benikui"]["actionbars"]["style"]["petbar"] = false
E.db["benikui"]["colors"]["abAlpha"] = 0.7
E.db["benikui"]["colors"]["styleAlpha"] = 0.7
E.db["benikui"]["general"]["loginMessage"] = false
E.db["benikui"]["general"]["splashScreen"] = false
E.db["benikui"]["misc"]["ilevel"]["enable"] = false
E.db["benikui"]["misc"]["ilevel"]["font"] = "Expressway"
E.db["benikui"]["misc"]["ilevel"]["fontsize"] = 12
E.db["benikui"]["misc"]["ilevel"]["position"] = "OUTSIDE"
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["clickThrough"] = false
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["combatHide"] = true
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["enable"] = false
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["height"] = 1
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["petHide"] = true
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["point"] = "CENTER"
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["shadow"] = false
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["strata"] = "LOW"
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["style"] = true
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["title"]["enable"] = false
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["title"]["font"] = "Expressway"
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["title"]["fontColor"]["b"] = 0.9
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["title"]["fontColor"]["g"] = 0.9
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["title"]["fontColor"]["r"] = 0.9
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["title"]["fontflags"] = "NONE"
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["title"]["fontsize"] = 11
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["title"]["height"] = 26
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["title"]["panelColor"]["a"] = 0.7
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["title"]["panelColor"]["b"] = 0
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["title"]["panelColor"]["g"] = 0.7
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["title"]["panelColor"]["r"] = 0.9
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["title"]["panelTexture"] = "BuiMelli"
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["title"]["position"] = "TOP"
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["title"]["text"] = "Title"
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["title"]["textPosition"] = "CENTER"
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["title"]["textXoffset"] = 0
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["title"]["textYoffset"] = 0
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["title"]["useDTfont"] = true
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["tooltip"] = true
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["transparency"] = true
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["vehicleHide"] = true
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["visibility"] = ""
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons"]["width"] = 766
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["clickThrough"] = false
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["combatHide"] = false
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["enable"] = true
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["height"] = 22
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["petHide"] = false
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["point"] = "CENTER"
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["shadow"] = true
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["strata"] = "LOW"
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["style"] = true
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["stylePosition"] = "BOTTOM"
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["title"]["enable"] = false
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["title"]["font"] = "Expressway"
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["title"]["fontColor"]["b"] = 0.9
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["title"]["fontColor"]["g"] = 0.9
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["title"]["fontColor"]["r"] = 0.9
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["title"]["fontflags"] = "NONE"
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["title"]["fontsize"] = 11
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["title"]["height"] = 26
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["title"]["panelColor"]["a"] = 0.7
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["title"]["panelColor"]["b"] = 0
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["title"]["panelColor"]["g"] = 0.7
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["title"]["panelColor"]["r"] = 0.9
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["title"]["panelTexture"] = "BuiMelli"
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["title"]["position"] = "TOP"
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["title"]["text"] = "Title"
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["title"]["textPosition"] = "CENTER"
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["title"]["textXoffset"] = 0
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["title"]["textYoffset"] = 0
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["title"]["useDTfont"] = true
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["tooltip"] = true
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["transparency"] = true
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["vehicleHide"] = false
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["visibility"] = ""
E.db["benikui"]["panels"]["BenikUI_Bottom Buttons New"]["width"] = 766
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["clickThrough"] = false
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["combatHide"] = false
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["enable"] = false
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["height"] = 1
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["petHide"] = true
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["point"] = "CENTER"
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["shadow"] = true
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["strata"] = "LOW"
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["style"] = true
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["title"]["enable"] = false
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["title"]["font"] = "Expressway"
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["title"]["fontColor"]["b"] = 0.9
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["title"]["fontColor"]["g"] = 0.9
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["title"]["fontColor"]["r"] = 0.9
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["title"]["fontflags"] = "NONE"
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["title"]["fontsize"] = 11
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["title"]["height"] = 26
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["title"]["panelColor"]["a"] = 0.7
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["title"]["panelColor"]["b"] = 0
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["title"]["panelColor"]["g"] = 0.7
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["title"]["panelColor"]["r"] = 0.9
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["title"]["panelTexture"] = "BuiMelli"
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["title"]["position"] = "TOP"
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["title"]["text"] = "Title"
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["title"]["textPosition"] = "CENTER"
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["title"]["textXoffset"] = 0
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["title"]["textYoffset"] = 0
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["title"]["useDTfont"] = true
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["tooltip"] = true
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["transparency"] = true
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["vehicleHide"] = true
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["visibility"] = ""
E.db["benikui"]["panels"]["BenikUI_Bottom Left Buttons"]["width"] = 27
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["clickThrough"] = false
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["combatHide"] = false
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["enable"] = false
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["height"] = 1
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["petHide"] = true
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["point"] = "CENTER"
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["shadow"] = true
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["strata"] = "LOW"
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["style"] = true
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["title"]["enable"] = false
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["title"]["font"] = "Expressway"
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["title"]["fontColor"]["b"] = 0.9
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["title"]["fontColor"]["g"] = 0.9
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["title"]["fontColor"]["r"] = 0.9
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["title"]["fontflags"] = "NONE"
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["title"]["fontsize"] = 11
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["title"]["height"] = 26
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["title"]["panelColor"]["a"] = 0.7
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["title"]["panelColor"]["b"] = 0
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["title"]["panelColor"]["g"] = 0.7
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["title"]["panelColor"]["r"] = 0.9
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["title"]["panelTexture"] = "BuiMelli"
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["title"]["position"] = "TOP"
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["title"]["text"] = "Title"
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["title"]["textPosition"] = "CENTER"
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["title"]["textXoffset"] = 0
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["title"]["textYoffset"] = 0
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["title"]["useDTfont"] = true
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["tooltip"] = true
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["transparency"] = true
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["vehicleHide"] = true
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["visibility"] = ""
E.db["benikui"]["panels"]["BenikUI_Bottom Right Buttons"]["width"] = 27
E.db["benikui"]["panels"]["BenikUI_Button Background"]["clickThrough"] = false
E.db["benikui"]["panels"]["BenikUI_Button Background"]["combatHide"] = false
E.db["benikui"]["panels"]["BenikUI_Button Background"]["enable"] = false
E.db["benikui"]["panels"]["BenikUI_Button Background"]["height"] = 72
E.db["benikui"]["panels"]["BenikUI_Button Background"]["petHide"] = true
E.db["benikui"]["panels"]["BenikUI_Button Background"]["point"] = "CENTER"
E.db["benikui"]["panels"]["BenikUI_Button Background"]["shadow"] = false
E.db["benikui"]["panels"]["BenikUI_Button Background"]["strata"] = "LOW"
E.db["benikui"]["panels"]["BenikUI_Button Background"]["style"] = false
E.db["benikui"]["panels"]["BenikUI_Button Background"]["title"]["enable"] = false
E.db["benikui"]["panels"]["BenikUI_Button Background"]["title"]["font"] = "Expressway"
E.db["benikui"]["panels"]["BenikUI_Button Background"]["title"]["fontColor"]["b"] = 0.9
E.db["benikui"]["panels"]["BenikUI_Button Background"]["title"]["fontColor"]["g"] = 0.9
E.db["benikui"]["panels"]["BenikUI_Button Background"]["title"]["fontColor"]["r"] = 0.9
E.db["benikui"]["panels"]["BenikUI_Button Background"]["title"]["fontflags"] = "NONE"
E.db["benikui"]["panels"]["BenikUI_Button Background"]["title"]["fontsize"] = 11
E.db["benikui"]["panels"]["BenikUI_Button Background"]["title"]["height"] = 26
E.db["benikui"]["panels"]["BenikUI_Button Background"]["title"]["panelColor"]["a"] = 0.7
E.db["benikui"]["panels"]["BenikUI_Button Background"]["title"]["panelColor"]["b"] = 0
E.db["benikui"]["panels"]["BenikUI_Button Background"]["title"]["panelColor"]["g"] = 0.7
E.db["benikui"]["panels"]["BenikUI_Button Background"]["title"]["panelColor"]["r"] = 0.9
E.db["benikui"]["panels"]["BenikUI_Button Background"]["title"]["panelTexture"] = "BuiMelli"
E.db["benikui"]["panels"]["BenikUI_Button Background"]["title"]["position"] = "TOP"
E.db["benikui"]["panels"]["BenikUI_Button Background"]["title"]["text"] = "Title"
E.db["benikui"]["panels"]["BenikUI_Button Background"]["title"]["textPosition"] = "CENTER"
E.db["benikui"]["panels"]["BenikUI_Button Background"]["title"]["textXoffset"] = 0
E.db["benikui"]["panels"]["BenikUI_Button Background"]["title"]["textYoffset"] = 0
E.db["benikui"]["panels"]["BenikUI_Button Background"]["title"]["useDTfont"] = true
E.db["benikui"]["panels"]["BenikUI_Button Background"]["tooltip"] = false
E.db["benikui"]["panels"]["BenikUI_Button Background"]["transparency"] = true
E.db["benikui"]["panels"]["BenikUI_Button Background"]["vehicleHide"] = true
E.db["benikui"]["panels"]["BenikUI_Button Background"]["visibility"] = ""
E.db["benikui"]["panels"]["BenikUI_Button Background"]["width"] = 750
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["clickThrough"] = true
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["combatHide"] = false
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["enable"] = true
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["height"] = 17
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["petHide"] = false
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["point"] = "CENTER"
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["shadow"] = true
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["strata"] = "LOW"
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["style"] = true
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["stylePosition"] = "TOP"
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["title"]["enable"] = false
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["title"]["font"] = "Expressway"
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["title"]["fontColor"]["b"] = 0.9
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["title"]["fontColor"]["g"] = 0.9
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["title"]["fontColor"]["r"] = 0.9
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["title"]["fontflags"] = "OUTLINE"
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["title"]["fontsize"] = 11
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["title"]["height"] = 26
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["title"]["panelColor"]["a"] = 0.7
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["title"]["panelColor"]["b"] = 0
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["title"]["panelColor"]["g"] = 0.7
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["title"]["panelColor"]["r"] = 0.9
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["title"]["panelTexture"] = "BuiMelli"
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["title"]["position"] = "TOP"
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["title"]["text"] = "Title"
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["title"]["textPosition"] = "CENTER"
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["title"]["textXoffset"] = 0
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["title"]["textYoffset"] = 0
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["title"]["useDTfont"] = true
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["tooltip"] = true
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["transparency"] = true
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["vehicleHide"] = false
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["visibility"] = ""
E.db["benikui"]["panels"]["BenikUI_LocationPlus Backdrop"]["width"] = 766
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["clickThrough"] = false
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["combatHide"] = true
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["enable"] = false
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["height"] = 200
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["petHide"] = true
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["point"] = "CENTER"
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["shadow"] = true
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["strata"] = "LOW"
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["style"] = false
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["stylePosition"] = "TOP"
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["title"]["enable"] = true
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["title"]["font"] = "Expressway"
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["title"]["fontColor"]["b"] = 0.9
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["title"]["fontColor"]["g"] = 0.9
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["title"]["fontColor"]["r"] = 0.9
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["title"]["fontflags"] = "NONE"
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["title"]["fontsize"] = 11
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["title"]["height"] = 26
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["title"]["panelColor"]["a"] = 0.7
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["title"]["panelColor"]["b"] = 0
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["title"]["panelColor"]["g"] = 0.7
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["title"]["panelColor"]["r"] = 0.9
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["title"]["panelTexture"] = "BuiMelli"
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["title"]["position"] = "TOP"
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["title"]["text"] = "Title"
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["title"]["textPosition"] = "CENTER"
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["title"]["textXoffset"] = 0
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["title"]["textYoffset"] = 0
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["title"]["useDTfont"] = true
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["tooltip"] = true
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["transparency"] = true
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["vehicleHide"] = true
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["visibility"] = ""
E.db["benikui"]["panels"]["BenikUI_MythicPlusTimer"]["width"] = 200
E.db["benikui"]["unitframes"]["player"]["portraitHeight"] = 47
E.db["benikui"]["unitframes"]["target"]["getPlayerPortraitSize"] = false
E.db["benikui"]["unitframes"]["target"]["portraitHeight"] = 47
E.db["benikui"]["unitframes"]["textures"]["castbar"] = "Bui-pHish3Shadow"
E.db["benikuiDatabars"]["azerite"]["buttonStyle"] = "DEFAULT"
E.db["benikuiDatabars"]["azerite"]["notifiers"]["enable"] = false
E.db["benikuiDatabars"]["azerite"]["notifiers"]["position"] = "RIGHT"
E.db["benikuiDatabars"]["experience"]["buiStyle"] = false
E.db["benikuiDatabars"]["experience"]["notifiers"]["enable"] = false
E.db["benikuiDatabars"]["honor"]["notifiers"]["position"] = "LEFT"
E.db["benikuiDatabars"]["reputation"]["buttonStyle"] = "DEFAULT"
E.db["benikuiDatabars"]["reputation"]["notifiers"]["enable"] = false
E.db["benikuiSkins"]["elvuiAddons"]["locplus"] = false
E.db["benikuiSkins"]["elvuiAddons"]["pa"] = false
E.db["benikuiSkins"]["variousSkins"]["kt"] = false
E.db["chat"]["fade"] = false
E.db["chat"]["font"] = "Expressway"
E.db["chat"]["panelColor"]["a"] = 0.75
E.db["chat"]["panelColor"]["b"] = 0.054901960784314
E.db["chat"]["panelColor"]["g"] = 0.054901960784314
E.db["chat"]["panelColor"]["r"] = 0.054901960784314
E.db["chat"]["panelHeight"] = 150
E.db["chat"]["panelTabTransparency"] = true
E.db["chat"]["tabFont"] = "Expressway"
E.db["chat"]["tabFontOutline"] = "OUTLINE"
E.db["chat"]["tabFontSize"] = 11
E.db["chat"]["timeStampFormat"] = "%H:%M "
E.db["cooldown"]["enable"] = false
E.db["dashboards"]["professions"]["combat"] = false
E.db["dashboards"]["professions"]["style"] = false
E.db["dashboards"]["reputations"]["combat"] = false
E.db["dashboards"]["reputations"]["style"] = false
E.db["dashboards"]["reputations"]["width"] = 150
E.db["dashboards"]["system"]["style"] = false
E.db["dashboards"]["tokens"]["combat"] = false
E.db["dashboards"]["tokens"]["style"] = false
E.db["dashboards"]["tokens"]["zeroamount"] = true
E.db["databars"]["azerite"]["enable"] = false
E.db["databars"]["azerite"]["height"] = 150
E.db["databars"]["azerite"]["orientation"] = "VERTICAL"
E.db["databars"]["azerite"]["width"] = 8
E.db["databars"]["experience"]["font"] = "Expressway"
E.db["databars"]["experience"]["fontSize"] = 11
E.db["databars"]["experience"]["height"] = 6
E.db["databars"]["experience"]["showLevel"] = true
E.db["databars"]["experience"]["textFormat"] = "CURPERC"
E.db["databars"]["experience"]["textYoffset"] = -14
E.db["databars"]["experience"]["width"] = 766
E.db["databars"]["honor"]["enable"] = false
E.db["databars"]["honor"]["height"] = 152
E.db["databars"]["honor"]["orientation"] = "VERTICAL"
E.db["databars"]["honor"]["width"] = 8
E.db["databars"]["reputation"]["enable"] = true
E.db["databars"]["reputation"]["fontSize"] = 30
E.db["databars"]["reputation"]["height"] = 150
E.db["databars"]["reputation"]["orientation"] = "VERTICAL"
E.db["databars"]["reputation"]["width"] = 8
E.db["datatexts"]["font"] = "Expressway"
E.db["datatexts"]["fontSize"] = 11
E.db["datatexts"]["panels"]["BuiMiddleDTPanel"][4] = "Item Level"
E.db["datatexts"]["panels"]["BuiMiddleDTPanel"]["enable"] = true
E.db["datatexts"]["panels"]["BuiRightChatDTPanel"][2] = "Bags"
E.db["datatexts"]["panels"]["BuiRightChatDTPanel"][3] = "Gold"
E.db["datatexts"]["panels"]["LeftChatDataPanel"][3] = "Quick Join"
E.db["datatexts"]["panels"]["LeftChatDataPanel"]["enable"] = false
E.db["datatexts"]["panels"]["LocPlusLeftDT"][1] = "Date"
E.db["datatexts"]["panels"]["RightChatDataPanel"]["enable"] = false
E.db["general"]["altPowerBar"]["font"] = "Expressway"
E.db["general"]["altPowerBar"]["fontSize"] = 11
E.db["general"]["altPowerBar"]["statusBar"] = "BuiFlat"
E.db["general"]["autoRepair"] = "PLAYER"
E.db["general"]["backdropcolor"]["b"] = 0.025
E.db["general"]["backdropcolor"]["g"] = 0.025
E.db["general"]["backdropcolor"]["r"] = 0.025
E.db["general"]["backdropfadecolor"]["a"] = 0.75
E.db["general"]["backdropfadecolor"]["b"] = 0.054
E.db["general"]["backdropfadecolor"]["g"] = 0.054
E.db["general"]["backdropfadecolor"]["r"] = 0.054
E.db["general"]["bonusObjectivePosition"] = "AUTO"
E.db["general"]["bottomPanel"] = false
E.db["general"]["decimalLength"] = 2
E.db["general"]["font"] = "Expressway"
E.db["general"]["fontSize"] = 11
E.db["general"]["fontStyle"] = "NONE"
E.db["general"]["itemLevel"]["itemLevelFont"] = "Expressway"
E.db["general"]["minimap"]["benikuiStyle"] = false
E.db["general"]["minimap"]["locationText"] = "HIDE"
E.db["general"]["minimap"]["size"] = 150
E.db["general"]["objectiveFrameHeight"] = 750
E.db["general"]["talkingHeadFrameScale"] = 1
E.db["general"]["totems"]["growthDirection"] = "HORIZONTAL"
E.db["general"]["totems"]["size"] = 50
E.db["general"]["totems"]["spacing"] = 8
E.db["general"]["valuecolor"]["b"] = 0.039215601980686
E.db["general"]["valuecolor"]["g"] = 0.48627343773842
E.db["general"]["valuecolor"]["r"] = 0.99999779462814
E.db["layoutSetting"] = "dpsCaster"
E.db["locplus"]["LoginMsg"] = false
E.db["locplus"]["displayOther"] = "NONE"
E.db["locplus"]["dtheight"] = 18
E.db["locplus"]["dtwidth"] = 175
E.db["locplus"]["lpauto"] = false
E.db["locplus"]["lpfontsize"] = 11
E.db["locplus"]["lpwidth"] = 300
E.db["locplus"]["noback"] = false
E.db["locplus"]["trunc"] = true
E.db["movers"]["AlertFrameMover"] = "TOP,ElvUIParent,TOP,0,-140"
E.db["movers"]["AltPowerBarMover"] = "TOP,ElvUIParent,TOP,0,-66"
E.db["movers"]["ArenaHeaderMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-56,346"
E.db["movers"]["AzeriteBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,415,22"
E.db["movers"]["BNETMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-156,-200"
E.db["movers"]["BelowMinimapContainerMover"] = "TOP,ElvUIParent,TOP,0,-192"
E.db["movers"]["BenikUI_Bottom Buttons New_Mover"] = "BOTTOM,ElvUIParent,BOTTOM,0,30"
E.db["movers"]["BenikUI_Bottom Buttons_Mover"] = "BOTTOM,ElvUIParent,BOTTOM,0,32"
E.db["movers"]["BenikUI_Bottom Left Buttons_Mover"] = "BOTTOM,ElvUIParent,BOTTOM,-400,64"
E.db["movers"]["BenikUI_Bottom Right Buttons_Mover"] = "BOTTOM,ElvUIParent,BOTTOM,400,67"
E.db["movers"]["BenikUI_Button Background_Mover"] = "BOTTOM,ElvUIParent,BOTTOM,0,60"
E.db["movers"]["BenikUI_LocationPlus Backdrop_Mover"] = "BOTTOM,ElvUIParent,BOTTOM,0,140"
E.db["movers"]["BigButtonsFarmBar"] = "TOP,UIParent,TOP,0,-250"
E.db["movers"]["BigButtonsSeedBarMover"] = "TOP,UIParent,TOP,0,-300"
E.db["movers"]["BossButton"] = "BOTTOM,ElvUIParent,BOTTOM,-249,324"
E.db["movers"]["BossHeaderMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-321,-360"
E.db["movers"]["BuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-181,-3"
E.db["movers"]["BuiDashboardMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-8"
E.db["movers"]["BuiMiddleDtMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,2"
E.db["movers"]["ClassBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,360"
E.db["movers"]["DTPanelBuiMiddleDTPanelMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,33"
E.db["movers"]["DebuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-181,-128"
E.db["movers"]["DigSiteProgressBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,315"
E.db["movers"]["DurabilityFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-201,-310"
E.db["movers"]["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,0,99"
E.db["movers"]["ElvAB_10"] = "BOTTOM,ElvUI_Bar1,TOP,0,202"
E.db["movers"]["ElvAB_2"] = "BOTTOM,ElvUIParent,BOTTOM,0,64"
E.db["movers"]["ElvAB_3"] = "BOTTOM,ElvUIParent,BOTTOM,290,61"
E.db["movers"]["ElvAB_4"] = "BOTTOM,ElvUIParent,BOTTOM,-400,70"
E.db["movers"]["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,-290,61"
E.db["movers"]["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,400,70"
E.db["movers"]["ElvAB_7"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,823,81"
E.db["movers"]["ElvAB_8"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-824,81"
E.db["movers"]["ElvAB_9"] = "BOTTOM,ElvUI_Bar1,TOP,0,162"
E.db["movers"]["ElvNP_PlayerMover"] = "TOP,UIParent,CENTER,0,-150"
E.db["movers"]["ElvUF_AssistMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,224,-369"
E.db["movers"]["ElvUF_BodyGuardMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,444"
E.db["movers"]["ElvUF_FocusCastbarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-518,223"
E.db["movers"]["ElvUF_FocusMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,802,273"
E.db["movers"]["ElvUF_FocusTargetMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,802,217"
E.db["movers"]["ElvUF_PartyMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,233"
E.db["movers"]["ElvUF_PetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,232"
E.db["movers"]["ElvUF_PetMover"] = "BOTTOM,ElvUIParent,BOTTOM,-332,408"
E.db["movers"]["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-231,147"
E.db["movers"]["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-332,482"
E.db["movers"]["ElvUF_Raid40Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,372,233"
E.db["movers"]["ElvUF_RaidMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,311,233"
E.db["movers"]["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,636"
E.db["movers"]["ElvUF_TankMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,224,-304"
E.db["movers"]["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,231,147"
E.db["movers"]["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,334,482"
E.db["movers"]["ElvUF_TargetTargetMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-678,510"
E.db["movers"]["ElvUIBagMover"] = "BOTTOMRIGHT,RightChatPanel,BOTTOMRIGHT,0,26"
E.db["movers"]["ElvUIBankMover"] = "BOTTOMLEFT,LeftChatPanel,BOTTOMLEFT,0,26"
E.db["movers"]["ExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,21"
E.db["movers"]["GMMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,158,-38"
E.db["movers"]["HonorBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-157,-6"
E.db["movers"]["LeftChatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,2,22"
E.db["movers"]["LevelUpBossBannerMover"] = "TOP,ElvUIParent,TOP,-1,-120"
E.db["movers"]["LocationMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,140"
E.db["movers"]["LootFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,418,-186"
E.db["movers"]["LossControlMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,640,581"
E.db["movers"]["MicrobarMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,158,-5"
E.db["movers"]["MinimapMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-6"
E.db["movers"]["MirrorTimer1Mover"] = "TOP,ElvUIParent,TOP,-1,-96"
E.db["movers"]["MirrorTimer2Mover"] = "TOP,MirrorTimer1,BOTTOM,0,0"
E.db["movers"]["MirrorTimer3Mover"] = "TOP,MirrorTimer2,BOTTOM,0,0"
E.db["movers"]["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-210,-176"
E.db["movers"]["OzCooldownsMover"] = "BOTTOM,UIParent,BOTTOM,0,360"
E.db["movers"]["PetAB"] = "BOTTOM,ElvUIParent,BOTTOM,-332,456"
E.db["movers"]["PlayerNameplate"] = "BOTTOM,ElvUIParent,BOTTOM,0,359"
E.db["movers"]["PlayerPortraitMover"] = "BOTTOM,ElvUIParent,BOTTOM,-365,163"
E.db["movers"]["PlayerPowerBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,348"
E.db["movers"]["ProfessionsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-5,-184"
E.db["movers"]["ReputationBarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-415,22"
E.db["movers"]["RequestStopButton"] = "TOP,ElvUIParent,TOP,0,-150"
E.db["movers"]["RightChatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,22"
E.db["movers"]["ShiftAB"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,840,67"
E.db["movers"]["SocialMenuMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-187"
E.db["movers"]["SquareMinimapButtonBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-276"
E.db["movers"]["TalkingHeadFrameMover"] = "TOP,ElvUIParent,TOP,0,-128"
E.db["movers"]["TargetPortraitMover"] = "BOTTOM,ElvUIParent,BOTTOM,365,163"
E.db["movers"]["TargetPowerBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,231,215"
E.db["movers"]["TooltipMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,176"
E.db["movers"]["TopCenterContainerMover"] = "TOP,ElvUIParent,TOP,0,-34"
E.db["movers"]["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,551,165"
E.db["movers"]["VOICECHAT"] = "TOPLEFT,ElvUIParent,TOPLEFT,368,-210"
E.db["movers"]["VehicleLeaveButton"] = "BOTTOM,ElvUIParent,BOTTOM,0,315"
E.db["movers"]["VehicleSeatMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,155,-81"
E.db["movers"]["WatchFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-122,-292"
E.db["movers"]["ZoneAbility"] = "BOTTOM,ElvUIParent,BOTTOM,-307,324"
E.db["movers"]["reputationHolderMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-280"
E.db["movers"]["tokenHolderMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-123"
E.db["nameplates"]["statusbar"] = "Bui-pHish3Shadow"
E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["countFont"] = "Expressway"
E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["font"] = "Expressway"
E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["size"] = 24
E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["font"] = "Expressway"
E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["fontSize"] = 9
E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["iconOffsetY"] = -1
E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["iconSize"] = 21
E.db["nameplates"]["units"]["ENEMY_NPC"]["debuffs"]["countFont"] = "Expressway"
E.db["nameplates"]["units"]["ENEMY_NPC"]["debuffs"]["font"] = "Expressway"
E.db["nameplates"]["units"]["ENEMY_NPC"]["debuffs"]["size"] = 24
E.db["nameplates"]["units"]["ENEMY_NPC"]["health"]["text"]["font"] = "Expressway"
E.db["nameplates"]["units"]["ENEMY_NPC"]["health"]["text"]["fontSize"] = 9
E.db["nameplates"]["units"]["ENEMY_NPC"]["level"]["font"] = "Expressway"
E.db["nameplates"]["units"]["ENEMY_NPC"]["level"]["fontSize"] = 9
E.db["nameplates"]["units"]["ENEMY_NPC"]["name"]["font"] = "Expressway"
E.db["nameplates"]["units"]["ENEMY_NPC"]["power"]["text"]["font"] = "Expressway"
E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["countFont"] = "Expressway"
E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["font"] = "Expressway"
E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["maxDuration"] = 0
E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["priority"] = "Blacklist,RaidBuffsElvUI,Dispellable,blockNoDuration,PlayerBuffs,TurtleBuffs,CastByUnit"
E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["size"] = 24
E.db["nameplates"]["units"]["ENEMY_PLAYER"]["castbar"]["font"] = "Expressway"
E.db["nameplates"]["units"]["ENEMY_PLAYER"]["castbar"]["fontSize"] = 9
E.db["nameplates"]["units"]["ENEMY_PLAYER"]["castbar"]["iconOffsetY"] = -1
E.db["nameplates"]["units"]["ENEMY_PLAYER"]["castbar"]["iconSize"] = 21
E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["countFont"] = "Expressway"
E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["font"] = "Expressway"
E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["priority"] = "Blacklist,Personal,CCDebuffs"
E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["size"] = 24
E.db["nameplates"]["units"]["ENEMY_PLAYER"]["health"]["text"]["font"] = "Expressway"
E.db["nameplates"]["units"]["ENEMY_PLAYER"]["health"]["text"]["fontSize"] = 9
E.db["nameplates"]["units"]["ENEMY_PLAYER"]["level"]["font"] = "Expressway"
E.db["nameplates"]["units"]["ENEMY_PLAYER"]["level"]["fontSize"] = 9
E.db["nameplates"]["units"]["ENEMY_PLAYER"]["level"]["format"] = "[difficultycolor][level][shortclassification]"
E.db["nameplates"]["units"]["ENEMY_PLAYER"]["name"]["font"] = "Expressway"
E.db["nameplates"]["units"]["ENEMY_PLAYER"]["name"]["format"] = "[name]"
E.db["nameplates"]["units"]["ENEMY_PLAYER"]["power"]["text"]["font"] = "Expressway"
E.db["nameplates"]["units"]["ENEMY_PLAYER"]["title"]["format"] = "[npctitle]"
E.db["nameplates"]["units"]["FRIENDLY_NPC"]["buffs"]["countFont"] = "Expressway"
E.db["nameplates"]["units"]["FRIENDLY_NPC"]["buffs"]["font"] = "Expressway"
E.db["nameplates"]["units"]["FRIENDLY_NPC"]["buffs"]["priority"] = "Blacklist,RaidBuffsElvUI,Dispellable,blockNoDuration,PlayerBuffs,TurtleBuffs,CastByUnit"
E.db["nameplates"]["units"]["FRIENDLY_NPC"]["buffs"]["size"] = 24
E.db["nameplates"]["units"]["FRIENDLY_NPC"]["castbar"]["font"] = "Expressway"
E.db["nameplates"]["units"]["FRIENDLY_NPC"]["castbar"]["fontSize"] = 9
E.db["nameplates"]["units"]["FRIENDLY_NPC"]["castbar"]["iconOffsetY"] = -1
E.db["nameplates"]["units"]["FRIENDLY_NPC"]["castbar"]["iconSize"] = 21
E.db["nameplates"]["units"]["FRIENDLY_NPC"]["debuffs"]["countFont"] = "Expressway"
E.db["nameplates"]["units"]["FRIENDLY_NPC"]["debuffs"]["font"] = "Expressway"
E.db["nameplates"]["units"]["FRIENDLY_NPC"]["debuffs"]["priority"] = "Blacklist,Personal,CCDebuffs"
E.db["nameplates"]["units"]["FRIENDLY_NPC"]["debuffs"]["size"] = 24
E.db["nameplates"]["units"]["FRIENDLY_NPC"]["health"]["text"]["font"] = "Expressway"
E.db["nameplates"]["units"]["FRIENDLY_NPC"]["health"]["text"]["fontSize"] = 9
E.db["nameplates"]["units"]["FRIENDLY_NPC"]["level"]["font"] = "Expressway"
E.db["nameplates"]["units"]["FRIENDLY_NPC"]["level"]["fontSize"] = 9
E.db["nameplates"]["units"]["FRIENDLY_NPC"]["name"]["font"] = "Expressway"
E.db["nameplates"]["units"]["FRIENDLY_NPC"]["name"]["format"] = "[name]"
E.db["nameplates"]["units"]["FRIENDLY_NPC"]["nameOnly"] = false
E.db["nameplates"]["units"]["FRIENDLY_NPC"]["power"]["text"]["font"] = "Expressway"
E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["buffs"]["countFont"] = "Expressway"
E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["buffs"]["font"] = "Expressway"
E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["buffs"]["priority"] = "Blacklist,RaidBuffsElvUI,Dispellable,blockNoDuration,PlayerBuffs,TurtleBuffs,CastByUnit"
E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["buffs"]["size"] = 24
E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["castbar"]["font"] = "Expressway"
E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["castbar"]["fontSize"] = 9
E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["castbar"]["iconOffsetY"] = -1
E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["castbar"]["iconSize"] = 21
E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["debuffs"]["countFont"] = "Expressway"
E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["debuffs"]["font"] = "Expressway"
E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["debuffs"]["priority"] = "Blacklist,Personal,CCDebuffs"
E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["debuffs"]["size"] = 24
E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["health"]["text"]["font"] = "Expressway"
E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["health"]["text"]["fontSize"] = 9
E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["level"]["font"] = "Expressway"
E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["level"]["fontSize"] = 9
E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["level"]["format"] = "[difficultycolor][level][shortclassification]"
E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["name"]["font"] = "Expressway"
E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["name"]["format"] = "[name]"
E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["power"]["text"]["font"] = "Expressway"
E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["title"]["format"] = "[npctitle]"
E.db["nameplates"]["units"]["PLAYER"]["buffs"]["countFont"] = "Expressway"
E.db["nameplates"]["units"]["PLAYER"]["buffs"]["font"] = "Expressway"
E.db["nameplates"]["units"]["PLAYER"]["buffs"]["maxDuration"] = 0
E.db["nameplates"]["units"]["PLAYER"]["buffs"]["priority"] = "Blacklist,RaidBuffsElvUI,Dispellable,blockNoDuration,PlayerBuffs,TurtleBuffs,CastByUnit"
E.db["nameplates"]["units"]["PLAYER"]["buffs"]["size"] = 24
E.db["nameplates"]["units"]["PLAYER"]["castbar"]["font"] = "Expressway"
E.db["nameplates"]["units"]["PLAYER"]["castbar"]["fontSize"] = 9
E.db["nameplates"]["units"]["PLAYER"]["castbar"]["iconOffsetY"] = -1
E.db["nameplates"]["units"]["PLAYER"]["castbar"]["iconSize"] = 21
E.db["nameplates"]["units"]["PLAYER"]["castbar"]["yOffset"] = -10
E.db["nameplates"]["units"]["PLAYER"]["debuffs"]["countFont"] = "Expressway"
E.db["nameplates"]["units"]["PLAYER"]["debuffs"]["font"] = "Expressway"
E.db["nameplates"]["units"]["PLAYER"]["debuffs"]["priority"] = "Blacklist,Personal,CCDebuffs"
E.db["nameplates"]["units"]["PLAYER"]["debuffs"]["size"] = 24
E.db["nameplates"]["units"]["PLAYER"]["health"]["text"]["font"] = "Expressway"
E.db["nameplates"]["units"]["PLAYER"]["health"]["text"]["fontSize"] = 9
E.db["nameplates"]["units"]["PLAYER"]["level"]["enable"] = true
E.db["nameplates"]["units"]["PLAYER"]["level"]["font"] = "Expressway"
E.db["nameplates"]["units"]["PLAYER"]["level"]["fontSize"] = 9
E.db["nameplates"]["units"]["PLAYER"]["level"]["format"] = "[difficultycolor][level][shortclassification]"
E.db["nameplates"]["units"]["PLAYER"]["name"]["enable"] = true
E.db["nameplates"]["units"]["PLAYER"]["name"]["font"] = "Expressway"
E.db["nameplates"]["units"]["PLAYER"]["power"]["enable"] = false
E.db["nameplates"]["units"]["PLAYER"]["power"]["text"]["font"] = "Expressway"
E.db["nameplates"]["units"]["PLAYER"]["title"]["format"] = "[npctitle]"
E.db["tooltip"]["font"] = "Expressway"
E.db["tooltip"]["headerFontSize"] = 11
E.db["tooltip"]["healthBar"]["font"] = "Expressway"
E.db["tooltip"]["healthBar"]["fontSize"] = 9
E.db["tooltip"]["healthBar"]["height"] = 6
E.db["tooltip"]["smallTextFontSize"] = 11
E.db["tooltip"]["textFontSize"] = 11
E.db["unitframe"]["colors"]["auraBarBuff"]["b"] = 0.1
E.db["unitframe"]["colors"]["auraBarBuff"]["g"] = 0.1
E.db["unitframe"]["colors"]["auraBarBuff"]["r"] = 0.1
E.db["unitframe"]["colors"]["castClassColor"] = true
E.db["unitframe"]["colors"]["castColor"]["b"] = 0.1
E.db["unitframe"]["colors"]["castColor"]["g"] = 0.1
E.db["unitframe"]["colors"]["castColor"]["r"] = 0.1
E.db["unitframe"]["colors"]["castReactionColor"] = true
E.db["unitframe"]["colors"]["colorhealthbyvalue"] = false
E.db["unitframe"]["colors"]["health"]["b"] = 0.1
E.db["unitframe"]["colors"]["health"]["g"] = 0.1
E.db["unitframe"]["colors"]["health"]["r"] = 0.1
E.db["unitframe"]["colors"]["health_backdrop_dead"]["b"] = 0.003921568627451
E.db["unitframe"]["colors"]["health_backdrop_dead"]["g"] = 0.003921568627451
E.db["unitframe"]["colors"]["health_backdrop_dead"]["r"] = 0.14901960784314
E.db["unitframe"]["colors"]["healthclass"] = true
E.db["unitframe"]["colors"]["power"]["MANA"]["b"] = 0
E.db["unitframe"]["colors"]["power"]["MANA"]["g"] = 0.5
E.db["unitframe"]["colors"]["power"]["MANA"]["r"] = 1
E.db["unitframe"]["colors"]["powerclass"] = true
E.db["unitframe"]["colors"]["transparentAurabars"] = true
E.db["unitframe"]["colors"]["transparentPower"] = true
E.db["unitframe"]["colors"]["useDeadBackdrop"] = true
E.db["unitframe"]["font"] = "Expressway"
E.db["unitframe"]["fontOutline"] = "OUTLINE"
E.db["unitframe"]["fontSize"] = 11
E.db["unitframe"]["smoothbars"] = true
E.db["unitframe"]["statusbar"] = "Bui-pHish3Shadow"
E.db["unitframe"]["units"]["arena"]["enable"] = false
E.db["unitframe"]["units"]["boss"]["buffs"]["anchorPoint"] = "CENTER"
E.db["unitframe"]["units"]["boss"]["buffs"]["attachTo"] = "HEALTH"
E.db["unitframe"]["units"]["boss"]["buffs"]["maxDuration"] = 300
E.db["unitframe"]["units"]["boss"]["buffs"]["sizeOverride"] = 27
E.db["unitframe"]["units"]["boss"]["buffs"]["xOffset"] = 16
E.db["unitframe"]["units"]["boss"]["buffs"]["yOffset"] = 0
E.db["unitframe"]["units"]["boss"]["castbar"]["iconAttached"] = false
E.db["unitframe"]["units"]["boss"]["castbar"]["iconPosition"] = "RIGHT"
E.db["unitframe"]["units"]["boss"]["castbar"]["iconXOffset"] = 2
E.db["unitframe"]["units"]["boss"]["castbar"]["width"] = 246
E.db["unitframe"]["units"]["boss"]["debuffs"]["maxDuration"] = 300
E.db["unitframe"]["units"]["boss"]["debuffs"]["sizeOverride"] = 24
E.db["unitframe"]["units"]["boss"]["debuffs"]["xOffset"] = -1
E.db["unitframe"]["units"]["boss"]["debuffs"]["yOffset"] = 12
E.db["unitframe"]["units"]["boss"]["height"] = 50
E.db["unitframe"]["units"]["boss"]["infoPanel"]["enable"] = true
E.db["unitframe"]["units"]["boss"]["infoPanel"]["height"] = 14
E.db["unitframe"]["units"]["boss"]["infoPanel"]["transparent"] = true
E.db["unitframe"]["units"]["boss"]["name"]["attachTextTo"] = "InfoPanel"
E.db["unitframe"]["units"]["boss"]["name"]["position"] = "LEFT"
E.db["unitframe"]["units"]["boss"]["name"]["xOffset"] = 4
E.db["unitframe"]["units"]["boss"]["name"]["yOffset"] = 1
E.db["unitframe"]["units"]["boss"]["power"]["height"] = 5
E.db["unitframe"]["units"]["boss"]["width"] = 210
E.db["unitframe"]["units"]["focus"]["castbar"]["enable"] = false
E.db["unitframe"]["units"]["focus"]["castbar"]["height"] = 14
E.db["unitframe"]["units"]["focus"]["castbar"]["icon"] = false
E.db["unitframe"]["units"]["focus"]["castbar"]["iconSize"] = 26
E.db["unitframe"]["units"]["focus"]["castbar"]["width"] = 84
E.db["unitframe"]["units"]["focus"]["debuffs"]["anchorPoint"] = "BOTTOMRIGHT"
E.db["unitframe"]["units"]["focus"]["debuffs"]["enable"] = false
E.db["unitframe"]["units"]["focus"]["height"] = 40
E.db["unitframe"]["units"]["focus"]["infoPanel"]["height"] = 12
E.db["unitframe"]["units"]["focus"]["infoPanel"]["transparent"] = true
E.db["unitframe"]["units"]["focus"]["portrait"]["camDistanceScale"] = 1
E.db["unitframe"]["units"]["focus"]["power"]["height"] = 5
E.db["unitframe"]["units"]["focus"]["width"] = 84
E.db["unitframe"]["units"]["focustarget"]["castbar"]["width"] = 84
E.db["unitframe"]["units"]["focustarget"]["enable"] = true
E.db["unitframe"]["units"]["focustarget"]["height"] = 40
E.db["unitframe"]["units"]["focustarget"]["width"] = 84
E.db["unitframe"]["units"]["party"]["buffs"]["anchorPoint"] = "RIGHT"
E.db["unitframe"]["units"]["party"]["buffs"]["sizeOverride"] = 18
E.db["unitframe"]["units"]["party"]["buffs"]["xOffset"] = 2
E.db["unitframe"]["units"]["party"]["buffs"]["yOffset"] = -20
E.db["unitframe"]["units"]["party"]["colorOverride"] = "FORCE_ON"
E.db["unitframe"]["units"]["party"]["customTexts"]["BenikuiPartyHealth"]["attachTextTo"] = "Health"
E.db["unitframe"]["units"]["party"]["customTexts"]["BenikuiPartyHealth"]["enable"] = true
E.db["unitframe"]["units"]["party"]["customTexts"]["BenikuiPartyHealth"]["font"] = "Expressway"
E.db["unitframe"]["units"]["party"]["customTexts"]["BenikuiPartyHealth"]["fontOutline"] = "OUTLINE"
E.db["unitframe"]["units"]["party"]["customTexts"]["BenikuiPartyHealth"]["justifyH"] = "RIGHT"
E.db["unitframe"]["units"]["party"]["customTexts"]["BenikuiPartyHealth"]["size"] = 16
E.db["unitframe"]["units"]["party"]["customTexts"]["BenikuiPartyHealth"]["text_format"] = "[health:current-percent]"
E.db["unitframe"]["units"]["party"]["customTexts"]["BenikuiPartyHealth"]["xOffset"] = 0
E.db["unitframe"]["units"]["party"]["customTexts"]["BenikuiPartyHealth"]["yOffset"] = 0
E.db["unitframe"]["units"]["party"]["debuffs"]["anchorPoint"] = "BOTTOM"
E.db["unitframe"]["units"]["party"]["debuffs"]["countFontSize"] = 10
E.db["unitframe"]["units"]["party"]["debuffs"]["numrows"] = 2
E.db["unitframe"]["units"]["party"]["debuffs"]["perrow"] = 5
E.db["unitframe"]["units"]["party"]["debuffs"]["sizeOverride"] = 22
E.db["unitframe"]["units"]["party"]["debuffs"]["spacing"] = 6
E.db["unitframe"]["units"]["party"]["debuffs"]["xOffset"] = 56
E.db["unitframe"]["units"]["party"]["debuffs"]["yOffset"] = -4
E.db["unitframe"]["units"]["party"]["growthDirection"] = "RIGHT_DOWN"
E.db["unitframe"]["units"]["party"]["health"]["position"] = "TOPRIGHT"
E.db["unitframe"]["units"]["party"]["health"]["text_format"] = ""
E.db["unitframe"]["units"]["party"]["health"]["xOffset"] = 0
E.db["unitframe"]["units"]["party"]["health"]["yOffset"] = -2
E.db["unitframe"]["units"]["party"]["height"] = 40
E.db["unitframe"]["units"]["party"]["horizontalSpacing"] = 14
E.db["unitframe"]["units"]["party"]["infoPanel"]["enable"] = true
E.db["unitframe"]["units"]["party"]["infoPanel"]["height"] = 20
E.db["unitframe"]["units"]["party"]["infoPanel"]["transparent"] = true
E.db["unitframe"]["units"]["party"]["name"]["attachTextTo"] = "InfoPanel"
E.db["unitframe"]["units"]["party"]["name"]["position"] = "LEFT"
E.db["unitframe"]["units"]["party"]["name"]["text_format"] = "[name:medium] [difficultycolor][smartlevel]"
E.db["unitframe"]["units"]["party"]["name"]["xOffset"] = 4
E.db["unitframe"]["units"]["party"]["petsGroup"]["height"] = 16
E.db["unitframe"]["units"]["party"]["petsGroup"]["name"]["position"] = "LEFT"
E.db["unitframe"]["units"]["party"]["petsGroup"]["width"] = 60
E.db["unitframe"]["units"]["party"]["petsGroup"]["xOffset"] = 0
E.db["unitframe"]["units"]["party"]["petsGroup"]["yOffset"] = -1
E.db["unitframe"]["units"]["party"]["portrait"]["camDistanceScale"] = 1
E.db["unitframe"]["units"]["party"]["portrait"]["height"] = 15
E.db["unitframe"]["units"]["party"]["portrait"]["overlay"] = true
E.db["unitframe"]["units"]["party"]["portrait"]["transparent"] = true
E.db["unitframe"]["units"]["party"]["power"]["enable"] = false
E.db["unitframe"]["units"]["party"]["power"]["height"] = 6
E.db["unitframe"]["units"]["party"]["power"]["position"] = "BOTTOMRIGHT"
E.db["unitframe"]["units"]["party"]["power"]["text_format"] = ""
E.db["unitframe"]["units"]["party"]["power"]["xOffset"] = 0
E.db["unitframe"]["units"]["party"]["power"]["yOffset"] = 2
E.db["unitframe"]["units"]["party"]["rdebuffs"]["font"] = "Expressway"
E.db["unitframe"]["units"]["party"]["roleIcon"]["attachTo"] = "InfoPanel"
E.db["unitframe"]["units"]["party"]["roleIcon"]["position"] = "RIGHT"
E.db["unitframe"]["units"]["party"]["roleIcon"]["size"] = 12
E.db["unitframe"]["units"]["party"]["roleIcon"]["xOffset"] = -2
E.db["unitframe"]["units"]["party"]["roleIcon"]["yOffset"] = 0
E.db["unitframe"]["units"]["party"]["targetsGroup"]["height"] = 16
E.db["unitframe"]["units"]["party"]["targetsGroup"]["width"] = 70
E.db["unitframe"]["units"]["party"]["targetsGroup"]["yOffset"] = -14
E.db["unitframe"]["units"]["party"]["verticalSpacing"] = 4
E.db["unitframe"]["units"]["party"]["width"] = 143
E.db["unitframe"]["units"]["pet"]["aurabar"]["attachTo"] = "DEBUFFS"
E.db["unitframe"]["units"]["pet"]["aurabar"]["detachedWidth"] = 270
E.db["unitframe"]["units"]["pet"]["aurabar"]["priority"] = "Blacklist,blockNoDuration,Personal,Boss,RaidDebuffs,PlayerBuffs"
E.db["unitframe"]["units"]["pet"]["aurabar"]["spacing"] = 3
E.db["unitframe"]["units"]["pet"]["aurabar"]["yOffset"] = 0
E.db["unitframe"]["units"]["pet"]["buffs"]["anchorPoint"] = "TOPLEFT"
E.db["unitframe"]["units"]["pet"]["buffs"]["maxDuration"] = 0
E.db["unitframe"]["units"]["pet"]["buffs"]["perrow"] = 8
E.db["unitframe"]["units"]["pet"]["buffs"]["priority"] = "Blacklist,Personal,PlayerBuffs,Whitelist,blockNoDuration,nonPersonal"
E.db["unitframe"]["units"]["pet"]["buffs"]["sizeOverride"] = 30
E.db["unitframe"]["units"]["pet"]["buffs"]["yOffset"] = 2
E.db["unitframe"]["units"]["pet"]["castbar"]["enable"] = false
E.db["unitframe"]["units"]["pet"]["castbar"]["height"] = 28
E.db["unitframe"]["units"]["pet"]["castbar"]["icon"] = false
E.db["unitframe"]["units"]["pet"]["castbar"]["insideInfoPanel"] = false
E.db["unitframe"]["units"]["pet"]["castbar"]["overlayOnFrame"] = "InfoPanel"
E.db["unitframe"]["units"]["pet"]["castbar"]["width"] = 258
E.db["unitframe"]["units"]["pet"]["customTexts"]["BenikuiPlayerHealth"]["attachTextTo"] = "Health"
E.db["unitframe"]["units"]["pet"]["customTexts"]["BenikuiPlayerHealth"]["enable"] = true
E.db["unitframe"]["units"]["pet"]["customTexts"]["BenikuiPlayerHealth"]["font"] = "Expressway"
E.db["unitframe"]["units"]["pet"]["customTexts"]["BenikuiPlayerHealth"]["fontOutline"] = "NONE"
E.db["unitframe"]["units"]["pet"]["customTexts"]["BenikuiPlayerHealth"]["justifyH"] = "RIGHT"
E.db["unitframe"]["units"]["pet"]["customTexts"]["BenikuiPlayerHealth"]["size"] = 10
E.db["unitframe"]["units"]["pet"]["customTexts"]["BenikuiPlayerHealth"]["text_format"] = "[health:current-percent]"
E.db["unitframe"]["units"]["pet"]["customTexts"]["BenikuiPlayerHealth"]["xOffset"] = -8
E.db["unitframe"]["units"]["pet"]["customTexts"]["BenikuiPlayerHealth"]["yOffset"] = -1
E.db["unitframe"]["units"]["pet"]["customTexts"]["BenikuiPlayerName"]["attachTextTo"] = "InfoPanel"
E.db["unitframe"]["units"]["pet"]["customTexts"]["BenikuiPlayerName"]["enable"] = true
E.db["unitframe"]["units"]["pet"]["customTexts"]["BenikuiPlayerName"]["font"] = "Expressway"
E.db["unitframe"]["units"]["pet"]["customTexts"]["BenikuiPlayerName"]["fontOutline"] = "NONE"
E.db["unitframe"]["units"]["pet"]["customTexts"]["BenikuiPlayerName"]["justifyH"] = "RIGHT"
E.db["unitframe"]["units"]["pet"]["customTexts"]["BenikuiPlayerName"]["size"] = 10
E.db["unitframe"]["units"]["pet"]["customTexts"]["BenikuiPlayerName"]["text_format"] = "[name]"
E.db["unitframe"]["units"]["pet"]["customTexts"]["BenikuiPlayerName"]["xOffset"] = -8
E.db["unitframe"]["units"]["pet"]["customTexts"]["BenikuiPlayerName"]["yOffset"] = 0
E.db["unitframe"]["units"]["pet"]["debuffs"]["anchorPoint"] = "TOPLEFT"
E.db["unitframe"]["units"]["pet"]["debuffs"]["attachTo"] = "BUFFS"
E.db["unitframe"]["units"]["pet"]["debuffs"]["maxDuration"] = 0
E.db["unitframe"]["units"]["pet"]["debuffs"]["perrow"] = 8
E.db["unitframe"]["units"]["pet"]["debuffs"]["priority"] = "Blacklist,Personal,nonPersonal"
E.db["unitframe"]["units"]["pet"]["debuffs"]["sizeOverride"] = 32
E.db["unitframe"]["units"]["pet"]["debuffs"]["yOffset"] = 2
E.db["unitframe"]["units"]["pet"]["disableMouseoverGlow"] = true
E.db["unitframe"]["units"]["pet"]["health"]["attachTextTo"] = "InfoPanel"
E.db["unitframe"]["units"]["pet"]["health"]["position"] = "LEFT"
E.db["unitframe"]["units"]["pet"]["health"]["xOffset"] = 4
E.db["unitframe"]["units"]["pet"]["height"] = 20
E.db["unitframe"]["units"]["pet"]["infoPanel"]["enable"] = true
E.db["unitframe"]["units"]["pet"]["infoPanel"]["height"] = 22
E.db["unitframe"]["units"]["pet"]["infoPanel"]["transparent"] = true
E.db["unitframe"]["units"]["pet"]["name"]["text_format"] = ""
E.db["unitframe"]["units"]["pet"]["orientation"] = "LEFT"
E.db["unitframe"]["units"]["pet"]["portrait"]["camDistanceScale"] = 1
E.db["unitframe"]["units"]["pet"]["portrait"]["overlay"] = true
E.db["unitframe"]["units"]["pet"]["power"]["attachTextTo"] = "Power"
E.db["unitframe"]["units"]["pet"]["power"]["detachFromFrame"] = true
E.db["unitframe"]["units"]["pet"]["power"]["detachedWidth"] = 367
E.db["unitframe"]["units"]["pet"]["power"]["enable"] = false
E.db["unitframe"]["units"]["pet"]["power"]["height"] = 7
E.db["unitframe"]["units"]["pet"]["power"]["hideonnpc"] = true
E.db["unitframe"]["units"]["pet"]["power"]["position"] = "CENTER"
E.db["unitframe"]["units"]["pet"]["power"]["strataAndLevel"]["frameLevel"] = 2
E.db["unitframe"]["units"]["pet"]["power"]["text_format"] = "[power:current-percent]"
E.db["unitframe"]["units"]["pet"]["power"]["yOffset"] = 4
E.db["unitframe"]["units"]["pet"]["smartAuraPosition"] = "DEBUFFS_ON_BUFFS"
E.db["unitframe"]["units"]["pet"]["width"] = 258
E.db["unitframe"]["units"]["player"]["aurabar"]["enable"] = false
E.db["unitframe"]["units"]["player"]["aurabar"]["spacing"] = 3
E.db["unitframe"]["units"]["player"]["buffs"]["attachTo"] = "FRAME"
E.db["unitframe"]["units"]["player"]["buffs"]["sizeOverride"] = 30
E.db["unitframe"]["units"]["player"]["buffs"]["yOffset"] = 2
E.db["unitframe"]["units"]["player"]["castbar"]["enable"] = false
E.db["unitframe"]["units"]["player"]["castbar"]["height"] = 28
E.db["unitframe"]["units"]["player"]["castbar"]["icon"] = false
E.db["unitframe"]["units"]["player"]["castbar"]["insideInfoPanel"] = false
E.db["unitframe"]["units"]["player"]["castbar"]["overlayOnFrame"] = "InfoPanel"
E.db["unitframe"]["units"]["player"]["castbar"]["width"] = 258
E.db["unitframe"]["units"]["player"]["classbar"]["detachedWidth"] = 140
E.db["unitframe"]["units"]["player"]["classbar"]["enable"] = false
E.db["unitframe"]["units"]["player"]["classbar"]["height"] = 14
E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerHealth"]["attachTextTo"] = "Health"
E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerHealth"]["enable"] = true
E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerHealth"]["font"] = "Expressway"
E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerHealth"]["fontOutline"] = "NONE"
E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerHealth"]["justifyH"] = "RIGHT"
E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerHealth"]["size"] = 22
E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerHealth"]["text_format"] = "[health:current-percent]"
E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerHealth"]["xOffset"] = -8
E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerHealth"]["yOffset"] = -1
E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerName"]["attachTextTo"] = "InfoPanel"
E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerName"]["enable"] = true
E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerName"]["font"] = "Expressway"
E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerName"]["fontOutline"] = "NONE"
E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerName"]["justifyH"] = "RIGHT"
E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerName"]["size"] = 11
E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerName"]["text_format"] = "[name]"
E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerName"]["xOffset"] = -8
E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerName"]["yOffset"] = 0
E.db["unitframe"]["units"]["player"]["debuffs"]["attachTo"] = "BUFFS"
E.db["unitframe"]["units"]["player"]["debuffs"]["enable"] = false
E.db["unitframe"]["units"]["player"]["debuffs"]["sizeOverride"] = 32
E.db["unitframe"]["units"]["player"]["debuffs"]["yOffset"] = 2
E.db["unitframe"]["units"]["player"]["disableMouseoverGlow"] = true
E.db["unitframe"]["units"]["player"]["health"]["attachTextTo"] = "InfoPanel"
E.db["unitframe"]["units"]["player"]["health"]["text_format"] = ""
E.db["unitframe"]["units"]["player"]["health"]["xOffset"] = 4
E.db["unitframe"]["units"]["player"]["height"] = 40
E.db["unitframe"]["units"]["player"]["infoPanel"]["enable"] = true
E.db["unitframe"]["units"]["player"]["infoPanel"]["height"] = 22
E.db["unitframe"]["units"]["player"]["infoPanel"]["transparent"] = true
E.db["unitframe"]["units"]["player"]["portrait"]["camDistanceScale"] = 1
E.db["unitframe"]["units"]["player"]["portrait"]["overlay"] = true
E.db["unitframe"]["units"]["player"]["power"]["attachTextTo"] = "Power"
E.db["unitframe"]["units"]["player"]["power"]["detachFromFrame"] = true
E.db["unitframe"]["units"]["player"]["power"]["detachedWidth"] = 367
E.db["unitframe"]["units"]["player"]["power"]["enable"] = false
E.db["unitframe"]["units"]["player"]["power"]["height"] = 7
E.db["unitframe"]["units"]["player"]["power"]["hideonnpc"] = true
E.db["unitframe"]["units"]["player"]["power"]["position"] = "CENTER"
E.db["unitframe"]["units"]["player"]["power"]["strataAndLevel"]["frameLevel"] = 2
E.db["unitframe"]["units"]["player"]["power"]["text_format"] = "[power:current-percent]"
E.db["unitframe"]["units"]["player"]["power"]["xOffset"] = 2
E.db["unitframe"]["units"]["player"]["power"]["yOffset"] = 4
E.db["unitframe"]["units"]["player"]["smartAuraPosition"] = "DEBUFFS_ON_BUFFS"
E.db["unitframe"]["units"]["player"]["width"] = 258
E.db["unitframe"]["units"]["raid"]["colorOverride"] = "FORCE_ON"
E.db["unitframe"]["units"]["raid"]["debuffs"]["anchorPoint"] = "TOPRIGHT"
E.db["unitframe"]["units"]["raid"]["debuffs"]["sizeOverride"] = 16
E.db["unitframe"]["units"]["raid"]["debuffs"]["yOffset"] = -17
E.db["unitframe"]["units"]["raid"]["growthDirection"] = "UP_RIGHT"
E.db["unitframe"]["units"]["raid"]["health"]["position"] = "CENTER"
E.db["unitframe"]["units"]["raid"]["health"]["xOffset"] = 0
E.db["unitframe"]["units"]["raid"]["health"]["yOffset"] = 0
E.db["unitframe"]["units"]["raid"]["height"] = 40
E.db["unitframe"]["units"]["raid"]["horizontalSpacing"] = 5
E.db["unitframe"]["units"]["raid"]["infoPanel"]["enable"] = true
E.db["unitframe"]["units"]["raid"]["infoPanel"]["height"] = 18
E.db["unitframe"]["units"]["raid"]["infoPanel"]["transparent"] = true
E.db["unitframe"]["units"]["raid"]["name"]["attachTextTo"] = "InfoPanel"
E.db["unitframe"]["units"]["raid"]["name"]["position"] = "LEFT"
E.db["unitframe"]["units"]["raid"]["name"]["xOffset"] = 4
E.db["unitframe"]["units"]["raid"]["numGroups"] = 8
E.db["unitframe"]["units"]["raid"]["portrait"]["overlay"] = true
E.db["unitframe"]["units"]["raid"]["power"]["enable"] = false
E.db["unitframe"]["units"]["raid"]["power"]["height"] = 5
E.db["unitframe"]["units"]["raid"]["rdebuffs"]["font"] = "Expressway"
E.db["unitframe"]["units"]["raid"]["rdebuffs"]["fontOutline"] = "OUTLINE"
E.db["unitframe"]["units"]["raid"]["rdebuffs"]["size"] = 20
E.db["unitframe"]["units"]["raid"]["rdebuffs"]["yOffset"] = 12
E.db["unitframe"]["units"]["raid"]["resurrectIcon"]["attachTo"] = "BOTTOMRIGHT"
E.db["unitframe"]["units"]["raid"]["roleIcon"]["attachTo"] = "InfoPanel"
E.db["unitframe"]["units"]["raid"]["roleIcon"]["position"] = "RIGHT"
E.db["unitframe"]["units"]["raid"]["roleIcon"]["size"] = 12
E.db["unitframe"]["units"]["raid"]["roleIcon"]["xOffset"] = -2
E.db["unitframe"]["units"]["raid"]["roleIcon"]["yOffset"] = 0
E.db["unitframe"]["units"]["raid"]["verticalSpacing"] = 5
E.db["unitframe"]["units"]["raid"]["visibility"] = "[@raid6,noexists] hide;show"
E.db["unitframe"]["units"]["raid"]["width"] = 76
E.db["unitframe"]["units"]["raid40"]["colorOverride"] = "FORCE_ON"
E.db["unitframe"]["units"]["raid40"]["growthDirection"] = "RIGHT_UP"
E.db["unitframe"]["units"]["raid40"]["health"]["xOffset"] = 0
E.db["unitframe"]["units"]["raid40"]["health"]["yOffset"] = 1
E.db["unitframe"]["units"]["raid40"]["horizontalSpacing"] = 5
E.db["unitframe"]["units"]["raid40"]["infoPanel"]["height"] = 18
E.db["unitframe"]["units"]["raid40"]["infoPanel"]["transparent"] = true
E.db["unitframe"]["units"]["raid40"]["rdebuffs"]["enable"] = true
E.db["unitframe"]["units"]["raid40"]["rdebuffs"]["font"] = "Expressway"
E.db["unitframe"]["units"]["raid40"]["rdebuffs"]["fontOutline"] = "OUTLINE"
E.db["unitframe"]["units"]["raid40"]["rdebuffs"]["size"] = 20
E.db["unitframe"]["units"]["raid40"]["rdebuffs"]["yOffset"] = 4
E.db["unitframe"]["units"]["raid40"]["roleIcon"]["damager"] = false
E.db["unitframe"]["units"]["raid40"]["roleIcon"]["enable"] = true
E.db["unitframe"]["units"]["raid40"]["roleIcon"]["position"] = "RIGHT"
E.db["unitframe"]["units"]["raid40"]["roleIcon"]["size"] = 10
E.db["unitframe"]["units"]["raid40"]["roleIcon"]["xOffset"] = -2
E.db["unitframe"]["units"]["raid40"]["roleIcon"]["yOffset"] = 0
E.db["unitframe"]["units"]["raid40"]["verticalSpacing"] = 5
E.db["unitframe"]["units"]["target"]["aurabar"]["enable"] = false
E.db["unitframe"]["units"]["target"]["buffs"]["anchorPoint"] = "BOTTOMRIGHT"
E.db["unitframe"]["units"]["target"]["buffs"]["countFont"] = "Expressway"
E.db["unitframe"]["units"]["target"]["buffs"]["sizeOverride"] = 30
E.db["unitframe"]["units"]["target"]["buffs"]["xOffset"] = -6
E.db["unitframe"]["units"]["target"]["buffs"]["yOffset"] = -38
E.db["unitframe"]["units"]["target"]["castbar"]["height"] = 40
E.db["unitframe"]["units"]["target"]["castbar"]["icon"] = false
E.db["unitframe"]["units"]["target"]["castbar"]["iconPosition"] = "RIGHT"
E.db["unitframe"]["units"]["target"]["castbar"]["iconXOffset"] = 10
E.db["unitframe"]["units"]["target"]["castbar"]["insideInfoPanel"] = false
E.db["unitframe"]["units"]["target"]["castbar"]["overlayOnFrame"] = "InfoPanel"
E.db["unitframe"]["units"]["target"]["castbar"]["width"] = 258
E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetHealth"]["attachTextTo"] = "Health"
E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetHealth"]["enable"] = true
E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetHealth"]["font"] = "Expressway"
E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetHealth"]["fontOutline"] = "NONE"
E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetHealth"]["justifyH"] = "LEFT"
E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetHealth"]["size"] = 22
E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetHealth"]["text_format"] = "[health:current-percent]"
E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetHealth"]["xOffset"] = 8
E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetHealth"]["yOffset"] = -1
E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetName"]["attachTextTo"] = "InfoPanel"
E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetName"]["enable"] = true
E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetName"]["font"] = "Expressway"
E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetName"]["fontOutline"] = "NONE"
E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetName"]["justifyH"] = "LEFT"
E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetName"]["size"] = 11
E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetName"]["text_format"] = "[name:long] [difficultycolor][smartlevel] [shortclassification]"
E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetName"]["xOffset"] = 8
E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetName"]["yOffset"] = 0
E.db["unitframe"]["units"]["target"]["debuffs"]["countFont"] = "Expressway"
E.db["unitframe"]["units"]["target"]["debuffs"]["sizeOverride"] = 30
E.db["unitframe"]["units"]["target"]["debuffs"]["yOffset"] = 2
E.db["unitframe"]["units"]["target"]["disableMouseoverGlow"] = true
E.db["unitframe"]["units"]["target"]["health"]["attachTextTo"] = "InfoPanel"
E.db["unitframe"]["units"]["target"]["health"]["text_format"] = ""
E.db["unitframe"]["units"]["target"]["health"]["xOffset"] = 4
E.db["unitframe"]["units"]["target"]["height"] = 40
E.db["unitframe"]["units"]["target"]["infoPanel"]["enable"] = true
E.db["unitframe"]["units"]["target"]["infoPanel"]["height"] = 22
E.db["unitframe"]["units"]["target"]["infoPanel"]["transparent"] = true
E.db["unitframe"]["units"]["target"]["name"]["position"] = "RIGHT"
E.db["unitframe"]["units"]["target"]["name"]["text_format"] = ""
E.db["unitframe"]["units"]["target"]["name"]["xOffset"] = 8
E.db["unitframe"]["units"]["target"]["orientation"] = "LEFT"
E.db["unitframe"]["units"]["target"]["portrait"]["camDistanceScale"] = 1
E.db["unitframe"]["units"]["target"]["portrait"]["overlay"] = true
E.db["unitframe"]["units"]["target"]["power"]["attachTextTo"] = "InfoPanel"
E.db["unitframe"]["units"]["target"]["power"]["detachedWidth"] = 300
E.db["unitframe"]["units"]["target"]["power"]["enable"] = false
E.db["unitframe"]["units"]["target"]["power"]["height"] = 7
E.db["unitframe"]["units"]["target"]["power"]["text_format"] = "[powercolor][power:current-percent]"
E.db["unitframe"]["units"]["target"]["power"]["xOffset"] = 4
E.db["unitframe"]["units"]["target"]["smartAuraPosition"] = "DEBUFFS_ON_BUFFS"
E.db["unitframe"]["units"]["target"]["width"] = 258
E.db["unitframe"]["units"]["targettarget"]["debuffs"]["anchorPoint"] = "TOPRIGHT"
E.db["unitframe"]["units"]["targettarget"]["debuffs"]["enable"] = false
E.db["unitframe"]["units"]["targettarget"]["disableMouseoverGlow"] = true
E.db["unitframe"]["units"]["targettarget"]["height"] = 25
E.db["unitframe"]["units"]["targettarget"]["infoPanel"]["height"] = 12
E.db["unitframe"]["units"]["targettarget"]["infoPanel"]["transparent"] = true
E.db["unitframe"]["units"]["targettarget"]["name"]["text_format"] = "[name:medium]"
E.db["unitframe"]["units"]["targettarget"]["portrait"]["camDistanceScale"] = 1
E.db["unitframe"]["units"]["targettarget"]["portrait"]["overlay"] = true
E.db["unitframe"]["units"]["targettarget"]["power"]["enable"] = false
E.db["unitframe"]["units"]["targettarget"]["power"]["height"] = 5
E.db["unitframe"]["units"]["targettarget"]["raidicon"]["attachTo"] = "LEFT"
E.db["unitframe"]["units"]["targettarget"]["raidicon"]["enable"] = false
E.db["unitframe"]["units"]["targettarget"]["raidicon"]["xOffset"] = 2
E.db["unitframe"]["units"]["targettarget"]["raidicon"]["yOffset"] = 0
E.db["unitframe"]["units"]["targettarget"]["threatStyle"] = "GLOW"




	--[[
		--If you want to modify the base layout according to
		-- certain conditions then this is how you could do it
		if layout == "tank" then
			--Make some changes to the layout posted above
		elseif layout == "dps" then
			--Make some other changes
		elseif layout == "healer" then
			--Make some different changes
		end
	--]]


	--[[
	--	This section at the bottom is just to update ElvUI and display a message
	--]]
	--Update ElvUI
	E:UpdateAll(true)
	--Show message about layout being set
	PluginInstallStepComplete.message = "Layout Set"
	PluginInstallStepComplete:Show()
end

--This function is executed when you press "Skip Process" or "Finished" in the installer.
local function InstallComplete()
	if GetCVarBool("Sound_EnableMusic") then
		StopMusic()
	end

	--Set a variable tracking the version of the addon when layout was installed
	E.db[MyPluginName].install_version = Version

	ReloadUI()
end

--This is the data we pass on to the ElvUI Plugin Installer.
--The Plugin Installer is reponsible for displaying the install guide for this layout.
local InstallerData = {
	Title = format("|cff4beb2c%s %s|r", MyPluginName, "Installation"),
	Name = MyPluginName,
	--tutorialImage = "Interface\\AddOns\\MyAddOn\\logo.tga", --If you have a logo you want to use, otherwise it uses the one from ElvUI
	Pages = {
		[1] = function()
			PluginInstallFrame.SubTitle:SetFormattedText("Welcome to the installation for %s.", MyPluginName)
			PluginInstallFrame.Desc1:SetText("This installation process will guide you through a few steps and apply settings to your current ElvUI profile. If you want to be able to go back to your original settings then create a new profile before going through this installation process.")
			PluginInstallFrame.Desc2:SetText("Please press the continue button if you wish to go through the installation process, otherwise click the 'Skip Process' button.")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", InstallComplete)
			PluginInstallFrame.Option1:SetText("Skip Process")
		end,
		[2] = function()
			PluginInstallFrame.SubTitle:SetText("Layouts")
			PluginInstallFrame.Desc1:SetText("These are the layouts that are available. Please click a button below to apply the layout of your choosing.")
			PluginInstallFrame.Desc2:SetText("Importance: |cff07D400High|r")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() SetupLayout("tank") end)
			PluginInstallFrame.Option1:SetText("Tank")
			PluginInstallFrame.Option2:Show()
			PluginInstallFrame.Option2:SetScript("OnClick", function() SetupLayout("healer") end)
			PluginInstallFrame.Option2:SetText("Healer")
			PluginInstallFrame.Option3:Show()
			PluginInstallFrame.Option3:SetScript("OnClick", function() SetupLayout("dps") end)
			PluginInstallFrame.Option3:SetText("DPS")
		end,
		[3] = function()
			PluginInstallFrame.SubTitle:SetText("Installation Complete")
			PluginInstallFrame.Desc1:SetText("You have completed the installation process.")
			PluginInstallFrame.Desc2:SetText("Please click the button below in order to finalize the process and automatically reload your UI.")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", InstallComplete)
			PluginInstallFrame.Option1:SetText("Finished")
		end,
	},
	StepTitles = {
		[1] = "Welcome",
		[2] = "Layouts",
		[3] = "Installation Complete",
	},
	StepTitlesColor = {1, 1, 1},
	StepTitlesColorSelected = {0, 179/255, 1},
	StepTitleWidth = 200,
	StepTitleButtonWidth = 180,
	StepTitleTextJustification = "RIGHT",
}

--This function holds the options table which will be inserted into the ElvUI config
local function InsertOptions()
	E.Options.args.MyPluginName = {
		order = 100,
		type = "group",
		name = format("|cff4beb2c%s|r", MyPluginName),
		args = {
			header1 = {
				order = 1,
				type = "header",
				name = MyPluginName,
			},
			description1 = {
				order = 2,
				type = "description",
				name = format("%s is a layout for ElvUI.", MyPluginName),
			},
			spacer1 = {
				order = 3,
				type = "description",
				name = "\n\n\n",
			},
			header2 = {
				order = 4,
				type = "header",
				name = "Installation",
			},
			description2 = {
				order = 5,
				type = "description",
				name = "The installation guide should pop up automatically after you have completed the ElvUI installation. If you wish to re-run the installation process for this layout then please click the button below.",
			},
			spacer2 = {
				order = 6,
				type = "description",
				name = "",
			},
			install = {
				order = 7,
				type = "execute",
				name = "Install",
				desc = "Run the installation process.",
				func = function() E:GetModule("PluginInstaller"):Queue(InstallerData); E:ToggleOptionsUI(); end,
			},
		},
	}
end

--Create a unique table for our plugin
P[MyPluginName] = {}

--This function will handle initialization of the addon
function mod:Initialize()
	--Initiate installation process if ElvUI install is complete and our plugin install has not yet been run
	if E.private.install_complete and E.db[MyPluginName].install_version == nil then
		E:GetModule("PluginInstaller"):Queue(InstallerData)
	end

	--Insert our options table when ElvUI config is loaded
	EP:RegisterPlugin(addon, InsertOptions)
end

--Register module with callback so it gets initialized when ready
E:RegisterModule(mod:GetName())
