-- ==========================================
-- ЧАСТЬ 1 ИЗ 4: ОСНОВА ИНТЕРФЕЙСА И ВКЛАДКИ
-- ==========================================

if not game:IsLoaded() then 
    pcall(function() game.Loaded:Wait() end) 
end

local p,tw,run,l=game.Players.LocalPlayer,game:GetService("TweenService"),game:GetService("RunService"),game:GetService("Lighting")
local g=p:WaitForChild("PlayerGui",10)

local function clean(n)
    local parents = {g, game.CoreGui}
    pcall(function() if getgui then table.insert(parents, getgui()) end end)
    pcall(function() if gethui then table.insert(parents, gethui()) end end)
    pcall(function() if get_hidden_gui then table.insert(parents, get_hidden_gui()) end end)

    local seen = {}
    for _, parent in ipairs(parents) do
        if parent and not seen[parent] then
            seen[parent] = true
            pcall(function()
                for _, child in ipairs(parent:GetChildren()) do
                    if child.Name == n then child:Destroy() end
                end
            end)
        end
    end
end
clean("AngelW_TikTokGui")

-- Полный сброс состояния при повторном запуске
_G.AngelWScriptGeneration = (_G.AngelWScriptGeneration or 0) + 1
local SCRIPT_GENERATION = _G.AngelWScriptGeneration
_G.korbloxActive = false
_G.headlessActive = false
_G.onlyHeadlessActive = false

local sg=Instance.new("ScreenGui") 
sg.Name,sg.ResetOnSpawn="AngelW_TikTokGui",false
sg.ZIndexBehavior=Enum.ZIndexBehavior.Global
sg.DisplayOrder=999999

if syn and syn.protect_gui then
    syn.protect_gui(sg)
    sg.Parent = game.CoreGui
elseif getgui then
    sg.Parent = getgui()
else
    sg.Parent = g or game.CoreGui
end

local mf=Instance.new("Frame",sg) mf.ZIndex=100 mf.Size,mf.Position,mf.BackgroundColor3,mf.BorderSizePixel,mf.ClipsDescendants=UDim2.new(0,430,0,260),UDim2.new(0.35,0,0.3,0),Color3.fromRGB(15,15,18),0,true
Instance.new("UICorner",mf).CornerRadius=UDim.new(0,10)
local ms=Instance.new("UIStroke",mf) ms.Thickness,ms.Color=1,Color3.fromRGB(45,45,50)

local sb=Instance.new("Frame",mf) sb.ZIndex=110 sb.Size,sb.BackgroundColor3,sb.BorderSizePixel=UDim2.new(0,130,1,0),Color3.fromRGB(11,11,13),0
local sst=Instance.new("UIStroke",sb) sst.Thickness,sst.Color=1,Color3.fromRGB(30,30,35)
local lo=Instance.new("TextLabel",sb) lo.ZIndex=130 lo.TextTransparency=0 lo.Size,lo.Position,lo.Text,lo.TextColor3,lo.Font,lo.TextSize,lo.TextXAlignment,lo.BackgroundTransparency=UDim2.new(1,-15,0,45),UDim2.new(0,15,0,0),"AngeliW",Color3.fromRGB(240,240,245),Enum.Font.GothamBold,16,0,1

local tb2=Instance.new("TextButton",sb) tb2.ZIndex=120 tb2.AutoButtonColor=false tb2.Size,tb2.Position,tb2.BackgroundColor3,tb2.Text,tb2.TextColor3,tb2.Font,tb2.TextSize=UDim2.new(1,-16,0,32),UDim2.new(0,8,0,60),Color3.fromRGB(24,24,27),"⚙️ Настройки",Color3.fromRGB(245,245,245),Enum.Font.GothamMedium,11
Instance.new("UICorner",tb2).CornerRadius=UDim.new(0,6)
local tb3=Instance.new("TextButton",sb) tb3.ZIndex=120 tb3.AutoButtonColor=false tb3.Size,tb3.Position,tb3.BackgroundColor3,tb3.Text,tb3.TextColor3,tb3.Font,tb3.TextSize=UDim2.new(1,-16,0,32),UDim2.new(0,8,0,100),Color3.fromRGB(16,16,18),"👑 Важные",Color3.fromRGB(150,150,155),Enum.Font.GothamMedium,11
Instance.new("UICorner",tb3).CornerRadius=UDim.new(0,6)

local co2=Instance.new("ScrollingFrame",mf) co2.ZIndex=101 co2.Active=false co2.Size,co2.Position,co2.BackgroundTransparency,co2.Visible,co2.CanvasSize,co2.ScrollBarThickness=UDim2.new(1,-145,1,-20),UDim2.new(0,145,0,15),1,true,UDim2.new(0,0,0,300),0

local co3_1=Instance.new("ScrollingFrame",mf) co3_1.ZIndex=101 co3_1.Active=false co3_1.Size,co3_1.Position,co3_1.BackgroundTransparency,co3_1.Visible,co3_1.CanvasSize,co3_1.ScrollBarThickness=UDim2.new(1,-145,1,-55),UDim2.new(0,145,0,50),1,false,UDim2.new(0,0,0,300),0
local co3_2=Instance.new("ScrollingFrame",mf) co3_2.ZIndex=101 co3_2.Active=false co3_2.Size,co3_2.Position,co3_2.BackgroundTransparency,co3_2.Visible,co3_2.CanvasSize,co3_2.ScrollBarThickness=UDim2.new(1,-145,1,-55),UDim2.new(0,145,0,50),1,false,UDim2.new(0,0,0,300),0
local subNav=Instance.new("Frame",mf) subNav.ZIndex=115 subNav.Active=false subNav.Size,subNav.Position,subNav.BackgroundTransparency,subNav.Visible=UDim2.new(1,-145,0,30),UDim2.new(0,145,0,15),1,false

local subBtn1=Instance.new("TextButton",subNav) subBtn1.ZIndex=130 subBtn1.AutoButtonColor=false subBtn1.Size,subBtn1.Position,subBtn1.BackgroundColor3,subBtn1.Text,subBtn1.TextColor3,subBtn1.Font,subBtn1.TextSize=UDim2.new(0,125,1,0),UDim2.new(0,0,0,0),Color3.fromRGB(24,24,27),"Корблокс",Color3.fromRGB(245,245,245),Enum.Font.GothamBold,11
Instance.new("UICorner",subBtn1).CornerRadius=UDim.new(0,6)
local subBtn2=Instance.new("TextButton",subNav) subBtn2.ZIndex=130 subBtn2.AutoButtonColor=false subBtn2.Size,subBtn2.Position,subBtn2.BackgroundColor3,subBtn2.Text,subBtn2.TextColor3,subBtn2.Font,subBtn2.TextSize=UDim2.new(0,125,1,0),UDim2.new(0,135,0,0),Color3.fromRGB(16,16,18),"Хедлесс + Рога",Color3.fromRGB(150,150,155),Enum.Font.GothamBold,11
Instance.new("UICorner",subBtn2).CornerRadius=UDim.new(0,6)

local ll2=Instance.new("UIListLayout",co2) ll2.Padding,ll2.SortOrder=UDim.new(0,10),0
local ll3_1=Instance.new("UIListLayout",co3_1) ll3_1.Padding,ll3_1.SortOrder=UDim.new(0,10),0
local ll3_2=Instance.new("UIListLayout",co3_2) ll3_2.Padding,ll3_2.SortOrder=UDim.new(0,10),0

local function setMainButton(btn, selected)
    if selected then
        btn.BackgroundColor3=Color3.fromRGB(24,24,27)
        btn.TextColor3=Color3.fromRGB(245,245,245)
    else
        btn.BackgroundColor3=Color3.fromRGB(16,16,18)
        btn.TextColor3=Color3.fromRGB(150,150,155)
    end
end

local function resetMainPanels()
    co2.Visible=false
    co3_1.Visible=false
    co3_2.Visible=false
    subNav.Visible=false
end

local function showSettings()
    resetMainPanels()
    co2.Visible=true
    setMainButton(tb2,true)
    setMainButton(tb3,false)
end

local function showImportant()
    resetMainPanels()
    subNav.Visible=true
    co3_1.Visible=true
    setMainButton(tb2,false)
    setMainButton(tb3,true)
    setMainButton(subBtn1,true)
    setMainButton(subBtn2,false)
end

local function showKorblox()
    if not subNav.Visible then return end
    co3_1.Visible=true
    co3_2.Visible=false
    setMainButton(subBtn1,true)
    setMainButton(subBtn2,false)
end

local function showHeadlessHorns()
    if not subNav.Visible then return end
    co3_1.Visible=false
    co3_2.Visible=true
    setMainButton(subBtn1,false)
    setMainButton(subBtn2,true)
end

local uis = game:GetService("UserInputService")
local lastButtonPress = {}

local function bindButton(button, callback)
    button.Activated:Connect(function()
        if SCRIPT_GENERATION ~= _G.AngelWScriptGeneration then return end
        callback()
    end)
end

local function actuallyVisible(obj)
    while obj and obj ~= sg do
        if obj:IsA("GuiObject") and not obj.Visible then return false end
        obj = obj.Parent
    end
    return true
end

local function pointInside(obj, pos)
    if not actuallyVisible(obj) then return false end
    local p0, size = obj.AbsolutePosition, obj.AbsoluteSize
    return pos.X >= p0.X and pos.X <= p0.X + size.X
       and pos.Y >= p0.Y and pos.Y <= p0.Y + size.Y
end

-- Навигация.
bindButton(tb2, showSettings)
bindButton(tb3, showImportant)
bindButton(subBtn1, showKorblox)
bindButton(subBtn2, showHeadlessHorns)

-- ==========================================
-- ЧАСТЬ 2 ИЗ 4: КОНСТРУКТОР ЭЛЕМЕНТОВ И ДРАГ
-- ==========================================

local function createTab(parent,title,descText) 
    local fr=Instance.new("Frame",parent) fr.ZIndex=110 fr.Active=false fr.Size,fr.BackgroundColor3=UDim2.new(0,260,0,65),Color3.fromRGB(20,20,23) 
    Instance.new("UICorner",fr).CornerRadius=UDim.new(0,8) Instance.new("UIStroke",fr).Color=Color3.fromRGB(35,35,40) 
    local lbl=Instance.new("TextLabel",fr)
    lbl.ZIndex=130
    lbl.BackgroundTransparency=1
    lbl.TextTransparency=0
    lbl.Size,lbl.Position,lbl.Text,lbl.TextColor3,lbl.Font,lbl.TextSize,lbl.TextXAlignment=UDim2.new(1,-70,0,25),UDim2.new(0,12,0,5),title,Color3.fromRGB(220,220,225),Enum.Font.GothamBold,9,0 
    if descText~="" then 
        local t=Instance.new("TextLabel",fr)
        t.ZIndex=130
        t.BackgroundTransparency=1
        t.TextTransparency=0
        t.Size,t.Position,t.Text,t.TextColor3,t.Font,t.TextSize,t.TextXAlignment=UDim2.new(0,180,0,30),UDim2.new(0,12,0,30),descText,Color3.fromRGB(220,220,225),Enum.Font.GothamMedium,11,0 
    end 
    return fr 
end 

local function createSlider(parent,title,minV,maxV,defV) 
    local f=createTab(parent,title,"") local sBg=Instance.new("Frame",f) sBg.Size,sBg.Position,sBg.BackgroundColor3=UDim2.new(0,130,0,6),UDim2.new(0,22,0,38),Color3.fromRGB(40,40,45) Instance.new("UICorner",sBg) 
    local miL=Instance.new("TextLabel",f) miL.ZIndex=130 miL.Size,miL.Position,miL.Text=UDim2.new(0,10,0,10),UDim2.new(0,10,0,36),tostring(minV) miL.TextColor3,miL.Font,miL.TextSize,miL.BackgroundTransparency=Color3.fromRGB(100,100,105),Enum.Font.GothamMedium,9,1 
    local maL=Instance.new("TextLabel",f) maL.ZIndex=130 maL.Size,maL.Position,maL.Text=UDim2.new(0,20,0,10),UDim2.new(0,154,0,36),tostring(maxV) maL.TextColor3,maL.Font,maL.TextSize,maL.BackgroundTransparency=Color3.fromRGB(100,100,105),Enum.Font.GothamMedium,9,1 
    local sFil=Instance.new("Frame",sBg) sFil.BackgroundColor3=Color3.fromRGB(40,240,150) Instance.new("UICorner",sFil) 
    local sBtn=Instance.new("TextButton",sBg) sBtn.Size,sBtn.BackgroundColor3,sBtn.Text=UDim2.new(0,12,0,12),Color3.fromRGB(255,255,255),"" Instance.new("UICorner",sBtn).CornerRadius=UDim.new(1,0) 
    local num=Instance.new("TextLabel",f) num.ZIndex=130 num.Size,num.Position,num.Text=UDim2.new(0,35,0,22),UDim2.new(1,-95,0,30),tostring(defV) num.TextColor3,num.Font,num.TextSize,num.BackgroundColor3=Color3.fromRGB(245,245,245),Enum.Font.GothamBold,11,Color3.fromRGB(30,30,35) Instance.new("UICorner",num).CornerRadius=UDim.new(0,6) Instance.new("UIStroke",num).Color=Color3.fromRGB(50,50,55) 
    local startP=math.clamp((defV-minV)/(maxV-minV),0,1) sBtn.Position=UDim2.new(startP,-6,0.5,-6) sFil.Size=UDim2.new(startP,0,1,0) return sBg,sFil,sBtn,num 
end 

local sBgF,sFilF,sBtnF,numF=createSlider(co2,"КАСТОМНЫЙ FOV",1,130,70) 

local bFovOffFrame=sBgF.Parent 
local bOff=Instance.new("TextButton",bFovOffFrame) bOff.ZIndex=130 bOff.AutoButtonColor=false bOff.AutoButtonColor=false bOff.Size,bOff.Position,bOff.BackgroundColor3,bOff.Text,bOff.TextColor3,bOff.Font,bOff.TextSize=UDim2.new(0,45,0,22),UDim2.new(1,-55,0,30),Color3.fromRGB(40,240,150),"ON",Color3.fromRGB(15,15,18),Enum.Font.GothamMedium,10 
Instance.new("UICorner",bOff).CornerRadius=UDim.new(0,6) Instance.new("UIStroke",bOff).Color=Color3.fromRGB(50,255,160) 

local bKorbloxFrame=createTab(co3_1,"KORBLOX LEG","Визуальная нога") 
local bKorbloxBtn=Instance.new("TextButton",bKorbloxFrame) bKorbloxBtn.ZIndex=130 bKorbloxBtn.AutoButtonColor=false bKorbloxBtn.AutoButtonColor=false bKorbloxBtn.Size,bKorbloxBtn.Position,bKorbloxBtn.BackgroundColor3,bKorbloxBtn.Text,bKorbloxBtn.TextColor3,bKorbloxBtn.Font,bKorbloxBtn.TextSize=UDim2.new(0,45,0,22),UDim2.new(1,-55,0,30),Color3.fromRGB(60,20,25),"ВЫКЛ",Color3.fromRGB(200,150,150),Enum.Font.GothamMedium,10 
Instance.new("UICorner",bKorbloxBtn).CornerRadius=UDim.new(0,6) Instance.new("UIStroke",bKorbloxBtn).Color=Color3.fromRGB(80,30,35) 

local bHeadlessFrame=createTab(co3_2,"ХЕДЛЕСС + РОГА","Голова с рогами") 
local bHeadlessBtn=Instance.new("TextButton",bHeadlessFrame) bHeadlessBtn.ZIndex=130 bHeadlessBtn.AutoButtonColor=false bHeadlessBtn.AutoButtonColor=false bHeadlessBtn.Size,bHeadlessBtn.Position,bHeadlessBtn.BackgroundColor3,bHeadlessBtn.Text,bHeadlessBtn.TextColor3,bHeadlessBtn.Font,bHeadlessBtn.TextSize=UDim2.new(0,45,0,22),UDim2.new(1,-55,0,30),Color3.fromRGB(60,20,25),"ВЫКЛ",Color3.fromRGB(200,150,150),Enum.Font.GothamMedium,10 
Instance.new("UICorner",bHeadlessBtn).CornerRadius=UDim.new(0,6) Instance.new("UIStroke",bHeadlessBtn).Color=Color3.fromRGB(80,30,35) 

local bOnlyHeadlessFrame=createTab(co3_2,"ПРОСТО ХЕДЛЕСС","Только невидимость") 
local bOnlyHeadlessBtn=Instance.new("TextButton",bOnlyHeadlessFrame) bOnlyHeadlessBtn.ZIndex=130 bOnlyHeadlessBtn.AutoButtonColor=false bOnlyHeadlessBtn.AutoButtonColor=false bOnlyHeadlessBtn.Size,bOnlyHeadlessBtn.Position,bOnlyHeadlessBtn.BackgroundColor3,bOnlyHeadlessBtn.Text,bOnlyHeadlessBtn.TextColor3,bOnlyHeadlessBtn.Font,bOnlyHeadlessBtn.TextSize=UDim2.new(0,45,0,22),UDim2.new(1,-55,0,30),Color3.fromRGB(60,20,25),"ВЫКЛ",Color3.fromRGB(200,150,150),Enum.Font.GothamMedium,10 
Instance.new("UICorner",bOnlyHeadlessBtn).CornerRadius=UDim.new(0,6) Instance.new("UIStroke",bOnlyHeadlessBtn).Color=Color3.fromRGB(80,30,35) 

local open=Instance.new("TextButton",sg) open.ZIndex=1000 open.AutoButtonColor=false open.ZIndex=200 open.AutoButtonColor=false open.Size,open.Position,open.BackgroundColor3,open.TextColor3,open.Font,open.TextSize,open.Text=UDim2.new(0,75,0,35),UDim2.new(0.05,0,0.15,0),Color3.fromRGB(24,24,27),Color3.fromRGB(240,240,245),Enum.Font.GothamBold,12,"[ Меню ]" 
Instance.new("UICorner",open).CornerRadius=UDim.new(0,8) local ops=Instance.new("UIStroke",open) ops.Thickness,ops.Color=1,Color3.fromRGB(50,50,55) 

local mo=true bindButton(open, function() mo=not mo mf.Visible=mo if mo then tw:Create(mf,TweenInfo.new(0.3),{Size=UDim2.new(0,430,0,260)}):Play() end end) 
local uis=game:GetService("UserInputService") 

-- ДРАГ: двигаем окно только за отдельную верхнюю полоску.
-- Кнопки меню и вкладок больше не двигают интерфейс.
local dragBar = Instance.new("Frame", mf)
dragBar.Name = "DragBar"
dragBar.Size = UDim2.new(0, 285, 0, 15)
dragBar.Position = UDim2.new(0, 145, 0, 0)
dragBar.BackgroundTransparency = 1
dragBar.BorderSizePixel = 0
dragBar.Active = true
dragBar.ZIndex = 5

local function drag(handle, target)
    local dragging = false
    local dragInput = nil
    local dragStart = nil
    local startPos = nil

    handle.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1
            or i.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = i.Position
            startPos = target.Position

            i.Changed:Connect(function()
                if i.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    handle.InputChanged:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseMovement
            or i.UserInputType == Enum.UserInputType.Touch then
            dragInput = i
        end
    end)

    uis.InputChanged:Connect(function(i)
        if dragging and i == dragInput then
            local delta = i.Position - dragStart
            target.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
end

drag(dragBar, mf)


-- ==========================================
-- ЧАСТЬ 3 ИЗ 4: СЛАЙДЕРЫ
-- ==========================================

local function setupSlider(sBg,sFil,sBtn,num,minV,maxV,defV,callback) 
    local dragS=false 
    local function updateS(input) 
        local pct=math.clamp((input.Position.X-sBg.AbsolutePosition.X)/sBg.AbsoluteSize.X,0,1) 
        sBtn.Position=UDim2.new(pct,-6,0.5,-6) sFil.Size=UDim2.new(pct,0,1,0) 
        local val=math.floor(minV+(pct*(maxV-minV))) num.Text=tostring(val) callback(val) 
    end 
    sBtn.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dragS=true end end) 
    uis.InputChanged:Connect(function(i) if dragS and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then updateS(i) end end) 
    uis.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dragS=false end end) 
end 

setupSlider(sBgF,sFilF,sBtnF,numF,1,130,70,function(v) if bOff.Text=="ON" then workspace.CurrentCamera.FieldOfView=v end end) 

bindButton(bOff, function() 
    if bOff.Text=="ON" then 
        bOff.Text,bOff.BackgroundColor3,bOff.TextColor3="OFF",Color3.fromRGB(60,20,25),Color3.fromRGB(200,150,150) bOff.UIStroke.Color=Color3.fromRGB(80,30,35) 
        workspace.CurrentCamera.FieldOfView=70 numF.Text="70" sBtnF.Position=UDim2.new(0.53,-6,0.5,-6) sFilF.Size=UDim2.new(0.53,0,1,0) 
    else 
        bOff.Text,bOff.BackgroundColor3,bOff.TextColor3="ON",Color3.fromRGB(40,240,150),Color3.fromRGB(15,15,18) bOff.UIStroke.Color=Color3.fromRGB(50,255,160) 
        workspace.CurrentCamera.FieldOfView=tonumber(numF.Text) or 70 
    end 
end) 

-- ==========================================
-- ЧАСТЬ 4 ИЗ 4: КОРБЛОКС, ХЕДЛЕСС И РОГА
-- ==========================================


local originalLegData = {} 
local KORBLOX_MESH_ID, KORBLOX_TEXTURE_ID, DARK_GREY_COLOR = "rbxassetid://101851696", "rbxassetid://101851254", Color3.fromRGB(64,64,64)

local function applyKorbloxLocal()
    local char = p.Character if not char then return end 
    local hum = char:FindFirstChildOfClass("Humanoid") if not hum then return end
    
    if hum.RigType == Enum.HumanoidRigType.R15 then
        local rf, rl, ru = char:FindFirstChild("RightFoot"), char:FindFirstChild("RightLowerLeg"), char:FindFirstChild("RightUpperLeg")
        if ru and rl and rf then
            if not originalLegData["R15"] then 
                originalLegData["R15"] = {
                    ru_MeshId = ru.MeshId, ru_TextureID = ru.TextureID, ru_Color = ru.Color,
                    ru_Transparency = ru.Transparency, rl_Transparency = rl.Transparency, rf_Transparency = rf.Transparency
                } 
            end
            rf.Transparency, rl.Transparency = 1, 1
            ru.MeshId, ru.TextureID, ru.Color, ru.Transparency = "rbxassetid://902942096", "rbxassetid://902843398", Color3.new(1,1,1), 0
        end
    else
        local rightLeg = char:FindFirstChild("Right Leg")
        if rightLeg and rightLeg:IsA("BasePart") then
            if not originalLegData["R6_Color"] then
                originalLegData["R6_Color"] = rightLeg.Color
                local existingMesh = rightLeg:FindFirstChildOfClass("SpecialMesh")
                originalLegData["R6_Mesh"] = existingMesh and existingMesh:Clone() or nil
            end
            for _,v in ipairs(char:GetChildren()) do
                if v:IsA("CharacterMesh") and v.BodyPart == Enum.BodyPart.RightLeg then v:Destroy() end
            end
            local mesh = rightLeg:FindFirstChildOfClass("SpecialMesh") or Instance.new("SpecialMesh", rightLeg)
            rightLeg.Color, rightLeg.Transparency = DARK_GREY_COLOR, 0
            mesh.MeshType = Enum.MeshType.FileMesh mesh.MeshId, mesh.TextureId = KORBLOX_MESH_ID, KORBLOX_TEXTURE_ID mesh.Scale = Vector3.new(1,1,1)
        end
    end
end

local function removeKorbloxLocal()
    local char = p.Character if not char then return end 
    local hum = char:FindFirstChildOfClass("Humanoid") if not hum then return end
    
    if hum.RigType == Enum.HumanoidRigType.R15 then
        local rf, rl, ru = char:FindFirstChild("RightFoot"), char:FindFirstChild("RightLowerLeg"), char:FindFirstChild("RightUpperLeg")
        local d = originalLegData["R15"]
        if d and ru and rl and rf then
            ru.MeshId, ru.TextureID, ru.Color, ru.Transparency = d.ru_MeshId, d.ru_TextureID, d.ru_Color, d.ru_Transparency
            rl.Transparency, rf.Transparency = d.rl_Transparency, d.rf_Transparency
            originalLegData["R15"] = nil
        end
    else
        local rightLeg = char:FindFirstChild("Right Leg")
        if rightLeg then
            local mesh = rightLeg:FindFirstChildOfClass("SpecialMesh") if mesh then mesh:Destroy() end
            if originalLegData["R6_Mesh"] then originalLegData["R6_Mesh"]:Clone().Parent = rightLeg end
            if originalLegData["R6_Color"] then rightLeg.Color = originalLegData["R6_Color"] end
            originalLegData["R6_Color"], originalLegData["R6_Mesh"] = nil, nil
        end
    end
end

bindButton(bKorbloxBtn, function()
    _G.korbloxActive = not _G.korbloxActive
    if _G.korbloxActive then 
        bKorbloxBtn.Text, bKorbloxBtn.BackgroundColor3, bKorbloxBtn.TextColor3 = "ВКЛ", Color3.fromRGB(40,240,150), Color3.fromRGB(15,15,18) bKorbloxBtn.UIStroke.Color = Color3.fromRGB(50,255,160) applyKorbloxLocal()
    else 
        bKorbloxBtn.Text, bKorbloxBtn.BackgroundColor3, bKorbloxBtn.TextColor3 = "ВЫКЛ", Color3.fromRGB(60,20,25), Color3.fromRGB(200,150,150) bKorbloxBtn.UIStroke.Color = Color3.fromRGB(80,30,35) removeKorbloxLocal() 
    end
end)

task.spawn(function() while SCRIPT_GENERATION == _G.AngelWScriptGeneration do if _G.korbloxActive and p.Character then applyKorbloxLocal() end task.wait(0.5) end end)

local activeAccessories = {} local headlessConnection = nil local headIds = {215718515, 74891470, 1744060292}

local function weldParts(part0, part1, c0, c1)
    for _, child in pairs(part1:GetChildren()) do if child:IsA("Weld") or child:IsA("WeldConstraint") or child.Name == "AccessoryWeld" then child:Destroy() end end
    local weld = Instance.new("Weld") weld.Name, weld.Part0, weld.Part1, weld.C0, weld.C1, weld.Parent = "AccessoryWeld", part0, part1, c0, c1, part0 return weld
end

local function safeGetObjects(assetId)
    local success, result = pcall(function() return game:GetObjects("rbxassetid://" .. tostring(assetId)) end)
    if success and result and #result > 0 then return result end return nil
end

local function addAccessoryToCharacter(accessoryId, parentPart, character)
    if not parentPart or not parentPart.Parent then return end 
    local accessoryKey = tostring(accessoryId) .. "_" .. parentPart.Name 
    if activeAccessories[accessoryKey] then return end
    
    local objects = safeGetObjects(accessoryId) 
    if objects then 
        for _, obj in pairs(objects) do
            if obj:IsA("Accessory") or obj:IsA("Model") then
                local handle = obj:FindFirstChild("Handle")
                if handle and handle:IsA("BasePart") then
                    obj.Name = obj.Name .. "_Custom"
                    local attachment = handle:FindFirstChildOfClass("Attachment")
                    if attachment then
                        local pAttach = nil 
                        for _, d in pairs(parentPart:GetDescendants()) do 
                            if d:IsA("Attachment") and d.Name == attachment.Name then pAttach = d break end 
                        end
                        if pAttach then weldParts(parentPart, handle, pAttach.CFrame, attachment.CFrame) else weldParts(parentPart, handle, CFrame.new(), attachment.CFrame) end
                    else
                        local attPoint = obj:FindFirstChild("AttachmentPoint") 
                        local c1 = attPoint and attPoint.CFrame or CFrame.new() 
                        local offset = parentPart.Name == "Head" and CFrame.new(0, 0.5, 0) or CFrame.new() 
                        weldParts(parentPart, handle, offset, c1)
                    end
                    handle.CanCollide = false
                    obj.Parent = character
                    activeAccessories[accessoryKey] = obj
                    break
                end
            end
        end
    end
end

local function forceHeadless(head)
    if not head or not head.Parent then return end head.Transparency = 1
    for _, child in pairs(head:GetChildren()) do if child:IsA("Decal") or child.Name == "face" then child.Transparency = 1 end end
    local headMesh = head:FindFirstChildOfClass("SpecialMesh") or head:FindFirstChild("Mesh") if headMesh then headMesh.Scale = Vector3.new(0.001, 0.001, 0.001) end
end

local function clearAllVisuals()
    if headlessConnection then headlessConnection:Disconnect() headlessConnection = nil end
    for key, acc in pairs(activeAccessories) do if acc and acc.Parent then acc:Destroy() end end table.clear(activeAccessories)
    local char = p.Character local head = char and char:FindFirstChild("Head")
    if head then
        head.Transparency = 0 for _, child in pairs(head:GetChildren()) do if child:IsA("Decal") or child.Name == "face" then child.Transparency = 0 end end
        local headMesh = head:FindFirstChildOfClass("SpecialMesh") or head:FindFirstChild("Mesh") if headMesh then headMesh.Scale = Vector3.new(1, 1, 1) end
    end
end

local function applyVisualsOnce(spawnHorns)
    local char = p.Character if not char then return end local head = char:WaitForChild("Head", 3) if not head then return end forceHeadless(head)
    if spawnHorns then for _, id in ipairs(headIds) do local accessoryKey = tostring(id) .. "_" .. head.Name if not activeAccessories[accessoryKey] then task.spawn(function() addAccessoryToCharacter(id, head, char) end) end end end
    if not headlessConnection then
        headlessConnection = run.Heartbeat:Connect(function()
            if (_G.headlessActive or _G.onlyHeadlessActive) and char and char.Parent and head and head.Parent then
                head.Transparency = 1 for _, child in pairs(head:GetChildren()) do if (child:IsA("Decal") or child.Name == "face") and child.Transparency ~= 1 then child.Transparency = 1 end end
            else if headlessConnection then headlessConnection:Disconnect() headlessConnection = nil end end
        end)
    end
end

bindButton(bHeadlessBtn, function()
    if _G.onlyHeadlessActive then
        _G.onlyHeadlessActive=false
        bOnlyHeadlessBtn.Text,bOnlyHeadlessBtn.BackgroundColor3,bOnlyHeadlessBtn.TextColor3="ВЫКЛ",Color3.fromRGB(60,20,25),Color3.fromRGB(200,150,150)
        bOnlyHeadlessBtn.UIStroke.Color=Color3.fromRGB(80,30,35)
    end
    _G.headlessActive = not _G.headlessActive
    if _G.headlessActive then bHeadlessBtn.Text, bHeadlessBtn.BackgroundColor3, bHeadlessBtn.TextColor3 = "ВКЛ", Color3.fromRGB(40, 240, 150), Color3.fromRGB(15, 15, 18) bHeadlessBtn.UIStroke.Color = Color3.fromRGB(50, 255, 160) applyVisualsOnce(true)
    else bHeadlessBtn.Text, bHeadlessBtn.BackgroundColor3, bHeadlessBtn.TextColor3 = "ВЫКЛ", Color3.fromRGB(60, 20, 25), Color3.fromRGB(200, 150, 150) bHeadlessBtn.UIStroke.Color = Color3.fromRGB(80, 30, 35) clearAllVisuals() end
end)

bindButton(bOnlyHeadlessBtn, function()
    if _G.headlessActive then
        _G.headlessActive=false
        bHeadlessBtn.Text,bHeadlessBtn.BackgroundColor3,bHeadlessBtn.TextColor3="ВЫКЛ",Color3.fromRGB(60,20,25),Color3.fromRGB(200,150,150)
        bHeadlessBtn.UIStroke.Color=Color3.fromRGB(80,30,35)
    end
    _G.onlyHeadlessActive = not _G.onlyHeadlessActive
    if _G.onlyHeadlessActive then bOnlyHeadlessBtn.Text, bOnlyHeadlessBtn.BackgroundColor3, bOnlyHeadlessBtn.TextColor3 = "ВКЛ", Color3.fromRGB(40, 240, 150), Color3.fromRGB(15, 15, 18) bOnlyHeadlessBtn.UIStroke.Color = Color3.fromRGB(50, 255, 160) applyVisualsOnce(false)
    else bOnlyHeadlessBtn.Text, bOnlyHeadlessBtn.BackgroundColor3, bOnlyHeadlessBtn.TextColor3 = "ВЫКЛ", Color3.fromRGB(60, 20, 25), Color3.fromRGB(200, 150, 150) bOnlyHeadlessBtn.UIStroke.Color = Color3.fromRGB(80, 30, 35) clearAllVisuals() end
end)

p.CharacterAdded:Connect(function(char)
    if SCRIPT_GENERATION ~= _G.AngelWScriptGeneration then return end
    task.wait(1)
    if not char or not char.Parent then return end
    table.clear(activeAccessories)
    if _G.korbloxActive then applyKorbloxLocal() end
    if _G.headlessActive then applyVisualsOnce(true) end
    if _G.onlyHeadlessActive then applyVisualsOnce(false) end
end)

sg.Destroying:Connect(function() 
    clearAllVisuals() 
end)




-- Начальное состояние
showSettings()
