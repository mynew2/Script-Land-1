--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation, BrantX
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function TeleportDown_AI(Unit,Event)
	Unit:RegsiterEvent("TeleportDown_DownFront", 1000, 0)
	Unit:RegsiterEvent("TeleportDown_DownBack", 1000, 0)
end

function TeleportDown_DownFront(Unit,Event)
	if(Unit:IsInFront()) then
		Unit:Teleport(609, 2389.989990, -5640.930176, 377.266998)
	end
end

function TeleportDown_DownBack(Unit,Event)
	if(Unit:IsInBack()) then
		Unit:Teleport(609, 2389.989990, -5640.930176, 377.266998)
	end
end

RegisterUnitEvent(29581, 10, "TeleportDown_AI")

function TeleportUp_AI(Unit,Event)
	Unit:RegsiterEvent("TeleportDown_UpFront", 1000, 0)
	Unit:RegsiterEvent("TeleportDown_UpBack", 1000, 0)
end

function TeleportUp_UpFront(Unit,Event)
	if(Unit:IsInFront()) then
		Unit:Teleport(609, 2383.649902, -5645.240234, 420.880005)
	end
end

function TeleportUp_UpBack(Unit,Event)
	if(Unit:IsInBack()) then
		Unit:Teleport(609, 2383.649902, -5645.240234, 420.880005)
	end
end

RegisterUnitEvent(29580, 10, "TeleportUp_AI")

function GryphonDown_OnGossip(Unit, Event, Player)
	Unit:GossipCreateMenu(100, Player, 0)
	Unit:GossipMenuAddItem(0, "Go Down to Death's Breach", 1, 0)
	Unit:GossipSendMenu(Player)
end

function GryphonDown_OnSelect(Unit, Event, Player, MenuId, id, Code)
	if(id == 1) then
		Player:Teleport(609, 2430.61, -5730.25, 157.855)
		Unit:GossipComplete(Player)
	end
end

function GryphonUp_OnGossip(Unit, Event, Player)
	Unit:GossipCreateMenu(100, Player, 0)
	Unit:GossipMenuAddItem(0, "Go Up to Heart of Acherus", 1, 0)
	Unit:GossipSendMenu(Player)
end

function GryphonUp_OnSelect(Unit, Event, Player, MenuId, id, Code)
	if(id == 1) then
		Player:Teleport(609, 2363.69, -5659.33, 382.270)
		Unit:GossipComplete(Player)
	end
end

RegisterUnitGossipEvent(29488, 1, "GryphonDown_OnGossip")
RegisterUnitGossipEvent(29501, 1, "GryphonUp_OnGossip")
RegisterUnitGossipEvent(29488, 2, "GryphonDown_OnSelect")
RegisterUnitGossipEvent(29501, 2, "GryphonUp_OnSelect")

function mugthol_strike(pUnit, Event)
local plr = pUnit:GetClosestPlayer()
	if (plr ~= nil) then
		pUnit:FullCastSpellOnTarget(11976, plr)
	end
end

function mugthol_demoralizing(pUnit, Event)
	pUnit:CastSpell(13730)
end

function mugthol_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("mugthol_demoralizing", 2000, 1)
	pUnit:RegisterEvent("mugthol_strike", 20000, 0)
end

function mugthol_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2257, 1, "mugthol_OnCombat")
RegisterUnitEvent(2257, 2, "mugthol_OnLeaveCombat")