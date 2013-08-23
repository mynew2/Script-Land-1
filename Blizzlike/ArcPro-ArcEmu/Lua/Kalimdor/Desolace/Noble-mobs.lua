--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

-- Crusty
function Crusty_OnCombat(Unit, Event)
	Unit:RegisterEvent("Crusty_Enrage", 10000, 1)
end

function Crusty_Enrage(Unit, Event) 
	Unit:CastSpell(8599) 
end

function Crusty_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Crusty_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(18241, 1, "Crusty_OnCombat")
RegisterUnitEvent(18241, 2, "Crusty_OnLeaveCombat")
RegisterUnitEvent(18241, 4, "Crusty_OnDied")

-- Jugkar Grimrod
function JugkarGrimrod_OnCombat(Unit, Event)
	Unit:RegisterEvent("JugkarGrimrod_CurseofWeakness", 5000, 1)
	Unit:RegisterEvent("JugkarGrimrod_Immolate", 6000, 1)
	Unit:RegisterEvent("JugkarGrimrod_ShadowBolt", 8000, 0)
end

function JugkarGrimrod_CurseofWeakness(Unit, Event) 
	Unit:FullCastSpellOnTarget(12741, 	Unit:GetMainTank()) 
end

function JugkarGrimrod_Immolate(Unit, Event) 
	Unit:FullCastSpellOnTarget(20787, 	Unit:GetMainTank()) 
end

function JugkarGrimrod_ShadowBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(12471, 	Unit:GetMainTank()) 
end

function JugkarGrimrod_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function JugkarGrimrod_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5771, 1, "JugkarGrimrod_OnCombat")
RegisterUnitEvent(5771, 2, "JugkarGrimrod_OnLeaveCombat")
RegisterUnitEvent(5771, 4, "JugkarGrimrod_OnDied")