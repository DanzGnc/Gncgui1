
-- GncUI Library - Main Module
local GncUI = {}
GncUI.__index = GncUI

-- Import submodules using loadstring for Roblox compatibility
local Theme = loadstring(game:HttpGet("https://raw.githubusercontent.com/YourUsername/YourRepository/main/GncUI/Theme.lua"))()
local Components = loadstring(game:HttpGet("https://raw.githubusercontent.com/YourUsername/YourRepository/main/GncUI/Components/init.lua"))()
local Utils = loadstring(game:HttpGet("https://raw.githubusercontent.com/YourUsername/YourRepository/main/GncUI/Utils.lua"))()

-- Export Components untuk akses mudah
GncUI.Components = Components
GncUI.Theme = Theme
GncUI.Utils = Utils

-- Constructor
function GncUI.new(config)
    local self = setmetatable({}, GncUI)
    
    -- Default configuration
    self.config = Utils.mergeConfig({
        title = "Gnc UI",
        size = {550, 350},
        position = {0.5, 0.5},
        draggable = true,
        theme = "dark"
    }, config or {})
    
    self.tabs = {}
    self.currentTab = nil
    self.isVisible = false
    
    self:_initialize()
    return self
end

-- Initialize GUI
function GncUI:_initialize()
    self:_createScreenGui()
    self:_createMainFrame()
    self:_createHeader()
    self:_createSidebar()
    self:_createContentFrame()
    self:_createLogoButton()
    self:_setupEvents()
end

function GncUI:_createScreenGui()
    self.screenGui = Instance.new("ScreenGui")
    self.screenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    self.screenGui.Name = "GncUIScreenGui"
    self.screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
end

function GncUI:_createMainFrame()
    self.mainFrame = Instance.new("Frame")
    self.mainFrame.Name = "MainFrame"
    self.mainFrame.Parent = self.screenGui
    self.mainFrame.Size = UDim2.new(0, self.config.size[1], 0, self.config.size[2])
    self.mainFrame.Position = UDim2.new(self.config.position[1], -self.config.size[1]/2, self.config.position[2], -self.config.size[2]/2)
    self.mainFrame.BackgroundColor3 = Theme.colors.background
    self.mainFrame.BackgroundTransparency = 0.1
    self.mainFrame.BorderSizePixel = 0
    self.mainFrame.Visible = false
    self.mainFrame.Active = true
    self.mainFrame.Draggable = self.config.draggable
    
    local corner = Instance.new("UICorner", self.mainFrame)
    corner.CornerRadius = UDim.new(0, 8)
end

function GncUI:_createHeader()
    self.header = Instance.new("Frame")
    self.header.Name = "Header"
    self.header.Parent = self.mainFrame
    self.header.Size = UDim2.new(1, 0, 0, 40)
    self.header.BackgroundColor3 = Theme.colors.header
    self.header.BorderSizePixel = 0
    
    local corner = Instance.new("UICorner", self.header)
    corner.CornerRadius = UDim.new(0, 8)
    
    -- Title
    self.titleLabel = Instance.new("TextLabel")
    self.titleLabel.Parent = self.header
    self.titleLabel.Size = UDim2.new(0.6, 0, 1, 0)
    self.titleLabel.Position = UDim2.new(0.05, 0, 0, 0)
    self.titleLabel.BackgroundTransparency = 1
    self.titleLabel.Text = self.config.title
    self.titleLabel.TextColor3 = Theme.colors.text
    self.titleLabel.Font = Theme.fonts.semibold
    self.titleLabel.TextSize = 18
    self.titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Close Button
    self.closeButton = Components.HeaderButton(self.header, {
        text = "X",
        color = Color3.fromRGB(255, 70, 70),
        position = UDim2.new(1, -40, 0.5, -17.5),
        callback = function()
            self:hide()
        end
    })
    
    -- Minimize Button
    self.minimizeButton = Components.HeaderButton(self.header, {
        text = "—",
        color = Color3.fromRGB(255, 180, 70),
        position = UDim2.new(1, -80, 0.5, -17.5),
        callback = function()
            self:hide()
        end
    })
end

function GncUI:_createSidebar()
    self.sidebar = Instance.new("ScrollingFrame")
    self.sidebar.Name = "Sidebar"
    self.sidebar.Parent = self.mainFrame
    self.sidebar.Size = UDim2.new(0, 130, 1, -40)
    self.sidebar.Position = UDim2.new(0, 0, 0, 40)
    self.sidebar.BackgroundColor3 = Theme.colors.sidebar
    self.sidebar.BorderSizePixel = 0
    self.sidebar.ScrollBarThickness = 6
    self.sidebar.ScrollBarImageColor3 = Theme.colors.scrollbar
    
    local corner = Instance.new("UICorner", self.sidebar)
    corner.CornerRadius = UDim.new(0, 6)
    
    self.tabsContainer = Instance.new("Frame")
    self.tabsContainer.Name = "TabsContainer"
    self.tabsContainer.Parent = self.sidebar
    self.tabsContainer.Size = UDim2.new(1, 0, 0, 0)
    self.tabsContainer.AutomaticSize = Enum.AutomaticSize.Y
    self.tabsContainer.BackgroundTransparency = 1
    
    local layout = Instance.new("UIListLayout", self.tabsContainer)
    layout.Padding = UDim.new(0, 5)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    
    local padding = Instance.new("UIPadding", self.tabsContainer)
    padding.PaddingTop = UDim.new(0, 10)
    padding.PaddingBottom = UDim.new(0, 10)
    padding.PaddingLeft = UDim.new(0, 5)
    padding.PaddingRight = UDim.new(0, 5)
end

function GncUI:_createContentFrame()
    self.contentFrame = Instance.new("ScrollingFrame")
    self.contentFrame.Name = "ContentFrame"
    self.contentFrame.Parent = self.mainFrame
    self.contentFrame.Size = UDim2.new(1, -140, 1, -50)
    self.contentFrame.Position = UDim2.new(0, 135, 0, 45)
    self.contentFrame.BackgroundColor3 = Theme.colors.content
    self.contentFrame.BorderSizePixel = 0
    self.contentFrame.ScrollBarThickness = 6
    self.contentFrame.ScrollBarImageColor3 = Theme.colors.scrollbar
    self.contentFrame.CanvasSize = UDim2.new(0, 0, 1, 0)
    self.contentFrame.ClipsDescendants = true
    
    local corner = Instance.new("UICorner", self.contentFrame)
    corner.CornerRadius = UDim.new(0, 8)
    
    local padding = Instance.new("UIPadding", self.contentFrame)
    padding.PaddingTop = UDim.new(0, 10)
    padding.PaddingBottom = UDim.new(0, 10)
    padding.PaddingLeft = UDim.new(0, 10)
    padding.PaddingRight = UDim.new(0, 10)
end

function GncUI:_createLogoButton()
    self.logoButton = Instance.new("TextButton")
    self.logoButton.Name = "LogoButton"
    self.logoButton.Parent = self.screenGui
    self.logoButton.Text = "G"
    self.logoButton.Size = UDim2.new(0, 60, 0, 60)
    self.logoButton.Position = UDim2.new(0.02, 0, 0.98, -60)
    self.logoButton.BackgroundColor3 = Theme.colors.logo
    self.logoButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    self.logoButton.Font = Theme.fonts.bold
    self.logoButton.TextSize = 30
    self.logoButton.Draggable = true
    self.logoButton.BorderSizePixel = 0
    
    local gradient = Instance.new("UIGradient", self.logoButton)
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 100)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(150, 0, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 100, 255))
    }
    gradient.Rotation = 45
    
    local corner = Instance.new("UICorner", self.logoButton)
    corner.CornerRadius = UDim.new(0.5, 0)
end

function GncUI:_setupEvents()
    self.logoButton.MouseButton1Click:Connect(function()
        self:toggle()
    end)
end

-- Public methods
function GncUI:addTab(name, contentCreator)
    local order = #self.tabs + 1
    local tabButton = Components.TabButton(self.tabsContainer, {
        text = name,
        order = order,
        callback = function()
            self:switchTab(name)
        end
    })
    
    self.tabs[name] = {
        button = tabButton,
        contentCreator = contentCreator,
        order = order
    }
    
    -- Auto-select first tab
    if order == 1 then
        self.currentTab = name
    end
end

function GncUI:switchTab(tabName)
    if not self.tabs[tabName] then return end
    
    -- Clear old content
    Utils.clearFrame(self.contentFrame, {"UIPadding", "UICorner"})
    
    -- Update tab buttons
    if self.currentTab and self.tabs[self.currentTab] then
        self.tabs[self.currentTab].button:setActive(false)
    end
    
    self.tabs[tabName].button:setActive(true)
    self.currentTab = tabName
    
    -- Create new content
    self.tabs[tabName].contentCreator(self.contentFrame)
    
    -- Update canvas size
    task.wait()
    Utils.updateCanvasSize(self.contentFrame)
end

function GncUI:show()
    self.mainFrame.Visible = true
    self.isVisible = true
    if self.currentTab then
        self:switchTab(self.currentTab)
    end
end

function GncUI:hide()
    self.mainFrame.Visible = false
    self.isVisible = false
end

function GncUI:toggle()
    if self.isVisible then
        self:hide()
    else
        self:show()
    end
end

function GncUI:destroy()
    if self.screenGui then
        self.screenGui:Destroy()
    end
end

return GncUI
