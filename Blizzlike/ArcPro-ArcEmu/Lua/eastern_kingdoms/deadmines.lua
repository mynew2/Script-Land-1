--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation, DARKI
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

--Doors
function DoorOne(GameObject)
local FactoryDoor = GameObject
end

function DoorTwo(GameObject)
local MastDoor = GameObject
end

function DoorThree(GameObject)
local FoundryDoor = GameObject
end

RegisterGameObjectEvent(13965, 1, "DoorOne")
RegisterGameObjectEvent(16400, 1, "DoorTwo")
RegisterGameObjectEvent(16399, 1, "DoorThree")

--Rhank'zor
function Rhankzor_Slam(pUnit)
local MainTank = pUnit:GetMainTank()
     if (MainTank ~= nil) then
        pUnit:FullCastSpellOnTarget(6304, MainTank)
	 end
end

function Rhankzor_OnCombat(pUnit)
    pUnit:SendChatMessage(12, 0, "VanCleef pay big for your heads!")
	pUnit:PlaySoundToSet(5774)
	pUnit:RegisterEvent("Rhankzor_Slam", math.random(10000,13000), 0)
end

function Rhankzor_LeaveCombat(pUnit)
    pUnit:RemoveEvents()
end

function Rhankzor_OnDied(pUnit)
    pUnit:RemoveEvents()
    FactoryDoor:ActivateGameObject()
end

RegisterUnitEvent(644, 1, "Rhankzor_OnCombat")
RegisterUnitEvent(644, 2, "Rhankzor_LeaveCombat")
RegisterUnitEvent(644, 4, "Rhankzor_OnDied")


--Miner Johnson
function MinerJohnson_PierceArmor(pUnit)
local MainTank = pUnit:GetMainTank()
     if (MainTank ~= nil) then
	    pUnit:FullCastSpellOnTarget(6016, MainTank)
	end
end

function MinerJohnson_OnCombat(pUnit)
    pUnit:FullCastSpellOnTarget(6016, pUnit:GetMainTank())
    pUnit:RegisterEvent("MinerJohnson_PierceArmor", math.random(10000,15000), 0)
end

function MinerJohnson_LeaveCombat(pUnit)
    pUnit:RemoveEvents()
end

function MinerJohnson_OnDied(pUnit)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(3586, 1, "MinerJohnson_OnCombat")
RegisterUnitEvent(3586, 2, "MinerJohnson_LeaveCombat")
RegisterUnitEvent(3586, 4, "MinerJohnson_OnDied")

--Sneed Shreeder
function SneedShreeder_DistractingPain(pUnit)
local PlayerLowRange = pUnit:GetRandomPlayer(1)
     if (PlayerLowRange ~= nil) then
        pUnit:FullCastSpellOnTarget(3603, PlayerLowRange)
	 end
end

function SneedShreeder_Fear(pUnit)
local RandomPlayer = pUnit:GetRandomPlayer(0)
     if (RandomPlayer ~= nil) then
        pUnit:FullCastSpellOnTarget(7399, RandomPlayer)
     end
end

function SneedShreeder_OnCombat(pUnit)
    pUnit:RegisterEvent("SneedShreeder_DistractingPain", math.random(20000, 30000), 0)
	pUnit:RegisterEvent("SneedShreeder_Fear", math.random(12000, 18000), 0)
end

function SneedShreeder_LeaveCombat(pUnit)
    pUnit:RemoveEvents()
end

function SneedShreeder_OnDied(pUnit)
local x = pUnit:GetX()
local y = pUnit:GetY()
local z = pUnit:GetZ()
    pUnit:RemoveEvents()
    pUnit:SpawnCreature(643, x+2, y+2, z, 0, 17, 0)
end

RegisterUnitEvent(642, 1, "SneedShreeder_OnCombat")
RegisterUnitEvent(642, 2, "SneedShreeder_LeaveCombat")
RegisterUnitEvent(642, 4, "SneedShreeder_OnDied")

--Sneed
function Sneed_Disarm(pUnit)
local MainTank = pUnit:GetMainTank()
     if (MainTank ~= nil) then
        pUnit:FullCastSpellOnTarget(6713, MainTank)
     end
end

function Sneed_OnCombat(pUnit)
    pUnit:RegisterEvent("Sneed_Disarm", math.random(10000,15000), 0)
end

function Sneed_LeaveCombat(pUnit)
    pUnit:RemoveEvents()
	pUnit:Despawn(5000, 0)
end

function Sneed_OnDie(pUnit)
    pUnit:RemoveEvents()
    MastDoor:ActivateGameObject(1)
end

RegisterUnitEvent(643, 1, "Sneed_OnCombat")
RegisterUnitEvent(643, 2, "Sneed_LeaveCombat")
RegisterUnitEvent(643, 4, "Sneed_OnDie")

--Gilnid
function Gilnid_MoltenMetal(pUnit)
local MainTank = pUnit:GetMainTank()
     if (MainTank ~= nil) then
        pUnit:FullCastSpellOnTarget(5213, MainTank) 
	end
end

function Gilnid_MoltenOre(pUnit)
	pUnit:FullCastSpell(5159)
end

function Gilnid_RandomYell(pUnit)
local GRandomYell = math.random(1,3)
    if (GRandomYell == 1) then
	    pUnit:SendChatMessage(12, 0, "Anyone want to take a break? Well too bad! Get to work you oafs!")
	end
	if (GRandomYell == 2) then
	    pUnit:SendChatMessage(12, 0, "Get those parts moving down to the ship!")
    end
	if (GRandomYell == 3) then
	    pUnit:SendChatMessage(12, 0, "The cannons must be finished soon.")
	end
end


function Gilnid_OnCombat(pUnit)
    pUnit:RegisterEvent("Gilnid_MoltenMetal", math.random(12000,16000), 0)
	pUnit:RegisterEvent("Gilnid_MoltenOre", math.random(15000,20000), 0)
	pUnit:RegisterEvent("Gilnid_RandomYell", math.random(15000,30000), 0)
end

function Gilnid_LeaveCombat(pUnit)
    pUnit:RemoveEvents()
end

function Gilnid_OnDie(pUnit)
    pUnit:RemoveEvents()
    FoundryDoor:ActivateGameObject(1)
end

RegisterUnitEvent(1763, 1, "Gilnid_OnCombat")
RegisterUnitEvent(1763, 2, "Gilnid_LeaveCombat")
RegisterUnitEvent(1763, 4, "Gilnid_OnDie")

--Mr. Smite
--local MoveToChest=pUnit:MoveTo(1.100060, -780.026367, 9.811194, 5.452218)

function MrSmiteSlam(pUnit)
local MainTank = pUnit:GetMainTank()
     if (MainTank ~= nil) then
	    pUnit:FullCastSpellOnTarget(6435, MainTank)
	 end
end

function MrSmitePhase1(pUnit)
    if (pUnit:GetHealthPct() <= 66) then
	    pUnit:RemoveEvents()
        pUnit:FullCastSpell(6432)
		pUnit:SendChatMessage(12, 0, "You landlubbers are tougher than i thought. I'll have to improvise!")
		pUnit:PlaySoundToSet(5778)
--		pUnit:MoveTo(1.100060, -780.026367, 9.811194, 5.452218)
		pUnit:RegisterEvent("MrSmitePhase2", 1000, 0)
	    pUnit:RegisterEvent("MrSmiteSlam", math.random(10000,20000), 0)
    end
end

function MrSmitePhase2(pUnit)
    if (pUnit:GetHealthPct() <= 33) then
	    pUnit:RemoveEvents()
        pUnit:FullCastSpell(6432)
		pUnit:SendChatMessage(12, 0, "D'ah! Now you're making me angry!")
		pUnit:PlaySoundToSet(5779)
		pUnit:RegisterEvent("MrSmiteSlam", math.random(10000,20000), 0)
--		pUnit:MoveTo(1.100060, -780.026367, 9.811194, 5.452218)
    end
end
	
function MrSmite_OnCombat(pUnit)
    pUnit:RegisterEvent("MrSmiteSlam",math.random(10000,20000),0)
	pUnit:RegisterEvent("MrSmitePhase1",1000,0)
end

function MrSmite_LeaveCombat(pUnit)
    pUnit:RemoveEvents()
end

function MrSmite_OnDied(pUnit)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(646, 1, "MrSmite_OnCombat")
RegisterUnitEvent(646, 2, "MrSmite_LeaveCombat")
RegisterUnitEvent(646, 4, "MrSmite_OnDied")

--Cookie 
function Cookie_OnCombat(pUnit)
    pUnit:FullCastSpell(6306)
    pUnit:RegisterEvent("Cookie_AcidSplash", 30000, 0)
    pUnit:RegisterEvent("Cookie_Cooking", math.random(15000,25000), 0)
end

function Cookie_AcidSplash(pUnit)
    pUnit:FullCastSpell(6306)
end

function Cookie_Cooking(pUnit)
    pUnit:FullCastSpell(5174)
end

function Cookie_OnLeaveCombat(pUnit)
    pUnit:RemoveEvents()
end

function Cookie_OnDied(pUnit)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(645, 1, "Cookie_OnCombat")
RegisterUnitEvent(645, 2, "Cookie_OnLeaveCombat")
RegisterUnitEvent(645, 4, "Cookie_OnDied")

--Captain Greenskin 
function Greenskin_Cleave(pUnit)
    pUnit:FullCastSpell()
end

function Greenskin_Poisoned(pUnit)
local MainTank = pUnit:GetMainTank()
     if (MainTank ~= nil) then
	    pUnit:FullCastSpellOnTarget(5208, MainTank)
	end
end

function Greenskin_OnCombat(pUnit)
    pUnit:RegisterEvent("Greenskin_Cleave", math.random(8000, 16000), 0)
	pUnit:RegisterEvent("Greenskin_Poisoned", math.random(7000,14000), 0)
end

function Greenskin_OnLeaveCombat(pUnit)
    pUnit:RemoveEvents()
end

function Greenskin_OnDied(pUnit)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(647, 1, "Greenskin_OnCombat")
RegisterUnitEvent(647, 2, "Greenskin_OnLeaveCombat")
RegisterUnitEvent(647, 4, "Greenskin_OnDied")
        

--Edwin VanCleef by Project eXa
function VanCleef_OnCombat(pUnit)
local x = pUnit:GetX()
local y = pUnit:GetY()
local z = pUnit:GetZ()
local o = pUnit:GetO()
	pUnit:SendChatMessage(12,0,"Niemand kann die Bruderschaft herausfordern!")
	pUnit:PlaySoundToSet(5780)
	pUnit:RegisterEvent("VanCleef_Phase2",1000,0)
	pUnit:SpawnCreature(636,x+2,y,z,o,17,600000)
	pUnit:SpawnCreature(636,x-2,y,z,o,17,600000)
end

function VanCleef_Phase2(pUnit)
    if (pUnit:GetHealthPct() <= 75) then
        pUnit:RemoveEvents()
        pUnit:SendChatMessage(12, 0, "Lapdogs, all of you!")
        pUnit:PlaySoundToSet(5782)
        pUnit:RegisterEvent("VanCleef_Phase3", 1000, 0)
    end
end

function VanCleef_Phase3(pUnit)
local x = pUnit:GetX()
local y = pUnit:GetY()
local z = pUnit:GetZ()
local o = pUnit:GetO()
    if (pUnit:GetHealthPct() <= 50) then
        pUnit:RemoveEvents()
        pUnit:SendChatMessage(12, 0, "Fools! Our cause is righteous!")
        pUnit:PlaySoundToSet(5783)
        pUnit:SpawnCreature(636, x-2, y, z, o, 17, 600000)
        pUnit:SpawnCreature(636, x+2, y, z, o, 17, 600000)
     end
end

function VanCleef_Phase4(pUnit)
    if (pUnit:GetHealthPct() <= 25) then
        pUnit:RemoveEvents()
        pUnit:SendChatMessage(12, 0, "The Brotherhood shall prevail!")
        pUnit:PlaySoundToSet(5784)
    end
end

function VanCleef_OnKilledTarget(pUnit)
    pUnit:SendChatMessage(12, 0, "And stay seated!")
    pUnit:PlaySoundToSet(5781)
end

function VanCleef_OnLeaveCombat(pUnit)
    pUnit:RemoveEvents()
end

function VanCleef_OnDied(pUnit)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(639, 1, "VanCleef_OnCombat")
RegisterUnitEvent(639, 2, "VanCleef_OnLeaveCombat")
RegisterUnitEvent(639, 3, "VanCleef_OnKilledTarget")
RegisterUnitEvent(639, 4, "VanCleef_OnDied")

function Traitor_end(Unit, Event)
	Unit:SendChatMessage(11, 0, "Tell your master that this is where Van Cleef is hiding. I'm outta here!")
	Unit:Despawn(5000,1000)
	Unit:DestroyCustomWaypointMap();
end

function Traitor_OnStart(Unit, Event)
	Unit:CreateCustomWaypointMap();
	Unit:CreateWaypoint(-10521.876953, 1064.410278, 54.820744, 3.220135, 0, 256, 0);
	Unit:CreateWaypoint(-10548.616211, 1072.964111, 49.694920, 3.345799, 0, 256, 0);
	Unit:CreateWaypoint(-10596.891602, 1057.281982, 38.864330, 3.451828, 0, 256, 0);
	Unit:CreateWaypoint(-10663.427734, 1030.475952, 32.725643, 3.098398, 0, 256, 0);
	Unit:CreateWaypoint(-10715.894531, 1030.825317, 33.473114, 3.165157, 0, 256, 0);
	Unit:CreateWaypoint(-10754.050781, 1016.978821, 32.843971, 3.443188, 0, 256, 0);
	Unit:CreateWaypoint(-10917.114258, 997.355408, 35.466064, 3.314383, 0, 256, 0);
	Unit:CreateWaypoint(-10937.306641, 1020.598755, 36.644848, 1.488332, 0, 256, 0);
	Unit:CreateWaypoint(-10933.578125, 1058.460571, 36.027996, 1.472624, 0, 256, 0);
	Unit:CreateWaypoint(-10958.590820, 1105.329224, 36.635437, 2.076595, 0, 256, 0);
	Unit:CreateWaypoint(-10895.253906, 1248.348877, 33.385048, 1.176529, 0, 256, 0);
	Unit:CreateWaypoint(-10958.590820, 1105.329224, 36.635437, 2.076595, 0, 256, 0);
	Unit:CreateWaypoint(-10895.253906, 1248.348877, 33.385048, 1.176529, 0, 256, 0);
	Unit:CreateWaypoint(-10890.806641, 1297.475708, 34.488716, 1.698819, 0, 256, 0);
	Unit:CreateWaypoint(-10917.052734, 1419.003296, 42.823147, 1.804847, 0, 256, 0);
	Unit:CreateWaypoint(-10989.025391, 1410.501953, 42.863670, 2.673498, 0, 256, 0);
	Unit:CreateWaypoint(-10989.025391, 1410.501953, 42.863670, 2.673498, 0, 256, 0);
	Unit:CreateWaypoint(-11024.154297, 1488.091064, 43.177536, 1.566087, 0, 256, 0);
	Unit:CreateWaypoint(-11048.541992, 1513.367798, 43.154915, 2.369550, 0, 256, 0);
	Unit:CreateWaypoint(-11065.412109, 1526.429321, 43.328102, 3.068554, 0, 256, 0);
	Unit:SetMovementType(11)
	Unit:SetCombatCapable(0)
	Unit:StopMovement(3000)
	Unit:SendChatMessage(11, 0, "Okay let's do this, you gotta protect me and stuff, I can't fight on my own!");
	Unit:SetNPCFlags(0);
	RegisterEvent(Traitor_End, 1, 10000)
end

function Undeadex_Callofgrave(Unit, Event)
	Unit:CastSpell(5137)
end

function Undeadex_OnCombat(Unit, Event)
	Unit:RegisterEvent("Undeadex_Callofgrave", 10000, 0)
end

RegisterUnitEvent(624, 0, "Undeadex_OnCombat")

function Undeaddyn_dynamite(Unit, Event)
	Unit:CastSpell(7395)
end

function Undeaddyn_OnCombat(Unit, Event)
	Unit:RegisterEvent("Undeadex_dynamite", 6500, 0)
end

RegisterUnitEvent(625, 0, "Undeaddyn_OnCombat")


function Undeadskel_strike(Unit, Event)
	Unit:CastSpell(11976)
end

function Undeaddyn_OnCombat(Unit, Event)
	Unit:RegisterEvent("Undeadskel_dynamite", 3000, 0)
end

RegisterUnitEvent(623, 0, "Undeadskel_OnCombat")

function woodcarver_strike(Unit, Event)
	Unit:CastSpell(40505)
end

function woodcarver_OnCombat(Unit, Event)
	Unit:RegisterEvent("Undeadskel_dynamite", 8000, 0)
	Unit:CastSpell(6466)
end

RegisterUnitEvent(641, 0, "woodcarver_OnCombat")

function engineer_spawn(Unit, Event)
	Unit:CastSpell(3605)
end

function engineer_OnCombat(Unit, Event)
	Unit:RegisterEvent("engineer_spawn", 20000, 0)
	Unit:CastSpell(6660)
end

RegisterUnitEvent(622, 0, "engineer_OnCombat")

function crafts_ore(Unit, Event)
	Unit:CastSpell(5159)
end

function crafts_OnCombat(Unit, Event)
	Unit:RegisterEvent("crafts_ore", 20000, 0)
	Unit:CastSpell(5159)
end

RegisterUnitEvent(1731, 0, "crafts_OnCombat")

function wizard_ice(Unit, Event)
	Unit:CastSpell(113)
end

function wizard_fire(Unit, Event)
	Unit:CastSpell(9053)
end

function wizard_OnCombat(Unit, Event)
	Unit:RegisterEvent("wizard_ice", 12000, 0)
	Unit:RegisterEvent("wizard_fire", 4000, 0)
	Unit:CastSpell(4979)
end

RegisterUnitEvent(4418, 0, "wizard_OnCombat")

function watchman_OnCombat(Unit, Event)
	Unit:CastSpell(6660)
end

RegisterUnitEvent(1725, 0, "watchman_OnCombat")

function task_peirce(Unit, Event)
	Unit:CastSpell(6685)
end

function task_OnCombat(Unit, Event)
	Unit:RegisterEvent("task_peirce", 8000, 0)
	Unit:CastSpell(6660)
end

RegisterUnitEvent(4417, 0, "task_OnCombat")

function strip_peirce(Unit, Event)
	Unit:CastSpell(6016)
end

function strip_OnCombat(Unit, Event)
	Unit:RegisterEvent("task_peirce", 8000, 0)
end

RegisterUnitEvent(4416, 0, "strip_OnCombat")
RegisterUnitEvent(598, 0, "strip_OnCombat")

function squal_blast(Unit, Event)
	Unit:CastSpell(6016)
end

function squal_freeze(Unit, Event)
	Unit:CastSpell(122)
end

function squal_OnCombat(Unit, Event)
	Unit:RegisterEvent("squal_blast", 8000, 0)
	Unit:RegisterEvent("squal_freeze", 12000, 0)
	Unit:CastSpell(12544)
end

RegisterUnitEvent(1732, 0, "squal_OnCombat")

function pirate_OnCombat(Unit, Event)
	Unit:CastSpell(5172)
end

RegisterUnitEvent(657, 0, "pirate_OnCombat")

function overseer_shout(Unit, Event)
	Unit:CastSpell(5115)
end

function overseer_OnCombat(Unit, Event)
	Unit:CastSpell(5115)
	Unit:RegisterEvent("overseer_shout", 14000, 0)
end

RegisterUnitEvent(634, 0, "overseer_OnCombat")

function blackguard_OnSpawn(Unit, Event)
	Unit:CastSpell(6408)
end

RegisterUnitEvent(636, 0, "blackguard_OnSpawn")

function mage_fire(Unit, Event)
	Unit:CastSpell(9053)
end

function mage_OnSpawn(Unit, Event)
	Unit:CastSpell(5110)
	Unit:RegisterEvent("mage_fire", 4000, 0)
end

RegisterUnitEvent(1726, 0, "mage_OnSpawn")

function hench_slam(Unit, Event)
	Unit:CastSpell(8242)
end

function hench_OnSpawn(Unit, Event)
	Unit:RegisterEvent("hench_slam", 8000, 0)
end

RegisterUnitEvent(594, 0, "hench_OnSpawn")

function evoke_strike(Unit, Event)
	Unit:CastSpell(11829)
end

function evoke_OnSpawn(Unit, Event)
	Unit:RegisterEvent("evoke_strike", 8500, 0)
	local spruch = math.random(1,2)
	if (spruch == 1) then
		Unit:CastSpell(12544)
	elseif (spruch == 2) then
		Unit:CastSpell(4979)
	end
end

RegisterUnitEvent(1729, 0, "evoke_OnSpawn")

function conjure_fire(Unit, Event)
	Unit:CastSpell(9053)
end

function conjure_OnSpawn(Unit, Event)
	Unit:RegisterEvent("evoke_strike", 3500, 0)
end

RegisterUnitEvent(619, 0, "conjure_OnSpawn")