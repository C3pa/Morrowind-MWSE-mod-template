-- Inspect is useful to print-debug any kind of table.
local inspect = require("inspect")
local logger = require("logging.logger")

local util = require("template.util")
-- We directly index into the "config" table in the configlib module.
local config = require("template.config").config
dofile("template.mcm")


local log = logger.new({
	name = "Template",
	logLevel = config.logLevel,
})


---@param e keyDownEventData|mouseButtonDownEventData|mouseWheelEventData
local function onInput(e)
	if not tes3.isKeyEqual({ actual = e, expected = config.someKey }) then return end
	-- Do something here

end
event.register(tes3.event.keyDown, onInput)
event.register(tes3.event.mouseButtonDown, onInput)
event.register(tes3.event.mouseWheel, onInput)
