-- hide the default menu buttons
local t, f = {
    "Character",
    "Spellbook",
    "Talent",
    "Achievement",
    "QuestLog",
    "Guild",
    "LFD",
    "Collections",
    "EJ",
    "Store",
    "MainMenu"
}
for i = 1, #t do
    f = _G[t[i] .. "MicroButton"]
    f:SetScale(.001)
end
MicroButtonAndBagsBar:Hide()

-- sort myself to the bottom all the time
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

function kyleUI_SetupAddons()
    local addonProfileKey = "kyleUI"

    -- OmniBar
    if OmniBarDB["profiles"][addonProfileKey] == nil then
        OmniBarDB["profiles"][addonProfileKey] = {
            ["bars"] = {
                ["OmniBar2"] = {
                    ["glow"] = true,
                    ["noDefault"] = true,
                    ["tooltips"] = true,
                    ["multiple"] = true,
                    ["center"] = true,
                    ["swipeAlpha"] = 0.65,
                    ["size"] = 40,
                    ["cooldownCount"] = true,
                    ["ratedBattleground"] = false,
                    ["unusedAlpha"] = 0.45,
                    ["align"] = "CENTER",
                    ["spell47528"] = false,
                    ["maxIcons"] = 500,
                    ["name"] = "Defensives",
                    ["position"] = {
                        ["relativeTo"] = "UIParent",
                        ["point"] = "CENTER",
                        ["relativePoint"] = "CENTER",
                        ["yOfs"] = -143.0120849609375,
                        ["xOfs"] = 0,
                        ["frameStrata"] = "MEDIUM"
                    },
                    ["spell212800"] = true,
                    ["arena"] = true,
                    ["spell48707"] = true,
                    ["scenario"] = false,
                    ["spell31224"] = true,
                    ["border"] = true,
                    ["names"] = false,
                    ["spell22812"] = true,
                    ["spell47585"] = true,
                    ["growUpward"] = true,
                    ["spell104773"] = true,
                    ["spell108271"] = true,
                    ["world"] = false,
                    ["spell51052"] = true,
                    ["highlightTarget"] = true,
                    ["columns"] = 20,
                    ["spell205604"] = true,
                    ["spell33206"] = true,
                    ["spell210256"] = true,
                    ["adaptive"] = true,
                    ["spell6940"] = true,
                    ["spell116849"] = true,
                    ["spell122470"] = true,
                    ["spell102342"] = true,
                    ["showUnused"] = true,
                    ["highlightFocus"] = false,
                    ["padding"] = 2,
                    ["locked"] = true,
                    ["battleground"] = false
                },
                ["OmniBar5"] = {
                    ["spell408"] = true,
                    ["glow"] = true,
                    ["noDefault"] = true,
                    ["tooltips"] = true,
                    ["spell80240"] = true,
                    ["multiple"] = true,
                    ["spell853"] = true,
                    ["highlightFocus"] = false,
                    ["spell5246"] = true,
                    ["swipeAlpha"] = 0.65,
                    ["spell221562"] = true,
                    ["size"] = 40,
                    ["cooldownCount"] = true,
                    ["ratedBattleground"] = false,
                    ["spell107570"] = true,
                    ["unusedAlpha"] = 0.45,
                    ["align"] = "RIGHT",
                    ["maxIcons"] = 500,
                    ["name"] = "CC",
                    ["position"] = {
                        ["relativeTo"] = "UIParent",
                        ["point"] = "CENTER",
                        ["relativePoint"] = "CENTER",
                        ["yOfs"] = -46.6172981262207,
                        ["xOfs"] = -154.0746002197266,
                        ["frameStrata"] = "MEDIUM"
                    },
                    ["arena"] = true,
                    ["spell2094"] = true,
                    ["scenario"] = false,
                    ["border"] = true,
                    ["names"] = false,
                    ["spell119381"] = true,
                    ["growUpward"] = true,
                    ["spell204437"] = true,
                    ["spell211881"] = true,
                    ["world"] = false,
                    ["highlightTarget"] = true,
                    ["columns"] = 20,
                    ["spell5211"] = true,
                    ["spell15487"] = true,
                    ["spell64044"] = true,
                    ["spell6789"] = true,
                    ["adaptive"] = true,
                    ["spell187650"] = true,
                    ["spell8122"] = true,
                    ["spell179057"] = true,
                    ["center"] = false,
                    ["locked"] = true,
                    ["padding"] = 2,
                    ["showUnused"] = true,
                    ["battleground"] = false
                },
                ["OmniBar1"] = {
                    ["glow"] = true,
                    ["scenario"] = false,
                    ["border"] = true,
                    ["tooltips"] = true,
                    ["names"] = false,
                    ["multiple"] = true,
                    ["highlightFocus"] = false,
                    ["growUpward"] = false,
                    ["arena"] = true,
                    ["locked"] = true,
                    ["highlightTarget"] = true,
                    ["position"] = {
                        ["relativeTo"] = "UIParent",
                        ["point"] = "CENTER",
                        ["relativePoint"] = "CENTER",
                        ["yOfs"] = -183.6007385253906,
                        ["xOfs"] = 0,
                        ["frameStrata"] = "MEDIUM"
                    },
                    ["world"] = false,
                    ["cooldownCount"] = true,
                    ["ratedBattleground"] = true,
                    ["columns"] = 20,
                    ["unusedAlpha"] = 0.45,
                    ["align"] = "CENTER",
                    ["size"] = 40,
                    ["swipeAlpha"] = 0.65,
                    ["adaptive"] = true,
                    ["maxIcons"] = 500,
                    ["showUnused"] = true,
                    ["name"] = "Interrupts",
                    ["spell31935"] = false,
                    ["spell212619"] = true,
                    ["padding"] = 2,
                    ["center"] = true,
                    ["battleground"] = false
                },
                ["OmniBar3"] = {
                    ["glow"] = true,
                    ["noDefault"] = true,
                    ["tooltips"] = true,
                    ["multiple"] = true,
                    ["spell121471"] = true,
                    ["center"] = false,
                    ["swipeAlpha"] = 0.65,
                    ["spell197871"] = true,
                    ["size"] = 40,
                    ["cooldownCount"] = true,
                    ["ratedBattleground"] = false,
                    ["unusedAlpha"] = 0.45,
                    ["align"] = "RIGHT",
                    ["maxIcons"] = 500,
                    ["name"] = "Offensives",
                    ["position"] = {
                        ["relativeTo"] = "UIParent",
                        ["point"] = "CENTER",
                        ["relativePoint"] = "CENTER",
                        ["yOfs"] = -95.60490417480469,
                        ["xOfs"] = -154.0736236572266,
                        ["frameStrata"] = "MEDIUM"
                    },
                    ["arena"] = true,
                    ["scenario"] = false,
                    ["spell190319"] = true,
                    ["border"] = true,
                    ["names"] = false,
                    ["growUpward"] = true,
                    ["spell31884"] = true,
                    ["world"] = false,
                    ["highlightTarget"] = true,
                    ["columns"] = 15,
                    ["spell185313"] = true,
                    ["spell113858"] = true,
                    ["spell2825"] = true,
                    ["spell167105"] = true,
                    ["adaptive"] = true,
                    ["spell102560"] = true,
                    ["spell79140"] = true,
                    ["spell204160"] = true,
                    ["highlightFocus"] = false,
                    ["locked"] = true,
                    ["padding"] = 2,
                    ["showUnused"] = true,
                    ["battleground"] = false
                }
            }
        }
        print("kyleUI profile installed for OmniBar")
    end

    -- OmniCC
    if OmniCCDB["profiles"][addonProfileKey] == nil then
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

    -- BigDebuffs
    if BigDebuffsDB["profiles"][addonProfileKey] == nil then
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

    -- jaxPartyCastBars
    if jpcbDB["profiles"][addonProfileKey] == nil then
        jpcbDB["profiles"][addonProfileKey] = {
            ["attachPointBar"] = "BOTTOMLEFT",
            ["offsetX"] = 0,
            ["attachPointFrame"] = "BOTTOMRIGHT"
        }

        print("kyleUI profile installed for jaxPartyCastBars")
    end

    --[[ not worried about this one right now
if AdvancedInterfaceOptionsSaved["DBVersion"] == 3 then
    AdvancedInterfaceOptionsSaved = {
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
]]
    if LeaPlusDB ~= nil then
        LeaPlusDB = {
            ["HideMiniZoomBtns"] = "On",
            ["MuteBattleShouts"] = "Off",
            ["BuffFrameX"] = -288.6411437988281,
            ["ManageWidget"] = "On",
            ["SetWeatherDensity"] = "On",
            ["ClassColPlayer"] = "On",
            ["ShowMinimapIcon"] = "Off",
            ["BordersAlpha"] = 0,
            ["InvKey"] = "inv",
            ["SaveProfFilters"] = "Off",
            ["NoGryphons"] = "Off",
            ["FrmEnabled"] = "On",
            ["TipCursorX"] = 0,
            ["PowerBarScale"] = 1,
            ["LeaStartPage"] = 6,
            ["WidgetA"] = "TOP",
            ["WidgetScale"] = 1,
            ["InviteFromWhisper"] = "Off",
            ["MinimapScale"] = 1,
            ["AutoReleasePvP"] = "On",
            ["PowerBarR"] = "BOTTOM",
            ["HideBossBanner"] = "On",
            ["BuffFrameScale"] = 1.15,
            ["UseArrowKeysInChat"] = "Off",
            ["MuteATV"] = "On",
            ["AcceptPartyFriends"] = "Off",
            ["ClassIconPortraits"] = "On",
            ["WidgetX"] = 0,
            ["FirstRunMessageSeen"] = true,
            ["NoCooldownDuration"] = "On",
            ["NoChatFade"] = "Off",
            ["NoRestedEmotes"] = "On",
            ["NoPartyInvites"] = "Off",
            ["CombatPlates"] = "Off",
            ["PowerBarX"] = 0,
            ["TipBackSimple"] = "Off",
            ["HideZoneText"] = "Off",
            ["EnhanceDressup"] = "Off",
            ["UseEasyChatResizing"] = "Off",
            ["NoAlerts"] = "Off",
            ["AutoQuestShift"] = "Off",
            ["Cooldowns"] = {
                ["DEATHKNIGHT"] = {},
                ["WARRIOR"] = {},
                ["ROGUE"] = {},
                ["MAGE"] = {},
                ["PRIEST"] = {
                    ["S3R2Pet"] = false,
                    ["S3R2Idn"] = "",
                    ["S3R1Pet"] = false,
                    ["S3R4Idn"] = "",
                    ["S3R5Idn"] = "",
                    ["S3R3Idn"] = "",
                    ["S3R3Pet"] = false,
                    ["S3R1Idn"] = "",
                    ["S3R5Pet"] = false,
                    ["S3R4Pet"] = false
                },
                ["HUNTER"] = {},
                ["WARLOCK"] = {},
                ["DEMONHUNTER"] = {},
                ["SHAMAN"] = {},
                ["DRUID"] = {},
                ["MONK"] = {},
                ["PALADIN"] = {
                    ["S5R2Idn"] = "",
                    ["S5R1Pet"] = false,
                    ["S5R4Pet"] = false,
                    ["S5R3Idn"] = "",
                    ["S5R1Idn"] = "",
                    ["S5R5Pet"] = false,
                    ["S5R2Pet"] = false,
                    ["S5R3Pet"] = false,
                    ["S5R5Idn"] = "",
                    ["S5R4Idn"] = ""
                }
            },
            ["LeaPlusQuestFontSize"] = 12,
            ["TipShowTarget"] = "On",
            ["BuffFrameA"] = "TOPRIGHT",
            ["NoPetDuels"] = "On",
            ["NoDuelRequests"] = "Off",
            ["QuestFontChange"] = "Off",
            ["NoRaidRestrictions"] = "Off",
            ["TipOffsetX"] = -13,
            ["ManagePowerBar"] = "Off",
            ["HideCleanupBtns"] = "Off",
            ["AutoQuestNoDaily"] = "Off",
            ["MuteR21X"] = "On",
            ["AutoRepairGuildFunds"] = "Off",
            ["NoClassBar"] = "Off",
            ["NoStickyEditbox"] = "Off",
            ["TooltipAnchorMenu"] = 1,
            ["BordersRight"] = 0,
            ["MuteTravelers"] = "On",
            ["HideBodyguard"] = "On",
            ["Frames"] = {
                ["MirrorTimer1"] = {
                    ["Point"] = "TOP",
                    ["XOffset"] = -5,
                    ["Relative"] = "TOP",
                    ["Scale"] = 1,
                    ["YOffset"] = -95.99999237060547
                },
                ["TargetFrame"] = {
                    ["Point"] = "TOP",
                    ["XOffset"] = -219.4817199707031,
                    ["Relative"] = "TOP",
                    ["Scale"] = 1,
                    ["YOffset"] = -121.7283096313477
                },
                ["GhostFrame"] = {
                    ["Point"] = "CENTER",
                    ["XOffset"] = -8.950528144836426,
                    ["Relative"] = "CENTER",
                    ["Scale"] = 1,
                    ["YOffset"] = 167.6543273925781
                },
                ["PlayerFrame"] = {
                    ["Point"] = "TOPLEFT",
                    ["XOffset"] = 197.4938812255859,
                    ["Relative"] = "TOPLEFT",
                    ["Scale"] = 1,
                    ["YOffset"] = -121.7283706665039
                }
            },
            ["WidgetY"] = -15,
            ["MuteVaults"] = "On",
            ["ShowWowheadLinks"] = "Off",
            ["UnclampChat"] = "On",
            ["PowerBarY"] = 115,
            ["AutoQuestCompleted"] = "On",
            ["NoConfirmLoot"] = "Off",
            ["ClassColFrames"] = "Off",
            ["NoStickyChat"] = "Off",
            ["LeaPlusMailFontSize"] = 15,
            ["WidgetR"] = "TOP",
            ["NoFriendRequests"] = "Off",
            ["NoCommandBar"] = "Off",
            ["ShowVolumeInFrame"] = "Off",
            ["HideLevelUpDisplay"] = "Off",
            ["DurabilityStatus"] = "Off",
            ["NoChatButtons"] = "On",
            ["MusicContinent"] = "Zones",
            ["AutoQuestAvailable"] = "On",
            ["NoCombatLogTab"] = "On",
            ["TipShowRank"] = "On",
            ["MuteBanLu"] = "On",
            ["PlusPanelAlpha"] = 0,
            ["LockoutSharing"] = "Off",
            ["MoveChatEditBoxToTop"] = "Off",
            ["MuteSniffing"] = "On",
            ["MuteFizzle"] = "Off",
            ["MuteGyrocopters"] = "On",
            ["ShowVolume"] = "On",
            ["MuteInterface"] = "On",
            ["MuteReady"] = "Off",
            ["AutoQuestNoWeekly"] = "Off",
            ["PlusPanelScale"] = 1,
            ["NoScreenGlow"] = "On",
            ["HideZoneTextBar"] = "On",
            ["MuteTrains"] = "On",
            ["ShowRaidToggle"] = "On",
            ["AutoAcceptSummon"] = "On",
            ["HideErrorMessages"] = "Off",
            ["WeatherLevel"] = 0,
            ["ShowPetSaveBtn"] = "Off",
            ["NoScreenEffects"] = "On",
            ["MaxChatHstory"] = "Off",
            ["MinimapMod"] = "On",
            ["ShowCooldowns"] = "Off",
            ["ClassColTarget"] = "On",
            ["MailFontChange"] = "Off",
            ["FasterMovieSkip"] = "On",
            ["ShowBorders"] = "Off",
            ["MainPanelA"] = "CENTER",
            ["ManageBuffs"] = "On",
            ["BordersLeft"] = 0,
            ["BuffFrameY"] = -126.6981048583984,
            ["FasterLooting"] = "On",
            ["BuffFrameR"] = "TOPRIGHT",
            ["EnableHotkey"] = "Off",
            ["MuteEvents"] = "On",
            ["ShowPlayerChain"] = "Off",
            ["MuteGolem"] = "On",
            ["MuteSunflower"] = "Off",
            ["NoBagAutomation"] = "Off",
            ["AutoSellJunk"] = "On",
            ["AutoRepairGear"] = "On",
            ["MuteGameSounds"] = "On",
            ["SyncFromFriends"] = "Off",
            ["AutoAcceptRes"] = "On",
            ["TipCursorY"] = 0,
            ["HideTalkingFrame"] = "On",
            ["TipOffsetY"] = 94,
            ["AutomateGossip"] = "On",
            ["CharAddonList"] = "Off",
            ["NoPetAutomation"] = "Off",
            ["UnivGroupColor"] = "Off",
            ["AutomateQuests"] = "On",
            ["PowerBarA"] = "BOTTOM",
            ["LeaPlusTipSize"] = 1,
            ["TipModEnable"] = "Off",
            ["EasyItemDestroy"] = "Off",
            ["AutoConfirmRole"] = "Off",
            ["RecentChatWindow"] = "Off",
            ["hide"] = true,
            ["HideMiniClock"] = "Off",
            ["MainPanelR"] = "CENTER",
            ["MainPanelY"] = 74.82929992675781,
            ["MainPanelX"] = 213.9377593994141,
            ["ShowCooldownID"] = "On",
            ["NoHitIndicators"] = "On",
            ["TipHideInCombat"] = "Off",
            ["NoSocialButton"] = "On",
            ["MuteBalls"] = "On",
            ["InviteFriendsOnly"] = "Off",
            ["PlayerChainMenu"] = 2,
            ["BordersBottom"] = 0,
            ["MuteBikes"] = "On",
            ["MuteHorned"] = "On",
            ["BordersTop"] = 0,
            ["MaxCameraZoom"] = "On"
        }

        print("kyleUI configured Leatrix Plus")
    end

    if ATTDB ~= nil then
        ATTDB = {
            ["classSelected"] = "WARRIOR",
            ["growLeft"] = true,
            ["showRacial"] = true,
            ["scale"] = 0.7,
            ["showSelf"] = false,
            ["tworows"] = true,
            ["offsetX"] = 0,
            ["lock"] = true,
            ["Trinkets"] = {
                ["pvptrinket"] = true
            },
            ["positions"] = {
                {
                    ["y"] = -548.6220853768191,
                    ["x"] = 915.5557964399632
                }, -- [1]
                {
                    ["y"] = -510.9328825558114,
                    ["x"] = 916.2674846424416
                }, -- [2]
                {
                    ["y"] = -472.5332625894007,
                    ["x"] = 916.2669658436353
                }, -- [3]
                {
                    ["y"] = -432.7107071970186,
                    ["x"] = 917.689097131457
                }, -- [4]
                {
                    ["y"] = -395.733088818728,
                    ["x"] = 917.6894084107407
                } -- [5]
            },
            ["dampening"] = true,
            ["showTooltip"] = true,
            ["iconOffsetY"] = 2,
            ["attach"] = 1,
            ["outside"] = true,
            ["hidden"] = false,
            ["dungeons"] = true,
            ["horizontal"] = false,
            ["version"] = 9.3,
            ["abilities"] = {
                ["HUNTER"] = {
                    ["254"] = {
                        {
                            ["ability"] = "Counter Shot",
                            ["cooldown"] = 24,
                            ["id"] = 147362
                        } -- [1]
                    },
                    ["255"] = {},
                    ["253"] = {
                        {
                            ["ability"] = "Counter Shot",
                            ["cooldown"] = 24,
                            ["id"] = 147362
                        } -- [1]
                    },
                    ["ALL"] = {
                        {
                            ["ability"] = "Aspect of the Turtle",
                            ["cooldown"] = 180,
                            ["id"] = 186265
                        }, -- [1]
                        {
                            ["ability"] = "Freezing Trap",
                            ["cooldown"] = 30,
                            ["id"] = 187650
                        }, -- [2]
                        {
                            ["ability"] = "Roar of Sacrifice",
                            ["cooldown"] = 60,
                            ["id"] = 53480
                        }, -- [3]
                        {
                            ["ability"] = "Feign Death",
                            ["cooldown"] = 30,
                            ["id"] = 5384
                        }, -- [4]
                        {
                            ["ability"] = "Exhilaration",
                            ["cooldown"] = 120,
                            ["id"] = 109304
                        }, -- [5]
                        {
                            ["ability"] = "A Murder of Crows",
                            ["cooldown"] = 60,
                            ["id"] = 131894
                        } -- [6]
                    }
                },
                ["WARRIOR"] = {
                    ["71"] = {
                        {
                            ["ability"] = "Intimidating Shout",
                            ["cooldown"] = 90,
                            ["id"] = 5246
                        }, -- [1]
                        {
                            ["ability"] = "Die by the Sword",
                            ["cooldown"] = 180,
                            ["id"] = 118038
                        }, -- [2]
                        {
                            ["ability"] = "Avatar",
                            ["cooldown"] = 90,
                            ["id"] = 107574
                        } -- [3]
                    },
                    ["ALL"] = {
                        {
                            ["ability"] = "Pummel",
                            ["cooldown"] = 15,
                            ["id"] = 6552
                        }, -- [1]
                        {
                            ["ability"] = "Disarm",
                            ["cooldown"] = 45,
                            ["id"] = 236077
                        }, -- [2]
                        {
                            ["ability"] = "Storm Bolt",
                            ["cooldown"] = 30,
                            ["id"] = 107570
                        }, -- [3]
                        {
                            ["ability"] = "Spell Reflection",
                            ["cooldown"] = 25,
                            ["id"] = 23920
                        } -- [4]
                    },
                    ["73"] = {},
                    ["72"] = {
                        {
                            ["ability"] = "Intimidating Shout",
                            ["cooldown"] = 90,
                            ["id"] = 5246
                        }, -- [1]
                        {
                            ["ability"] = "Recklessness",
                            ["cooldown"] = 90,
                            ["id"] = 1719
                        }, -- [2]
                        {
                            ["ability"] = "Bladestorm",
                            ["cooldown"] = 60,
                            ["id"] = 46924
                        } -- [3]
                    }
                },
                ["SHAMAN"] = {
                    ["ALL"] = {
                        {
                            ["ability"] = "Astral Shift",
                            ["cooldown"] = 90,
                            ["id"] = 108271
                        }, -- [1]
                        {
                            ["ability"] = "Wind Shear",
                            ["cooldown"] = 12,
                            ["id"] = 57994
                        }, -- [2]
                        {
                            ["ability"] = "Ascendance",
                            ["cooldown"] = 180,
                            ["id"] = 114052
                        } -- [3]
                    },
                    ["264"] = {
                        {
                            ["ability"] = "Spirit Link Totem",
                            ["cooldown"] = 180,
                            ["id"] = 98008
                        }, -- [1]
                        {
                            ["ability"] = "Earthen Wall Totem",
                            ["cooldown"] = 60,
                            ["id"] = 198838
                        } -- [2]
                    },
                    ["263"] = {
                        {
                            ["ability"] = "Ethereal Form",
                            ["cooldown"] = 60,
                            ["id"] = 210918
                        }, -- [1]
                        {
                            ["ability"] = "Shamanism",
                            ["cooldown"] = 60,
                            ["id"] = 193876
                        } -- [2]
                    },
                    ["262"] = {
                        {
                            ["ability"] = "Lightning Lasso",
                            ["cooldown"] = 30,
                            ["id"] = 305483
                        } -- [1]
                    }
                },
                ["MAGE"] = {
                    ["ALL"] = {
                        {
                            ["ability"] = "Temporal Shield",
                            ["cooldown"] = 45,
                            ["id"] = 198111
                        }, -- [1]
                        {
                            ["ability"] = "Counterspell",
                            ["cooldown"] = 24,
                            ["id"] = 2139
                        }, -- [2]
                        {
                            ["ability"] = "Ice Block",
                            ["cooldown"] = 240,
                            ["id"] = 45438
                        }, -- [3]
                        {
                            ["ability"] = "Ring of Frost",
                            ["cooldown"] = 45,
                            ["id"] = 113724
                        } -- [4]
                    },
                    ["64"] = {
                        {
                            ["ability"] = "Icy Veins",
                            ["cooldown"] = 180,
                            ["id"] = 12472
                        } -- [1]
                    },
                    ["62"] = {
                        {
                            ["ability"] = "Arcane Power",
                            ["cooldown"] = 120,
                            ["id"] = 12042
                        } -- [1]
                    },
                    ["63"] = {
                        {
                            ["ability"] = "Dragon's Breath",
                            ["cooldown"] = 20,
                            ["id"] = 31661
                        }, -- [1]
                        {
                            ["ability"] = "Combustion",
                            ["cooldown"] = 120,
                            ["id"] = 190319
                        } -- [2]
                    }
                },
                ["PRIEST"] = {
                    ["ALL"] = {},
                    ["256"] = {
                        {
                            ["ability"] = "Psychic Scream",
                            ["cooldown"] = 60,
                            ["id"] = 8122
                        }, -- [1]
                        {
                            ["ability"] = "Pain Suppression",
                            ["cooldown"] = 180,
                            ["id"] = 33206
                        }, -- [2]
                        {
                            ["ability"] = "Power Word: Barrier",
                            ["cooldown"] = 180,
                            ["id"] = 62618
                        }, -- [3]
                        {
                            ["ability"] = "Luminous Barrier",
                            ["cooldown"] = 180,
                            ["id"] = 271466
                        } -- [4]
                    },
                    ["258"] = {
                        {
                            ["ability"] = "Dispersion",
                            ["cooldown"] = 120,
                            ["id"] = 47585
                        }, -- [1]
                        {
                            ["ability"] = "Psychic Scream",
                            ["cooldown"] = 60,
                            ["id"] = 8122
                        }, -- [2]
                        {
                            ["ability"] = "Silence",
                            ["cooldown"] = 45,
                            ["id"] = 15487
                        }, -- [3]
                        {
                            ["ability"] = "Void Shift",
                            ["cooldown"] = 300,
                            ["id"] = 108968
                        }, -- [4]
                        {
                            ["ability"] = "Greater Fade",
                            ["cooldown"] = 45,
                            ["id"] = 213602
                        } -- [5]
                    },
                    ["257"] = {
                        {
                            ["ability"] = "Holy Word: Serenity",
                            ["cooldown"] = 60,
                            ["id"] = 2050
                        }, -- [1]
                        {
                            ["ability"] = "Holy Word: Sanctify",
                            ["cooldown"] = 60,
                            ["id"] = 34861
                        }, -- [2]
                        {
                            ["ability"] = "Holy Word: Concentration",
                            ["cooldown"] = 45,
                            ["id"] = 289657
                        }, -- [3]
                        {
                            ["ability"] = "Greater Fade",
                            ["cooldown"] = 45,
                            ["id"] = 213602
                        }, -- [4]
                        {
                            ["ability"] = "Ray of Hope",
                            ["cooldown"] = 60,
                            ["id"] = 197268
                        }, -- [5]
                        {
                            ["ability"] = "Guardian Spirit",
                            ["cooldown"] = 180,
                            ["id"] = 47788
                        } -- [6]
                    }
                },
                ["ROGUE"] = {
                    ["261"] = {
                        {
                            ["ability"] = "Evasion",
                            ["cooldown"] = 120,
                            ["id"] = 5277
                        }, -- [1]
                        {
                            ["ability"] = "Smoke Bomb",
                            ["cooldown"] = 180,
                            ["id"] = 212182
                        } -- [2]
                    },
                    ["260"] = {
                        {
                            ["ability"] = "Crimson Vial",
                            ["cooldown"] = 30,
                            ["id"] = 185311
                        }, -- [1]
                        {
                            ["ability"] = "Riposte",
                            ["cooldown"] = 120,
                            ["id"] = 199754
                        } -- [2]
                    },
                    ["ALL"] = {
                        {
                            ["ability"] = "Kick",
                            ["cooldown"] = 15,
                            ["id"] = 1766
                        }, -- [1]
                        {
                            ["ability"] = "Cloak of Shadows",
                            ["cooldown"] = 120,
                            ["id"] = 31224
                        }, -- [2]
                        {
                            ["ability"] = "Vanish",
                            ["cooldown"] = 120,
                            ["id"] = 1856
                        } -- [3]
                    },
                    ["259"] = {
                        {
                            ["ability"] = "Evasion",
                            ["cooldown"] = 120,
                            ["id"] = 5277
                        }, -- [1]
                        {
                            ["ability"] = "Blind",
                            ["cooldown"] = 120,
                            ["id"] = 2094
                        }, -- [2]
                        {
                            ["ability"] = "Smoke Bomb",
                            ["cooldown"] = 180,
                            ["id"] = 212182
                        }, -- [3]
                        {
                            ["ability"] = "Vendetta",
                            ["cooldown"] = 120,
                            ["id"] = 79140
                        } -- [4]
                    }
                },
                ["WARLOCK"] = {
                    ["265"] = {},
                    ["ALL"] = {
                        {
                            ["ability"] = "Spell Lock",
                            ["cooldown"] = 24,
                            ["id"] = 19647
                        }, -- [1]
                        {
                            ["ability"] = "Unending Resolve",
                            ["cooldown"] = 180,
                            ["id"] = 104773
                        }, -- [2]
                        {
                            ["ability"] = "Dark Pact",
                            ["cooldown"] = 60,
                            ["id"] = 108416
                        }, -- [3]
                        {
                            ["ability"] = "Nether Ward",
                            ["cooldown"] = 45,
                            ["id"] = 212295
                        }, -- [4]
                        {
                            ["ability"] = "Mortal Coil",
                            ["cooldown"] = 45,
                            ["id"] = 6789
                        }, -- [5]
                        {
                            ["ability"] = "Shadowfury",
                            ["cooldown"] = 60,
                            ["id"] = 30283
                        } -- [6]
                    },
                    ["267"] = {},
                    ["266"] = {}
                },
                ["DEMONHUNTER"] = {
                    ["ALL"] = {
                        {
                            ["ability"] = "Blur",
                            ["cooldown"] = 60,
                            ["id"] = 198589
                        }, -- [1]
                        {
                            ["ability"] = "Imprison",
                            ["cooldown"] = 45,
                            ["id"] = 217832
                        }, -- [2]
                        {
                            ["ability"] = "Disrupt",
                            ["cooldown"] = 15,
                            ["id"] = 183752
                        } -- [3]
                    },
                    ["581"] = {
                        {
                            ["ability"] = "Metamorphosis",
                            ["cooldown"] = 300,
                            ["id"] = 187827
                        } -- [1]
                    },
                    ["577"] = {
                        {
                            ["ability"] = "Darkness",
                            ["cooldown"] = 180,
                            ["id"] = 196718
                        }, -- [1]
                        {
                            ["ability"] = "Metamorphosis",
                            ["cooldown"] = 300,
                            ["id"] = 191427
                        }, -- [2]
                        {
                            ["ability"] = "Netherwalk",
                            ["cooldown"] = 180,
                            ["id"] = 196555
                        } -- [3]
                    }
                },
                ["DEATHKNIGHT"] = {
                    ["252"] = {
                        {
                            ["ability"] = "Asphyxiate",
                            ["cooldown"] = 45,
                            ["id"] = 108194
                        }, -- [1]
                        {
                            ["ability"] = "Leap",
                            ["cooldown"] = 30,
                            ["id"] = 47482
                        }, -- [2]
                        {
                            ["ability"] = "Anti-Magic Zone",
                            ["cooldown"] = 120,
                            ["id"] = 51052
                        }, -- [3]
                        {
                            ["ability"] = "Army of the Dead",
                            ["cooldown"] = 480,
                            ["id"] = 42650
                        }, -- [4]
                        {
                            ["ability"] = "Summon Gargoyle",
                            ["cooldown"] = 180,
                            ["id"] = 49206
                        } -- [5]
                    },
                    ["ALL"] = {
                        {
                            ["ability"] = "Mind Freeze",
                            ["cooldown"] = 15,
                            ["id"] = 47528
                        }, -- [1]
                        {
                            ["ability"] = "Anti-Magic Shell",
                            ["cooldown"] = 60,
                            ["id"] = 48707
                        }, -- [2]
                        {
                            ["ability"] = "Icebound Fortitude",
                            ["cooldown"] = 180,
                            ["id"] = 48792
                        } -- [3]
                    },
                    ["250"] = {},
                    ["251"] = {
                        {
                            ["ability"] = "Wraith Walk",
                            ["cooldown"] = 60,
                            ["id"] = 212552
                        }, -- [1]
                        {
                            ["ability"] = "Remorseless Winter",
                            ["cooldown"] = 20,
                            ["id"] = 196770
                        } -- [2]
                    }
                },
                ["DRUID"] = {
                    ["105"] = {
                        {
                            ["ability"] = "Ironbark",
                            ["cooldown"] = 90,
                            ["id"] = 102342
                        } -- [1]
                    },
                    ["104"] = {
                        {
                            ["ability"] = "Skull Bash",
                            ["cooldown"] = 15,
                            ["id"] = 106839
                        } -- [1]
                    },
                    ["ALL"] = {
                        {
                            ["ability"] = "Mighty Bash",
                            ["cooldown"] = 60,
                            ["id"] = 5211
                        }, -- [1]
                        {
                            ["ability"] = "Barkskin",
                            ["cooldown"] = 60,
                            ["id"] = 22812
                        } -- [2]
                    },
                    ["103"] = {
                        {
                            ["ability"] = "Skull Bash",
                            ["cooldown"] = 15,
                            ["id"] = 106839
                        }, -- [1]
                        {
                            ["ability"] = "Survival Instincts",
                            ["cooldown"] = 180,
                            ["id"] = 61336
                        }, -- [2]
                        {
                            ["ability"] = "Berserk",
                            ["cooldown"] = 180,
                            ["id"] = 106951
                        } -- [3]
                    },
                    ["102"] = {
                        {
                            ["ability"] = "Solar Beam",
                            ["cooldown"] = 60,
                            ["id"] = 78675
                        }, -- [1]
                        {
                            ["ability"] = "Incarnation: Chosen of Elune",
                            ["cooldown"] = 180,
                            ["id"] = 102560
                        }, -- [2]
                        {
                            ["ability"] = "Celestial Alignment",
                            ["cooldown"] = 180,
                            ["id"] = 194223
                        } -- [3]
                    }
                },
                ["MONK"] = {
                    ["270"] = {
                        {
                            ["ability"] = "Life Cocoon",
                            ["cooldown"] = 120,
                            ["id"] = 116849
                        }, -- [1]
                        {
                            ["ability"] = "Fortifying Brew",
                            ["cooldown"] = 420,
                            ["id"] = 243435
                        } -- [2]
                    },
                    ["269"] = {
                        {
                            ["ability"] = "Spear Hand Strike",
                            ["cooldown"] = 15,
                            ["id"] = 116705
                        }, -- [1]
                        {
                            ["ability"] = "Touch of Karma",
                            ["cooldown"] = 90,
                            ["id"] = 122470
                        }, -- [2]
                        {
                            ["ability"] = "Fortifying Brew",
                            ["cooldown"] = 420,
                            ["id"] = 243435
                        }, -- [3]
                        {
                            ["ability"] = "Storm, Earth, and Fire",
                            ["cooldown"] = 90,
                            ["id"] = 137639
                        }, -- [4]
                        {
                            ["ability"] = "Serenity",
                            ["cooldown"] = 90,
                            ["id"] = 152173
                        }, -- [5]
                        {
                            ["ability"] = "Touch of Death",
                            ["cooldown"] = 120,
                            ["id"] = 115080
                        } -- [6]
                    },
                    ["268"] = {
                        {
                            ["ability"] = "Spear Hand Strike",
                            ["cooldown"] = 15,
                            ["id"] = 116705
                        } -- [1]
                    },
                    ["ALL"] = {
                        {
                            ["ability"] = "Leg Sweep",
                            ["cooldown"] = 60,
                            ["id"] = 119381
                        }, -- [1]
                        {
                            ["ability"] = "Tiger's Lust",
                            ["cooldown"] = 30,
                            ["id"] = 116841
                        } -- [2]
                    }
                },
                ["PALADIN"] = {
                    ["65"] = {
                        {
                            ["ability"] = "Blessing of Sacrifice",
                            ["cooldown"] = 120,
                            ["id"] = 6940
                        }, -- [1]
                        {
                            ["ability"] = "Divine Shield",
                            ["cooldown"] = 300,
                            ["id"] = 642
                        }, -- [2]
                        {
                            ["ability"] = "Avenging Crusader",
                            ["cooldown"] = 120,
                            ["id"] = 216331
                        }, -- [3]
                        {
                            ["ability"] = "Blessing of Protection",
                            ["cooldown"] = 300,
                            ["id"] = 1022
                        }, -- [4]
                        {
                            ["ability"] = "Blessing of Freedom",
                            ["cooldown"] = 25,
                            ["id"] = 1044
                        }, -- [5]
                        {
                            ["ability"] = "Repentance",
                            ["cooldown"] = 15,
                            ["id"] = 20066
                        }, -- [6]
                        {
                            ["ability"] = "Avenging Wrath",
                            ["cooldown"] = 180,
                            ["id"] = 31884
                        } -- [7]
                    },
                    ["70"] = {
                        {
                            ["ability"] = "Divine Shield",
                            ["cooldown"] = 300,
                            ["id"] = 642
                        }, -- [1]
                        {
                            ["ability"] = "Rebuke",
                            ["cooldown"] = 15,
                            ["id"] = 96231
                        }, -- [2]
                        {
                            ["ability"] = "Blessing of Protection",
                            ["cooldown"] = 300,
                            ["id"] = 1022
                        }, -- [3]
                        {
                            ["ability"] = "Blessing of Freedom",
                            ["cooldown"] = 25,
                            ["id"] = 1044
                        }, -- [4]
                        {
                            ["ability"] = "Blessing of Sanctuary",
                            ["cooldown"] = 45,
                            ["id"] = 210256
                        }, -- [5]
                        {
                            ["ability"] = "Eye for an Eye",
                            ["cooldown"] = 60,
                            ["id"] = 205191
                        }, -- [6]
                        {
                            ["ability"] = "Avenging Wrath",
                            ["cooldown"] = 180,
                            ["id"] = 31884
                        }, -- [7]
                        {
                            ["ability"] = "Shield of Vengeance",
                            ["cooldown"] = 120,
                            ["id"] = 184662
                        }, -- [8]
                        {
                            ["ability"] = "Crusade",
                            ["cooldown"] = 120,
                            ["id"] = 231895
                        } -- [9]
                    },
                    ["ALL"] = {
                        {
                            ["ability"] = "Hammer of Justice",
                            ["cooldown"] = 60,
                            ["id"] = 853
                        } -- [1]
                    },
                    ["66"] = {
                        {
                            ["ability"] = "Rebuke",
                            ["cooldown"] = 15,
                            ["id"] = 96231
                        } -- [1]
                    }
                }
            },
            ["glow"] = true,
            ["iconOffsetX"] = 5,
            ["offsetY"] = 0,
            ["arena"] = true,
            ["biggroup"] = true
        }
        
        print("kyleUI configured Ability Team Tracker")
    end

    print("kyleUI profiles installed!")
end
