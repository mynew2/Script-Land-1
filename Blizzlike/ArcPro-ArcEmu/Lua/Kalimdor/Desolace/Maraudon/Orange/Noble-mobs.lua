--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function Vyle_OnCombat(Unit, Event)
	Unit:RegisterEvent("Shoot", 7000, 0)
	Unit:RegisterEvent("Shot", 14000, 0)
	Unit:RegisterEvent("Bomb", 21000, 0)
	Unit:RegisterEvent("Blink", 28000, 0)
end

function Shoot(pUnit, Event) 
	pUnit:CastSpellOnTarget(16100, Unit:GetRandomPlayer()) 
end

function Shot(pUnit, Event) 
	pUnit:CastSpellOnTarget(21390, pUnit:GetMainTank()) 
end

function Bomb(pUnit, Event) 
	pUnit:CastSpell(7964) 
end

function Blink(pUnit, Event) 
	pUnit:CastSpell(21655) 
end

function Vyle_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Vyle_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12236, 1, "Vyle_OnCombat")
RegisterUnitEvent(12236, 2, "Vyle_OnLeaveCombat")
RegisterUnitEvent(12236, 4, "Vyle_OnDied")

function Meshlok_OnCombat(Unit, Event)
	Unit:RegisterEvent("Strike", 7000, 0)
	Unit:RegisterEvent("Stomp", 14000, 0)
end

function Strike(pUnit, Event) 
	pUnit:CastSpellOnTarget(13446, Unit:GetRandomPlayer()) 
end

function Stomp(pUnit, Event) 
	pUnit:CastSpell(15593) 
end

function Meshlok_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Meshlok_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12237, 1, "Meshlok_OnCombat")
RegisterUnitEvent(12237, 2, "Meshlok_OnLeaveCombat")
RegisterUnitEvent(12237, 4, "Meshlok_OnDied")--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Noxxion_OnCombat(pUnit, Event)
	pUnit:FullCastSpellOnTarget(16050, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("Noxxionphase1", 1000, 0)
	pUnit:RegisterEvent("NoxxionSpout", 6000, 0)
end

function Noxxionphase1(pUnit, Event)
	if(pUnit:GetHealthPct() < 89) then
		pUnit:RemoveEvents()
		pUnit:RegisterEvent("Noxxionphase3", 1000, 0)
		pUnit:RegisterEvent("NoxxionSludgeNova", 5000, 0)
	end
end

function Noxxionphase3(pUnit, Event)
	if(pUnit:GetHealthPct() < 58) then
		pUnit:RemoveEvents()
		pUnit:RegisterEvent("Noxxionphase4", 1000, 0)
		x = pUnit:GetX()
		y = pUnit:GetY()
		z = pUnit:GetZ()
		o = pUnit:GetO()
		pUnit:SpawnCreature(12218, x + 4, y, z, o, 14, 100000)
		pUnit:SpawnCreature(12218, x - 4, y, z, o, 14, 100000)
	end
end

function Noxxionphase4(pUnit, Event)
	if(pUnit:GetHealthPct() < 45) then
		pUnit:RemoveEvents()
		pUnit:RegisterEvent("Noxxionphase5", 1000, 0)
		x = pUnit:GetX()
		y = pUnit:GetY()
		z = pUnit:GetZ()
		o = pUnit:GetO()
		pUnit:SpawnCreature(12218, x + 4, y, z, o, 14, 100000)
		pUnit:SpawnCreature(12218, x - 4, y, z, o, 14, 100000)
	end
end

function Noxxionphase5(pUnit, Event)
	if(pUnit:GetHealthPct() < 32) then
		pUnit:RemoveEvents()
		pUnit:CastSpell(30035)
		pUnit:RegisterEvent("Noxxionphase6", 1000, 0)
		x = pUnit:GetX()
		y = pUnit:GetY()
		z = pUnit:GetZ()
		o = pUnit:GetO()
		pUnit:SpawnCreature(12218, x + 4, y, z, o, 14, 100000)
		pUnit:SpawnCreature(12218, x - 4, y, z, o, 14, 100000)
	end
end

function Noxxionphase6(pUnit, Event)
	if(pUnit:GetHealthPct() < 5) then
		pUnit:RemoveEvents()
		pUnit:RegisterEvent("NoxxionSludgeNova", 5000, 0)
		pUnit:CastSpell(41953)
		pUnit:CastSpell(41953)
		pUnit:CastSpell(41953)
	end
end

function NoxxionSpout(pUnit, Event)
	pUnit:FullCastSpellOnTarget(39207, pUnit:GetRandomPlayer(0))
end

function NoxxionSludgeNova(pUnit, Event)
	pUnit:CastSpell(40103)
end

function NoxxionSwarm(pUnit, Event)
	pUnit:FullCastSpellOnTarget(24975, pUnit:GetRandomPlayer(0))
end

function Noxxion_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

function Noxxion_OnLeaveCombat(Unit)
	Unit:RemoveEvents()
end

RegisterUnitEvent(13282, 1, "Noxxion_OnCombat")
RegisterUnitEvent(13282, 2, "Noxxion_OnLeaveCombat")
RegisterUnitEvent(13282, 4, "Noxxion_OnDeath")--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function RazorLash_OnCombat(pUnit, event)
	pUnit:RegisterEvent("RazorLashphase1", 1000, 0)
	pUnit:RegisterEvent("RazorLashFaerieFire", 7000, 0)
end

function RazorLashphase1(pUnit, event)
	if(pUnit:GetHealthPct() < 89) then
		pUnit:RemoveEvents()
		pUnit:CastSpell(30035)
		pUnit:CastSpell(41953)
		pUnit:RegisterEvent("RazorLashphase2", 1000, 0)
		pUnit:RegisterEvent("RazorLashFaerieFire", 6000, 0)
		pUnit:RegisterEvent("RazorLashMassRoot", 18000, 0)
	end
end

function RazorLashphase2(pUnit, event)
	if(pUnit:GetHealthPct() < 75) then
		pUnit:RemoveEvents()
		pUnit:RegisterEvent("RazorLashphase3", 1000, 0)
		pUnit:RegisterEvent("RazorLashFaerieFire", 6000, 0)
		x = pUnit:GeyX()
		y = pUnit:GetY()
		z = pUnit:GetZ()
		o = pUnit:GetO()
		pUnit:SpawnCreature(12219, x + 5, y, z, o, 67, 220000)
		pUnit:SpawnCreature(12219, x - 5, y, z, o, 67, 220000)
		pUnit:CastSpell(41953)
	end
end

function RazorLashphase3(pUnit, event)
	if(pUnit:GetHealthPct() < 58) then
		pUnit:RemoveEvents()
		pUnit:RegisterEvent("RazorLashphase4", 1000, 0)
		pUnit:RegisterEvent("RazorLashFaerieFire", 6000, 0)
		pUnit:RegisterEvent("RazorLashMassRoot", 18000, 0)
		x = pUnit:GeyX()
		y = pUnit:GetY()
		z = pUnit:GetZ()
		o = pUnit:GetO()
		pUnit:SpawnCreature(12219, x + 5, y, z, o, 67, 220000)
		pUnit:SpawnCreature(12219, x - 5, y, z, o, 67, 220000)
		pUnit:CastSpell(41953)
	end
end

function RazorLashphase4(pUnit, event)
	if(pUnit:GetHealthPct() < 45) then
		pUnit:RemoveEvents()
		pUnit:CastSpell(41953)
		pUnit:RegisterEvent("RazorLashphase5", 1000, 0)
		pUnit:RegisterEvent("RazorLashFaerieFire", 6000, 0)
		pUnit:RegisterEvent("RazorLashSwarm", 8000, 0)
	end
end

function RazorLashphase5(pUnit, event)
	if(pUnit:GetHealthPct() < 32) then
		pUnit:RemoveEvents()
		pUnit:CastSpell(41953)
		pUnit:CastSpell(27993)
		pUnit:RegisterEvent("RazorLashphase6", 1000, 0)
		pUnit:RegisterEvent("RazorLashSwarm", 8000, 0)
		pUnit:RegisterEvent("RazorLashMassRoot", 18000, 0)
	end
end

function RazorLashphase6(pUnit, event)
	if(pUnit:GetHealthPct() < 15) then
		pUnit:RemoveEvents()
		pUnit:CastSpell(41953)
		pUnit:CastSpell(27993)
		pUnit:RegisterEvent("RazorLashSwarm", 8000, 0)
		pUnit:RegisterEvent("RazorLashMassRoot", 18000, 0)
	end
end

function RazorLashFaerieFire(pUnit, event)
	pUnit:FullCastSpellOnTarget(21670, pUnit:GetRandomPlayer(0))
end

function RazorLashCyclone(pUnit, event)
	pUnit:FullCastSpellOnTarget(33786, pUnit:GetRandomPlayer(0))
end

function RazorLashSwarm(pUnit, event)
	pUnit:FullCastSpellOnTarget(28786, pUnit:GetRandomPlayer(0))
end

function RazorLashMassRoot(pUnit, event)
	pUnit:FullCastSpellOnTarget(20699, pUnit:GetRandomPlayer(0))
	pUnit:FullCastSpellOnTarget(20699, pUnit:GetRandomPlayer(0))
	pUnit:FullCastSpellOnTarget(20699, pUnit:GetRandomPlayer(0))
end

function RazorLash_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end

function RazorLash_OnLeaveCombat(Unit)
	Unit:RemoveEvents()
end

RegisterUnitEvent(12258, 1, "RazorLash_OnCombat")
RegisterUnitEvent(12258, 2, "RazorLash_OnLeaveCombat")
RegisterUnitEvent(12258, 4, "RazorLash_OnDeath")

function Gizlock_OnCombat(Unit, Event)
	Unit:SendChatMessage(12, 0, "Mine! Mine! Mine! Gizlock is the ruler of this domain! You shall never reveal my presence!")
	Unit:RegisterEvent("Shoot", 7000, 0)
	Unit:RegisterEvent("Bomb", 14000, 0)
	Unit:RegisterEvent("Flash", 21000, 0)
	Unit:RegisterEvent("Gun", 28000, 0)
end

function Shoot(pUnit, Event) 
	pUnit:CastSpellOnTarget(16100) 
end

function Bomb(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9143, pUnit:GetMainTank()) 
end

function Flash(pUnit, Event) 
	pUnit:CastSpellOnTarget(29419, pUnit:GetMainTank()) 
end

function Gun(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(21833, pUnit:GetMainTank()) 
end

function Gizlock_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Gizlock_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(13601, 1, "Gizlock_OnCombat")
RegisterUnitEvent(13601, 2, "Gizlock_OnLeaveCombat")
RegisterUnitEvent(13601, 4, "Gizlock_OnDied")