--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation, DARKI, Ascendscripting
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

--[[Transform player into a worgen
Unit:SendChatMessage(14, 0, "Release your rage!")
]]

function Arugal_OnCombat(Unit, Event)
	--Unit:SendChatMessage(14, 0, "Who dares interfere with the Sons of Arugal?") --Send when 'Fenrus the Devourer' dies
	Unit:SendChatMessage(14, 0, "You too, shall serve!")
end

function Arugal_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Arugal_OnKilledTarget(Unit, Event)
    Unit:SendChatMessage(14, 0, "Another falls!")
end

function Arugal_OnDied(Unit, Event)
	Unit:RemoveEvents()
end 

RegisterUnitEvent(4275, 1, "Arugal_OnCombat")
RegisterUnitEvent(4275, 2, "Arugal_OnLeaveCombat")
RegisterUnitEvent(4275, 3, "Arugal_OnKilledTarget")
RegisterUnitEvent(4275, 4, "Arugal_OnDied")

function Puppy_OnCombat(Unit, Player, Event)
	Unit:RegisterEvent("Puppy_Chill", 7000, 0)
	Unit:RegisterEvent("Puppy_Volly", 14000, 0)
	Unit:RegisterEvent("Puppy_Armor", 21000, 0)
	Unit:RegisterEvent("Puppy_IceNova", 35000, 0)
end

function Puppy_Chill(Unit, Player, Event)
	Unit:CastSpell(21098)
end

function Puppy_Volly(Unit, Player, Event)
	Unit:CastSpell(38837)
end

function Puppy_Armor(Unit, Player, Event)
	Unit:CastSpell(27134)
end

function Puppy_IceNova(Unit, Player, Event)
	Unit:CastSpell(31250)
end

function Puppy_OnLeaveCombat(Unit, Player, Event)
	Unit:RemoveEvents()
end

function Puppy_OnKilledTarget(Unit, Player, Event)
	Unit:CastSpell(37669)
end

function Puppy_OnDied(Unit, Player, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(4274, 1, "Puppy_OnCombat")
RegisterUnitEvent(4274, 2, "Puppy_OnLeaveCombat")
RegisterUnitEvent(4274, 3, "Puppy_OnKilledTarget")
RegisterUnitEvent(4274, 4, "Puppy_OnDied")

function KokkenTor_OnCombat (Unit, Event)
    Unit:RegisterEvent("KokkenTor_Fallout", 1000, 1)
    Unit:RegisterEvent("KokkenTor_Doomthrust", 24000, 0) 
    Unit:RegisterEvent("KokkenTor_Armorslice", 20000, 0) 
    Unit:RegisterEvent("KokkenTor_Phase2", 1000, 0)
end

function KokkenTor_Fallout (Unit, Event)
    Unit:FullCastSpellOnTarget(31472, Unit:GetClosestPlayer())
end

function KokkenTor_Doomthrust (Unit, Event)
    Unit:FullCastSpellOnTarget(30744, Unit:GetMainTank())
end

function KokkenTor_Armorslice (Unit, Event)
    Unit:FullCastSpellOnTarget(15656, Unit:GetMainTank())
end

function KokkenTor_Phase2 (Unit, Event)
    if(Unit:GetHealthPct() < 72) then
        Unit:RemoveEvents()
        Unit:RegisterEvent("KokkenTor_Demoncall", 10000, 0)
        Unit:RegisterEvent("KokkenTor_Lethal", 15000, 0)
        Unit:RegisterEvent("KokkenTor_Valiant", 17000, 0)
        Unit:RegisterEvent("KokkenTor_Phase3", 1000, 0)
	end
end

function KokkenTor_Demoncall (Unit, Event)
    Unit:FullCastSpellOnTarget(28383, Unit:GetMainTank())
end

function KokkenTor_Lethal (Unit, Event)
    Unit:FullCastSpellOnTarget(28308, Unit:GetMainTank())
end

function KokkenTor_Valiant (Unit, Event)
    Unit:CastSpell(46287)
end

function KokkenTor_Phase3 (Unit, Event)
    if(Unit:GetHealthPct() < 49) then
        Unit:RemoveEvents()        
        Unit:RegisterEvent("KokkenTor_Demoralize", 20000, 0)
        Unit:RegisterEvent("KokkenTor_Impale", 50000, 0) 
        Unit:RegisterEvent("KokkenTor_Terror", 35000, 0)
        Unit:RegisterEvent("KokkenTor_Phase4", 1000, 0)
	end
end

function KokkenTor_Demoralize (Unit, Event)
    Unit:CastSpell(27780)
end

function KokkenTor_Impale (Unit, Event)
    Unit:CastSpell(19781)
end

function KokkenTor_Terror (Unit, Event)
    Unit:FullCastSpellOnTarget(36950, Unit:GetRandomPlayer(0))
end

function KokkenTor_Phase4 (Unit, Event)
    if(Unit:GetHealthPct() < 20) then
        Unit:RemoveEvents()
        Unit:CastSpell(39046)
    end
end

function KokkenTor_OnLeaveCombat (Unit, Event)
    Unit:RemoveEvents()
end

function KokkenTor_OnDie (Unit, Event)
    Unit:RemoveEvents()   
end

RegisterUnitEvent(3886, 1, "KokkenTor_OnCombat")
RegisterUnitEvent(3886, 2, "KokkenTor_OnLeaveCombat")
RegisterUnitEvent(3886, 4, "KokkenTor_OnDie")

function Rethilgore_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Rethilgore_SoulDrain", 1400, 0)
end

function Rethilgore_SoulDrain(pUnit, Event)
	pUnit:FullCastSpellOnTarget(7295, GetRandomPlayer(0))
end

function Razorclaw_OnCombat(pUnit, Event)
	--Nothing for Razorclaw.
end

function Baron_Silverlaine_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Baron_Silverlaine_Veil", 5000, 0)
end

function Baron_Silverlaine_Veil(pUnit, Event)
	pUnit:FullCastSpellOnTarget(7068, pUnit:GetRandomPlayer(4)) 
end

function Commander_Springvale_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Commander_Springvale_Hammer", 11000, 0)
	pUnit:RegisterEvent("Commander_Springvale_Heal", 15765, 0)
end

function Commander_Springvale_Heal(pUnit, Event)
	pUnit:CastSpell(5573) 
	pUnit:CastSpell(1026)
end

function Commander_Springvale_Hammer(pUnit, Event)
	pUnit:FullCastSpellOnTarget(7068, pUnit:GetRandomPlayer(0)) 
end

function Odo_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Odo_Rage1", 100, 0)
	pUnit:RegisterEvent("Odo_Rage2", 100, 0)
	pUnit:RegisterEvent("Odo_Rage3", 100, 0)
end

function Odo_Rage1(pUnit, Event)
	if(pUnit:GetHealthPct() == 45) then
		pUnit:CastSpell(7481) 
	end
end

function Odo_Rage2(pUnit, Event)
	if(pUnit:GetHealthPct() == 30) then
		pUnit:CastSpell(7483) 
	end
end
	
function Odo_Rage3(pUnit, Event)
	if(pUnit:GetHealthPct() == 15) then
		pUnit:CastSpell(7484) 
	end
end

function Fenrus_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Fenrus_Toxic", 951, 0)
end

function Fenrus_Toxic(pUnit, Event)
	pUnit:FullCastSpellOnTarget(7125, pUnit:GetRandomPlayer(0))
end

function Nandos_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "You have disturbed my pack! Feel my wrath!")
	pUnit:RegisterEvent("Nandos_Worg", 5550, 6)
end	

function Nandos_Worg(pUnit, Event)
	RandomTimer5 = math.random(1,3)
	if(RandomTimer5 == 1) then
		pUnit:CastSpell(7487)
	elseif(RandomTimer5 == 2) then
		pUnit:CastSpell(7488)
	elseif(RandomTimer5 == 3) then
		pUnit:CastSpell(7489)
	end
end	

function Arugal_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Arugal_Random", 1573, 0)
	pUnit:SendChatMessage(14, 0, "Feel my wrath!")
end

function Arugal_Random(pUnit, Event)
	RandomTimer7 = math.random(1,6)
	if(RandomTimer7 == 1) then
		pUnit:FullCastSpellOnTarget(7588, pUnit:GetRandomPlayer(0)) 
	elseif(RandomTimer7 == 2) then
		pUnit:FullCastSpellOnTarget(7588, pUnit:GetRandomPlayer(0))
	elseif(RandomTimer7 == 3) then
		pUnit:FullCastSpellOnTarget(7588, pUnit:GetRandomPlayer(0))
	elseif(RandomTimer7 == 4) then
		pUnit:FullCastSpellOnTarget(7124, pUnit:GetRandomPlayer(0))
	elseif(RandomTimer7 == 5) then
		pUnit:CastSpell(7803)
	elseif(RandomTimer7 == 6) then
		pUnit:FullCastSpellOnTarget(7621, pUnit:GetRandomPlayer(0)) 
	end
end

RegisterUnitEvent(4275, 1, "Arugal_OnCombat")
RegisterUnitEvent(3927, 1, "Nandos_OnCombat")
RegisterUnitEvent(4274, 1, "Fenrus_OnCombat")
RegisterUnitEvent(4279, 1, "Odo_OnCombat")
RegisterUnitEvent(4278, 1, "Commander_Springvale_OnCombat")
RegisterUnitEvent(3887, 1, "Baron_Silverlaine_OnCombat")
RegisterUnitEvent(3886, 1, "Razorclaw_OnCombat")
RegisterUnitEvent(3914, 1, "Rethilgore_OnCombat")

function Nandos_OnCombat(Unit, Event)
	Unit:SendChatMessage(14, 0, "I can't believe it! You've destroyed my pack... Now face my wrath!")
end

function Nandos_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Nandos_OnDied(Unit, Event)
	Unit:RemoveEvents()
end 

RegisterUnitEvent(3927, 1, "Nandos_OnCombat")
RegisterUnitEvent(3927, 2, "Nandos_OnLeaveCombat")
RegisterUnitEvent(3927, 4, "Nandos_OnDied")