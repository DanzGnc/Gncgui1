-- Title Component
local Theme = require("GncUI.Theme")
local Utils = require("GncUI.Utils")

local Title = {}
Title.__index = Title

function Title.new(parent, config)
    local self = setmetatable({}, Title)

    self.config = Utils.mergeConfig({
        text = "Title",
        size = {1, 30},
        textColor = Theme.colors.text,
        textSize = Theme.sizes.titleSize,
        font = Theme.fonts.bold
    }, config or {})

    print("Created title:", self.config.text)
    return self
end

function Title:setText(text)
    self.config.text = text
    print("Title text updated to:", text)
end

return Title