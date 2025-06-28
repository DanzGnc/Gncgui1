
-- Dropdown Component
local Theme = require(script.Parent.Parent.Theme)
local Utils = require(script.Parent.Parent.Utils)

local Dropdown = {}
Dropdown.__index = Dropdown

function Dropdown.new(parent, config)
    local self = setmetatable({}, Dropdown)
    
    self.config = Utils.mergeConfig({
        label = "Dropdown:",
        options = {"Option 1", "Option 2", "Option 3"},
        default = "Option 1",
        callback = function(selected) end,
        size = {0.9, 50}
    }, config or {})
    
    self.currentSelection = self.config.default
    self.isOpen = false
    self:_create(parent)
    return self
end

function Dropdown:_create(parent)
    self.frame = Instance.new("Frame")
    self.frame.Parent = parent
    self.frame.Size = UDim2.new(self.config.size[1], 0, 0, self.config.size[2])
    self.frame.BackgroundColor3 = Theme.colors.component
    Utils.addCorner(self.frame, Theme.sizes.cornerRadius)
    
    self.label = Instance.new("TextLabel")
    self.label.Parent = self.frame
    self.label.Size = UDim2.new(0.3, 0, 1, 0)
    self.label.Text = self.config.label
    self.label.TextColor3 = Theme.colors.text
    self.label.Font = Theme.fonts.semibold
    self.label.TextSize = 14
    self.label.BackgroundTransparency = 1
    self.label.TextXAlignment = Enum.TextXAlignment.Left
    
    self.button = Instance.new("TextButton")
    self.button.Parent = self.frame
    self.button.Size = UDim2.new(0.65, 0, 0.8, 0)
    self.button.Position = UDim2.new(0.33, 0, 0.1, 0)
    self.button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    self.button.Text = self.currentSelection .. " ▼"
    self.button.TextColor3 = Color3.fromRGB(255, 255, 255)
    self.button.Font = Theme.fonts.regular
    self.button.TextSize = 14
    Utils.addCorner(self.button, 4)
    
    self.list = Instance.new("Frame")
    self.list.Parent = self.frame
    self.list.Size = UDim2.new(0.65, 0, 0, #self.config.options * 30)
    self.list.Position = UDim2.new(0.33, 0, 1, 5)
    self.list.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    self.list.Visible = false
    self.list.ZIndex = 10
    Utils.addCorner(self.list, 4)
    
    self:_createOptions()
    self:_setupEvents()
end

function Dropdown:_createOptions()
    for i, option in ipairs(self.config.options) do
        local optionButton = Instance.new("TextButton")
        optionButton.Parent = self.list
        optionButton.Size = UDim2.new(1, 0, 0, 30)
        optionButton.Position = UDim2.new(0, 0, 0, (i-1) * 30)
        optionButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        optionButton.Text = option
        optionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        optionButton.Font = Theme.fonts.regular
        optionButton.TextSize = 12
        optionButton.BorderSizePixel = 0
        
        if i < #self.config.options then
            local divider = Instance.new("Frame")
            divider.Parent = optionButton
            divider.Size = UDim2.new(1, 0, 0, 1)
            divider.Position = UDim2.new(0, 0, 1, 0)
            divider.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            divider.BorderSizePixel = 0
        end
        
        optionButton.MouseButton1Click:Connect(function()
            self:_selectOption(option)
        end)
        
        optionButton.MouseEnter:Connect(function()
            optionButton.BackgroundColor3 = Theme.colors.componentHover
        end)
        
        optionButton.MouseLeave:Connect(function()
            optionButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        end)
    end
end

function Dropdown:_setupEvents()
    self.button.MouseButton1Click:Connect(function()
        self:_toggle()
    end)
end

function Dropdown:_toggle()
    self.isOpen = not self.isOpen
    self.list.Visible = self.isOpen
    if self.isOpen then
        self.button.Text = self.currentSelection .. " ▲"
    else
        self.button.Text = self.currentSelection .. " ▼"
    end
end

function Dropdown:_selectOption(option)
    self.currentSelection = option
    self.button.Text = option .. " ▼"
    self.list.Visible = false
    self.isOpen = false
    self.config.callback(option)
end

function Dropdown:setSelection(option)
    if table.find(self.config.options, option) then
        self.currentSelection = option
        self.button.Text = option .. " ▼"
    end
end

return Dropdown
