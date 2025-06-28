
-- Main entry point untuk GUI Library
-- Load GncUI from GitHub for Roblox compatibility
local GncUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/[username]/[repository]/main/GncUI/init.lua"))()

-- Inisialisasi GUI
local gui = GncUI.new({
    title = "Gnc UI || Version 1.1",
    size = {550, 350},
    position = {0.5, 0.5}, -- center
    draggable = true
})

-- Tambahkan tabs
gui:addTab("Main", function(contentFrame)
    local components = GncUI.Components
    
    -- Button
    local button = components.Button(contentFrame, {
        text = "Tombol Contoh di Main",
        size = {0.8, 40},
        color = Color3.fromRGB(70, 130, 200),
        callback = function(btn)
            print("Tombol di tab Main ditekan!")
            btn:setText("Ditekan!")
            task.wait(1)
            btn:setText("Tombol Contoh di Main")
        end
    })
    
    -- Slider
    local slider = components.Slider(contentFrame, {
        label = "Volume",
        min = 0,
        max = 100,
        default = 50,
        callback = function(value)
            print("Volume changed to:", value)
        end
    })
    
    -- Dropdown
    local dropdown = components.Dropdown(contentFrame, {
        label = "Theme:",
        options = {"Dark Theme", "Light Theme", "Blue Theme", "Red Theme"},
        default = "Dark Theme",
        callback = function(selected)
            print("Selected theme:", selected)
        end
    })
    
    -- Text Label
    local label = components.Label(contentFrame, {
        text = "Ini adalah beberapa teks deskriptif di dalam tab Main. Anda bisa menambahkan lebih banyak elemen di sini.",
        size = {0.9, 60},
        color = Color3.fromRGB(55, 55, 55)
    })
end)

gui:addTab("Settings", function(contentFrame)
    local components = GncUI.Components
    
    local title = components.Title(contentFrame, {
        text = "Pengaturan Aplikasi"
    })
    
    local toggle = components.Toggle(contentFrame, {
        label = "Aktifkan Fitur Keren:",
        default = false,
        callback = function(state)
            print("Fitur Keren:", state and "ON" or "OFF")
        end
    })
end)

gui:addTab("Info", function(contentFrame)
    local components = GncUI.Components
    
    local title = components.Title(contentFrame, {
        text = "Informasi Gnc UI"
    })
    
    local info = components.Label(contentFrame, {
        text = "Gnc UI Version 1.1\nDibuat dengan modular library system.\n\nIni adalah contoh antarmuka pengguna yang dibuat dengan Lua di Roblox Studio. Terima kasih telah menggunakan!",
        size = {1, 100},
        textSize = 14
    })
end)

-- Tampilkan GUI
gui:show()

print("Gnc UI Library Loaded. Klik tombol 'G' untuk membuka.")
