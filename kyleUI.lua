-- hide the default menu buttons
local t,f={"Character","Spellbook","Talent","Achievement","QuestLog","Guild","LFD","Collections","EJ","Store","MainMenu"}for i=1,#t do f=_G[t[i].."MicroButton"]f:SetScale(.001)end;MicroButtonAndBagsBar:Hide()

-- sort myself to the bottom all the time
LoadAddOn("Blizzard_CompactRaidFrames") CRFSort_Group=function(t1, t2) if UnitIsUnit(t1,"player") then return false elseif UnitIsUnit(t2,"player") then return true else return t1 < t2 end end CompactRaidFrameContainer.flowSortFunc=CRFSort_Group

-- arena nameplate numbers
local U=UnitIsUnit hooksecurefunc("CompactUnitFrame_UpdateName",function(F)if IsActiveBattlefieldArena()and F.unit:find("nameplate")then for i=1,5 do if U(F.unit,"arena"..i)then F.name:SetText(i)F.name:SetTextColor(1,1,0)break end end end end)
