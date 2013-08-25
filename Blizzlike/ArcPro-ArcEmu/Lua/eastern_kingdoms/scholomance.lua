--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation, DARKI
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

local SUMMON = 23261

function Deathknight_OnCombat(Unit, Event)
end

function Deathknight_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Deathknight_OnKilledTarget(Unit, Event)
	Unit:CastSpell(SUMMON)
end

function Deathknight_OnDied(Unit, Event)
	Unit:RemoveEvents()
end 

RegisterUnitEvent(14516, 1, "Deathknight_OnCombat")
RegisterUnitEvent(14516, 2, "Deathknight_OnLeaveCombat")
RegisterUnitEvent(14516, 3, "Deathknight_OnKilledTarget")
RegisterUnitEvent(14516, 4, "Deathknight_OnDied")

local REND = 18106
local CLEAVE = 15584
local FRENZY = 28371

function Doctor_OnCombat(Unit, Event)
local rend = 8000+math.random(1, 2000)
local cleave = 9000+math.random(1, 1000)
local frenzy = math.random(1, 8000)
	pUnit:SendChatMessage(12, 0, "The doctor is in!")
	Unit:RegisterEvent("Doctor_Rend", rend, 0)
	Unit:RegisterEvent("Doctor_Cleave", cleave, 0)
	Unit:RegisterEvent("Doctor_Frenzy", frenzy, 0)
end

function Doctor_Rend(Unit, Event)
local RandomPlayer = Unit:GetRandomPlayer()
	Unit:FullCastSpellOnTarget(REND, RandomPlayer)
end

function Doctor_Cleave(Unit, Event)
local RandomPlayer = Unit:GetRandomPlayer()
	Unit:FullCastSpellOnTarget(CLEAVE, RandomPlayer)
end

function Doctor_Frenzy(Unit, Event)
	Unit:CastSpell(FRENZY)
	--Textemote: verwandelt sich in einen t\195\182dlichen Frenzy!Need translate
end

function Doctor_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Doctor_OnDied(Unit, Event)
	Unit:RemoveEvents()
	Unit:SpawnCreature(1853, 180.73, -9.43856, 75.507, 0, 0)
end

RegisterUnitEvent(11261, 1, "Doctor_OnCombat")
RegisterUnitEvent(11261, 2, "Doctor_OnLeaveCombat")
RegisterUnitEvent(11261, 4, "Doctor_OnDied")

local SHADOWBOLTVOLLEY = 20741
local BONESHIELD = 27688

function Kormok_OnCombat(Unit, Event)
local shadow = 10000+math.random(1, 5000)
local bone = 2000+math.random(1, 43000)
	Unit:RegisterEvent("Kormok_Shadow", shadow, 0)
	Unit:RegisterEvent("Kormok_Bone", bone, 0)
end

function Kormok_Shadow(Unit, Event)
local RandomPlayer = Unit:GetRandomPlayer()
	Unit:FullCastSpellOnTarget(SHADOWBOLTVOLLEY, RandomPlayer)
end

function Kormok_Bone(Unit, Event)
local RandomPlayer = Unit:GetRandomPlayer()
	Unit:FullCastSpellOnTarget(BONESHIELD, RandomPlayer)
end

function Kormok_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Kormok_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(16118, 1, "Kormok_OnCombat")
RegisterUnitEvent(16118, 2, "Kormok_OnLeaveCombat")
RegisterUnitEvent(16118, 4, "Kormok_OnDied")

local CURSEOFAGONY = 18671
local SHADOWSHOCK = 20603
local SILENCE = 15487
local FEAR = 6215

function Barov_OnCombat(Unit, Event)
local cursetimer = 18000+math.random(1, 12000)
local shocktimer = 9000+math.random(1, 3000)
local silencetimer = 5000+math.random(1, 9000)
	Unit:RegisterEvent("Barov_Curse", cursetimer, 0)
	Unit:RegisterEvent("Barov_Shock", shocktimer, 0)
	Unit:RegisterEvent("Barov_Silence", silencetimer, 0)
	Unit:RegisterEvent("Barov_Fear", 30000, 0)
end 

function Barov_Curse(Unit, Event)
local RandomPlayer = Unit:GetRandomPlayer()
	Unit:FullCastSpellOnTarget(CURSEOFAGONY, RandomPlayer)
end

function Barov_Shock(Unit, Event)
local RandomPlayer = Unit:GetRandomPlayer()
	Unit:FullCastSpellOnTarget(SHADOWSHOCK, RandomPlayer)
end

function Barov_Silence(Unit, Event)
local RandomPlayer = Unit:GetRandomPlayer(7)
	Unit:FullCastSpellOnTarget(SILENCE, RandomPlayer)
end

function Barov_Fear(Unit, Event)
local RandomPlayer = Unit:GetRandomPlayer()
	Unit:FullCastSpellOnTarget(FEAR, RandomPlayer)
end

function Barov_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Barov_OnDied(Unit, Event)
	Unit:RemoveEvents()
	Unit:SpawnCreature(1853, 180.73, -9.43856, 75.507, 0, 0)
end 

RegisterUnitEvent(10502, 1, "Barov_OnCombat")
RegisterUnitEvent(10502, 2, "Barov_OnLeaveCombat")
RegisterUnitEvent(10502, 4, "Barov_OnDied")

local IMMOLATE = 20294
local VEILOFSHADOW = 17820

function Lord_OnCombat(Unit, Event)
local immolate = 7000+math.random(1, 5000)
local shadow = 15000+math.random(1, 5000)
	Unit:RegisterEvent("Lord_Immolate", immolate, 0)
	Unit:RegisterEvent("Lord_Shadow", shadow, 0)
end

function Lord_Immolate(Unit, Event)
local RandomPlayer = Unit:GetRandomPlayer()
	Unit:FullCastSpellOnTarget(IMMOLATE, RandomPlayer)
end

function Lord_Shadow(Unit, Event)
local RandomPlayer = Unit:GetRandomPlayer()
	Unit:FullCastSpellOnTarget(VEILOFSHADOW, RandomPlayer)
end

function Lord_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Lord_OnDied(Unit, Event)
	Unit:RemoveEvents()
	Unit:SpawnCreature(1853, 180.73, -9.43856, 75.507, 0, 0)
end 

RegisterUnitEvent(10504, 1, "Lord_OnCombat")
RegisterUnitEvent(10504, 2, "Lord_OnLeaveCombat")
RegisterUnitEvent(10504, 4, "Lord_OnDied")