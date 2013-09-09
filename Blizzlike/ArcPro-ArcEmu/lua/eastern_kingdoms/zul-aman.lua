--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation, Paroxysm, DARKI, Morfeo, 
Performer, GregPohlod
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function AkilzonOnSpawn(Unit)
	local args = getvars(Unit)
	if((args == nil) or (args.AKILZON == nil)) then
		setvars(Unit,{ AKILZON = {
		gust_timer = 0,
		calllight_timer = 0,
		static_timer = 0,
		storm_timer = 0,
		cancast = false,
		soaring_table = {},
		akilzonptr = nil,
		}} )
	end
end

function AkilzonOnCombat(Unit)
	local args = getvars(Unit)
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "I be da predator! You da prey!")
	Unit:PlaySoundToSet(12013)
	Unit:RegisterAIUpdateEvent(1000)
	args.AKILZON.cancast = true
	args.AKILZON.akilzonptr = Unit
end

function AkilzonCanCast(Unit)
	local args = getvars(Unit)
	args.AKILZON.cancast = true
end

function AkilzonOnKilledTarget(Unit,event,target)
	if(target:IsPlayer() == true) then
		if(math.random(2) == 1) then
			Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Stop ya crying'!")
			Unit:PlaySoundToSet(12018)
		else
			Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Ya got nuthin'!")
			Unit:PlaySoundToSet(12017)
		end
	end
end

function AkilzonOnWipe(Unit)
	Unit:RemoveAIUpdateEvent()
	Unit:RemoveEvents()
end

function AkilzonOnDeath(Unit)
	local tbl = Unit:GetInRangeFriends()
	for k,v in pairs(tbl) do
		if((type(v) == "userdata") and (v:GetEntry() == 24858)) then
			v:Die()
		end
	end
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "You can't... kill... me spirit!")
	Unit:PlaySoundToSet(12019)
	Unit:RemoveAIUpdateEvent()
	Unit:RemoveEvents()
end

function AkilzonAIUpdate(Unit)
	local args = getvars(Unit)
	args.AKILZON.gust_timer = args.AKILZON.gust_timer + 1
	args.AKILZON.static_timer = args.AKILZON.static_timer + 1
	args.AKILZON.storm_timer = args.AKILZON.storm_timer+ 1
	args.AKILZON.calllight_timer = args.AKILZON.calllight_timer +1
	local plr = Unit:GetRandomPlayer(0)
	local tank = Unit:GetMainTank()
	local rand1 = math.random(10, 20)
	local rand2 = math.random(20, 30)
	if((args.AKILZON.calllight_timer >= 15) and (type(tank) == "userdata")  and (tank:IsAlive() == true) and (args.AKILZON.cancast == true)) then
		args.AKILZON.cancast = false
		args.AKILZON.calllight_timer = 0
		Unit:FullCastSpellOnTarget(43661, tank)
		Unit:RegisterEvent("AkilzonCanCast", 1000, 1)
	elseif((args.AKILZON.calllight_timer >=15) and (type(tank) == "userdata")  and (tank:IsAlive() == true) and (args.AKILZON.cancast == false)) then
		args.AKILZON.calllight_timer = args.AKILZON.calllight_timer -1
	end
	if((args.AKILZON.static_timer >= rand1) and (type(plr) == "userdata") and (plr:IsAlive() == true) and (args.AKILZON.cancast == true)) then
		args.AKILZON.cancast = false
		args.AKILZON.static_timer = 0
		Unit:FullCastSpellOnTarget(44008, plr)
		Unit:RegisterEvent("AkilzonCanCast", 1000, 1)
	elseif((args.AKILZON.static_timer >= rand1) and (type(plr) == "userdata") and (plr:IsAlive() == true) and (args.AKILZON.cancast == false)) then
		args.AKILZON.static_timer = args.AKILZON.static_timer - 1
	end
	if((args.AKILZON.gust_timer  >= rand2) and (type(plr) == "userdata") and (plr:IsAlive() == true) and (args.AKILZON.cancast == true)) then
		args.AKILZON.gust_timer = 0
		args.AKILZON.cancast = false
		Unit:FullCastSpellOnTarget(43621, plr)
		Unit:RegisterEvent("AkilzonCanCast", 1000, 1)
	elseif((args.AKILZON.gust_timer >= rand2) and (type(plr) == "userdata") and (plr:IsAlive() == true) and (args.AKILZON.cancast == false)) then
		args.AKILZON.gust_timer = args.AKILZON.gust_timer - 1
	end
	if((args.AKILZON.storm_timer >= 60) and (type(plr) == "userdata") and (plr:IsAlive() == true) and (args.AKILZON.cancast == true)) then
		args.AKILZON.storm_timer = 0
		args.AKILZON.cancast = false
		Unit:FullCastSpellOnTarget(43648, plr)
		AkilzonElectricalStorm(Unit, plr)
		Unit:RegisterEvent("AkilzonCanCast", 9000, 1)
		Unit:RegisterEvent("AkilzonSummonEagles", 15000, 1)
	elseif((args.AKILZON.storm_timer >= 60) and (type(plr) == "userdata") and (plr:IsAlive() == true) and (args.AKILZON.cancast == false)) then
		args.AKILZON.storm_timer  = args.AKILZON.storm_timer - 1
	end
end

function AkilzonSummonEagles(Unit)
	local args = getvars(Unit)
	if(table.getn(args.AKILZON.soaring_table) <= 20) then
		for i = 1,math.random(6,7) do
			Unit:SpawnCreature(24858, Unit:GetX(), Unit:GetY(), Unit:GetZ()+20, Unit:GetO(), Unit:GetUInt32Value(UnitField.Unit_FIELD_FACTIONTEMPLATE), 0)
		end
		local choice = math.random(1, 2)
		if(choice == 2) then
			Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Feed me bruddahs!")
			Unit:PlaySoundToSet(12014)
		elseif(choice == 1) then
			Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Come and join me bruddah!")
			Unit:PlaySoundToSet(12015)
		end
	else
		Unit:RegisterEvent("Akilzon_SummonEagles", 1000, 1)
	end
end

function AkilzonElectricalStorm(Unit,plr)
	plr:EnableFlight()
	plr:MonsterMove(plr:GetX(), plr:GetY(), plr:GetZ()+15, 2000, 768)
	Unit:RegisterEvent("AkilzonElectricalStorm02", 6000, 1)
	Unit:RegisterEvent("AkilzonElectricalStorm03", 8000, 1)
end

function AkilzonElectricalStorm02(Unit)
	local plr = Unit:GetNextTarget()
	plr:SetPosition(plr:GetX(), plr:GetY(), plr:GetZ()+15)
end

function AkilzonElectricalStorm03(Unit)
	local plr = Unit:GetNextTarget()
	plr:DisableFlight()
end
	
function AkilzonSoaringEagleOnSpawn(Unit)
	local args = getvars(Unit)
	table.insert(args.AKILZON.soaring_table,Unit)
	local angle = 45
	local wp = 1
	for i = 1,8 do
		Unit:CreateWaypoint(wp, args.AKILZON.akilzonptr:GetSpawnX()+math.cos((angle/math.pi))*20, args.AKILZON.akilzonptr:GetSpawnY()+math.sin((angle/math.pi))*20, Unit:GetZ(), Unit:GetO(), 0, 768, 0)
		wp = wp+1
		angle = angle*2
	end
	Unit:SetAIState(11)
	Unit:SetCombatMeleeCapable(1)
	Unit:MoveToWaypoint(1)
	AkilzonSoaringEagleSwoop(Unit)
end

function AkilzonSoaringEagleSwoop(Unit)
	local plr = Unit:GetRandomPlayer(0)
	if((type(plr) == "userdata") and (plr:IsAlive() == true)) then
		Unit:FullCastSpellOnTarget(44732, plr)
		--Unit:MoveToWaypoint(math.random(8))
	end
	Unit:RegisterEvent("AkilzonSoaringEagleSwoop", math.random(3000, 10000), 1)
	Unit:RegisterEvent("AkilzonSoaringEagleReturn", 1000, 1)
end

function AkilzonSoaringEagleReturn(Unit)
	Unit:MoveToWaypoint(math.random(8))
end

function AkilzonSoaringEagleOnReachWp(Unit,null,null,wp)
	if(wp == 1) then
		Unit:MoveToWaypoint(2)
	elseif(wp == 2) then
		Unit:MoveToWaypoint(3)
	elseif(wp == 3) then
		Unit:MoveToWaypoint(4)
	elseif(wp == 4) then
		Unit:MoveToWaypoint(5)
	elseif(wp == 5) then
		Unit:MoveToWaypoint(6)
	elseif(wp == 6) then
		Unit:MoveToWaypoint(7)
	elseif(wp == 7) then
		Unit:MoveToWaypoint(8)
	elseif(wp == 8) then
		Unit:MoveToWaypoint(1)
	end
end

function AkilzonSoaringEagleOnWipe(Unit)
	local args = getvars(Unit)
	Unit:DestroyCustomWaypointMap()
	Unit:RemoveEvents()
	for k,v in pairs(args.AKILZON.soaring_table) do
		if(v == Unit) then
			table.remove(args.AKILZON.soaring_table, k)
		end
	end
end

function AkilzonSoaringEagleOnDeath(Unit)
	local args = getvars(Unit)
	for k,v in pairs(args.AKILZON.soaring_table) do
		if(v == Unit) then
			table.remove(args.AKILZON.soaring_table, k)
		end
	end
	Unit:DestroyCustomWaypointMap()
	Unit:RemoveEvents()
end

RegisterUnitEvent(23574, 1, "AkilzonOnCombat")
RegisterUnitEvent(23574, 18, "AkilzonOnSpawn")
RegisterUnitEvent(23574, 4, "AkilzonOnDeath")
RegisterUnitEvent(23574, 21, "AkilzonAIUpdate")
RegisterUnitEvent(23574, 2, "AkilzonOnWipe")
RegisterUnitEvent(23574, 3, "AkilzonOnKilledTarget")
RegisterUnitEvent(24858, 1, "AkilzonSoaringEagleOnSpawn")
RegisterUnitEvent(24858, 2, "AkilzonSoaringEagleOnWipe")
RegisterUnitEvent(24858, 4, "AkilzonSoaringEagleOnDeath")
RegisterUnitEvent(24858, 18, "AkilzonSoaringEagleOnSpawn")

local amani_warrior = 24225
local amani_eagle = 24159
local amani_windwalker = 24179
local amani_lookout = 24175
local amani_protector = 24180
local amani_tempest = 24549
local soaring_eagle = 24858
local allowtempest = false
local amani_adds = {}
amani_adds["warriors"] = {}
amani_adds["eagles"] = {}

function AmaniLookOut_OnCombat(Unit,event,pmisc)
	Unit:DestroyCustomWaypointMap()
	Unit:CreateCustomWaypointMap()
	Unit:CreateWaypoint(1, 229.025361, 1465.758911, 25.916751, Unit:GetO(), 0, 256, 0)
	Unit:CreateWaypoint(2, 228.005325, 1435.453491, 26.726126, Unit:GetO(), 0, 256, 0)
	Unit:CreateWaypoint(3, 228.352188, 1374.711426, 46.888203, Unit:GetO(), 0, 256, 0)
	Unit:SetCombatCapable(1)
	Unit:RegisterEvent("AmaniLookOut_Waypoints", 200, 1)
end

function AmaniLookOut_Waypoints(Unit)
	Unit:SetAllowedToEnterCombat(0)
	Unit:StopMovement(0)
	Unit:SetAIState(AI_State.STATE_SCRIPTMOVE)
	Unit:SetMovementType(MovementType.MOVEMENTTYPE_FORWARDTHANSTOP)
	allowtempest = true
	Unit:RegisterEvent("AmaniTempest_Initialize", 10000, 1)
end

function AmaniLookOut_OnWipe(Unit)
	Unit:DestroyCustomWaypointMap()
	allowtempest = false;
end

function AmaniLookOut_OnDeath(Unit)
	Unit:DestroyCustomWaypointMap()
	allowtempest = false;
end

function AmaniLookOut_OnReachWp(Unit,null,null,wp)
	print("Current waypoint is : "..tonumber(wp))
	if(wp == 1) then
		Unit:MoveToWaypoint(2)
		Unit:SetMovementType(MovementType.MOVEMENTTYPE_WANTEDWP)
	elseif(wp == 2) then
		Unit:MoveToWaypoint(3)
		Unit:SetMovementType(MovementType.MOVEMENTTYPE_WANTEDWP)
	elseif(wp == 3) then
		Unit:RemoveFromWorld()
	end
end

function AmaniTempest_Initialize(Unit)
	local tempest = Unit:GetCreatureNearestCoords(301.122009,1385.599976, 57.853100,amani_tempest)
	if(type(tempest) == "userdata") then
		if((tempest:IsAlive() == true) and (tempest:IsInCombat() == false)) then
			tempest:RemoveFromWorld()
			Unit:SpawnCreature(amani_tempest, 301.122009, 1385.599976, 57.853100, 3.263770, 1890, 0)
		end
	else
		Unit:SpawnCreature(amani_tempest, 301.122009, 1385.599976, 57.853100, 3.263770, 1890, 0)
	end
end

RegisterUnitEvent(amani_lookout, 1, "AmaniLookOut_OnCombat")
RegisterUnitEvent(amani_lookout, 19, "AmaniLookOut_OnReachWp")
RegisterUnitEvent(amani_lookout, 2, "AmaniLookOut_OnWipe")
RegisterUnitEvent(amani_lookout, 4,"AmaniLookOut_OnDeath")

function AmaniTempest_OnSpawn(Unit)
	Unit:DestroyCustomWaypointMap()
	if(allowtempest == true) then
		Unit:RegisterEvent("AmaniTempest_AddSpawn", 100, 1)
	end
	Unit:RegisterAIUpdateEvent(2000)
end

function AmaniTempest_AIUpdate(Unit)
	local warcount,eaglecount = table.getn(amani_adds["warriors"]),table.getn(amani_adds["eagles"])
	if((warcount > 6) or (eaglecount > 15)) then
		allowtempest = false
	elseif((warcount <= 6) and (eaglecount <= 15)) then
		allowtempest = true
	end
end

function AmaniTempest_AddSpawn(Unit)
	if(allowtempest == true) then
		for i = 1, math.random(5,6) do
			Unit:CastSpellAoF(296.047699, 1384.848022, 56.057110, 43487)
		end
		Unit:CastSpellAoF(228.884476, 1489.821777, 25.937740, 43486)
		Unit:CastSpellAoF(223.590759, 1490.079712, 25.916952, 43486)
		Unit:RegisterEvent("AmaniTempest_AddSpawndeux", 15000, 1)
	else
		Unit:RegisterEvent("AmaniTempest_AddSpawndeux", 3000, 1)
	end
end

function AmaniTempest_AddSpawndeux(Unit)
	if(allowtempest == true) then
		for i = 1, math.random(5,6) do
			Unit:CastSpellAoF(296.047699, 1384.848022, 56.057110, 43487)
		end
		Unit:RegisterEvent("AmaniTempest_AddSpawn", 30000, 1)
	else
		Unit:RegisterEvent("AmaniTempest_AddSpawn", 3000, 1)
	end
end

function AmaniTempest_OnCombat(Unit)
	Unit:RemoveEvents()
	Unit:RegisterEvent("AmaniTempest_AOE",10000,0)
end

function AmaniTempest_AOE(Unit)
	if Unit:GetRandomPlayer(0)~= nil then
		Unit:FullCastSpell(44033)
	end
end

function AmaniTempest_OnLeaveCombat(Unit)
	Unit:RemoveAIUpdateEvent()
	Unit:RemoveEvents()
end

function AmaniTempest_OnDeath(Unit)
	Unit:RemoveAIUpdateEvent()
	Unit:RemoveEvents()
	Unit:DisableRespawn()
end

RegisterUnitEvent(amani_tempest, 18, "AmaniTempest_OnSpawn")
RegisterUnitEvent(amani_tempest, 1, "AmaniTempest_OnCombat")
RegisterUnitEvent(amani_tempest, 2, "AmaniTempest_OnLeaveCombat")
RegisterUnitEvent(amani_tempest, 4, "AmaniTempest_OnDeath")
RegisterUnitEvent(amani_tempest, 21, "AmaniTempest_AIUpdate")

local kick_timer = nil
local charge_timer = nil
function AmaniWarrior_OnSpawn(Unit)
	local args = getvars(Unit)
	if((args == nil) or (args.NALORAKK ==  nil)) then
		table.insert(amani_adds["warriors"],Unit)
		Unit:ModifySpeed(12)
		if(allowtempest == true) then
			Unit:DestroyCustomWaypointMap()
			Unit:CreateWaypoint(1, 229.025361+(math.random(3)*math.cos(math.random(20, 60))), 1465.758911+(math.random(3)*math.sin(math.random(20, 60))), 25.916751, Unit:GetO(), 500, 256, 0)
			Unit:CreateWaypoint(2, 228.005325+(math.random(3)*math.cos(math.random(20, 60))), 1435.453491+(math.random(3)*math.sin(math.random(20, 60))), 26.726126, Unit:GetO(), 500, 256, 0)
			Unit:CreateWaypoint(3, 228.352188+(math.random(3)*math.cos(math.random(20, 60))), 1374.711426+(math.random(3)*math.sin(math.random(20, 60))), 46.888203, Unit:GetO(), 500, 256, 0)
			Unit:CreateWaypoint(4, 284.307404+(math.random(3)*math.cos(math.random(20, 60))), 1379.991211+(math.random(3)*math.sin(math.random(20, 60))), 49.321771, Unit:GetO(), 500, 256, 0)
			Unit:SetMovementType(MovementType.MOVEMENTTYPE_FORWARDTHANSTOP)
			--Unit:MoveToWaypoint(1)
			Unit:DisableRespawn(1)
		end
	end
end

function AmaniWarrior_OnReachWp(Unit,null,null,wp)
	local args = getvars(Unit)
	if((args == nil) or (args.NALORAKK == nil)) then
		if(wp == 1) then
			--Unit:MoveToWaypoint(2)
		elseif(wp == 2) then
			--Unit:MoveToWaypoint(3)
		elseif(wp == 3) then
			--Unit:MoveToWaypoint(4)
		elseif(wp == 4) then
			Unit:RemoveFromWorld()
		end
	end
end

function AmaniWarrior_OnCombat(Unit,event,pMisc)
	kick_timer = 0
	charge_timer = 0
	Unit:DestroyCustomWaypointMap()
	Unit:StopMovement(100)
	Unit:RegisterAIUpdateEvent(2000)
end

function AmaniWarrior_Abilities(Unit)
	local args = getvars(Unit)
	if((args == nil) or (args.NALORAKK == nil)) then
		return
	end
	if((type(args.NALORAKK) == "table") and (args.NALORAKK.gauntlet == true)) then
		return
	end
	if(Unit:IsInCombat() == true) then
		local tank = Unit:GetMainTank()
		kick_timer = kick_timer+2
		charge_timer = charge_timer+2
		if((kick_timer >= 10) and (type(tank) == "userdata") and (tank:IsAlive() == true)) then
			local casters = {}
			local tbl = Unit:GetInRangePlayers()
			for k,v in pairs(tbl) do
				if((type(v) == "userdata") and (Unit:GetDistance(v) <= 10) and (v:IsAlive() == true) and (v:GetCurrentSpellId() ~= nil)) then
					table.insert(casters,v)
				end
			end
			if table.getn(casters) ~= 0 then
				local randcaster = casters[math.random(1, table.getn(casters))]
				if((type(randcaster) == "userdata") and (randcaster:IsAlive() == true)) then
					Unit:FullCastSpellOnTarget(43518, randcaster)
					kick_timer = 0
				end
			else
				Unit:FullCastSpellOnTarget(43518, tank)
				kick_timer = 0
			end
		elseif((kick_timer >= 10) and (type(tank) ~= "userdata")) then
			kick_timer = kick_timer-2
		end
		if((charge_timer >= 20) and (type(tank) == "userdata") and (tank:IsAlive() == true)) then
			local casters = {}
			local tbl = Unit:GetInRangePlayers()
			for k,v in pairs(tbl) do
				if((type(v) == "userdata") and (v:GetCurrentSpellId() ~= nil)) then
					table.insert(casters,v)
				end
			end
			if((table.getn(casters) ~= 0)) then
				local randcaster = casters[math.random(1,table.getn(casters))]
				if((type(randcaster) == "userdata") and (randcaster:IsAlive() == true)) then
					Unit:FullCastSpellOnTarget(43519, randcaster)
					charge_timer = 0
				end
			else
				Unit:FullCastSpellOnTarget(43519, tank)
				charge_timer = 0
			end
		elseif((charge_timer >= 20) and (type(tank) ~= "userdata")) then
			charge_timer = charge_timer - 2
		end
	end
end

function AmaniWarrior_OnWipe(Unit)
	Unit:DestroyCustomWaypointMap()
	Unit:RemoveAIUpdateEvent()
end

function AmaniWarrior_OnDeath(Unit)
	local args = getvars(Unit)
	if((type(args.NALORAKK) == "table") and (args.NALORAKK.gauntlet == true)) then
		for k,v in pairs(args.NALORAKK.guardssent) do
			if(v == Unit) then
				table.remove(args.NALORAKK.guardssent,k)
			end
		end
	elseif not ((type(args.NALORAKK) == "table") or (args.NALORAKK.gauntlet ~= true)) then
		Unit:DestroyCustomWaypointMap()
		Unit:RemoveAIUpdateEvent()
		for k,v in pairs(amani_adds["warriors"]) do
			if(v == Unit) then
				table.remove(amani_adds["warriors"],k)
			end
		end
	end
end

function AmaniEagle_OnSpawn(Unit)
	table.insert(amani_adds["eagles"],Unit)
	if(allowtempest == true) then
		Unit:ModifySpeed(20)
		Unit:CreateWaypoint(1, 284.307404+(math.random(3)*math.cos(math.random(20, 60))), 1379.991211+(math.random(3)*math.sin(math.random(20, 60))), 49.321771, Unit:GetO(), 500, 256, 0)
		Unit:CreateWaypoint(2, 228.352188+(math.random(3)*math.cos(math.random(20, 60))), 1374.711426+(math.random(3)*math.sin(math.random(20, 60))), 46.888203, Unit:GetO(), 500, 256, 0)
		Unit:CreateWaypoint(3, 228.005325+(math.random(3)*math.cos(math.random(20, 60))), 1435.453491+(math.random(3)*math.sin(math.random(20, 60))), 26.726126, Unit:GetO(), 500, 256, 0)
		Unit:CreateWaypoint(4, 229.025361+(math.random(3)*math.cos(math.random(20, 60))), 1465.758911+(math.random(3)*math.sin(math.random(20, 60))), 25.916751, Unit:GetO(), 500, 256, 0)
		Unit:MoveToWaypoint(1)
		Unit:DisableRespawn(1)
	end
end

function AmaniEagle_OnReachWp(Unit,null,null,wp)
	if(wp == 1) then
		Unit:MoveToWaypoint(2)
	elseif(wp == 2) then
		Unit:MoveToWaypoint(3)
	elseif(wp == 3) then
		Unit:MoveToWaypoint(4)
	elseif(wp == 4) then
		Unit:RemoveFromWorld()
	end
end

function AmaniEagle_OnCombat(Unit, event, pMisc)
	Unit:DestroyCustomWaypointMap()
	Unit:StopMovement(100)
	Unit:RegisterEvent("AmaniEagle_Abilities", 7000, 1)
end

function AmaniEagle_OnWipe(Unit)
	Unit:DestroyCustomWaypointMap()
	Unit:RemoveEvents()
	Unit:RemoveFromWorld()
end

function AmaniEagle_OnDeath(Unit)
	Unit:DestroyCustomWaypointMap()
	Unit:RemoveEvents()
	for k,v in pairs(amani_adds["eagles"]) do
		if(v == Unit) then
			table.remove(amani_adds["eagles"],k)
		end
	end
end

function AmaniEagle_Abilities(Unit)
	local tank = Unit:GetMainTank()
	if((Unit:IsAlive() == true) and (type(tank) == "userdata") and (tank:IsAlive()) and (Unit:GetDistance(tank) <= 10)) then
		Unit:FullCastSpellOnTarget(43517,tank) --talon
		Unit:RegisterEvent("AmaniEagle_Abilities", 7000, 1)
	elseif((Unit:IsAlive() == true) and (type(tank) ~= "userdata")) then
		Unit:RegisterEvent("AmaniEagle_Abilities", 2000, 1)
	end
end

RegisterUnitEvent(amani_warrior, 18, "AmaniWarrior_OnSpawn")
RegisterUnitEvent(amani_eagle, 18, "AmaniEagle_OnSpawn")
RegisterUnitEvent(amani_warrior, 1,"AmaniWarrior_OnCombat")
RegisterUnitEvent(amani_eagle, 1, "AmaniEagle_OnCombat")
RegisterUnitEvent(amani_warrior, 2,"AmaniWarrior_OnWipe")
RegisterUnitEvent(amani_warrior, 4, "AmaniWarrior_OnDeath")
RegisterUnitEvent(amani_eagle, 2, "AmaniEagle_OnWipe")
RegisterUnitEvent(amani_eagle, 4,"AmaniEagle_OnDeath")
RegisterUnitEvent(amani_warrior, 19, "AmaniWarrior_OnReachWp")
RegisterUnitEvent(amani_eagle, 19, "AmaniEagle_OnReachWp")
RegisterUnitEvent(amani_warrior,21,"AmaniWarrior_Abilities")

function AmaniProtector_OnCombat(Unit)
	Unit:RegisterEvent("AmaniProtector_Abilities", 10000, 0)
end

function AmaniProtector_OnWipe(Unit)
	Unit:RemoveEvents()
end

function AmaniProtector_OnDeath(Unit)
	Unit:RemoveEvents()
end

function AmaniProtector_Abilities(Unit)
	local tank = Unit:GetMainTank()
	if((math.random(3) == 1) and (type(tank) == "userdata") and (tank:IsAlive() == true)) then
		if(Unit:IsAlive() == true) then
			Unit:FullCastSpellOnTarget(15496, tank)
		end
	elseif((math.random(3) == 2) and (type(tank) == "userdata") and (tank:IsAlive() == true)) then
		if(Unit:IsAlive() == true) then
			Unit:FullCastSpellOnTarget(43529, tank)
		end
	elseif(math.random(3) == 3) then
		if((Unit:IsAlive() == true) and (tank:IsAlive() == true)) then
			local tbl = Unit:GetInRangePlayers()
			local movplayers = {}
			for k,v in pairs(tbl) do
				if((v:IsAlive()) and (v:IsMoving() == true) and (v:GetDistance(v) <= 10)) then
					table.insert(movplayers,v)
				end
			end
			if(table.getn(movplayers) ~= 0) then
				Unit:FullCastSpell(43530)
			else
				AmaniProtector_Abilities(Unit)
			end
		end
	end
end

RegisterUnitEvent(amani_protector, 1, "AmaniProtector_OnCombat")
RegisterUnitEvent(amani_protector, 2, "AmaniProtector_OnWipe")
RegisterUnitEvent(amani_protector, 4, "AmaniProtector_OnDeath")

function AmaniWindWalker_OnCombat(Unit)
	Unit:RegisterEvent("AmaniWindWalker_Abilities", 5000, 1)
	Unit:RegisterAIUpdateEvent(2000)
end

function AmaniWindWalker_OnWipe(Unit)
	Unit:RemoveEvents()
end

function AmaniWindWalker_OnDeath(Unit)
	Unit:RemoveEvents()
end

function AmaniWindWalker_HealAI(Unit)
	local allies = Unit:GetInRangeFriends()
	local healtable = {}
	table.insert(allies,Unit)
	for k,v in pairs(allies) do
		if((type(v) == "userdata") and (v:GetHealthPct() <= 50)) then
			table.insert(healtable,v)
			if(Unit:GetHealthPct() <= 50) then
				table.insert(healtable,Unit)
			end
		end
	end
	if(table.getn(healtable) >= 1) then
		local healtar = healtable[math.random(1,table.getn(healtable))]
		if((type(healtar) == "userdata") and (healtar:IsAlive() == true)) then
			if(healtar == Unit) then
				Unit:FullCastSpell(43527)
			else
				Unit:FullCastSpellOnTarget(43527,healtar)				
			end
		end
	end
end

function AmaniWindWalker_Abilities(Unit)
	local tank = Unit:GetMainTank()
	if((math.random(2) == 1) and (type(tank) == "userdata") and (tank:IsAlive())) then
		local plrs = Unit:GetInRangePlayers()
		local movplrs = {}
		for k,v in pairs(plrs) do
			if((type(v) == "userdata") and (v:IsAlive() == true) and (v:IsMoving() == true)) then
				table.insert(movplrs, v)
			end
		end
		if(table.getn(movplrs) ~= 0) then
			local freezetar = movplrs[math.random(1,table.getn(movplrs))]
			if((type(freezetar) == "userdata") and (freezetar:IsAlive() == true)) then
				Unit:FullCastSpellOnTarget(43524, freezetar)
				Unit:RegisterEvent("AmaniWindWalker_Abilities", 5000, 1)
			end
		else
			Unit:FullCastSpellOnTarget(43524, tank)
			Unit:RegisterEvent("AmaniWindWalker_Abilities", 2000, 1)
		end
	elseif((math.random(2) == 2) and (type(tank) == "userdata") and (tank:IsAlive() == true)) then
		local plrs = Unit:GetInRangePlayers()
		local besttar = {}
		for k,v in pairs(plrs) do
			if((type(v) == "userdata") and (v:IsAlive()) and (v:GetHealthPct() <= 50)) then
				table.insert(besttar,v)
			end
		end
		if table.getn(besttar) ~= 0 then
			local besttarget = besttar[math.random(1,table.getn(besttar))]
			if((type(besttarget) == "userdata") and (besttarget:IsAlive()) and (besttarget ~= tank)) then
				Unit:FullCastSpellOnTarget(43526, besttarget)
				Unit:RegisterEvent("AmaniWindWalker_Abilities", 10000, 1)
			end
		else
			Unit:FullCastSpellOnTarget(43526, tank)
			Unit:RegisterEvent("AmaniWindWalker_Abilities", 10000, 1)
		end
	end
end

RegisterUnitEvent(amani_windwalker, 1, "AmaniWindWalker_OnCombat")
RegisterUnitEvent(amani_windwalker, 2, "AmaniWindWalker_OnWipe")
RegisterUnitEvent(amani_windwalker, 4, "AmaniWindWalker_OnDeath")

function Halazzi_OnSpawn(Unit)
	local args = getvars(Unit)
	if((args == nil) or (args.HALAZZI == nil)) then
		setvars(Unit,{HALAZZI = {
		m_phase = 0,
		merge = true,
		halazzihp = 0,
		maxhp = 0,
		lynxptr = nil,
		halazziptr = nil,
		splits = 0,
		}})
	end
end

function Halazzi_OnCombat(Unit)
	local args = getvars(Unit)
	args.HALAZZI.halazziptr = Unit
	args.HALAZZI.maxhp = Unit:GetUInt32Value(UnitField.Unit_FIELD_MAXHEALTH);
	args.HALAZZI.m_phase = 1
	Halazzi_PhaseCheck(Unit)
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Get on your knees and bow to da fang and claw!")
	Unit:PlaySoundToSet(12020)
end

function Halazzi_OnKillPlayer(Unit,event,mTarget)
	if(type(mTarget) == "userdata") then
		local choice = math.random(1,2)
		if(choice == 1) then
			Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "You cant fight da power...")
			Unit:PlaySoundToSet(12026)
		elseif(choice == 2) then
			Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "You all gonna fail...")
			Unit:PlaySoundToSet(12027)
		end
	end
end

function Halazzi_OnWipe(Unit)
	Halazzi_SetForm(Unit,"LYNX")
	Unit:RemoveEvents()
	Unit:RemoveAIUpdateEvent()
end

function Halazzi_OnDeath(Unit)
	Halazzi_SetForm(Unit,"LYNX")
	Unit:RemoveEvents()
	Unit:RemoveAIUpdateEvent()
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Chaga... choka'jinn.")
	Unit:PlaySoundToSet(12028)
end

function Halazzi_AIUpdate(Unit)
	local args = getvars(Unit)
	local hp = Unit:GetHealthPct()
	if((hp <= 75) and (hp > 50) and (args.HALAZZI.m_phase ~= 2) and (args.HALAZZI.splits == 0) and (args.HALAZZI.merge == true)) then
		Unit:RemoveEvents()
		args.HALAZZI.m_phase = 2
		args.HALAZZI.splits = 1
		args.HALAZZI.merge = false
		Halazzi_Split(Unit)
		Halazzi_PhaseCheck(Unit)
	elseif((hp <= 50) and (hp > 25) and (args.HALAZZI.m_phase ~= 2) and (args.HALAZZI.splits == 1) and (args.HALAZZI.merge == true)) then
		Unit:RemoveEvents()
		args.HALAZZI.m_phase = 2
		args.HALAZZI.splits = 2
		args.HALAZZI.merge = false
		Halazzi_Split(Unit)
		Halazzi_PhaseCheck(Unit)
	elseif((hp <= 25) and (hp > 20) and (args.HALAZZI.m_phase ~= 2) and (args.HALAZZI.splits == 2) and (args.HALAZZI.merge == true)) then
		Unit:RemoveEvents()
		args.HALAZZI.m_phase = 2
		args.HALAZZI.splits = 3
		args.HALAZZI.merge = false
		Halazzi_Split(Unit)
		Halazzi_PhaseCheck(Unit)
	elseif((hp <= 20) and (hp > 10) and (args.HALAZZI.m_phase ~= 3) and (args.HALAZZI.splits == 3) and (args.HALAZZI.merge == true)) then
		Unit:RemoveEvents()
		args.HALAZZI.merge = true
		args.HALAZZI.m_phase = 3
		Halazzi_PhaseCheck(Unit)
	end
	if((args.HALAZZI.m_phase == 2) and (args.HALAZZI.merge == false) and (hp <= 20)) then
		args.HALAZZI.merge = true
		args.HALAZZI.m_phase = 1
		Halazzi_Split(Unit)
		Halazzi_PhaseCheck(Unit)
	end
end

function Halazzi_SaberSlash(Unit)
	local tank = Unit:GetMainTank()
	if(type(tank) == "userdata") then
		local choice = math.random(1,2)
		if(choice == 1) then
			Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Me gonna carve ya now!")
			Unit:PlaySoundToSet(12023)
		elseif(choice == 2) then
			Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "You gonna leave in pieces!")
			Unit:PlaySoundToSet(12024)
		end
		Unit:FullCastSpellOnTarget(43267, tank)
		Unit:RegisterEvent("Halazzi_SaberSlash", math.random(20000,30000), 1)
	end
end

function Halazzi_ShockSpells(Unit)
	local args = getvars(Unit)
	if(args.HALAZZI.merge ~= true) then
		return
	end
	local rand = math.random(1,2)
	local plr = Unit:GetRandomPlayer(0)
	if(type(plr) == "userdata") then
		if(rand == 1) then
			Unit:FullCastSpellOnTarget(43303, plr)
		elseif(rand == 2) then
			Unit:FullCastSpellOnTarget(43305, plr)
		end
		Unit:RegisterEvent("Halazzi_ShockSpells", math.random(10000,20000), 1)
	end
end

function Halazzi_CorruptedTotem(Unit)
	local totem = Unit:SpawnCreature(24224, Unit:GetX()+math.cos(40,60)*3, Unit:GetY()+math.sin(40,60)*3, Unit:GetZ(), Unit:GetO(), 14, 20000)
	totem:AttackReaction(Unit:GetNextTarget(), 1, 0)
	Unit:RegisterEvent("Halazzi_CorruptedTotem", math.random(15000,20000), 1)
end

function Halazzi_PeriodicEnrage(Unit)
	local args = getvars(Unit)
	Unit:FullCastSpell(43139)
	Unit:RegisterEvent("Halazzi_PeriodicEnrage", math.random(10000,15000), 1)
end

function Halazzi_Split(Unit)
	local args = getvars(Unit)
	if(args.HALAZZI.merge == false) then
		Halazzi_SetForm(Unit, "TROLL")
		Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "I fight wit' untamed spirit...")
		Unit:PlaySoundToSet(12021)
		args.HALAZZI.halazzihp = Unit:GetHealth()
		Unit:SetUInt32Value(UnitField.Unit_FIELD_MAXHEALTH, 400000)
		args.HALAZZI.lynxptr = Unit:SpawnCreature(24143, Unit:GetX()+math.cos(20,30)*3, Unit:GetY()+math.sin(20,40)*3, Unit:GetZ(), Unit:GetO(), Unit:GetUInt32Value(UnitField.Unit_FIELD_FACTIONTEMPLATE), 0)
		args.HALAZZI.lynxptr:SetUInt32Value(UnitField.Unit_FIELD_MAXHEALTH, 200000)
		args.HALAZZI.lynxptr:AttackReaction(Unit:GetNextTarget(), 1, 0)
		Unit:FullCastSpell(44054)
	elseif(args.HALAZZI.merge == true) then
		Halazzi_SetForm(Unit, "LYNX")
		Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Spirit, come back to me!")
		Unit:PlaySoundToSet(12022)
		args.HALAZZI.lynxptr:RemoveFromWorld()
		Unit:SetUInt32Value(UnitField.Unit_FIELD_MAXHEALTH, args.HALAZZI.maxhp)
		Unit:SetUInt32Value(UnitField.Unit_FIELD_HEALTH, args.HALAZZI.halazzihp)
	end
end

function Halazzi_PhaseCheck(Unit)
	local args = getvars(Unit)
	if((args.HALAZZI.merge == false) and (args.HALAZZI.m_phase == 2)) then
		Unit:RegisterEvent("Halazzi_ShockSpells", math.random(10000,20000), 1)
		Unit:RegisterEvent("Halazzi_CorruptedTotem", math.random(10000,20000), 1)
		Unit:RegisterAIUpdateEvent(1000)
	elseif((args.HALAZZI.merge == true) and (args.HALAZZI.m_phase == 1)) then
		Unit:RegisterEvent("Halazzi_SaberSlash", math.random(20000,30000), 1)
		Unit:RegisterEvent("Halazzi_ShockSpells", math.random(10000,20000), 1)
		Unit:RegisterEvent("Halazzi_PeriodicEnrage", math.random(10000,15000), 1)
		Unit:RegisterAIUpdateEvent(1000)
	elseif((args.HALAZZI.merge == true) and (args.HALAZZI.m_phase == 3)) then
		Unit:RegisterEvent("Halazzi_SaberSlash", math.random(20000,30000), 1)
		Unit:RegisterEvent("Halazzi_ShockSpells", math.random(10000,20000), 1)
		Unit:RegisterEvent("Halazzi_PeriodicEnrage", math.random(10000,15000), 1)
		Unit:RegisterEvent("Halazzi_CorruptedTotem", math.random(10000,20000), 1)
		Unit:RegisterAIUpdateEvent(1000)
	end
end

function Halazzi_SetForm(Unit,val)
	if(val == "TROLL") then
		Unit:SetUInt32Value(UnitField.Unit_FIELD_DISPLAYID, 22348)
	elseif(val == "LYNX") then
		Unit:SetUInt32Value(UnitField.Unit_FIELD_DISPLAYID, 21632)
	end
end

function SpiritofLynx_OnCombat(Unit)
	Unit:RegisterEvent("SpiritofLynx_Abilities", 3000, 1)
	Unit:RegisterAIUpdateEvent(1000)
end

function SpiritofLynx_AIUpdate(Unit)
	local args = getvars(Unit)
	local hp = Unit:GetHealthPct()
	if((args.HALAZZI.m_phase == 2) and (hp <= 20) and (args.HALAZZI.merge == false)) then
		args.HALAZZI.merge = true
		args.HALAZZI.m_phase = 1
		Halazzi_Split(args.HALAZZI.halazziptr)
		Unit:RemoveAIUpdateEvent()
	end
end

function SpiritofLynx_Abilities(Unit)
	local tank = Unit:GetMainTank()
	local choice = math.random(1,2)
	if(type(tank) == "userdata") then
		if(choice == 1) then
			Unit:FullCastSpellOnTarget(43243, tank)
		elseif(choice == 2) then
			Unit:FullCastSpell(43290)
		end
		Unit:RegisterEvent("SpiritofLynx_Abilities", math.random(5000,10000), 1)
	end
end

function Halazzi_CorruptedTotemOnSpawn(Unit)
	Unit:SetCombatMeleeCapable(1)
	Unit:Root()
	Unit:RegisterEvent("Halazzi_CorruptedTotemLightning", 1000, 1)
end

function Halazzi_CorruptedTotemOnWipe(Unit)
	Unit:RemoveEvents()
	Unit:RemoveFromWorld()
end

function Halazzi_CorruptedTotemLightning(Unit)
	local plr = Unit:GetRandomPlayer(0)
	if(type(plr) == "userdata") then
		Unit:FullCastSpellOnTarget(43301, plr)
		Unit:RegisterEvent("Halazzi_CorruptedTotemLightning", 1000, 1)
	end
end

RegisterUnitEvent(23577, 1, "Halazzi_OnCombat")
RegisterUnitEvent(23577, 18, "Halazzi_OnSpawn")
RegisterUnitEvent(23577, 3, "Halazzi_OnKillPlayer")
RegisterUnitEvent(23577, 2, "Halazzi_OnWipe")
RegisterUnitEvent(23577, 4, "Halazzi_OnDeath")
RegisterUnitEvent(23577, 21, "Halazzi_AIUpdate")
RegisterUnitEvent(24143, 21, "SpiritofLynx_AIUpdate")
RegisterUnitEvent(24143, 1, "SpiritofLynx_OnCombat")
RegisterUnitEvent(24224, 18, "Halazzi_CorruptedTotemOnSpawn")
RegisterUnitEvent(24224, 4, "Halazzi_CorruptedTotemOnWipe")
RegisterUnitEvent(24224, 2, "Halazzi_CorruptedTotemOnWipe")

math.randomseed(os.time())

function npc_halazzi_event_combatenter(Unit, Event)
  local vars = getvars(Unit)
	vars.npc_halazzi.phase = 1
	vars.npc_halazzi.shift = 0
	vars.npc_halazzi.health.b = Unit:GetMaxHealth()
	vars.npc_halazzi.child  = nil
	vars.npc_halazzi.spells.saber  = math.random(7,10)
	vars.npc_halazzi.spells.frenzy = math.random(12,14)
	Unit:SendChatMessage(14, 0, "Get on your knees and bow to da fang and claw!")
	Unit:PlaySoundToSet(12020)
	Unit:RegisterEvent("npc_halazzi_event_pulse", 1000, 1)	
	setvars(Unit, vars)
end

function npc_halazzi_event_combatleave(Unit, Event)
  Unit:RemoveEvents()
end

function npc_halazzi_event_combatkills(Unit, Event)
	if(math.random(1,2) == 1) then
		Unit:SendChatMessage(14, 0, "You cant fight da power...")
		Unit:PlaySoundToSet(12026)
	else
		Unit:SendChatMessage(14, 9, "You all gonna fail...")
		Unit:PlaySoundToSet(12027)
	end
end

function npc_halazzi_event_combatdying(Unit, Event)
	Unit:SendChatMessage(14, 0, "Chaga... choka'jinn.")
	Unit:PlaySoundToSet(12028)
end

function npc_halazzi_event_spawn(Unit, Event)
	setvars(Unit, {npc_halazzi = {owner = Unit, child = nil, phase = 0, shift = 0, health = {a = 0, b = 0}, spells = {saber = -1, frenzy = -1, totem = -1, shock = -1}}})
end

--update pulse, happens every second
function npc_halazzi_event_pulse(Unit, Event)
	if(npc_halazzi_phase_checkupdate(Unit, Event) == true) then
		Unit:RegisterEvent("npc_halazzi_event_pulse", 1000, 1)
		return
	end
	npc_halazzi_phase_checkspells(Unit, Event)	
	Unit:RegisterEvent("npc_halazzi_event_pulse", 1000, 1)	
end

function npc_halazzi_phase_checkspells(Unit, Event)
  local vars = getvars(Unit)
	local done
	if(vars.npc_halazzi.phase == 1) then
		vars.npc_halazzi.spells.saber  = vars.npc_halazzi.spells.saber  - 1
		if(vars.npc_halazzi.spells.saber == 0) then
		  Unit:FullCastSpellOnTarget(43267, Unit:GetMainTank())
			if(math.random(1,4) <= 2) then
				Unit:SendChatMessage(14, 0, "Me gonna carve ya now!")
				Unit:PlaySoundToSet(12023)
			else
				Unit:SendChatMessage(14, 0, "You gonna leave in pieces!")
				Unit:PlaySoundToSet(12024)
			end
			done = false
			while done == false do
			  local rand = math.random(7, 10)
				if(vars.npc_halazzi.spells.frenzy ~= rand) then
				  vars.npc_halazzi.spells.saber = rand
					done = true
				end
			end
		end
		vars.npc_halazzi.spells.frenzy = vars.npc_halazzi.spells.frenzy - 1
		if(vars.npc_halazzi.spells.frenzy == 0) then
		  Unit:CastSpell(43139)
			done = false
			while done == false do
			  local rand = math.random(12, 14)
				if(vars.npc_halazzi.spells.saber ~= rand) then
					vars.npc_halazzi.spells.frenzy = rand
					done = true
				end
			end
		end
	end
	if(vars.npc_halazzi.phase == 2) then
	  vars.npc_halazzi.spells.totem = vars.npc_halazzi.spells.totem - 1
		if(vars.npc_halazzi.spells.totem == 0) then
		  Unit:SpawnCreature(24224, math.random(Unit:GetX() - 5, Unit:GetX() + 5), math.random(Unit:GetY() - 5, Unit:GetY() + 5), Unit:GetZ(), Unit:GetO(), 1890, 60000)
			done = false
			while done == false do
			  local rand = math.random(7, 9)
				if rand ~= vars.npc_halazzi.spells.shock then
				  vars.npc_halazzi.spells.totem = rand
				  done = true
				end
			end
		end
		vars.npc_halazzi.spells.shock = vars.npc_halazzi.spells.shock - 1
		if(vars.npc_halazzi.spells.shock == 0) then
		  if(math.random(100) < 60) then
			  Unit:FullCastSpellOnTarget(43303, Unit:GetRandomPlayer(0))
			else
			  Unit:FullCastSpellOnTarget(43305, Unit:GetRandomPlayer(0))
			end
			done = false
			while done == false do
			  local rand = math.random(6, 8)
				if(rand ~= vars.npc_halazzi.spells.totem) then
				  vars.npc_halazzi.spells.shock = rand
					done = true
				end
			end
		end
	end
	if(vars.npc_halazzi.phase == 3) then
		vars.npc_halazzi.spells.saber  = vars.npc_halazzi.spells.saber  - 1
		if(vars.npc_halazzi.spells.saber == 0) then
		  Unit:FullCastSpellOnTarget(43267, Unit:GetMainTank())
			if(math.random(1, 4) <= 2) then
			  Unit:SendChatMessage(14, 0, "Me gonna carve ya now!")
				Unit:PlaySoundToSet(12023)
			else
			  Unit:SendChatMessage(14, 0, "You gonna leave in pieces!")
				Unit:PlaySoundToSet(12024)
			end
			done = false
			while done == false do
			  local rand = math.random(7, 9)
				if(vars.npc_halazzi.spells.frenzy ~= rand) then
					vars.npc_halazzi.spells.saber = rand
					done = true
				end
			end
		end
		vars.npc_halazzi.spells.frenzy = vars.npc_halazzi.spells.frenzy - 1
		if(vars.npc_halazzi.spells.frenzy == 0) then
		  Unit:CastSpell(43139)
			done = false
			while done == false do
			  local rand = math.random(12, 14)
				if(vars.npc_halazzi.spells.saber ~= rand) then
					vars.npc_halazzi.spells.frenzy = rand
					done = true
				end
			end
		end
	  vars.npc_halazzi.spells.totem = vars.npc_halazzi.spells.totem - 1
		if(vars.npc_halazzi.spells.totem == 0) then
		  Unit:SpawnCreature(24224, math.random(Unit:GetX() - 5, Unit:GetX() + 5), math.random(Unit:GetY() - 5, Unit:GetY() + 5), Unit:GetZ(), Unit:GetO(), 1890, 60000)
			done = false
			while done == false do
			  local rand = math.random(9, 11)
				if(rand ~= vars.npc_halazzi.spells.shock) then
					vars.npc_halazzi.spells.totem = rand
					done = true
				end
			end
		end
	end
	setvars(Unit, vars)
end

function npc_halazzi_phase_checkupdate(Unit, Event)
local vars    = getvars(Unit)
local phase   = vars.npc_halazzi.phase
local shift   = vars.npc_halazzi.shift
local health  = Unit:GetHealthPct()
local health2 = 100
	if(phase == 1) and (health < 76) and (shift == 0 ) or (phase == 1) and (health < 51) and (shift == 1) or (phase == 1) and (health < 26) and (shift == 2) then
		vars.npc_halazzi.phase        = 2
		vars.npc_halazzi.shift        = vars.npc_halazzi.shift + 1
		vars.npc_halazzi.health.a     = Unit:GetHealth()
		vars.npc_halazzi.spells.totem = math.random(2, 4)
		vars.npc_halazzi.spells.shock = math.random(6, 8)
		Unit:SetHealth(400000)
		Unit:SetMaxHealth(400000)
		Unit:SendChatMessage(14, 0, "I fight wit' untamed spirit...")
		Unit:PlaySoundToSet(12021)
		Unit:SetModel(22309)
		Unit:SpawnCreature(24143, Unit:GetX() - 5, Unit:GetY() - 5, Unit:GetZ(), Unit:GetO(), 1890, 0)
		Unit:CastSpell(44054)
		setvars(Unit, vars)
		return true
	end
	if(vars.npc_halazzi.child ~= nil) then
		health2 = vars.npc_halazzi.child:GetHealthPct()
	end
	if((phase == 2) and (health < 21)) or ((phase == 2) and (health2 < 11)) then
		if(vars.npc_halazzi.shift == 3) then
			vars.npc_halazzi.phase = 3
			vars.npc_halazzi.spells.saber  = math.random(7, 10)
			vars.npc_halazzi.spells.enrage = math.random(12, 14)
			vars.npc_halazzi.spells.totem  = math.random(4,  6)
		else
			vars.npc_halazzi.phase = 1
			vars.npc_halazzi.spells.saber  = math.random(7, 10)
			vars.npc_halazzi.spells.enrage = math.random(12, 14)
		end
		Unit:SendChatMessage(14, 0, "Spirit, come back to me!")
		Unit:PlaySoundToSet(12022)
		vars.npc_halazzi.child:Despawn(1, 0)
		vars.npc_halazzi.child = nil
		Unit:SetMaxHealth(vars.npc_halazzi.health.b)
		Unit:SetHealth(vars.npc_halazzi.health.a)
		Unit:SetModel(21632)
		setvars(Unit, vars)
		return true
	end
	return false
end

RegisterUnitEvent(23577, 1, "npc_halazzi_event_combatenter")
RegisterUnitEvent(23577, 2, "npc_halazzi_event_combatleave")
RegisterUnitEvent(23577, 3, "npc_halazzi_event_combatkills")
RegisterUnitEvent(23577, 4, "npc_halazzi_event_combatdying")
RegisterUnitEvent(23577, 18, "npc_halazzi_event_spawn")

function npc_halazzilynxspirit_event_combatenter(Unit, Event)
	Unit:RegisterEvent("npc_halazzilynxspirit_event_flurry", math.random(3, 4) * 1000, 1)
end

function npc_halazzilynxspirit_event_combatleave(Unit, Event)
	Unit:RemoveEvents()
end

function npc_halazzilynxspirit_event_spawn(Unit, Event)
local vars = getvars(Unit)
	vars.npc_halazzi.child = Unit
	Unit:SetTauntedBy(vars.npc_halazzi.owner:GetMainTank())
	setvars(Unit, vars)
end

function npc_halazzilynxspirit_event_flurry(Unit, Event)
	Unit:CastSpell(43290)
	Unit:RegisterEvent("npc_halazzilynxspirit_event_shred", math.random(4, 5) * 1000, 1)
end

function npc_halazzilynxspirit_event_shred(Unit, Event)
	Unit:FullCastSpellOnTarget(43243, Unit:GetMainTank())
	Unit:RegisterEvent("npc_halazzilynxspirit_event_flurry", math.random(3, 4) * 1000, 1)
end

RegisterUnitEvent(24143, 1, "npc_halazzilynxspirit_event_combatenter")
RegisterUnitEvent(24143, 2, "npc_halazzilynxspirit_event_combatleave")
RegisterUnitEvent(24143, 18, "npc_halazzilynxspirit_event_spawn")

function npc_halazzitotem_event_combatenter(Unit, Event)
	Unit:RegisterEvent("npc_halazzitotem_event_castlightning", math.random(4, 6) * 1000, 1)
end

function npc_halazzitotem_event_combatleave(Unit, Event)
	Unit:RemoveEvents()
	Unit:Despawn(1, 1)
end

function npc_halazzitotem_event_spawn(Unit, Event)
	Unit:SetCombatCapable(1)
end

function npc_halazzitotem_event_castlightning(Unit, Event)
	Unit:FullCastSpellOnTarget(43301, Unit:GetClosestPlayer())
	Unit:RegisterEvent("npc_halazzitotem_event_castlightning", math.random(4, 6) * 1000, 1)
end

RegisterUnitEvent(24224, 1, "npc_halazzitotem_event_combatenter")
RegisterUnitEvent(24224, 2, "npc_halazzitotem_event_combatleave")
RegisterUnitEvent(24224, 18, "npc_halazzitotem_event_spawn")

local slither = 24242;
local thurg = 24241
local alyson = 24240
local fenstalker =24245
local lord_raadan =24243
local hex_lord = 24239;
local koragg = 24247;
local kroth = 24244
local darkheart = 24246

function HexLord_OnCombat(Unit)
	Unit:RemoveEvents();
	setvars(Unit,{First =false,HexLord_AddsTable = {},HexLord_PossibleAdds = {}})
	Unit:SendChatMessage(14, 0, "Da shadow gonna fall on you...");
	Unit:PlaySoundToSet(12041);
	Unit:RegisterEvent("HexLord_SpiritBoltsFirst", 30000, 1);
	Unit:RegisterEvent("HexLord_DrainPowerCheck", 11000, 1);
	Unit:RegisterEvent("HexLord_RandomSpawns", 50, 4)
	Unit:RegisterAIUpdateEvent(3000)
	local args = getvars(Unit)
	table.insert(args.HexLord_PossibleAdds, thurg)
	table.insert(args.HexLord_PossibleAdds, slither)
	table.insert(args.HexLord_PossibleAdds, lord_raadan)
	table.insert(args.HexLord_PossibleAdds, fenstalker)
	table.insert(args.HexLord_PossibleAdds, koragg)
	table.insert(args.HexLord_PossibleAdds, kroth)
	table.insert(args.HexLord_PossibleAdds, darkheart)
	table.insert(args.HexLord_PossibleAdds, alyson)
end

function HexLord_RandomSpawns(Unit)
	local args = getvars(Unit)
	local chosenadd = args.HexLord_PossibleAdds[math.random(1,table.getn(args.HexLord_PossibleAdds))]
	table.insert(args.HexLord_AddsTable,(Unit:SpawnCreature(chosenadd,Unit:GetX()+math.random(1,5),Unit:GetY(),Unit:GetZ(),Unit:GetO(),1890,0)))
	table.remove(args.HexLord_PossibleAdds, chosenadd)
end
	
function HexLord_SpiritBoltsFirst(Unit)
	local args = getvars(Unit)
	args.First=true
	setvars(Unit, args)
	Unit:FullCastSpell(43383)
	HexLord_FirstCheck(Unit)
end

function HexLord_FirstCheck(Unit)
	local args = getvars(Unit)
	if(args.First == true) then
		Unit:RegisterEvent("HexLord_SoulDrain", 13000, 1);
	end
end

function HexLord_SpiritBolts(Unit)
	Unit:SetAttackTimer(10000, 0)
	Unit:FullCastSpell(43383)
	Unit:SetCombatSpellCapable(1)
	Unit:RegisterEvent("HexLord_SpiritBoltsdeux",10000, 1)
	Unit:RegisterEvent("HexLord_SpiritBolts", 32000, 1)
end

function HexLord_SpiritBoltsdeux(Unit)
	Unit:SetCombatSpellCapable(0)
end

function HexLord_DrainPowerCheck(Unit)
	if(Unit:GetHealthPct() < 80) then
		HexLord_DrainPowerAI(Unit)
	else
		Unit:RegisterEvent("HexLord_DrainPowerCheck", 5000,1)
	end
end

function HexLord_DrainPowerAI(Unit)
	Unit:FullCastSpell(44131)
	for k,v in pairs(Unit:GetInRangePlayers()) do
		Unit:CastSpell(44132)
	end
	Unit:RegisterEvent("HexLord_DrainPowerAI", 60000, 1);
end

function HexLord_SoulDrain(Unit)
	Unit:RemoveEvents();
	if(Unit:GetRandomPlayer(0) == nil) then
		return
	end
	local Class = Unit:GetRandomPlayer(0):GetPlayerClass()
	if(Class == "Warrior") then
		HexLord_WarriorDrain(Unit)
	elseif(Class == "Paladin") then
		HexLord_PaladinDrain(Unit)
	elseif(Class == "Hunter") then
		HexLord_HunterDrain(Unit)
	elseif(Class == "Rogue") then
		HexLord_RogueDrain(Unit)
	elseif(Class == "Priest") then
		HexLord_PriestDrain(Unit)
	elseif(Class == "Shaman") then
		HexLord_ShamanDrain(Unit)
	elseif(Class == "Mage") then
		HexLord_MageDrain(Unit)
	elseif(Class == "Warlock") then
		HexLord_WarlockDrain(Unit)
	elseif(Class == "Druid") then
		HexLord_DruidDrain(Unit)
	end
	Unit:RegisterEvent("HexLord_DrainPowerCheck", 1000 ,1);
	Unit:RegisterEvent("HexLord_SpiritBolts", 32000, 1);
	Unit:RegisterEvent("HexLord_SoulDrain", 60000, 1);
end

function HexLord_OnDeath(Unit)
	Unit:RemoveEvents()
	Unit:SendChatMessage(14, 0, "Dis not da end for me...");
	Unit:PlaySoundToSet(12051)
	Unit:RemoveAIUpdateEvent()
end

function HexLord_OnKilledTarget(Unit)
	local deathcheck = math.random(1, 2);
	if (deathcheck == 1) then
		Unit:SendChatMessage(14, 0, "Azzaga choogo zinn!");
		Unit:PlaySoundToSet(12044);
	else
		Unit:SendChatMessage(14, 0, "Dis a nightmare ya don' wake up from!");
		Unit:PlaySoundToSet(12043);
	end
end

function HexLord_OnWipe(Unit)
	Unit:RemoveEvents()
	Unit:RemoveAIUpdateEvent()
	local args = getvars(Unit)
	for k,v in pairs(args.HexLord_AddsTable) do
		if v~= nil and v:IsInWorld() then
			v:RemoveFromWorld()
			k,v = nil, nil
		end
	end
end

RegisterUnitEvent(hex_lord, 1, "HexLord_OnCombat");
RegisterUnitEvent(hex_lord, 2, "HexLord_OnWipe");
RegisterUnitEvent(hex_lord, 3, "HexLord_OnKilledTarget");
RegisterUnitEvent(hex_lord, 4, "HexLord_OnDeath");
RegisterUnitEvent(hex_lord, 21, "HexLord_FirstCheck");

function HexLord_WarriorDrain(Unit)
	local Start = math.random(1,3);
	if(Start == 1) then
		HexLord_WarriorSpellReflect(Unit)
	elseif(Start == 2) then
		HexLord_WarriorWhirlWind(Unit)
	elseif(Start == 3) then
		HexLord_WarriorMortalStrike(Unit)
	end
	Unit:RegisterEvent("HexLord_WarriorDrain", 10000, 1);
end

function HexLord_WarriorSpellReflect(Unit)
	Unit:FullCastSpell(43443)
end

function HexLord_WarriorWhirlWind(Unit)
	Unit:SetAttackTimer(4000, 0)
	Unit:FullCastSpell(43442)
end

function HexLord_WarriorMortalStrike(Unit)
	if(Unit:GetMainTank() ~= nil) then
		Unit:FullCastSpellOnTarget(43441, Unit:GetMainTank())
	end
end

function HexLord_PaladinDrain(Unit)
	local Start = math.random(1,3);
	if(Start == 1) then
		HexLord_PaladinAoE(Unit)
	elseif(Start == 2) then
		HexLord_PaladinHLight(Unit)
	elseif(Start == 3) then
		HexLord_PaladinAvgWrath(Unit)
	end
	Unit:RegisterEvent("HexLord_PaladinDrain", 10000, 1);
end

function HexLord_PaladinAoE(Unit)
	Unit:FullCastSpell(43429)
end

function HexLord_PaladinHLight(Unit)
	Unit:SetAttackTimer(2500,0)
	Unit:FullCastSpell(43451)
end

function HexLord_PaladinAvgWrath(Unit)
	Unit:FullCastSpell(43430)
end

function HexLord_HunterDrain(Unit)
	local Start = math.random(1,3);
	if(Start == 1) then
		HexLord_HunterExpTrap(Unit)
	elseif(Start == 2) then
		HexLord_HunterFreezeTrap(Unit)
	elseif(Start == 3) then
		--HunterSnakeTrap(Hex,event)
	end
	Unit:RegisterEvent("HexLord_HunterDrain", 10000, 1);
end

function HexLord_HunterExpTrap(Unit)
	Unit:FullCastSpell(43444)
end

function HexLord_HunterFreezeTrap(Unit)
	Unit:FullCastSpell(43447)
end

--[[function HunterSnakeTrap(Hex, event)
	Hex:FullCastSpell(43449);
end]]

function HexLord_RogueDrain(Unit)
	local Start = math.random(1,3);
	if(Start == 1) then
		HexLord_RogueBlind(Unit)
	elseif(Start == 2) then
		HexLord_RogueSlicenDice(Unit)
	elseif(Start == 3) then
		HexLord_RogueWoundPoison(Unit)
	end
	Unit:RegisterEvent("HexLord_RogueDrain", 10000, 1);
end

function HexLord_RogueBlind(Unit)
	if(Unit:GetRandomPlayer(0) ~= nil) then
		Unit:FullCastSpellOnTarget(43433, Unit:GetRandomPlayer(0))
	end
end

function HexLord_RogueSlicenDice(Unit)
	Unit:FullCastSpell(43547)
end

function HexLord_RogueWoundPoison(Unit)
	if(Unit:GetRandomPlayer(0) ~= nil) then
		Unit:FullCastSpellOnTarget(39665, Unit:GetRandomPlayer(0))
	end
end

function HexLord_PriestDrain(Unit)
	local Start = math.random(1,6);
	if(Start == 1) then
		HexLord_PriestHeal(Unit)
	--elseif (Start == 2) then
	elseif(Start == 3) then
		HexLord_PriestMindBlast(Unit)
	elseif(Start == 4) then
		HexLord_PriestSWD(Unit)
	elseif(Start == 5) then
		HexLord_PriestPsychicScream(Unit)
	elseif(Start == 6) then
		HexLord_PriestPainSuppression(Unit)
	end
	Unit:RegisterEvent("HexLord_PriestDrain", 10000, 1);
end

function HexLord_PriestHeal(Unit)
	Unit:FullCastSpell(41372)
end

--[[function PriestMindControl(Hex, event)
	if(Unit:GetRandomPlayer(0) ~= nil) then
		Hex:FullCastSpellOnTarget(43550, Unit:GetRandomPlayer(0));
	end
end]]

function HexLord_PriestMindBlast(Unit)
	local plr = Unit:GetRandomPlayer(0)
	if(Unit:GetRandomPlayer(0) ~= nil) then
		Unit:SetAttackTimer(2500,0)
		Unit:FullCastSpellOnTarget(41374, Unit:GetRandomPlayer(0))
	end
end

function HexLord_PriestSWD(Unit)
	if(Unit:GetRandomPlayer(0) ~= nil) then
		Unit:FullCastSpellOnTarget(41375, Unit:GetRandomPlayer(0))
	end
end

function HexLord_PriestPsychicScream(Unit)
	if(Unit:GetRandomPlayer(0) ~= nil) then
		Unit:FullCastSpell(43442)
	end
end

function HexLord_PriestPainSuppression(Unit)
	Unit:FullCastSpell(44416)
end

function HexLord_ShamanDrain(Unit)
	local Start = math.random(1,3);
	if(Start == 1) then
		HexLord_ShamanHealWave(Unit)
	elseif(Start == 2) then
		HexLord_ShamanChainLight(Unit)
	elseif(Start == 3) then
		HexLord_ShamanFireNova(Unit)
	end
	Unit:RegisterEvent("HexLord_ShamanDrain", 10000, 1);
end

function HexLord_ShamanHealWave(Unit)
	Unit:SetAttackTimer(2500,0)
	Unit:FullCastSpell(43548)
end

function HexLord_ShamanChainLight(Unit)
	if(Unit:GetRandomPlayer(0) ~= nil) then
		Unit:SetAttackTimer(2500, 0)
		Unit:FullCastSpellOnTarget(43435, Unit:GetRandomPlayer(0))
	end
end

function HexLord_ShamanFireNova(Unit)
	--Unit:CastSpell(43436) Won't work, need a work around. --I dont Know if it work
	Unit:SpawnCreature(5879,Unit:GetX(),Unit:GetY(),Unit:GetZ(),Unit:GetO(),14, 5500)
end

function HexLord_FireNovaTotemDeath(Unit)
	Unit:RemoveAIUpdateEvent()
	Unit:RemoveFromWorld()
end

function HexLord_FireNovaTotem(Unit)
	local tbl = Unit:GetInRangeFriends()
	for k,v in pairs(tbl) do
		if(v:GetEntry() == hex_lord) then
			Unit:SetCombatCapable(1)
			Unit:WipeCurrentTarget()
			Unit:RegisterAIUpdateEvent(5000)
		end
		break
	end
end

function HexLord_FireNovaTotemBlast(Unit)
	Unit:FullCastSpell(23462)
	Unit:RemoveAIUpdateEvent()
	Unit:RemoveFromWorld()
end

RegisterUnitEvent(5879, 18, "HexLord_FireNovaTotem")
RegisterUnitEvent(5879, 21, "HexLord_FireNovaTotemBlast")
RegisterUnitEvent(5879, 4, "HexLord_FireNovaTotemDeath")

function HexLord_MageDrain(Unit)
	local Start = math.random(1,3);
	if(Start == 1) then
		HexLord_MageFireBall(Unit)
	elseif(Start == 2) then
		HexLord_MageFrostbolt(Unit)
	elseif(Start == 3) then
		HexLord_MageFrostNova(Unit)
	end
	Unit:RegisterEvent("HexLord_MageDrain", 10000, 1);
end

function HexLord_MageFireBall(Unit)
	if(Unit:GetRandomPlayer(0) ~= nil) then
		Unit:FullCastSpellOnTarget(41383, Unit:GetRandomPlayer(0))
	end
end

function HexLord_MageFrostbolt(Unit)
	if(Unit:GetRandomPlayer(0) ~= nil) then
		Unit:SetAttackTimer(2500, 0)
		Unit:FullCastSpellOnTarget(43428, Unit:GetRandomPlayer(0))
	end
end

function HexLord_MageFrostNova(Unit)
	if(Unit:GetRandomPlayer(0) ~= nil) then
		Unit:FullCastSpell(43426)
		local tbl = Unit:GetInRangePlayers()
		for k,v in pairs(tbl) do
			if(v:HasAura(43426) ~= true) then
				table.remove(tbl, k)
			end
		end
		local no = table.getn(tbl)
		if no ~= nil then
			local plr = tbl[math.random(1,no)]
			if((plr ~= nil) and (math.random(0,1) == 1)) then
				Unit:FullCastSpellOnTarget(43427, plr:GetGUID())
			end
		end
	end
end

function HexLord_WarlockDrain(Unit)
	local Start = math.random(1,3);
	if (Start == 1) then
		HexLord_WarlockCoD(Unit)
	elseif (Start == 2) then
		HexLord_WarlockRainOFire(Unit)
	elseif (Start == 3) then
		HexLord_WarlockUA(Unit)
	end
	Unit:RegisterEvent("HexLord_WarlockDrain", 10000, 1);
end

function HexLord_WarlockCoD(Unit)
	if(Unit:GetRandomPlayer(0) ~= nil) then
		Unit:FullCastSpellOnTarget(43439, Unit:GetRandomPlayer(0))
	end
end

function HexLord_WarlockRainOFire(Unit)
	if(Unit:GetRandomPlayer(0) ~= nil) then
		Unit:CastSpellAoF(Unit:GetRandomPlayer(0):GetX(), Unit:GetRandomPlayer(0):GetY(), Unit:GetRandomPlayer(0):GetZ(), 43440)
	end
end

function HexLord_WarlockUA(Unit)
	if(Unit:GetRandomPlayer(0) ~= nil) then
		Unit:FullCastSpellOnTarget(35183, Unit:GetRandomPlayer(0))
	end
end

function HexLord_DruidDrain(Unit)
	local Start = math.random(1,3);
	if(Start == 1) then
		HexLord_DruidLifeBloom(Unit)
	elseif(Start == 2) then
		HexLord_DruidThorns(Unit)
	elseif(Start == 3) then
		HexLord_DruidMoonFire(Unit)
	end
	Unit:RegisterEvent("HexLord_DruidDrain", 10000, 1);
end

function HexLord_DruidLifeBloom(Unit, Event)
	Unit:FullCastSpell(43421)
end

function HexLord_DruidThorns(Unit)
	Unit:FullCastSpell(43420);
end

function HexLord_DruidMoonFire(Unit)
	if(Unit:GetRandomPlayer(0) ~= nil) then
		Unit:FullCastSpellOnTarget(43545, Unit:GetRandomPlayer(0))
	end
end

function Slither_OnCombat(Unit)
	Unit:RegisterAIUpdateEvent(7000)
	local plr = Unit:GetRandomPlayer(0)
	if plr ~= nil then
		plr:AttackReaction(Unit, 1, 0)
	end
end

function Slither_AIUpdate(Unit)
	local plr = Unit:GetRandomPlayer(0)
	if plr ~= nil then
		Unit:FullCastSpellOnTarget(43579,plr)
	end
end

function Slither_OnDeath(Unit)
	Unit:RemoveAIUpdateEvent()
	local args = getvars(Unit)
	for k,v in pairs(args.HexLord_AddsTable) do
		if((v ~= nil) and (v == Unit)) then
			table.remove(args.HexLord_AddsTable, k)
		end
	end
end

RegisterUnitEvent(slither, 18, "Slither_OnCombat")
RegisterUnitEvent(slither, 21, "Slither_AIUpdate")
RegisterUnitEvent(slither, 4, "Slither_OnDeath")

function FenStalker_OnSpawn(Unit)
	Unit:RegisterAIUpdateEvent(10000)
	if(Unit:GetRandomPlayer(0) ~= nil) then
		Unit:GetRandomPlayer(0):AttackReaction(Unit, 1, 0)
	end
end

function FenStalker_AIUpdate(Unit)
	if(Unit:GetRandomPlayer(0) ~= nil) then
		Unit:FullCastSpellOnTarget(43586, Unit:GetRandomPlayer(0))
	end
end

function FenStalker_OnDeath(Unit,event)
	Unit:RemoveAIUpdateEvent()
	local args = getvars(Unit)
	for k,v in pairs(args.HexLord_AddsTable) do
		if((v~= nil) and (v == Unit)) then
			table.remove(args.HexLord_AddsTable, k)
		end
	end
end

RegisterUnitEvent(fenstalker, 18, "FenStalker_OnSpawn")
RegisterUnitEvent(fenstalker, 4, "FenStalker_OnDeath")
RegisterUnitEvent(fenstalker, 21, "FenStalker_AIUpdate")

function KoraggThurg_OnLoad(Unit)
	if(Unit:GetRandomPlayer(0) ~= nil) then
		Unit:GetRandomPlayer(0):AttackReaction(Unit, 1, 0)
	end
end
function KoraggThurg_OnDeath(Unit)
	local args = getvars(Unit)
	for k, v in pairs(args.HexLord_AddsTable) do
		if((v ~= nil) and (v == Unit)) then
			table.remove(args.HexLord_AddsTable, k)
		end
	end
end
RegisterUnitEvent(thurg, 18, "KoraggThurg_OnLoad")
RegisterUnitEvent(koragg, 18, "KoraggThurg_OnLoad")
RegisterUnitEvent(thurg, 4,"KoraggThurg_OnDeath")
RegisterUnitEvent(koragg,4,"KoraggThurg_OnDeath")


function Gazakroth_OnLoad(Unit,event)
	Unit:SetCombatCapable(1)
	Unit:RegisterAIUpdateEvent(2000)
	if(Unit:GetRandomPlayer(0) ~= nil) then
		Unit:GetRandomPlayer(0):AttackReaction(Unit, 1, 0)
	end
end

function Gazakroth_Fireball(Unit)
	if(Unit:GetRandomPlayer(0) ~= nil) then
		Unit:FullCastSpellOnTarget(43584, Unit:GetRandomPlayer(0))
	end
end

function Gazakroth_OnDeath(Unit)
	Unit:RemoveAIUpdateEvent()
	local args = getvars(Unit)
	for k,v in pairs(args.HexLord_AddsTable) do
		if v ~= nil and v == Unit then	
			table.remove(args.HexLord_AddsTable, k)
		end
	end
end

RegisterUnitEvent(kroth, 4, "Gazakroth_OnDeath")
RegisterUnitEvent(kroth, 18, "Gazakroth_OnLoad")
RegisterUnitEvent(kroth, 21, "Gazakroth_Fireball")

function LordRaadan_OnLoad(Unit, Event)
	Unit:RegisterAIUpdateEvent(7000)
	if(Unit:GetRandomPlayer(0) ~= nil) then
		Unit:GetRandomPlayer(0):AttackReaction(Unit, 1, 0)
	end
end

function LordRaadan_Spells(Unit, Event)
	if(Unit:GetRandomPlayer(0) ~= nil) then
		if(math.random(0,1) < 0.5) then
			Unit:CastSpell(43582)
		else
			Unit:CastSpell(43583)
		end
	end
end

function LordRaadan_OnDeath(Unit)
	Unit:RemoveAIUpdateEvent()
	local args = getvars(Unit)
	for k,v  in pairs(args.HexLord_AddsTable) do
		if(v == Unit) then
			table.remove(args.HexLord_AddsTable, k)
		end
	end
end

RegisterUnitEvent(lord_raadan, 4, "LordRaadan_OnDeath");
RegisterUnitEvent(lord_raadan, 18, "LordRaadan_OnLoad")
RegisterUnitEvent(lord_raadan, 21, "LordRaadan_Spells")

function Darkheart_OnSpawn(Unit, Event)
	Unit:RegisterAIUpdateEvent(10000)
	if(Unit:GetRandomPlayer(0) ~= nil) then
		Unit:GetRandomPlayer(0):AttackReaction(Unit, 1, 0)
	end
end

function Darkheartfear(Unit)
	if(Unit:GetRandomPlayer(0) ~= nil) then
		Unit:FullCastSpell(43590)
	end
end

function Darkheart_OnDeath(Unit)
	local args = getvars(Unit)
	for k,v in pairs(args.HexLord_AddsTable) do
		if(v == Unit) then
			table.remove(args.HexLord_AddsTable, k)
		end
	end
end

RegisterUnitEvent(darkheart, 18, "Darkheart_OnSpawn")
RegisterUnitEvent(darkheart, 21, "Darkheartfear")
RegisterUnitEvent(darkheart, 4, "Darkheart_OnDeath")

function Alyson(Unit,event)
	Unit:SetCombatCapable(1)
	Unit:WipeCurrentTarget()
	Unit:RegisterAIUpdateEvent(3000)
end

function Alyson_AIUpdate(Unit,event)
	if(table.getn(Unit:GetInRangeFriends()) ~= 0) then
		local healtar = Unit:GetInRangeFriends()[math.random(1,table.getn(Unit:GetInRangeFriends()))]
		if((healtar ~= nil) and (healtar:IsAlive())) then
			Unit:SetNextTarget(healtar)
			Unit:FullCastSpellOnTarget(43575, healtar:GetGUID());
		end
	end
end

function AlysonStop(Unit)
	Unit:RemoveAIUpdateEvent()
	local args = getvars(Unit)
	for k,v in pairs(args.HexLord_AddsTable) do
		if((v ~= nil) and (v == Unit)) then
			table.remove(args.HexLord_AddsTable, k)
		end
	end
end
			
RegisterUnitEvent(alyson, 4, "AlysonStop")
RegisterUnitEvent(alyson, 18, "Alyson")
RegisterUnitEvent(alyson, 21, "Alyson_AIUpdate")

function JanAlai_EggOnSpawn(Unit)
	local args = getvars(Unit)
	if((args ~= nil) and (type(args.JANALAI) == "table")) then
		if(Unit:CalcDistance(-34.049107,1212.935547,18.711393) <= 15) then
			for k,v in pairs(args.JANALAI.righteggs) do
				if(v == Unit) then
					table.remove(args.JANALAI.righteggs,k)
					break
				end
			end
			table.insert(args.JANALAI.righteggs,Unit)
		elseif(Unit:CalcDistance(-34.956776,1086.155762,18.712454) <= 15) then
			for k,v in pairs(args.JANALAI.lefteggs) do
				if(v == Unit) then
					table.remove(args.JANALAI.lefteggs,k)
					break
				end
			end
			table.insert(args.JANALAI.lefteggs,Unit)
		end
	else
		return
	end
end

function JanAlai_EggOnDeath(Unit)
	local args = getvars(Unit)
	for k,v in pairs(args.JANALAI.righteggs) do
		if(v == Unit) then
			table.remove(args.JANALAI.righteggs,k)
			Unit:RemoveFromWorld()
		end
	end
	for k,v in pairs(args.JANALAI.lefteggs) do
		if(v == Unit) then
			table.remove(args.JANALAI.lefteggs,k)
			Unit:RemoveFromWorld()
		end
	end
end

function JanAlai_OnSpawn(Unit)
	local args = getvars(Unit)
	if((args == nil) or (args.JANALAI == nil)) then
		setvars(Unit,{JANALAI = {
		lefteggs = {},
		righteggs = {},
		hatchcount = {},
		hatchdir = {},
		enrage = 18000,
		summontimer = 90,
		hardenrage = 36000,
		alleggs = false,
		firebombs = math.random(20,45),
		cancast = true,
		}})
	end
	local tbl = Unit:GetInRangeUnits()
	for k,v in pairs(tbl) do
		if(v:GetEntry() == 23817) then
			v:OnUnitEvent("JanAlai_EggOnSpawn",18,Unit,0)
		end
	end
end

function JanAlai_OnCombat(Unit)
	Unit:RegisterEvent("JanAlai_FlameBreath",math.random(10000,15000),1)
	Unit:RegisterAIUpdateEvent(1000)
	Unit:PlaySoundToSet(12031)
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"Spirits of da wind be your doom!")
	Unit:SetAIState(AI_State.STATE_ATTACKING)
end

function JanAlai_OnWipe(Unit)
	local tbl = Unit:GetInRangeFriends()
	for k,v in pairs(tbl) do
		if((type(v) == "userdata") and (v:GetEntry() == 23598)) then
			v:Die()
		end
	end
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_SAY,LangField.LANG_UNIVERSAL,"OnWipe")
	Unit:RemoveEvents()
	Unit:RemoveAIUpdateEvent()
end

function JanAlai_OnKillPlayer(Unit,event,mTarget)
	local rand = math.random(2)
	if(type(mTarget) ~= "userdata") then
		return
	end
	if(rand == 1) then
		Unit:PlaySoundToSet(12036)
		Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"It all be over now, mon!")
	elseif(rand == 2) then
		Unit:PlaySoundToSet(12037)
		Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"Tazaga-choo!")
	end
end

function JanAlai_OnDeath(Unit)
	local args = getvars(Unit)
	local tbl = Unit:GetInRangeFriends()
	for k,v in pairs(tbl) do
		if((type(v) == "userdata") and (v:GetEntry() == 23598)) then
			v:Die()
		end
	end
	Unit:PlaySoundToSet(12038)
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"Zul'jin... got a surprise for you...")
	Unit:RemoveEvents()
	Unit:RemoveAIUpdateEvent()
	args.JANALAI = nil
end
	
function JanAlai_CanCast(Unit)
	local args = getvars(Unit)
	if(args.JANALAI.cancast == false) then
		args.JANALAI.cancast = true
	end
end

function JanAlai_AIUpdate(Unit)
	local args = getvars(Unit)
	if(args.JANALAI.enrage > 0) then
		args.JANALAI.enrage = args.JANALAI.enrage -1
	end
	if(args.JANALAI.hardenrage > 0) then
		args.JANALAI.hardenrage = args.JANALAI.hardenrage -1
	end
	if(args.JANALAI.summontimer > 0) then
		args.JANALAI.summontimer = args.JANALAI.summontimer -1
	end
	if(args.JANALAI.firebombs > 0) then
		args.JANALAI.firebombs = args.JANALAI.firebombs -1
	end
	if(Unit:GetHealthPct() <= 35) then
		JanAlai_SpawnAllEggs(Unit)
		args.JANALAI.alleggs = true
	end
	if((Unit:GetHealthPct() <= 25) and (args.JANALAI.enrage < 0)) then
		args.JANALAI.enrage = 0
	end
	if((args.JANALAI.enrage == 0) and (args.JANALAI.cancast == true)) then
		Unit:FullCastSpell(44779)
		args.JANALAI.enrage = 18000
	elseif((args.JANALAI.enrage == 0) and (args.JANALAI.cancast == false)) then
		args.JANALAI.enrage = args.JANALAI.enrage +1
	end
	if((args.JANALAI.hardenrage == 0) and (args.JANALAI.cancast == true)) then
		Unit:FullCastSpell(48017)
		Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"You done run outta time!")
		Unit:PlaySoundToSet(12035)
		args.JANALAI.hardenrage = 36000
	elseif((args.JANALAI.hardenrage == 0) and (args.JANALAI.cancast == false)) then
		args.JANALAI.hardenrage = args.JANALAI.hardenrage +1
	end
	if((args.JANALAI.summontimer == 0) and (args.JANALAI.cancast == true)) then
		Unit:RegisterEvent("JanAlai_CanCast",2000,1)
		args.JANALAI.cancast = false
		JanAlai_SpawnHatchers(Unit)
		Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"Where ma hatcha? Get to work on dem eggs!")
		Unit:PlaySoundToSet(12033)
		args.JANALAI.summontimer = 90
	elseif((args.JANALAI.summontimer == 0) and (args.JANALAI.cancast == false)) then
		args.JANALAI.summontimer = args.JANALAI.summontimer +1
	end
	if((args.JANALAI.firebombs == 0) and (args.JANALAI.cancast == true)) then
		args.JANALAI.cancast = false
		JanAlai_FireBombsStart(Unit)
		args.JANALAI.firebombs = math.random(20,45)
	elseif((args.JANALAI.firebombs == 0) and (args.JANALAI.cancast == false)) then
		args.JANALAI.firebombs = args.JANALAI.firebombs +1
	end
end

function JanAlai_FireBombsStart(Unit)
	local args = getvars(Unit)
	Unit:RemoveEvents()
	local tbl = Unit:GetInRangePlayers()
	Unit:SetPosition(-34.416424,1149.927246,19.152180)
	Unit:MoveTo(Unit:GetX()+3,Unit:GetY()+2,Unit:GetZ(),Unit:GetO())
	Unit:FullCastSpell(33002)
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"I burn ya now!")
	Unit:PlaySoundToSet(12032)
	for k,v in pairs(tbl) do
		if(Unit:GetDistance(v) >= 10) then
			v:Teleport(Unit:GetMapId(),Unit:GetX(),Unit:GetY(),Unit:GetZ())
			v:FullCastSpell(33002)
		end
	end
	Unit:StopMovement(2000)
	Unit:RegisterEvent("JanAlai_FireBombFinish",1500,1)
end

function JanAlai_FireBombFinish(Unit)
	Unit:SetAttackTimer(5000,1)
	local rand = math.random(40,60)
	local valuetoadd = math.fmod(360,rand)
	local angle = valuetoadd
	local x,y = Unit:GetX(),Unit:GetY()
	while rand > 0 do
		x = math.cos(angle/math.pi)*math.random(2,20)
		y = math.sin(angle/math.pi)*math.random(2,20)
		Unit:SpawnCreature(23920,Unit:GetX()+x,Unit:GetY()+y,Unit:GetZ(),Unit:GetO(),14,0)
		angle = angle+valuetoadd
		rand = rand -1
	end
	Unit:SpawnCreature(70000,-53.389011,1149.769043,18.706196,0.022104,14,11000)
	Unit:SpawnCreature(70000,-33.579123,1175.321777,18.709953,4.702080,14,11000)
	Unit:SpawnCreature(70000,-11.923369,1149.371338,18.711403,3.076304,14,11000)
	Unit:SpawnCreature(70000,-34.317654,1125.089111,18.711653,1.509432,14,11000)
	Unit:RegisterAIUpdateEvent(1000)
	Unit:RegisterEvent("JanAlai_FlameBreath",math.random(10000,20000),1)
	Unit:RegisterEvent("JanAlai_CanCast",12000,1)
end
	
function JanAlai_FlameBreath(Unit)
	local args = getvars(Unit)
	if(args.JANALAI.cancast == true) then
		local plr = Unit:GetRandomPlayer(0)
		if(type(plr) == "userdata") then
			Unit:SetAttackTimer(3000,0)
			Unit:FullCastSpell(43140)
			Unit:RegisterEvent("JanAlai_FlameBreath",math.random(10000,20000),1)
		else
			print("FlameBreath expecting userdata type got "..tostring(type(plr)))
		end
	elseif args.JANALAI.cancast == false then
		Unit:RegisterEvent("JanAlai_FlameBreath",1000,1)
	end
end

function JanAlai_SpawnAllEggs(Unit)
	local args = getvars(Unit)
	if(args.JANALAI.alleggs == true) then
		return
	end
	Unit:PlaySoundToSet(12034)
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"I show you strength... in numbers. ")
	if(table.getn(args.JANALAI.righteggs) > 0) then
		for k,v in pairs(args.JANALAI.righteggs) do
			v:SpawnCreature(23598,v:GetX(),v:GetY(),v:GetZ(),v:GetO(),14,0)
			v:Die()
		end
	end
	if(table.getn(args.JANALAI.lefteggs) > 0) then
		for k,v in pairs(args.JANALAI.lefteggs) do
			v:SpawnCreature(23598,v:GetX(),v:GetY(),v:GetZ(),v:GetO(),14,0)
			v:Die()
		end
	end
end

function JanAlai_SpawnHatchers(Unit)
	Unit:SpawnCreature(23818,-72.722145,1157.109009,5.577517,Unit:GetO(),14,0)
	Unit:SpawnCreature(23818,-73.532204,1144.523315,5.521172,Unit:GetO(),14,0)
end

function JanAlai_HatcherOnSpawn(Unit)
	Unit:DisableRespawn() --disable respawns.
	local args = getvars(Unit)
	if(type(args.JANALAI) ~= "table") then
		return
	end
	local choice = math.random(1,2)
	if(choice == 1) then
		local guid = tostring(Unit:GetGUID())
		args.JANALAI.hatchdir[guid] = "left"
		args.JANALAI.hatchcount[guid] = 1
		Unit:SetAIState(AI_State.STATE_SCRIPTMOVE)
		Unit:SetAllowedToEnterCombat(0)
		Unit:SetCombatMeleeCapable(1)
		Unit:CreateWaypoint(1,-56.316452,1153.245605,18.732151,Unit:GetO(),0,256,0)
		Unit:CreateWaypoint(2,-33.359863,1173.800293,18.709618,1.563488,0,256,0)
		Unit:CreateWaypoint(3,-33.244007,1212.529663,18.709618,1.563488,0,256,0)
		Unit:SetMovementType(MovementType.MOVEMENTTYPE_FORWARDTHANSTOP)
	elseif(choice == 2) then
		local guid = tostring(Unit:GetGUID())
		args.JANALAI.hatchdir[guid] = "right"
		args.JANALAI.hatchcount[guid] = 1
		Unit:SetAllowedToEnterCombat(0)
		Unit:SetAIState(AI_State.STATE_SCRIPTMOVE)
		Unit:SetCombatMeleeCapable(1)
		Unit:CreateWaypoint(1,-56.194130,1148.044800,18.736595,Unit:GetO(),0,256,0)
		Unit:CreateWaypoint(2,-33.759674,1130.854126,18.710993,4.696612,0,256,0)
		Unit:CreateWaypoint(3,-34.495575,1086.375610,18.710993,4.601580,0,256,0)
		Unit:SetMovementType(MovementType.MOVEMENTTYPE_FORWARDTHANSTOP)
	end
end

function JanAlai_HatcherOnReachWp(Unit,event,null,wp)
	local args = getvars(Unit)
	local guid = tostring(Unit:GetGUID())
	if((wp == 3) and (args.JANALAI.hatchdir[guid] == "right") and (table.getn(args.JANALAI.righteggs) > 0)) then
		Unit:SetMovementType(MovementType.MOVEMENTTYPE_DONTMOVEWP)
		Unit:RegisterEvent("JanAlai_HatcherStartHatching",100,1)
	elseif((wp == 3) and (args.JANALAI.hatchdir[guid] == "left") and (table.getn(args.JANALAI.lefteggs) > 0)) then
		Unit:SetMovementType(MovementType.MOVEMENTTYPE_DONTMOVEWP)
		Unit:RegisterEvent("JanAlai_HatcherStartHatching",100,1)
	end
end

function JanAlai_HatcherOnWipe(Unit)
	Unit:RemoveEvents()
	Unit:Despawn(100,0)
end

function JanAlai_HatcherStartHatching(Unit)
	local guid = tostring(Unit:GetGUID())
	local args = getvars(Unit)
	if(type(args.JANALAI) ~= "table") then
		return
	end
	if((args.JANALAI.hatchdir[guid] == "right") and (table.getn(args.JANALAI.righteggs) > 0)) then
		Unit:FullCastSpell(43734)
		for i = 1,args.JANALAI.hatchcount[guid],1 do
			if(table.getn(args.JANALAI.righteggs) == 0) then
				break
			end
			if((table.getn(args.JANALAI.righteggs) == 0) and (table.getn(args.JANALAI.lefteggs) == 0)) then
				Unit:RemoveEvents()
				Unit:RemoveFromWorld()
				return
			end
			local chosenegg = args.JANALAI.righteggs[math.random(1,table.getn(args.JANALAI.righteggs))]
			if(type(chosenegg) == "userdata") then
				chosenegg:SpawnCreature(23598,chosenegg:GetX(),chosenegg:GetY(),chosenegg:GetZ(),chosenegg:GetO(),14,0)
				chosenegg:Die()
				args.JANALAI.hatchcount[guid] = args.JANALAI.hatchcount[guid]+1
			else
				print("chosenegg expected userdata type got "..tostring(type(chosenegg)))
			end
		end
		Unit:RegisterEvent("JanAlai_HatcherStartHatching",4000,1)
	elseif((args.JANALAI.hatchdir[guid] == "right") and (table.getn(args.JANALAI.righteggs) == 0) and (table.getn(args.JANALAI.lefteggs) > 0)) then
		Unit:DeleteAllWaypoints()
		Unit:CreateWaypoint(1,-33.393459,1204.481934,18.710060,Unit:GetO(),0,256,0)
		Unit:CreateWaypoint(2,-33.456745,1126.305542,18.711605,Unit:GetO(),0,256,0)
		Unit:CreateWaypoint(3,-34.605965,1086.905151,18.711605,Unit:GetO(),0,256,0)
		Unit:SetMovementType(MovementType.MOVEMENTTYPE_FORWARDTHANSTOP)
	elseif((args.JANALAI.hatchdir[guid] == "left") and (table.getn(args.JANALAI.lefteggs) > 0)) then
		Unit:FullCastSpell(43734)
		for i = 1,args.JANALAI.hatchcount[guid],1 do
			if(table.getn(args.JANALAI.lefteggs) == 0) then
				break
			end
			if((table.getn(args.JANALAI.lefteggs) == 0) and (table.getn(args.JANALAI.righteggs) == 0)) then
				Unit:RemoveEvents()
				Unit:RemoveFromWorld()
				return
			end
			local chosenegg = args.JANALAI.lefteggs[math.random(1,table.getn(args.JANALAI.lefteggs))]
			if(type(chosenegg) == "userdata") then
				chosenegg:SpawnCreature(23598,chosenegg:GetX(),chosenegg:GetY(),chosenegg:GetZ(),chosenegg:GetO(),14,0)
				chosenegg:Die()
				args.JANALAI.hatchcount[guid] = args.JANALAI.hatchcount[guid]+1
			else
				print("chosenegg expected userdata type got "..tostring(type(chosenegg)))
			end
		end
		Unit:RegisterEvent("JanAlai_HatcherStartHatching",4000,1)
	elseif((args.JANALAI.hatchdir[guid] == "left") and (table.getn(args.JANALAI.lefteggs) == 0) and (table.getn(args.JANALAI.righteggs) > 0)) then
		args.JANALAI.hatchdir[guid] = "right"
		Unit:DeleteAllWaypoints()
		Unit:CreateWaypoint(1,-34.605965,1086.905151,18.711605,Unit:GetO(),0,256,0)
		Unit:CreateWaypoint(2,-33.456745,1126.305542,18.711605,Unit:GetO(),0,256,0)
		Unit:CreateWaypoint(3,-33.393459,1204.481934,18.710060,Unit:GetO(),0,256,0)
		Unit:SetMovementType(MovementType.MOVEMENTTYPE_FORWARDTHANSTOP)
	end
end

function JanAlai_DragonHawkOnSpawn(Unit)
	Unit:DisableRespawn()
	local args = getvars(Unit)
	if(type(args.JANALAI) ~= "table") then 
		return
	end
	if(Unit:CalcDistance(-33.565357,1213.487183,18.709780) <= 15) then
		Unit:EnableFlight()
		Unit:CreateWaypoint(1,-33.028015,1203.774536,18.711439,Unit:GetO(),0,256,0)
		Unit:CreateWaypoint(2,-34.061836,1174.993042,18.711439,Unit:GetO(),0,256,0)
		Unit:CreateWaypoint(3,-34.545757+math.cos(math.random(20,40))*3,1149.110718+math.sin(math.random(20,40))*3,19.149067,Unit:GetO(),0,768,0)
		Unit:SetMovementType(MovementType.MOVEMENTTYPE_FORWARDTHANSTOP)
	elseif(Unit:CalcDistance(-34.956776,1086.155762,18.712454) <= 15) then
		Unit:EnableFlight()
		Unit:CreateWaypoint(1,-34.423855,1095.421143,18.711573,Unit:GetO(),0,256,0)
		Unit:CreateWaypoint(2,-33.870293,1126.015137,18.711357,Unit:GetO(),0,256,0)
		Unit:CreateWaypoint(3,-34.545757+math.cos(math.random(20,40))*3,1149.110718+math.sin(math.random(20,40))*3,19.149067,Unit:GetO(),0,768,0)
		Unit:SetMovementType(MovementType.MOVEMENTTYPE_FORWARDTHANSTOP)
	end
end

function JanAlai_DragonHawkOnReachWp(Unit,event,null,wp)
	if(wp == 3) then
		Unit:AttackReaction(Unit:GetClosestTarget(),1,0)
	end
end

function JanAlai_DragonHawkOnHit(Unit,event,mTarget)
	if(type(mTarget) == "userdata") then
		Unit:FullCastSpellOnTarget(43299,mTarget)
	end
end

function JanAlai_FireBombOnSpawn(Unit)
	Unit:DisableRespawn()
	Unit:SetCombatMeleeCapable(1)
	Unit:SetUInt32Value(UnitField.Unit_FIELD_FLAGS,UnitFieldFlags.Unit_FLAG_NOT_ATTACKABLE_9+UnitFieldFlags.Unit_FLAG_NOT_SELECTABLE)
	Unit:SetUInt32Value(UnitField.Unit_FIELD_DISPLAYID,20374)
	Unit:RegisterEvent("JanAlai_FireBombExplode",10000,1)
	Unit:RegisterEvent("JanAlai_SpellVisual",200,1)
end

function JanAlai_SpellVisual(Unit)
	Unit:FullCastSpell(42726)
end

function JanAlai_FireBombOnDeath(Unit)
	Unit:RemoveFromWorld()
end

function JanAlai_FireBombExplode(Unit)
	Unit:FullCastSpell(42630)
	Unit:Die()
end

function JanAlai_FireWallOnSpawn(Unit)
	Unit:DisableRespawn()
	Unit:SetCombatMeleeCapable(1)
	Unit:SetUInt32Value(UnitField.Unit_FIELD_FLAGS,UnitFieldFlags.Unit_FLAG_NOT_ATTACKABLE_9+UnitFieldFlags.Unit_FLAG_NOT_SELECTABLE)
	Unit:RegisterEvent("JanAlai_FireWallSpellVisual",200,1)
end

function JanAlai_FireWallSpellVisual(Unit)
	Unit:FullCastSpell(43113)
end

RegisterUnitEvent(23578, 18, "JanAlai_OnSpawn")
RegisterUnitEvent(23578, 1, "JanAlai_OnCombat")
RegisterUnitEvent(23578, 21, "JanAlai_AIUpdate")
RegisterUnitEvent(23578, 2, "JanAlai_OnWipe")
RegisterUnitEvent(23578, 3, "JanAlai_OnKillPlayer")
RegisterUnitEvent(23578, 4, "JanAlai_OnDeath")
RegisterUnitEvent(23817, 18, "JanAlai_EggOnSpawn")
RegisterUnitEvent(23817, 4, "JanAlai_EggOnDeath")
RegisterUnitEvent(23818, 18, "JanAlai_HatcherOnSpawn")
RegisterUnitEvent(23818, 19, "JanAlai_HatcherOnReachWp")
RegisterUnitEvent(23818, 4, "JanAlai_HatcherOnWipe")
RegisterUnitEvent(23818, 2, "JanAlai_HatcherOnWipe")
RegisterUnitEvent(23920, 18, "JanAlai_FireBombOnSpawn")
RegisterUnitEvent(23920, 4, "JanAlai_FireBombOnDeath")
RegisterUnitEvent(70000, 18, "JanAlai_FireWallOnSpawn")
RegisterUnitEvent(23598, 18, "JanAlai_DragonHawkOnSpawn")
RegisterUnitEvent(23598, 13, "JanAlai_DragonHawkOnHit")
RegisterUnitEvent(23598, 13, "JanAlai_DragonHawkOnReachWp")

--[[Nalorakk yells: Da Amani gonna rule again!
Nalorakk yells: Get da move on, guards! It be killin' time!
Nalorakk yells: Guards, go already! Who you more afraid of, dem... or me?
Nalorakk yells: I be losin' me patience! Go on: make dem wish dey was never born!
Nalorakk yells: I bring da pain!
Nalorakk yells: I smell you, strangers. Don't be delayin' your fate. Come to me now. I make your sacrifice quick.
Nalorakk yells: Mua-ha-ha!
Nalorakk yells: Ride now! Ride out dere and bring me back some heads!
Nalorakk yells: What could be better than servin' da bear spirit for eternity? Come closer now. Bring your souls to me!]]

function Nalorakk_OnCombat(Unit, event, miscUnit, misc)
	Unit:SendChatMessage(14, 0, "You be dead soon enough!")
	Unit:RegisterEvent("Nalorakk_Bear", 68000, 1)
	Unit:RegisterEvent("Nalorakk_Troll", 168000, 1)
	Unit:RegisterEvent("Nalorakk_Bear2", 291000, 1)
	Unit:RegisterEvent("Nalorakk_Troll2", 378000, 1)
	Unit:RegisterEvent("Nalorakk_Bear3", 487000, 1)
	Unit:RegisterEvent("Nalorakk_Troll3", 554000, 1)
	Unit:RegisterEvent("Nalorakk_Brutal_Swipe", 13000, 4)
	Unit:RegisterEvent("Nalorakk_Mangle", 29000, 2)
	Unit:RegisterEvent("Nalorakk_Surge", 21000, 3)
end

function Nalorakk_Bear(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Nalorakk_Lacerating_Slash", 28000, 3)
	Unit:RegisterEvent("Nalorakk_Rend_Flesh", 18000, 5)
	Unit:RegisterEvent("Nalorakk_Deafening_Roar", 24000, 4)
	Unit:SendChatMessage(14, 0, "You call on da beast, you gonna get more dan you bargain for!!")
	Unit:SetModel(21635)
	Unit:SetScale(2)
end

function Nalorakk_Bear2(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Nalorakk_Lacerating_Slash", 28000, 3)
	Unit:RegisterEvent("Nalorakk_Rend_Flesh", 18000, 4)
	Unit:RegisterEvent("Nalorakk_Deafening_Roar", 24000, 3)
	Unit:SendChatMessage(14, 0, "You call on da beast, you gonna get more dan you bargain for!!")
	Unit:SetModel(21635)
	Unit:SetScale(2)
end

function Nalorakk_Bear3(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Nalorakk_Lacerating_Slash", 28000, 2)
	Unit:RegisterEvent("Nalorakk_Rend_Flesh", 18000, 3)
	Unit:RegisterEvent("Nalorakk_Deafening_Roar", 24000, 2)
	Unit:SendChatMessage(14, 0, "You call on da beast, you gonna get more dan you bargain for!!")
	Unit:SetModel(21635)
	Unit:SetScale(2)
end

function Nalorakk_Troll(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Nalorakk_Brutal_Swipe", 13000, 9)
	Unit:RegisterEvent("Nalorakk_Mangle", 29000, 4)
	Unit:RegisterEvent("Nalorakk_Surge", 21000, 6)
	Unit:SendChatMessage(14, 0, "Make way for da Nalorakk!")
	Unit:SetModel(21631)
	Unit:SetScale(1)
end

function Nalorakk_Troll2(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Nalorakk_Brutal_Swipe", 13000, 8)
	Unit:RegisterEvent("Nalorakk_Mangle", 27000, 4)
	Unit:RegisterEvent("Nalorakk_Surge", 21000, 5)
	Unit:SendChatMessage(14, 0, "Make way for da Nalorakk!")
	Unit:SetModel(21631)
	Unit:SetScale(1)
end

function Nalorakk_Troll3(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Nalorakk_Brutal_Swipe", 13000, 0)
	Unit:RegisterEvent("Nalorakk_Mangle", 29000, 0)
	Unit:RegisterEvent("Nalorakk_Surge", 21000, 0)
	Unit:SendChatMessage(14, 0, "Make way for da Nalorakk!")
	Unit:SetModel(21631)
	Unit:SetScale(1)
end

function Nalorakk_Brutal_Swipe(pUnit, event, miscUnit, misc)
	pUnit:FullCastSpellOnTarget(42384, pUnit:GetMainTank())
end

function Nalorakk_Mangle(pUnit, event, miscUnit, misc)
	pUnit:FullCastSpellOnTarget(33987, pUnit:GetMainTank())
end

function Nalorakk_Surge(pUnit, event, miscUnit, misc)
	pUnit:FullCastSpellOnTarget(42402, pUnit:GetRandomPlayer(0))
end

function Nalorakk_Lacerating_Slash(pUnit, event, miscUnit, misc)
	pUnit:FullCastSpellOnTarget(42395, pUnit:GetMainTank())
end

function Nalorakk_Rend_Flesh(pUnit, event, miscUnit, misc)
	pUnit:FullCastSpellOnTarget(42397, pUnit:GetMainTank())
end

function Nalorakk_Deafening_Roar(pUnit, event, miscUnit, misc)
	pUnit:CastSpell(42398, pUnit:GetMainTank())
end

function Nalorakk_OnLeaveCombat(Unit, event, miscUnit, misc)
	Unit:RemoveEvents()
	Unit:SetModel(21631)
end

function Nalorakk_OnDied(Unit, event, miscUnit, misc)
	Unit:RemoveEvents()
	Unit:SendChatMessage(14, 0, "I... be waitin' on da udda side....")
end

function Nalorakk_OnKilledTarget(Unit, event, miscUnit, misc)
	Unit:SendChatMessage(14, 0, "Now whatchoo got to say?")
end

RegisterUnitEvent(23576, 1, "Nalorakk_OnCombat")
RegisterUnitEvent(23576, 2, "Nalorakk_OnLeaveCombat")
RegisterUnitEvent(23576, 3, "Nalorakk_OnKilledTarget")
RegisterUnitEvent(23576, 4, "Nalorakk_OnDied")

function Nalorakk_HandleGauntlet(Unit,event,pAggro)
	local args = getvars(Unit)
	local guard1,guard2,guard3;
	guard1 = Unit:GetCreatureNearestCoords(17.345501,1418.599976,12.047500,23582)
	guard2 = Unit:GetCreatureNearestCoords(19.094801,1420.569946,12.073000,23542)
	guard3 = Unit:GetCreatureNearestCoords(14.541300,1411.640015,12.082000,23542)
	if(type(guard1) == "userdata") then
		table.insert(args.NALORAKK.guardssent, guard1)
		guard1:CreateWaypoint(1, -0.238281, 1424.033174, 11.795671, Unit:GetO(), 0, 256, 0)
		guard1:CreateWaypoint(2, 2.186747, 1446.615479, 10.219745, Unit:GetO(), 0, 256, 0)
		guard1:CreateWaypoint(3, 11.535601, 1465.176514, 5.695276, Unit:GetO(), 0, 256, 0)
		guard1:CreateWaypoint(4, 40.059956, 1461.173462, 0.158273, Unit:GetO(), 0, 256, 0)
		guard1:CreateWaypoint(5, pAggro:GetX(), pAggro:GetY(), pAggro:GetZ(), Unit:GetO(), 0, 256, 0)
	end
	if(type(guard2) == "userdata") then
		table.insert(args.NALORAKK.guardssent, guard2)
		guard2:CreateWaypoint(1, -0.238281, 1424.033174, 11.795671, Unit:GetO(), 0, 256, 0)
		guard2:CreateWaypoint(2, 2.186747, 1446.615479, 10.219745, Unit:GetO(), 0, 256, 0)
		guard2:CreateWaypoint(3, 11.535601, 1465.176514, 5.695276, Unit:GetO(), 0, 256, 0)
		guard2:CreateWaypoint(4, 40.059956, 1461.173462, 0.158273, Unit:GetO(), 0, 256, 0)
		guard2:CreateWaypoint(5, pAggro:GetX(), pAggro:GetY(), pAggro:GetZ(), Unit:GetO(), 0, 256, 0)
	end
	if(type(guard3) == "userdata") then
		table.insert(args.NALORAKK.guardssent, guard3)
		guard3:CreateWaypoint(1, -0.238281, 1424.033174, 11.795671, Unit:GetO(), 0, 256, 0)
		guard3:CreateWaypoint(2, 2.186747, 1446.615479, 10.219745, Unit:GetO(), 0, 256, 0)
		guard3:CreateWaypoint(3, 11.535601, 1465.176514, 5.695276, Unit:GetO(), 0, 256, 0)
		guard3:CreateWaypoint(4, 40.059956, 1461.173462, 0.158273, Unit:GetO(), 0, 256, 0)
		guard3:CreateWaypoint(5, pAggro:GetX(), pAggro:GetY(), pAggro:GetZ(), Unit:GetO(), 0, 256, 0)
	end
	for k,v in pairs(args.NALORAKK.guardssent) do
		v:DisableRespawn()
		v:SetMovementType(MovementType.MOVEMENTTYPE_FORWARDTHANSTOP)
	end
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Get da move on, guards! It be killin' time! ")
	Unit:PlaySoundToSet(12066)
	Unit:Emote(25,0)
	args.NALORAKK.wavecount = 1
	Unit:SetCombatCapable(1)
	Unit:RegisterAIUpdateEvent(1000)
	Unit:RegisterEvent("Nalorakk_MoveToWaypoint", 200, 1)
end

RegisterUnitEvent(23582, 4, "Nalorakk_HandleGauntlet")

function Nalorakk_MoveToWaypoint(Unit)
	Unit:SetAllowedToEnterCombat(0)
	Unit:StopMovement(0)
	Unit:SetAIState(AI_State.STATE_SCRIPTMOVE)
	Unit:SetMovementType(MovementType.MOVEMENTTYPE_WANTEDWP)
	Unit:MoveToWaypoint(1)
end

RegisterUnitEvent(23581, 4, "Nalorakk_MoveToWaypoint")

function Nalorakk_OnReachWp(Unit,event,null,wp)
	local args = getvars(Unit)
	if(wp == 1) then
		args.NALORAKK.canmove = true
	elseif(wp == 2) then
		args.NALORAKK.canmove = true
	elseif(wp == 3) then
		args.NALORAKK.canmove = true
	elseif(wp == 4) then
		args.NALORAKK.canmove = true
	elseif(wp == 5) then
		args.NALORAKK.canmove = true
	elseif(wp == 6) then
		args.NALORAKK.canmove = true
	elseif(wp == 7) then
		args.NALORAKK.canmove = true
	end
end

RegisterUnitEvent(23522, 4, "Nalorakk_OnReachWp")

function Nalorakk_Gauntlet_AIUpdate(Unit)
	local args = getvars(Unit)
	local wp = Unit:GetCurrentWaypoint()
	local plr = Unit:GetClosestPlayer()
	if(args.NALORAKK.gauntlet == true) then
		if((wp == 1) and (table.getn(args.NALORAKK.guardssent) == 0) and (args.NALORAKK.canmove == true) and (Unit:GetDistance(plr) <= 50)) then
			Unit:SetMovementType(MovementType.MOVEMENTTYPE_WANTEDWP)
			Unit:MoveToWaypoint(wp+1)
			args.NALORAKK.canmove = false
		elseif((wp == 2) and (table.getn(args.NALORAKK.guardssent) == 0) and (args.NALORAKK.canmove == true) and (args.NALORAKK.wavecount == 1) and (Unit:GetDistance(plr) <= 100)) then
			local GetRandomAdd = function()
				local randtable = {23542,23581,24225}
				local randentry = randtable[math.random(1, table.getn(randtable))];
				return randentry
			end
			args.NALORAKK.wavecount = 2
			Unit:Emote(25,0)
			Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Guards, go already! Who you more afraid of, dem... or me?")
			Unit:PlaySoundToSet(12067)
			table.insert(args.NALORAKK.guardssent, Unit:SpawnCreature(GetRandomAdd(), -58.663849, 1423.417603, 27.307653, Unit:GetO(), 1890, 0))
			table.insert(args.NALORAKK.guardssent, Unit:SpawnCreature(GetRandomAdd(), -64.003815, 1422.918823, 27.303940, Unit:GetO(), 1890, 0))
			table.insert(args.NALORAKK.guardssent, Unit:SpawnCreature(GetRandomAdd(), -64.086685, 1417.019409, 27.303940, Unit:GetO(), 1890, 0))
			table.insert(args.NALORAKK.guardssent, Unit:SpawnCreature(GetRandomAdd(), -58.663849, 1423.417603, 27.307653, Unit:GetO(), 1890, 0))
			for k,v in pairs(args.NALORAKK.guardssent) do
				v:DisableRespawn()
				v:CreateWaypoint(1, -50.805714+math.cos(math.random(20, 40))*3, 1418.623657+math.sin(math.random(20, 40))*3, 27.179335, Unit:GetO(), 0, 256, 0)
				v:CreateWaypoint(2, -18.245897+math.cos(math.random(20, 40))*3, 1419.292480+math.sin(math.random(20, 40))*3, 12.730953, Unit:GetO(), 0, 256, 0)
				v:CreateWaypoint(3, -0.159436+math.cos(math.random(20, 40))*3, 1425.261841+math.sin(math.random(20, 40))*3, 11.777050, Unit:GetO(), 0, 256, 0)
				v:CreateWaypoint(4, 1.573907+math.cos(math.random(20, 40))*3, 1455.735229+math.sin(math.random(20, 40))*3, 9.368050, Unit:GetO(), 0, 256, 0)
				v:CreateWaypoint(5, 36.152603+math.cos(math.random(20, 40))*3, 1463.635864+math.sin(math.random(20, 40))*3, 1.008603, Unit:GetO(), 0, 256, 0)
				v:CreateWaypoint(6, 44.759525+math.cos(math.random(20, 40))*3, 1440.297729+math.sin(math.random(20, 40))*3, 0.188035, Unit:GetO(), 0, 256, 0)
				v:SetMovementType(MovementType.MOVEMENTTYPE_FORWARDTHANSTOP)
			end
			--Unit:SetAIState(AI_State.STATE_SCRIPTMOVE)
			Unit:SetMovementType(MovementType.MOVEMENTTYPE_WANTEDWP)
			Unit:MoveToWaypoint(wp+1)
			args.NALORAKK.canmove = false
		elseif((wp == 3) and (table.getn(args.NALORAKK.guardssent) == 0) and (args.NALORAKK.canmove == true) and (Unit:GetDistance(plr) <= 50)) then
			Unit:SetMovementType(MovementType.MOVEMENTTYPE_WANTEDWP)
			Unit:MoveToWaypoint(wp+1)
			args.NALORAKK.canmove = false
		elseif((wp == 4) and (table.getn(args.NALORAKK.guardssent) == 0) and (args.NALORAKK.canmove == true) and (Unit:GetDistance(plr) <= 50)) then
			Unit:SetMovementType(MovementType.MOVEMENTTYPE_WANTEDWP)
			Unit:MoveToWaypoint(wp+1)
			args.NALORAKK.canmove = false
		elseif((wp == 5) and (table.getn(args.NALORAKK.guardssent) == 0) and (args.NALORAKK.canmove == true) and (args.NALORAKK.wavecount == 2) and (Unit:GetDistance(plr) <= 50)) then
			args.NALORAKK.wavecount = 3
			Unit:Emote(25,0)
			Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"Ride now! Ride out dere and bring me back some heads!")
			Unit:PlaySoundToSet(12068)
			table.insert(args.NALORAKK.guardssent,Unit:SpawnCreature(23580, -86.509805, 1372.588745, 40.776428, Unit:GetO(), 1890, 0))
			table.insert(args.NALORAKK.guardssent,Unit:SpawnCreature(23580, -74.132805, 1372.929199, 40.763882, Unit:GetO(), 1890, 0))
			for k,v in pairs(args.NALORAKK.guardssent) do
				v:WipeCurrentTarget()
				v:DisableRespawn()
				v:CreateWaypoint(1, -79.662476+math.cos(math.random(20, 40))*3, 1377.553101+math.sin(math.random(20, 40))*3, 40.766491, Unit:GetO(), 0, 256, 0)
				v:CreateWaypoint(2, -79.885071+math.cos(math.random(20, 40))*3, 1394.976318+math.sin(math.random(20, 40))*3, 27.174772, Unit:GetO(), 0, 256, 0)
				v:CreateWaypoint(3, -80.066025+math.cos(math.random(20, 40))*3, 1417.475586+math.sin(math.random(20, 40))*3, 27.302441, Unit:GetO(), 0, 256, 0)
				v:CreateWaypoint(4, -50.805714+math.cos(math.random(20, 40))*3, 1418.623657+math.sin(math.random(20, 40))*3, 27.179335, Unit:GetO(), 0, 256, 0)
				v:CreateWaypoint(5, -18.245897+math.cos(math.random(20, 40))*3, 1419.292480+math.sin(math.random(20, 40))*3, 12.730953, Unit:GetO(), 0, 256, 0)
				v:CreateWaypoint(6, -0.159436+math.cos(math.random(20, 40))*3, 1425.261841+math.sin(math.random(20, 40))*3, 11.777050, Unit:GetO(), 0, 256, 0)
				v:CreateWaypoint(7, 1.573907+math.cos(math.random(20, 40))*3, 1455.735229+math.sin(math.random(20, 40))*3, 9.368050, Unit:GetO(), 0, 256, 0)
				v:CreateWaypoint(8, 36.152603+math.cos(math.random(20, 40))*3, 1463.635864+math.sin(math.random(20, 40))*3, 1.008603, Unit:GetO(), 0, 256, 0)
				v:CreateWaypoint(9, 44.759525+math.cos(math.random(20, 40))*3, 1440.297729+math.sin(math.random(20, 40))*3, 0.188035, Unit:GetO(), 0, 256, 0)
				v:SetMovementType(MovementType.MOVEMENTTYPE_FORWARDTHANSTOP)
				v:MoveToWaypoint(1)
			end
			--Unit:SetAIState(AI_State.STATE_SCRIPTMOVE)
			Unit:SetMovementType(MovementType.MOVEMENTTYPE_WANTEDWP)
			Unit:MoveToWaypoint(wp+1)
			args.NALORAKK.canmove = false
		elseif((wp == 6) and (table.getn(args.NALORAKK.guardssent) == 0) and (args.NALORAKK.canmove == true) and (Unit:GetDistance(plr) <= 50)) then
			Unit:SetMovementType(MovementType.MOVEMENTTYPE_WANTEDWP)
			Unit:MoveToWaypoint(wp+1)
			args.NALORAKK.canmove = false
		elseif((wp == 7) and (table.getn(args.NALORAKK.guardssent) == 0) and (args.NALORAKK.canmove == true )and (Unit:GetDistance(plr) <= 80) and (args.NALORAKK.wavecount == 3) and (args.NALORAKK.gauntlet == true)) then
			local GetRandomAdd = function()
				local randtable = {23542,23581,24225}
				local randentry = randtable[math.random(1, table.getn(randtable))];
				return randentry
			end
			Unit:SetMovementType(MovementType.MOVEMENTTYPE_WANTEDWP)
			Unit:MoveToWaypoint(wp+1)
			Unit:RemoveAIUpdateEvent()
			args.NALORAKK.wavecount = 4
			args.NALORAKK.gauntlet = false
			Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "I be losin' me patience! Go on: make dem wish dey was never born!")
			Unit:PlaySoundToSet(12069)
			Unit:Emote(25,0)
			table.insert(args.NALORAKK.guardssent, Unit:SpawnCreature(23580, -68.145760, 1317.887085, 41.172745, Unit:GetO(), 1890, 0))
			table.insert(args.NALORAKK.guardssent, Unit:SpawnCreature(23580, -94.955421, 1316.371460, 40.862305, Unit:GetO(), 1890, 0))
			table.insert(args.NALORAKK.guardssent, Unit:SpawnCreature(GetRandomAdd(), -90.012367, 1318.510010, 40.908222, Unit:GetO(), 1890, 0))
			table.insert(args.NALORAKK.guardssent, Unit:SpawnCreature(GetRandomAdd(), -79.167320, 1318.090676, 41.151787, Unit:GetO(), 1890, 0))
			for k,v in pairs(args.NALORAKK.guardssent) do
				v:DisableRespawn()
				v:CreateWaypoint(1, -80.717232+math.cos(math.random(20, 40))*3, 1343.276123+math.sin(math.random(20, 40))*3, 40.772724, Unit:GetO(), 0, 256, 0)
				v:CreateWaypoint(2, -79.662476+math.cos(math.random(20, 40))*3, 1377.553101+math.sin(math.random(20, 40))*3, 40.766491, Unit:GetO(), 0, 256, 0)
				v:CreateWaypoint(3, -79.885071+math.cos(math.random(20, 40))*3, 1394.976318+math.sin(math.random(20, 40))*3, 27.174772, Unit:GetO(), 0, 256, 0)
				v:CreateWaypoint(4, -80.066025+math.cos(math.random(20, 40))*3, 1417.475586+math.sin(math.random(20, 40))*3, 27.302441, Unit:GetO(), 0, 256, 0)
				v:CreateWaypoint(5, -50.805714+math.cos(math.random(20, 40))*3, 1418.623657+math.sin(math.random(20, 40))*3, 27.179335, Unit:GetO(), 0, 256, 0)
				v:CreateWaypoint(6, -18.245897+math.cos(math.random(20, 40))*3, 1419.292480+math.sin(math.random(20, 40))*3, 12.730953, Unit:GetO(), 0, 256, 0)
				v:CreateWaypoint(7, -0.159436+math.cos(math.random(20, 40))*3, 1425.261841+math.sin(math.random(20, 40))*3, 11.777050, Unit:GetO(), 0, 256, 0)
				v:CreateWaypoint(8, 1.573907+math.cos(math.random(20, 40))*3, 1455.735229+math.sin(math.random(20, 40))*3, 9.368050, Unit:GetO(), 0, 256, 0)
				v:CreateWaypoint(9, 36.152603+math.cos(math.random(20, 40))*3, 1463.635864+math.sin(math.random(20, 40))*3, 1.008603, Unit:GetO(), 0, 256, 0)
				v:CreateWaypoint(10, 44.759525+math.cos(math.random(20, 40))*3, 1440.297729+math.sin(math.random(20, 40))*3, 0.188035, Unit:GetO(), 0, 256, 0)
				v:SetMovementType(MovementType.MOVEMENTTYPE_FORWARDTHANSTOP)
			end
		end
	end
end

RegisterUnitEvent(23522, 4, "Nalorakk_Gauntlet_AIUpdate")

function Nalorakk_GuardsOnDeath(Unit)
	local args = getvars(Unit)
	if((type(args.NALORAKK) == "table") and (args.NALORAKK.gauntlet == true)) then
		for k,v in pairs(args.NALORAKK.guardssent) do
			if(v == Unit) then
				table.remove(args.NALORAKK.guardssent, k)
			end
		end
	end
end

function Nalorakk_OnSpawn(Unit)
	local args = getvars(Unit)
	if((args == nil) or (args.NALORAKK == nil)) then
		setvars(Unit, {NALORAKK = {
		guardssent = {},
		gauntlet = true,
		wavecount = 0,
		currentform = "TROLL",
		enrage = 600,
		canmove = false,
		} })
		Unit:SetMovementType(MovementType.MOVEMENTTYPE_DONTMOVEWP)
		Unit:CreateWaypoint(1, -19.324257, 1418.992554, 12.793161, Unit:GetO(), 0, 256, 0)
		Unit:CreateWaypoint(2, -51.491978, 1419.539429, 27.303785, Unit:GetO(), 0, 256, 0)
		Unit:CreateWaypoint(3, -79.723747, 1418.422119, 27.302353, Unit:GetO(), 0, 256, 0)
		Unit:CreateWaypoint(4, -80.228577, 1395.087280, 27.174965, Unit:GetO(), 0, 256, 0)
		Unit:CreateWaypoint(5, -80.688975, 1377.542969, 40.768536, Unit:GetO(), 0, 256, 0)
		Unit:CreateWaypoint(6, -79.429787, 1362.098877, 40.767818, 1.570787,0, 256, 0)
		Unit:CreateWaypoint(7, -80.187447, 1316.803833, 41.191967, 1.568398,0, 256, 0)
		Unit:CreateWaypoint(8, -81.355270, 1300.907959, 48.558041, 1.532316,0, 256,0)
		--Unit:SetOutOfCombatRange(50000)
	end
end

function Nalorakk_OnCombat(Unit,event,pAggro)
	local args = getvars(Unit)
	if(args.NALORAKK.gauntlet == true) then
		Nalorakk_HandleGauntlet(Unit,event,pAggro)
	elseif(args.NALORAKK.gauntlet == false) then
		Unit:SetAIState(AI_State.STATE_ATTACKING)
		Unit:SetCombatMeleeCapable(0)
		Unit:SetAllowedToEnterCombat(1)
		Unit:SetMovementType(MovementType.MOVEMENTTYPE_DONTMOVEWP)
		Unit:AttackReaction(pAggro, 1, 0)
		local aggro = math.random(1, 2)
		if(aggro == 1) then
			Unit:PlaySoundToSet(12070)
			Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "You be dead soon enough!")
		else
			Unit:PlaySoundToSet(12076)
			Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Da Amani gonna rule again!")
		end
		Unit:RegisterEvent("Nalorakk_Berserk", 1000*60*10, 1)
		Unit:RegisterEvent("Nalorakk_Surge", math.random(20*1000, 30*1000), math.fmod(math.random(45*1000, 60*1000), math.random(20*1000, 30*1000)))
		Unit:RegisterEvent("Nalorakk_Mangle", math.random(20*1000, 25*1000), math.fmod(math.random(45*1000, 60*1000), math.random(20*1000, 25*1000)))
		Unit:RegisterEvent("Nalorakk_BrutalSwipe", math.random(40*1000, 50*1000), math.fmod(math.random(45*1000, 60*1000), math.random(40*1000, 50*1000)))
		Unit:RegisterEvent("Nalorakk_Transform", math.random(45*1000, 60*1000), 1)
	end
end

function Nalorakk_OnDamageTaken(Unit,event,mAttacker,uint32,int32,fAmount)
	local args = getvars(Unit)
	if((args.NALORAKK.gauntlet == false) and (args.NALORAKK.wavecount == 4)) then
		Unit:OnUnitEvent("Nalorakk_OnCombat", 1, mAttacker, 0)
		args.NALORAKK.wavecount = nil
	end
end

function Nalorakk_OnWipe(Unit,event)
	local args = getvars(Unit)
	if(args.NALORAKK.gauntlet == true) then
		Unit:Despawn(100, 5000)
		Unit:RemoveAIUpdateEvent()
	else
		Unit:RemoveEvents()
	end
end

function Nalorakk_OnKillPlayer(Unit,event,mVictim)
	if(mVictim:IsPlayer() == true) then
		local chance = math.random(1, 2)
		if(chance == 2) then
			Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Now whatchoo got to say?")
			Unit:PlaySoundToSet(12075)
		else
			Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Mua-ha-ha!")
			Unit:PlaySoundToSet(12076)
		end
	end
end

function Nalorakk_OnDeath(Unit,event)
	Unit:RemoveEvents()
	Unit:RemoveAIUpdateEvent()
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL,"I... be waitin' on da udda side....")
	Unit:PlaySoundToSet(12077)
end

function Nalorakk_AIUpdate(Unit)
	local args = getvars(Unit)
	if(args.NALORAKK.gauntlet == true) then
		Nalorakk_Gauntlet_AIUpdate(Unit)
		return
	end
end


RegisterUnitEvent(23576, 1, "Nalorakk_OnCombat")
RegisterUnitEvent(23576, 2, "Nalorakk_OnWipe")
RegisterUnitEvent(23576, 3, "Nalorakk_OnKillPlayer")
RegisterUnitEvent(23576, 4, "Nalorakk_OnDeath")
RegisterUnitEvent(23576, 24, "Nalorakk_OnDamageTaken")
RegisterUnitEvent(23576, 18, "Nalorakk_OnSpawn")
RegisterUnitEvent(23576, 21, "Nalorakk_AIUpdate")

function CurrentForm(Unit)
	local args = getvars(Unit)
	if((type(args) ~= "table") and (args.NALORAKK == nil)) then 
		return nil
	else
		return args.NALORAKK.currentform;
	end
end

function SetForm(Unit, curform)
	if(type(curform) ~= "string") then
		error("SetForm expecting argument #2 string got "..tostring(type(curform)), 2)
		return nil
	end
	if(type(Unit) ~= "userdata") then 
		return nil 
	end
	local args = getvars(Unit)
	if(type(args) ~= "table" or args.NALORAKK == nil) then 
		return nil
	else
		args.NALORAKK.currentform = curform;
	end
end

function Nalorakk_Surge(Unit)
	if(CurrentForm(Unit) ~= "TROLL") then
		return
	end
	local plr = Unit:GetRandomPlayer(0)
	if(type(plr) == "userdata") then
		Unit:FullCastSpellOnTarget(42402, plr)
		Unit:PlaySoundToSet(12071)
		Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "I bring da pain!")
	else
		error("Nalorakk_Surge expecting type userdata got "..tostring(type(plr)), 2)
		return
	end
end

function Nalorakk_BrutalSwipe(Unit)
	if(CurrentForm(Unit) ~= "TROLL") then
		return
	end
	local tank = Unit:GetMainTank()
	if(type(tank) == "userdata") then
		Unit:FullCastSpellOnTarget(42384, tank)
	else
		error("Nalorakk_BrutalSwipe expecting type userdata got "..tostring(type(tank)), 2)
		return
	end
end

function Nalorakk_Mangle(Unit)
	if(CurrentForm(Unit) ~= "TROLL") then
		return
	end
	local tank = Unit:GetMainTank()
	if(type(tank) == "userdata") then
		Unit:FullCastSpellOnTarget(42389, tank)
	else
		error("Nalorakk_Mangle expecting type userdata got "..tostring(type(tank)), 2)
		return
	end
end

function Nalorakk_Berserk(Unit)
	Unit:FullCastSpell(41924)
	Unit:PlaySoundToSet(12074)
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "You had your chance, now it be too late!")
end

function Nalorakk_Slash(Unit)
	if(CurrentForm(Unit) ~= "BEAR") then
		return
	end
	local tank = Unit:GetMainTank()
	if(type(tank) == "userdata") then
		Unit:FullCastSpellOnTarget(42395, tank)
	else
		error("Nalorakk_Slash expecting type userdata got "..tostring(type(tank)), 2)
		return
	end
end

function Nalorakk_RendFlesh(Unit)
	if(CurrentForm(Unit) ~= "BEAR") then
		return
	end
	local tank = Unit:GetMainTank()
	if(type(tank) == "userdata") then
		Unit:FullCastSpellOnTarget(42397, tank)
	else
		error("Nalorakk_RendFlesh expecting type userdata got "..tostring(type(tank)), 2)
		return
	end
end
function Nalorakk_DeafeningRoar(Unit)
	if(CurrentForm(Unit) ~= "BEAR") then
		return
	end
	Unit:FullCastSpell(42398)
end
function Nalorakk_Transform(Unit)
	local args = getvars(Unit)
	if(args.NALORAKK.enrage < 15) then
		args.NALORAKK.enrage = 0
		return
	end
	args.NALORAKK.enrage = args.NALORAKK.enrage - 45; --subtract 45 seconds every transform to determine the enrage timer.
	if(CurrentForm(Unit) == "BEAR") then
		Unit:RemoveEvents()
		Unit:RemoveAura(42594)
		Unit:PlaySoundToSet(12073)
		Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"Make way for Nalorakk!")
		SetForm(Unit,"TROLL")
		Unit:RegisterEvent("Nalorakk_Surge", math.random(20*1000, 30*1000), math.fmod(45000, math.random(20*1000, 30*1000)))
		Unit:RegisterEvent("Nalorakk_Mangle", math.random(20*1000, 25*1000), math.fmod(45000, math.random(20*1000, 25*1000)))
		Unit:RegisterEvent("Nalorakk_BrutalSwipe", math.random(40*1000, 50*1000), math.fmod(45000, math.random(40*1000, 50*1000)))
		Unit:RegisterEvent("Nalorakk_Transform", 45000, 1)
		if(args.NALORAKK.enrage <= 100) then
			Unit:RegisterEvent("Nalorakk_Berserk", args.NALORAKK.enrage*1000*60, 1)
		else
			Unit:RegisterEvent("Nalorakk_Berserk", args.NALORAKK.enrage*1000, 1)
		end
	elseif(CurrentForm(Unit) == "TROLL") then
		Unit:RemoveEvents()
		Unit:FullCastSpell(42594)
		Unit:PlaySoundToSet(12072)
		Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"You call on da beast, you gonna get more dan you bargain for!")
		SetForm(Unit,"BEAR")
		Unit:RegisterEvent("Nalorakk_Slash", math.random(15*1000, 20*1000), math.fmod(45000, math.random(15*1000, 20*1000)))
		Unit:RegisterEvent("Nalorakk_RendFlesh", math.random(10*1000, 15*1000), math.fmod(45000, math.random(10*1000, 15*1000)))
		Unit:RegisterEvent("Nalorakk_DeafeningRoar", math.random(20*1000, 25*1000), math.fmod(45000, math.random(20*1000, 25*1000)))
		Unit:RegisterEvent("Nalorakk_Transform", 45000, 1)
		if(args.NALORAKK.enrage <= 100) then
			Unit:RegisterEvent("Nalorakk_Berserk", args.NALORAKK.enrage*1000*60, 1)
		else
			Unit:RegisterEvent("Nalorakk_Berserk", args.NALORAKK.enrage*1000, 1)
		end
	end
end

--Notes     : Below is a query to insert the column of fire npc into your db if you don't have it, be sure to check and add it if it isn't there.
--Known Bugs: During Phase 3 (Eagle Phase) Zul'jin should add a debuff on players called energy storm, it seems that spell doesn't work.
--            Although this debuff should go onto the entire raid, we can use GetInRangePlayers to run through the whole raid group to
--            do the same effect and cast the zap spell on them when they cast, but I am not sure how GetCurrentSpell or GetCurrentSpellId
--            works, so that part of his phase doesn't work.
--          : The feather vortexes does a knockback spell, not sure which spell it is as I was not able to find any information on it, so I
--            used a spell that does the same, but it has a small cyclone animation with the spell which I have not seen in any screenshots
--            or movies I have watched, so it might not be the correct spell.
--          : The Flame wall doesn't go up, don't see a way to activate game objects.
--Sql Qeury : insert into `creature_proto` values(24187,70,70,14,80000,85000,1000,1,0,1600,0,500,800,0,0,0,0,0,0,0,0,0,0,0,0,0,1800000,6807,0,0,0,0,0,0,1,0,'0',0,0,0,0,2.5,8,14,0,0,0,0,0,0)

function npc_zuljin_addphase( phase, maxhp, minhp, combat, spell, sound, phrase )
	return { phase = phase, maxhp = maxhp, minhp = minhp, combat = combat, spell = spell, sound = sound, phrase = phrase }
end

local npc_zuljin_phases = {
	npc_zuljin_addphase( 1, 100, 81, 0, nil, nil, nil ),
	npc_zuljin_addphase( 2,  80, 61, 0, 42594, 12092, "Got me some new tricks...like me bruddah bear!" ),
	npc_zuljin_addphase( 3,  60, 41, 1, 42606, 12093, "Dere be no hidin' from da eagle!" ),
	npc_zuljin_addphase( 4,  40, 21, 0, 42607, 12094, "Let me introduce to you my new bruddahs: fang and claw!" ),
	npc_zuljin_addphase( 5,  20,  1, 0, 42608, 12095, "Ya don' have to look to da sky to see da dragonhawk!" )
}

function npc_zuljin_addspell( phase, timer, spell, counter, cooldown )
  return { phase = phase, timer = timer, spell = spell, counter = counter, cooldown = cooldown }
end

local npc_zuljin_spells = {
	npc_zuljin_addspell( 1, -1, 17207, -1,  2 ),
	npc_zuljin_addspell( 1, -1, 43093, -1,  3 ),
	npc_zuljin_addspell( 2, -1, 43095, -1, -1 ),
	npc_zuljin_addspell( 4, -1, 43150, 12, 10 ),
	npc_zuljin_addspell( 4, -1, 43153,  9, 16 ),
	npc_zuljin_addspell( 5, -1, 43213, -1,  2 ),
	npc_zuljin_addspell( 5, -1, 43215, -1,  2 ),
	npc_zuljin_addspell( 5, -1, 43216, -1, -1 )
}

function npc_zuljin_event_combatenter(Unit, Event)
  local vars = getvars(Unit)
	
	vars.npc_zuljin.phase   = 0
	vars.npc_zuljin.cancast = true
	vars.npc_zuljin.target  = nil
	vars.npc_zuljin.tank    = nil
	
	Unit:SendChatMessage( 14, 0, "Nobody badduh dan me." )
	Unit:PlaySoundToSet( 12091 )
 	Unit:RegisterEvent( "npc_zuljin_event_updatepulse", 250, 1 )
end

function npc_zuljin_event_combatleave(Unit, Event)
 	Unit:RemoveEvents()
	
	--remove times, the updatepulse will add new ones
	for k, v in pairs( npc_zuljin_spells ) do
	  v.timer = -1
	end

	--remove all add's, the updatepulse will spawn new ones
	local friends =	Unit:GetInRangeFriends()
	for i, j in pairs( friends ) do
		if j:GetEntry() == 24136 or j:GetEntry() == 24187 then
			j:Despawn( 1, 0 )
		end
	end
	
	--remove form, the updatepulse will set it again
	for i, j in pairs( npc_zuljin_phases ) do
		if j.spell ~= nil and	Unit:HasAura( j.spell ) then
			Unit:RemoveAura( j.spell )
		end
	end
end

function npc_zuljin_event_combatkills(Unit, Event)
  if math.random( 1, 2 ) == 1 then
	 	Unit:SendChatMessage( 14, 0, "Da Amani de chuka!" )
		Unit:PlaySoundToSet( 12098 )
	else
	 	Unit:SendChatMessage( 14, 0, "Lot more gonna fall like you!" )
		Unit:PlaySoundToSet( 12099 )
	end
end

function npc_zuljin_event_combatdying(Unit, Event)	
	Unit:SendChatMessage( 14, 0, "Mebbe me fall...but da Amani empire...never gonna die..." )
	Unit:PlaySoundToSet( 12100 )
end

function npc_zuljin_event_combatdodge(Unit, Event)
  local vars = getvars(Unit)
	
	if vars.npc_zuljin.phase == 2 then
  	local target =	Unit:GetMainTank()
		
		if target ~= nil then
			Unit:FullCastSpellOnTarget( 43456, target )
		end
	end
end

function npc_zuljin_event_Unitspawned(Unit, Event)
  setvars( Unit, { npc_zuljin = { owner = Unit, phase = 0, cancast = true, tank = nil, target = nil, counter = 0 } } )
end

function npc_zuljin_event_updatepulse(Unit, Event)
  local vars = getvars(Unit)
  --update zuljin's phase
  npc_zuljin_event_updatephase(Unit)
	--update zuljin's spells
	if vars.npc_zuljin.cancast == true then
		npc_zuljin_event_updatespell(Unit)
	end
	--update for the zap spells to players in phase 3, no way to see if players is casting yet
	npc_zuljin_event_updatestorm(Unit)
	
	--update to check cheaters, since arcemu doesn't support check for x amount of people in a raid, we have him check, you can uncomment this if you want
	npc_zuljin_event_updatecheat(Unit)
  
 	Unit:RegisterEvent( "npc_zuljin_event_updatepulse", 250, 1 )
end

function npc_zuljin_event_updatephase(Unit)
  local vars = getvars(Unit)
  for k, v in pairs( npc_zuljin_phases ) do
    if	Unit:GetHealthPct() <= v.maxhp and	Unit:GetHealthPct() >= v.minhp and vars.npc_zuljin.phase ~= v.phase then
		  local friends =	Unit:GetInRangeFriends()
		  --remove any old shapes
		  for i, j in pairs( npc_zuljin_phases ) do
		    if j.spell ~= nil and	Unit:HasAura( j.spell ) then
					Unit:RemoveAura( j.spell )
				end
		  end
		  if v.sound ~= nil and v.phrase ~= nil then
		   	Unit:SendChatMessage( 14, 0, v.phrase )
				Unit:PlaySoundToSet( v.sound )
		  end
		  if v.spell ~= nil then	Unit:FullCastSpell( v.spell ) end
		  vars.npc_zuljin.phase = v.phase
			Unit:SetCombatCapable( v.combat )
			Unit:ClearThreatList()
			if v.phase == 1 then
				npc_zuljin_spells[1].timer = os.time() + math.random( 5, 7 )
				npc_zuljin_spells[2].timer = os.time() + math.random( 7, 9 )
			end
			if v.phase == 2 then
				npc_zuljin_spells[3].timer = os.time() + math.random( 15, 20 )
			end
			if v.phase == 4 then
				npc_zuljin_spells[4].timer = os.time() + math.random( 10, 12 )
				npc_zuljin_spells[5].timer = os.time() + math.random( 14, 18 )
			end
			if v.phase == 5 then
			  npc_zuljin_spells[6].timer = os.time() + math.random( 15, 20 )
				npc_zuljin_spells[7].timer = os.time() + math.random(  8, 10 )
				npc_zuljin_spells[8].timer = os.time() + math.random(  2,  4 )
			end
			if v.phase == 3 then
		   	Unit:MoveTo(120.244835, 706.617249, 45.111404, 1.656406)
		   	Unit:FullCastSpell(43983)
				Unit:FullCastSpell(43112)
				friends = Unit:GetInRangeFriends()
				for i, j in pairs(friends) do
				  if j:GetEntry() == 24136 then
					  j:SetTauntedBy(j:GetRandomPlayer(0))
					end
				end
			end
			
			if v.phase == 4 then
			  for i, j in pairs( friends) do
			    if j:GetEntry() == 24136 then
						j:Despawn(1, 0)
					end
			  end
			end
		  setvars(Unit, vars)
		  return
		end
  end
end

function npc_zuljin_event_updatespell(Unit)
  local vars = getvars(Unit)
	
	for k, v in pairs( npc_zuljin_spells ) do
	  if os.time() > v.timer and v.timer ~= -1 and vars.npc_zuljin.phase == v.phase then
		  if v.spell == 17207 then
			 	Unit:FullCastSpell( v.spell )
				v.timer = os.time() + math.random( 5, 7 )
			end
			
			if v.spell == 43093 then
			  local target =	Unit:GetRandomPlayer( 0 )
				
				if target ~= nil then
					Unit:FullCastSpellOnTarget( v.spell, target )
				end
				v.timer = os.time() + math.random( 7, 9 )
			end
			
			if v.spell == 43095 then
				Unit:FullCastSpell( v.spell )
				Unit:RegisterEvent( "npc_zuljin_event_updateparal", 4500, 1 )
				v.timer = os.time() + math.random( 15, 20 )
			end
			
			if v.spell == 43150 then
			  vars.npc_zuljin.tank =	Unit:GetMainTank()
			  vars.npc_zuljin.target =	Unit:GetRandomPlayer( 7 )
				vars.npc_zuljin.counter = 0
				if vars.npc_zuljin.target == nil then vars.npc_zuljin.target =	Unit:GetRandomPlayer( 0 ) end
				Unit:ModifyRunSpeed( 15 )
				Unit:MoveTo( vars.npc_zuljin.target:GetX() - 3, vars.npc_zuljin.target:GetY() - 3, vars.npc_zuljin.target:GetZ(), vars.npc_zuljin.target:GetO() )
				Unit:SetTauntedBy( vars.npc_zuljin.target )
				vars.npc_zuljin.cancast = false
				Unit:RegisterEvent( "npc_zuljin_event_updateclaws", 500, v.counter )
				setvars( Unit, vars )
			end
			if(v.spell == 43153) then
			  vars.npc_zuljin.tank =	Unit:GetMainTank()
			  vars.npc_zuljin.target =	Unit:GetRandomPlayer(0)
				vars.npc_zuljin.counter = 0
				if(vars.npc_zuljin.target == nil) then vars.npc_zuljin.target = Unit:GetRandomPlayer(0) end
				Unit:ModifyRunSpeed(18)
				Unit:MoveTo(vars.npc_zuljin.target:GetX() - 3, vars.npc_zuljin.target:GetY() - 3, vars.npc_zuljin.target:GetZ(), vars.npc_zuljin.target:GetO())
				Unit:SetTauntedBy(vars.npc_zuljin.target)
				vars.npc_zuljin.cancast = false
				Unit:RegisterEvent("npc_zuljin_event_updatecharge", 750, v.counter)
				setvars(Unit, vars)
			end
			if(v.spell == 43213) then
			 	Unit:FullCastSpell(17207)
				Unit:FullCastSpell(v.spell)
				v.timer = os.time() + math.random(12, 17)
			end
			if(v.spell == 43215) then
			 	Unit:FullCastSpell(v.spell)
				v.timer = os.time() + math.random(8, 9)
			end
			if(v.spell == 43216) then
			  local friends = Unit:GetInRangeFriends()
				local count = 0
				local target =	Unit:GetRandomPlayer(0)
				
				for i, j in pairs(friends) do
				  if(j:GetEntry() == 24187) then count = count + 1 end
				end
				if(count < 3) then
					Unit:SpawnCreature(24187, target:GetX(), target:GetY(), target:GetZ(), target:GetO(), 1890, 10000)
				end
				v.timer = os.time() + math.random(2, 4)
			end
			for i, j in pairs(npc_zuljin_spells) do
				if((j.phase == vars.npc_zuljin.phase) and (j.timer ~= -1) and (v.cooldown ~= -1)) then
					j.timer = j.timer + v.cooldown
				end
			end
			if((v.spell == 43150) or (v.spell == 43153)) then
			  return
			end
		end
	end
end

--[[function npc_zuljin_event_updatestorm(Unit)
 local vars = getvars(Unit)
	if vars.npc_zuljin.phase == 3 then
	  local targets =	Unit:GetInRangePlayers()
		for k, v in pairs( targets ) do
		  if	Unit:GetCurrentSpell( v ) ~= nil then
				Unit:FullCastSpellOnTarget( 43137, v )			
			end
		end
	end
end]]

function npc_zuljin_event_updatecheat(Unit)
  local targets =	Unit:GetInRangePlayers()
	if table.getn( targets ) > 10 then
	 	Unit:SendChatMessage( 14, 0, "I do not fight cheaters. Zul'Aman is a 10-man raid only." )
		for k, v in pairs( targets ) do
		 	Unit:SetTauntedBy( v )
			Unit:WipeCurrentTarget()
		end
	end
end

function npc_zuljin_event_updateparal(Unit, Event)
  local targets = Unit:GetInRangePlayers()
	for k, v in pairs(targets) do
	  if v:HasAura(43095) then
		  v:RemoveAura(43095)
			v:FullCastSpell(43437)
		end
	end
end

function npc_zuljin_event_updateclaws(Unit, Event)
  local vars = getvars(Unit)
	if vars.npc_zuljin.target == nil then
	  vars.npc_zuljin.target =	Unit:GetClosestPlayer()
	end
	if vars.npc_zuljin.target ~= nil then
		if	Unit:GetDistance(vars.npc_zuljin.target) > 25 then
		 	Unit:MoveTo(vars.npc_zuljin.target:GetX() - 3, vars.npc_zuljin.target:GetY() - 3, vars.npc_zuljin.target:GetZ(), vars.npc_zuljin.target:GetO())
		end
		Unit:FullCastSpellOnTarget(43150, vars.npc_zuljin.target)
	else
	  vars.npc_zuljin.target = Unit:GetClosestPlayer()
	end
	vars.npc_zuljin.counter = vars.npc_zuljin.counter + 1
	if vars.npc_zuljin.counter == npc_zuljin_spells[4].counter then
	 	Unit:ModifyRunSpeed(8)
		vars.npc_zuljin.cancast = true
		Unit:SetTauntedBy( vars.npc_zuljin.tank )
		npc_zuljin_spells[4].timer = os.time() + math.random(10, 12)
	end
	setvars(Unit, vars)
end

function npc_zuljin_event_updatecharge(Unit, Event)
	local vars = getvars(Unit)
	if vars.npc_zuljin.target ~= nil then
	 	Unit:FullCastSpellOnTarget(43153, vars.npc_zuljin.target)
		vars.npc_zuljin.target = Unit:GetRandomPlayer(0)
		Unit:MoveTo(vars.npc_zuljin.target:GetX() - 3, vars.npc_zuljin.target:GetY() - 3, vars.npc_zuljin.target:GetZ(), vars.npc_zuljin.target:GetO())
		Unit:SetTauntedBy(vars.npc_zuljin.target)
	end
	vars.npc_zuljin.counter = vars.npc_zuljin.counter + 1
	if vars.npc_zuljin.counter == npc_zuljin_spells[5].counter then
	 	Unit:ModifyRunSpeed(8)
		vars.npc_zuljin.cancast = true
		Unit:SetTauntedBy(vars.npc_zuljin.tank)
		npc_zuljin_spells[5].timer = os.time() + math.random(14, 18)
	end
	setvars(Unit, vars)
end

RegisterUnitEvent(23863,  1, "npc_zuljin_event_combatenter")
RegisterUnitEvent(23863,  2, "npc_zuljin_event_combatleave")
RegisterUnitEvent(23863,  3, "npc_zuljin_event_combatkills")
RegisterUnitEvent(23863,  4, "npc_zuljin_event_combatdying")
RegisterUnitEvent(23863,  6, "npc_zuljin_event_combatdodge")
RegisterUnitEvent(23863, 18, "npc_zuljin_event_Unitspawned")

function npc_pillar_event_combatenter(Unit, Event)
 	Unit:RegisterEvent("npc_pillar_event_updatepulse", 250, 1)
end

function npc_pillar_event_combatleave(Unit, Event)
 	Unit:RemoveEvents()
end

function npc_pillar_event_Unitspawned(Unit, Event)
 	Unit:FullCastSpell(43218)
	Unit:SetCombatCapable(1)
	Unit:RegisterEvent("npc_pillar_event_updatepulse", 250, 1)
end

function npc_pillar_event_updatepulse(Unit, Event)
	Unit:SetHealth(Unit:GetMaxHealth())
end

RegisterUnitEvent(24187,  1, "npc_pillar_event_combatenter")
RegisterUnitEvent(24187,  2, "npc_pillar_event_combatleave")
RegisterUnitEvent(24187, 18, "npc_pillar_event_Unitspawned")

function npc_vortex_event_combatleave(Unit, Event)
 	Unit:RemoveEvents()
	Unit:Despawn(1, 0)
end

function npc_vortex_event_Unitspawned(Unit, Event)
 	Unit:FullCastSpell(36178)
 	Unit:RegisterEvent("npc_vortex_event_updatepulse", 1000, 1)
end

function npc_vortex_event_updatepulse(Unit, Event)
  local target = Unit:GetRandomPlayer(0)
	Unit:SetHealth(Unit:GetMaxHealth())
	if((math.random(100) < 20) and (target ~= nil)) then
	 	Unit:SetTauntedBy(target)
		Unit:MoveTo(target:GetX() - 3, target:GetY() - 3, target:GetZ(), target:GetO())
	else	
		target = Unit:GetMainTank()
		if(target == nil) then
		 	Unit:SetTauntedBy(Unit:GetRandomPlayer(0))
			Unit:MoveTo(target:GetX() - 3, target:GetY() - 3, target:GetZ(), target:GetO())
		end
	end
	target = Unit:GetMainTank()
	if((Unit:GetDistance(target) <= 10) and (target ~= nil)) then
	 	Unit:CastSpellOnTarget(42495, target)
		return
	end
	Unit:RegisterEvent("npc_vortex_event_updatepulse", 1000, 1)
end

RegisterUnitEvent(24136, 2, "npc_vortex_event_combatleave")
RegisterUnitEvent(24136, 18, "npc_vortex_event_Unitspawned")
RegisterUnitEvent(24858, 19, "AkilzonSoaringEagleOnReachWp")