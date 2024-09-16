local configFile = "Template"

---@class template.configTable
local default = {
	---@type mwseLoggerLogLevel
	logLevel = "INFO",
	asetting = 300,
	---@type mwseKeyMouseCombo
	someKey = {
		keyCode = tes3.scanCode.p,
		isShiftDown = false,
		isAltDown = true,
		isControlDown = false,
	},
}

local cachedConfig = mwse.loadConfig(configFile, default)
local this = {
	version = "0.1.0",
	---@type template.configTable
	config = {},
	default = default,
}

-- We use a trick of empty "config" table with a __index in its metatable. This way we make sure
-- that all the other files that read from "config" table read our up-to-date cachedConfig.
-- This approach was pioneered by Merlord.
setmetatable(this.config, { __index = cachedConfig })

--- Returns a copy of the current config table.
--- Usually used in mcm\init.lua
---@return template.configTable
this.getConfig = function()
	return table.copy(cachedConfig)
end

--- Saves the config table to mod's config file.
--- Usually used in mcm\init.lua
--- @param mcmConfig template.configTable
this.saveConfig = function(mcmConfig)
	table.copy(mcmConfig, cachedConfig)
	mwse.saveConfig(configFile, cachedConfig)
end

return this
