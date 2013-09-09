--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: DARKI
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

local SHADOWBOLT = 18164
local CLEAVE = 15584
local MORTALSTRIKE = 13737
local RAISEDEAD = 17475
local DEATHPACT = 17698
local SUMMONSKELETONS = 17274

function Baron_OnCombat(Unit, Event)
	local say = math.random(1, 6)
	if(say == 1) then
		Unit:SendChatMessage(12, 0, "Invaders! Undoubtedly more henchmen Argentumd \ 195 \ 164mmerung. It is already one of them in my imprisonment. Pulls you out of my Dom \ 195 \ 164ne to \ 195 \ 188ck, executed before I leave!") -- blizzlike
	elseif(say == 2) then
		Unit:SendChatMessage(12, 0, "You're still here? Your stupidity is truly the \ 195 \ 188sant! The M \ 195 \ 164dchen the Argentumd \ 195 \ 164mmerung need not unn \ suffer 195 \ 182tig. Disappears immediately, and their lives will be spared!") -- blizzlike
	elseif(say == 3) then
		Unit:SendChatMessage(12, 0, "I shall take great pleasure in taking this poor wretch's life! It's not too late, she needn't suffer in vain. Turn back and her death shall be merciful!")
	elseif(say == 4) then
		Unit:SendChatMessage(12, 0, "May this prisoner's death serve as a warning. None shall defy the Scourge and live!")
	elseif(say == 5) then
		Unit:SendChatMessage(12, 0, "So you see fit to toy with the Lich King's creations? Ramstein, be sure to give the intruders a proper greeting.")
	elseif(say == 6) then
		Unit:SendChatMessage(12, 0, "Time to take matters into my own hands. Come. Enter my domain and challenge the might of the Scourge!")
	end
	Unit:RegisterEvent("Baron_Shadowbolt", 5000+math.random(1,5000), 0)
	Unit:RegisterEvent("Baron_Cleave", 8000+math.random(1,4000), 0)
	Unit:RegisterEvent("Baron_Mortalstrike", 12000+math.random(1,4000), 0)
	Unit:RegisterEvent("Baron_Raise", 30000+math.random(1,15000), 0)
	Unit:RegisterEvent("Baron_Summon", 34000, 0)
end

function Baron_Shadowbolt(Unit, Event)
local shadow_chance = math.random(1,100)
	if(shadow_chance < 70) then
		local RandomPlayer = Unit:GetRandomPlayer()
		Unit:FullCastSpellOnTarget(SHADOWBOLT, RandomPlayer)
	end
end

function Baron_Cleave(Unit, Event)
local cleave_chance = math.random(1,100)
	if(cleave_chance < 55) then
		local RandomPlayer = Unit:GetRandomPlayer()
		Unit:FullCastSpellOnTarget(CLEAVE, RandomPlayer)
	end
end

function Baron_Mortalstrike(Unit, Event)
local mortal_chance=math.random(1,100)
	if(mortal_chance < 30) then
		local RandomPlayer = Unit:GetRandomPlayer()
		Unit:FullCastSpellOnTarget(MORTALSTRIKE, RandomPlayer)
	end
end

function Baron_Raise(Unit, Event)
	Unit:CastSpell(RAISEDEAD)
end

function Baron_Summon(Unit, Event)
	Unit:SpawnCreature(11197, 4017.403809, -3339.703369, 115.057655, 0, 29000)
	Unit:SpawnCreature(11197, 4013.189209, -3351.808350, 115.052254, 0, 29000)
	Unit:SpawnCreature(11197, 4017.738037, -3363.478016, 115.057274, 0, 29000)
	Unit:SpawnCreature(11197, 4048.877197, -3363.223633, 115.054253, 0, 29000)
	Unit:SpawnCreature(11197, 4051.777588, -3350.893311, 115.055351, 0, 29000)
	Unit:SpawnCreature(11197, 4048.375977, -3339.966309, 115.055222, 0, 29000)
end

function Baron_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Baron_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(10440, 1, "Baron_OnCombat")
RegisterUnitEvent(10440, 2, "Baron_OnLeaveCombat")
RegisterUnitEvent(10440, 4, "Baron_OnDied")

math.randomseed(os.time())

function MagistrateBarthilas_OnCombat(pUnit)
	pUnit:SendChatMessage(12, 0, "Intruders at the Service Gate! Lord Rivendare must be warned!")
    pUnit:RegisterEvent("MagistrateBarthilas_MightyBlow", math.random(23000,30000), 0)
	pUnit:RegisterEvent("MagistrateBarthilas_DrainingBlow", math.random(10000,15000), 0)
	pUnit:RegisterEvent("MagistrateBarthilas_CrowdPummel", math.random(13000,16000), 0)
	pUnit:RegisterEvent("MagistrateBarthilas_Dazed", math.random(5000,8000), 0)
	pUnit:RegisterEvent("MagistrateBarthilas_FuriousAnger", 45000, 0)
end

function MagistrateBarthilas_DrainingBlow(pUnit)
    if(pUnit:GetMainTank() ~= nil) then
	    pUnit:FullCastSpellOnTarget(16793, pUnit:GetMainTank())
	end
end

function MagistrateBarthilas_CrowdPummel(pUnit)
    if(math.random(1,10) < 4) then
        pUnit:FullCastSpell(10887)
    end
end

function MagistrateBarthilas_MightyBlow(pUnit)
    if(pUnit:GetMainTank() ~= nil) then
	    pUnit:FullCastSpellOnTarget(14099, pUnit:GetMainTank())
	end
end

function MagistrateBarthilas_Dazed(pUnit)
    if(pUnit:GetMainTank() ~= nil) then
	    pUnit:FullCastSpellOnTarget(1604, pUnit:GetMainTank())
	end
end

function MagistrateBarthilas_FuriousAnger(pUnit)
    pUnit:FullCastSpell(16791)
end

function MagistrateBarthilas_OnLeaveCombat(pUnit)
    pUnit:RemoveEvents()
end

function MagistrateBarthilas_OnDied(pUnit)
    pUnit:RemoveEvents()
	pUnit:SetModel(3637)
end

RegisterUnitEvent(10435, 1 ,"MagistrateBarthilas_OnCombat")
RegisterUnitEvent(10435, 2, "MagistrateBarthilas_OnLeaveCombat")
RegisterUnitEvent(10435, 4, "MagistrateBarthilas_OnDied")

math.randomseed(os.time())

function RammsteinTheGorger_Trample(pUnit)
    pUnit:FullCastSpell(15550)
end

function RammsteinTheGorger_Knockout(pUnit)
    if(pUnit:GetMainTank() ~= nil) then
	    pUnit:FullCastSpellOnTarget(17307, pUnit:GetMainTank())
	end
end

function RammsteinTheGorger_OnCombat(pUnit)
	pUnit:SendChatMEssage(12, 0, "Rammstein hunger for flesh!")
    pUnit:RegisterEvent("RammsteinTheGorger_Trample", math.random(10000,13000), 0)
	pUnit:RegisterEvent("RammsteinTheGorger_Knockout", math.random(18000,23000), 0)
end

function RammsteinTheGorger_LeaveCombat(pUnit)
    pUnit:RemoveEvents()
end

function RammsteinTheGorger_OnDied(pUnit)
    pUnit:RemoveEvents()
	pUnit:GetGameObjectNearestCoords(4033.708740, -3392.695068, 119.738738, 175405):ActivateGameObject()
	pUnit:GetGameObjectNearestCoords(4032.716064, -3365.038330, 115.056511, 175796):ActivateGameObject()
end

RegisterUnitEvent(10439, 1, "RammsteinTheGorger_OnCombat")
RegisterUnitEvent(10439, 2, "RammsteinTheGorger_LeaveCombat")
RegisterUnitEvent(10439, 4, "RammsteinTheGorger_OnDied")