
-- Label Component
local Theme = require(script.Parent.Parent.Theme)
local Utils = require(script.Parent.Parent.Utils)

-- Import dependencies using loadstring for Roblox compatibility
local Theme = loadstring(game:HttpGet("https://raw.githubusercontent.com/YourUsername/YourRepository/main/GncUI/Theme.lua"))()
local Utils = loadstring(game:HttpGet("https://raw.githubusercontent.com/YourUsername/YourRepository/main/GncUI/Utils.lua"))()

local Label = {}
Label.__index = Label

function Label.new(parent, config)
    local self = setmetatable({}, Label)
    
    self.config = Utils.mergeConfig({
        text = "Label",
        size = {1, 30},
        position = nil,
        color = Theme.colors.component,
        textColor = Theme.colors.textSecondary,
        textSize = Theme.sizes.textSize,
        font = Theme.fonts.regular,
        textWrapped = true,
        textXAlignment = Enum.TextXAlignment.Left,
        textYAlignment = Enum.TextYAlignment.Top
    }, config or {})
    
    self:_create(parent)
    return self
end

function Label:_create(parent)
    self.label = Instance.new("TextLabel")
    self.label.Parent = parent
    
    if type(self.config.size[1]) == "number" and self.config.size[1] <= 1 then
        self.label.Size = UDim2.new(self.config.size[1], -20, 0, self.config.size[2])
    else
        self.label.Size = UDim2.new(0, self.config.size[1], 0, self.config.size[2])
    end
    
    if self.config.position then
        self.label.Position = self.config.position
    end
    
    if self.config.color then
        self.label.BackgroundColor3 = self.config.color
        self.label.BackgroundTransparency = 0
        Utils.addCorner(self.label, 4)
    else
        self.label.BackgroundTransparency = 1
    end
    
    self.label.Text = self.config.text
    self.label.TextColor3 = self.config.textColor
    self.label.Font = self.config.font
    self.label.TextSize = self.config.textSize
    self.label.TextWrapped = self.config.textWrapped
    self.label.TextXAlignment = self.config.textXAlignment
    self.label.TextYAlignment = self.config.textYAlignment
end

function Label:setText(text)
    self.label.Text = text
end

return Label
