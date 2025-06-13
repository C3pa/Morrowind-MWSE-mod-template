-- We directly index into the "config" table in the configlib module.
local config = require("template.config").config

local log = mwse.Logger.new({
	name = "Template",
	level = config.logLevel,
})

local util = require("template.util")
dofile("template.interop.mods")
dofile("template.mcm")


---@param e keyDownEventData|mouseButtonDownEventData|mouseWheelEventData
local function onInput(e)
	if not tes3.isKeyEqual({ actual = e, expected = config.someKey }) then return end
	-- Do something here

end
event.register(tes3.event.keyDown, onInput)
event.register(tes3.event.mouseButtonDown, onInput)
event.register(tes3.event.mouseWheel, onInput)
