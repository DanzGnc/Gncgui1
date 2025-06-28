
-- Header Button Component
local Theme = require(script.Parent.Parent.Theme)
local Utils = require(script.Parent.Parent.Utils)

local HeaderButton = {}
HeaderButton.__index = HeaderButton

function HeaderButton.new(parent, config)
    local self = setmetatable({}, HeaderButton)
    
    self.config = Utils.mergeConfig({
        text = "X",
        color = Color3.fromRGB(255, 70, 70),
        position = UDim2.new(1, -40, 0.5, -17.5),
        callback = function() end
    }, config or {})
    
    self:_create(parent)
    return self
end

function HeaderButton:_create(parent)
    self.button = Instance.new("TextButton")
    self.button.Parent = parent
    self.button.Size = UDim2.new(0, 35, 0, 35)
    self.button.Position = self.config.position
    self.button.BackgroundColor3 = self.config.color
    self.button.BackgroundTransparency = 0.2
    self.button.Text = self.config.text
    self.button.TextColor3 = Color3.fromRGB(255, 255, 255)
    self.button.Font = Theme.fonts.bold
    self.button.TextSize = 18
    self.button.BorderSizePixel = 0
    
    Utils.addCorner(self.button, Theme.sizes.cornerRadius)
    
    self.button.MouseButton1Click:Connect(self.config.callback)
end

return HeaderButton
-- HeaderButton Component
local Theme = require("GncUI.Theme")
local Utils = require("GncUI.Utils")

local HeaderButton = {}
HeaderButton.__index = HeaderButton

function HeaderButton.new(parent, config)
    local self = setmetatable({}, HeaderButton)
    
    self.config = Utils.mergeConfig({
        text = "X",
        color = {255, 70, 70},
        callback = function() end
    }, config or {})
    
    print("Created header button:", self.config.text)
    return self
end

return HeaderButton
