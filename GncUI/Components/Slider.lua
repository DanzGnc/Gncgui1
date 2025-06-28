
-- Slider Component
local Theme = require(script.Parent.Parent.Theme)
local Utils = require(script.Parent.Parent.Utils)

local Slider = {}
Slider.__index = Slider

function Slider.new(parent, config)
    local self = setmetatable({}, Slider)
    
    self.config = Utils.mergeConfig({
        label = "Slider",
        min = 0,
        max = 100,
        default = 50,
        callback = function(value) end,
        size = {0.9, 80}
    }, config or {})
    
    self.value = self.config.default
    self.dragging = false
    self:_create(parent)
    return self
end

function Slider:_create(parent)
    self.frame = Instance.new("Frame")
    self.frame.Parent = parent
    self.frame.Size = UDim2.new(self.config.size[1], 0, 0, self.config.size[2])
    self.frame.BackgroundColor3 = Theme.colors.component
    Utils.addCorner(self.frame, Theme.sizes.cornerRadius)
    
    self.label = Instance.new("TextLabel")
    self.label.Parent = self.frame
    self.label.Size = UDim2.new(1, 0, 0, 25)
    self.label.Position = UDim2.new(0, 0, 0, 5)
    self.label.Text = self.config.label .. ": " .. self.value
    self.label.TextColor3 = Theme.colors.text
    self.label.Font = Theme.fonts.semibold
    self.label.TextSize = 14
    self.label.BackgroundTransparency = 1
    
    self.sliderBg = Instance.new("Frame")
    self.sliderBg.Parent = self.frame
    self.sliderBg.Size = UDim2.new(0.9, 0, 0, 10)
    self.sliderBg.Position = UDim2.new(0.05, 0, 0, 40)
    self.sliderBg.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    Utils.addCorner(self.sliderBg, 5)
    
    self.sliderFill = Instance.new("Frame")
    self.sliderFill.Parent = self.sliderBg
    self.sliderFill.Size = UDim2.new((self.value - self.config.min) / (self.config.max - self.config.min), 0, 1, 0)
    self.sliderFill.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
    Utils.addCorner(self.sliderFill, 5)
    
    self.sliderButton = Instance.new("TextButton")
    self.sliderButton.Parent = self.sliderBg
    self.sliderButton.Size = UDim2.new(0, 20, 0, 20)
    self.sliderButton.Position = UDim2.new((self.value - self.config.min) / (self.config.max - self.config.min), -10, 0.5, -10)
    self.sliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    self.sliderButton.Text = ""
    Utils.addCorner(self.sliderButton, 10)
    
    self:_setupEvents()
end

function Slider:_setupEvents()
    local UserInputService = game:GetService("UserInputService")
    
    self.sliderButton.MouseButton1Down:Connect(function()
        self.dragging = true
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if self.dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            self:_updateSlider(input)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            self.dragging = false
        end
    end)
    
    self.sliderBg.MouseButton1Down:Connect(function()
        local mouse = UserInputService:GetMouseLocation()
        self:_updateSlider({Position = Vector2.new(mouse.X, mouse.Y)})
    end)
end

function Slider:_updateSlider(input)
    local relativeX = Utils.clamp((input.Position.X - self.sliderBg.AbsolutePosition.X) / self.sliderBg.AbsoluteSize.X, 0, 1)
    self.sliderFill.Size = UDim2.new(relativeX, 0, 1, 0)
    self.sliderButton.Position = UDim2.new(relativeX, -10, 0.5, -10)
    self.value = math.floor(self.config.min + relativeX * (self.config.max - self.config.min))
    self.label.Text = self.config.label .. ": " .. self.value
    self.config.callback(self.value)
end

function Slider:setValue(value)
    self.value = Utils.clamp(value, self.config.min, self.config.max)
    local relativeX = (self.value - self.config.min) / (self.config.max - self.config.min)
    self.sliderFill.Size = UDim2.new(relativeX, 0, 1, 0)
    self.sliderButton.Position = UDim2.new(relativeX, -10, 0.5, -10)
    self.label.Text = self.config.label .. ": " .. self.value
end

return Slider
