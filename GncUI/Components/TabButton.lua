
-- Tab Button Component
local Theme = require(script.Parent.Parent.Theme)
local Utils = require(script.Parent.Parent.Utils)

local TabButton = {}
TabButton.__index = TabButton

function TabButton.new(parent, config)
    local self = setmetatable({}, TabButton)
    
    self.config = Utils.mergeConfig({
        text = "Tab",
        order = 1,
        callback = function() end
    }, config or {})
    
    self.isActive = false
    self:_create(parent)
    return self
end

function TabButton:_create(parent)
    self.button = Instance.new("TextButton")
    self.button.Name = self.config.text .. "TabButton"
    self.button.Parent = parent
    self.button.Size = UDim2.new(1, -10, 0, 35)
    self.button.BackgroundColor3 = Theme.colors.tabDefault
    self.button.Text = self.config.text
    self.button.TextColor3 = Color3.fromRGB(210, 210, 210)
    self.button.Font = Theme.fonts.semibold
    self.button.TextSize = 16
    self.button.BorderSizePixel = 0
    self.button.LayoutOrder = self.config.order
    
    Utils.addCorner(self.button, Theme.sizes.cornerRadius)
    
    self.button.MouseButton1Click:Connect(self.config.callback)
end

function TabButton:setActive(active)
    self.isActive = active
    if active then
        self.button.BackgroundColor3 = Theme.colors.tabActive
        self.button.TextColor3 = Color3.fromRGB(255, 255, 255)
    else
        self.button.BackgroundColor3 = Theme.colors.tabDefault
        self.button.TextColor3 = Color3.fromRGB(210, 210, 210)
    end
end

return TabButton
-- TabButton Component
local Theme = require("GncUI.Theme")
local Utils = require("GncUI.Utils")

local TabButton = {}
TabButton.__index = TabButton

function TabButton.new(parent, config)
    local self = setmetatable({}, TabButton)
    
    self.config = Utils.mergeConfig({
        text = "Tab",
        order = 1,
        callback = function() end
    }, config or {})
    
    self.active = false
    
    print("Created tab button:", self.config.text)
    return self
end

function TabButton:setActive(active)
    self.active = active
    print("Tab button", self.config.text, "active:", active)
end

return TabButton
