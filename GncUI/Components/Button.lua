
-- Button Component
local Theme = require(script.Parent.Parent.Theme)
local Utils = require(script.Parent.Parent.Utils)

local Button = {}
Button.__index = Button

function Button.new(parent, config)
    local self = setmetatable({}, Button)
    
    self.config = Utils.mergeConfig({
        text = "Button",
        size = {0.5, 40},
        position = nil,
        color = Theme.colors.button,
        textColor = Color3.fromRGB(255, 255, 255),
        textSize = 16,
        font = Theme.fonts.regular,
        callback = function() end
    }, config or {})
    
    self:_create(parent)
    return self
end

function Button:_create(parent)
    self.button = Instance.new("TextButton")
    self.button.Parent = parent
    
    if type(self.config.size[1]) == "number" and self.config.size[1] <= 1 then
        self.button.Size = UDim2.new(self.config.size[1], 0, 0, self.config.size[2])
    else
        self.button.Size = UDim2.new(0, self.config.size[1], 0, self.config.size[2])
    end
    
    if self.config.position then
        self.button.Position = self.config.position
    end
    
    self.button.BackgroundColor3 = self.config.color
    self.button.Text = self.config.text
    self.button.TextColor3 = self.config.textColor
    self.button.Font = self.config.font
    self.button.TextSize = self.config.textSize
    self.button.BorderSizePixel = 0
    
    Utils.addCorner(self.button, Theme.sizes.cornerRadius)
    
    -- Events
    self.button.MouseButton1Click:Connect(self.config.callback)
    
    self.button.MouseEnter:Connect(function()
        Utils.tween(self.button, {BackgroundColor3 = Theme.colors.buttonHover}, 0.2)
    end)
    
    self.button.MouseLeave:Connect(function()
        Utils.tween(self.button, {BackgroundColor3 = self.config.color}, 0.2)
    end)
end

function Button:setText(text)
    self.button.Text = text
end

function Button:setCallback(callback)
    self.config.callback = callback
end

return Button
-- Button Component
local Theme = require("GncUI.Theme")
local Utils = require("GncUI.Utils")

local Button = {}
Button.__index = Button

function Button.new(parent, config)
    local self = setmetatable({}, Button)
    
    self.config = Utils.mergeConfig({
        text = "Button",
        size = {1, 40},
        color = Theme.colors.elementBackground,
        textColor = Theme.colors.text,
        callback = function() end
    }, config or {})
    
    print("Created button:", self.config.text)
    return self
end

function Button:setText(text)
    self.config.text = text
    print("Button text updated to:", text)
end

function Button:click()
    if self.config.callback then
        self.config.callback(self)
    end
end

return Button
