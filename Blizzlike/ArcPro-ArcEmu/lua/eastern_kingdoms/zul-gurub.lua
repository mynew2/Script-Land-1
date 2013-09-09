--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: DARKI, LUA++
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

--Gurubashi Axe Thrower
function AxeThrower_Throw(pUnit, Event)
	pUnit:FullCastSpellOnTarget(22887, pUnit:GetRandomPlayer(0))
end

function AxeThrower_AxeFlurry(pUnit, Event)
	pUnit:FullCastSpell(24018)
	pUnit:RegisterEvent("AxeThrower_AxeFlurry", math.random(14000, 20000), 1)
	pUnit:RegisterEvent("AxeThrower_Throw", 2000, 4)
end

function AxeThrower_OnEnterCombat(pUnit, Event)
    pUnit:RegisterEvent("AxeThrower_AxeFlurry", math.random(14000, 20000), 1)
end

RegisterUnitEvent(11350, 1, "AxeThrower_OnEnterCombat")

function AxeThrower_OnWipe(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(11350, 2, "AxeThrower_OnWipe")

--Gurubashi Bat Rider
function BatRider_Bite(pUnit, Event)
	pUnit:FullCastSpellOnTarget(16128, pUnit:GetMainTank())
	pUnit:RegisterEvent("BatRider_Bite", math.random(13000, 20000), 1)
end

function BatRider_Explode(pUnit, Event)
	if pUnit:GetHealthPct() <= 40 then
		pUnit:CastSpell(24024)
		pUnit:Kill(pUnit)
		pUnit:RemoveEvents()
    end
end

function BatRider_OnEnterCombat(pUnit, Event)
	pUnit:RegisterEvent("BatRider_Bite", math.random(13000, 20000), 1)
	pUnit:RegisterEvent("BatRider_Explode", 1000, 0)
end

RegisterUnitEvent(14750, 1, "BatRider_OnEnterCombat")

function BatRider_OnWipe(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(14750, 2, "BatRider_OnWipe")

--Gurubashi Berserker
function Berserker_Enrage(pUnit, Event)
	if((pUnit:GetHealthPct() <= 50) and (enrage == nil)) then
		enrage=1;
		pUnit:CastSpell(8269)
    end
end

function Berserker_Thunderclap(pUnit, Event)
	pUnit:FullCastSpell(15588)
end

function Berserker_KnockAway(pUnit, Event)
    local maintank=pUnit:GetMainTank();
	pUnit:FullCastSpellOnTarget(11130, maintank)
    local threatcalc=pUnit:GetThreat(maintank) / (4);
    local playerthreat=threatcalc * (3);
    pUnit:ModThreat(maintank, playerthreat)
end

function Berserker_Fear(pUnit, Event)
    local tbl = pUnit:GetInRangePlayers()
    for k,v in pairs(tbl) do
		if pUnit:GetDistance(v) <= 10 then
			pUnit:FullCastSpell(30584)
			pUnit:ModThreat(v, 0)
			pUnit:ModThreat(pUnit:GetRandomPlayer(0), 100)
		end
    end
end

function Berserker_OnEnterCombat(pUnit, Event)
	pUnit:RegisterEvent("Berserker_Enrage", 2000, 0)
	pUnit:RegisterEvent("Berserker_Thunderclap", 17000, 0)
	pUnit:RegisterEvent("Berserker_KnockAway", 21000, 0)
	pUnit:RegisterEvent("Berserker_Fear", 24000, 0)
end

RegisterUnitEvent(11352, 1, "Berserker_OnEnterCombat")

function Berserker_OnWipe(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(11352, 2, "Berserker_OnWipe")

--Gurubashi Blooddrinker
function Blooddrinker_BloodLeech(pUnit, Event)
	pUnit:FullCastSpell(24437)
	pUnit:RegisterEvent("Blooddrinker_BloodLeech", math.random(16000, 19000), 1)
end

function Blooddrinker_DrainLife(pUnit, Event)
	pUnit:FullCastSpellOnTarget(24435, pUnit:GetRandomPlayer(0))
end

function Blooddrinker_OnEnterCombat(pUnit, Event)
	pUnit:RegisterEvent("Blooddrinker_BloodLeech", math.random(16000, 19000), 1)
	pUnit:RegisterEvent("Blooddrinker_DrainLife", 25000, 0)
end

RegisterUnitEvent(11353, 1, "Blooddrinker_BloodLeech")

--Gurubashi Headhunter
function Headhunter_Impale(pUnit, Event)
	pUnit:FullCastSpellOnTarget(24049, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("Headhunter_Impale", math.random(14000,17000), 1)
end

function Headhunter_MortalStrike(pUnit, Event)
	pUnit:FullCastSpellOnTarget(15708, pUnit:GetMainTank())
	pUnit:RegisterEvent("Headhunter_MortalStrike", math.random(18000,22000), 1)
end

function Headhunter_WhirlingTrip(pUnit, Event)
	pUnit:FullCastSpell(24048)
	pUnit:RegisterEvent("Headhunter_WhirlingTrip", math.random(9000,14000), 1)
end

function Headhunter_OnEnterCombat(pUnit, Event)
	pUnit:SendChatMessage(12, 0, "My weapon be thirsty!")
	pUnit:RegisterEvent("Headhunter_Impale", math.random(14000,17000), 1)
	pUnit:RegisterEvent("Headhunter_MortalStrike", math.random(18000,22000), 1)
	pUnit:RegisterEvent("Headhunter_WhirlingTrip", math.random(9000,14000), 1)
end

RegisterUnitEvent(11351, 1, "Headhunter_OnEnterCombat")

function Headhunter_OnWipe(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(11351, 2, "Headhunter_OnWipe")

--Hakkari Blood Priest

function BloodPriest_DrainLife(pUnit, Event)
	pUnit:FullCastSpellOnTarget(24618, pUnit:GetRandomPlayer(0))
end

function BloodPriest_OnEnterCombat(pUnit, Event)
	pUnit:RegisterEvent("BloodPriest_DrainLife", 17000, 0)
end

RegisterUnitEvent(11340, 1, "BloodPriest_OnEnterCombat")

function BloodPriest_OnWipe(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(11340, 2,  "BloodPriest_OnWipe")

--Hakkari Priest
function HakkariPriest_Heal(pUnit, Event)
    local tbl=pUnit:GetInRangeFriends();
    for k,v in pairs(tbl) do
		mobs={}
		table.insert(mobs, v)
		local mob=math.random(1, table.getn(mobs))
		pUnit:FullCastSpellOnTarget(22883, mobs[mob])
    end
end

function HakkariPriest_AntiMagicShield(pUnit, Event)
	pUnit:CastSpell(24021)
end

function HakkariPriest_Fear(pUnit, Event)
	pUnit:FullCastSpell(13704)
end

function HakkariPriest_OnEnterCombat(pUnit, Event)
	pUnit:SendChatMessage(12, 0, "Your skull gonna decorate our ritual altars!")
	pUnit:RegisterEvent("HakkariPriest_Heal", 7000, 0)
	pUnit:RegisterEvent("HakkariPriest_AntiMagicShield", 18000, 0)
	pUnit:RegisterEvent("HakkariPriest_Fear", 22000, 0)
end

RegisterUnitEvent(11830, 1, "HakkariPriest_OnEnterCombat")

function HakkariPriest_OnWipe(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(11830, 2, "HakkariPriest_OnWipe")

--Hakkari Shadowcaster
function Shadowcaster_ShadowBolt(pUnit, Event)
	if(math.random(1, 2) == 1) then
		pUnit:FullCastSpellOnTarget(15232, pUnit:GetRandomPlayer(0))
    else
		pUnit:FullCastSpell(20741)
    end
end

function Shadowcaster_OnEnterCombat(pUnit, Event)
	pUnit:RegisterEvent("Shadowcaster_ShadowBolt", math.random(6000, 10000), 0)
end

RegisterUnitEvent(11338, 1, "Shadowcaster_OnEnterCombat")

function Shadowcaster_OnWipe(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(11338, 2, "Shadowcaster_OnWipe")

--Hakkari Witch Doctor
function WitchDoctor_Hex(pUnit, Event)
	pUnit:FullCastSpellOnTarget(24053, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("WitchDoctor_Hex", math.random(14000, 18000), 1)
end

function WitchDoctor_ShadowShock(pUnit, Event)
	pUnit:FullCastSpellOnTarget(17289, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("WitchDoctor_ShadowShock", math.random(10000, 13000), 1)
end

function WitchDoctor_Shrink(pUnit, Event)
	pUnit:FullCastSpell(24054)
end

function WitchDoctor_OnEnterCombat(pUnit, Event)
	pUnit:RegisterEvent("WitchDoctor_Hex", math.random(14000, 18000), 1)
	pUnit:RegisterEvent("WitchDoctor_ShadowShock", math.random(10000, 13000), 1)
	pUnit:RegisterEvent("WitchDoctor_Shrink", 21000, 0)
end

RegisterUnitEvent(11831, 1, "WitchDoctor_OnEnterCombat")

function WitchDoctor_OnWipe(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(11831, 2, "WitchDoctor_OnWipe")

--Razzashi Adder
function Adder_VenomSpit(pUnit, Event)
	pUnit:FullCastSpellOnTarget(24011, pUnit:GetMainTank())
	pUnit:RegisterEvent("Adder_VenomSpit", math.random(16000, 20000), 1)
end

function Adder_OnEnterCombat(pUnit, Event)
	pUnit:RegisterEvent("Adder_VenomSpit", math.random(16000, 20000), 1)
end

RegisterUnitEvent(11372, 1, "Adder_OnEnterCombat")

function Adder_OnWipe(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(11372, 2, "Adder_OnWipe")

--Razzashi Cobra
function Cobra_Poison(pUnit, Event)
	pUnit:FullCastSpellOnTarget(24097, pUnit:GetMainTank())
	pUnit:RegisterEvent("Cobra_Poison", math.random(8000, 12000), 1)
end

function Cobra_OnEnterCombat(pUnit, Event)
	pUnit:RegisterEvent("Cobra_Poison", math.random(8000, 12000), 1)
end

RegisterUnitEvent(11373, 1, "Cobra_OnEnterCombat")

function Cobra_OnWipe(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(11373, 2, "Cobra_OnWipe")

--Mad Servant
function MadServant_Fireball(pUnit, Event)
	pUnit:FullCastSpellOnTarget(24611, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("MadServant_Fireball", math.random(9000, 12000), 1)
end

function MadServant_Flamestrike(pUnit, Event)
    local player=pUnit:GetRandomPlayer(0);
	pUnit:CastSpellAoF(24612, player:GetX(), player:GetY(), player:GetZ())
	pUnit:RegisterEvent("MadServant_Flamestrike", math.random(14000, 16000), 1)
end

function MadServant_OnEnterCombat(pUnit, Event)
	pUnit:RegisterEvent("MadServant_Fireball", math.random(9000, 12000), 1)
	pUnit:RegisterEvent("MadServant_Flamestrike", math.random(14000, 16000), 1)
end

RegisterUnitEvent(15111, 1, "MadServant_OnEnterCombat")

function MadServant_OnWipe(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(15111, 2, "MadServant_OnWipe")

--Voodo Slave
function Slave_LightningBlast(pUnit, Event)
	pUnit:FullCastSpellOnTarget(43996, pUnit:GetMainTank())
	pUnit:RegisterEvent("Slave_LightningBlast", math.random(6000, 8000), 1)
end

function Slave_OnEnterCombat(pUnit, Event)
	pUnit:RegisterEvent("Slave_LightningBlast", math.random(6000, 8000), 1)
end

RegisterUnitEvent(14883, 1, "Slave_OnEnterCombat")

function Slave_OnWipe(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(14883, 2, "Slave_OnWipe")

--Soulflayer
function Soulflayer_SoulTap(pUnit, Event)
	pUnit:FullCastSpellOnTarget(24619, pUnit:GetRandomPlayer(7))
	pUnit:RegisterEvent("Soulflayer_SoulTap", math.random(18000, 22000), 1)
end

function Soulflayer_Fear(pUnit, Event)
	pUnit:FullCastSpellOnTarget(22678, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("Soulflayer_Fear", math.random(12000, 15000), 1)
end

function Soulflayer_OnEnterCombat(pUnit, Event)
	pUnit:RegisterEvent("Soulflayer_SoulTap", math.random(18000, 22000), 1)
	pUnit:RegisterEvent("Soulflayer_Fear", math.random(12000, 15000), 1)
end

RegisterUnitEvent(11359, 1, "Soulflayer_OnEnterCombat")

function Soulflayer_OnWipe(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(11359, 2, "Soulflayer_OnWipe")

--Son of Hakkar
function SonOfHakkar_Knockdown(pUnit, Event)
	pUnit:FullCastSpellOnTarget(16790, pUnit:GetMainTank())
	pUnit:RegisterEvent("SonOfHakkar_Knockdown", math.random(8000, 10000), 1)
end

function SonOfHakkar_OnEnterCombat(pUnit, Event)
	pUnit:RegisterEvent("SonOfHakkar_Knockdown", math.random(8000, 10000), 1)
end

RegisterUnitEvent(11357, 1, "SonOfHakkar_OnEnterCombat")

function SonOfHakkar_OnWipe(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(11357, 2, "SonOfHakkar_OnWipe")

function SonOfHakkar_OnDie(pUnit, Event)
	pUnit:RemoveEvents()
	pUnit:CastSpell(24321)
end

RegisterUnitEvent(11357, 4, "SonOfHakkar_OnDie")

function Gahz_OnEnterCombat(pUnit, Event)
    pUnit:RegisterEvent("Gahz_Frostbreath", math.random(16000,20000), 1)
    pUnit:RegisterEvent("Gahz_Slam", 25000, 0)
end

function Gahz_Frostbreath(pUnit, Event)
    pUnit:FullCastSpell(16099)
    pUnit:RegisterEvent("Gahz_Frostbreath", math.random(22000,26000), 1)
end

function Gahz_Slam(pUnit, Event)
    pUnit:FullCastSpell(24326)
end

function Gahz_OnWipe(pUnit, Event)
    pUnit:RemoveEvents()
end

function Gahz_OnDie(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(15114, 1, "Gahz_OnEnterCombat")
RegisterUnitEvent(15114, 2, "Gahz_OnWipe")
RegisterUnitEvent(15114, 4, "Gahz_OnDie")

--Jeklik begins the encounter in bat form. In this form she has an AoE silence that also damages. 
--She randomly charges people in the group, and summons 6-8 bloodseeker bats once per minute. (Added the 6-8 Spawns, Please correct the spawn part if wrong (Deathdude)
--When she drops below 50% HP, she reverts to priest form. 
--Here she casts Shadow Word: Pain, Mind Flay, Chain Mind Flay and Greater Heal. 
--She also summons bomb bats which drop fire bombs on the ground which AoE DoT those inside.
--Somewhere in the script (Need to watch a video to find out) she yells "I command you to rain fire down upon these invaders!" (Deathdude)

math.randomseed(os.time())

function JeklikBat_Summon(Unit, Event)
    Unit:SpawnCreature(14965, -12291.9, -1380.18, 145.002, 2.28638, 14, 0)
    Unit:SpawnCreature(14965, -12291.7, -1380.16, 145.002, 2.28638, 14, 0)
    Unit:SpawnCreature(14965, -12291.5, -1380.14, 145.002, 2.28638, 14, 0)
    Unit:SpawnCreature(14965, -12291.3, -1380.12, 145.002, 2.28638, 14, 0)
    Unit:SpawnCreature(14965, -12291.1, -1380.10, 145.002, 2.28638, 14, 0)
    Unit:SpawnCreature(14965, -12290.9, -1380.08, 145.002, 2.28638, 14, 0)
end

function Jeklik_ShadowWordPain(Unit, Event)
    Unit:FullCastSpellOnTarget(23952, Unit:GetRandomPlayer(0))
end

function Jeklik_MindFlay(Unit, Event)
    Unit:FullCastSpellOnTarget(23953, Unit:GetRandomPlayer(0))
end

function Jeklik_GreatHeal(Unit, Event)
    Unit:FullCastSpell(23954)
end

function Jeklik_MoveCheck(Unit, Event)
    local args=getvars(Unit)
    Unit:WipeThreatList()
    Unit:ModifyRunSpeed(8)
    Unit:ModifyWalkSpeed(8)
    Unit:SetCombatTargetingCapable(0)
    Unit:ModThreat(args.chargetarget, 1000)
end

function Jeklik_Charge(Unit, Event)
local args=getvars(Unit)
    setvars(Unit, {chargetarget=Unit:GetRandomPlayer(0)})
    Unit:FullCastSpellOnTarget(22911, args.chargetarget)
    Unit:SetCombatTargetingCapable(1)
    Unit:ModifyRunSpeed(300)
    Unit:ModifyWalkSpeed(300)
    Unit:MoveTo(args.chargetarget:GetX(), args.chargetarget:GetY(), args.chargetarget:GetZ(), args.chargetarget:GetO())
    Unit:CastSpell(8281)
    Unit:RegisterEvent("Jeklik_MoveCheck", 1000, 1)
end

function Jeklik_Phase2(Unit, Event)
    if (Unit:GetHealthPct() < 51) then
		Unit:RemoveEvents()
		Unit:SetModel(15219)
		Unit:RegisterEvent("Jeklik_ShadowWordPain", 15000, 0)
		Unit:RegisterEvent("Jeklik_MindFlay", 22000, 0)
		Unit:RegisterEvent("Jeklik_GreatHeal", 46000, 0)
    end
end

function Jeklik_FearRepeat(Unit, Event)
    Unit:CastSpell(6605)
    Unit:RegisterEvent("Jeklik_Fear", math.random(22000, 35000), 1)
end

function Jeklik_Fear(Unit, Event)
    Unit:CastSpell(6605)
    Unit:RegisterEvent("Jeklik_FearRepeat", math.random(22000, 35000), 1)
end

function Jeklik_OnCombat(Unit, Event)
    Unit:SendChatMessage(14, 0, "Lord Hir'eek, grant me wings of vengeance!")
    Unit:SetModel(15191)
    Unit:RegisterEvent("JeklikBat_Summon", 60000, 0)
    Unit:RegisterEvent("Jeklik_Phase2",1000,0)
    Unit:RegisterEvent("Jeklik_Fear", math.random(15000, 35000), 1)
    Unit:RegisterEvent("Jeklik_Charge", 28000, 0)
end

function Jeklik_OnLeaveCombat(Unit, Event)
    if (Unit:IsAlive() == true) then
		Unit:RemoveEvents()
		Unit:SetModel(15191)
    else
		Unit:RemoveEvents()
    end
end

function Jeklik_OnDied(Unit)
    Unit:RemoveEvents()
    Unit:SendChatMessage(14, 0, "Finally...death! Curse you, Hakkar! Curse you! ")
end

RegisterUnitEvent(14517,1,"Jeklik_OnCombat")
RegisterUnitEvent(14517,2,"Jeklik_OnLeaveCombat")
RegisterUnitEvent(14517,4,"Jeklik_OnDied")

--Bloodseeker Bats move AI.
function BloodseekerBat_PositionCheck(pUnit, Event)
     if pUnit:IsCreatureMoving() == true then
		local tbl = pUnit:GetInRangeFriends()
		for k,v in pairs(tbl) do
			if (v:GetEntry() == 14517) then
				pUnit:MoveTo(v:GetX(), v:GetY(), v:GetZ(), v:GetO())
			else
				pUnit:RemoveEvents()
			end
		end
	end
end  

function BloodseekerBat_OnSpawn(pUnit, Event)
     local tbl = pUnit:GetInRangeFriends()
     for k,v in pairs(tbl) do
		if (v:GetEntry() == 14517) then
			pUnit:ModifyWalkSpeed(14)
			pUnit:MoveTo(v:GetX(), v:GetY(), v:GetZ(), v:GetO())
			pUnit:RegisterEvent("BloodseekerBat_PositionCheck", 2000, 0)
		end
	end
end

RegisterUnitEvent(14965, 18, "BloodseekerBat_OnSpawn")

function BloodseekerBat_OnWipe(pUnit, Event)
     if (pUnit:IsAlive() == true) then
		pUnit:RemoveEvents()
		pUnit:Despawn(100, 0)
	 else
		pUnit:RemoveEvents()
     end
end

RegisterUnitEvent(14965, 2, "BloodseekerBat_OnWipe")

function HPMarli_OnCombat(Unit,event)
	Unit:RegisterEvent("HPMarli_SummonSpiders", 200, 4)
	Unit:RegisterEvent("HPMarli_Normal", 1000, 1)
end

function HPMarli_Normal(Unit,event)
	Unit:SetModel(15220)
	Unit:RemoveEvents()
	Unit:RegisterEvent("HPMarli_SummonSpiders", 27000, 0)
	Unit:RegisterEvent("HPMarli_PoisonVolley", 22000, 0)
	Unit:RegisterEvent("HPMarli_DrainLife", 24000, 0)
	Unit:RegisterEvent("HPMarli_SpiderForm", 60000, 1)
end

function HPMarli_PoisonVolley(Unit,event)
	Unit:FullCastSpell(24099)
end

function HPMarli_DrainLife(Unit,event)
	local player = Unit:GetRandomPlayer(0)
	if(player ~= nil) then
		Unit:StopMovement(7000)
		Unit:FullCastSpellOnTarget(24300, player)
    end
end

function HPMarli_SummonSpiders(Unit,event)
	Unit:SpawnCreature(14880, Unit:GetX(), Unit:GetY(), Unit:GetZ(), Unit:GetO(), Unit:GetFaction(), 0)
end

function HPMarli_OnWipe(Unit,event)
	if(Unit:IsAlive() == true) then
        Unit:RemoveEvents()
        Unit:SetModel(15220)
    else
        Unit:RemoveEvents()
    end
end

function HPMarli_OnDied(Unit,event)
	Unit:RemoveEvents()
end

function HPMarli_SpiderForm(Unit,event)
	Unit:RemoveEvents()
	Unit:SetModel(15226)
	Unit:RegisterEvent("HPMarli_AOESilence", 100, 1)
	Unit:RegisterEvent("HPMarli_Web",18000, 0)
	Unit:RegisterEvent("HPMarli_SummonSpiders",27000, 0)
	Unit:RegisterEvent("HPMarli_ChargeCheck", 18100, 0)
	Unit:RegisterEvent("HPMarli_Normal", 60000, 1)
end

function HPMarli_MovingCheck(Unit, Event)
    Unit:WipeThreatList()
    Unit:SetCombatTargetingCapable(0)
    Unit:ModifyRunSpeed(8)
    Unit:ChangeTarget(Unit:GetClosestPlayer())
end

function HPMarli_ChargeCheck(Unit,event)
local tbl=Unit:GetInRangePlayers()
    for k,v in pairs(tbl) do
        if(Unit:GetDistance(v) >= 8) then
            players={}
            table.insert(players, v)
            local player=math.random(1, table.getn(players))
		    Unit:FullCastSpellOnTarget(22911, players[player])--Charge if main tank is too far away.
            Unit:SetCombatTargetingCapable(1)
            Unit:ModifyRunSpeed(200)
            Unit:MoveTo(v:GetX(), v:GetY(), v:GetZ(), v:GetO())
            Unit:RegisterEvent("HPMarli_MovingCheck", 500, 1)
        end
    end
end


function HPMarli_Web(Unit,event)
	local tbl = Unit:GetInRangePlayers()
	for k,v in pairs(tbl) do
		--if(Unit:GetDistance(v) =< 8) then
			Unit:FullCastSpellOnTarget(24110,v)--Enveloping Web
		--end
	end
end

function HPMarli_AOESilence(Unit,event)
	local tbl = Unit:GetInRangePlayers()
	for k,v in pairs(tbl) do
		Unit:FullCastSpellOnTarget(15487, v)
	end
end

RegisterUnitEvent(14510, 1, "HPMarli_OnCombat")
RegisterUnitEvent(14510, 2, "HPMarli_OnWipe")
RegisterUnitEvent(14510, 4, "HPMarli_OnDied")

--[[
	SPIDERs AI
	]]

function Spider_OnWipe(Unit, Event)
    Unit:RemoveEvents()
    Unit:Despawn(100, 0)
end

function HPMarli_SpiderGrow(Unit,event)
    Unit:DisableRespawn(1)
	local tbl = Unit:GetInRangeFriends()
	for k,v in pairs(tbl) do
		if v:GetEntry() == 14510 then
			if Unit:GetDistance(v) <= 1 then
				Unit:RegisterEvent("HPMarli_SpiderEnlarge", 2000, 0)
			end
		end
	end
end
function HPMarli_SpiderEnlarge(Unit,event)
	Unit:SetUInt32Value(UNIT_FIELD_MINDAMAGE,(Unit:GetUInt32Value(UNIT_FIELD_MINDAMAGE))+50)
	Unit:SetUInt32Value(UNIT_FIELD_MAXDAMAGE,(Unit:GetUInt32Value(UNIT_FIELD_MAXDAMAGE))+50)
	Unit:SetFloatValue(OBJECT_FIELD_SCALE_X,(Unit:GetFloatValue(OBJECT_FIELD_SCALE_X))+0.1)
end

RegisterUnitEvent(14880, 1, "HPMarli_SpiderGrow")
RegisterUnitEvent(14880, 2, "Spider_OnWipe")

function HPMarli_OnCombat(Unit,event)
	Unit:RegisterEvent("HPMarli_SummonSpiders", 200, 4)
	Unit:RegisterEvent("HPMarli_Normal",1000, 1)
end
function HPMarli_Normal(Unit,event)
	Unit:SetModel(15220)
	Unit:RemoveEvents()
	Unit:RegisterEvent("HPMarli_SummonSpiders",27000, 0)
	Unit:RegisterEvent("HPMarli_PoisonVolley", 22000, 0)
	Unit:RegisterEvent("HPMarli_DrainLife", 24000, 0)
	Unit:RegisterEvent("HPMarli_SpiderForm", 60000, 1)
end
function HPMarli_PoisonVolley(Unit,event)
	Unit:FullCastSpell(24099)
end

function HPMarli_DrainLife(Unit,event)
	local player = Unit:GetRandomPlayer(0)
	if(player ~= nil) then
		Unit:StopMovement(7000)
		Unit:FullCastSpellOnTarget(24300, player)
    end
end

function HPMarli_SummonSpiders(Unit,event)
	Unit:SpawnCreature(14880,Unit:GetX(),Unit:GetY(),Unit:GetZ(),Unit:GetO(),Unit:GetFaction(),0)
end

function HPMarli_OnWipe(Unit,event)
	if(Unit:IsAlive() == true) then
        Unit:RemoveEvents()
        Unit:SetModel(15220)
    else
        Unit:RemoveEvents()
    end
end

function HPMarli_OnDied(Unit,event)
	Unit:RemoveEvents()
end

function HPMarli_SpiderForm(Unit,event)
	Unit:RemoveEvents()
	Unit:SetModel(15226)--Change display to Spiderform.
	Unit:RegisterEvent("HPMarli_AOESilence", 100, 1)
	Unit:RegisterEvent("HPMarli_Web",18000, 0)
	Unit:RegisterEvent("HPMarli_SummonSpiders",27000, 0)
	Unit:RegisterEvent("HPMarli_ChargeCheck", 18100, 0)
	Unit:RegisterEvent("HPMarli_Normal", 60000, 1)
end

function HPMarli_MovingCheck(Unit, Event)
     Unit:WipeThreatList()
     Unit:SetCombatTargetingCapable(0)
     Unit:ModifyRunSpeed(8)
     Unit:ChangeTarget(Unit:GetClosestPlayer())
end

function HPMarli_ChargeCheck(Unit,event)
	local tbl=Unit:GetInRangePlayers()
        for k,v in pairs(tbl) do
                if Unit:GetDistance(v) >= 8 then
                players={}
                table.insert(players, v)
                local player=math.random(1, table.getn(players))
		        Unit:FullCastSpellOnTarget(22911, players[player])--Charge if main tank is too far away.
                Unit:SetCombatTargetingCapable(1)
                Unit:ModifyRunSpeed(200)
                Unit:MoveTo(v:GetX(), v:GetY(), v:GetZ(), v:GetO())
                Unit:RegisterEvent("HPMarli_MovingCheck", 500, 1)
                end
        end
end

function HPMarli_Web(Unit,event)
	local tbl = Unit:GetInRangePlayers()
	for k,v in pairs(tbl) do
		if Unit:GetDistance(v) <= 8 then
			Unit:FullCastSpellOnTarget(24110,v)--Enveloping Web
		end
	end
end

function HPMarli_AOESilence(Unit,event)
	local tbl = Unit:GetInRangePlayers()
	for k,v in pairs(tbl) do
		Unit:FullCastSpellOnTarget(15487, v)
	end
end

function Spider_OnWipe(Unit, Event)
    Unit:RemoveEvents()
    Unit:Despawn(100, 0)
end

function HPMarli_SpiderGrow(Unit,event)
        Unit:DisableRespawn(1)
	local tbl = Unit:GetInRangeFriends()
	for k,v in pairs(tbl) do
		if(v:GetEntry() == 14510) then
			if Unit:GetDistance(v) <= 1 then
				Unit:RegisterEvent("HPMarli_SpiderEnlarge", 2000, 0)
			end
		end
	end
end
function HPMarli_SpiderEnlarge(Unit,event)
	Unit:SetUInt32Value(UNIT_FIELD_MINDAMAGE,(Unit:GetUInt32Value(UNIT_FIELD_MINDAMAGE))+50)
	Unit:SetUInt32Value(UNIT_FIELD_MAXDAMAGE,(Unit:GetUInt32Value(UNIT_FIELD_MAXDAMAGE))+50)
	Unit:SetFloatValue(OBJECT_FIELD_SCALE_X,(Unit:GetFloatValue(OBJECT_FIELD_SCALE_X))+0.1)
end

RegisterUnitEvent(14880, 1, "HPMarli_SpiderGrow")
RegisterUnitEvent(14880, 2, "Spider_OnWipe")
RegisterUnitEvent(14510,1,"HPMarli_OnCombat")
RegisterUnitEvent(14510,2,"HPMarli_OnWipe")
RegisterUnitEvent(14510,4,"HPMarli_OnDied")

local healing_ward = 14987
local powerful_healing = 24311
local hexxer = 11380
local delusions = 24306
local hexxer_hex = 17172
local shade = 14986
local shade_shock = 24458
local shade_visual = 24313
local coords = {
{x =-11582.373047, y=-1257.175781, z = 77.547829},
{x =-11585.643555, y=-1255.902100, z = 77.547829},
{x =-11587.205078, y=-1251.681641, z = 77.547829},
{x =-11586.676758, y=-1248.007202, z = 77.547829},
{x =-11579.822266, y=-1246.633545, z = 77.547424},
{x =-11578.796875, y=-1252.417603, z = 77.547424},
{x =-11580.839844, y=-1256.166626, z = 77.547699},
{x =-11584.952148, y=-1255.456299, z = 77.547699}
}

function Hexxer_OnCombat(Unit, Event)
	setvars(Unit,{shades = {},skeles = {}})
	Unit:RegisterEvent("Hexxer_HealingWard", 5000, 1)
	Unit:RegisterEvent("Hexxer_Hex", 15000, 1)
	Unit:RegisterEvent("Hexxer_Delusions", 10000, 1)
	Unit:RegisterEvent("Hexxer_Teleport", 30000, 1)
	Unit:RegisterEvent("Hexxer_SpawnTrolls", 500, 8)
end

function Hexxer_SpawnTrolls(Unit, Event)
	Unit:SpawnCreature(14826,coords[x],coords[y],coords[z], 0, 16, 30000)
end

function Hexxer_OnWipe(Unit, Event)
	Unit:RemoveEvents()
	local args = getvars(Unit)
	for k,v in pairs(args.shades) do
		v:RemoveFromWorld()
	end
	for k,v in pairs(args.skeles) do
		v:RemoveFromWorld()
	end
end

function Hexxer_OnDied(Unit, Event)
	Unit:RemoveEvents()
	local args = getvars(Unit)
	for k,v in pairs(args.shades) do
		v:RemoveFromWorld()
	end
	for k,v in pairs(args.skeles) do
		v:RemoveFromWorld()
	end
end


RegisterUnitEvent(hexxer, 1, "Hexxer_OnCombat")
RegisterUnitEvent(hexxer, 2, "Hexxer_OnWipe")
RegisterUnitEvent(hexxer, 4, "Hexxer_OnDied")

-------------------------------------------------------------------------------
------------------------HOOKED EVENTS END--------------------------------------
-------------------------------------------------------------------------------

function Hexxer_HealingWard(Unit, Event)
	Unit:FullCastSpell(24309)
	Unit:RegisterEvent("Hexxer_HealingWard", 5000, 1)
end
function Hexxer_Hex(Unit, Event)
	local tank = Unit:GetMainTank()
	local offtank = Unit:GetAddTank()
	if tank ~= nil and offtank ~= nil then
		Unit:FullCastSpellOnTarget(hexxer_hex,tank)
		Unit:SetNextTarget(offtank)
	end
	Unit:RegisterEvent("Hexxer_Hex", 15000, 1)
end
function Hexxer_Delusions(Unit, Event)
	local args = getvars(Unit)
	local plr = Unit:GetRandomPlayer(0)
	if plr ~= nil then
		Unit:FullCastSpellOnTarget(delusions, plr)
		table.insert(args.shades, Unit:SpawnCreature(shade, Unit:GetX(), Unit:GetY(), Unit:GetZ(), Unit:GetO(), Unit:GetUInt32Value(UNIT_FIELD_FACTIONTEMPLATE), 0))
	end
	Unit:RegisterEvent("Hexxer_Delusions", 10000, 1)
end
function Hexxer_Teleport(Unit, Event)
	local plr = Unit:GetRandomPlayer(0)
	if plr ~= nil then
		Unit:FullCastSpellOnTarget(24466, plr)
		plr:Teleport(309, -11583.710938, -1250.584717, 77.546814)
	end
	Unit:RegisterEvent("Hexxer_Teleport", 30000, 1)
end
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------

function healing_wardspawn(Unit, Event)
	Unit:SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FIELD_NOT_ATTACKBLE_2)
	Unit:SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FIELD_NOT_SELECTABLE)
	Unit:SetCombatCapable(1)
	Unit:Root()
	Unit:RegisterEvent("healing_wardtick", 3000, 1)
end
function healing_wardtick(Unit, Event)
	local tbl = Unit:GetInRangeFriends()
	for k,v in pairs(tbl) do
		if v ~= nil then
			if v:GetEntry() == hexxer then
				Unit:FullCastSpelOnTarget(powerful_healing, v)
			end
		end
		break
	end
	Unit:RegisterEvent("healing_wardtick", 3000, 1)
end
function healing_warddeath(Unit, Event)
	Unit:RemoveEvents()
	Unit:RemoveFromWorld()
end

RegisterUnitEvent(healing_ward, 18, "healing_wardspawn")
RegisterUnitEvent(healing_ward, 4, "healing_warddeath")

-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------

function Shade_OnSpawn(Unit, Event)
	Unit:CastSpell(shade_visual)
	Unit:SetUInt32Value(UNIT_FIELD_MINDAMAGE, 1)
	Unit:SetUInt32Value(UNIT_FIELD_MAXDAMAGE, 1)
	Unit:RegisterEvent("ShadeUpdate", 20000, 1)
end
function ShadeUpdate(Unit, Event)
	Unit:WipeCurrentTarget()
	Unit:RegisterEvent("ShadeUpdate", 20000,1)
end
function Shade_Interrupt(Unit, Event, pMisc)
	if pMisc:GetCurrentSpellId() ~= nil then
		pMisc:InterruptSpell()
	end
	if math.random(0,10) == 1 then
		Unit:FullCastSpellOnTarget(shade_shock, pMisc)
	end
end
function Shade_OnDeath(Unit, Event)
	local args = getvars(Unit)
	for k,v in pairs(args.shades) do
		if v~= nil and v == Unit then
			table.remove(args.shades, v)
		end
		break
	end
end

RegisterUnitEvent(shade, 18, "Shade_OnSpawn")
RegisterUnitEvent(shade, 4, "Shade_OnDeath")
RegisterUnitEvent(shade, 13, "Shade_Interrupt")

--Parasitic Serpent AI
function Serpent_OneTimeBite(pUnit, Event)
    pUnit:FullCastSpellOnTarget(23865, pUnit:GetClosestPlayer())
end

function Serpent_Bite(pUnit, Event)
    pUnit:FullCastSpellOnTarget(23865, pUnit:GetClosestPlayer())
end

function Serpent_OnEnterCombat(pUnit, Event)
    pUnit:RegisterEvent("Serpent_OneTimeBite", 2000, 1)
    pUnit:RegisterEvent("Serpent_Bite", 14000, 0)
end

RegisterUnitEvent(14884, 1, "Serpent_OnEnterCombat")

function Serpent_OnWipe(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(14884, 2, "Serpent_OnWipe")

function Serpent_OnDie(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(14884, 4, "Serpent_OnDie")