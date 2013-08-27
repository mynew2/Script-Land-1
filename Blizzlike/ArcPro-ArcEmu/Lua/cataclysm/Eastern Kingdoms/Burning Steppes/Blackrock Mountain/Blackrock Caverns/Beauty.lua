--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: Grimton1337
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

local Beauty = nil
Beauty = {}

function Beauty_OnSpawn(pUnit, Event)
	Beauty = pUnit
end

function Beauty_OnCombat(pUnit, Event)
	Beauty:FullCastSpell(82395)
	Beauty:RegisterEvent(Berserker_Charge, math.random(20000,25000), 0)
	Beauty:RegisterEvent(Flamebreak, math.random(20000,32000), 0)
	Beauty:RegisterEvent(Magma_Spit, math.random(25000,36000), 0)
	Beauty:RegisterEvent(Terrifying_Roar, math.random(15000,30000), 0)
end

function Berserker_Charge(pUnit, Event)
	Beauty:FullCastSpellOnTarget(76030, Beauty:GetRandomPlayer(0))
end

function Flamebreak(pUnit, Event)
	Beauty:FullCastSpell(76032)
end

function Magma_Spit(pUnit, Event)
	Beauty:FullCastSpellOnTarget(76031, Beauty:GetRandomPlayer(0))
end

function Terrifying_Roar(pUnit, Event)
	Beauty:FullCastSpell(76028)
end

RegisterUnitEvent(39700, 18, "Beauty_OnSpawn")
RegisterUnitEvent(39700, 1, "Beauty_OnCombat")