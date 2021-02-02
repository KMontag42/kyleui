local _, kyleUI = ...
local m = kyleUI:CreateModule("bigdebuffs")

local eventHandler = CreateFrame("Frame", nil, UIParent)
eventHandler:SetScript(
    "OnEvent",
    function(self, event, ...)
        return self[event](self, ...)
    end
)

function m:Setup(addonProfileKey)
    -- BigDebuffs
    if BigDebuffsDB ~= nil and BigDebuffsDB["profiles"][addonProfileKey] == nil then
        BigDebuffsDB["profiles"][addonProfileKey] = {
            ["raidFrames"] = {
                ["cooldownFont"] = "Arial Narrow",
                ["maxDebuffs"] = 6,
                ["inRaid"] = {
                    ["hide"] = true
                }
            },
            ["nameplates"] = {
                ["cooldownFont"] = "Arial Narrow"
            },
            ["unitFrames"] = {
                ["cooldownFont"] = "Arial Narrow",
                ["arena1"] = {},
                ["arena"] = {
                    ["enabled"] = false
                }
            }
        }

        print("kyleUI profile installed for BigDebuffs")
    end
end
