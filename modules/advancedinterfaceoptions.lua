local _, kyleUI = ...
local m = kyleUI:CreateModule("advancedinterfaceoptions")

local eventHandler = CreateFrame("Frame", nil, UIParent)
eventHandler:SetScript(
    "OnEvent",
    function(self, event, ...)
        return self[event](self, ...)
    end
)

function m:Setup(addonProfileKey)
    if AdvancedInterfaceOptionsSaved ~= nil and AdvancedInterfaceOptionsSaved["kyleUI"] ~= nil then
        AdvancedInterfaceOptionsSaved = {
            ["kyleUI"] = true,
            ["CustomVars"] = {},
            ["DBVersion"] = 3,
            ["ModifiedCVars"] = {},
            ["CharVars"] = {},
            ["AccountVars"] = {
                ["nameplateShowOnlyNames"] = "0",
                ["nameplateShowSelf"] = "1",
                ["floatingCombatTextCombatHealingAbsorbSelf"] = "0",
                ["UnitNameGuildTitle"] = "0",
                ["floatingCombatTextSpellMechanicsOther"] = "1",
                ["UnitNameForceHideMinus"] = "1",
                ["floatingCombatTextReactives"] = "0",
                ["UnitNameEnemyMinionName"] = "0",
                ["floatingCombatTextCombatDamageDirectionalScale"] = "0",
                ["nameplateSelectedScale"] = "1.25",
                ["NameplatePersonalShowInCombat"] = "1",
                ["floatingCombatTextCombatDamage"] = "0",
                ["floatingCombatTextSpellMechanics"] = "1",
                ["UnitNamePlayerPVPTitle"] = "0",
                ["nameplateSelfScale"] = "1",
                ["floatingCombatTextCombatHealingAbsorbTarget"] = "0",
                ["UnitNamePlayerGuild"] = "0",
                ["scriptErrors"] = "0",
                ["floatingCombatTextPetMeleeDamage"] = "0",
                ["UnitNameEnemyPlayerName"] = "0",
                ["nameplateOtherAtBase"] = "0",
                ["UnitNameEnemyGuardianName"] = "0",
                ["floatingCombatTextLowManaHealth"] = "0",
                ["floatingCombatTextPetSpellDamage"] = "0",
                ["nameplateSelfAlpha"] = ".5",
                ["UnitNameEnemyTotemName"] = "0",
                ["floatingCombatTextCombatLogPeriodicSpells"] = "0",
                ["secureAbilityToggle"] = "0",
                ["mapFade"] = "0"
            },
            ["EnforceSettings"] = true
        }
    end

    print("kyleUI configured advanced interface options!")
end
