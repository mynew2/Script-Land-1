--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: Grimton1337
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

local Obsidius = nil
Obsidius = {}

function Obsidius_OnSpawn(pUnit, Event)
	Obsidius = pUnit
end

function Obsidius_OnCombat(pUnit, Event)
	Obsidius:SendChatMessage(14, 0, "You come seeking answers? Then have them! Look upon your answer to living!")
	Obsidius:PlaySoundToSet(18899)
	Obsidius:RegisterEvent(Stone_Blow, math.random(20000,30000), 0)
	Obsidius:RegisterEvent(Transformation, math.random(30000,40000), 0)
	Obsidius:RegisterEvent(Twilight_Corruption, math.random(27000,45000), 0)
end

function Stone_Blow(pUnit, Event)
	Obsidius:FullCastSpellOnTarget(76185, Obsidius:GetMainTank())
end

function Transformation(pUnit, Event)
	Obsidius:SendChatMessage(42, 0, "Ascendant Lord Obsidius prepares to trade places with one of his shadows!")
	Obsidius:SendChatMessage(14, 0, "Earth can be shaped, molded... You cannot! You are useless!")
	Obsidius:PlaySoundToSet(18905)
	Obsidius:FullCastSpell(76274)
	Obsidius:FullCastSpell(76200)
	Obsidius:FullCastSpell(76242)
end

function Twilight_Corruption(pUnit, Event)
	Obsidius:FullCastSpellOnTarget(76188, Obsidius:GetRandomPlayer(0))
end

function Obsidius_OnKilledPlayer(pUnit, Event)
	Obsidius:SendChatMessage(14, 0, "Your kind has no place in the master's world!")
	Obsidius:PlaySoundToSet(18901)
end

function Obsidius_OnDeath(pUnit, Event)
	Obsidius:SendChatMessage(14, 0, "I cannot be destroyed... Only de... layed...")
	Obsidius:PlaySoundToSet(18902)
end

RegisterUnitEvent(39705, 18, "Obsidius_OnSpawn")
RegisterUnitEvent(39705, 1, "Obsidius_OnCombat")
RegisterUnitEvent(39705, 3, "Obsidius_OnKilledPlayer")
RegisterUnitEvent(39705, 4, "Obsidius_OnDeath")