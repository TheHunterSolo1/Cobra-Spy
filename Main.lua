--- Don't Edit It Or Else it will Break




-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- UI Setup
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local CobraSpyGui = Instance.new("ScreenGui")
CobraSpyGui.Name = "Cobra Spy"
CobraSpyGui.ResetOnSpawn = false
CobraSpyGui.Parent = PlayerGui
CobraSpyGui.DisplayOrder = 999

-- Corner label: shows name of the spy in top-left
local CornerLabel = Instance.new("TextLabel", CobraSpyGui)
CornerLabel.Name = "CornerLabel"
CornerLabel.AnchorPoint = Vector2.new(0, 0)
CornerLabel.Position = UDim2.new(0, 5, 0, 5)  -- top-left offset 3
CornerLabel.Size = UDim2.new(0, 150, 0, 20)
CornerLabel.BackgroundTransparency = 1
CornerLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
CornerLabel.TextXAlignment = Enum.TextXAlignment.Left
CornerLabel.Font = Enum.Font.SourceSansBold
CornerLabel.Text = "Cobra Spy (WIP)"

-- Main Window
local Window = Instance.new("Frame", CobraSpyGui)
Window.Name = "CobraSpyWindow"
Window.AnchorPoint = Vector2.new(0.5, 0.5)
Window.Position = UDim2.new(0.5, 0, 0.5, 0)
Window.Size = UDim2.new(0.8, 0, 0.8, 0)
Window.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
Window.ClipsDescendants = true

-- Rounded corners and subtle stroke for Window 4
local UICornerWindow = Instance.new("UICorner", Window)
UICornerWindow.CornerRadius = UDim.new(0, 12)
local UIStrokeWindow = Instance.new("UIStroke", Window)
UIStrokeWindow.Thickness = 1
UIStrokeWindow.Color = Color3.fromRGB(80, 80, 90)
UIStrokeWindow.Transparency = 0.5

-- Header (draggable) 5
local Header = Instance.new("Frame", Window)
Header.Name = "Header"
Header.AnchorPoint = Vector2.new(0, 0)
Header.Position = UDim2.new(0, 0, 0, 0)
Header.Size = UDim2.new(1, 0, 0, 36)
Header.BackgroundColor3 = Color3.fromRGB(40, 40, 45)

local UICornerHeader = Instance.new("UICorner", Header)
UICornerHeader.CornerRadius = UDim.new(0, 12)
local UIStrokeHeader = Instance.new("UIStroke", Header)
UIStrokeHeader.Thickness = 1
UIStrokeHeader.Color = Color3.fromRGB(100, 100, 110)
UIStrokeHeader.Transparency = 0.7

local TitleLabel = Instance.new("TextLabel", Header)
TitleLabel.AnchorPoint = Vector2.new(0, 0.5)
TitleLabel.Position = UDim2.new(0, 12, 0.5, 0)
TitleLabel.Size = UDim2.new(0.5, 0, 0.6, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Font = Enum.Font.SourceSansSemibold
TitleLabel.Text = "Cobra Spy"
TitleLabel.TextScaled = true

-- Minimize and Close buttons
local MinimizeButton = Instance.new("TextButton", Header)
MinimizeButton.AnchorPoint = Vector2.new(1, 0.5)
MinimizeButton.Position = UDim2.new(1, -64, 0.5, 0)
MinimizeButton.Size = UDim2.new(0, 28, 0, 28)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
MinimizeButton.Text = "—"
MinimizeButton.TextColor3 = Color3.fromRGB(200, 200, 200)
MinimizeButton.Font = Enum.Font.SourceSansBold

local UICornerMin = Instance.new("UICorner", MinimizeButton)
UICornerMin.CornerRadius = UDim.new(0, 6)
local UIStrokeMin = Instance.new("UIStroke", MinimizeButton)
UIStrokeMin.Thickness = 1
UIStrokeMin.Color = Color3.fromRGB(100, 100, 110)
UIStrokeMin.Transparency = 0.7

local CloseButton = Instance.new("TextButton", Header)
CloseButton.AnchorPoint = Vector2.new(1, 0.5)
CloseButton.Position = UDim2.new(1, -32, 0.5, 0)
CloseButton.Size = UDim2.new(0, 28, 0, 28)
CloseButton.BackgroundColor3 = Color3.fromRGB(150, 30, 30)
CloseButton.Text = "✕"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.SourceSansBold

local UICornerClose = Instance.new("UICorner", CloseButton)
UICornerClose.CornerRadius = UDim.new(0, 6)
local UIStrokeClose = Instance.new("UIStroke", CloseButton)
UIStrokeClose.Thickness = 1
UIStrokeClose.Color = Color3.fromRGB(180, 50, 50)
UIStrokeClose.Transparency = 0.7

-- Containers: Left (Remotes) and Right (Logs + Controls)
local LeftContainer = Instance.new("Frame", Window)
LeftContainer.Name = "RemoteListContainer"
LeftContainer.AnchorPoint = Vector2.new(0, 0)
LeftContainer.Position = UDim2.new(0, 0, 0, 36)
LeftContainer.Size = UDim2.new(0.28, 0, 1, -36)
LeftContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 35)

local UICornerLeft = Instance.new("UICorner", LeftContainer)
UICornerLeft.CornerRadius = UDim.new(0, 8)
local UIStrokeLeft = Instance.new("UIStroke", LeftContainer)
UIStrokeLeft.Thickness = 1
UIStrokeLeft.Color = Color3.fromRGB(70, 70, 80)
UIStrokeLeft.Transparency = 0.6

local RightContainer = Instance.new("Frame", Window)
RightContainer.Name = "LogContainer"
RightContainer.AnchorPoint = Vector2.new(1, 0)
RightContainer.Position = UDim2.new(1, 0, 0, 36)
RightContainer.Size = UDim2.new(0.72, 0, 1, -36)
RightContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 30)

local UICornerRight = Instance.new("UICorner", RightContainer)
UICornerRight.CornerRadius = UDim.new(0, 8)
local UIStrokeRight = Instance.new("UIStroke", RightContainer)
UIStrokeRight.Thickness = 1
UIStrokeRight.Color = Color3.fromRGB(70, 70, 80)
UIStrokeRight.Transparency = 0.6

-- Titles
local LeftTitle = Instance.new("TextLabel", LeftContainer)
LeftTitle.AnchorPoint = Vector2.new(0.5, 0)
LeftTitle.Position = UDim2.new(0.5, 0, 0, 8)
LeftTitle.Size = UDim2.new(0.9, 0, 0, 24)
LeftTitle.BackgroundTransparency = 1
LeftTitle.Text = "Remotes"
LeftTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
LeftTitle.Font = Enum.Font.SourceSansBold
LeftTitle.TextScaled = true

local RightTitle = Instance.new("TextLabel", RightContainer)
RightTitle.AnchorPoint = Vector2.new(0.5, 0)
RightTitle.Position = UDim2.new(0.5, 0, 0, 8)
RightTitle.Size = UDim2.new(0.9, 0, 0, 24)
RightTitle.BackgroundTransparency = 1
RightTitle.Text = "Logs"
RightTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
RightTitle.Font = Enum.Font.SourceSansBold
RightTitle.TextScaled = true

-- Scrolling frames
local LeftScrolling = Instance.new("ScrollingFrame", LeftContainer)
LeftScrolling.Name = "RemoteScroll"
LeftScrolling.AnchorPoint = Vector2.new(0, 0)
LeftScrolling.Position = UDim2.new(0, 0, 0, 36)
LeftScrolling.Size = UDim2.new(1, 0, 1, -36)
LeftScrolling.CanvasSize = UDim2.new(0, 0, 0, 0)
LeftScrolling.AutomaticCanvasSize = Enum.AutomaticSize.Y  -- auto-resize 6
LeftScrolling.ScrollBarThickness = 6
LeftScrolling.BackgroundTransparency = 1

local LeftLayout = Instance.new("UIListLayout", LeftScrolling)
LeftLayout.Padding = UDim.new(0, 6)
LeftLayout.SortOrder = Enum.SortOrder.LayoutOrder

local RightScrolling = Instance.new("ScrollingFrame", RightContainer)
RightScrolling.Name = "LogScroll"
RightScrolling.AnchorPoint = Vector2.new(0, 0)
RightScrolling.Position = UDim2.new(0, 0, 0, 36)
RightScrolling.Size = UDim2.new(1, 0, 1, -36)
RightScrolling.CanvasSize = UDim2.new(0, 0, 0, 0)
RightScrolling.AutomaticCanvasSize = Enum.AutomaticSize.Y
RightScrolling.ScrollBarThickness = 6
RightScrolling.BackgroundTransparency = 1

local RightLayout = Instance.new("UIListLayout", RightScrolling)
RightLayout.Padding = UDim.new(0, 6)
RightLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- InfoFrame at bottom of RightContainer for selected info & controls
local InfoFrame = Instance.new("Frame", RightContainer)
InfoFrame.Name = "InfoFrame"
InfoFrame.AnchorPoint = Vector2.new(0, 1)
InfoFrame.Position = UDim2.new(0, 0, 1, 0)
InfoFrame.Size = UDim2.new(1, 0, 0, 100)
InfoFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)

local UICornerInfo = Instance.new("UICorner", InfoFrame)
UICornerInfo.CornerRadius = UDim.new(0, 8)
local UIStrokeInfo = Instance.new("UIStroke", InfoFrame)
UIStrokeInfo.Thickness = 1
UIStrokeInfo.Color = Color3.fromRGB(70, 70, 80)
UIStrokeInfo.Transparency = 0.6

-- Selected path label
local RemotePathLabel = Instance.new("TextLabel", InfoFrame)
RemotePathLabel.AnchorPoint = Vector2.new(0, 0)
RemotePathLabel.Position = UDim2.new(0, 12, 0, 8)
RemotePathLabel.Size = UDim2.new(0.6, 0, 0, 24)
RemotePathLabel.BackgroundTransparency = 1
RemotePathLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
RemotePathLabel.TextXAlignment = Enum.TextXAlignment.Left
RemotePathLabel.Font = Enum.Font.SourceSans
RemotePathLabel.Text = "Selected: None"
RemotePathLabel.TextTruncate = Enum.TextTruncate.AtEnd

-- Buttons: Copy Path, Exclude/Include, Clear Logs, Stop Spy
local CopyPathButton = Instance.new("TextButton", InfoFrame)
CopyPathButton.AnchorPoint = Vector2.new(1, 0)
CopyPathButton.Position = UDim2.new(1, -12, 0, 8)
CopyPathButton.Size = UDim2.new(0, 120, 0, 28)
CopyPathButton.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
CopyPathButton.Text = "Copy Path"
CopyPathButton.TextColor3 = Color3.fromRGB(220, 220, 220)
CopyPathButton.Font = Enum.Font.SourceSans
CopyPathButton.AutoButtonColor = true
local UICornerCopy = Instance.new("UICorner", CopyPathButton)
UICornerCopy.CornerRadius = UDim.new(0, 6)
local UIStrokeCopy = Instance.new("UIStroke", CopyPathButton)
UIStrokeCopy.Thickness = 1
UIStrokeCopy.Color = Color3.fromRGB(100, 100, 110)
UIStrokeCopy.Transparency = 0.7

local ExcludeToggleButton = Instance.new("TextButton", InfoFrame)
ExcludeToggleButton.AnchorPoint = Vector2.new(0, 0)
ExcludeToggleButton.Position = UDim2.new(0, 12, 0, 42)
ExcludeToggleButton.Size = UDim2.new(0, 100, 0, 28)
ExcludeToggleButton.BackgroundColor3 = Color3.fromRGB(80, 50, 50)
ExcludeToggleButton.Text = "Exclude"
ExcludeToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExcludeToggleButton.Font = Enum.Font.SourceSans
ExcludeToggleButton.AutoButtonColor = true
local UICornerExclude = Instance.new("UICorner", ExcludeToggleButton)
UICornerExclude.CornerRadius = UDim.new(0, 6)
local UIStrokeExclude = Instance.new("UIStroke", ExcludeToggleButton)
UIStrokeExclude.Thickness = 1
UIStrokeExclude.Color = Color3.fromRGB(100, 60, 60)
UIStrokeExclude.Transparency = 0.7

local ClearLogsButton = Instance.new("TextButton", InfoFrame)
ClearLogsButton.AnchorPoint = Vector2.new(0, 0)
ClearLogsButton.Position = UDim2.new(0, 124, 0, 42)
ClearLogsButton.Size = UDim2.new(0, 100, 0, 28)
ClearLogsButton.BackgroundColor3 = Color3.fromRGB(50, 50, 80)
ClearLogsButton.Text = "Clear Logs"
ClearLogsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ClearLogsButton.Font = Enum.Font.SourceSans
ClearLogsButton.AutoButtonColor = true
local UICornerClear = Instance.new("UICorner", ClearLogsButton)
UICornerClear.CornerRadius = UDim.new(0, 6)
local UIStrokeClear = Instance.new("UIStroke", ClearLogsButton)
UIStrokeClear.Thickness = 1
UIStrokeClear.Color = Color3.fromRGB(80, 80, 120)
UIStrokeClear.Transparency = 0.7

local StopSpyButton = Instance.new("TextButton", InfoFrame)
StopSpyButton.AnchorPoint = Vector2.new(1, 0)
StopSpyButton.Position = UDim2.new(1, -12, 0, 42)
StopSpyButton.Size = UDim2.new(0, 100, 0, 28)
StopSpyButton.BackgroundColor3 = Color3.fromRGB(150, 30, 30)
StopSpyButton.Text = "Stop Spy"
StopSpyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StopSpyButton.Font = Enum.Font.SourceSans
StopSpyButton.AutoButtonColor = true
local UICornerStop = Instance.new("UICorner", StopSpyButton)
UICornerStop.CornerRadius = UDim.new(0, 6)
local UIStrokeStop = Instance.new("UIStroke", StopSpyButton)
UIStrokeStop.Thickness = 1
UIStrokeStop.Color = Color3.fromRGB(180, 50, 50)
UIStrokeStop.Transparency = 0.7

-- Minimize/Expand toggle button at top-right of Window
local ToggleSizeButton = Instance.new("TextButton", Header)
ToggleSizeButton.Name = "ToggleSizeButton"
ToggleSizeButton.AnchorPoint = Vector2.new(1, 0.5)
ToggleSizeButton.Position = UDim2.new(1, -100, 0.5, 0)
ToggleSizeButton.Size = UDim2.new(0, 80, 0, 24)
ToggleSizeButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
ToggleSizeButton.Text = "Hide Panels"
ToggleSizeButton.TextColor3 = Color3.fromRGB(220, 220, 220)
ToggleSizeButton.Font = Enum.Font.SourceSans
ToggleSizeButton.AutoButtonColor = true
local UICornerToggle = Instance.new("UICorner", ToggleSizeButton)
UICornerToggle.CornerRadius = UDim.new(0, 6)
local UIStrokeToggle = Instance.new("UIStroke", ToggleSizeButton)
UIStrokeToggle.Thickness = 1
UIStrokeToggle.Color = Color3.fromRGB(100, 100, 110)
UIStrokeToggle.Transparency = 0.7

-- Data tables
local DetectedRemotes = {}  -- [Instance] = {path=string, name=string}
local RemoteLogs = {}       -- [Instance] = {entries...}
local ExcludedRemotes = {}  -- [Instance] = true
local SelectedRemote = nil
local spyEnabled = true
local isMinimized = false  -- for ToggleSizeButton
local isWindowMinimized = false  -- for MinimizeButton

-- Utility to get full path
local function GetInstanceFullPath(inst)
    local parts = {}
    local current = inst
    while current and current ~= game do
        table.insert(parts, 1, current.Name)
        current = current.Parent
    end
    table.insert(parts, 1, "game")
    return table.concat(parts, ".")
end

-- Register remote when first seen
local function RegisterRemote(inst)
    if DetectedRemotes[inst] then return end
    DetectedRemotes[inst] = { path = GetInstanceFullPath(inst), name = inst.Name }
    RemoteLogs[inst] = {}
    UpdateRemoteListUI()
end

-- Update left list UI
function UpdateRemoteListUI()
    -- Clear existing rows
    for _, child in ipairs(LeftScrolling:GetChildren()) do
        if child:IsA("Frame") and child.Name == "RemoteRow" then
            child:Destroy()
        end
    end
    -- Add rows
    for inst, info in pairs(DetectedRemotes) do
        local row = Instance.new("Frame", LeftScrolling)
        row.Name = "RemoteRow"
        row.Size = UDim2.new(1, 0, 0, 30)
        row.BackgroundTransparency = 1
        row.LayoutOrder = 0

        -- Select button
        local nameBtn = Instance.new("TextButton", row)
        nameBtn.Name = "SelectRemoteButton"
        nameBtn.Size = UDim2.new(0.75, 0, 1, 0)
        nameBtn.Position = UDim2.new(0, 0, 0, 0)
        nameBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
        nameBtn.Text = info.name
        nameBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        nameBtn.Font = Enum.Font.SourceSans
        nameBtn.TextXAlignment = Enum.TextXAlignment.Left
        nameBtn.AutoButtonColor = true
        local ucName = Instance.new("UICorner", nameBtn)
        ucName.CornerRadius = UDim.new(0, 6)
        local usName = Instance.new("UIStroke", nameBtn)
        usName.Thickness = 1
        usName.Color = Color3.fromRGB(80, 80, 100)
        usName.Transparency = 0.7
        nameBtn.MouseEnter:Connect(function()
            TweenService:Create(nameBtn, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {BackgroundColor3 = Color3.fromRGB(60, 60, 70)}):Play()
        end)
        nameBtn.MouseLeave:Connect(function()
            TweenService:Create(nameBtn, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {BackgroundColor3 = Color3.fromRGB(40, 40, 50)}):Play()
        end)
        nameBtn.MouseButton1Click:Connect(function()
            SelectedRemote = inst
            RemotePathLabel.Text = "Selected: " .. (DetectedRemotes[inst].path or "Unknown")
            UpdateExcludeButton()
            UpdateLogListUI()
        end)

        -- Copy button
        local copyBtn = Instance.new("TextButton", row)
        copyBtn.Name = "CopyRemotePathButton"
        copyBtn.Size = UDim2.new(0.25, -4, 1, 0)
        copyBtn.Position = UDim2.new(0.75, 4, 0, 0)
        copyBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
        copyBtn.Text = "C"
        copyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        copyBtn.Font = Enum.Font.SourceSans
        copyBtn.AutoButtonColor = true
        local ucCopy = Instance.new("UICorner", copyBtn)
        ucCopy.CornerRadius = UDim.new(0, 6)
        local usCopy = Instance.new("UIStroke", copyBtn)
        usCopy.Thickness = 1
        usCopy.Color = Color3.fromRGB(90, 90, 110)
        usCopy.Transparency = 0.7
        copyBtn.MouseEnter:Connect(function()
            TweenService:Create(copyBtn, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {BackgroundColor3 = Color3.fromRGB(80, 80, 90)}):Play()
        end)
        copyBtn.MouseLeave:Connect(function()
            TweenService:Create(copyBtn, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {BackgroundColor3 = Color3.fromRGB(60, 60, 70)}):Play()
        end)
        copyBtn.MouseButton1Click:Connect(function()
            local path = DetectedRemotes[inst].path or ""
            if setclipboard then setclipboard(path) end
            local orig = copyBtn.Text
            copyBtn.Text = "✓"
            task.delay(1, function()
                if copyBtn and copyBtn.Parent then copyBtn.Text = orig end
            end)
        end)
    end
end

-- Update Exclude/Include button state
function UpdateExcludeButton()
    if not SelectedRemote then
        ExcludeToggleButton.Text = "Exclude"
        ExcludeToggleButton.BackgroundColor3 = Color3.fromRGB(80, 50, 50)
        CopyPathButton.Active = false
        ExcludeToggleButton.Active = false
        ClearLogsButton.Active = false
        StopSpyButton.Active = true
        return
    end
    CopyPathButton.Active = true
    ExcludeToggleButton.Active = true
    ClearLogsButton.Active = true
    if ExcludedRemotes[SelectedRemote] then
        ExcludeToggleButton.Text = "Include"
        ExcludeToggleButton.BackgroundColor3 = Color3.fromRGB(50, 80, 50)
    else
        ExcludeToggleButton.Text = "Exclude"
        ExcludeToggleButton.BackgroundColor3 = Color3.fromRGB(80, 50, 50)
    end
end

-- Copy path in InfoFrame with feedback
CopyPathButton.MouseButton1Click:Connect(function()
    if SelectedRemote and DetectedRemotes[SelectedRemote] then
        local path = DetectedRemotes[SelectedRemote].path or ""
        if setclipboard then setclipboard(path) end
        local orig = CopyPathButton.Text
        CopyPathButton.Text = "Copied!"
        task.delay(1.2, function()
            if CopyPathButton and CopyPathButton.Parent then
                CopyPathButton.Text = orig
            end
        end)
    end
end)

-- Exclude/include toggle
ExcludeToggleButton.MouseButton1Click:Connect(function()
    if not SelectedRemote then return end
    if ExcludedRemotes[SelectedRemote] then
        ExcludedRemotes[SelectedRemote] = nil
    else
        ExcludedRemotes[SelectedRemote] = true
        RemoteLogs[SelectedRemote] = {}
    end
    UpdateExcludeButton()
    UpdateLogListUI()
end)

-- Clear logs
ClearLogsButton.MouseButton1Click:Connect(function()
    if not SelectedRemote then return end
    RemoteLogs[SelectedRemote] = {}
    UpdateLogListUI()
end)

-- Stop Spy: restore metamethod and destroy GUI
StopSpyButton.MouseButton1Click:Connect(function()
    if spyEnabled then
        spyEnabled = false
        setreadonly(mt, false)
        mt.__namecall = oldNamecall
        setreadonly(mt, true)
    end
    if CobraSpyGui and CobraSpyGui.Parent then
        CobraSpyGui:Destroy()
    end
end)

-- Toggle left/right panels visibility
ToggleSizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        LeftContainer.Visible = false
        RightContainer.Visible = false
        ToggleSizeButton.Text = "Show Panels"
    else
        LeftContainer.Visible = true
        RightContainer.Visible = true
        ToggleSizeButton.Text = "Hide Panels"
    end
end)

-- Update logs list
function UpdateLogListUI()
    for _, child in ipairs(RightScrolling:GetChildren()) do
        if child:IsA("TextButton") or child:IsA("TextLabel") then
            child:Destroy()
        end
    end
    if not SelectedRemote then return end
    local logs = RemoteLogs[SelectedRemote] or {}
    for _, entry in ipairs(logs) do
        local logBtn = Instance.new("TextButton", RightScrolling)
        logBtn.Size = UDim2.new(1, 0, 0, 24)
        logBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
        logBtn.Text = entry
        logBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
        logBtn.Font = Enum.Font.SourceSans
        logBtn.TextXAlignment = Enum.TextXAlignment.Left
        local ucLog = Instance.new("UICorner", logBtn)
        ucLog.CornerRadius = UDim.new(0, 6)
        local usLog = Instance.new("UIStroke", logBtn)
        usLog.Thickness = 1
        usLog.Color = Color3.fromRGB(80, 80, 90)
        usLog.Transparency = 0.7
        logBtn.MouseEnter:Connect(function()
            TweenService:Create(logBtn, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {BackgroundColor3 = Color3.fromRGB(55, 55, 60)}):Play()
        end)
        logBtn.MouseLeave:Connect(function()
            TweenService:Create(logBtn, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {BackgroundColor3 = Color3.fromRGB(35, 35, 40)}):Play()
        end)
        logBtn.MouseButton1Click:Connect(function()
            if setclipboard then setclipboard(entry) end
            local origColor = logBtn.TextColor3
            logBtn.TextColor3 = Color3.fromRGB(100, 255, 100)
            task.delay(0.8, function()
                if logBtn and logBtn.Parent then
                    logBtn.TextColor3 = origColor
                end
            end)
        end)
    end
end

-- Capture remote calls with return values
local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall

function LogRemoteCall(inst, methodName, args, returnOk, returnValue)
    if not spyEnabled then return end
    if ExcludedRemotes[inst] then return end
    if not RemoteLogs[inst] then return end
    local parts = {"[" .. os.date("%H:%M:%S") .. "]", methodName}
    for _, arg in ipairs(args) do
        local s
        local ok, str = pcall(function() return tostring(arg) end)
        s = ok and str or "<unserializable>"
        table.insert(parts, s)
    end
    if methodName == "InvokeServer" then
        local rstr
        if returnOk then
            local ok2, s2 = pcall(function() return tostring(returnValue) end)
            rstr = ok2 and s2 or "<unserializable return>"
        else
            rstr = "<error or nil>"
        end
        table.insert(parts, "=>")
        table.insert(parts, rstr)
    end
    local entry = table.concat(parts, " ")
    table.insert(RemoteLogs[inst], entry)
    if #RemoteLogs[inst] > 100 then table.remove(RemoteLogs[inst], 1) end
    if SelectedRemote == inst then
        UpdateLogListUI()
    end
end

-- Hook __namecall to intercept remotes
setreadonly(mt, false)
mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    if spyEnabled
       and (method == "FireServer" or method == "InvokeServer")
       and typeof(self) == "Instance"
       and (self:IsA("RemoteEvent") or self:IsA("RemoteFunction")) then

        RegisterRemote(self)
        local args = {...}
        if method == "InvokeServer" then
            local ok, ret = pcall(function()
                return oldNamecall(self, table.unpack(args))
            end)
            LogRemoteCall(self, method, args, ok, ret)
            if ok then
                return ret
            else
                return oldNamecall(self, table.unpack(args))
            end
        else
            LogRemoteCall(self, method, args, true, nil)
            return oldNamecall(self, ...)
        end
    end
    return oldNamecall(self, ...)
end)
setreadonly(mt, true)

-- Draggable Window implementation 7
do
    local dragging = false
    local dragInput, dragStart, startPos
    Header.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = Window.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    Header.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input == dragInput then
            local delta = input.Position - dragStart
            Window.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                                       startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

-- Minimize (shrink) and restore Window with tweens 8
MinimizeButton.MouseButton1Click:Connect(function()
    isWindowMinimized = not isWindowMinimized
    if isWindowMinimized then
        -- Shrink to small bar in corner
        local targetSize = UDim2.new(0, 200, 0, 36)
        local targetPos = UDim2.new(1, -220, 0, 20)
        TweenService:Create(Window, TweenInfo.new(0.3, Enum.EasingStyle.Sine), {
            Size = targetSize,
            Position = targetPos
        }):Play()
        -- Hide content after tween
        task.delay(0.3, function()
            Header.Visible = true  -- header stays visible as bar
            LeftContainer.Visible = false
            RightContainer.Visible = false
            ToggleSizeButton.Visible = false
        end)
        MinimizeButton.Text = "+"
    else
        -- Restore full Window
        local targetSize = UDim2.new(0.8, 0, 0.8, 0)
        local targetPos = UDim2.new(0.5, 0, 0.5, 0)
        TweenService:Create(Window, TweenInfo.new(0.3, Enum.EasingStyle.Sine), {
            Size = targetSize,
            Position = targetPos
        }):Play()
        task.delay(0.3, function()
            Header.Visible = true
            LeftContainer.Visible = true
            RightContainer.Visible = true
            ToggleSizeButton.Visible = true
        end)
        MinimizeButton.Text = "—"
    end
end)

-- Close via CloseButton
CloseButton.MouseButton1Click:Connect(function()
    if spyEnabled then
        spyEnabled = false
        setreadonly(mt, false)
        mt.__namecall = oldNamecall
        setreadonly(mt, true)
    end
    if CobraSpyGui and CobraSpyGui.Parent then
        CobraSpyGui:Destroy()
    end
end)