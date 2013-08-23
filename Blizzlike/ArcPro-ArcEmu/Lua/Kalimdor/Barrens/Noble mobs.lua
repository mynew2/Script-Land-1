--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

--  Ambassador Bloodrage
function AmbassadorBloodrage_OnCombat(Unit, Event)
	Unit:RegisterEvent("AmbassadorBloodrage_Shadowbolt", 8000, 0)
end

function AmbassadorBloodrage_Shadowbolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9613, Unit:GetMainTank()) 
end

function AmbassadorBloodrage_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AmbassadorBloodrage_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(7895, 1, "AmbassadorBloodrage_OnCombat")
RegisterUnitEvent(7895, 2, "AmbassadorBloodrage_OnLeaveCombat")
RegisterUnitEvent(7895, 4, "AmbassadorBloodrage_OnDied")

-- Ambassador Malcin
function AmbassadorMalcin_OnCombat(Unit, Event)
	Unit:RegisterEvent("AmbassadorMalcin_Shadowbolt", 8000, 0)
end

function AmbassadorMalcin_Shadowbolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9613, Unit:GetMainTank()) 
end

function AmbassadorMalcin_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AmbassadorMalcin_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12865, 1, "AmbassadorMalcin_OnCombat")
RegisterUnitEvent(12865, 2, "AmbassadorMalcin_OnLeaveCombat")
RegisterUnitEvent(12865, 4, "AmbassadorMalcin_OnDied")

-- Azzere the Skyblade
function AzzeretheSkyblade_OnCombat(Unit, Event)
	Unit:RegisterEvent("AzzeretheSkyblade_Fireball", 8000, 0)
	Unit:RegisterEvent("AzzeretheSkyblade_FlameSpike", 9000, 0)
end

function AzzeretheSkyblade_Fireball(Unit, Event) 
	Unit:FullCastSpellOnTarget(13375, Unit:GetMainTank()) 
end

function AzzeretheSkyblade_FlameSpike(Unit, Event) 
	Unit:CastSpell(6725) 
end

function AzzeretheSkyblade_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AzzeretheSkyblade_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5834, 1, "AzzeretheSkyblade_OnCombat")
RegisterUnitEvent(5834, 2, "AzzeretheSkyblade_OnLeaveCombat")
RegisterUnitEvent(5834, 4, "AzzeretheSkyblade_OnDied")

-- Boahn
function Boahn_OnCombat(Unit, Event)
	Unit:RegisterEvent("Boahn_LightningBolt", 8000, 0)
end

function Boahn_LightningBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9532, Unit:GetMainTank()) 
end

function Boahn_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Boahn_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3672, 1, "Boahn_OnCombat")
RegisterUnitEvent(3672, 2, "Boahn_OnLeaveCombat")
RegisterUnitEvent(3672, 4, "Boahn_OnDied")

-- Boss Copperplug
function BossCopperplug_OnCombat(Unit, Event)
	Unit:RegisterEvent("BossCopperplug_Bom", 8000, 0)
	Unit:RegisterEvent("BossCopperplug_Net", 10000, 0)
end

function BossCopperplug_Bom(Unit, Event) 
	Unit:CastSpell(9143) 
end

function BossCopperplug_Net(Unit, Event) 
	Unit:FullCastSpellOnTarget(6533, Unit:GetMainTank()) 
end

function BossCopperplug_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BossCopperplug_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(9336, 1, "BossCopperplug_OnCombat")
RegisterUnitEvent(9336, 2, "BossCopperplug_OnLeaveCombat")
RegisterUnitEvent(9336, 4, "BossCopperplug_OnDied")

-- Brokespear
function Brokespear_OnCombat(Unit, Event)
	Unit:RegisterEvent("Brokespear_SlowingPoison", 15000, 0)
	Unit:RegisterEvent("Brokespear_Throw", 5000, 0)
end

function Brokespear_SlowingPoison(Unit, Event) 
	Unit:FullCastSpellOnTarget(7992, Unit:GetMainTank()) 
end

function Brokespear_Throw(Unit, Event) 
	Unit:FullCastSpellOnTarget(10277, Unit:GetMainTank()) 
end

function Brokespear_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Brokespear_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5838, 1, "Brokespear_OnCombat")
RegisterUnitEvent(5838, 2, "Brokespear_OnLeaveCombat")
RegisterUnitEvent(5838, 4, "Brokespear_OnDied")

-- Brontus
function Brontus_OnCombat(Unit, Event)
	Unit:RegisterEvent("Brontus_PierceArmor", 10000, 0)
	Unit:RegisterEvent("Brontus_RushingCharge", 8000, 0)
end

function Brontus_PierceArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(6016, Unit:GetMainTank()) 
end

function Brontus_RushingCharge(Unit, Event) 
	Unit:CastSpell(6268) 
end

function Brontus_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Brontus_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5827, 1, "Brontus_OnCombat")
RegisterUnitEvent(5827, 2, "Brontus_OnLeaveCombat")
RegisterUnitEvent(5827, 4, "Brontus_OnDied")

-- Captain Fairmount
function CaptainFairmount_OnCombat(Unit, Event)
	Unit:RegisterEvent("CaptainFairmount_BattleShout", 1000, 1)
	Unit:RegisterEvent("CaptainFairmount_FrighteningShout", 12000, 0)
	Unit:RegisterEvent("CaptainFairmount_Pummel", 8000, 0)
end

function CaptainFairmount_BattleShout(Unit, Event) 
	Unit:CastSpell(9128) 
end

function CaptainFairmount_FrighteningShout(Unit, Event) 
	Unit:FullCastSpellOnTarget(19134, Unit:GetMainTank()) 
end

function CaptainFairmount_Pummel(Unit, Event) 
	Unit:FullCastSpellOnTarget(12555, Unit:GetMainTank()) 
end

function CaptainFairmount_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CaptainFairmount_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3393, 1, "CaptainFairmount_OnCombat")
RegisterUnitEvent(3393, 2, "CaptainFairmount_OnLeaveCombat")
RegisterUnitEvent(3393, 4, "CaptainFairmount_OnDied")

-- Captain Gerogg Hammertoe
function CaptainGeroggHammertoe_OnCombat(Unit, Event)
	Unit:RegisterEvent("CaptainGeroggHammertoe_ShieldBash", 10000, 0)
end

function CaptainGeroggHammertoe_ShieldBash(Unit, Event) 
	Unit:FullCastSpellOnTarget(1672, Unit:GetMainTank()) 
end

function CaptainGeroggHammertoe_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CaptainGeroggHammertoe_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5851, 1, "CaptainGeroggHammertoe_OnCombat")
RegisterUnitEvent(5851, 2, "CaptainGeroggHammertoe_OnLeaveCombat")
RegisterUnitEvent(5851, 4, "CaptainGeroggHammertoe_OnDied")

-- Dishu
function Dishu_OnCombat(Unit, Event)
	Unit:RegisterEvent("Dishu_SavannahCubs", 4000, 1)
end

function Dishu_SavannahCubs(Unit, Event) 
	Unit:CastSpell(8210) 
end

function Dishu_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Dishu_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5865, 1, "Dishu_OnCombat")
RegisterUnitEvent(5865, 2, "Dishu_OnLeaveCombat")
RegisterUnitEvent(5865, 4, "Dishu_OnDied")

-- Engineer Whirleygig
function EngineerWhirleygig_OnCombat(Unit, Event)
	Unit:RegisterEvent("EngineerWhirleygig_CompactHarvestReaper", 4000, 1)
	Unit:RegisterEvent("EngineerWhirleygig_ExplosiveSheep", 10000, 1)
end

function EngineerWhirleygig_CompactHarvestReaper(Unit, Event) 
	Unit:CastSpell(7979) 
end

function EngineerWhirleygig_ExplosiveSheep(Unit, Event) 
	Unit:CastSpell(8209) 
end

function EngineerWhirleygig_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function EngineerWhirleygig_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5836, 1, "EngineerWhirleygig_OnCombat")
RegisterUnitEvent(5836, 2, "EngineerWhirleygig_OnLeaveCombat")
RegisterUnitEvent(5836, 4, "EngineerWhirleygig_OnDied")

-- Foreman Grills
function ForemanGrills_OnCombat(Unit, Event)
	Unit:RegisterEvent("ForemanGrills_Hamstring", 12000, 0)
end

function ForemanGrills_Hamstring(Unit, Event) 
	Unit:FullCastSpellOnTarget(9080, Unit:GetMainTank()) 
end

function ForemanGrills_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ForemanGrills_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5835, 1, "ForemanGrills_OnCombat")
RegisterUnitEvent(5835, 2, "ForemanGrills_OnLeaveCombat")
RegisterUnitEvent(5835, 4, "ForemanGrills_OnDied")

-- Geopriest Gukkrok
function GeopriestGukkrok_OnCombat(Unit, Event)
	Unit:RegisterEvent("GeopriestGukkrok_Heal", 15000, 0)
	Unit:RegisterEvent("GeopriestGukkrok_PowerWordShield", 6000, 1)
	Unit:RegisterEvent("GeopriestGukkrok_Renew", 10000, 0)
end

function GeopriestGukkrok_Heal(Unit, Event) 
	Unit:CastSpell(2054) 
end

function GeopriestGukkrok_PowerWordShield(Unit, Event) 
	Unit:CastSpell(600) 
end

function GeopriestGukkrok_Renew(Unit, Event) 
	Unit:CastSpell(6075) 
end

function GeopriestGukkrok_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GeopriestGukkrok_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5863, 1, "GeopriestGukkrok_OnCombat")
RegisterUnitEvent(5863, 2, "GeopriestGukkrok_OnLeaveCombat")
RegisterUnitEvent(5863, 4, "GeopriestGukkrok_OnDied")

-- Gesharahan
function Gesharahan_OnCombat(Unit, Event)
	Unit:RegisterEvent("Gesharahan_DeadlyPoison", 6000, 1)
end

function Gesharahan_DeadlyPoison(Unit, Event) 
	Unit:FullCastSpellOnTarget(3583, Unit:GetMainTank()) 
end

function Gesharahan_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Gesharahan_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3398, 1, "Gesharahan_OnCombat")
RegisterUnitEvent(3398, 2, "Gesharahan_OnLeaveCombat")
RegisterUnitEvent(3398, 4, "Gesharahan_OnDied")

-- Hagg Taurenbane
function HaggTaurenbane_OnCombat(Unit, Event)
	Unit:RegisterEvent("HaggTaurenbane_Cleave", 6000, 0)
	Unit:RegisterEvent("HaggTaurenbane_DemoralizingShout", 4000, 1)
	Unit:RegisterEvent("HaggTaurenbane_Hamstring", 10000, 0)
end

function HaggTaurenbane_Cleave(Unit, Event) 
	Unit:CastSpell(40505) 
end

function HaggTaurenbane_DemoralizingShout(Unit, Event) 
	Unit:CastSpell(13730) 
end

function HaggTaurenbane_Hamstring(Unit, Event) 
	Unit:FullCastSpellOnTarget(9080, Unit:GetMainTank()) 
end

function HaggTaurenbane_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HaggTaurenbane_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5859, 1, "HaggTaurenbane_OnCombat")
RegisterUnitEvent(5859, 2, "HaggTaurenbane_OnLeaveCombat")
RegisterUnitEvent(5859, 4, "HaggTaurenbane_OnDied")

-- Heggin Stonewhisker
function HegginStonewhisker_OnCombat(Unit, Event)
	Unit:RegisterEvent("HegginStonewhisker_FireShot", 9000, 0)
	Unit:RegisterEvent("HegginStonewhisker_Shoot", 6000, 0)
end

function HegginStonewhisker_FireShot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6979, Unit:GetMainTank()) 
end

function HegginStonewhisker_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function HegginStonewhisker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HegginStonewhisker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5847, 1, "HegginStonewhisker_OnCombat")
RegisterUnitEvent(5847, 2, "HegginStonewhisker_OnLeaveCombat")
RegisterUnitEvent(5847, 4, "HegginStonewhisker_OnDied")

-- Hezul Bloodmark
function HezrulBloodmark_OnCombat(Unit, Event)
	Unit:RegisterEvent("HezrulBloodmark_BloodLeech", 6000, 0)
end

function HezrulBloodmark_BloodLeech(Unit, Event) 
	Unit:FullCastSpellOnTarget(6958, Unit:GetMainTank()) 
end

function HezrulBloodmark_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HezrulBloodmark_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3396, 1, "HezrulBloodmark_OnCombat")
RegisterUnitEvent(3396, 2, "HezrulBloodmark_OnLeaveCombat")
RegisterUnitEvent(3396, 4, "HezrulBloodmark_OnDied")

-- Humar the Pridelord
function HumarthePridelord_OnCombat(Unit, Event)
	Unit:RegisterEvent("HumarthePridelord_AgonizingPain", 10000, 0)
end

function HumarthePridelord_AgonizingPain(Unit, Event) 
	Unit:FullCastSpellOnTarget(3247, Unit:GetMainTank()) 
end

function HumarthePridelord_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HumarthePridelord_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5828, 1, "HumarthePridelord_OnCombat")
RegisterUnitEvent(5828, 2, "HumarthePridelord_OnLeaveCombat")
RegisterUnitEvent(5828, 4, "HumarthePridelord_OnDied")

-- Kuz
function Kuz_OnCombat(Unit, Event)
	Unit:RegisterEvent("Kuz_FireBlast", 8000, 0)
	Unit:RegisterEvent("Kuz_FrostNova", 10000, 0)
	Unit:RegisterEvent("Kuz_Frostbolt", 4000, 0)
end

function Kuz_FireBlast(Unit, Event) 
	Unit:FullCastSpellOnTarget(20795, Unit:GetMainTank()) 
end

function Kuz_FrostNova(Unit, Event) 
	Unit:CastSpell(11831) 
end

function Kuz_Frostbolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(20792, Unit:GetMainTank()) 
end

function Kuz_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Kuz_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3436, 1, "Kuz_OnCombat")
RegisterUnitEvent(3436, 2, "Kuz_OnLeaveCombat")
RegisterUnitEvent(3436, 4, "Kuz_OnDied")

-- Lok Orcbane
function LokOrcbane_OnCombat(Unit, Event)
	Unit:RegisterEvent("LokOrcbane_Hamstring", 8000, 0)
end

function LokOrcbane_Hamstring(Unit, Event) 
	Unit:FullCastSpellOnTarget(9080, Unit:GetMainTank()) 
end

function LokOrcbane_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function LokOrcbane_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3435, 1, "LokOrcbane_OnCombat")
RegisterUnitEvent(3435, 2, "LokOrcbane_OnLeaveCombat")
RegisterUnitEvent(3435, 4, "LokOrcbane_OnDied")

-- Malgin Barleybrew
function MalginBarleybrew_OnCombat(Unit, Event)
	Unit:RegisterEvent("MalginBarleybrew_BladeFlurry", 4000, 1)
	Unit:RegisterEvent("MalginBarleybrew_BattleShout", 6000, 1)
end

function MalginBarleybrew_BladeFlurry(Unit, Event) 
	Unit:CastSpell(3631) 
end

function MalginBarleybrew_BattleShout(Unit, Event) 
	Unit:CastSpell(5242) 
end

function MalginBarleybrew_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MalginBarleybrew_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5848, 1, "MalginBarleybrew_OnCombat")
RegisterUnitEvent(5848, 2, "MalginBarleybrew_OnLeaveCombat")
RegisterUnitEvent(5848, 4, "MalginBarleybrew_OnDied")

-- Nak
function Nak_OnCombat(Unit, Event)
	Unit:RegisterEvent("Nak_LesserHealingWave", 15000, 0)
	Unit:RegisterEvent("Nak_LightningBolt", 8000, 0)
end

function Nak_LesserHealingWave(Unit, Event) 
	Unit:CastSpell(8004) 
end

function Nak_LightningBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9532, Unit:GetMainTank()) 
end

function Nak_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Nak_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3434, 1, "Nak_OnCombat")
RegisterUnitEvent(3434, 2, "Nak_OnLeaveCombat")
RegisterUnitEvent(3434, 4, "Nak_OnDied")

-- Owantanka
function Owatanka_OnCombat(Unit, Event)
	Unit:RegisterEvent("Owatanka_ChainedBolt", 6000, 0)
end

function Owatanka_ChainedBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(6254, Unit:GetMainTank()) 
end

function Owatanka_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Owatanka_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3473, 1, "Owatanka_OnCombat")
RegisterUnitEvent(3473, 2, "Owatanka_OnLeaveCombat")
RegisterUnitEvent(3473, 4, "Owatanka_OnDied")

-- Polly
function Polly_OnCombat(Unit, Event)
	Unit:RegisterEvent("Polly_Stealth", 1000, 1)
	Unit:RegisterEvent("Polly_SummonPollyJr", 4000, 1)
end

function Polly_Stealth(Unit, Event) 
	Unit:CastSpell(8822) 
end

function Polly_SummonPollyJr(Unit, Event) 
	Unit:CastSpell(9998) 
end

function Polly_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Polly_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(7167, 1, "Polly_OnCombat")
RegisterUnitEvent(7167, 2, "Polly_OnLeaveCombat")
RegisterUnitEvent(7167, 4, "Polly_OnDied")

-- Prospector Khazgorm
function ProspectorKhazgorm_OnCombat(Unit, Event)
	Unit:RegisterEvent("ProspectorKhazgorm_Backhand", 8000, 0)
end

function ProspectorKhazgorm_Backhand(Unit, Event) 
	Unit:FullCastSpellOnTarget(6253, Unit:GetMainTank()) 
end

function ProspectorKhazgorm_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ProspectorKhazgorm_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5849, 1, "ProspectorKhazgorm_OnCombat")
RegisterUnitEvent(5849, 2, "ProspectorKhazgorm_OnLeaveCombat")
RegisterUnitEvent(5849, 4, "ProspectorKhazgorm_OnDied")

-- Rocklance
function Rocklance_OnCombat(Unit, Event)
	Unit:RegisterEvent("Rocklance_Cleave", 4000, 0)
	Unit:RegisterEvent("Rocklance_DefensiveStance", 2000, 1)
	Unit:RegisterEvent("Rocklance_SunderArmor", 6000, 0)
end

function Rocklance_Cleave(Unit, Event) 
	Unit:CastSpell(15496) 
end

function Rocklance_DefensiveStance(Unit, Event) 
	Unit:CastSpell(7164) 
end

function Rocklance_SunderArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(21081, Unit:GetMainTank()) 
end

function Rocklance_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Rocklance_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5841, 1, "Rocklance_OnCombat")
RegisterUnitEvent(5841, 2, "Rocklance_OnLeaveCombat")
RegisterUnitEvent(5841, 4, "Rocklance_OnDied")

-- Serena Bloodfeather
function SerenaBloodfeather_OnCombat(Unit, Event)
	Unit:RegisterEvent("SerenaBloodfeather_BloodHowl", 10000, 0)
end

function SerenaBloodfeather_BloodHowl(Unit, Event) 
	Unit:FullCastSpellOnTarget(3264, Unit:GetMainTank()) 
end

function SerenaBloodfeather_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SerenaBloodfeather_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3452, 1, "SerenaBloodfeather_OnCombat")
RegisterUnitEvent(3452, 2, "SerenaBloodfeather_OnLeaveCombat")
RegisterUnitEvent(3452, 4, "SerenaBloodfeather_OnDied")

-- Sister Rathtalon
function SisterRathtalon_OnCombat(Unit, Event)
	Unit:RegisterEvent("SisterRathtalon_EnvelopingWinds", 10000, 0)
	Unit:RegisterEvent("SisterRathtalon_GustofWind", 14000, 0)
	Unit:RegisterEvent("SisterRathtalon_LightningCloud", 3000, 1)
end

function SisterRathtalon_EnvelopingWinds(Unit, Event) 
	Unit:FullCastSpellOnTarget(6728, Unit:GetMainTank()) 
end

function SisterRathtalon_GustofWind(Unit, Event) 
	Unit:CastSpell(6982) 
end

function SisterRathtalon_LightningCloud(Unit, Event) 
	Unit:CastSpell(6535) 
end

function SisterRathtalon_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SisterRathtalon_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5830, 1, "SisterRathtalon_OnCombat")
RegisterUnitEvent(5830, 2, "SisterRathtalon_OnLeaveCombat")
RegisterUnitEvent(5830, 4, "SisterRathtalon_OnDied")

-- Snort the Heckler
function SnorttheHeckler_OnCombat(Unit, Event)
	Unit:RegisterEvent("SnorttheHeckler_ToxicSpit", 6000, 0)
end

function SnorttheHeckler_ToxicSpit(Unit, Event) 
	Unit:FullCastSpellOnTarget(7951, Unit:GetMainTank()) 
end

function SnorttheHeckler_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SnorttheHeckler_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5829, 1, "SnorttheHeckler_OnCombat")
RegisterUnitEvent(5829, 2, "SnorttheHeckler_OnLeaveCombat")
RegisterUnitEvent(5829, 4, "SnorttheHeckler_OnDied")

-- Stormhide
function Stormhide_OnCombat(Unit, Event)
	Unit:RegisterEvent("Stormhide_LizardBolt", 6000, 0)
end

function Stormhide_LizardBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(5401, Unit:GetMainTank()) 
end

function Stormhide_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Stormhide_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3238, 1, "Stormhide_OnCombat")
RegisterUnitEvent(3238, 2, "Stormhide_OnLeaveCombat")
RegisterUnitEvent(3238, 4, "Stormhide_OnDied")

-- Swiftmane
function Swiftmane_OnCombat(Unit, Event)
	Unit:RegisterEvent("Swiftmane_PierceArmor", 10000, 0)
end

function Swiftmane_PierceArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(6016, Unit:GetMainTank()) 
end

function Swiftmane_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Swiftmane_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5831, 1, "Swiftmane_OnCombat")
RegisterUnitEvent(5831, 2, "Swiftmane_OnLeaveCombat")
RegisterUnitEvent(5831, 4, "Swiftmane_OnDied")

-- Tazan
function Tazan_OnCombat(Unit, Event)
	Unit:RegisterEvent("Tazan_Backhand", 8000, 0)
end

function Tazan_Backhand(Unit, Event) 
	Unit:FullCastSpellOnTarget(6253, Unit:GetMainTank()) 
end

function Tazan_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Tazan_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6494, 1, "Tazan_OnCombat")
RegisterUnitEvent(6494, 2, "Tazan_OnLeaveCombat")
RegisterUnitEvent(6494, 4, "Tazan_OnDied")

-- Thunderhead
function Thunderhead_OnCombat(Unit, Event)
	Unit:RegisterEvent("Thunderhead_LizardBolt", 6000, 0)
end

function Thunderhead_LizardBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(5401, Unit:GetMainTank()) 
end

function Thunderhead_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Thunderhead_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3239, 1, "Thunderhead_OnCombat")
RegisterUnitEvent(3239, 2, "Thunderhead_OnLeaveCombat")
RegisterUnitEvent(3239, 4, "Thunderhead_OnDied")

-- Thunderstomp
function Thunderstomp_OnCombat(Unit, Event)
	Unit:RegisterEvent("Thunderstomp_ChainedBolt", 6000, 0)
end

function Thunderstomp_ChainedBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(6254, Unit:GetMainTank()) 
end

function Thunderstomp_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Thunderstomp_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5832, 1, "Thunderstomp_OnCombat")
RegisterUnitEvent(5832, 2, "Thunderstomp_OnLeaveCombat")
RegisterUnitEvent(5832, 4, "Thunderstomp_OnDied")

-- Warlord Kromzar
function WarlordKromzar_OnCombat(Unit, Event)
	Unit:RegisterEvent("WarlordKromzar_CreateKromzarsBanner", 2000, 1)
	Unit:RegisterEvent("WarlordKromzar_Strike", 5000, 0)
end

function WarlordKromzar_CreateKromzarsBanner(Unit, Event) 
	Unit:CastSpell(13965) 
end

function WarlordKromzar_Strike(Unit, Event) 
	Unit:FullCastSpellOnTarget(11976, Unit:GetMainTank()) 
end

function WarlordKromzar_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WarlordKromzar_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(9456, 1, "WarlordKromzar_OnCombat")
RegisterUnitEvent(9456, 2, "WarlordKromzar_OnLeaveCombat")
RegisterUnitEvent(9456, 4, "WarlordKromzar_OnDied")