local _, kyleUI = ...
local m = kyleUI:CreateModule("sarena")

local eventHandler = CreateFrame("Frame", nil, UIParent)
eventHandler:SetScript(
    "OnEvent",
    function(self, event, ...)
        return self[event](self, ...)
    end
)

function m:Setup(addonProfileKey)
    -- sArena
    if sArena3DB["profiles"][addonProfileKey] == nil then
        sArena3DB["profiles"][addonProfileKey] = {
            ["layoutSettings"] = {
                ["Xaryu"] = {
                    ["posY"] = 80
                }
            },
            ["currentLayout"] = "Xaryu"
        }

        print("kyleUI profile installed for sArena")
    end
end
