
-- Utility Functions
local Utils = {}

-- Deep merge configuration tables
function Utils.mergeConfig(default, override)
    local result = {}
    for k, v in pairs(default) do
        result[k] = v
    end
    if override then
        for k, v in pairs(override) do
            result[k] = v
        end
    end
    return result
end

-- Clear frame contents while preserving specific children
function Utils.clearFrame(frame, preserve)
    preserve = preserve or {}
    local preserveSet = {}
    for _, className in ipairs(preserve) do
        preserveSet[className] = true
    end
    
    for _, child in ipairs(frame:GetChildren()) do
        if not preserveSet[child.ClassName] then
            child:Destroy()
        end
    end
end

-- Update canvas size for scrolling frames
function Utils.updateCanvasSize(scrollingFrame)
    local layout = scrollingFrame:FindFirstChildOfClass("UIListLayout")
    local padding = scrollingFrame:FindFirstChildOfClass("UIPadding")
    
    if layout then
        local paddingTop = padding and padding.PaddingTop.Offset or 0
        local paddingBottom = padding and padding.PaddingBottom.Offset or 0
        scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + paddingTop + paddingBottom)
    end
end

-- Create rounded corner
function Utils.addCorner(element, radius)
    local corner = Instance.new("UICorner", element)
    corner.CornerRadius = UDim.new(0, radius or 6)
    return corner
end

-- Create gradient
function Utils.addGradient(element, colors, rotation)
    local gradient = Instance.new("UIGradient", element)
    gradient.Color = colors
    gradient.Rotation = rotation or 0
    return gradient
end

-- Tween element property
function Utils.tween(element, properties, duration, style, direction)
    local TweenService = game:GetService("TweenService")
    local info = TweenInfo.new(
        duration or 0.3,
        style or Enum.EasingStyle.Quart,
        direction or Enum.EasingDirection.Out
    )
    local tween = TweenService:Create(element, info, properties)
    tween:Play()
    return tween
end

-- Clamp value between min and max
function Utils.clamp(value, min, max)
    return math.max(min, math.min(max, value))
end

-- Format number to string with specific decimal places
function Utils.formatNumber(number, decimals)
    return string.format("%." .. (decimals or 0) .. "f", number)
end

return Utils
-- Utils Module
local Utils = {}

function Utils.mergeConfig(default, config)
    local result = {}
    
    -- Copy default values
    for key, value in pairs(default) do
        result[key] = value
    end
    
    -- Override with config values
    for key, value in pairs(config) do
        result[key] = value
    end
    
    return result
end

function Utils.clearFrame(frame, excludeTypes)
    excludeTypes = excludeTypes or {}
    local excludeSet = {}
    for _, typeName in ipairs(excludeTypes) do
        excludeSet[typeName] = true
    end
    
    for _, child in ipairs(frame:GetChildren()) do
        local shouldExclude = false
        for className in pairs(excludeSet) do
            if child:IsA(className) then
                shouldExclude = true
                break
            end
        end
        
        if not shouldExclude then
            child:Destroy()
        end
    end
end

function Utils.updateCanvasSize(scrollingFrame)
    local layout = scrollingFrame:FindFirstChildOfClass("UIListLayout")
    if layout then
        local padding = scrollingFrame:FindFirstChildOfClass("UIPadding")
        local paddingTop = padding and padding.PaddingTop.Offset or 0
        local paddingBottom = padding and padding.PaddingBottom.Offset or 0
        scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + paddingTop + paddingBottom)
    end
end

return Utils
