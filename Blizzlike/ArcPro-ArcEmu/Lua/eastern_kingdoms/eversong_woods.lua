--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: Ascendscripting, Yerney
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function Jessel_OnSpawn(Unit,Event)
	Unit:CastSpell(35112)
	Unit:CastSpell(35112)
	Unit:RegisterEvent("Jessel_Text", 90000, 0)
end

function Jessel_Text(Unit,Event)
	Unit:RemoveAura(35112)
	Unit:SendChatMessage(16, 0, "Jessel wakes up, startled.")
	Unit:RegisterEvent("Jessel_Talk", 2000, 1)
end

function Jessel_Talk(Unit,Event)
	Unit:SendChatMessage(12, 1, "Was... Was it all a dream? Azuremyst, Bloodmyst, Zangarmarsh, Shadowmoon... even Zul'Aman... Jane! Jane where are you!")
	Unit:RegisterEvent("Jessel_JaneTalk", 5000, 1)
end

function Jessel_JaneTalk(Unit,Event)
local X,Y,Z = Unit:GetX(),Unit:GetY(),Unit:GetZ()
local Jane = Unit:GetCreatureNearestCoords(X,Y,Z,20098)
	Jane:SendChatMessage(12, 1, "I'm right here, daddy. You've been asleep all day long. You sure must be tired!")
	Jane:SendChatMessage(16, 0, "Jane resumes playing on the beach.")
	Unit:RegisterEvent("Jessel_TalkBack", 3000, 1)
end

function Jessel_TalkBack(Unit,Event)
	Unit:CastSpell(35112)
	Unit:SendChatMessage(12, 1, "Ah, wonderful. It was all just a dream...")
end

function Jessel_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

function Jessel_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20100, 18, "Jessel_OnSpawn")
RegisterUnitEvent(20100, 2, "Jessel_OnLeaveCombat")
RegisterUnitEvent(20100, 3, "Jessel_OnDied")

function ManaWyrm_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("ManaWyrm_FaerieFire", 16000, 0)
end

function ManaWyrm_FaerieFire(Unit,Event)
	if(Unit:GetMainTank() ~= nil) then 
		return
	else
		Unit:FullCastSpellOnTarget(25602, Unit:GetMainTank())
	end
end

function ManaWyrm_OnLeaveCombat(Unit,Event)
	Unit:CancelSpell()
	Unit:RemoveEvents()
end

function ManaWyrm_OnDied(Unit,Event)
	Unit:CancelSpell()
	Unit:RemoveEvents()
end

function ManaWyrm_OnKill(Unit,Event)
	Unit:CancelSpell()
	Unit:RemoveEvents()
end

RegisterUnitEvent(15274, 1, "ManaWyrm_OnEnterCombat")
RegisterUnitEvent(15274, 2, "ManaWyrm_OnLeaveCombat")
RegisterUnitEvent(15274, 3, "ManaWyrm_OnDied")
RegisterUnitEvent(15274, 4, "ManaWyrm_OnKill")

function Nova_OnSpawn(Unit, Event)
local RegText = math.random(1,4)
	Unit:RegisterEvent("Nova_SummonCat", 48000, 0)
	if(RegText == 1) then
		Unit:RegisterEvent("Nova_Text", 21000, 0)
	elseif(RegText == 2) then
		Unit:RegisterEvent("Nova_Text", 24000, 0)
	elseif(RegText == 3) then
		Unit:RegisterEvent("Nova_Text", 35000, 0)
	elseif(RegText == 4) then
		Unit:RegisterEvent("Nova_Text", 48000, 0)
	end
end

function Nova_Text(Unit, Event)
local Random = math.random(1,3)
	Unit:RegisterEvent("Nova_Talk", 2000, 1)
	if(Random == 1) then
		Unit:SendChatMessage(16, 0, "Nova shakes the dirt loose from the shell.")
	elseif(Random == 2) then
		Unit:SendChatMessage(16, 0, "Nova holds a sea shell up to her ear.")
	elseif(Random == 3) then
		Unit:SendChatMessage(16, 0, "Nova picks up a sea shell.")
	end
end

function Nova_Talk(Unit, Event)
local Random = math.random(1,3)
	Unit:RemoveEvents()
	Unit:RegisterEvent("Nova_OnSpawn", 2000, 0)
	if(Random == 1) then
		Unit:SendChatMessage(12, 1, "I think I can see the Sunwell from here!")
	elseif(Random == 2) then
		Unit:SendChatMessage(12, 1, "Oooh! Look, a shiny one!")
	elseif(Random == 3) then
		Unit:SendChatMessage(12, 1, "Can you really hear the ocean from one of these shells?")
	end
end

function Nova_SummonCat(Unit, Event)
	Unit:CastSpell(35052)
end

function Nova_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function Nova_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20244, 18, "Nova_OnSpawn")
RegisterUnitEvent(20244, 2, "Nova_OnLeaveCombat")
RegisterUnitEvent(20244, 3, "Nova_OnDied")

--Amani Axe Thrower
function AmaniAxe_OnCombat(Unit, Event)
	Unit:RegisterEvent("AmaniAxe_Throw", 3000, 0)
end

function AmaniAxe_Throw(Unit, Event)
	Unit:FullCastSpellOnTarget(10277, Unit:GetClosestPlayer())
end

function AmaniAxe_LeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function AmaniAxe_Dead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(15641, 1, "AmaniAxe_OnCombat")
RegisterUnitEvent(15641, 2, "AmaniAxe_LeaveCombat")
RegisterUnitEvent(15641, 4, "AmaniAxe_Dead")

--Amani Berserker
function AmaniBerserker_OnCombat(Unit, Event)
	Unit:RegisterEvent("AmaniBerserker_Enrage", 7000, 1)
end

function AmaniBerserker_Enrage(Unit, Event)
	Unit:FullCastSpell(8599)
end

function AmaniBerserker_LeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function AmaniBerserker_Dead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(15643, 1, "AmaniBerserker_OnCombat")
RegisterUnitEvent(15643, 2, "AmaniBerserker_LeaveCombat")
RegisterUnitEvent(15643, 4, "AmaniBerserker_Dead")

--Amani ShadowPriest
function AmaniPriest_OnCombat(Unit, Event)
	Unit:RegisterEvent("AmaniPriest_Pain", 6000, 1)
end

function AmaniPriest_Pain(Unit, Event)
	Unit:FullCastSpellOnTarget(11639, Unit:GetClosestPlayer())
end

function AmaniPriest_LeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function AmaniPriest_Dead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(15642, 1, "AmaniPriest_OnCombat")
RegisterUnitEvent(15642, 2, "AmaniPriest_LeaveCombat")
RegisterUnitEvent(15642, 4, "AmaniPriest_Dead")

--AngerShade
function AngerShade_OnCombat(Unit, Event)
	Unit:RegisterEvent("AngerShade_Enrage", 7000, 1)
end

function AngerShade_Enrage(Unit, Event)
	Unit:FullCastSpell(8599)
end

function AngerShade_LeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function AngerShade_Dead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(15656, 1, "AngerShade_OnCombat")
RegisterUnitEvent(15656, 2, "AngerShade_LeaveCombat")
RegisterUnitEvent(15656, 4, "AngerShade_Dead")

--Arcane Wraith
function ArcaneWraith_OnCombat(Unit, Event)
	Unit:RegisterEvent("ArcaneWraith_ArcaneBolt", 4000, 0)
end

function ArcaneWraith_ArcaneBolt(Unit, Event)
	Unit:FullCastSpellOnTarget(37361, Unit:GetClosestPlayer())
end

function ArcaneWraith_LeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function ArcaneWraith_Dead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(15273, 1, "ArcaneWraith_OnCombat")
RegisterUnitEvent(15273, 2, "ArcaneWraith_LeaveCombat")
RegisterUnitEvent(15273, 4, "ArcaneWraith_Dead")

--DarkWraith
function DarkWraith_OnCombat(Unit, Event)
	Unit:RegisterEvent("DarkWraith_Enrage", 7000, 1)
end

function DarkWraith_Enrage(Unit, Event)
	Unit:FullCastSpell(8599)
end

function DarkWraith_LeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function DarkWraith_Dead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(15657, 1, "DarkWraith_OnCombat")
RegisterUnitEvent(15657, 2, "DarkWraith_LeaveCombat")
RegisterUnitEvent(15657, 4, "DarkWraith_Dead")

--Feral Tender
function FeralTen_OnCombat(Unit, Event)
	Unit:RegisterEvent("FeralTen_Renew", 9000, 1)
end

function FeralTen_Renew(Unit, Event)
	Unit:FullCastSpell(31325)
end

function FeralTen_LeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function FeralTen_Dead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(15294, 1, "FeralTen_OnCombat")
RegisterUnitEvent(15294, 2, "FeralTen_LeaveCombat")
RegisterUnitEvent(15294, 4, "FeralTen_Dead")

--ManaSerpent
function ManaSerpent_OnCombat(Unit, Event)
	Unit:RegisterEvent("ManaSerpent_FairieFire", 4000, 1)
end

function ManaSerpent_FairieFire(Unit, Event)
	Unit:FullCastSpellOnTarget(25602, Unit:GetClosestPlayer())
end

function ManaSerpent_LeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function ManaSerpent_Dead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(15966, 1, "ManaSerpent_OnCombat")
RegisterUnitEvent(15966, 2, "ManaSerpent_LeaveCombat")
RegisterUnitEvent(15966, 4, "ManaSerpent_Dead")

--Mana Stalker--
function ManaStalker_OnCombat(Unit, Event)
	Unit:RegisterEvent("ManaStalker_MoonFire", 4000, 1)
end

function ManaStalker_MoonFire(Unit, Event)
	Unit:FullCastSpellOnTarget(25602, Unit:GetClosestPlayer())
end

function ManaStalker_LeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function ManaStalker_Dead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(15647, 1, "ManaStalker_OnCombat")
RegisterUnitEvent(15647, 2, "ManaStalker_LeaveCombat")
RegisterUnitEvent(15647, 4, "ManaStalker_Dead")

--ManaWraith
function ManaWraith_OnCombat(Unit, Event)
	Unit:RegisterEvent("ManaWraith_FairieFire", 4000, 1)
end

function ManaWraith_FairieFire(Unit, Event)
	Unit:FullCastSpellOnTarget(25602, Unit:GetClosestPlayer())
end

function ManaWraith_LeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function ManaWraith_Dead(Unit, Event)
	Unit:CastSpell(29109)
	Unit:RemoveEvents()
end

RegisterUnitEvent(15648, 1, "ManaWraith_OnCombat")
RegisterUnitEvent(15648, 2, "ManaWraith_LeaveCombat")
RegisterUnitEvent(15648, 4, "ManaWraith_Dead")

--PlagueBonePillager
function PlagueBonePillager_OnCombat(Unit, Event)
	Unit:RegisterEvent("PlagueBonePillager_Strike", 5000, 0)
end

function PlagueBonePillager_Strike(Unit, Event)
	Unit:FullCastSpellOnTarget(11976, Unit:GetClosestPlayer())
end

function PlagueBonePillager_LeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function PlagueBonePillager_Dead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(15654, 1, "PlagueBonePillager_OnCombat")
RegisterUnitEvent(15654, 2, "PlagueBonePillager_LeaveCombat")
RegisterUnitEvent(15654, 4, "PlagueBonePillager_Dead")

--RotlimbMarauder
function RotlimbMarauder_OnCombat(Unit, Event)
	Unit:RegisterEvent("RotlimbMarauder_DiseaseTouch", 5000, 1)
end

function RotlimbMarauder_DiseaseTouch(Unit, Event)
	Unit:FullCastSpellOnTarget(3234, Unit:GetClosestPlayer())
end

function RotlimbMarauder_LeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function RotlimbMarauder_Dead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(15658, 1, "RotlimbMarauder_OnCombat")
RegisterUnitEvent(15658, 2, "RotlimbMarauder_LeaveCombat")
RegisterUnitEvent(15658, 4, "RotlimbMarauder_Dead")

--WitheredGreenKeeper
function WitheredGreenKeeper_OnCombat(Unit, Event)
	Unit:RegisterEvent("WitheredGreenKeeper_Strike", 5000, 0)
end

function WitheredGreenKeeper_Strike(Unit, Event)
	Unit:FullCastSpellOnTarget(13584, Unit:GetClosestPlayer())
end

function WitheredGreenKeeper_LeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function WitheredGreenKeeper_Dead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(15637, 1, "WitheredGreenKeeper_OnCombat")
RegisterUnitEvent(15637, 2, "WitheredGreenKeeper_LeaveCombat")
RegisterUnitEvent(15637, 4, "WitheredGreenKeeper_Dead")

--WrecthedHooligan
function WrecthedHooligan_OnCombat(Unit, Event)
	Unit:RegisterEvent("WrecthedHooligan_Strike", 5000, 0)
	Unit:RegisterEvent("WrecthedHooligan_Bitter", 12000, 1)
end

function WrecthedHooligan_Strike(Unit, Event)
	Unit:FullCastSpellOnTarget(14873, Unit:GetClosestPlayer())
end

function WrecthedHooligan_Bitter(Unit, Event)
	Unit:FullCastSpellOnTarget(29098, Unit:GetClosestPlayer())
end

function WrecthedHooligan_LeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function WrecthedHooligan_Dead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(16162, 1, "WrecthedHooligan_OnCombat")
RegisterUnitEvent(16162, 2, "WrecthedHooligan_LeaveCombat")
RegisterUnitEvent(16162, 4, "WrecthedHooligan_Dead")

--WrecthedThug
function WrecthedThug_OnCombat(Unit, Event)
	Unit:RegisterEvent("WrecthedHooligan_Strike", 5000, 0)
	Unit:RegisterEvent("WrecthedThug_Bitter", 12000, 1)
end

function WrecthedThug_Bitter(Unit, Event)
	Unit:FullCastSpellOnTarget(29098, Unit:GetClosestPlayer())
end

function WrecthedThug_LeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function WrecthedThug_Dead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(15645, 1, "WrecthedThug_OnCombat")
RegisterUnitEvent(15645, 2, "WrecthedThug_LeaveCombat")
RegisterUnitEvent(15645, 4, "WrecthedThug_Dead")