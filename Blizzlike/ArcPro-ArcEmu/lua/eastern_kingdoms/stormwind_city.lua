--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation, BrantX
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

-- Was playing retail the other day and was in stormind... I thought it was quite funny.
-- Maybe this occures when any Deathknight gets near a city guard?...or npc...in a city.
-- I will test once i get 55 one Retail and create a DK and test.
function StormwindGuard_OnSpawn(Unit,Event)
	Unit:RegisterEvent("StormwindGuard_Deathknight", 5000, 0)
end

function StormwindGuard_DeathKnight(Unit,Event)
local plr = Unit:GetClosestPlayer()
	if(plr == Unit:GetClass() == 6) then
		Unit:MoveTo(plr:GetX()+2,plr:GetY()+4,plr:GetZ())
		Unit:RegisterEvent("StormwindGuard_TalkToDK", 3500, 5)
		Unit:RegisterEvent("StormwindGuard_ThrowApple", 5500, 5)
	else
		return
	end
end

function StormwindGuard_ThrowApple(Unit,Event)
local plr = Unit:GetClosestPlayer()
local pname = plr:GetName()
local name = Unit:GetName()
local X,Y,Z = Unit:GetX(),Unit:GetY(),Unit:GetZ()
	if(plr == nil) then
		return
	else
		if(plr == (Unit:GetClass() == 6)) then
			Unit:FullCastSpellOnTarget(58511, plr)
			Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_EMOTE, LangField.LANG_UNIVERSAL, ""..name.." Throws an apple at "..pname..".")
		else
			return
		end
	end
end

function StormwindGuard_TalkToDK(Unit,Event)
local Choice = math.random(1,3)
	if(Choice == 1) then
		Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_SAY, LangField.LANG_UNIVERSAL, "Monster!")
	elseif(Choice == 2) then
		Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_SAY, LangField.LANG_UNIVERSAL, "Murderer!")
	elseif(Choice == 3) then
		Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_SAY, LangField.LANG_UNIVERSAL, "Get the Rope!")
	end
end

RegisterUnitEvent(1976, 18, "StormwindGuard_OnSpawn")

--Stormwind Royal Guard
function R_OnEnterCombat(pUnit, Event)
    pUnit:RegisterEvent("R_Cleave", 4000, 0)
    pUnit:RegisterEvent("R_Enrage", 30000, 0)
    pUnit:RegisterEvent("R_ShieldSlam", 7000, 0)
    pUnit:RegisterEvent("R_Armor", 6000, 0)
end

function R_Cleave(pUnit, Event)
    pUnit:FullCastSpellOnTarget(15284, pUnit:GetMainTank())
end

function R_Enrage(pUnit, Event)
    pUnit:CastSpell(8269)
end

function R_ShieldSlam(pUnit, Event)
    pUnit:FullCastSpellOnTarget(15655, pUnit:GetMainTank())
end

function R_Armor(pUnit, Event)
    pUnit:FullCastSpellOnTarget(16145, pUnit:GetMainTank())
end

function R_OnDied(pUnit, Event)
    pUnit:RemoveEvents()
end

function R_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(1756, 1, "R_OnEnterCombat")
RegisterUnitEvent(1756, 2, "R_OnLeaveCombat")
RegisterUnitEvent(1756, 4, "R_OnDied")

--Officer Jaxon and Brady
function J_OnEnterCombat(pUnit, Event)
    pUnit:RegisterEvent("J_Net", 8000, 0)
    pUnit:RegisterEvent("J_Armor", 6000, 0)
end

function J_Net(pUnit, Event)
    pUnit:FullCastSpellOnTarget(14030, pUnit:GetMainTank())
end

function J_Armor(pUnit, Event)
    pUnit:FullCastSpellOnTarget(16145, pUnit:GetMainTank())
end

function J_OnDied(pUnit, Event)
    pUnit:RemoveEvents()
end

function J_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(14423, 1, "J_OnEnterCombat")
RegisterUnitEvent(14423, 2, "J_OnLeaveCombat")
RegisterUnitEvent(14423, 4, "J_OnDied")
RegisterUnitEvent(14439, 1, "J_OnEnterCombat")
RegisterUnitEvent(14439, 2, "J_OnLeaveCombat")
RegisterUnitEvent(14439, 4, "J_OnDied")

TOPPERMCNABB = {}

function TOPPERMCNABB_onDied(Unit, event, player)
	Unit:RemoveEvents()
end

function TOPPERMCNABB_onSpawn(Unit, event, player)
	Unit:RegisterEvent("TOPPERMCNABB_Say", 30000, 0)
end

function TOPPERMCNABB_Say(Unit, event, player)
local chance = math.random(1,6)
	if(chance == 1) then
		Unit:SendChatMessage(12, 7, "Spare some change for a poor blind man? ...What do you mean I'm not blind? ...I'M NOT BLIND! I CAN SEE! It's a miracle!" )
	elseif(chance == 2) then
		Unit:SendChatMessage(12, 7, "I will gladly pay you Tuesday for a hamburger today.")
	elseif(chance == 3) then
		Unit:SendChatMessage(12, 7, "Alms for the poor?")
	elseif(chance == 4) then
		Unit:SendChatMessage(12, 7, "Shine yer armor for a copper.")
	elseif(chance == 5) then
		Unit:SendChatMessage(12, 7, "It's all their fault, stupid Alliance army. Just had to build their towers right behind my farm.")
	elseif(chance == 6) then
		Unit:SendChatMessage(12, 7, "Help a poor bloke out?")
	end
end

RegisterUnitEvent(1402, 18, "TOPPERMCNABB_onSpawn")
RegisterUnitEvent(1402, 4, "TOPPERMCNABB_onDied")