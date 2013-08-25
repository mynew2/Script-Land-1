--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation, DARKI
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function corrosive_lurker_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Dazed", 7000, 0)
	pUnit:RegisterEvent("Corrosive_Ooze", 14000, 0)
end

function Dazed(pUnit, Event)
	pUnit:FullCastSpellOnTarget(1604, pUnit:GetClosestPlayer())
end

function Corrosive_Ooze(pUnit, Event)
	pUnit:FullCastSpellOnTarget(9459, pUnit:GetClosestPlayer())
end

function corrosive_lurker_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function corrosive_lurker_OnDied(pUnit, Event)
	pUnit:CastSpell(10341)
	pUnit:CastSpell(11638)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(6219, 1, "corrosive_lurker_OnCombat")
RegisterUnitEvent(6219, 2, "corrosive_lurker_OnLeaveCombat")
RegisterUnitEvent(6219, 4, "corrosive_lurker_OnDied")

-- 
function Crowd_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Arcing_Smash", 7000, 0)
	pUnit:RegisterEvent("Crowd_Pummel", 14000, 0)
	pUnit:RegisterEvent("Trample", 21000, 0)
end

function Arcing_Smash(pUnit, Event)
local chance = math.random(1,2)
	if(chance == 1) then
		pUnit:CastSpellOnTarget(8374)
	elseif(chance == 2) then
		pUnit:CastSpellOnTarget(16169)
	end
end

function Crowd_Pummel(pUnit, Event)
	pUnit:CastSpellOnTarget(10887)
end

function Trample(pUnit, Event)
	pUnit:CastSpellOnTarget(5568)
end

function Crowd_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Crowd_OnDied(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(6229, 1, "Crowd_OnCombat")
RegisterUnitEvent(6229, 2, "Crowd_OnLeaveCombat")
RegisterUnitEvent(6229, 4, "Crowd_OnDied")

-- 
function Electrocutioner_6000_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Electric justice!")
	pUnit:RegisterEvent("Chain_Bolt", 7000, 0)
	pUnit:RegisterEvent("Megavolt", 14000, 0)
	pUnit:RegisterEvent("Shock", 21000, 0)
end

function Chain_Bolt(pUnit, Event)
	pUnit:FullCastSpellOnTarget(11085)
end

function Megavolt(pUnit, Event)
	pUnit:FullCastSpellOnTarget(11082)
end

function Shock(pUnit, Event)
	pUnit:CastSpellOnTarget(11084)
end

function Electrocutioner_6000_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Electrocutioner_6000_OnDied(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(6235, 1, "Electrocutioner_6000_OnCombat")
RegisterUnitEvent(6235, 2, "Electrocutioner_6000_OnLeaveCombat")
RegisterUnitEvent(6235, 4, "Electrocutioner_6000_OnDied")

-- 
function radioactive_ea_OnCombat(pUnit, Event)
local chance = math.random(1,4)
	if(chance == 1) then
		pUnit:SendChatMessage(12, 0, "A foul trogg if ever I saw one. Die!")
	elseif(chance == 2) then
		pUnit:SendChatMessage(12, 0, "No gnome will be left behind")
	elseif(chance == 3) then
		pUnit:SendChatMessage(12, 0, "The troggs...they never stop coming. Die trogg! Die!")
	elseif(chance == 4) then
		pUnit:SendChatMessage(12, 0, "This sickness clouds my vision, but I know you must be a trogg. Die foul invader!")
	end
	pUnit:RegisterEvent("Net", 7000, 0)
	pUnit:RegisterEvent("Ice_Blast", 14000, 0)
	pUnit:RegisterEvent("Dazed", 21000, 1)
end

function Net(pUnit, Event)
	pUnit:CastSpellOnTarget(12024, pUnit:GetRandomPlayer(0))
end

function Ice_Blast(pUnit, Event)
	pUnit:CastSpellOnTarget(11264, pUnit:GetRandomPlayer(0))
end 

function Dazed(pUnit, Event)
	pUnit:CastSpell(1604)
end

function radioactive_ea_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function radioactive_ea_OnDied(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(7603, 1, "radioactive_ea_OnCombat")
RegisterUnitEvent(7603, 2, "radioactive_ea_OnLeaveCombat")
RegisterUnitEvent(7603, 4, "radioactive_ea_OnDied")

-- 
function Radioactive_mg_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Dazed", 7000, 0)
	pUnit:RegisterEvent("Electrified_Net", 14000, 0)
end

function Dazed(pUnit, Event)
	pUnit:CastSpellOnTarget(1604, pUnit:GetClosestPlayer(1))
end

function Electrified_Net(pUnit, Event)
	pUnit:FullCastSpellOnTarget(11820, pUnit:GetClosestPlayer(1))
end

function Radioactive_mg_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Radioactive_mg_OnDied(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(6234, 1, "Radioactive_mg_OnCombat")
RegisterUnitEvent(6234, 2, "Radioactive_mg_OnLeaveCombat")
RegisterUnitEvent(6234, 4, "Radioactive_mg_OnDied")

-- 
function Radioactive_frostwalker_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Ice_Blast", 7000, 0)
	pUnit:RegisterEvent("Ice_Nova", 14000, 0)
end

function Ice_Blast(pUnit, Event)
	pUnit:FullCastSpellOnTarget(11264, pUnit:GetRandomPlayer(1))
end

function Ice_Nova(pUnit, Event)
	pUnit:FullCastSpellOnTarget(22519, pUnit:GetClosestPlayer(1))
end

function Radioactive_frostwalker_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Radioactive_frostwalker_OnDied(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(6227, 1, "Radioactive_frostwalker_OnCombat")
RegisterUnitEvent(6227, 2, "Radioactive_frostwalker_OnLeaveCombat")
RegisterUnitEvent(6227, 4, "Radioactive_frostwalker_OnDied")

-- 
function Radioactive_frostwalker_OnCombat(pUnit, event, miscpUnit, misc)
	pUnit:RegisterEvent("Ice_Blast", 10000, 0)
	pUnit:RegisterEvent("Ice_Nova", 17000, 0)
end

function Ice_Blast(pUnit, event, miscpUnit, misc)
	pUnit:FullCastSpellOnTarget(11264, pUnit:GetRandomPlayer(1))
end

function Ice_Nova(pUnit, event, miscpUnit, misc)
	pUnit:FullCastSpellOnTarget(22519, pUnit:GetClosestPlayer(1))
end

function Radioactive_frostwalker_OnLeaveCombat(pUnit)
	pUnit:RemoveEvents()
end

function Radioactive_frostwalker_OnDied(pUnit)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(6227, 1, "Radioactive_frostwalker_OnCombat")
RegisterUnitEvent(6227, 2, "Radioactive_frostwalker_OnLeaveCombat")
RegisterUnitEvent(6227, 4, "Radioactive_frostwalker_OnDied")

-- 
function Mekgineer_OnCombat(pUnit, Event)
local chance = math.random(1,3)
	if(chance == 1) then
		pUnit:SendChatMessage(14, 0, "Explosions! MORE explosions! I got to have more explosions!")
	elseif(chance == 2) then
		pUnit:SendChatMessage(14, 0, "My machines are the future! They'll destroy you all!")
	elseif(chance == 3) then
		pUnit:SendChatMessage(14, 0, "Usurpers! Gnomeregan is mine!")
	end
	pUnit:RegisterEvent("Knock_Away", 7000, 0)
	pUnit:RegisterEvent("Knocks_Away", 14000, 0)
end

function Knock_Away(pUnit, Event)
	pUnit:CastSpellOnTarget(10101, pUnit:GetClosestPlayer(1))
end

function Knocks_Away(pUnit, Event)
	pUnit:CastSpellOnTarget(11130, pUnit:GetRandomPlayer(1))
end

function Mekgineer_OnLeaveCombat(pUnit)
	pUnit:RemoveEvents()
end

function Mekgineer_OnDied(pUnit)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(6228, 1, "Mekgineer_OnCombat")
RegisterUnitEvent(6228, 2, "Mekgineer_OnLeaveCombat")
RegisterUnitEvent(6228, 4, "Mekgineer_OnDied")

-- 
function radiation_dt_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Lag", 7000, 0)
	pUnit:RegisterEvent("Summon_Dupe_Bug", 14000, 0)
	pUnit:RegisterEvent("Battle_Net", 21000, 0)
end

function Lag(pUnit, Event)
	pUnit:FullCastSpellOnTarget(10855, pUnit:GetClosestPlayer(1))
end

function Summon_Dupe_Bug(pUnit, Event)
	pUnit:FullCastSpellOnTarget(10858, pUnit:GetClosestPlayer(1))
end

function Battle_Net(pUnit, Event)
	pUnit:FullCastSpellOnTarget(10855, pUnit:GetClosestPlayer(1))
end

function radiation_dt_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function radiation_dt_OnDied(pUnit, Event)
	pUnit:SendChatMessage(12, 0, "Machine shutdown!")
	pUnit:RemoveEvents()
end

RegisterUnitEvent(6231, 1, "radiation_dt_OnCombat")
RegisterUnitEvent(6231, 2, "radiation_dt_OnLeaveCombat")
RegisterUnitEvent(6231, 4, "radiation_dt_OnDied")

-- 
function Radioactive_VF_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Corrosive_Ooze", 7000, 0)
	pUnit:RegisterEvent("Radiation_Cloud", 14000, 0)
end

function Corrosive_Ooze(pUnit, Event)
	pUnit:FullCastSpellOnTarget(9459, pUnit:GetClosestPlayer(1))
end

function Radiation_Cloud(pUnit, Event)
	pUnit:FullCastSpellOnTarget(10341, pUnit:GetClosestPlayer(1))
end

function Radioactive_VF_saw_blade(pUnit, Event)
	pUnit:FullCastSpell(35318)
end

function Radioactive_VF_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Radioactive_VF_OnDied(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(7079, 1, "Radioactive_VF_OnCombat")
RegisterUnitEvent(7079, 2, "Radioactive_VF_OnLeaveCombat")
RegisterUnitEvent(7079, 4, "Radioactive_VF_OnDied")