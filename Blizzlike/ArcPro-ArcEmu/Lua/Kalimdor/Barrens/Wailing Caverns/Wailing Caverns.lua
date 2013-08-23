--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

-- Kresh
function Kresh_OnCombat(Unit, Event)
	Unit:RegisterEvent("Bite", 7000, 0)
end

function Bite(Unit, Event) 
	Unit:CastSpellOnTarget(80362, Unit:GetMainTank()) 
end

function Kresh_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Kresh_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3653, 1, "Kresh_OnCombat")
RegisterUnitEvent(3653, 2, "Kresh_OnLeaveCombat")
RegisterUnitEvent(3653, 4, "Kresh_OnDied")

-- Anacondra
function Anacondra_OnCombat(Unit, Event)
	Unit:SendChatMessage(14, 0, "None can stand against the serpent lords!")
	Unit:RegisterEvent("Lighting", 7000, 0)
	Unit:RegisterEvent("Healing", 14000, 0)
	Unit:RegisterEvent("Sleep", 21000, 0)
	Unit:RegisterEvent("Thorns", 28000, 0)
end

function Lighting(Unit, Event) 
	Unit:FullCastSpellOnTarget(9532, Unit:GetMainTank()) 
end

function Healing(Unit, Event) 
	Unit:CastSpell(5187) 
end

function Sleep(Unit, Event) 
	Unit:FullCastSpellOnTarget(700, Unit:GetMainTank()) 
end

function Thorns(Unit, Event) 
	Unit:CastSpellOnTarget(8148, Unit:GetMainTank()) 
end

function Anacondra_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Anacondra_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3671, 1, "Anacondra_OnCombat")
RegisterUnitEvent(3671, 2, "Anacondra_OnLeaveCombat")
RegisterUnitEvent(3671, 4, "Anacondra_OnDied")

-- Cobrahn
function Cobrahn_OnCombat(Unit, Event)
	Unit:SendChatMessage(14, 0, "You will never wake the dreamer!")
--	Unit:PlaySoundToSet()
	Unit:RegisterEvent("Lightning", 7000, 0)
	Unit:RegisterEvent("Healing", 14000, 0)
	Unit:RegisterEvent("Poison", 21000, 0)
	Unit:RegisterEvent("Slumber", 28000, 0)
	Unit:RegisterEvent("Serpent", 35000, 0)
end

function Lightning(Unit, Event) 
	Unit:FullCastSpellOnTarget(9532, Unit:GetMainTank()) 
end

function Healing(Unit, Event) 
	Unit:CastSpell(5188, Unit:GetMainTank()) 
end

function Poison(Unit, Event) 
	Unit:CastSpellOnTarget(744, Unit:GetMainTank()) 
end

function Slumber(Unit, Event) 
	Unit:FullCastSpellOnTarget(8040, Unit:GetMainTank()) 
end

function Serpent(Unit, Event) 
	Unit:CastSpell(7965) 
end

function Cobrahn_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Cobrahn_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3669, 1, "Cobrahn_OnCombat")
RegisterUnitEvent(3669, 2, "Cobrahn_OnLeaveCombat")
RegisterUnitEvent(3669, 4, "Cobrahn_OnDied")

-- Pythas
function Pythas_OnCombat(Unit, Event)
	Unit:SendChatMessage(14, 0, "The coils of death... Will crush you.")
--	Unit:PlaySoundToSet()
	Unit:RegisterEvent("Clap", 7000, 0)
	Unit:RegisterEvent("Healing", 14000, 0)
	Unit:RegisterEvent("Lightning", 21000, 0)
	Unit:RegisterEvent("Sleep", 28000, 0)
end

function Clap(Unit, Event) 
	Unit:CastSpell(8147) 
end

function Healing(Unit, Event) 
	Unit:CastSpell(5187) 
end

function Lightning(Unit, Event) 
	Unit:FullCastSpellOnTarget(9532, Unit:GetMainTank()) 
end

function Sleep(Unit, Event) 
	Unit:FullCastSpellOnTarget(700, Unit:GetMainTank()) 
end

function Pythas_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Pythas_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3670, 1, "Pythas_OnCombat")
RegisterUnitEvent(3670, 2, "Pythas_OnLeaveCombat")
RegisterUnitEvent(3670, 4, "Pythas_OnDied")

-- Serpentis
function Serpentis_OnCombat(Unit, Event)
local chance = math.random(1,2)
	if (chance == 1) then
		Unit:SendChatMessage(14, 0, "I am the serpent king, I can do anything.")
--		Unit:PlaySoundToSet()
	elseif (chance == 2) then
		Unit:SendChatMessage(14, 0, "Intruders have assaulted our lair. Be on your guard!")
--		Unit:PlaySoundToSet()
	end
	Unit:RegisterEvent("Lightning", 8000, 0)
	Unit:RegisterEvent("Healing", 8000, 0)
	Unit:RegisterEvent("Sleep", 8000, 0)
end

function Lightning(Unit, Event) 
	Unit:FullCastSpellOnTarget(9532, Unit:GetMainTank()) 
end

function Healing(Unit, Event) 
	Unit:FullCastSpell(23381) 
end

function Sleep(Unit, Event) 
	Unit:FullCastSpellOnTarget(700, Unit:GetMainTank()) 
end

function Serpentis_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Serpentis_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3673, 1, "Serpentis_OnCombat")
RegisterUnitEvent(3673, 2, "Serpentis_OnLeaveCombat")
RegisterUnitEvent(3673, 4, "Serpentis_OnDied")

-- Mutanus
function Mutanus_OnCombat(Unit, Event)
	Unit:RegisterEvent("Crack", 7000, 0)
	Unit:RegisterEvent("Nightmare", 14000, 0)
	Unit:RegisterEvent("Terrify", 21000, 0)
end

function Crack(Unit, Event) 
	Unit:CastSpell(8150) 
end

function Nightmare(Unit, Event) 
	Unit:FullCastSpellOnTarget(7967, Unit:GetMainTank()) 
end

function Terrify(Unit, Event) 
	Unit:CastSpellOnTarget(7399, Unit:GetRandomPlayer()) 
end

function Mutanus_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Mutanus_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3654, 1, "Mutanus_OnCombat")
RegisterUnitEvent(3654, 2, "Mutanus_OnLeaveCombat")
RegisterUnitEvent(3654, 4, "Mutanus_OnDied")

-- Skum
function Skum_OnCombat(Unit, Event)
	Unit:RegisterEvent("Bolt", 7000, 0)
end

function Bolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(6254, Unit:GetMainTank()) 
end

function Skum_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Skum_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3674, 1, "Skum_OnCombat")
RegisterUnitEvent(3674, 2, "Skum_OnLeaveCombat")
RegisterUnitEvent(3674, 4, "Skum_OnDied")

-- Verdan
function Verdan_OnCombat(Unit, Event)
	Unit:RegisterEvent("Vines", 7000, 0)
end

function Vines(Unit, Event) 
	Unit:FullCastSpellOnTarget(8142, Unit:GetMainTank()) 
	Unit:RegisterEvent("Vines", 7000, 0)
end

function Verdan_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Verdan_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5775, 1, "Verdan_OnCombat")
RegisterUnitEvent(5775, 2, "Verdan_OnLeaveCombat")
RegisterUnitEvent(5775, 4, "Verdan_OnDied")