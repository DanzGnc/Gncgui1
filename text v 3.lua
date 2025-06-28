-- **Inisialisasi GUI**
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Header = Instance.new("Frame")
local CloseButton = Instance.new("TextButton")
local MinimizeButton = Instance.new("TextButton")
local TitleLabel = Instance.new("TextLabel") -- Teks pembuat
local Sidebar = Instance.new("ScrollingFrame") -- Sidebar dengan scroll
local TabsContainer = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local UIPaddingForTabs = Instance.new("UIPadding") -- Padding untuk tab
local ContentFrame = Instance.new("ScrollingFrame") -- Konten dalam tab
local LogoButton = Instance.new("TextButton")

ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "GncUIScreenGui"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling -- Ensure proper layering

-- **Main Frame (Body)**
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 550, 0, 350) -- Sedikit lebih besar
MainFrame.Position = UDim2.new(0.5, -275, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Warna dasar lebih gelap
MainFrame.BackgroundTransparency = 0.1 -- Sedikit lebih transparan
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
local MainFrameCorner = Instance.new("UICorner", MainFrame)
MainFrameCorner.CornerRadius = UDim.new(0, 8)

-- **Header (Top Bar)**
Header.Name = "Header"
Header.Parent = MainFrame
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundColor3 = Color3.fromRGB(20, 20, 20) -- Warna header lebih gelap
Header.BackgroundTransparency = 0
Header.BorderSizePixel = 0
local HeaderCorner = Instance.new("UICorner", Header)
HeaderCorner.CornerRadius = UDim.new(0, 8) -- Hanya sudut atas yang rounded
-- Mengatur agar sudut bawah Header tidak rounded karena akan menempel dengan Sidebar & ContentFrame
-- Ini bisa dilakukan dengan Frame lain sebagai background atau dengan Image jika ingin lebih presisi

-- **Teks Pembuat**
TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = Header
TitleLabel.Size = UDim2.new(0.6, 0, 1, 0) -- Lebar disesuaikan
TitleLabel.Position = UDim2.new(0.05, 0, 0, 0) -- Posisi sedikit ke kanan
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "Gnc UI || Version 1.1"
TitleLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
TitleLabel.Font = Enum.Font.GothamSemibold -- Font lebih modern
TitleLabel.TextSize = 18
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- **Tombol Close ("X")**
CloseButton.Name = "CloseButton"
CloseButton.Parent = Header
CloseButton.Size = UDim2.new(0, 35, 0, 35) -- Ukuran disesuaikan
CloseButton.Position = UDim2.new(1, -40, 0.5, -17.5) -- Posisi di tengah vertikal
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
CloseButton.BackgroundTransparency = 0.2
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 18
CloseButton.BorderSizePixel = 0
local CloseButtonCorner = Instance.new("UICorner", CloseButton)
CloseButtonCorner.CornerRadius = UDim.new(0, 6)

-- **Tombol Minimize ("-")**
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = Header
MinimizeButton.Size = UDim2.new(0, 35, 0, 35)
MinimizeButton.Position = UDim2.new(1, -80, 0.5, -17.5)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 180, 70)
MinimizeButton.BackgroundTransparency = 0.2
MinimizeButton.Text = "—" -- Karakter minimize yang lebih baik
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextSize = 18
MinimizeButton.BorderSizePixel = 0
local MinimizeButtonCorner = Instance.new("UICorner", MinimizeButton)
MinimizeButtonCorner.CornerRadius = UDim.new(0, 6)

-- **Sidebar dengan Scroll**
Sidebar.Name = "Sidebar"
Sidebar.Parent = MainFrame
Sidebar.Size = UDim2.new(0, 130, 1, -40) -- Lebar sidebar disesuaikan
Sidebar.Position = UDim2.new(0, 0, 0, 40)
Sidebar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Sidebar.BackgroundTransparency = 0
Sidebar.BorderSizePixel = 0
Sidebar.ScrollBarThickness = 6
Sidebar.ScrollBarImageColor3 = Color3.fromRGB(80,80,80)
Sidebar.CanvasSize = UDim2.new(0, 0, 0, 0) -- Akan diatur oleh UIListLayout
local SidebarCorner = Instance.new("UICorner", Sidebar)
SidebarCorner.CornerRadius = UDim.new(0, 6) -- Hanya sudut kiri bawah yang rounded

TabsContainer.Name = "TabsContainer"
TabsContainer.Parent = Sidebar
TabsContainer.Size = UDim2.new(1, 0, 0, 0) -- Ukuran diatur oleh UIListLayout
TabsContainer.AutomaticSize = Enum.AutomaticSize.Y
TabsContainer.BackgroundTransparency = 1
TabsContainer.ClipsDescendants = true -- Penting agar UICorner pada tab bekerja

UIListLayout.Parent = TabsContainer
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5) -- Jarak antar tab
UIListLayout.FillDirection = Enum.FillDirection.Vertical
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

UIPaddingForTabs.Parent = TabsContainer
UIPaddingForTabs.PaddingTop = UDim.new(0, 10)
UIPaddingForTabs.PaddingBottom = UDim.new(0, 10)
UIPaddingForTabs.PaddingLeft = UDim.new(0, 5)
UIPaddingForTabs.PaddingRight = UDim.new(0, 5)


-- **Frame Konten dalam Tab (Scrolling)**
ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = MainFrame
ContentFrame.Size = UDim2.new(1, -140, 1, -50) -- Disesuaikan dengan sidebar dan padding
ContentFrame.Position = UDim2.new(0, 135, 0, 45) -- Disesuaikan
ContentFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ContentFrame.BackgroundTransparency = 0
ContentFrame.BorderSizePixel = 0
ContentFrame.ScrollBarThickness = 6
ContentFrame.ScrollBarImageColor3 = Color3.fromRGB(80,80,80)
ContentFrame.CanvasSize = UDim2.new(0, 0, 1, 0) -- Default, bisa diatur per tab
ContentFrame.ClipsDescendants = true
local ContentFrameCorner = Instance.new("UICorner", ContentFrame)
ContentFrameCorner.CornerRadius = UDim.new(0, 8)
local ContentPadding = Instance.new("UIPadding", ContentFrame)
ContentPadding.PaddingTop = UDim.new(0,10)
ContentPadding.PaddingBottom = UDim.new(0,10)
ContentPadding.PaddingLeft = UDim.new(0,10)
ContentPadding.PaddingRight = UDim.new(0,10)


local currentActiveTabButton = nil
local defaultTabButtonColor = Color3.fromRGB(60, 60, 60)
local activeTabButtonColor = Color3.fromRGB(80, 80, 120) -- Warna ungu untuk tab aktif

-- **Fungsi untuk Membuat Tab**
local function createTab(name, order)
    local TabButton = Instance.new("TextButton")
    TabButton.Name = name .. "TabButton"
    TabButton.Parent = TabsContainer
    TabButton.Size = UDim2.new(1, -10, 0, 35) -- -10 untuk padding kiri kanan dari UIPaddingForTabs
    TabButton.BackgroundColor3 = defaultTabButtonColor
    TabButton.Text = name
    TabButton.TextColor3 = Color3.fromRGB(210, 210, 210)
    TabButton.Font = Enum.Font.GothamSemibold
    TabButton.TextSize = 16
    TabButton.BorderSizePixel = 0
    TabButton.LayoutOrder = order
    local TabCorner = Instance.new("UICorner", TabButton)
    TabCorner.CornerRadius = UDim.new(0, 6)
    return TabButton
end

-- **Menambahkan Tab**
local tabButtons = {}
tabButtons["Main"] = createTab("Main", 1)
tabButtons["Settings"] = createTab("Settings", 2)
tabButtons["Info"] = createTab("Info", 3)
tabButtons["Another"] = createTab("Another", 4) -- Contoh tab tambahan
tabButtons["Extra"] = createTab("Extra Tab", 5) -- Contoh tab tambahan lagi

-- **Tombol Logo untuk Menampilkan GUI**
LogoButton.Name = "LogoButton"
LogoButton.Parent = ScreenGui
LogoButton.Text = "G" -- Disingkat agar muat di lingkaran
LogoButton.Size = UDim2.new(0, 60, 0, 60) -- Ukuran diperbesar
LogoButton.Position = UDim2.new(0.02, 0, 0.98, -60) -- Posisi di kiri bawah
LogoButton.BackgroundColor3 = Color3.fromRGB(40,40,40) -- Warna dasar logo
LogoButton.TextColor3 = Color3.fromRGB(255, 255, 255)
LogoButton.Font = Enum.Font.GothamBold
LogoButton.TextSize = 30
LogoButton.Draggable = true
LogoButton.BorderSizePixel = 0

local UIGradientLogo = Instance.new("UIGradient", LogoButton)
UIGradientLogo.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 100)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(150, 0, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 100, 255))
}
UIGradientLogo.Rotation = 45

local UICornerLogo = Instance.new("UICorner", LogoButton)
UICornerLogo.CornerRadius = UDim.new(0.5, 0) -- Membuatnya bulat sempurna

-- **Fungsi untuk Membersihkan Konten Tab**
local function clearContentFrame()
    for _, child in ipairs(ContentFrame:GetChildren()) do
        if not (child:IsA("UIPadding") or child:IsA("UICorner") or child:IsA("UIListLayout") or child:IsA("UIGridLayout")) then
            child:Destroy()
        end
    end
    -- Reset CanvasSize jika diperlukan, atau biarkan konten baru yang mengaturnya
    -- ContentFrame.CanvasSize = UDim2.new(0,0,0,0) 
end

-- **Fungsi untuk Membuat Konten Tab**
local function createMainTabContent()
    local mainContentLayout = Instance.new("UIListLayout", ContentFrame)
    mainContentLayout.Padding = UDim.new(0, 10)
    mainContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    mainContentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

    local sampleButton = Instance.new("TextButton")
    sampleButton.Name = "SampleButtonMain"
    sampleButton.Parent = ContentFrame
    sampleButton.Size = UDim2.new(0.8, 0, 0, 40)
    sampleButton.BackgroundColor3 = Color3.fromRGB(70, 130, 200)
    sampleButton.Text = "Tombol Contoh di Main"
    sampleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    sampleButton.Font = Enum.Font.Gotham
    sampleButton.TextSize = 16
    local btnCorner = Instance.new("UICorner", sampleButton)
    btnCorner.CornerRadius = UDim.new(0, 6)
    sampleButton.LayoutOrder = 1

    sampleButton.MouseButton1Click:Connect(function()
        print("Tombol di tab Main ditekan!")
        sampleButton.Text = "Ditekan!"
        wait(1)
        sampleButton.Text = "Tombol Contoh di Main"
    end)

    local anotherLabel = Instance.new("TextLabel")
    anotherLabel.Name = "AnotherLabelMain"
    anotherLabel.Parent = ContentFrame
    anotherLabel.Size = UDim2.new(0.9, 0, 0, 60)
    anotherLabel.BackgroundColor3 = Color3.fromRGB(55,55,55)
    local lblCorner = Instance.new("UICorner", anotherLabel)
    lblCorner.CornerRadius = UDim.new(0,4)
    anotherLabel.Text = "Ini adalah beberapa teks deskriptif di dalam tab Main. Anda bisa menambahkan lebih banyak elemen di sini."
    anotherLabel.TextColor3 = Color3.fromRGB(200,200,200)
    anotherLabel.Font = Enum.Font.Gotham
    anotherLabel.TextSize = 14
    anotherLabel.TextWrapped = true
    anotherLabel.LayoutOrder = 2
end

local function createSettingsTabContent()
    local settingsContentLayout = Instance.new("UIListLayout", ContentFrame)
    settingsContentLayout.Padding = UDim.new(0, 10)
    settingsContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    settingsContentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left -- Align ke kiri untuk setting

    local settingTitle = Instance.new("TextLabel")
    settingTitle.Name = "SettingTitle"
    settingTitle.Parent = ContentFrame
    settingTitle.Size = UDim2.new(1, -20, 0, 30) -- -20 untuk padding ContentFrame
    settingTitle.Text = "Pengaturan Aplikasi"
    settingTitle.Font = Enum.Font.GothamBold
    settingTitle.TextSize = 18
    settingTitle.TextColor3 = Color3.fromRGB(220,220,220)
    settingTitle.BackgroundTransparency = 1
    settingTitle.TextXAlignment = Enum.TextXAlignment.Left
    settingTitle.LayoutOrder = 1

    -- Contoh Toggle Switch
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Name = "ToggleFrame"
    toggleFrame.Parent = ContentFrame
    toggleFrame.Size = UDim2.new(1, -20, 0, 40)
    toggleFrame.BackgroundTransparency = 1
    toggleFrame.LayoutOrder = 2

    local toggleLabel = Instance.new("TextLabel", toggleFrame)
    toggleLabel.Size = UDim2.new(0.7, -5, 1, 0) -- -5 untuk spasi
    toggleLabel.Text = "Aktifkan Fitur Keren:"
    toggleLabel.Font = Enum.Font.Gotham
    toggleLabel.TextSize = 15
    toggleLabel.TextColor3 = Color3.fromRGB(200,200,200)
    toggleLabel.BackgroundTransparency = 1
    toggleLabel.TextXAlignment = Enum.TextXAlignment.Left

    local toggleButton = Instance.new("TextButton", toggleFrame)
    toggleButton.Size = UDim2.new(0.3, 0, 1, 0)
    toggleButton.Position = UDim2.new(0.7, 5, 0, 0) -- 5 untuk spasi
    toggleButton.Text = "OFF"
    toggleButton.BackgroundColor3 = Color3.fromRGB(200, 80, 80)
    toggleButton.TextColor3 = Color3.fromRGB(255,255,255)
    toggleButton.Font = Enum.Font.GothamBold
    toggleButton.TextSize = 14
    local toggleBtnCorner = Instance.new("UICorner", toggleButton)
    toggleBtnCorner.CornerRadius = UDim.new(0,6)
    
    local isToggleOn = false
    toggleButton.MouseButton1Click:Connect(function()
        isToggleOn = not isToggleOn
        if isToggleOn then
            toggleButton.Text = "ON"
            toggleButton.BackgroundColor3 = Color3.fromRGB(80, 200, 80)
            print("Fitur Keren: ON")
        else
            toggleButton.Text = "OFF"
            toggleButton.BackgroundColor3 = Color3.fromRGB(200, 80, 80)
            print("Fitur Keren: OFF")
        end
    end)
end

local function createInfoTabContent()
    local infoContentLayout = Instance.new("UIListLayout", ContentFrame)
    infoContentLayout.Padding = UDim.new(0, 10)
    infoContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    infoContentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left

    local infoTitle = Instance.new("TextLabel")
    infoTitle.Name = "InfoTitle"
    infoTitle.Parent = ContentFrame
    infoTitle.Size = UDim2.new(1, -20, 0, 30)
    infoTitle.Text = "Informasi Gnc UI"
    infoTitle.Font = Enum.Font.GothamBold
    infoTitle.TextSize = 18
    infoTitle.TextColor3 = Color3.fromRGB(220,220,220)
    infoTitle.BackgroundTransparency = 1
    infoTitle.TextXAlignment = Enum.TextXAlignment.Left
    infoTitle.LayoutOrder = 1
    
    local infoText = Instance.new("TextLabel")
    infoText.Name = "InfoText"
    infoText.Parent = ContentFrame
    infoText.Size = UDim2.new(1, -20, 0, 100) -- Tinggi disesuaikan
    infoText.Text = "Gnc UI Version 1.1\nDibuat oleh [Nama Anda/Tim Anda].\n\nIni adalah contoh antarmuka pengguna yang dibuat dengan Lua di Roblox Studio. Terima kasih telah menggunakan!"
    infoText.TextColor3 = Color3.fromRGB(180, 180, 180)
    infoText.Font = Enum.Font.Gotham
    infoText.TextSize = 14
    infoText.TextWrapped = true
    infoText.TextXAlignment = Enum.TextXAlignment.Left
    infoText.TextYAlignment = Enum.TextYAlignment.Top
    infoText.BackgroundTransparency = 1
    infoText.LayoutOrder = 2
end

-- **Fungsi Toggle GUI**
local function toggleGUI()
    MainFrame.Visible = not MainFrame.Visible
    if MainFrame.Visible and not currentActiveTabButton then
        -- Secara otomatis pilih tab pertama saat GUI dibuka jika belum ada yang aktif
        if tabButtons["Main"] then
             tabButtons["Main"].MouseButton1Click:Fire() -- Panggil event klik tab pertama
        end
    end
end

LogoButton.MouseButton1Click:Connect(toggleGUI)

-- **Fungsi Minimize & Exit**
CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

MinimizeButton.MouseButton1Click:Connect(function()
    -- Implementasi minimize yang sebenarnya bisa lebih kompleks (misal, pindah ke sudut)
    -- Untuk sekarang, sama seperti close
    MainFrame.Visible = false 
end)

-- **Fungsi Tab Switching**
local function switchTab(tabName, tabButton)
    clearContentFrame() -- Bersihkan konten lama
    ContentFrame.CanvasPosition = Vector2.new(0, 0) -- Reset scroll

    -- Hapus UIListLayout lama jika ada, agar tidak duplikat
    local oldLayout = ContentFrame:FindFirstChildOfClass("UIListLayout")
    if oldLayout then
        oldLayout:Destroy()
    end
    
    if currentActiveTabButton then
        currentActiveTabButton.BackgroundColor3 = defaultTabButtonColor
        currentActiveTabButton.TextColor3 = Color3.fromRGB(210, 210, 210)
    end
    
    tabButton.BackgroundColor3 = activeTabButtonColor
    tabButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- Teks lebih terang untuk tab aktif
    currentActiveTabButton = tabButton

    print("Berpindah ke tab: " .. tabName)
    if tabName == "Main" then
        createMainTabContent()
    elseif tabName == "Settings" then
        createSettingsTabContent()
    elseif tabName == "Info" then
        createInfoTabContent()
    elseif tabName == "Another" then
        -- Contoh konten untuk tab "Another"
        local anotherLabel = Instance.new("TextLabel", ContentFrame)
        anotherLabel.Size = UDim2.new(1,-20,0,50)
        anotherLabel.Text = "Ini adalah konten untuk 'Another Tab'."
        anotherLabel.Font = Enum.Font.Gotham
        anotherLabel.TextSize = 16
        anotherLabel.TextColor3 = Color3.fromRGB(200,200,200)
        anotherLabel.BackgroundTransparency = 1
    elseif tabName == "Extra Tab" then
        -- Contoh konten untuk tab "Extra Tab"
        local extraButton = Instance.new("TextButton", ContentFrame)
        extraButton.Size = UDim2.new(0.5,0,0,40)
        extraButton.Position = UDim2.new(0.25,0,0.1,0)
        extraButton.Text = "Tombol Ekstra"
        extraButton.BackgroundColor3 = Color3.fromRGB(100,60,180)
        local ebCorner = Instance.new("UICorner", extraButton)
        ebCorner.CornerRadius = UDim.new(0,5)
        extraButton.TextColor3 = Color3.fromRGB(255,255,255)
    end
    
    -- Update CanvasSize ContentFrame berdasarkan children baru (jika menggunakan UIListLayout di ContentFrame)
    task.wait() -- Tunggu frame agar UIListLayout selesai kalkulasi
    local contentLayout = ContentFrame:FindFirstChildOfClass("UIListLayout")
    if contentLayout then
        ContentFrame.CanvasSize = UDim2.new(0,0,0, contentLayout.AbsoluteContentSize.Y + ContentPadding.PaddingTop.Offset + ContentPadding.PaddingBottom.Offset)
    else
        -- Jika tidak ada layout, atur manual atau berdasarkan elemen tunggal
        local children = ContentFrame:GetChildren()
        local totalHeight = 0
        for _, child in ipairs(children) do
            if child:IsA("GuiObject") and not (child:IsA("UIPadding") or child:IsA("UICorner")) then
                totalHeight = totalHeight + child.AbsoluteSize.Y
                -- Jika tidak ada UIListLayout, Anda mungkin perlu menambahkan spasi secara manual
            end
        end
         ContentFrame.CanvasSize = UDim2.new(0,0,0, totalHeight + ContentPadding.PaddingTop.Offset + ContentPadding.PaddingBottom.Offset)
    end
end

-- Hubungkan event klik untuk setiap tombol tab
for name, button in pairs(tabButtons) do
    button.MouseButton1Click:Connect(function()
        switchTab(name, button)
    end)
end

-- Inisialisasi tab pertama saat GUI pertama kali terlihat (jika belum ada yang aktif)
local initialVisibilityConnection
initialVisibilityConnection = MainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
    if MainFrame.Visible and not currentActiveTabButton then
        if tabButtons["Main"] then
            switchTab("Main", tabButtons["Main"])
        end
        -- Koneksi ini hanya perlu dijalankan sekali untuk inisialisasi
        if initialVisibilityConnection then
            initialVisibilityConnection:Disconnect()
            initialVisibilityConnection = nil
        end
    end
end)

print("Gnc UI Script Loaded. Klik tombol 'G' untuk membuka.")

