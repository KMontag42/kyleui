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
    PlayerPVPIcon:SetAlpha(0)
    PlayerPrestigeBadge:SetAlpha(0)
    PlayerPrestigePortrait:SetAlpha(0)
    TargetFrameTextureFramePVPIcon:SetAlpha(0)
    TargetFrameTextureFramePrestigeBadge:SetAlpha(0)
    TargetFrameTextureFramePrestigePortrait:SetAlpha(0)
    FocusFrameTextureFramePVPIcon:SetAlpha(0)
    FocusFrameTextureFramePrestigeBadge:SetAlpha(0)
    FocusFrameTextureFramePrestigePortrait:SetAlpha(0)
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
