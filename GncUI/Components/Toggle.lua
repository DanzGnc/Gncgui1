-- Toggle Component
local Theme = require("GncUI.Theme")
local Utils = require("GncUI.Utils")

local Toggle = {}
Toggle.__index = Toggle

function Toggle.new(parent, config)
    local self = setmetatable({}, Toggle)

    self.config = Utils.mergeConfig({
        label = "Toggle",
        default = false,
        callback = function() end
    }, config or {})

    self.state = self.config.default

    print("Created toggle:", self.config.label, "State:", self.state)
    return self
end

function Toggle:setState(state)
    self.state = state
    if self.config.callback then
        self.config.callback(state)
    end
    print("Toggle state changed to:", state)
end

function Toggle:toggle()
    self:setState(not self.state)
end

return Toggle