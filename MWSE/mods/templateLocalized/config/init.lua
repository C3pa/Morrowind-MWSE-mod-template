local fileName = "Localized Template"

---@class templateLocalized.config
---@field version string A [semantic version](https://semver.org/).
---@field default templateLocalized.config Access to the default config can be useful in the MCM.
---@field fileName string
local default = {
	logLevel = mwse.logLevel.info,
	asetting = 300,
	---@type mwseKeyMouseCombo
	someKey = {
		keyCode = tes3.scanCode.p,
		isShiftDown = false,
		isAltDown = true,
		isControlDown = false,
	},
}

local config = mwse.loadConfig(fileName, default)
config.version = "0.1.0"
config.default = default
config.fileName = fileName

return config
