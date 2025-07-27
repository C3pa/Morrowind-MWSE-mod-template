return {
	-- NOTE:
	-- If your string has string.format formatting codes such as %s, %.2f, etc.
	-- You need to escape them with another `%` (%%s, %%.2f, %%). A special case is
	-- their percentage (%) sign inside a label string in a MCM slider: you need to
	-- escape it twice, so four percentages (%%%%).

	-- The mod's name
	["Localized Template Mod"] = "Localized Template Mod",

	-- Put all the mcm strings here.
	["mcm"] = {
		-- General strings.
		["settings"] = "Settings",

		-- The default sidebar text. Shown when NO button, slider, etc. is hovered over.
		["sidebar"] = "\nWelcome to Localized Template Mod!\n\nHover over a feature for more info.\n\nMade by:",

		-- Strings for inidividual settings:
		["asetting"] = {
			["label"] = "Some distance: %%s units.",
			["description"] = "This is the maximal distance...",
		},
		["someKey"] = {
			["label"] = "Some action key combination.",
			["description"] = "This key combination will trigger ...",
		},
	},
}
