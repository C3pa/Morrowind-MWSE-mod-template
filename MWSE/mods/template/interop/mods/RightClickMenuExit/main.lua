-- Interoperability for: https://www.nexusmods.com/morrowind/mods/48458

local interop = include("mer.RightClickMenuExit")

if not interop then return end

interop.registerMenu({
	menuId = "MyMenu",
	buttonId = "MyMenu_closeButton",
})
