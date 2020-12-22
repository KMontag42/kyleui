local _, kyleUI = ...
local m = kyleUI:CreateModule("xarui")

local eventHandler = CreateFrame("Frame", nil, UIParent)
eventHandler:SetScript(
    "OnEvent",
    function(self, event, ...)
        return self[event](self, ...)
    end
)

function m:Setup(addonProfileKey)
    -- XarUI
    if XarUIDB["profiles"][addonProfileKey] == nil then
        XarUIDB["profiles"][addonProfileKey] = {
            ["Misc"] = {
                ["hideUIErrorsFrame"] = false,
                ["hideBags"] = true,
                ["hideLOCBackground"] = true,
                ["hideEffects"] = true,
                ["hideGlow"] = true,
                ["postureChecks"] = 20,
                ["hidePostureChecksInInstances"] = false
            },
            ["Actionbar"] = {
                ["hideMacroNames"] = true,
                ["hideHotkeys"] = false,
                ["extraButtons"] = true,
                ["hideArrows"] = true,
                ["hideXPBar"] = true
            },
            ["Unitframes"] = {
                ["hideFeedbackText"] = true,
                ["combatIndicator"] = true,
                ["hidePvpIcons"] = true
            }
        }

        print("kyleUI profile installed for XarUI")
    end
end
