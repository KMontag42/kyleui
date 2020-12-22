local _, kyleUI = ...
local m = kyleUI:CreateModule("jaxpartycastbars")

local eventHandler = CreateFrame("Frame", nil, UIParent)
eventHandler:SetScript(
    "OnEvent",
    function(self, event, ...)
        return self[event](self, ...)
    end
)

function m:Setup(addonProfileKey)
    -- jaxPartyCastBars
    if jpcbDB["profiles"][addonProfileKey] == nil then
        jpcbDB["profiles"][addonProfileKey] = {
            ["attachPointBar"] = "BOTTOMLEFT",
            ["offsetX"] = 0,
            ["attachPointFrame"] = "BOTTOMRIGHT"
        }

        print("kyleUI profile installed for jaxPartyCastBars")
    end
end
