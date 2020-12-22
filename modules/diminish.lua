local _, kyleUI = ...
local m = kyleUI:CreateModule("diminish")

local eventHandler = CreateFrame("Frame", nil, UIParent)
eventHandler:SetScript(
    "OnEvent",
    function(self, event, ...)
        return self[event](self, ...)
    end
)

function m:Setup(addonProfileKey)
    -- Diminish
    if DiminishDB["profiles"][addonProfileKey] == nil then
        DiminishDB["profiles"][addonProfileKey] = {
            ["categoryTextures"] = {},
            ["timerSwipe"] = true,
            ["border"] = {
                ["edgeSize"] = 2.5,
                ["layer"] = "BORDER",
                ["name"] = "Default",
                ["edgeFile"] = "Interface\\BUTTONS\\UI-Quickslot-Depress"
            },
            ["timerStartAuraEnd"] = false,
            ["timerColors"] = false,
            ["timerText"] = true,
            ["version"] = "1.4",
            ["timerTextOutline"] = "NONE",
            ["colorBlind"] = false,
            ["trackNPCs"] = false,
            ["showCategoryText"] = false,
            ["unitFrames"] = {
                ["nameplate"] = {
                    ["enabled"] = false,
                    ["iconPadding"] = 7,
                    ["watchFriendly"] = false,
                    ["disabledCategories"] = {
                        ["Disarms"] = true,
                        ["Taunts"] = true
                    },
                    ["timerTextSize"] = 12,
                    ["offsetX"] = -33,
                    ["growDirection"] = "RIGHT",
                    ["iconSize"] = 22,
                    ["offsetY"] = 71,
                    ["zones"] = {
                        ["party"] = false,
                        ["scenario"] = true,
                        ["pvp"] = true,
                        ["raid"] = false,
                        ["arena"] = true,
                        ["none"] = true
                    },
                    ["isEnabledForZone"] = false
                },
                ["player"] = {
                    ["enabled"] = true,
                    ["anchorUIParent"] = false,
                    ["iconPadding"] = 7,
                    ["watchFriendly"] = true,
                    ["disabledCategories"] = {
                        ["Disarms"] = true,
                        ["Disorients"] = true,
                        ["Knockbacks"] = true,
                        ["Taunts"] = true,
                        ["Roots"] = true,
                        ["Incapacitates"] = true
                    },
                    ["timerTextSize"] = 12,
                    ["offsetX"] = 7,
                    ["growDirection"] = "RIGHT",
                    ["iconSize"] = 26,
                    ["offsetY"] = 25,
                    ["zones"] = {
                        ["party"] = false,
                        ["scenario"] = true,
                        ["pvp"] = true,
                        ["raid"] = false,
                        ["arena"] = true,
                        ["none"] = true
                    },
                    ["isEnabledForZone"] = true
                },
                ["focus"] = {
                    ["enabled"] = false,
                    ["anchorUIParent"] = false,
                    ["iconPadding"] = 7,
                    ["watchFriendly"] = false,
                    ["disabledCategories"] = {
                        ["Disarms"] = true,
                        ["Taunts"] = true
                    },
                    ["zones"] = {
                        ["party"] = false,
                        ["scenario"] = true,
                        ["none"] = true,
                        ["raid"] = false,
                        ["arena"] = false,
                        ["pvp"] = true
                    },
                    ["offsetX"] = 104,
                    ["growDirection"] = "RIGHT",
                    ["iconSize"] = 22,
                    ["offsetY"] = 23,
                    ["timerTextSize"] = 12,
                    ["isEnabledForZone"] = false
                },
                ["target"] = {
                    ["enabled"] = false,
                    ["anchorUIParent"] = false,
                    ["iconPadding"] = 7,
                    ["watchFriendly"] = false,
                    ["disabledCategories"] = {
                        ["Disarms"] = true,
                        ["Taunts"] = true
                    },
                    ["zones"] = {
                        ["party"] = false,
                        ["scenario"] = true,
                        ["none"] = true,
                        ["raid"] = false,
                        ["arena"] = false,
                        ["pvp"] = true
                    },
                    ["offsetX"] = 104,
                    ["growDirection"] = "RIGHT",
                    ["iconSize"] = 22,
                    ["offsetY"] = 23,
                    ["timerTextSize"] = 12,
                    ["isEnabledForZone"] = false
                },
                ["arena"] = {
                    ["enabled"] = false,
                    ["anchorUIParent"] = false,
                    ["iconPadding"] = 7,
                    ["disabledCategories"] = {
                        ["Disarms"] = true,
                        ["Taunts"] = true
                    },
                    ["timerTextSize"] = 12,
                    ["offsetX"] = -66,
                    ["growDirection"] = "LEFT",
                    ["iconSize"] = 22,
                    ["offsetY"] = 20,
                    ["zones"] = {
                        ["party"] = false,
                        ["scenario"] = false,
                        ["pvp"] = false,
                        ["raid"] = false,
                        ["arena"] = true,
                        ["none"] = false
                    },
                    ["isEnabledForZone"] = false
                },
                ["party"] = {
                    ["enabled"] = false,
                    ["anchorUIParent"] = false,
                    ["iconPadding"] = 6,
                    ["watchFriendly"] = true,
                    ["disabledCategories"] = {
                        ["Disarms"] = true,
                        ["Taunts"] = true
                    },
                    ["timerTextSize"] = 12,
                    ["offsetX"] = 76,
                    ["growDirection"] = "RIGHT",
                    ["iconSize"] = 24,
                    ["offsetY"] = 7,
                    ["zones"] = {
                        ["party"] = false,
                        ["scenario"] = false,
                        ["pvp"] = false,
                        ["raid"] = false,
                        ["arena"] = true,
                        ["none"] = true
                    },
                    ["isEnabledForZone"] = false
                }
            }
        }

        print("kyleUI profile installed for Diminish")
    end
end
