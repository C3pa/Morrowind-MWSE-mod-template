local configlib = require("template.config")
local log = require("logging.logger").getLogger("template") --[[@as mwseLogger]]


local mcmConfig = configlib.getConfig()

local authors = {
	{
		name = "C3pa",
		url = "https://next.nexusmods.com/profile/C3pa/mods",
	},
	{
		name = "Some other author",
		url = "https://www.google.com",
	}
}


--- @param self mwseMCMInfo|mwseMCMHyperlink
local function center(self)
	self.elements.info.absolutePosAlignX = 0.5
end

--- Adds default text to sidebar. Has a list of all the authors that contributed to the mod.
--- @param container mwseMCMSideBarPage
local function createSidebar(container)
	container.sidebar:createInfo({
		text = (
			"\nWelcome to Template Mod!\n\nHover over a feature for more info.\n\nMade by:"
		),
		postCreate = center,
	})
	for _, author in ipairs(authors) do
		container.sidebar:createHyperlink({
			text = author.name,
			url = author.url,
			postCreate = center,
		})
	end
end

local function registerModConfig()
	local template = mwse.mcm.createTemplate({
		name = "Template Mod",
		headerImagePath = "MWSE/mods/template/mcm/Header.tga",
		onClose = function()
			configlib.saveConfig(mcmConfig)
		end,
		config = mcmConfig,
		defaultConfig = configlib.default,
		showDefaultSetting = true,
	})
	template:register()

	local page = template:createSideBarPage({
		label = "Settings",
		showReset = true,
	}) --[[@as mwseMCMSideBarPage]]
	createSidebar(page)

	page:createSlider({
		label = "Some distance: %s units",
		description = "The maximum distance in units at ...",
		min = 200,
		max = 500,
		step = 50,
		jump = 100,
		configKey = "asetting",
	})

	page:createKeyBinder({
		label = "Some action key combination.",
		description = "This key combination will trigger ...",
		allowCombinations = true,
		allowMouse = true,
		configKey = "someKey",
		callback = function()
			mwse.log("Callback!")
			tes3.messageBox("Callback!")
		end
	})

	page:createDropdown({
		label = "Logging Level",
		description = "Set the log level. If you've found a bug in the mod, please backup \z
			your MWSE.log, set the logging level to Trace, and replicate the bug. When \z
			reporting the bug please attach both MWSE.log files.",
		options = {
			{ label = "Trace", value = "TRACE" },
			{ label = "Debug", value = "DEBUG" },
			{ label = "Info",  value = "INFO" },
			{ label = "Warn",  value = "WARN" },
			{ label = "Error", value = "ERROR" },
			{ label = "None",  value = "NONE" },
		},
		configKey = "logLevel",
		callback = function(self)
			log:setLogLevel(self.variable.value)
		end
	})
end

event.register(tes3.event.modConfigReady, registerModConfig)
