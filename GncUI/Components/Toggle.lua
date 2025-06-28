
-- Toggle Component
-- Import dependencies using loadstring for Roblox compatibility
local Theme = loadstring(game:HttpGet("https://raw.githubusercontent.com/YourUsername/YourRepository/main/GncUI/Theme.lua"))()
local Utils = loadstring(game:HttpGet("https://raw.githubusercontent.com/YourUsername/YourRepository/main/GncUI/Utils.lua"))()

local Toggle = {}
Toggle.__index = Toggle

function Toggle.new(parent, config)
    local self = setmetatable({}, Toggle)
    
    self.config = Utils.mergeConfig({
        label = "Toggle",
        default = false,
        callback = function(state) end,
        size = {1, 40}
    }, config or {})
    
    self.state = self.config.default
    self:_create(parent)
    return self
end

function Toggle:_create(parent)
    self.frame = Instance.new("Frame")
    self.frame.Parent = parent
    self.frame.Size = UDim2.new(self.config.size[1], -20, 0, self.config.size[2])
    self.frame.BackgroundTransparency = 1
    
    self.label = Instance.new("TextLabel")
    self.label.Parent = self.frame
    self.label.Size = UDim2.new(0.7, -5, 1, 0)
    self.label.Text = self.config.label
    self.label.Font = Theme.fonts.regular
    self.label.TextSize = 15
    self.label.TextColor3 = Theme.colors.textSecondary
    self.label.BackgroundTransparency = 1
    self.label.TextXAlignment = Enum.TextXAlignment.Left
    
    self.button = Instance.new("TextButton")
    self.button.Parent = self.frame
    self.button.Size = UDim2.new(0.3, 0, 1, 0)
    self.button.Position = UDim2.new(0.7, 5, 0, 0)
    self.button.Font = Theme.fonts.bold
    self.button.TextSize = 14
    self.button.TextColor3 = Color3.fromRGB(255, 255, 255)
    self.button.BorderSizePixel = 0
    
    Utils.addCorner(self.button, Theme.sizes.cornerRadius)
    
    self:_updateAppearance()
    
    self.button.MouseButton1Click:Connect(function()
        self:toggle()
    end)
end

function Toggle:_updateAppearance()
    if self.state then
        self.button.Text = "ON"
        self.button.BackgroundColor3 = Theme.colors.success
    else
        self.button.Text = "OFF"
        self.button.BackgroundColor3 = Theme.colors.error
    end
end

function Toggle:toggle()
    self.state = not self.state
    self:_updateAppearance()
    self.config.callback(self.state)
end

function Toggle:setState(state)
    self.state = state
    self:_updateAppearance()
end

return Toggle
