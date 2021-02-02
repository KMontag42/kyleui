local _, kyleUI = ...
local m = kyleUI:CreateModule("omnicc")

local eventHandler = CreateFrame("Frame", nil, UIParent)
eventHandler:SetScript(
    "OnEvent",
    function(self, event, ...)
        return self[event](self, ...)
    end
)

function m:Setup(addonProfileKey)
    -- OmniCC
    if OmniCCDB ~= nil and OmniCCDB["profiles"][addonProfileKey] == nil then
        OmniCCDB["profiles"][addonProfileKey] = {
            ["rules"] = {
                {
                    ["enabled"] = false,
                    ["patterns"] = {
                        "Aura", -- [1]
                        "Buff", -- [2]
                        "Debuff" -- [3]
                    },
                    ["name"] = "Auras",
                    ["id"] = "auras"
                }, -- [1]
                {
                    ["enabled"] = false,
                    ["patterns"] = {
                        "Plate" -- [1]
                    },
                    ["name"] = "Unit Nameplates",
                    ["id"] = "plates"
                }, -- [2]
                {
                    ["enabled"] = false,
                    ["patterns"] = {
                        "ActionButton" -- [1]
                    },
                    ["name"] = "ActionBars",
                    ["id"] = "actions"
                } -- [3]
            },
            ["themes"] = {
                ["Default"] = {
                    ["textStyles"] = {
                        ["minutes"] = {},
                        ["soon"] = {},
                        ["seconds"] = {}
                    },
                    ["fontFace"] = "Fonts\\ARIALN.TTF"
                }
            }
        }

        print("kyleUI profile installed for OmniCC")
    end
end
