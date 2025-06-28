-- Label Component
local Theme = require("GncUI.Theme")
local Utils = require("GncUI.Utils")

local Label = {}
Label.__index = Label

function Label.new(parent, config)
    local self = setmetatable({}, Label)

    self.config = Utils.mergeConfig({
        text = "Label",
        size = {1, 30},
        textColor = Theme.colors.text,
        textSize = Theme.sizes.textSize,
        font = Theme.fonts.regular,
        color = Theme.colors.elementBackground,
		position = nil,
        textWrapped = true,
        textXAlignment = Enum.TextXAlignment.Left,
        textYAlignment = Enum.TextYAlignment.Top
    }, config or {})

    --self:_create(parent)
    print("Created label:", self.config.text)
    return self
end

--function Label:_create(parent)
--    self.label = Instance.new("TextLabel")
--    self.label.Parent = parent
--    
--    if type(self.config.size[1]) == "number" and self.config.size[1] <= 1 then
--        self.label.Size = UDim2.new(self.config.size[1], -20, 0, self.config.size[2])
--    else
--        self.label.Size = UDim2.new(0, self.config.size[1], 0, self.config.size[2])
--    end
--    
--    if self.config.position then
--        self.label.Position = self.config.position
--    end
--    
--    if self.config.color then
--        self.label.BackgroundColor3 = self.config.color
--        self.label.BackgroundTransparency = 0
--        Utils.addCorner(self.label, 4)
--    else
--        self.label.BackgroundTransparency = 1
--    end
--    
--    self.label.Text = self.config.text
--    self.label.TextColor3 = self.config.textColor
--    self.label.Font = self.config.font
--    self.label.TextSize = self.config.textSize
--    self.label.TextWrapped = self.config.textWrapped
--    self.label.TextXAlignment = self.config.textXAlignment
--    self.label.TextYAlignment = self.config.textYAlignment
--end

function Label:setText(text)
    self.config.text = text
    --self.label.Text = text
    print("Label text updated to:", text)
end

return Label