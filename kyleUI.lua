local addonName, kyleUI = ...

-- code modules (pattern from XarUI)
kyleUI.modules = {}

function kyleUI:CreateModule(m)
    self.modules[m] = {}
    return self.modules[m]
end

-- create base frame, setup scripts, register onloaded event
local eventHandler = CreateFrame("Frame", nil, UIParent)
eventHandler:SetScript(
    "OnEvent",
    function(self, event, ...)
        return self[event](self, ...)
    end
)
eventHandler:RegisterEvent("ADDON_LOADED")

-- run our simple scripts on load
function eventHandler:ADDON_LOADED(addon)
    if addon ~= addonName then
        return
    end

    -- sort myself to the bottom all the time
    -- this only works when the sort type is set to group
    LoadAddOn("Blizzard_CompactRaidFrames")
    CRFSort_Group = function(t1, t2)
        if UnitIsUnit(t1, "player") then
            return false
        elseif UnitIsUnit(t2, "player") then
            return true
        else
            return t1 < t2
        end
    end
    CompactRaidFrameContainer.flowSortFunc = CRFSort_Group

    -- arena nameplate numbers
    local U = UnitIsUnit
    hooksecurefunc(
        "CompactUnitFrame_UpdateName",
        function(F)
            if IsActiveBattlefieldArena() and F.unit:find("nameplate") then
                for i = 1, 5 do
                    if U(F.unit, "arena" .. i) then
                        F.name:SetText(i)
                        F.name:SetTextColor(1, 1, 0)
                        break
                    end
                end
            end
        end
    )

    -- remove pvp icons
    local playerFrameTargetContextual = PlayerFrame_GetPlayerFrameContentContextual()
    local targetFrameContextual = TargetFrame.TargetFrameContent.TargetFrameContentContextual
    -- Self
    playerFrameTargetContextual.PVPIcon:SetAlpha(0)
    playerFrameTargetContextual.PrestigePortrait:SetAlpha(0)
    playerFrameTargetContextual.PrestigeBadge:SetAlpha(0)
    -- Target frames
    TargetFrame.TargetFrameContent.TargetFrameContentContextual.PrestigePortrait:SetAlpha(0)
    TargetFrame.TargetFrameContent.TargetFrameContentContextual.PrestigeBadge:SetAlpha(0)

    -- combat indicator
    local targetFrame = CreateFrame("Frame", nil , TargetFrame)
    targetFrame:SetPoint("LEFT", TargetFrame, "RIGHT", -25, 10)
    targetFrame:SetSize(26,26)
    targetFrame.icon = targetFrame:CreateTexture(nil, "BORDER")
    targetFrame.icon:SetAllPoints()
    targetFrame.icon:SetTexture([[Interface\Icons\ABILITY_DUALWIELD]])
    targetFrame:Hide()

    local focusFrame = CreateFrame("Frame", nil , FocusFrame)
    focusFrame:SetPoint("LEFT", FocusFrame, "RIGHT", -25, 10)
    focusFrame:SetSize(26,26)
    focusFrame.icon = focusFrame:CreateTexture(nil, "BORDER")
    focusFrame.icon:SetAllPoints()
    focusFrame.icon:SetTexture([[Interface\Icons\ABILITY_DUALWIELD]])
    focusFrame:Hide()

    local UnitAffectingCombat = UnitAffectingCombat

    local function CombatIndicator_Update()
        targetFrame:SetShown(UnitAffectingCombat("target"))
        focusFrame:SetShown(UnitAffectingCombat("focus"))
    end

    C_Timer.NewTicker(0.1, CombatIndicator_Update)

    -- set class colors
    local	UnitIsPlayer, UnitIsConnected, UnitClass, RAID_CLASS_COLORS, PlayerFrameHealthBar =
    UnitIsPlayer, UnitIsConnected, UnitClass, RAID_CLASS_COLORS, PlayerFrameHealthBar
    local _, class, c

    local function ColorStatusbar(statusbar, unit)
        if UnitIsPlayer(unit) and UnitIsConnected(unit) and UnitClass(unit) then
            if unit == statusbar.unit then
                _, class = UnitClass(unit)
                c = RAID_CLASS_COLORS[class]
                statusbar:SetStatusBarColor(c.r, c.g, c.b)
            end
        end
    end

    hooksecurefunc("UnitFrameHealthBar_Update", ColorStatusbar)
    hooksecurefunc("HealthBar_OnValueChanged", function(self) ColorStatusbar(self, self.unit) end)

    -- Hide backpack symbol
    MainMenuBarBackpackButton:Hide()
    -- Hide toggle
    BagBarExpandToggle:Hide()
    -- Loop through all bag buttons
    for i = 0, 3 do
        local bagButton = _G["CharacterBag"..i.."Slot"]
        bagButton:Hide()
    end
    -- Hide reagent bag
    CharacterReagentBag0Slot:Hide()

    local micro_buttons_to_hide = {
        "CharacterMicroButton",
        "SpellbookMicroButton",
        "TalentMicroButton",
        "AchievementMicroButton",
        "QuestLogMicroButton",
        "GuildMicroButton",
        "LFDMicroButton",
        "CollectionsMicroButton",
        "EJMicroButton",
        "StoreMicroButton",
        "MainMenuMicroButton"
    }
    -- Hide all micro buttons - Character, Spellbook, Talent, Achievement, Quest, Guild, LFD, Collections, Store, MainMenu
    for i = 1, #micro_buttons_to_hide do
        local button = _G[micro_buttons_to_hide[i]]
        button:SetScript("OnShow", button.Hide)
        button.Show = function () end
        button:Hide()
    end

    -- Create hidden frame to store unwanted frames (more efficient than creating functions)
    local tframe = CreateFrame("FRAME")
    tframe:Hide()

    -- Function to enable mouse scrolling with CTRL and SHIFT key modifiers
    local function AddMouseScroll(chtfrm)
        if _G[chtfrm] then
            _G[chtfrm]:SetScript("OnMouseWheel", function(self, direction)
                if direction == 1 then
                    if IsControlKeyDown() then
                        self:ScrollToTop()
                    elseif IsShiftKeyDown() then
                        self:PageUp()
                    else
                        self:ScrollUp()
                    end
                else
                    if IsControlKeyDown() then
                        self:ScrollToBottom()
                    elseif IsShiftKeyDown() then
                        self:PageDown()
                    else
                        self:ScrollDown()
                    end
                end
            end)
            _G[chtfrm]:EnableMouseWheel(true)
        end
    end

    -- Function to hide chat buttons
    local function HideButtons(chtfrm)
        _G[chtfrm .. "ButtonFrameMinimizeButton"]:SetParent(tframe)
        _G[chtfrm .. "ButtonFrameMinimizeButton"]:Hide();
        _G[chtfrm .. "ButtonFrame"]:SetSize(0.1,0.1)
        _G[chtfrm].ScrollBar:SetParent(tframe)
        _G[chtfrm].ScrollBar:Hide()
    end

    -- Function to highlight chat tabs and click to scroll to bottom
    local function HighlightTabs(chtfrm)
        -- Set position of bottom button
        _G[chtfrm].ScrollToBottomButton.Flash:SetTexture("Interface/BUTTONS/GRADBLUE.png")
        _G[chtfrm].ScrollToBottomButton:ClearAllPoints()
        _G[chtfrm].ScrollToBottomButton:SetPoint("BOTTOM",_G[chtfrm .. "Tab"],0,-4)
        _G[chtfrm].ScrollToBottomButton:Show()
        _G[chtfrm].ScrollToBottomButton:SetWidth(_G[chtfrm .. "Tab"]:GetWidth() - 12)
        _G[chtfrm].ScrollToBottomButton:SetHeight(24)

        -- Resize bottom button according to tab size
        _G[chtfrm .. "Tab"]:SetScript("OnSizeChanged", function()
            for j = 1, 50 do
                -- Resize bottom button to tab width
                if _G["ChatFrame" .. j] and _G["ChatFrame" .. j].ScrollToBottomButton then
                    _G["ChatFrame" .. j].ScrollToBottomButton:SetWidth(_G["ChatFrame" .. j .. "Tab"]:GetWidth() - 12)
                end
            end
        end)

        -- Remove click from the bottom button
        _G[chtfrm].ScrollToBottomButton:SetScript("OnClick", nil)

        -- Remove textures
        _G[chtfrm].ScrollToBottomButton:SetNormalTexture("")
        _G[chtfrm].ScrollToBottomButton:SetHighlightTexture("")
        _G[chtfrm].ScrollToBottomButton:SetPushedTexture("")

        -- Always scroll to bottom when clicking a tab
        _G[chtfrm .. "Tab"]:HookScript("OnClick", function(self,arg1)
            if arg1 == "LeftButton" then
                _G[chtfrm]:ScrollToBottom();
            end
        end)

    end

    -- Hide chat menu buttons
    ChatFrameMenuButton:SetParent(tframe)
    ChatFrameChannelButton:SetParent(tframe)
    ChatFrameToggleVoiceDeafenButton:SetParent(tframe)
    ChatFrameToggleVoiceMuteButton:SetParent(tframe)

    -- Set options for normal and existing chat frames
    for i = 1, 50 do
        if _G["ChatFrame" .. i] then
            AddMouseScroll("ChatFrame" .. i);
            HideButtons("ChatFrame" .. i);
            HighlightTabs("ChatFrame" .. i)
        end
    end

    -- Do the functions above for temporary chat frames
    hooksecurefunc("FCF_OpenTemporaryWindow", function(chatType)
        local cf = FCF_GetCurrentChatFrame():GetName() or nil
        if cf then
            -- Set options for temporary frame
            AddMouseScroll(cf)
            HideButtons(cf)
            HighlightTabs(cf)
            -- Resize flashing alert to match tab width
            _G[cf .. "Tab"]:SetScript("OnSizeChanged", function()
                _G[cf].ScrollToBottomButton:SetWidth(_G[cf .. "Tab"]:GetWidth()-10)
            end)
        end
    end)
    -- Create hidden frame to store social button
    local tframe = CreateFrame("FRAME")
    tframe:Hide()
    QuickJoinToastButton:SetParent(tframe)

end

function eventHandler:MERCHANT_SHOW()
    local timer = 0.15
    for bag = 0, 4 do
        for slot = 0, GetContainerNumSlots(bag) do
            local link = GetContainerItemLink(bag, slot)
            if link and select(3, GetItemInfo(link)) == 0 then
                C_Timer.After(timer, function() UseContainerItem(bag, slot) end)
                timer = timer + 0.15
            end
        end
    end

    local repairAllCost, canRepair = GetRepairAllCost()
    if canRepair and repairAllCost <= GetMoney() then
        RepairAllItems(false)
    end
end

-- underscore b/c the interface options stuff is a bit wonky
function kyleUI_SetupAddons()
    local addonProfileKey = "kyleUI"

    local addons = {}

    for i, addon in pairs(addons) do
        if kyleUI.modules[addon] then
            kyleUI.modules[addon]:Setup("kyleUI")
        end
    end

    print("kyleUI profiles installed, be sure to activate any newly installed ones :)!")
end
