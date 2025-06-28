
-- Components System
local Components = {}

-- Import individual components using loadstring for Roblox compatibility
Components.Button = loadstring(game:HttpGet("https://raw.githubusercontent.com/YourUsername/YourRepository/main/GncUI/Components/Button.lua"))()
Components.Label = loadstring(game:HttpGet("https://raw.githubusercontent.com/YourUsername/YourRepository/main/GncUI/Components/Label.lua"))()
Components.Title = loadstring(game:HttpGet("https://raw.githubusercontent.com/YourUsername/YourRepository/main/GncUI/Components/Title.lua"))()
Components.Slider = loadstring(game:HttpGet("https://raw.githubusercontent.com/YourUsername/YourRepository/main/GncUI/Components/Slider.lua"))()
Components.Dropdown = loadstring(game:HttpGet("https://raw.githubusercontent.com/YourUsername/YourRepository/main/GncUI/Components/Dropdown.lua"))()
Components.Toggle = loadstring(game:HttpGet("https://raw.githubusercontent.com/YourUsername/YourRepository/main/GncUI/Components/Toggle.lua"))()
Components.TabButton = loadstring(game:HttpGet("https://raw.githubusercontent.com/YourUsername/YourRepository/main/GncUI/Components/TabButton.lua"))()
Components.HeaderButton = loadstring(game:HttpGet("https://raw.githubusercontent.com/YourUsername/YourRepository/main/GncUI/Components/HeaderButton.lua"))()

return Components
