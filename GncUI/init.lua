-- GncUI Library - Main Module
local GncUI = {}
GncUI.__index = GncUI

-- Import submodules using standard require
local Theme = require("GncUI.Theme")
local Components = require("GncUI.Components.init")
local Utils = require("GncUI.Utils")

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

-- Initialize GUI (mock implementation for standard Lua)
function GncUI:_initialize()
    print("Initializing GUI...")
    print("Title:", self.config.title)
    print("Size:", self.config.size[1] .. "x" .. self.config.size[2])

    self.tabs = {}
    self.currentTab = nil
    self.isVisible = false
end

-- Public methods
function GncUI:addTab(name, contentCreator)
    local order = #self.tabs + 1

    self.tabs[name] = {
        contentCreator = contentCreator,
        order = order
    }

    print("Added tab:", name)

    -- Auto-select first tab
    if order == 1 then
        self.currentTab = name
    end
end

function GncUI:switchTab(tabName)
    if not self.tabs[tabName] then return end

    print("Switching to tab:", tabName)
    self.currentTab = tabName

    -- Mock content creation
    local mockContentFrame = {}
    self.tabs[tabName].contentCreator(mockContentFrame)
end

function GncUI:show()
    self.isVisible = true
    print("GUI is now visible")
    if self.currentTab then
        self:switchTab(self.currentTab)
    end
end

function GncUI:hide()
    self.isVisible = false
    print("GUI is now hidden")
end

function GncUI:toggle()
    if self.isVisible then
        self:hide()
    else
        self:show()
    end
end

function GncUI:destroy()
    print("GUI destroyed")
end

return GncUI