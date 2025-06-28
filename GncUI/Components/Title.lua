
-- Title komponen
local Theme = loadstring(game:HttpGet("https://raw.githubusercontent.com/DanzGnc/Gncgui1/refs/heads/main/GncUI/Theme.lua"))()
local Utils = loadstring(game:HttpGet("https://raw.githubusercontent.com/DanzGnc/Gncgui1/refs/heads/main/GncUI/Utils.lua"))()

local Title = {}
Title.__index = Title

function Title.new(parent, config)
    local self = setmetatable({}, Title)
    
    self.config = Utils.mergeConfig({
        text = "Title",
        size = {1, 30},
        textColor = Theme.colors.text,
        textSize = Theme.sizes.titleSize,
        font = Theme.fonts.bold,
        textXAlignment = Enum.TextXAlignment.Left
    }, config or {})
    
    self:_create(parent)
    return self
end

function Title:_create(parent)
    self.title = Instance.new("TextLabel")
    self.title.Parent = parent
    self.title.Size = UDim2.new(self.config.size[1], -20, 0, self.config.size[2])
    self.title.BackgroundTransparency = 1
    self.title.Text = self.config.text
    self.title.TextColor3 = self.config.textColor
    self.title.Font = self.config.font
    self.title.TextSize = self.config.textSize
    self.title.TextXAlignment = self.config.textXAlignment
end

function Title:setText(text)
    self.title.Text = text
end

return Title
