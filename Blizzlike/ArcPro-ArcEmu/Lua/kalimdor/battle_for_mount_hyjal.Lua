--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: LUA++, ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function Az_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Abandon all hope! The Legion has returned to finish what was begun so many years ago. This time, there will be no escape!")
	pUnit:PlaySoundToSet(10999)
	pUnit:RegisterEvent("AzAttacks", 1000, 0)
	pUnit:CastSpell(31344)
end

function Az_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Az_OnKilledTarget(pUnit, Event)
	local AzSpeech = math.random(1,3)
	if(AzSpeech == 1) then
		pUnit:SendChatMessage(14, 0, "Reesh, hokta!")
		pUnit:PlaySoundToSet(11001)
	elseif(AzSpeech == 2) then
		pUnit:SendChatMessage(14, 0, "No one is going to save you.")
		pUnit:PlaySoundToSet(11047)
	else
		pUnit:SendChatMessage(14, 0, "Don't fight it.")
		pUnit:PlaySoundToSet(11048)
	end
end

function Az_OnDeath(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Your time is almost... up.")
	pUnit:PlaySoundToSet(11002)
end

function AzAttacks(pUnit, Event)
	pUnit:RegisterEvent("AzCleave", math.random(30000,60000), 0)
	pUnit:RegisterEvent("AzRoF", math.random(30000,60000), 0)
	pUnit:RegisterEvent("AzHowl", math.random(15000,20000), 0)
	pUnit:RegisterEvent("AzDoom", math.random(45000,50000), 0)
end

function AzCleave(pUnit, Event)
	pUnit:CastSpellOnTarget(31345, pUnit:GetMainTank())
end

function AzRoF(pUnit, Event)
	if(pUnit:GetRandomPlayer(0) ~= nil) then
		pUnit:CastSpellAoF(pUnit:GetRandomPlayer(0):GetX(), pUnit:GetRandomPlayer(0):GetY(), pUnit:GetRandomPlayer(0):GetZ(), 31340)
	end
end

function AzHowl(pUnit, Event)
	pUnit:CastSpell(31344)
end

function AzDoom(pUnit, Event)
	pUnit:CastSpell(31347, pUnit:GetRandomTarget(7))
	local AzDoomSpeech = math.random(1,2)
	if(AzDoomSpeech == 1) then
		pUnit:SendChatMessage(14, 0, "Just a taste... of what awaits you.")
		--pUnit:PlaySoundToSet()
	else
		pUnit:SendChatMessage(14, 0, "Suffer, you despicable insect!")
		--pUnit:PlaySoundToSet()
	end
end
	
RegisterUnitEvent(17842, 1, "Az_OnCombat")
RegisterUnitEvent(17842, 2, "Az_OnLeaveCombat")
RegisterUnitEvent(17842, 3, "Az_OnKilledTarget")
RegisterUnitEvent(17842, 4, "Az_OnDeath")
--[[Kaz'rogal yells: Shaza-kiel!]]

function Kaz_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Cry for mercy! Your meaningless lives will soon be forfeit.")
	pUnit:PlaySoundToSet(11015)
	pUnit:RegisterEvent("KazAttacks", 1000, 0)
end

function Kaz_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Kaz_OnKilledTarget(pUnit, Event)
	local speech = math.random(1,2)
	if(speech == 1) then
		pUnit:SendChatMessage(14, 0, "Your death will be a painful one.")
		pUnit:PlaySoundToSet(11016)
	else
		pUnit:SendChatMessage(14, 0, "You... are marked.")
		pUnit:PlaySoundToSet(11052)
	end
end

function Kaz_OnDeath(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Hahahahaa aahaah!")
	pUnit:PlaySoundToSet(11018)
end

function KazAttacks(pUnit, Event)
	pUnit:RegisterEvent("KazCleave", math.random(30000,60000), 0)
	pUnit:RegisterEvent("KazMOKR", math.random(30000,60000), 0)
	pUnit:RegisterEvent("KazStomp", math.random(25000,45000), 0)
	pUnit:RegisterEvent("KazDispel", math.random(30000,60000), 0)
end

function KazCleave(pUnit, Event)
	pUnit:CastSpellOnTarget(31345, pUnit:GetMainTank())
end

function KazMOKR(pUnit, Event)
	local speech = math.random(1,2)
	if(speech == 1) then
		pUnit:SendChatMessage(14, 0, "You are nothing!")
		pUnit:PlaysoundToSet(11053)
		pUnit:CastSpellOnTarget(31447, pUnit:GetInRangePlayers())
	else
		pUnit:SendChatMessage(14, 0, "Miserable nuisance!")
		pUnit:PlaySoundToSet(11054)
		pUnit:CastSpellOnTarget(31447, pUnit:GetInRangePlayers())
	end
end

function KazStomp(pUnit, Event)
	pUnit:CastSpell(31408)
end

function KazDispel(pUnit, Event)
	pUnit:CastSpellOnTarget(43577, pUnit:GetRandomPlayer(0))
end

RegisterUnitEvent(17888, 1, "Kaz_OnCombat")
RegisterUnitEvent(17888, 2, "Kaz_OnLeaveCombat")
RegisterUnitEvent(17888, 3, "Kaz_OnKilledTarget")
RegisterUnitEvent(17888, 4, "Kaz_OnDeath")

function winterchill_start(Unit, Event)
   	Unit:SendChatMessage(14, 0, "The Legion's final conquest has begun! Once again the subjugation of this world is within our grasp. Let none survive!")
   	Unit:PlaySoundToSet(11022)
   	Unit:RegisterEvent("winterchill_dnd", 100, 0)
   	Unit:RegisterEvent("winterchill_fa", 100, 0)
   	Unit:RegisterEvent("winterchill_enrage", 600000, 0)
end

function winterchill_dnd(Unit, Event)
   	Unit:RemoveEvents()
    local speech = math.random(1,2)
    if(speech == 1) then
       	Unit:SendChatMessage(14, 0, "Crumble and rot!")
       	Unit:PlaySoundToSet(11023)
    else
       	Unit:SendChatMessage(14, 0, "Ashes to ashes, dust to dust!")
       	Unit:PlaySoundToSet(11055)
    end
    if(Unit:GetRandomPlayer(0) ~= nil) then
    	Unit:FullCastSpellOnTarget(39658, Unit:GetRandomPlayer(0))
    end
    local nextcast = math.random(1,2)
    if(nextcast == 1) then
       	Unit:RegisterEvent("winterchill_fb", math.random(30000,60000), 0)
    else
       	Unit:RegisterEvent("winterchill_fn", math.random(30000,60000), 0)
    end
end

function winterchill_fb(Unit, Event)
   	Unit:RemoveEvents()
    local speech = math.random(1,2)
    if(speech == 1) then
       	Unit:SendChatMessage(14, 0, "Succumb to the icy chill... of death.")
        --Unit:PlaySoundToSet(ID)
    else
       	Unit:SendChatMesasge(13, 0, "It will be much colder in your grave.")
        --Unit:PlaySoundToSet(ID)
    end
    if(Unit:GetRandomPlayer(0) ~= nil) then
    	Unit:CastSpellOnTarget(41486, Unit:GetRandomPlayer(0))
    end
    local randomtimer = math.random(30000,60000)
	local nextcast = math.random(1,2)
    if(nextcast == 1) then
       	Unit:RegisterEvent("winterchill_dnd", math.random(30000,60000), 0)
    else
       	Unit:RegisterEvent("winterchill_fn", math.random(30000,60000), 0)
    end
end

function winterchill_fn(Unit, Event)
   	Unit:RemoveEvents()
    local speach = math.random(1, 2)
    if (speach == 1) then
       	Unit:SendChatMessage(14, 0, "Succumb to the icy chill... of death.")
        --	Unit:PlaySoundToSet(ID)
    elseif (speach == 2) then
       	Unit:SendChatMesasge(13, 0, "It will be much colder in your grave.")
        --	Unit:PlaySoundToSet(ID)
    end    
    local oncast =	Unit:GetRandomPlayer(0)
    if (oncast ~= nil) then
    	Unit:CastSpellOnTarget(31250, oncast)
    end
    local randomtimer = math.random(30000, 60000)
	local nextcast = math.random(1, 2)
    if (nextcast == 1) then
       	Unit:RegisterEvent("winterchill_dnd", randomtimer, 0)
    elseif (nextcast == 2) then
       	Unit:RegisterEvent("winterchill_fb", randomtimer, 0)
    end    
end

function winterchill_fa(Unit, Event)
   	Unit:RemoveEvents()
   	Unit:CastSpellOnTarget(31256, Unit)
   	Unit:RegisterEvent("winterchill_fa", math.random(30000,60000), 0)
end
    
function winterchill_enrage(Unit, Event)
   	Unit:RemoveEvents()
   	Unit:CastSpellOnTarget(46587, Unit)
end

function winterchill_killplayer(Unit, Event)
   	Unit:RemoveEvents()
    local speech = math.random(1,3)
    if(speech == 1) then
       	Unit:SendChatMessage(14, 0, "All life must perish!")
       	Unit:PlaySoundToSet(11025)
    elseif(speech == 2) then
       	Unit:SendChatMessage(14, 0, "Your world is ours now!")
       	Unit:PlaySoundToSet(11056)
    else
       	Unit:SendChatMessage(14, 0, "Victory to the Legion!")
       	Unit:PlaySoundToSet(11057)
    end
end

function winterchill_death(Unit, Event)
   	Unit:SendChatMessage(14, 0, "You have won this battle, but not... the... war.")
   	Unit:PlaySoundToSet(11026)
   	Unit:RemoveEvents()
end
    
RegisterUnitEvent(17767, 1, "winterchill_start")
RegisterUnitEvent(17767, 3, "winterchill_killplayer")
RegisterUnitEvent(17767, 4, "winterchill_death")
RegisterUnitEvent(17767, 5, "winterchill_dnd")
RegisterUnitEvent(17767, 5, "winterchill_fb")
RegisterUnitEvent(17767, 5, "winterchill_fn")
RegisterUnitEvent(17767, 5, "winterchill_fa")
RegisterUnitEvent(17767, 5, "winterchill_enrage")

function Aneth_OnEnterCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "You are defenders of a doomed world! Flee here, and perhaps you will prolong your pathetic lives!")
	pUnit:PlaySoundToSet(10977)
	pUnit:RegisterEvent("AnethCS", math.random(11000, 15000), 0)
	pUnit:RegisterEvent("AnethInferno", 60000, 0)
	pUnit:RegisterEvent("AnethSleep", 7000, 0)
	pUnit:RegisterEvent("AnethAura", 1000, 0)
	pUnit:RegisterEvent("AnethEnrage", 600000, 0)
end

function Aneth_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Aneth_OnKilledTarget(pUnit, Event)
	local AnethOKT = math.random(1,3)
	if(AnethOKT == 1) then
		pUnit:SendChatMessage(14, 0, "Your hopes are lost!")
		pUnit:PlaySoundToSet(10981)
	elseif(AnethOKt == 2) then
		pUnit:SendChatMessage(14, 0, "Scream for me.")
		pUnit:PlaySoundToSet(11038)
	elseif(AnethOKT == 3) then
		pUnit:SendChatMessage(14, 0, "Pity, no time for a slow death!")
		pUnit:PlaySoundToSet(11039)
	end
end

function Aneth_OnDeath(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "The clock... is still... ticking.")
	pUnit:PlaySoundToSet(10982)
end

function AnethCS(pUnit, Event)
	pUnit:CastSpell()
	local AnethCSSpeech = math.random(1,2)
	if(AnethCSSpeech == 1) then
		pUnit:SendChatMessage(14, 0, "The swarm is eager to feed.")
		--pUnit:PlaySoundToSet()
	elseif(AnethCSSpeech == 2) then
		pUnit:SendChatMessage(14, 0, "Pestilence upon you!")
		--pUnit:PlaySoundToSet( )
	end
end

function AnethInferno(pUnit, Event)
	pUnit:CastSpell(31299)
	local InfernoSpeech =  math.random(1,2)
	if(InfernoSpeech == 1) then
		pUnit:SendChatMessage(14, 0, "Earth and sky shall burn!")
		--pUnit:PlaySoundToSet()
	elseif(InfernoSpeech == 2) then
		pUnit:SendChatMessage(14, 0, "Let fire rain from above!")
		--pUnit:PlaysoundToSet()
	end
end

function AnethSleep(pUnit, Event)
	pUnit:CastSpell()
	local SleepSpeech =  math.random(1,2)
	if(SleepSpeech == 1) then
		pUnit:SendChatMessage(14, 0, "You look tired....")
		pUnit:PlaySoundToSet(10978)
	elseif(SleepSpeech == 2) then
		pUnit:SendChatMessage(14, 0, "Sweet dreams.")
		--pUnit:PlaySoundToSet()
	end
end

function AnethAura(pUnit, Event)
	pUnit:CastSpell(38196)
end

function AnethEnrage(pUnit, Event)
	pUnit:CastSpell(26662)
end

RegisterUnitEvent(17808, 1, "Aneth_OnEnterCombat")
RegisterUnitEvent(17808, 2, "Aneth_OnLeaveCombat")
RegisterUnitEvent(17808, 3, "Aneth_OnKilledTarget")
RegisterUnitEvent(17808, 4, "Aneth_OnDeath")