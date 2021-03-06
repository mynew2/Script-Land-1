--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation, DPS-DB.com
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function Sa_at_Spawn(Unit, Event)
    Unit:RegisterEvent("Sa_at_Check_Range",2000,0)
end

function Sa_at_Check_Range(Unit, Event)
    for _,plr in pairs (Unit:GetInRangePlayers()) do
        if(plr:GetDistanceYards(Unit) < 20) then
            Unit:SendChatMessage(12, 0, "Stop! Do not go any further, mortal. You are ill-prepared to face the forces of the Infinite Dragonflight. Come, let me help you.")
            Unit:Emote(1, 2000)
            Unit:RemoveEvents()
        end
    end
end

function Sa_at_Gossip(Unit, event, player)
    if(player:HasFinishedQuest(10296)) then
        Unit:GossipCreateMenu(100, player, 0)
        Unit:GossipMenuAddItem(0, "Conjure Chrono-Beacon", 1, 0)
		Unit:SendGossipMenu(player)
    else
        player:GossipComplete()
    end
end

function Sa_at_Select(Unit, event, player, id, intid, code)
    if (intid == 1) then
        Unit:FullCastSpell(34975)
        Unit:RegisterEvent("Sa at Give Beacon To Player", 1000, 1)
        player:GossipComplete()
    end
end

function Sa_at_Give_Beacon_To_Player(Unit, Event)
    Unit:GetClosestPlayer():AddItem(24289, 1)
end

RegisterUnitEvent(20201, 18, "Sa_at_Spawn")
RegisterUnitGossipEvent(20201, 1, "Sa_at_Gossip")
RegisterUnitGossipEvent(20201, 2, "Sa_at_Select")

--[[Add spawn and Despawn for Time Keeper(Search on wowhead [Time keeper])]]
function Aeonus_OnCombat(pUnit, Event)
    pUnit:SendChatMessage(12, 0, "The time has come to shatter this clockwork universe forever! Let us no longer be slaves of the hourglass! I warn you: those who do not embrace the greater path shall become victims of its passing!")
	pUnit:RegisterEvent("Aeonus_Spell1", 20000, 0)
end

function Aeonus_Spell1(pUnit, Event)
    pUnit:SendChatMessage(12, 0, "Let us see what fate lays in store...")
    pUnit:CastSpellOnTarget(31422, pUnit:GetMainTank())
	pUnit:RegisterEvent("Aeonus_Spell2", 30000, 0)
end

function Aeonus_Spell2(pUnit, Event)
    pUnit:SendChatMessage(12, 0, "Your time is up, slave of the past!")
    pUnit:CastSpellOnTarget(31473, pUnit:GetMainTank())
	pUnit:Castspell(37853)
end

function Aeonus_OnLeaveCombat(pUnit, Event)
    pUnit:Castspell(37853)
end

function Aeonus_OnKilledTarget(pUnit, Event)
    if(math.random(1,2) == 1) then
        pUnit:SendChatMessage(12, 0, "No one can stop us! No one!")
    else
        pUnit:SendChatMessage(12, 0, "One less obstacle in our way!")
    end
end

function Aeonus_OnDeath(pUnit, Event)
    pUnit:SendChatMessage(12, 0, "We will triumph.. It is only a matter...of time.")
end

RegisterUnitEvent(17881, 1, "Aeonus_OnCombat")
RegisterUnitEvent(17881, 2, "Aeonus_OnLeaveCombat")
RegisterUnitEvent(17881, 3, "Aeonus_OnKilledTarget")
RegisterUnitEvent(17881, 4, "Aeonus_OnDeath")