
-- Theme System
local Theme = {}

Theme.colors = {
    background = Color3.fromRGB(30, 30, 30),
    header = Color3.fromRGB(20, 20, 20),
    sidebar = Color3.fromRGB(40, 40, 40),
    content = Color3.fromRGB(50, 50, 50),
    text = Color3.fromRGB(220, 220, 220),
    textSecondary = Color3.fromRGB(180, 180, 180),
    accent = Color3.fromRGB(80, 80, 120),
    button = Color3.fromRGB(70, 130, 200),
    buttonHover = Color3.fromRGB(90, 150, 220),
    success = Color3.fromRGB(80, 200, 80),
    error = Color3.fromRGB(200, 80, 80),
    warning = Color3.fromRGB(255, 180, 70),
    scrollbar = Color3.fromRGB(80, 80, 80),
    logo = Color3.fromRGB(40, 40, 40),
    tabDefault = Color3.fromRGB(60, 60, 60),
    tabActive = Color3.fromRGB(80, 80, 120),
    component = Color3.fromRGB(55, 55, 55),
    componentHover = Color3.fromRGB(70, 70, 70)
}

Theme.fonts = {
    regular = Enum.Font.Gotham,
    semibold = Enum.Font.GothamSemibold,
    bold = Enum.Font.GothamBold
}

Theme.sizes = {
    cornerRadius = 6,
    padding = 10,
    spacing = 5,
    headerHeight = 40,
    sidebarWidth = 130,
    buttonHeight = 35,
    textSize = 14,
    titleSize = 18
}

-- Theme switching capability
function Theme.setTheme(themeName)
    if themeName == "light" then
        Theme.colors.background = Color3.fromRGB(240, 240, 240)
        Theme.colors.header = Color3.fromRGB(230, 230, 230)
        Theme.colors.sidebar = Color3.fromRGB(220, 220, 220)
        Theme.colors.content = Color3.fromRGB(255, 255, 255)
        Theme.colors.text = Color3.fromRGB(30, 30, 30)
        Theme.colors.textSecondary = Color3.fromRGB(60, 60, 60)
        -- Add more light theme colors...
    elseif themeName == "blue" then
        Theme.colors.background = Color3.fromRGB(20, 30, 50)
        Theme.colors.header = Color3.fromRGB(15, 25, 45)
        Theme.colors.sidebar = Color3.fromRGB(25, 35, 55)
        Theme.colors.content = Color3.fromRGB(30, 40, 60)
        -- Add more blue theme colors...
    end
    -- Add more themes as needed
end

return Theme
-- Theme Configuration
local Theme = {}

Theme.colors = {
    background = {30, 30, 30},
    header = {20, 20, 20},
    sidebar = {40, 40, 40},
    content = {50, 50, 50},
    text = {220, 220, 220},
    elementBackground = {55, 55, 55},
    scrollbar = {80, 80, 80},
    logo = {40, 40, 40}
}

Theme.fonts = {
    regular = "default",
    semibold = "semibold",
    bold = "bold"
}

Theme.sizes = {
    textSize = 14,
    titleSize = 18,
    headerSize = 16
}

return Theme
