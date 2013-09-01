--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: Justin, Yerney, ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

-- Chieftain
function Chieftain_OnCombat(Unit, Event)
	Unit:RegisterEvent("Chieftain_Spellname", 9000, 0)
	Unit:RegisterEvent("Chieftain_enrage", 16000, 1)
end

function Chieftain_Spellname(pUnit, Event)
	pUnit:CastSpellOnTarget(13446, pUnit:GetClosestPlayer())
end

function Chieftain_enrage(pUnit, Event)
	pUnit:CastSpell(18501) 
end

function Chieftain_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function Chieftain_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(17448, 1, "Chieftain_OnCombat")
RegisterUnitEvent(17448, 2, "Chieftain_OnLeaveCombat")
RegisterUnitEvent(17448, 4, "Chieftain_OnDied")

-- Cookie McWeaksauce
function CookieMcWeaksauce_OnCombat(Unit, Event)
	Unit:RegisterEvent("CookieMcWeaksauce_Shoot", 6000, 0)
end

function CookieMcWeaksauce_Shoot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(30221, 	pUnit:GetRandomPlayer(0)) 
end

function CookieMcWeaksauce_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CookieMcWeaksauce_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17246, 1, "CookieMcWeaksauce_OnCombat")
RegisterUnitEvent(17246, 2, "CookieMcWeaksauce_OnLeaveCombat")
RegisterUnitEvent(17246, 4, "CookieMcWeaksauce_OnDied")

--[[
    Draenei Survivor says: Everything hurts. Please, make it stop...
    Draenei Survivor says: Huh? What happened? Oh... my head feels like it's going to explode! I'd best get back to the crash site.
    Draenei Survivor says: Huh? What happened? Oh... my head feels like it's going to explode! I'd best get to the crash site.
    Draenei Survivor says: Hunter, you saved me! I owe you a debt that I can never repay. I'll go see if I can help the others.
	Draenei Survivor says: I don't know if I can make it. Please help me...
    Draenei Survivor says: Mage, you saved me! I owe you a debt that I can never repay. I'll go see if I can help the others.
    Draenei Survivor says: Many thanks to you, hunter. I'd best get to the crash site and see how I can help out. Until we meet again.
    Draenei Survivor says: Many thanks to you, mage. I'd best get to the crash site and see how I can help out. Until we meet again.
    Draenei Survivor says: Many thanks to you, paladin. I'd best get to the crash site and see how I can help out. Until we meet again.
    Draenei Survivor says: Many thanks to you, priest. I'd best get to the crash site and see how I can help out. Until we meet again.
    Draenei Survivor says: Many thanks to you, shaman. I'd best get to the crash site and see how I can help out. Until we meet again.
    Draenei Survivor says: Many thanks to you, warrior. I'd best get to the crash site and see how I can help out. Until we meet again.
    Draenei Survivor says: Monk, you saved me! I owe you a debt that I can never repay. I'll go see if I can help the others.
    Draenei Survivor says: Oh no! Where are we? What happened? Look, there's part of the ship!
	Draenei Survivor says: Oh, the pain...
    Draenei Survivor says: Paladin, you saved me! I owe you a debt that I can never repay. I'll go see if I can help the others.
    Draenei Survivor says: Priest, you saved me! I owe you a debt that I can never repay. I'll go see if I can help the others.
    Draenei Survivor says: Shaman, you saved me! I owe you a debt that I can never repay. I'll go see if I can help the others.
    Draenei Survivor says: The last thing I remember is the ship falling and us getting into the pods. I'll go see how I can help. Thank you!
    Draenei Survivor says: The Light be praised! I would have died out here if it weren't for you, hunter! I must get to the ship.
    Draenei Survivor says: The Light be praised! I would have died out here if it weren't for you, mage! I must get to the ship.
    Draenei Survivor says: The Light be praised! I would have died out here if it weren't for you, monk! I must get to the ship.
    Draenei Survivor says: The Light be praised! I would have died out here if it weren't for you, paladin! I must get to the ship.
    Draenei Survivor says: The Light be praised! I would have died out here if it weren't for you, priest! I must get to the ship.
    Draenei Survivor says: The Light be praised! I would have died out here if it weren't for you, shaman! I must get to the ship.
    Draenei Survivor says: The Light be praised! I would have died out here if it weren't for you, warrior! I must get to the ship.
    Draenei Survivor says: Ugh... what is this place? Is that all that's left of the ship over there?
	Draenei Survivor says: Ughhh... I hurt. Can you help me?
    Draenei Survivor says: Warrior, you saved me! I owe you a debt that I can never repay. I'll go see if I can help the others.
    Draenei Survivor says: Where am I? Who are you? Oh no! What happened to the ship?
]]--

DRAENEISURVIVOR = {}
INJUREDDRAENEI = {}

function DRAENEISURVIVOR_OnSpawn(Unit, event, player)
local SurvivorDraeneiChance = math.random(1, 3)
	Unit:RegisterEvent("DRAENEISURVIVOR_Say", 30000, 0)
	if(SurvivorDraeneiChance == 1) then
		pUnit:SetStandState(3)
	elseif(SurvivorDraeneiChance == 2) then
		pUnit:CastSpell(28630)
		pUnit:SetStandState(1)
	elseif(SurvivorDraeneiChance == 3) then
		pUnit:CastSpell(28630)
		pUnit:SetCombatCapable(0)
	end
end

function DRAENEISURVIVOR_OnDied(Unit, event, player)
	Unit:RemoveEvents()
end

function DRAENEISURVIVOR_Say(Unit, event, player)
local chance = math.random(1, 3)
	if(chance == 1) then
		Unit:SendChatMessage(12, 35, "Ughhh... I hurt. Can you help me?" )
	elseif(chance == 2) then
		Unit:SendChatMessage(12, 35, "Oh, the pain...")
	elseif(chance == 3) then
		Unit:SendChatMessage(12, 35, "I don't know if I can make it. Please help me...")
	end
end

RegisterUnitEvent(16483, 18, "DRAENEISURVIVOR_OnSpawn")
RegisterUnitEvent(16483, 4, "DRAENEISURVIVOR_OnDied")

--Injured Draenei 
function INJUREDDRAENEI_OnSpawn(pUnit, event)
InjuredDraeneiChance = math.random(1, 2)
	if(InjuredDraeneiChance == 1) then
		pUnit:SetStandState(3)
	elseif(InjuredDraeneiChance == 2) then
		pUnit:SetStandState(1)
		pUnit:SetCombatCapable(0)
	end
end

function INJUREDDRAENEI_OnDied(Unit, event, player)
	Unit:RemoveEvents()
end

RegisterUnitEvent(16971, 18, "INJUREDDRAENEI_OnSpawn")
RegisterUnitEvent(16971, 4, "INJUREDDRAENEI_OnDied")

-- Hauteur
function Hauteur_OnCombat(Unit, Event)
	Unit:RegisterEvent("Hauteur_Spellname", 12000, 1)
	Unit:RegisterEvent("Hauteur_enrage", 6000, 1)
end

function Hauteur_Spellname(pUnit, Event)
	pUnit:CastSpellOnTarget(8050, pUnit:GetClosestPlayer())
end

function Hauteur_enrage(pUnit, Event)
	pUnit:CastSpell(134) 
end

function Hauteur_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function Hauteur_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(17206, 1, "Hauteur_OnCombat")
RegisterUnitEvent(17206, 2, "Hauteur_OnLeaveCombat")
RegisterUnitEvent(17206, 4, "Hauteur_OnDied")

-- Surveyor Candress
function SurveyorCandress_OnCombat(Unit, Event)
	Unit:RegisterEvent("SurveyorCandress_Fireball", 8000, 0)
end

function SurveyorCandress_Fireball(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9487, 	pUnit:GetMainTank()) 
end

function SurveyorCandress_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SurveyorCandress_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(16522, 1, "SurveyorCandress_OnCombat")
RegisterUnitEvent(16522, 2, "SurveyorCandress_OnLeaveCombat")
RegisterUnitEvent(16522, 4, "SurveyorCandress_OnDied")

-- Warlord Srisstiz
function WarlordSrisstiz_OnCombat(Unit, Event)
	Unit:RegisterEvent("WarlordSrisstiz_WateryStrike", 6000, 0)
end

function WarlordSrisstiz_WateryStrike(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(31275, 	pUnit:GetMainTank()) 
end

function WarlordSrisstiz_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WarlordSrisstiz_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17298, 1, "WarlordSrisstiz_OnCombat")
RegisterUnitEvent(17298, 2, "WarlordSrisstiz_OnLeaveCombat")
RegisterUnitEvent(17298, 4, "WarlordSrisstiz_OnDied")

--Abberant Owlbeast
function AbberantOwlBeast_OnCombat(Unit, Event)
	Unit:RegisterEvent("AbberantOwlBeast_Spellname", 12000, 0)
end

function AbberantOwlBeast_Spellname(pUnit, Event)
	pUnit:FullCastSpellOnTarget(31270, pUnit:GetClosestPlayer()) 
end

function AbberantOwlBeast_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function AbberantOwlBeast_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(17187, 1, "AbberantOwlBeast_OnCombat")
RegisterUnitEvent(17187, 2, "AbberantOwlBeast_OnLeaveCombat")
RegisterUnitEvent(17187, 4, "AbberantOwlBeast_OnDied")

--Barbed Crawler
function BarbedCrawler_OnCombat(Unit, Event)
	Unit:RegisterEvent("BarbedCrawler_Thorns", 2000, 2)
end

function BarbedCrawler_Thorns(pUnit, Event) 
	pUnit:CastSpell(31271) 
end

function BarbedCrawler_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BarbedCrawler_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17217, 1, "BarbedCrawler_OnCombat")
RegisterUnitEvent(17217, 2, "BarbedCrawler_OnLeaveCombat")
RegisterUnitEvent(17217, 4, "BarbedCrawler_OnDied")

--Blood Elf Bandit
function BloodElfBandit_OnCombat(Unit, Event)
	Unit:RegisterEvent("BloodElfBandit_Spellname", 3000, 0)
	Unit:RegisterEvent("BloodElfBandit_Spellnamq", 6000, 0)
end

function BloodElfBandit_Spellname(pUnit, Event)
	pUnit:CastSpellOnTarget(14873, pUnit:GetClosestPlayer()) 
end

function BloodElfBandit_Spellnamq(pUnit, Event)
	pUnit:CastSpellOnTarget(15691, pUnit:GetClosestPlayer())
end

function BloodElfBandit_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function BloodElfBandit_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(17591, 1, "BloodElfBandit_OnCombat")
RegisterUnitEvent(17591, 2, "BloodElfBandit_OnLeaveCombat")
RegisterUnitEvent(17591, 4, "BloodElfBandit_OnDied")

--Blood Elf Scout
function BloodElfScout_OnCombat(Unit, Event)
	Unit:RegisterEvent("BloodElfScout_Spellname", 12000, 0)
end

function BloodElfScout_Spellname(pUnit, Event)
	pUnit:CastSpellOnTarget(25602, pUnit:GetRandomPlayer(0))
end

function BloodElfScout_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function BloodElfScout_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(16521, 1, "BloodElfScout_OnCombat")
RegisterUnitEvent(16521, 2, "BloodElfScout_OnLeaveCombat")
RegisterUnitEvent(16521, 4, "BloodElfScout_OnDied")

--BristleLimb WindCaller
function BristleLimbWindCaller_OnCombat(Unit, Event)
	Unit:RegisterEvent("BristleLimbWindCaller_Reju", 1000, 0)
	Unit:RegisterEvent("BristleLimbWindCaller_WindShock", 7000, 1)
end

function BristleLimbWindCaller_Reju(Unit, Event)
	if(Unit:GetHealthPct() < 15) then
		Unit:CastSpell(32131)
	end
end

function BristleLimbWindCaller_WindShock(pUnit, Event)
	pUnit:FullCastSpellOnTarget(31272, pUnit:GetClosestPlayer())
end

function BristleLimbWindCaller_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function BristleLimbWindCaller_OnDead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(17184, 1, "BristleLimbWindCaller_OnCombat")
RegisterUnitEvent(17184, 2, "BristleLimbWindCaller_OnLeaveCombat")
RegisterUnitEvent(17184, 4, "BristleLimbWindCaller_OnDead")

--Death Ravager
function DeathRavager_OnCombat(Unit, Event)
	Unit:RegisterEvent("DeathRavager_EnragingBite", 6000, 0)
	Unit:RegisterEvent("DeathRavager_Rend", 8000, 0)
end

function DeathRavager_EnragingBite(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(30736, 	pUnit:GetMainTank()) 
end

function DeathRavager_Rend(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(13443, 	pUnit:GetMainTank()) 
end

function DeathRavager_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DeathRavager_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17556, 1, "DeathRavager_OnCombat")
RegisterUnitEvent(17556, 2, "DeathRavager_OnLeaveCombat")
RegisterUnitEvent(17556, 4, "DeathRavager_OnDied")

--Moongraze Buck
function MoongrazeBuck_OnCombat(Unit, Event)
	Unit:RegisterEvent("MoongrazeBuck_Knockdown", 7000, 0)
end

function MoongrazeBuck_Knockdown(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(31274, 	pUnit:GetMainTank()) 
end

function MoongrazeBuck_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MoongrazeBuck_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17201, 1, "MoongrazeBuck_OnCombat")
RegisterUnitEvent(17201, 2, "MoongrazeBuck_OnLeaveCombat")
RegisterUnitEvent(17201, 4, "MoongrazeBuck_OnDied")

--Queldorei Magewraith
function QueldoreiMagewraith_OnCombat(Unit, Event)
	Unit:RegisterEvent("QueldoreiMagewraith_ArcaneBolt", 6000, 0)
	Unit:RegisterEvent("QueldoreiMagewraith_Counterspell", 11000, 0)
	Unit:RegisterEvent("QueldoreiMagewraith_Fireball", 8000, 0)
	Unit:RegisterEvent("QueldoreiMagewraith_Slow", 4000, 1)
end

function QueldoreiMagewraith_ArcaneBolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(31595, 	pUnit:GetMainTank()) 
end

function QueldoreiMagewraith_Counterspell(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(31596, 	pUnit:GetMainTank()) 
end

function QueldoreiMagewraith_Fireball(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11921, 	pUnit:GetMainTank()) 
end

function QueldoreiMagewraith_Slow(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11436, 	pUnit:GetMainTank()) 
end

function QueldoreiMagewraith_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function QueldoreiMagewraith_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17612, 1, "QueldoreiMagewraith_OnCombat")
RegisterUnitEvent(17612, 2, "QueldoreiMagewraith_OnLeaveCombat")
RegisterUnitEvent(17612, 4, "QueldoreiMagewraith_OnDied")

--Raving Owlbeast
function RavingOwlbeast_OnCombat(Unit, Event)
	Unit:RegisterEvent("RavingOwlbeast_Enrage", 10000, 0)
end

function RavingOwlbeast_Enrage(pUnit, Event) 
	pUnit:CastSpell(8599) 
end

function RavingOwlbeast_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RavingOwlbeast_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17188, 1, "RavingOwlbeast_OnCombat")
RegisterUnitEvent(17188, 2, "RavingOwlbeast_OnLeaveCombat")
RegisterUnitEvent(17188, 4, "RavingOwlbeast_OnDied")

--Ravager Specimen
function RavagerSpecimen_OnCombat(Unit, Event)
	Unit:RegisterEvent("RavagerSpecimen_Spellname", 4000, 0)
end

function RavagerSpecimen_Spellname(pUnit, Event)
	pUnit:CastSpellOnTarget(13443, pUnit:GetClosestPlayer())
end

function RavagerSpecimen_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function RavagerSpecimen_OnLeaveCombat(Unit, Event)
Unit:RemoveEvents()
end

RegisterUnitEvent(17199, 1, "RavagerSpecimen_OnCombat")
RegisterUnitEvent(17199, 2, "RavagerSpecimen_OnLeaveCombat")
RegisterUnitEvent(17199, 4, "RavagerSpecimen_OnDied")

--Siltfin Hunter
function SiltfinHunter_OnCombat(Unit, Event)
	Unit:RegisterEvent("SiltfinHunter_Throw", 4000, 0)
end

function SiltfinHunter_Throw(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(10277, 	pUnit:GetMainTank()) 
end

function SiltfinHunter_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SiltfinHunter_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17192, 1, "SiltfinHunter_OnCombat")
RegisterUnitEvent(17192, 2, "SiltfinHunter_OnLeaveCombat")
RegisterUnitEvent(17192, 4, "SiltfinHunter_OnDied")

--Siltfin Oracle
function SiltfinOracle_OnCombat(Unit, Event)
	Unit:RegisterEvent("SiltfinOracle_LightningShield", 5000, 0)
	Unit:RegisterEvent("SiltfinOracle_Wrath", 8000, 0)
end

function SiltfinOracle_LightningShield(pUnit, Event) 
	pUnit:CastSpell(12550) 
end

function SiltfinOracle_Wrath(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9739, 	pUnit:GetMainTank()) 
end

function SiltfinOracle_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SiltfinOracle_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17191, 1, "SiltfinOracle_OnCombat")
RegisterUnitEvent(17191, 2, "SiltfinOracle_OnLeaveCombat")
RegisterUnitEvent(17191, 4, "SiltfinOracle_OnDied")

--Wrath Scale Myrmidon
function WrathScaleMyrmidon_OnCombat(Unit, Event)
	Unit:RegisterEvent("WrathScaleMyrmidon_Strike", 5000, 0)
end

function WrathScaleMyrmidon_Strike(pUnit, Event)
	pUnit:FullCastSpellOnTarget(31272, pUnit:GetClosestPlayer())
end

function WrathScaleMyrmidon_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function WrathScaleMyrmidon_OnDead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(17194, 1, "WrathScaleMyrmidon_OnCombat")
RegisterUnitEvent(17194, 2, "WrathScaleMyrmidon_OnLeaveCombat")
RegisterUnitEvent(17194, 4, "WrathScaleMyrmidon_OnDead")

--Wrath Scale Nage
function WrathScaleNage_OnCombat(Unit, Event)
	Unit:RegisterEvent("WrathScaleNage_Strike", 12000, 1)
end

function WrathScaleNage_Strike(pUnit, Event)
	pUnit:FullCastSpellOnTarget(9080, pUnit:GetClosestPlayer())
end

function WrathScaleNage_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function WrathScaleNage_OnDead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(17193, 1, "WrathScaleNage_OnCombat")
RegisterUnitEvent(17193, 2, "WrathScaleNage_OnLeaveCombat")
RegisterUnitEvent(17193, 4, "WrathScaleNage_OnDead")

--WrathScaleSiren
function WrathScaleSiren_OnCombat(Unit, Event)
	Unit:RegisterEvent("WrathScaleSiren_Scream", 12000, 1)
end

function WrathScaleSiren_Scream(pUnit, Event)
	pUnit:CastSpell(31273)
end

function WrathScaleSiren_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function WrathScaleSiren_OnDead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(17195, 1, "WrathScaleSiren_OnCombat")
RegisterUnitEvent(17195, 2, "WrathScaleSiren_OnLeaveCombat")
RegisterUnitEvent(17195, 4, "WrathScaleSiren_OnDead")