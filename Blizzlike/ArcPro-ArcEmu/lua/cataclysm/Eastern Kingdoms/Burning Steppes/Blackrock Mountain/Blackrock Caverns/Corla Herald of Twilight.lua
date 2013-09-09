--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: Grimton1337
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

local Corla = nil
local Zealot = nil
Corla = {}
Zealot = {}

function Corla_OnSpawn(pUnit, event)
	Corla = pUnit
end

function Corla_OnCombat(pUnit, event)
	Corla:SendChatMessage(14, 0, "HERETICS! You will suffer for this interruption!")
	Corla:PlaySoundToSet(18589)
	Corla:RegisterEvent(Aura_of_Acceleration, math.random(30000,40000), 0)
	Corla:RegisterEvent(Dark_Command, math.random(27000,37000), 0)
	Corla:RegisterEvent(Evolution, 2000, 0)
	Corla:RegisterEvent(Drain_Essence, 1, 0)
end

function Aura_of_Acceleration(pUnit, event)
	for k, v in pairs(Corla:GetInRangeFriends()) do
		v:FullCastSpell(75817)
	end
end

function Dark_Command(pUnit, event)
	Corla:FullCastSpellOnTarget(75823, Corla:GetMainTank())
end

function Evolution(pUnit, event)
	Zealot:FullCastSpell(75610)
end

function DrainEssence(pUnit, event)
	if(Zealot:HasAura(75610)*100) then
		Zealot:FullCastSpell(75645)
		Zealot:FullCastSpell(75732)
		Corla:SendChatMessage(14, 0, "Bask in his power! Rise as an agent of the master's rage!")
		Corla:PlaySoundToSet(18592)
	end
end

function Corla_OnKilledPlayer(pUnit, event)
	Corla:SendChatMessage(14, 0, "There is only one true path of enlightenment! DEATH!")
	Corla:PlaySoundToSet(18590)
end

function Corla_OnDeath(pUnit, event)
	Corla:SendChatMessage(14, 0, "For the master I die a thousand times... A thousan...")
	Corla:PlaySoundToSet(18594)
end

RegisterUnitEvent(39679, 18, "Corla_OnSpawn")
RegisterUnitEvent(39679, 1, "Corla_OnCombat")
RegisterUnitEvent(39679, 3, "Corla_OnKilledPlayer")
RegisterUnitEvent(39679, 4, "Corla_OnDeath")

function Zealot_OnSpawn(pUnit, event)
	Zealot = pUnit
end

RegisterUnitEvent(50284, 18, "Zealot_OnSpawn")