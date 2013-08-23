--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]
--[[Celebras the Redeemed says: You wish to learn of the stone? Follow me.
Celebras the Redeemed says: For so long I have drifted in my cursed form. You have freed me... Your hard work shall be repaid.
During the ritual to make the  [Scepter of Celebras]:
Celebras the Redeemed says: Please do as I instruct you, <name>.
Celebras the Redeemed says: Read this tome I have placed before you, and speak the words aloud.
Celebras the Redeemed begins to channel his energy, focusing on the stone.
Celebras the Redeemed says: Together, the two parts shall become one, once again.
Celebras the Redeemed says: Shal myrinan ishnu daldorah...
Celebras the Redeemed says: My scepter will once again become whole!]]--

function Landslide_OnCombat(Unit, Event)
	Unit:RegisterEvent("Trample", 7000, 0)
	Unit:RegisterEvent("Knock", 14000, 0)
	Unit:RegisterEvent("Landslide", 14000, 0)
end

function Trample(pUnit, Event) 
	pUnit:CastSpellOnTarget(5568, pUnit:GetMainTank()) 
end

function Knock(pUnit, Event) 
	pUnit:CastSpellOnTarget(18670, pUnit:GetMainTank()) 
end

function Landslide(pUnit, Event) 
	pUnit:FullCastSpell(21808) 
end

function Landslide_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Landslide_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12203, 1, "Landslide_OnCombat")
RegisterUnitEvent(12203, 2, "Landslide_OnLeaveCombat")
RegisterUnitEvent(12203, 4, "Landslide_OnDied")

function Theradras_OnCombat(Unit, Event)
	Unit:RegisterEvent("Boulder", 7000, 0)
	Unit:RegisterEvent("Dust", 14000, 0)
	Unit:RegisterEvent("Knock", 21000, 0)
	Unit:RegisterEvent("Gaze", 28000, 0)
	Unit:RegisterEvent("Thrash", 35000, 0)
end

function Boulder(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(21832, Unit:GetRandomPlayer()) 
end

function Dust(pUnit, Event) 
	pUnit:CastSpell(21909) 
end

function Knock(pUnit, Event) 
	pUnit:CastSpellOnTarget(22592, pUnit:GetMainTank()) 
end

function Gaze(pUnit, Event) 
	pUnit:CastSpellOnTarget(21869, pUnit:GetMainTank()) 
end

function Thrash(pUnit, Event) 
	pUnit:CastSpell(3391) 
end

function Theradras_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Theradras_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12201, 1, "Theradras_OnCombat")
RegisterUnitEvent(12201, 2, "Theradras_OnLeaveCombat")
RegisterUnitEvent(12201, 4, "Theradras_OnDied")

function Rotgrip_OnCombat(Unit, Event)
	Unit:RegisterEvent("Bite", 7000, 0)
	Unit:RegisterEvent("Puncture", 14000, 0)
end

function Bite(pUnit, Event) 
	pUnit:CastSpellOnTarget(16495, Unit:GetRandomPlayer()) 
end

function Puncture(pUnit, Event) 
	pUnit:CastSpellOnTarget(15976, pUnit:GetMainTank()) 
end

function Rotgrip_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Rotgrip_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(13596, 1, "Rotgrip_OnCombat")
RegisterUnitEvent(13596, 2, "Rotgrip_OnLeaveCombat")
RegisterUnitEvent(13596, 4, "Rotgrip_OnDied")