--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

phase = 0

function PhaseCheck(Unit, event, miscUnit, misc)
	if ((Unit:GetHealthPct() <= 60) and (phase == 0)) then
		phase = 1
		UnitRegisterEvent("GuardianKidlic_Phase1", 3000, 1)
	elseif ((Unit:GetHealthPct() <= 40) and (phase == 1)) then
		phase = 2
		Unit:RegisterEvent("GuardianKidlic_Phase2", 3000, 1)
	end
end

-- phase 1

function GuardianKidlic_MortalWound(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(28467, GetMainTank())
end

function GuardianKidlic_EnragingStrike(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(37974, GetClosestPlayer())
end

function GuardianKidlic_Phase1(Unit, event, miscUnit, misc)
	Unit:RemoveEvents()
	Unit:SendChatMessage(12, 0, "You wont succeed!")
	Unit:RegisterEvent("PhaseCheck", 3000, 0)
	Unit:RegisterEvent("GuardianKidlic_MortalWound", 8000, 0)
	Unit:RegisterEvent("GuardianKidlic_EnragingStrike", 5000, 0)
end

-- phase 2
function GuardianKidlic_MightyBlow(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(43673, GetClosestPlayer())
	Unit:ClearThreadList()
end

function GuardianKidlic_Phase2(Unit, event, miscUnit, misc)
	Unit:RemoveEvents()
	Unit:SendChatMessage(12, 0, "Lord! Give me strengh!")
	Unit:RegisterEvent("GuardianKidlic_MortalWound", 8000, 0)
	Unit:RegisterEvent("GuardianKidlic_EnragingStrike", 5000, 0)
	Unit:RegisterEvent("GuardianKidlic_MightyBlow", 10000, 0)
end

function GuardianKidlic_OnEnterCombat(Unit, event, miscUnit, misc)
	Unit:SendChatMessage(12, 0, "I will crush you!")
	Unit:RegisterEvent("PhaseCheck", 3000, 0)
end

function GuardianKidlic_OnWipe(Unit, event, miscUnit, misc)
	Unit:RemoveEvents()
	Unit:SendChatMessage(12, 0, "As i said...")
end

function GuardianKidlic_Kill(Unit, event, miscUnit, misc)
	Unit:RemoveEvents()
	Unit:SendChatMessage(12, 0, "Noooooo!")
end

RegisterUnitEvent(230070, 4, "GuardianKidlic_Kill")
RegisterUnitEvent(230070, 2, "GuardianKidlic_OnWipe")
RegisterUnitEvent(230070, 1, "GuardianKidlic_OnEnterCombat")

local check = 0

function Lai_OnEnterCombat(pUnit, Event)
    pUnit:RegisterEvent("Lai_ShadowBolt", 18000, 0)
    pUnit:RegisterEvent("Lai_Nethervapor", 13000, 0)
    pUnit:RegisterEvent("Lai_Fear", 9000, 0)
    pUnit:RegisterEvent("Lai_Nova", 23000, 0)
    pUnit:RegisterEvent("Lai_EventSummon", 1500, 1)
    if(check == 0) then
		pUnit:RegisterEvent("Lai_EventPhase2Check", 1500,0)
    else
    end
end

function Lai_ShadowBolt(pUnit, Event)
    if(pUnit:GetRandomPlayer(0)) then
		pUnit:FullCastSpellOnTarget(29317, pUnit:GetRandomPlayer(0))
    else
    end
end

function Lai_Nethervapor(pUnit, Event)
    if(pUnit:GetMainTank()) then
		pUnit:SendChatMessage(12, 0, "You may not pass!")
		pUnit:FullCastSpellOnTarget(35859, pUnit:GetMainTank())
    else
    end
end

function Lai_Fear(pUnit, event, miscunit)
    pUnit:SendChatMessage(12, 0, "Cower in fear!")
    pUnit:FullCastSpell(33547)
end

function Lai_Nova(pUnit, Event)
    pUnit:SendChatMessage(12, 0, "The Masters fire rages inside of me!")
    pUnit:FullCastSpell(40737)
end

function Lai_EventSummon(pUnit, Event)
    pUnit:SpawnCreature(22990, pUnit:GetRandomPlayer(0):GetX()+15, pUnit:GetRandomPlayer(0):GetY(), pUnit:GetRandomPlayer(0):GetZ(), 90, 1836, 0)
end

function Lai_EventPhase2(pUnit, Event)
    pUnit:SendChatMessage(12, 0, "Im really angry now...")
    pUnit:SpawnCreature(21961, pUnit:GetX()+15, pUnit:GetY(), pUnit:GetZ(), 90, 14, 0)
end

function Lai_EventPhase2Check(pUnit, Event)
    if(pUnit:GetHealthPct() < 50) then
        if(check == 0) then
            check=1
            pUnit:RegisterEvent("Lai_EventPhase2",1500, 1)
        else
        end
    else
    end
end

function LaiHlp_OnEnterCombat(pUnit, Event)
    pUnit:SendChatMessage(12, 0, "Master!! I'll assist you!")
    pUnit:RegisterEvent("LaiHlp_Infuse", 30000, 0)
    pUnit:RegisterEvent("LaiHlp_Heal", 10000, 0)
end

function LaiHlp_Infuse(pUnit, Event)
    pUnit:FullCastSpellOnTarget(40594, pUnit:GetRandomFriend())
end

function LaiHlp_Heal(pUnit, Event)
    pUnit:FullCastSpellOnTarget(23954, pUnit:GetRandomFriend())
end

function Lai_OnWipe(pUnit, Event)
    pUnit:SendChatMessage(12, 0, "You lost...!")
    pUnit:RemoveEvents()
end

function Lai_Dies(pUnit, Event)
    pUnit:SendChatMessage(12, 0, "You weren't prepared! I thought...")
    pUnit:FullCastSpell(29949)
    pUnit:RemoveEvents()
end

function Spawns_OnLeaveCombat(pUnit, Event)
    pUnit:Despawn(1000,0)
end

RegisterUnitEvent(22990, 2, "Spawns_OnLeaveCombat")
RegisterUnitEvent(23174, 2, "Spawns_OnLeaveCombat")
RegisterUnitEvent(230040, 1, "Lai_OnEnterCombat")
RegisterUnitEvent(230040, 2, "Lai_OnWipe")
RegisterUnitEvent(230040, 4, "Lai_Dies")

function Malacree_Shoot(pUnit, Event)
	if(pUnit:GetRandomPlayer(0)) then
		pUnit:FullCastSpellOnTarget(39079, pUnit:GetRandomPlayer(0))
	else
	end
end

function Malacree_MultiShot(pUnit, Event)
local r = math.random(1,2)
	if(r == 1) then
		pUnit:SendChatMessage(12, 0, "Straight to the heart!")
		pUnit:PlaySoundToSet(11536)
	elseif(r == 2) then
		pUnit:SendChatMessage(12, 0, "Seek your mark!")
		pUnit:PlaySoundToSet(11537)
	end
	if(pUnit:GetRandomPlayer(0)) then
		pUnit:FullCastSpellOnTarget(38310, pUnit:GetRandomPlayer(0))
	end
end

function Malacree_ShockBurst(pUnit, Event)
	if(pUnit:GetMainTank()) then
		pUnit:FullCastSpellOnTarget(38509, pUnit:GetMainTank())
	end
end

function Malacree_Entangle(pUnit, Event)
	if(pUnit:GetRandomPlayer(2)) then
		pUnit:FullCastSpellOnTarget(38316, pUnit:GetRandomPlayer(2))
	end
end

function Malacree_StaticCharge(pUnit, Event)
	if(pUnit:GetRandomPlayer()) then
		pUnit:FullCastSpellOnTarget(38280, pUnit:GetRandomPlayer())    	
	end
end

function Malacree_ForkedLightning(pUnit, Event)
	pUnit:SendChatMessage(12, 0, "Victory to Lord Illidan!")
	pUnit:PlaySoundToSet(11533)
	if(pUnit:GetRandomPlayer(1)) then
		pUnit:FullCastSpellOnTarget(40088, pUnit:GetRandomPlayer(1))
	end
end

function Malacree_SummonElementals(pUnit, Event)
	pUnit:SpawnCreature(22009, pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), 90, 14, 0)
end

function Malacree_EliteAdds(pUnit, Event)
	pUnit:SpawnCreature(22055, pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), 90, 14, 0)
end

function Malacree_Striders(pUnit, Event)
	pUnit:SpawnCreature(22056, pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), 90, 14, 0)
end

function Malacree_Phase1(pUnit, Event)
	pUnit:SendChatMessage(12, 0, "I did not wish to lower myself by engaging your kind, but you leave me little choice!")
	pUnit:PlaySoundToSet(11538)
	pUnit:RegisterEvent("Malacree_Shoot", 10000, 0)
	pUnit:RegisterEvent("Malacree_MultiShot", 30000, 0)
	pUnit:RegisterEvent("Malacree_StaticCharge", 20000, 0)
	pUnit:RegisterEvent("Malacree_ShockBurst", 25000, 0)       
--placeholder
end

function Malacree_Phase2(pUnit, Event)
	if(pUnit:GetHealthPct() <= 70) then
		pUnit:SendChatMessage(12, 0, "The time is now! Leave none standing!")
		pUnit:PlaySoundToSet(11539)
		pUnit:RemoveEvents()
		pUnit:RegisterEvent("Malacree_EliteAdds", 50000, 0)
		pUnit:RegisterEvent("Malacree_Striders", 60000, 0)
		pUnit:RegisterEvent("Malacree_SummonElementals", 120000, 0)   	
		pUnit:RegisterEvent("LadyVashj_Shoot", 10000, 0)    	
		pUnit:RegisterEvent("LadyVashj_MultiShot", 30000, 0)
	end
end

function Malacree_Phase3(pUnit, Event)
	if(pUnit:GetHealthPct() <= 50) then
		pUnit:SendChatMessage(12, 0, "You may want to take cover")
		pUnit:PlaySoundToSet(11540)
		pUnit:RemoveEvents()
		pUnit:RegisterEvent("Malacree_Shoot", 10000, 0)
		pUnit:RegisterEvent("Malacree_MultiShot", 30000)
		pUnit:RegisterEvent("Malacree_StaticCharge", 20000, 0)
		pUnit:RegisterEvent("Malacree_ShockBurst", 25000, 0)
		pUnit:RegisterEvent("LadyVashj_SporeBats", 0000, 0) 			
	end
end

function Malacree_OnEnterCombat(pUnit, Event)
local say = math.random(1,4)
	if(say == 1) then
		pUnit:SendChatMessage(12, 0, "I'll split you from stem to stern!")
		pUnit:PlaySoundToSet(11532)
	elseif(say == 2) then
		pUnit:SendChatMessage(12, 0, "Victory to Lord Illidan!")
		pUnit:PlaySoundToSet(11533)
	elseif(say == 3) then
		pUnit:SendChatMessage(12, 0, "I spit on you, surface filth!")
		pUnit:PlaySoundToSet(11534)
	elseif(say == 4) then
		pUnit:SendChatMessage(12, 0, "Death to the outsiders!")
		pUnit:PlaySoundToSet(11535)
	end
	pUnit:RegisterEvent("Malacree_Phase1", 1000, 1)				
	pUnit:RegisterEvent("Malacree_Phase2", 1000, 0)
	pUnit:RegisterEvent("Malacree_Phase3", 1000, 0)
end

function Malacree_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Malacree_OnKill(pUnit, Event)
	pUnit:SendChatMessage(12, 0, "Lord Illidan, I... I am... sorry.")
	pUnit:PlaySoundToSet(11544)
	pUnit:RemoveEvents()
end

function Add_Despawn(pUnit, Event)
	pUnit:Despawn(1000, 0)
end

function Malacree_OnPlayerKill(pUnit, Event)
local msg = math.random(1,2)
	if(msg == 1) then
		pUnit:SendChatMessage(12, 0, "Your time ends now!")
		pUnit:PlaySoundToSet(11541)
	elseif(msg == 2) then
		pUnit:SendChatMessage(12, 0, "You have failed!")
		pUnit:PlaySoundToSet(11542)
	end
end

function Malacree_OnEnterRange(pUnit, Event)
	pUnit:SendChatMessage(12, 0, "Water is life. It has become a rare commodity here in Outland. A commodity that we alone shall control. We are the Highborne, and the time has come at last for us to retake our rightful place in the world!")
	pUnit:PlaySoundToSet(11531)
end

RegisterUnitEvent(22055, 4, "Add_Despawn")
RegisterUnitEvent(22056, 4, "Add_Despawn")
RegisterUnitEvent(22009, 4, "Add_Despawn")
RegisterUnitEvent(230050, 4, "Malacree_OnKill")
RegisterUnitEvent(230050, 3, "Malacree_OnPlayerKill")
RegisterUnitEvent(230050, 10, "Malacree_OnEnterRange")
RegisterUnitEvent(230050, 1, "Malacree_OnEnterCombat")
RegisterUnitEvent(230050, 2, "Malacree_OnLeaveCombat")

-- Karabor Sewers
function AqueousSpawn_Nova(Unit, event, miscUnit, misc)
	Unit:FullCastSpell(40103)
end

function AqueousSpawn_Heal(Unit, event, miscUnit, misc)
	local heal = math.random(1,10)
	if(heal == 5) then
		if(Unit:GetRandomFriend()) then
			Unit:FullCastSpellOnTarget(38588, plr)
		end
	end
end

function AqueousSpawn_OnCombat(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("AqueousSpawn_Nova", 20000, 0)
	Unit:RegisterEvent("AqueousSpawn_Heal", 15000, 0)
end

RegisterUnitEvent(230024, 1, "AqueousSpawn_OnCombat")

function CoilskarSeaCaller_Hurricane(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(40090, Unit:GetRandomPlayer(0))
end

function CoilskarSeaCaller_ForkedLightning(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(40088, Unit:GetRandomPlayer(0))
end

function CoilskarSeaCaller_Combat(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("CoilskarSeaCaller_Hurricane", 18000, 0)
	Unit:RegisterEvent("CoilskarSeaCaller_ForkedLightning", 10000, 0)
end

RegisterUnitEvent(230001, 1, "CoilskarSeaCaller_Combat")

function CoilskarWrangler_LightningProd(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(40066, Unit:GetRandomPlayer(0))
end

function CoilskarWrangler_Frenzy(Unit, event, miscUnit, misc)
local buff = math.random(1,5)
	if(buff == 2) then
		Unit:FullCastSpellOnTarget(27995, Unit:GetRandomFriend())
	end
end

function CoilskarWrangler_Combat(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("CoilskarWrangler_LightningProd", 10000, 0)
	Unit:RegisterEvent("CoilskarWrangler_Frenzy", 6000, 0)
end

RegisterUnitEvent(230025, 1, "CoilskarWrangler_Combat")

function Leviathan_TailSwipe(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(35333, Unit:GetClosestPlayer())
end

function Leviathan_PoisonSpit(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(40078, Unit:GetRandomPlayer(0))
end

function Leviathan_DebilitatingSpray(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(40079, Unit:GetRandomPlayer(0))
end

function Leviathan_Combat(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Leviathan_TailSwipe", 15000, 0)
	Unit:RegisterEvent("Leviathan_PoisonSpit", 9000, 0)
	Unit:RegisterEvent("Leviathan_DebilitatingSpray", 12000, 0)
end

RegisterUnitEvent(230026, 1, "Leviathan_Combat")

function AuqeousLord_Summon(Unit, event, miscUnit, misc)
	Unit:SpawnCreature(22883, Unit:GetX(), Unit:GetY(), Unit:GetZ(), Unit:GetO(), 14, 0)
	Unit:SpawnCreature(22883, Unit:GetX(), Unit:GetY(), Unit:GetZ(), Unit:GetO(), 14, 0)
end

function AqueousLord_VileSlime(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(40099, Unit:GetRandomPlayer(0))
end

function AqueousLord_Combat(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("AqueousLord_Summon", 1000, 1)
	Unit:RegisterEvent("AqueousLord_VileSlime", 8000, 0)
end

RegisterUnitEvent(230002, 1, "AqueousLord_Combat")

function CoilskarSoothsayer_HolyNova(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(38589, Unit:GetClosestPlayer())
end

function CoilskarSoothsayer_Combat(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("CoilskarSoothsayer_HolyNova", 7000, 0)
end

RegisterUnitEvent(230031, 1, "CoilskarSoothsayer_Combat")

function CoilskarHarpooner_Throw(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(40083, Unit:GetRandomPlayer(0))
end

function CoilskarHarpooner_HookedNet(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(40082, Unit:GetRandomPlayer(0))
end

function CoilskarHarpooner_Combat(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("CoilskarHarpooner_Throw", 6000, 0)
	Unit:RegisterEvent("CoilskarHarpooner_HookedNet", 8000, 0)
end

RegisterUnitEvent(230032, 1, "CoilskarHarpooner_Combat")

function DragonTurtle_WaterSpit(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(40086, Unit:GetClosestPlayer())
end

function DragonTurtle_Combat(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("DragonTurtle_WaterSpit", 9000, 0)
end
	
RegisterUnitEvent(230033, 1, "DragonTurtle_Combat")

--Sanctuary of Shadow
function AshtongueBattlelord_Cleave(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(31043, Unit:GetClosestPlayer())
end

function AshtongueBattlelord_ConcussiveThrow(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(41182, Unit:GetClosestPlayer())
end

function AshtongueBattlelord_ConcussionBlow(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(22427, Unit:GetClosestPlayer())
end

function AshtongueBattlelord_Combat(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("AshtongueBattlelord_Cleave", 9000, 0)
	Unit:RegisterEvent("AshtongueBattlelord_ConcussiveThrow", 6000, 0)
	Unit:RegisterEvent("AshtongueBattlelord_ConcussionBlow", 14000, 0)
end

RegisterUnitEvent(230011, 1, "AshtongueBattlelord_Combat")

function AshtongueFeralSpirit_Charge(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(38907, Unit:GetRandomPlayer(0))
	Unit:ClearThreadList()
end

function AshtongueFeralSpirit_Combat(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("AshtongueFeralSpirit_Charge", 10000, 0)
end

RegisterUnitEvent(230012, 1, "AshtongueFeralSpirit_Combat")

function AshtongueStormcaller_LightningShield(Unit, event, miscUnit, misc)
	Unit:FullCastSpell(39067)
end

function AshtongueStormcaller_LightningBolt(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(42024, Unit:GetRandomPlayer(0))
end

function AshtongueStormcaller_Combat(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("AshtongueStormcaller_LightningShield", 4000, 0)
	Unit:RegisterEvent("AshtongueStormcaller_LightningBolt", 8000, 0)
end

RegisterUnitEvent(230013, 1, "AshtongueStormcaller_Combat")

function AshtonguePrimalist_WingClip(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(39584, Unit:GetClosestPlayer())
end

function AshtonguePrimalist_Cyclone(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(39594, Unit:GetRandomPlayer(0))
end

function AshtonguePrimalist_Combat(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("AshtonguePrimalist_WingClip", 7000, 0)
	Unit:RegisterEvent("AshtonguePrimalist_Cyclone", 10000, 0)
end

RegisterUnitEvent(230014, 1, "AshtonguePrimalist_Combat")

function AshtongueMystic_Flameshock(Unit, event, miscUnit, misc)
	local DidIt = 0
	local flag = math.random(1, 2)
	if(flag == 1) and (DidIt == 0) then
		Unit:FullCastSpellOnTarget(39590, Unit:GetRandomPlayer(0))
		local DidIt = 1
	end
end

function AshtongueMystic_FrostShock(Unit, event, miscUnit, misc)
	if(flag == 2) and (DidIt == 1) then
		Unit:FullCastSpellOnTarget(41116, Unit:GetRandomPlayer(0))
	end
end

function AshtongueMystic_Bloodlust(Unit, event, miscUnit, misc)
	Unit:FullCastSpell(41185)
end

function AshtongueMystic_Cyclone(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(39594, Unit:GetRandomPlayer(0))
end

function AshtongueMystic_Combat(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("AshtongueMystic_Flameshock", 5000, 0)
	Unit:RegisterEvent("AshtongueMystic_FrostShock", 5000, 0)
	Unit:RegisterEvent("AshtongueMystic_Bloodlust", 30000, 0)
	Unit:RegisterEvent("AshtongueMystic_Cyclone", 10000, 0)
end

RegisterUnitEvent(230015, 1, "AshtongueMystic_Combat")

function IllidariDefiler_RainOfChaos(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(40946, Unit:GetRandomPlayer(0))
end

function IllidariDefiler_Banish(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(40370, Unit:GetRandomPlayer(0))
end

function IllidariDefiler_CurseOfAgony(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(39672, Unit:GetRandomPlayer(0))
end

function IllidariDefiler_Combat(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("IllidariDefiler_RainOfChaos", 10000, 0)
	Unit:RegisterEvent("IllidariDefiler_Banish", 15000, 0)
	Unit:RegisterEvent("IllidariDefiler_CurseOfAgony", 6000, 0)
end

RegisterUnitEvent(230016, 1, "IllidariDefiler_Combat")

function IllidariCenturion_Cleave(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(31043, Unit:GetClosestPlayer())
end

function IllidariCenturion_Combat(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("IllidariCenturion_Cleave", 5000, 0)
end

RegisterUnitEvent(230003, 1, "IllidariCenturion_Combat")

function IllidariBoneslicer_Gouge(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(28456, Unit:GetMainTank())
	Unit:ClearThreadList()
end

function IllidariBonesclicer_WoundPoison(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(39665, Unit:GetMainTank())
end

function IllidariBoneslicer_CloakOfShadows(Unit, event, miscUnit, misc)
	Unit:FullCastSpell(39666)
end

function IllidariBoneslicer_Blind(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(43433, Unit:GetRandomPlayer(0))
end

function IllidariBoneslicer_Combat(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("IllidariBoneslicer_Gouge", 10000, 0)
	Unit:RegisterEvent("IllidariBoneslicer_WoundPoison", 7000, 0)
	Unit:RegisterEvent("IllidariBoneslicer_CloakOfShadows", 13000, 0)
	Unit:RegisterEvent("IllidariBoneslicer_Blind", 9000, 0)
end

RegisterUnitEvent(230004, 1, "IllidariBoneslicer_Combat")

function IllidariHeartseeker_RapidShot(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(41172, Unit:GetRandomPlayer(0))
end

function IllidariHeartseeker_SonicShot(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(41084, Unit:GetRandomPlayer(0))
end

function IllidariHeartseeker_Combat(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("IllidariHeartseeker_RapidShot", 3000, 0)
	Unit:RegisterEvent("IllidariHeartseeker_SonicShot", 5000, 0)
end

RegisterUnitEvent(230005, 1, "IllidariHeartseeker_Combat")

function IllidariNightlord_Hellfire(Unit, event, miscUnit, misc)
	Unit:FullCastSpell(39132)
end

function IllidariNightlord_Fear(Unit, event, miscUnit, misc)
	Unit:FullCastSpell(33547)
end

function IllidariNightlord_Shadowfiends(Unit, event, miscUnit, misc)
	Unit:SpawnCreature(22929, Unit:GetX(), Unit:GetY(), Unit:GetZ(), Unit:GetO(), 14, 0)
	Unit:SpawnCreature(22929, Unit:GetX()+3, Unit:GetY()+3, Unit:GetZ(), Unit:GetO(), 14, 0)
	Unit:SpawnCreature(22929, Unit:GetX()+5, Unit:GetY(), Unit:GetZ(), Unit:GetO(), 14, 0)
	Unit:SpawnCreature(22929, Unit:GetX(), Unit:GetY()+5, Unit:GetZ(), Unit:GetO(), 14, 0)
	Unit:SpawnCreature(22929, Unit:GetX()+7, Unit:GetY(), Unit:GetZ(), Unit:GetO(), 14, 0)
	Unit:SpawnCreature(22929, Unit:GetX(), Unit:GetY()+7, Unit:GetZ(), Unit:GetO(), 14, 0)
	Unit:SpawnCreature(22929, Unit:GetX()+1, Unit:GetY(), Unit:GetZ(), Unit:GetO(), 14, 0)
	Unit:SpawnCreature(22929, Unit:GetX(), Unit:GetY()+6, Unit:GetZ(), Unit:GetO(), 14, 0)
	Unit:SpawnCreature(22929, Unit:GetX()+4, Unit:GetY(), Unit:GetZ(), Unit:GetO(), 14, 0)
	Unit:SpawnCreature(22929, Unit:GetX(), Unit:GetY()+8, Unit:GetZ(), Unit:GetO(), 14, 0)
end

function IllidariNightlord_Combat(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("IllidariNightlord_Hellfire", 10000, 0)
	Unit:RegisterEvent("IllidariNightlord_Fear", 6000, 0)
	Unit:RegisterEvent("IllidariNightlord_Shadowfiends", 1000, 1)
end

RegisterUnitEvent(230006, 1, "IllidariNightlord_Combat")

--Gorefiends Vigil
function ShadowmoonChampion_Whirlwind(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(40236, Unit:GetClosestPlayer())
end

function ShadowmoonChampion_Combat(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("ShadowmoonChampion_Whirlwind", 5000, 0)
end

RegisterUnitEvent(230021, 1, "ShadowmoonChampion_Combat")

function ShadowmoonRidinghound_Charge(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(38907, Unit:GetRandomPlayer(0))
	Unit:ClearThreadList()
end

function ShadowmoonRidinghound_Combat(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("ShadowmoonRidinghoun_Charge", 8000, 0)
end

RegisterUnitEvent(230022, 1, "ShadowmoonRidinghound_Combat")

function ShadowmoonDeathshaper_RaiseDead(Unit, event, miscUnit, misc)
	Unit:SpawnCreature(23371, Unit:GetX(), Unit:GetY(), Unit:GetZ(), Unit:GetO(), 14, 0)
end

function ShadowmoonDeathshaper_Dreadbolt(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(40876, Unit:GetRandomPlayer(0))
end

function ShadowmoonDeathshaper_DeathCoil(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(33130, Unit:GetRandomPlayer(0))
end

function ShadowmoonDeathshaper_Combat(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("ShadowmoonDeathshaper_RaiseDead", 4000, 0)
	Unit:RegisterEvent("ShadowmoonDeathshaper_Dreadbolt", 6000, 0)
	Unit:RegisterEvent("ShadowmoonDeathshaper_DeathCoil", 5000, 0)
end

RegisterUnitEvent(230023, 1, "ShadowmoonDeathshaper_Combat")