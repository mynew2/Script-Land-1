--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function Azurous_OnCombat(Unit, Event)
	Unit:RegisterEvent("Azurous_Breath", 8000, 0)
end

function Azurous_Breath(Unit, Event) 
	Unit:FullCastSpellOnTarget(16099, Unit:GetMainTank()) 
end

function Azurous_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Azurous_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(10202, 1, "Azurous_OnCombat")
RegisterUnitEvent(10202, 2, "Azurous_OnLeaveCombat")
RegisterUnitEvent(10202, 4, "Azurous_OnDied")

function Witch_OnCombat(Unit, Event)
	Unit:RegisterEvent("Witch_ArcaneBolt",6000,0)
	Unit:RegisterEvent("Witch_Shield",10000,0)
	Unit:RegisterEvent("Witch_Movement",8000,0)
end

function Witch_ArcaneBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(20829, Unit:GetMainTank()) 
end

function Witch_Shield(Unit, Event) 
	Unit:CastSpell(17014) 
end

function Witch_Movement(Unit, Event) 
	Unit:FullCastSpellOnTarget(56138, Unit:GetMainTank()) 
end

function Witch_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Witch_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(16380, 1, "Witch_OnCombat")
RegisterUnitEvent(16380, 2, "Witch_OnLeaveCombat")
RegisterUnitEvent(16380, 4, "Witch_OnDied")

--Berserk Owlbeast
function BerserkOwlbeast_OnCombat(Unit, Event)
	Unit:RegisterEvent("BerserkOwlbeast_Enrage", 1000, 1)
end

function BerserkOwlbeast_Enrage(Unit, Event) 
	if(Unit:GetHealthPct() < 25) then
		Unit:CastSpell(8599) 
	end
end

function BerserkOwlbeast_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BerserkOwlbeast_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(7454, 1, "BerserkOwlbeast_OnCombat")
RegisterUnitEvent(7454, 2, "BerserkOwlbeast_OnLeaveCombat")
RegisterUnitEvent(7454, 4, "BerserkOwlbeast_OnDied")

--Anguished Highborne
function Highborne_OnCombat(Unit, Event)
	Unit:RegisterEvent("Highborne_Blast", 6000, 0)
end

function Highborne_Blast(Unit, Event) 
	Unit:FullCastSpellOnTarget(13860, Unit:GetMainTank()) 
end

function Highborne_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Highborne_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(7524, 1, "Highborne_OnCombat")
RegisterUnitEvent(7524, 2, "Highborne_OnLeaveCombat")
RegisterUnitEvent(7524, 4, "Highborne_OnDied")