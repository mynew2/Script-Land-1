--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation, BrantX, Azolex, Moon++, LASP
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function FelCrystal_OnSpawn(Unit,Event)
	Unit:StopMovement(1)
	Unit:SetCombatMeleeCapable(1)
	Unit:SetCombatCapable(1)
	Unit:SetCombatTargetingCapable(1)
end

function FelCrystal_OnDied(Unit,Event)
	Unit:RemoveEvents()
	Unit:RegisterEvent("FelCrystal_RemoveFromWorld", 3500, 1)
end

function FelCrystal_RemoveFromWorld(Unit,Event)
	Unit:RemoveFromWorld()
end

RegisterUnitEvent(24722, 18, "FelCrystal_OnSpawn")
RegisterUnitEvent(24722, 4, "FelCrystal_OnDied")

function HandOfDeceiverVisual_OnSpawn(Unit,Event)
	Unit:FullCastSpell(51795)
	Unit:RegisterEvent("HandOfDeceiverVisual_Channel", 10000, 0)
end

function HandOfDeceiverVisual_Channel(Unit,Event)
	Unit:FullCastSpell(51795)
end

RegisterUnitEvent(25955, 18, "HandOfDeceiverVisual_OnSpawn")

--[[ Sound ID's
Sound\Creature\PrinceKaelthasSunstrider [12413] name=A_MTERRACE_BROKENKAELAGGRO file1=BROKENKAELAGGRO.wav 
Sound\Creature\PrinceKaelthasSunstrider [12415] name=A_MTERRACE_BROKENKAELPHOENIX 
Sound\Creature\PrinceKaelthasSunstrider [12417] name=A_MTERRACE_BROKENKAELFLAMESTRIK 
Sound\Creature\PrinceKaelthasSunstrider [12418] name=A_MTERRACE_BROKENKAELPHASE2 
Sound\Creature\PrinceKaelthasSunstrider [12419] name=A_MTERRACE_BROKENKAELWEAKENED 
Sound\Creature\PrinceKaelthasSunstrider [12420] name=A_MTERRACE_BROKENKAELMOREAIR 
Sound\Creature\PrinceKaelthasSunstrider [12421] name=A_MTERRACE_BROKENKAELDEATH 

Spells:
Alternative for FlameStrike : 37428 (Summoned Dummy/Trigger will cast it after 5 seconds,  only 3k damage so it wiill repeat it self for heroic 3x times for normal mode 2x.
]]

--Defines
local OBJECT_END =	0x006
local Unit_FIELD_FLAGS = OBJECT_END + 0x028
local Unit_FLAG_NOT_ATTACKABLE_9 = 0x00000100
local Unit_FLAG_NOT_SELECTABLE = 0x02000000

function Kael_OnEnterCombat(pUnit,Event)
    pUnit:Root()
	pUnit:SendChatMessage(14, 0, "Don't look so smug! I know what you're thinking, but Tempest Keep was merely a set back. Did you honestly believe I would trust the future to some blind, half-night elf mongrel? Hahahaha... Oh no, no, no, he was merely an instrument, a stepping stone to a much larger plan! It has all led to this...and this time, you will not interfere!")
	pUnit:PlaySoundToSet(12413)
	pUnit:SetUInt32Value(Unit_FIELD_FLAGS, Unit_FLAG_NOT_SELECTABLE+Unit_FLAG_NOT_ATTACKABLE_9)	
	pUnit:RegisterEvent("Kael_Phase1", 38000, 1)
end

function Kael_Phase1(pUnit,Event)
	pUnit:RemoveEvents()
    pUnit:Root()
	pUnit:RegisterEvent("Kael_FireBolt", 2500, 0)
	pUnit:RegisterEvent("Kael_PhoenixSummon", 25000, 2)
	pUnit:RegisterEvent("Kael_FlameStrike", 21000, 0)	
	if(pUnit:GetHealthPct() > 50) then
		pUnit:RegisterEvent("Kael_Gravity", 1000, 0)
	end
end

function Kael_Fireball(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46164,pUnit:GetMainTank())
end

function Kael_PhoenixSummon(pUnit,Event)
	pUnit:SendChatMessage(14, 0,"Vengeance burns!")
	pUnit:PlaySoundToSet(12415)
	local player = pUnit:GetRandomPlayer(7)
    if(type(player) == "userdata") then
		pUnit:SpawnCreature(24674 , player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 14, 0) 
	end
end

function Kael_FlameStrike(pUnit,Event)
	pUnit:SendChatMessage(14, 0,"Felomin ashal!")
	pUnit:PlaySoundToSet(12417)
	local player = pUnit:GetRandomPlayer(3)
	if(type(player) == "userdata") then
		pUnit:SpawnCreature(24666 , player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 14, 5)
	end
end	

function Kael_Gravity(pUnit,Event)
	pUnit:RemoveEvents()
	pUnit:Root()
	pUnit:SendChatMessage(14, 0,"I'll turn your world...upside...down.")
	pUnit:PlaySoundToSet(12418)
	pUnit:FullCastSpell(44224)
	pUnit:RegisterEvent("Kael_Week", 30000, 1)
end

function Kael_Week(pUnit,Event)
	pUnit:Root()
	pUnit:SendChatMessage(14, 0,"Master, grant me strength.")
	pUnit:PlaySoundToSet(12419)
	pUnit:FullCastSpell(36185)
	pUnit:RegisterEvent("Kael_Again", 10000, 1)
end

function Kael_Again(pUnit,Event) 
	pUnit:RemoveEvents()
    pUnit:Root()
	pUnit:SendChatMessage(14, 0,"Do not get...too comfortable.")
	pUnit:PlaySoundToSet(12420)
	pUnit:FullCastSpell(44224)
	pUnit:RegisterEvent("Kael_Week", 30000, 1)
end

function Kael_OnDied(pUnit, event, player)
	pUnit:SendChatMessage(14, 0,"My demise accomplishes nothing! The Master will have you! You will drown in your own blood! The world shall burn! Aaaghh!")
	pUnit:PlaySoundToSet(12421)
	pUnit:RemoveEvents()
end

function Kael_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()	
end

RegisterUnitEvent(24664, 1, "Kael_OnEnterCombat")
RegisterUnitEvent(24664, 2, "Kael_OnLeaveCombat")
RegisterUnitEvent(24664, 4, "Kael_OnDied")

function Phoenix_OnEnterCombat(pUnit,Event)
	pUnit:RegisterEvent("Phoenix_HellFire", 2500, 0)
end

function Phoenix_HellFire(pUnit,Event)
	pUnit:FullCastSpell(44199)
end
	
function Phoenix_OnDied(pUnit, event, player)
	local x,y,z,o = pUnit:GetX(),pUnit:GetY(),pUnit:GetZ(),pUnit:GetO()
	pUnit:SpawnCreature(24675 , x, y, z, o, 14, 10000)
	pUnit:RemoveEvents()
end

function Phoenix_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()	
end

RegisterUnitEvent(24674, 1, "Phoenix_OnEnterCombat")
RegisterUnitEvent(24674, 2, "Phoenix_OnLeaveCombat")
RegisterUnitEvent(24674, 4, "Phoenix_OnDied")

function Egg_OnEnterCombat(pUnit,Event)
    pUnit:Root()
	local x,y,z,o = pUnit:GetX(),pUnit:GetY(),pUnit:GetZ(),pUnit:GetO()
	pUnit:SpawnCreature(24674 , x, y, z, o, 14, 0)
end
	
function Egg_OnDied(pUnit, event, player)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(24675, 1, "Egg_OnEnterCombat")
RegisterUnitEvent(24675, 4, "Egg_OnDied")

function FS_OnEnterCombat(pUnit,Event)
    pUnit:Root()
	pUnit:SetUInt32Value(Unit_FIELD_FLAGS, Unit_FLAG_NOT_SELECTABLE+Unit_FLAG_NOT_ATTACKABLE_9)
	pUnit:RegisterEvent("FS_Cast", 4500, 1)
	pUnit:RegisterEvent("FS_Cast2", 5000, 1)
end
	
function FS_Cast(pUnit,Event)
	pUnit:FullCastSpell(37428) 
end

function FS_Cast2(pUnit,Event)
	pUnit:FullCastSpell(37428) 
	pUnit:RemoveFromWorld()
end

RegisterUnitEvent(24666, 1, "FS_OnEnterCombat")

--Fizzle-Warlocks Pet-Imp
function Fizzle_OnCombat(Unit, Event)
   Unit:RegisterEvent("Fizzle_Fireball", 5000, 0)
end

function Fizzle_Fireball(pUnit, Event)
   pUnit:FullCastSpellOnTarget(44164, pUnit:GetRandomPlayer(0))
end

function Fizzle_LeaveCombat(Unit, Event)
   Unit:RemoveEvents()
end

function Fizzle_Died(Unit, Event)
   Unit:RemoveEvents()
end

RegisterUnitEvent(24656, 1, "Fizzle_OnCombat")
RegisterUnitEvent(24656, 2, "Fizzle_LeaveCombat")
RegisterUnitEvent(24656, 4, "Fizzle_Died")

--Ellrys Duskhallow-warlock
function warlockadd_OnCombat(Unit, Event)
   Unit:RegisterEvent("warlockadd_Fear", 7500, 0)
   Unit:RegisterEvent("warlockadd_ShadowBolt", 4500, 0)
   Unit:RegisterEvent("warlockadd_Curse", 10000, 0)
end

function warlockadd_Fear(pUnit, Event)
   pUnit:FullCastSpellOnTarget(38595, pUnit:GetRandomPlayer(0))
end

function warlockadd_ShadowBolt(pUnit, Event)
   pUnit:FullCastSpellOnTarget(15232, pUnit:GetRandomPlayer(0))
end

function warlockadd_Curse(pUnit, Event)
   pUnit:FullCastSpellOnTarget(46190, pUnit:GetRandomPlayer(0))
end

function warlockadd_LeaveCombat(Unit, Event)
   Unit:RemoveEvents()
end

function warlockadd_Died(Unit, Event)
   Unit:RemoveEvents()
end

RegisterUnitEvent(24558, 1, "warlockadd_OnCombat")
RegisterUnitEvent(24558, 2, "warlockadd_LeaveCombat")
RegisterUnitEvent(24558, 4, "warlockadd_Died")

--Yazzai-Mage
function MageAdd_OnCombat(Unit, Event)
   Unit:RegisterEvent("MageAdd_Polymorph", 10000, 0)
   Unit:RegisterEvent("MageAdd_FrostBolt", 4500, 0)
   Unit:RegisterEvent("MageAdd_ConeOfCold", 10000, 0)
end

function MageAdd_Polymorph(pUnit, Event)
   pUnit:FullCastSpellOnTarget(13323, pUnit:GetRandomPlayer(0))
end

function MageAdd_FrostBolt(pUnit, Event)
   pUnit:FullCastSpellOnTarget(15043, pUnit:GetRandomPlayer(0))
end

function MageAdd_ConeOfCold(pUnit, Event)
   pUnit:FullCastSpell(38384)
end

function MageAdd_LeaveCombat(Unit, Event)
   Unit:RemoveEvents()
end

function MageAdd_Died(Unit, Event)
   Unit:RemoveEvents()
end

RegisterUnitEvent(24561, 1, "MageAdd_OnCombat")
RegisterUnitEvent(24561, 2, "MageAdd_LeaveCombat")
RegisterUnitEvent(24561, 4, "MageAdd_Died")

--Warlord Salaris-Warrior
function WarriorAdd_OnCombat(Unit, Event)
   Unit:RegisterEvent("WarriorAdd_MortalStrike", 10000, 0)
   Unit:RegisterEvent("WarriorAdd_Hamstring", 5000, 0)
   Unit:RegisterEvent("WarriorAdd_Daze", 21000, 0)
   Unit:RegisterEvent("WarriorAdd_FrighteningShout", 1, 0)
end

function WarriorAdd_MortalStrike(pUnit, Event)
   pUnit:FullCastSpellOnTarget(44268, pUnit:GetMainTank())
end

function WarriorAdd_Hamstring(pUnit, Event)
   pUnit:FullCastSpellOnTarget(27584, pUnit:GetRandomPlayer(0))
end

function WarriorAdd_Daze(pUnit, Event)
   pUnit:FullCastSpell(23600)
end

function WarriorAdd_FrighteningShout(pUnit, Event)
	if(pUnit:GetHealthPct() == 20) then
	   pUnit:FullCastSpell(19134)
	end
end

function WarriorAdd_LeaveCombat(Unit, Event)
   Unit:RemoveEvents()
end

function WarriorAdd_Died(Unit, Event)
   Unit:RemoveEvents()
end

RegisterUnitEvent(24559, 1, "WarriorAdd_OnCombat")
RegisterUnitEvent(24559, 2, "WarriorAdd_LeaveCombat")
RegisterUnitEvent(24559, 4, "WarriorAdd_Died")

--Garaxxas-Hunter
function HunterAdd_OnCombat(Unit, Event)
   Unit:RegisterEvent("HunterAdd_AutoShoot", 2200, 0)
   Unit:RegisterEvent("HunterAdd_MultiShoot", 8000, 0)
   Unit:RegisterEvent("HunterAdd_Trap", 18000, 0)
   Unit:RegisterEvent("HunterAdd_AimedShoot", 1, 0)
   Unit:RegisterEvent("HunterAdd_Clip", 14000, 0)
end

function HunterAdd_AutoShoot(pUnit, Event)
   pUnit:FullCastSpellOnTarget(15620, pUnit:GetRandomPlayer(0))
end

function HunterAdd_MultiShoot(pUnit, Event)
   pUnit:FullCastSpellOnTarget(44285, pUnit:GetRandomPlayer(0))
end

function HunterAdd_Trap(pUnit, Event)
   pUnit:FullCastSpell(44136)
end

function HunterAdd_AimedShoot(pUnit, Event)
	if(pUnit:GetHealthPct() == 32) then
	   pUnit:FullCastSpellOnTarget(44271, pUnit:GetRandomPlayer(0))
	end
end

function WarriorAdd_Clip(pUnit, Event)
   pUnit:FullCastSpellOnTarget(44286, pUnit:GetMainTank())
end

function HunterAdd_LeaveCombat(Unit, Event)
   Unit:RemoveEvents()
end

function HunterAdd_Died(Unit, Event)
   Unit:RemoveEvents()
end

RegisterUnitEvent(24555, 1, "HunterAdd_OnCombat")
RegisterUnitEvent(24555, 2, "HunterAdd_LeaveCombat")
RegisterUnitEvent(24555, 4, "HunterAdd_Died")

--Eramas Brightblaze-Monk
function Monkadd_OnCombat(Unit, Event)
   Unit:RegisterEvent("Monkadd_Stun", 9500, 0)
   Unit:RegisterEvent("Monkadd_Kick", 7200, 0)
end

function Monkadd_Stun(pUnit, Event)
   pUnit:FullCastSpellOnTarget(46183, pUnit:GetRandomPlayer(1))
end

function Monkadd_Kick(pUnit, Event)
   pUnit:FullCastSpellOnTarget(46182, pUnit:GetRandomPlayer(1))
end

function Monkadd_LeaveCombat(Unit, Event)
   Unit:RemoveEvents()
end

function Monkadd_Died(Unit, Event)
   Unit:RemoveEvents()
end

RegisterUnitEvent(24554, 1, "Monkadd_OnCombat")
RegisterUnitEvent(24554, 2, "Monkadd_LeaveCombat")
RegisterUnitEvent(24554, 4, "Monkadd_Died")

function PriestessDelrissa_Minions(pUnit, Event)
local random = math.random(1, 25)
	if(random == 1) then
		pUnit:SpawnCreature(24557, 123.870529, 12.468772, -20.004911, 4.856926, 14, 0)
		pUnit:SpawnCreature(24558, 130.000900, 11.941279, -20.004900, 4.399158, 14, 0)
		pUnit:SpawnCreature(24656, 128.804245, 11.850257, -20.004900, 4.610291, 14, 0)
		pUnit:SpawnCreature(24554, 132.254776, 10.996053, -20.004902, 4.230160, 14, 0)
		pUnit:SpawnCreature(24561, 121.413750, 11.002829, -20.004902, 5.005877, 14, 0)
	elseif(random == 2) then
		pUnit:SpawnCreature(24557, 123.870529, 12.468772, -20.004911, 4.856926, 14, 0)
		pUnit:SpawnCreature(24558, 130.000900, 11.941279, -20.004900, 4.399158, 14, 0)
		pUnit:SpawnCreature(24656, 128.804245, 11.850257, -20.004900, 4.610291, 14, 0)
		pUnit:SpawnCreature(24554, 132.254776, 10.996053, -20.004902, 4.230160, 14, 0)
		pUnit:SpawnCreature(24559, 121.413750, 11.002829, -20.004902, 5.005877, 14, 0)
	elseif(random == 3) then
		pUnit:SpawnCreature(24557, 123.870529, 12.468772, -20.004911, 4.856926, 14, 0)
		pUnit:SpawnCreature(24558, 130.000900, 11.941279, -20.004900, 4.399158, 14, 0)
		pUnit:SpawnCreature(24656, 128.804245, 11.850257, -20.004900, 4.610291, 14, 0)
		pUnit:SpawnCreature(24554, 132.254776, 10.996053, -20.004902, 4.230160, 14, 0)
		pUnit:SpawnCreature(24555, 121.413750, 11.002829, -20.004902, 5.005877, 14, 0)
		pUnit:SpawnCreature(24552, 119.496450, 9.265259, -20.004902, 5.552326, 14, 0)
	elseif(random == 4) then
		pUnit:SpawnCreature(24557, 123.870529, 12.468772, -20.004911, 4.856926, 14, 0)
		pUnit:SpawnCreature(24558, 130.000900, 11.941279, -20.004900, 4.399158, 14, 0)
		pUnit:SpawnCreature(24656, 128.804245, 11.850257, -20.004900, 4.610291, 14, 0)
		pUnit:SpawnCreature(24554, 132.254776, 10.996053, -20.004902, 4.230160, 14, 0)
		pUnit:SpawnCreature(24553, 121.413750, 11.002829, -20.004902, 5.005877, 14, 0)
	elseif(random == 5) then
		pUnit:SpawnCreature(24557, 123.870529, 12.468772, -20.004911, 4.856926, 14, 0)
		pUnit:SpawnCreature(24558, 130.000900, 11.941279, -20.004900, 4.399158, 14, 0)
		pUnit:SpawnCreature(24656, 128.804245, 11.850257, -20.004900, 4.610291, 14, 0)
		pUnit:SpawnCreature(24554, 132.254776, 10.996053, -20.004902, 4.230160, 14, 0)
		pUnit:SpawnCreature(24556, 121.413750, 11.002829, -20.004902, 5.005877, 14, 0)
	elseif(random == 6) then
		pUnit:SpawnCreature(24558, 123.870529, 12.468772, -20.004911, 4.856926, 14, 0)
		pUnit:SpawnCreature(24656, 124.948463, 11.833995, -20.004911, 4.771299, 14, 0)
		pUnit:SpawnCreature(24554, 130.000900, 11.941279, -20.004900, 4.399158, 14, 0)
		pUnit:SpawnCreature(24561, 132.254776, 10.996053, -20.004902, 4.230160, 14, 0)
		pUnit:SpawnCreature(24559, 121.413750, 11.002829, -20.004902, 5.005877, 14, 0)
	elseif(random == 7) then
		pUnit:SpawnCreature(24558, 123.870529, 12.468772, -20.004911, 4.856926, 14, 0)
		pUnit:SpawnCreature(24656, 124.948463, 11.833995, -20.004911, 4.771299, 14, 0)
		pUnit:SpawnCreature(24554, 130.000900, 11.941279, -20.004900, 4.399158, 14, 0)
		pUnit:SpawnCreature(24561, 132.254776, 10.996053, -20.004902, 4.230160, 14, 0)
		pUnit:SpawnCreature(24555, 121.413750, 11.002829, -20.004902, 5.005877, 14, 0)
	elseif(random == 8) then
		pUnit:SpawnCreature(24558, 123.870529, 12.468772, -20.004911, 4.856926, 14, 0)
		pUnit:SpawnCreature(24656, 124.948463, 11.833995, -20.004911, 4.771299, 14, 0)
		pUnit:SpawnCreature(24554, 130.000900, 11.941279, -20.004900, 4.399158, 14, 0)
		pUnit:SpawnCreature(24561, 132.254776, 10.996053, -20.004902, 4.230160, 14, 0)
		pUnit:SpawnCreature(24553, 121.413750, 11.002829, -20.004902, 5.005877, 14, 0)
	elseif(random == 9) then
		pUnit:SpawnCreature(24554, 123.870529, 12.468772, -20.004911, 4.856926, 14, 0)
		pUnit:SpawnCreature(24561, 130.000900, 11.941279, -20.004900, 4.399158, 14, 0)
		pUnit:SpawnCreature(24559, 132.254776, 10.996053, -20.004902, 4.230160, 14, 0)
		pUnit:SpawnCreature(24555, 121.413750, 11.002829, -20.004902, 5.005877, 14, 0)
	elseif(random == 10) then
		pUnit:SpawnCreature(24558, 123.870529, 12.468772, -20.004911, 4.856926, 14, 0)
		pUnit:SpawnCreature(24656, 124.948463, 11.833995, -20.004911, 4.771299, 14, 0)
		pUnit:SpawnCreature(24554, 130.000900, 11.941279, -20.004900, 4.399158, 14, 0)
		pUnit:SpawnCreature(24561, 132.254776, 10.996053, -20.004902, 4.230160, 14, 0)
		pUnit:SpawnCreature(24556, 121.413750, 11.002829, -20.004902, 5.005877, 14, 0)
	elseif(random == 11) then
		pUnit:SpawnCreature(24554, 123.870529, 12.468772, -20.004911, 4.856926, 14, 0)
		pUnit:SpawnCreature(24561, 130.000900, 11.941279, -20.004900, 4.399158, 14, 0)
		pUnit:SpawnCreature(24559, 132.254776, 10.996053, -20.004902, 4.230160, 14, 0)
		pUnit:SpawnCreature(24553, 121.413750, 11.002829, -20.004902, 5.005877, 14, 0)
	elseif(random == 12) then
		pUnit:SpawnCreature(24554, 123.870529, 12.468772, -20.004911, 4.856926, 14, 0)
		pUnit:SpawnCreature(24561, 130.000900, 11.941279, -20.004900, 4.399158, 14, 0)
		pUnit:SpawnCreature(24559, 132.254776, 10.996053, -20.004902, 4.230160, 14, 0)
		pUnit:SpawnCreature(24556, 121.413750, 11.002829, -20.004902, 5.005877, 14, 0)
	elseif(random == 13) then
		pUnit:SpawnCreature(24561, 123.870529, 12.468772, -20.004911, 4.856926, 14, 0)
		pUnit:SpawnCreature(24559, 130.000900, 11.941279, -20.004900, 4.399158, 14, 0)
		pUnit:SpawnCreature(24553, 132.254776, 10.996053, -20.004902, 4.230160, 14, 0)
		pUnit:SpawnCreature(24555, 121.413750, 11.002829, -20.004902, 5.005877, 14, 0)
		pUnit:SpawnCreature(24552, 119.496450, 9.265259, -20.004902, 5.552326, 14, 0)
	elseif(random == 14) then
		pUnit:SpawnCreature(24561, 123.870529, 12.468772, -20.004911, 4.856926, 14, 0)
		pUnit:SpawnCreature(24559, 130.000900, 11.941279, -20.004900, 4.399158, 14, 0)
		pUnit:SpawnCreature(24556, 132.254776, 10.996053, -20.004902, 4.230160, 14, 0)
		pUnit:SpawnCreature(24555, 121.413750, 11.002829, -20.004902, 5.005877, 14, 0)
		pUnit:SpawnCreature(24552, 119.496450, 9.265259, -20.004902, 5.552326, 14, 0)
	elseif(random == 15) then
		pUnit:SpawnCreature(24559, 123.870529, 12.468772, -20.004911, 4.856926, 14, 0)
		pUnit:SpawnCreature(24553, 130.000900, 11.941279, -20.004900, 4.399158, 14, 0)
		pUnit:SpawnCreature(24555, 132.254776, 10.996053, -20.004902, 4.230160, 14, 0)
		pUnit:SpawnCreature(24552, 134.965820, 9.356191, -20.004902, 4.259219, 14, 0)
		pUnit:SpawnCreature(24556, 121.413750, 11.002829, -20.004902, 5.005877, 14, 0)
	elseif(random == 16) then
		pUnit:SpawnCreature(24555, 123.870529, 12.468772, -20.004911, 4.856926, 14, 0)
		pUnit:SpawnCreature(24553, 130.000900, 11.941279, -20.004900, 4.399158, 14, 0)
		pUnit:SpawnCreature(24556, 132.254776, 10.996053, -20.004902, 4.230160, 14, 0)
		pUnit:SpawnCreature(24557, 121.413750, 11.002829, -20.004902, 5.005877, 14, 0)
	elseif(random == 17) then
		pUnit:SpawnCreature(24556, 123.870529, 12.468772, -20.004911, 4.856926, 14, 0)
		pUnit:SpawnCreature(24553, 130.000900, 11.941279, -20.004900, 4.399158, 14, 0)
		pUnit:SpawnCreature(24555, 132.254776, 10.996053, -20.004902, 4.230160, 14, 0)
		pUnit:SpawnCreature(24552, 134.965820, 9.356191, -20.004902, 4.259219, 14, 0)
		pUnit:SpawnCreature(24558, 121.413750, 11.002829, -20.004902, 5.005877, 14, 0)
		pUnit:SpawnCreature(24656, 122.813576, 11.031157, -20.004902, 4.912669, 14, 0)
	elseif(random == 18) then
		pUnit:SpawnCreature(24556, 123.870529, 12.468772, -20.004911, 4.856926, 14, 0)
		pUnit:SpawnCreature(24553, 130.000900, 11.941279, -20.004900, 4.399158, 14, 0)
		pUnit:SpawnCreature(24555, 132.254776, 10.996053, -20.004902, 4.230160, 14, 0)
		pUnit:SpawnCreature(24552, 134.965820, 9.356191, -20.004902, 4.259219, 14, 0)
		pUnit:SpawnCreature(24554, 121.413750, 11.002829, -20.004902, 5.005877, 14, 0)
	elseif(random == 19) then
		pUnit:SpawnCreature(24556, 123.870529, 12.468772, -20.004911, 4.856926, 14, 0)
		pUnit:SpawnCreature(24553, 130.000900, 11.941279, -20.004900, 4.399158, 14, 0)
		pUnit:SpawnCreature(24555, 132.254776, 10.996053, -20.004902, 4.230160, 14, 0)
		pUnit:SpawnCreature(24552, 134.965820, 9.356191, -20.004902, 4.259219, 14, 0)
		pUnit:SpawnCreature(24561, 121.413750, 11.002829, -20.004902, 5.005877, 14, 0)
	elseif(random == 20) then
		pUnit:SpawnCreature(24556, 123.870529, 12.468772, -20.004911, 4.856926, 14, 0)
		pUnit:SpawnCreature(24553, 130.000900, 11.941279, -20.004900, 4.399158, 14, 0)
		pUnit:SpawnCreature(24555, 132.254776, 10.996053, -20.004902, 4.230160, 14, 0)
		pUnit:SpawnCreature(24552, 134.965820, 9.356191, -20.004902, 4.259219, 14, 0)
		pUnit:SpawnCreature(24559, 121.413750, 11.002829, -20.004902, 5.005877, 14, 0)
	elseif(random == 21) then
		pUnit:SpawnCreature(24553, 123.870529, 12.468772, -20.004911, 4.856926, 14, 0)
		pUnit:SpawnCreature(24556, 130.000900, 11.941279, -20.004900, 4.399158, 14, 0)
		pUnit:SpawnCreature(24557, 132.254776, 10.996053, -20.004902, 4.230160, 14, 0)
		pUnit:SpawnCreature(24558, 121.413750, 11.002829, -20.004902, 5.005877, 14, 0)
		pUnit:SpawnCreature(24656, 122.813576, 11.031157, -20.004902, 4.912669, 14, 0)
	elseif(random == 22) then
		pUnit:SpawnCreature(24553, 123.870529, 12.468772, -20.004911, 4.856926, 14, 0)
		pUnit:SpawnCreature(24556, 130.000900, 11.941279, -20.004900, 4.399158, 14, 0)
		pUnit:SpawnCreature(24557, 132.254776, 10.996053, -20.004902, 4.230160, 14, 0)
		pUnit:SpawnCreature(24554, 121.413750, 11.002829, -20.004902, 5.005877, 14, 0)
	elseif(random == 23) then
		pUnit:SpawnCreature(24553, 123.870529, 12.468772, -20.004911, 4.856926, 14, 0)
		pUnit:SpawnCreature(24556, 130.000900, 11.941279, -20.004900, 4.399158, 14, 0)
		pUnit:SpawnCreature(24557, 132.254776, 10.996053, -20.004902, 4.230160, 14, 0)
		pUnit:SpawnCreature(24561, 121.413750, 11.002829, -20.004902, 5.005877, 14, 0)
	elseif(random == 24) then
		pUnit:SpawnCreature(24553, 123.870529, 12.468772, -20.004911, 4.856926, 14, 0)
		pUnit:SpawnCreature(24556, 130.000900, 11.941279, -20.004900, 4.399158, 14, 0)
		pUnit:SpawnCreature(24557, 132.254776, 10.996053, -20.004902, 4.230160, 14, 0)
		pUnit:SpawnCreature(24559, 121.413750, 11.002829, -20.004902, 5.005877, 14, 0)
	else
		pUnit:SpawnCreature(24553, 123.870529, 12.468772, -20.004911, 4.856926, 14, 0)
		pUnit:SpawnCreature(24556, 130.000900, 11.941279, -20.004900, 4.399158, 14, 0)
		pUnit:SpawnCreature(24557, 132.254776, 10.996053, -20.004902, 4.230160, 14, 0)
		pUnit:SpawnCreature(24555, 121.413750, 11.002829, -20.004902, 5.005877, 14, 0)
		pUnit:SpawnCreature(24552, 119.496450, 9.265259, -20.004902, 5.552326, 14, 0)
	end
end

RegisterUnitEvent(24560, 6, "PriestessDelrissa_Minions")

local X = Unit:GetX()
local Y = Unit:GetY()
local Z = Unit:GetZ()
local O = Unit:GetO()

function SelinFireheart_OnSpawn(Unit, Event)
	Unit:SetMana(0)
	Unit:SetMaxMana(32310)
end

function SelinFireheart_OnEnterCombat(Unit, Event)
	Unit:SendChatMessage(14, 0, "You only waste my time!")
	Unit:PlaySoundToSet(12378)
	Unit:RegisterEvent("SelinFireheart_Phase1Move", 17000, 1)
end

function SelinFireheart_Phase1Move1(Unit, Event)
local plr = Unit:GetClosestPlayer()
	if(plr == nil) then
		return
	else
		Unit:SetCombatMeleeCapable(1)
		--Crystal 1 should be left (on stage)
		--Crystal 2 should be middle (on stage)
		--Crystal 3 should be right (on stage)
		--Crystal 4 should be left (on floor)
		--Crystal 5 should be right (on floor)
local Choice = math.random(1, 5)
		if(Choice == 1) then
			Unit:MoveTo(X, Y, Z, O)
			Unit:RegisterEvent("SelinFireheart_Crystal1", 4000, 0)
		elseif(Choice == 2) then
			Unit:MoveTo(X, Y, Z, O)
			Unit:RegisterEvent("SelinFireheart_Crystal2", 4000, 0)
		elseif(Choice == 3) then
			Unit:MoveTo(X, Y, Z, O)
			Unit:RegisterEvent("SelinFireheart_Crystal3", 4000, 0)
		elseif(Choice == 4) then
			Unit:MoveTo(X, Y, Z, O)
			Unit:RegisterEvent("SelinFireheart_Crystal4", 4000, 0)
		elseif(Choice == 5) then
			Unit:MoveTo(X, Y, Z, O)
			Unit:RegisterEvent("SelinFireheart_Crystal5", 4000, 0)
		end
	end
end

function SelinFireheart_Crystal1(Unit,Event)
	Unit:RemoveEvents()
	local crystal = Unit:GetCreatureNearestCoords(X, Y, Z, 24722)
	Unit:SetCombatMeleeCapable(1)
	Unit:FullCastSpellOnTarget(44294, crystal)
	Unit:CastSpell(8358)
end

function SelinFireheart_Crystal2(Unit,Event)
	Unit:RemoveEvents()
	local crystal = Unit:GetCreatureNearestCoords(X, Y, Z, 24722)
	Unit:SetCombatMeleeCapable(1)
	Unit:FullCastSpellOnTarget(44294, crystal)
	Unit:CastSpell(8358)
end

function SelinFireheart_Crystal3(Unit,Event)
	Unit:RemoveEvents()
	local crystal = Unit:GetCreatureNearestCoords(X, Y, Z, 24722)
	Unit:SetCombatMeleeCapable(1)
	Unit:FullCastSpellOnTarget(44294, crystal)
	Unit:CastSpell(8358)
end

function SelinFireheart_Crystal4(Unit,Event)
	Unit:RemoveEvents()
	local crystal = Unit:GetCreatureNearestCoords(X, Y, Z, 24722)
	Unit:SetCombatMeleeCapable(1)
	Unit:FullCastSpellOnTarget(44294, crystal)
	Unit:CastSpell(8358)
end

function SelinFireheart_Crystal5(Unit,Event)
	Unit:RemoveEvents()
	local crystal = Unit:GetCreatureNearestCoords(X, Y, Z, 24722)
	Unit:SetCombatMeleeCapable(1)
	Unit:FullCastSpellOnTarget(44294, crystal)
	Unit:CastSpell(8358)
end

function SelinFireheart_OnLeaveCombat(Unit, Event)
    Unit:RemoveEvents()
end

function SelinFireheart_OnDied(Unit,Event)
    Unit:RemoveEvents()
end

function SelinFireheart_OnKill(Unit, Event)
    Unit:RemoveEvents()
end

RegisterUnitEvent(24723, 1, "SelinFireheart_OnEnterCombat")
RegisterUnitEvent(24723, 2, "SelinFireheart_OnLeaveCombat")
RegisterUnitEvent(24723, 3, "SelinFireheart_OnKill")
RegisterUnitEvent(24723, 4, "SelinFireheart_OnDied")
RegisterUnitEvent(24723, 18, "SelinFireheart_OnSpawn")

function SunbladeSisterofTorment_OnCombat(Unit, Event)
	Unit:RegisterEvent("SunbladeSisterofTorment_DeadlyEmbrace", 10000, 0)
	Unit:RegisterEvent("SunbladeSisterofTorment_LashofPain", 7000, 0) 
end

--Deadly Embrace
function SunbladeSisterofTorment_DeadlyEmbrace(Unit, Event)
	if(Unit:GetRandomPlayer(1)) then
		Unit:FullCastSpellOnTarget(44547, Unit:GetRandomPlayer(1))
	end
end

--Lash of Pain
function SunbladeSisterofTorment_LashofPain(Unit, Event)
	local Flip = math.random(1,2)
	if((Flip == 1) and (Unit:GetClosestPlayer())) then
		Unit:CastSpellOnTarget(44640, Unit:GetClosestPlayer())
	else
	end
end

function SunbladeSisterofTorment_LeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function SunbladeSisterofTorment_Died(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(24697, 1, "SunbladeSisterofTorment_OnCombat")
RegisterUnitEvent(24697, 2, "SunbladeSisterofTorment_LeaveCombat")
RegisterUnitEvent(24697, 4, "SunbladeSisterofTorment_Died")

function SunbladeBloodKnight_OnCombat(Unit, Event)
	Unit:RegisterAIUpdateEvent(10000)
end

function SunbladeBloodKnight_HolyLight(Unit, Event)
	Unit:FullCastSpell(27136)
end

function SunbladeBloodKnight_LeaveCombat(Unit, Event)
	Unit:RemoveAIUpdateEvent()
end

function SunbladeBloodKnight_Died(Unit, Event)
	Unit:RemoveAIUpdateEvent()
end

RegisterUnitEvent(27136, 1, "SunbladeBloodKnight_OnCombat")
RegisterUnitEvent(27136, 21, "SunbladeBloodKnight_HolyLight")
RegisterUnitEvent(27136, 2, "SunbladeBloodKnight_LeaveCombat")
RegisterUnitEvent(27136, 4, "SunbladeBloodKnight_Died")

function SunbladeKeeper_OnCombat(Unit, Event)
	Unit:RegisterAIUpdateEvent(6000)
end

function SunbladeKeeper_ShadowBolt(Unit, Event)
	if(Unit:GetRandomPlayer(7)) then
		Unit:FullCastSpellOnTarget(15232, Unit:GetRandomPlayer(7))
	end
end

function SunbladeKeeper_LeaveCombat(Unit, Event)
	Unit:RegisterAIUpdateEvent()
end

function SunbladeKeeper_Died(Unit, Event)
	Unit:RegisterAIUpdateEvent()
end

RegisterUnitEvent(24762, 1, "SunbladeKeeper_OnCombat")
RegisterUnitEvent(24762, 21, "SunbladeKeeper_ShadowBolt")
RegisterUnitEvent(24762, 2, "SunbladeKeeper_LeaveCombat")
RegisterUnitEvent(24762, 4, "SunbladeKeeper_Died")

function SunbladeMageGuard_OnCombat(Unit, Event)
	Unit:RegisterAIUpdateEvent(7000)
end

function SunbladeMageGuard_GlaiveThrow(Unit)
	local FlipGlaive = math.random(1, 2)
	if((FlipGlaive == 1) and (Unit:GetRandomPlayer(7))) then
		Unit:CastSpellOnTarget(44478, Unit:GetRandomPlayer(7))
	else
		Unit:CastSpellOnTarget(46028, Unit:GetRandomPlayer(7))
	end
end

function SunbladeMageGuard_LeaveCombat(Unit, Event)
	Unit:RemoveAIUpdateEvent()
end

function SunbladeMageGuard_Died(Unit, Event)
	Unit:RemoveAIUpdateEvent()
end

RegisterUnitEvent(24683, 1, "SunbladeMageGuard_OnCombat")
RegisterUnitEvent(24683, 21, "SunbladeMageGuard_GlaiveThrow")
RegisterUnitEvent(24683, 2, "SunbladeMageGuard_LeaveCombat")
RegisterUnitEvent(24683, 4, "SunbladeMageGuard_Died")

function SunbladeMagister_OnCombat(Unit, Event)
	Unit:RegisterAIUpdateEvent(3000)
end

function SunbladeMagister_Frostbolt(Unit, Event)
local plr = Unit:GetRandomPlayer(1)
	if(plr) then
		Unit:FullCastSpellOnTarget(46035, plr)
	end
end

function SunbladeMagister_ArcaneNova(Unit)
	local arcaneflip = math.random(6)
	local plr = Unit:GetRandomPlayer(7)
	if((arcaneflip == 1) and (plr ~= nil)) then
		Unit:FullCastSpellOnTarget(46036, plr)
	else
	end
end

function SunbladeMagister_OnLeaveCombat(Unit)
	Unit:RemoveEvents()
	Unit:RemoveAIUpdateEvent()
end

function SunbladeMagister_OnDied(Unit)
	Unit:RemoveEvents()
	Unit:RemoveAIUpdateEvent()
end

RegisterUnitEvent(24685, 1, "SunbladeMagister_OnCombat")
RegisterUnitEvent(24685, 21,"SunbladeMagister_Frostbolt")
RegisterUnitEvent(24685, 21,"SunbladeMagister_ArcaneNova")
RegisterUnitEvent(24685, 2, "SunbladeMagister_OnLeaveCombat")
RegisterUnitEvent(24685, 4, "SunbladeMagister_OnDied")

function SunbladeWarlock_OnCombat(Unit, Event)
	Unit:CastSpell(44517)
	Unit:RegisterEvent("SunbladeWarlock_Incinerate", 5000, 0)
	Unit:RegisterEvent("SunbladeWarlock_Immolate", 3500, 0)
end

function SunbladeWarlock_Incinerate(Unit, Event)
	Unit:FullCastSpellOnTarget(46043, Unit:GetClosestPlayer())
end

function SunbladeWarlock_Immolate(Unit, Event)
	local Flip = math.random(3)
	if((Flip == 1) and (Unit:GetMainTank())) then
		Unit:FullCastSpellOnTarget(46042, Unit:GetMainTank())
	end
end

function SunbladeWarlock_LeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function SunbladeWarlock_Died(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(24686, 1, "SunbladeWarlock_OnCombat")
RegisterUnitEvent(24686, 2, "SunbladeWarlock_LeaveCombat")
RegisterUnitEvent(24686, 4, "SunbladeWarlock_Died")

--SunBlade Magister
function SunbMag_OnCombat(Unit, Event)
  	Unit:RegisterEvent("SunbMag_AN", 15000, 1)
  	Unit:RegisterEvent("SunbMag_FrB", 3000, 29)
end

function SunbMag_FrB(pUnit, Event)
   pUnit:FullCastSpellOnTarget(46035, pUnit:GetRandomPlayer(0))
end

function SunbMag_AN(pUnit, Event)
   pUnit:FullCastSpell(46036)
end

function SunbMag_LeaveCombat(Unit, Event)
  	Unit:RemoveEvents()
end

function SunbMag_Died(Unit, Event)
  	Unit:RemoveEvents()
end

RegisterUnitEvent(24685, 1, "SunbMag_OnCombat")
RegisterUnitEvent(24685, 2, "SunbMag_LeaveCombat")
RegisterUnitEvent(24685, 4, "SunbMag_Died")

--Sunblade Warlock
function SunbWarlock_OnCombat(Unit, Event)
  	Unit:CastSpell(44517)
  	Unit:RegisterEvent("SunbWarlock_Incinerate", 8000, 0)
  	Unit:RegisterEvent("SunbWarlock_Immolate", 5600, 0)
end

function SunbWarlock_Incinerate(pUnit, Event)
   pUnit:FullCastSpellOnTarget(46043, pUnit:GetClosestPlayer())
end

function SunbWarlock_Immolate(pUnit, Event)
   pUnit:FullCastSpellOnTarget(46042, pUnit:GetClosestTank())
end

function SunbWarlock_LeaveCombat(Unit, Event)
  	Unit:RemoveEvents()
end

function SunbWarlock_Died(Unit, Event)
  	Unit:RemoveEvents()
end

RegisterUnitEvent(24686, 1, "SunbWarlock_OnCombat")
RegisterUnitEvent(24686, 2, "SunbWarlock_LeaveCombat")
RegisterUnitEvent(24686, 4, "SunbWarlock_Died")

--Sunblade Keeper
function SunbKpr_OnCombat(Unit, Event)
  	Unit:RegisterEvent("SunbKpr_Sb", 8000, 0)
end

function SunbKpr_Sb(pUnit, Event)
   pUnit:FullCastSpellOnTarget(15232, pUnit:GetRandomPlayer(0))
end

function SunbKpr_LeaveCombat(Unit, Event)
  	Unit:RemoveEvents()
end

function SunbKpr_Died(Unit, Event)
  	Unit:RemoveEvents()
end

RegisterUnitEvent(24762, 1, "SunbKpr_OnCombat")
RegisterUnitEvent(24762, 2, "SunbKpr_LeaveCombat")
RegisterUnitEvent(24762, 4, "SunbKpr_Died")

--Sister of Torment
function SoTorment_OnCombat(Unit, Event)
  	Unit:RegisterEvent("SoTorment_DdE", 6500, 0)
  	Unit:RegisterEvent("SoTorment_LoP",9000, 0)
end

function SoTorment_DdE(pUnit, Event)
   pUnit:FullCastSpellOnTarget(44547, pUnit:GetClosestPlayer())
end

function SoTorment_LoP(pUnit, Event)
   pUnit:CastSpellOnTarget(44640, pUnit:GetClosestPlayer())
end

function SoTorment_LeaveCombat(Unit, Event)
  	Unit:RemoveEvents()
end

function SoTorment_Died(Unit, Event)
  	Unit:RemoveEvents()
end

RegisterUnitEvent(24697, 1, "SoTorment_OnCombat")
RegisterUnitEvent(24697, 2, "SoTorment_LeaveCombat")
RegisterUnitEvent(24697, 4, "SoTorment_Died")

--Sunblade BloodKnight
function SunbBK_OnCombat(Unit, Event)
  	Unit:RegisterEvent("SunbBK_HL", 8000, 35)
end

function SunbBK_HL(Unit, Event)
  	Unit:FullCastSpell(27136)
end

function SunbBK_LeaveCombat(Unit, Event)
  	Unit:RemoveEvents()
end

function SunbBK_Died(Unit, Event)
  	Unit:RemoveEvents()
end

RegisterUnitEvent(27136, 1, "SunbBK_OnCombat")
RegisterUnitEvent(27136, 2, "SunbBK_LeaveCombat")
RegisterUnitEvent(27136, 4, "SunbBK_Died")

--Sunblade MageGuard
function SunbladeMageGuard_OnCombat(Unit, Event)
  	Unit:RegisterEvent("SunbMg_Gt", 8500, 0)
end

function SunbMg_Gt(pUnit, Event)
   local FlipGt = math.random(1, 2)
   if(FlipGt == 1) then
		pUnit:CastSpellOnTarget(44478, pUnit:GetRandomPlayer(7))
   else
		pUnit:CastSpellOnTarget(46028, pUnit:GetRandomPlayer(7))
   end
end

function SunbladeMageGuard_LeaveCombat(Unit, Event)
  	Unit:RemoveEvents()
end

function SunbladeMageGuard_Died(Unit, Event)
  	Unit:RemoveEvents()
end

RegisterUnitEvent(24683, 1, "SunbladeMageGuard_OnCombat")
RegisterUnitEvent(24683, 2, "SunbladeMageGuard_LeaveCombat")
RegisterUnitEvent(24683, 4, "SunbladeMageGuard_Died")

--Ethereum Smuggler
function Ethsm_OnCombat(Unit, Event)
  	Unit:RegisterEvent("Ethsm_Arc", 9500, 10)
end

function Ethsm_Arc(pUnit, Event)
   pUnit:FullCastSpell(44538)
end

function Ethsm_LeaveCombat(Unit, Event)
  	Unit:RemoveEvents()
end

function Ethsm_Died(Unit, Event)
  	Unit:RemoveEvents()
end

RegisterUnitEvent(24698, 1, "Ethsm_OnCombat")
RegisterUnitEvent(24698, 2, "Ethsm_LeaveCombat")
RegisterUnitEvent(24698, 4, "Ethsm_Died")

--Fizzle
function Fizzle_OnCombat(Unit, Event)
  	Unit:RegisterEvent("Fizzle_Fireball", 5000, 0)
end

function Fizzle_Fireball(pUnit, Event)
   pUnit:FullCastSpellOnTarget(44164, pUnit:GetRandomPlayer(0))
end

function Fizzle_LeaveCombat(Unit, Event)
  	Unit:RemoveEvents()
end

function Fizzle_Died(Unit, Event)
  	Unit:RemoveEvents()
end

RegisterUnitEvent(24656, 1, "Fizzle_OnCombat")
RegisterUnitEvent(24656, 2, "Fizzle_LeaveCombat")
RegisterUnitEvent(24656, 4, "Fizzle_Died")

--Sunblade Imp
function SunbImp_OnCombat(Unit, Event)
  	Unit:RegisterEvent("SunbImp_Fireball", 7500, 0)
end

function SunbImp_Fireball(pUnit, Event)
   local flipfire = math.random(1, 2)
   if(flipfire == 1) then
		pUnit:FullCastSpellOnTarget(44577, pUnit:GetRandomPlayer(0))
   else
		pUnit:FullCastSpellOnTarget(46044, pUnit:GetRandomPlayer(0))
   end
end

function SunbImp_LeaveCombat(Unit, Event)
  	Unit:RemoveEvents()
end

function SunbImp_Died(Unit, Event)
  	Unit:RemoveEvents()
end

RegisterUnitEvent(24815, 1, "SunbImp_OnCombat")
RegisterUnitEvent(24815, 2, "SunbImp_LeaveCombat")
RegisterUnitEvent(24815, 4, "SunbImp_Died")

--Sunblade Physician
--It could be that they need core / db support tho xD
function SunbPh_OnCombat(Unit, Event)
  	Unit:RegisterEvent("SunbPh_Poision", 8500, 40)
end

function SunbPh_Poision(Unit, Event)
   local FlipPh = math.random(1, 2)
   if(FlipPh == 1) then
     	Unit:FullCastSpell(46046)
   else
     	Unit:FullCastSpell(44599)
   end
end

function SunbPh_LeaveCombat(Unit, Event)
  	Unit:RemoveEvents()
end

function SunbPh_Died(Unit, Event)
  	Unit:RemoveEvents()
end

RegisterUnitEvent(24687, 1, "SunbPh_OnCombat")
RegisterUnitEvent(24687, 2, "SunbPh_LeaveCombat")
RegisterUnitEvent(24687, 4, "SunbPh_Died")

--Wretched Bruiser
function WretchedBruiser_OnCombat(Unit, Event)
  	Unit:RegisterEvent("WretchedBruiser_Potion", 1000, 1)
  	Unit:RegisterEvent("WretchedBruiser_Strike", 6800, 0)
end

function WretchedBruiser_Potion(Unit, Event)
   if(Unit:GetHealthPct() < 15) then
     	Unit:FullCastSpell(44505)
   end
end

function WretchedBruiser_Strike(pUnit, Event)
   pUnit:FullCastSpellOnTarget(44534, pUnit:GetClosestPlayer())
end

function WretchedBruiser_LeaveCombat(Unit, Event)
  	Unit:RemoveEvents()
end

function WretchedBruiser_Died(Unit, Event)
  	Unit:RemoveEvents()
end

RegisterUnitEvent(24689, 1, "WretchedBruiser_OnCombat")
RegisterUnitEvent(24689, 2, "WretchedBruiser_LeaveCombat")
RegisterUnitEvent(24689, 4, "WretchedBruiser_Died")


--Wretched Husk
function WretchedHesk_OnCombat(Unit, Event)
  	Unit:RegisterEvent("WretchedHesk_Potion", 1000, 1)
  	Unit:RegisterEvent("WretchedHesk_Ball", 4000, 0)
end

function WretchedHesk_Potion(Unit, Event)
   if(Unit:GetHealthPct() < 15) then
     	Unit:FullCastSpell(44505)
   end
end

function WretchedHesk_Hesk(pUnit, Event)
   local Flipball = math.random(1, 2)
   if(Flipball == 1) then
		pUnit:FullCastSpellOnTarget(44503, pUnit:GetRandomPlayer())
   else
		pUnit:FullCastSpellOnTarget(44504, pUnit:GetRandomPlayer())
   end
end

function WretchedHesk_LeaveCombat(Unit, Event)
  	Unit:RemoveEvents()
end

function WretchedHesk_Died(Unit, Event)
  	Unit:RemoveEvents()
end

RegisterUnitEvent(24690, 1, "WretchedHesk_OnCombat")
RegisterUnitEvent(24690, 2, "WretchedHesk_LeaveCombat")
RegisterUnitEvent(24690, 4, "WretchedHesk_Died")


--Wretched Skulker
function WretchedSkulker_OnCombat(Unit, Event)
  	Unit:RegisterEvent("WretchedSkulker_Potion", 1000, 1)
  	Unit:RegisterEvent("WretchedSkulker_Strike", 6800, 0)
end

function WretchedSkulker_Potion(Unit, Event)
   if(Unit:GetHealthPct() < 15) then
     	Unit:FullCastSpell(44505)
   end
end

function WretchedSkulker_Strike(pUnit, Event)
   pUnit:FullCastSpellOnTarget(44533, pUnit:GetClosestPlayer())
end

function WretchedSkulker_LeaveCombat(Unit, Event)
  	Unit:RemoveEvents()
end

function WretchedSkulker_Died(Unit, Event)
  	Unit:RemoveEvents()
end

RegisterUnitEvent(24688, 1, "WretchedSkulker_OnCombat")
RegisterUnitEvent(24688, 2, "WretchedSkulker_LeaveCombat")
RegisterUnitEvent(24688, 4, "WretchedSkulker_Died")

function Vex_OnEnterCombat(pUnit, Event)
	pUnit:RegisterEvent("Vex_Arcane", 34000, 0)
	pUnit:RegisterEvent("Vex_Spell", 7000, 0)
	pUnit:RegisterEvent("Vex_Adds", 1000, 0)
	pUnit:RegisterEvent("Vex_CastOverload", 1000, 0)
	pUnit:SendChatMessage(14, 0, "Drain... life!")
	pUnit:PlaySoundToSet(12389)
end

function Vex_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Vex_OnKill(pUnit,Event)
	pUnit:SendChatMessage(14, 0, "Con...sume.")
	pUnit:PlaySoundToSet(12393)
end

function Vex_OnDied(pUnit, Event)
	pUnit:RemoveEvents()
end

function Vex_Spell(pUnit, Event)
	pUnit:FullCastSpellOnTarget(44318, pUnit:GetClosestPlayer())
end

function Vex_Arcane(pUnit, Event)
	pUnit:FullCastSpellOnTarget(44319, pUnit:GetClosestPlayer())
	pUnit:SendChatMessage(14, 0, "Un...con...tainable.")
	pUnit:PlaySoundToSet(12392)
end

function Vex_CastOverload(pUnit,Event)
	if(pUnit:GetHealthPct() == 10) then
		pUnit:RegisterEvent("Vex_Overload", math.random(2000, 3000), 0)
	end
end

function Vex_Overload(pUnit, Event)
	pUnit:FullCastSpellOnTarget(44353, pUnit:GetClosestPlayer())
	pUnit:SendChatMessage(14, 0, "Un...leash.")
	pUnit:PlaySoundToSet(12390)
end

function Vex_Adds(pUnit,Event)
	if(pUnit:GetHealthPct() == 85) then
		pUnit:SpawnCreature(24745, 231, -207, 6, 0, 16, 60000)
		pUnit:RegisterEvent("Vex_Adds70", 000, 1)
	end
end

function Vex_Adds70(pUnit,Event)
	if(pUnit:GetHealthPct() == 70) then
		pUnit:SpawnCreature(24745, 231, -207, 6, 0, 16, 60000)
		pUnit:RegisterEvent("Vex_Adds55", 000, 1)
	end
end

function Vex_Adds55(pUnit,Event)
if(pUnit:GetHealthPct() == 55) then
	pUnit:SpawnCreature(24745, 231, -207, 6, 0, 16, 60000)
	pUnit:RegisterEvent("Vex_Adds40", 000, 1)
end
end

function Vex_Adds40(pUnit,Event)
	if(pUnit:GetHealthPct() == 40) then
		pUnit:SpawnCreature(24745, 231, -207, 6, 0, 16, 60000)
		pUnit:RegisterEvent("Vex_Adds25", 000, 1)
	end
end

function Vex_Adds25(pUnit,Event)
	if(pUnit:GetHealthPct() == 25) then
		pUnit:SpawnCreature(24745, 231, -207, 6, 0, 16, 60000)
	end
end

RegisterUnitEvent(24744, 1, "Vex_OnEnterCombat")
RegisterUnitEvent(24744, 2, "Vex_OnLeaveCombat")
RegisterUnitEvent(24744, 3, "Vex_OnKill")
RegisterUnitEvent(24744, 4, "Vex_OnDied")

function PureEnergy_OnEnterCombat(pUnit,Event)
	pUnit:RegisterEvent("VexAdds_Spell", 26000, 0)
end

function PureEnergy_Spell(pUnit,Event)
	pUnit:FullCastSpellOnTarget(44342, pUnit:GetClosestPlayer())
end

function PureEnergy_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
	pUnit:FullCastSpellOnTarget(44335, pUnit:GetClosestPlayer())
end

RegisterUnitEvent(24745, 1, "PureEnergy_OnEnterCombat")
RegisterUnitEvent(24745, 4, "PureEnergy_OnDied")