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

-- Baeldun Excavator
function BaeldunExcavator_OnCombat(Unit, Event)
	Unit:RegisterEvent("BaeldunExcavator_DefensiveStance", 1000, 1)
	Unit:RegisterEvent("BaeldunExcavator_SunderArmor", 5000, 0)
end

function BaeldunExcavator_DefensiveStance(Unit, Event) 
	Unit:CastSpell(7164) 
end

function BaeldunExcavator_SunderArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(21081, Unit:GetMainTank()) 
end

function BaeldunExcavator_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BaeldunExcavator_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3374, 1, "BaeldunExcavator_OnCombat")
RegisterUnitEvent(3374, 2, "BaeldunExcavator_OnLeaveCombat")
RegisterUnitEvent(3374, 4, "BaeldunExcavator_OnDied")

-- Baeldun Foreman
function BaeldunForeman_OnCombat(Unit, Event)
	Unit:RegisterEvent("BaeldunForeman_TorchToss", 8000, 0)
end

function BaeldunForeman_TorchToss(Unit, Event) 
	Unit:FullCastSpellOnTarget(6257, Unit:GetMainTank()) 
end

function BaeldunForeman_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BaeldunForeman_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3375, 1, "BaeldunForeman_OnCombat")
RegisterUnitEvent(3375, 2, "BaeldunForeman_OnLeaveCombat")
RegisterUnitEvent(3375, 4, "BaeldunForeman_OnDied")

-- Baeldun Officer
function BaeldunOfficer_OnCombat(Unit, Event)
	Unit:RegisterEvent("BaeldunOfficer_NimbleReflexes", 10000, 0)
	Unit:RegisterEvent("BaeldunOfficer_Thrash", 5000, 0)
end

function BaeldunOfficer_NimbleReflexes(Unit, Event) 
	Unit:CastSpell(6264) 
end

function BaeldunOfficer_Thrash(Unit, Event) 
	Unit:FullCastSpellOnTarget(3391, Unit:GetMainTank()) 
end

function BaeldunOfficer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BaeldunOfficer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3378, 1, "BaeldunOfficer_OnCombat")
RegisterUnitEvent(3378, 2, "BaeldunOfficer_OnLeaveCombat")
RegisterUnitEvent(3378, 4, "BaeldunOfficer_OnDied")

-- Baeldun Rifleman
function BaeldunRifleman_OnCombat(Unit, Event)
	Unit:RegisterEvent("BaeldunRifleman_Shoot", 6000, 0)
end

function BaeldunRifleman_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function BaeldunRifleman_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BaeldunRifleman_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3377, 1, "BaeldunRifleman_OnCombat")
RegisterUnitEvent(3377, 2, "BaeldunRifleman_OnLeaveCombat")
RegisterUnitEvent(3377, 4, "BaeldunRifleman_OnDied")

-- Barak Kodobane
function BarakKodobane_OnCombat(Unit, Event)
	Unit:RegisterEvent("BarakKodobane_Shoot", 6000, 0)
end

function BarakKodobane_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function BarakKodobane_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BarakKodobane_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3394, 1, "BarakKodobane_OnCombat")
RegisterUnitEvent(3394, 2, "BarakKodobane_OnLeaveCombat")
RegisterUnitEvent(3394, 4, "BarakKodobane_OnDied")

-- Barrens Kodo
function BarrensKodo_OnCombat(Unit, Event)
	Unit:RegisterEvent("BarrensKodo_KodoStomp", 6000, 0)
end

function BarrensKodo_KodoStomp(Unit, Event) 
	Unit:CastSpell(6266) 
end

function BarrensKodo_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BarrensKodo_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3236, 1, "BarrensKodo_OnCombat")
RegisterUnitEvent(3236, 2, "BarrensKodo_OnLeaveCombat")
RegisterUnitEvent(3236, 4, "BarrensKodo_OnDied")

-- Bristleback Geomancer
function BristlebackGeomancer_OnCombat(Unit, Event)
	Unit:RegisterEvent("BristlebackGeomancer_QuickFlameWard", 11000, 0)
	Unit:RegisterEvent("BristlebackGeomancer_Flamestrike", 10000, 0)
	Unit:RegisterEvent("BristlebackGeomancer_Fireball", 8000, 0)
end

function BristlebackGeomancer_QuickFlameWard(Unit, Event) 
	Unit:CastSpell(4979) 
end

function BristlebackGeomancer_Flamestrike(Unit, Event) 
	Unit:CastSpell(20794) 
end

function BristlebackGeomancer_Fireball(Unit, Event) 
	Unit:FullCastSpellOnTarget(20793, Unit:GetMainTank()) 
end

function BristlebackGeomancer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BristlebackGeomancer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3263, 1, "BristlebackGeomancer_OnCombat")
RegisterUnitEvent(3263, 2, "BristlebackGeomancer_OnLeaveCombat")
RegisterUnitEvent(3263, 4, "BristlebackGeomancer_OnDied")

-- Bristleback Hunter
function BristlebackHunter_OnCombat(Unit, Event)
	Unit:RegisterEvent("BristlebackHunter_Shoot", 5000, 0)
	Unit:RegisterEvent("BristlebackHunter_PoisonedShot", 1000, 1)
end

function BristlebackHunter_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function BristlebackHunter_PoisonedShot(Unit, Event) 
	Unit:FullCastSpellOnTarget(8806, Unit:GetMainTank()) 
end

function BristlebackHunter_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BristlebackHunter_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3258, 1, "BristlebackHunter_OnCombat")
RegisterUnitEvent(3258, 2, "BristlebackHunter_OnLeaveCombat")
RegisterUnitEvent(3258, 4, "BristlebackHunter_OnDied")

--Bristleback Thornweaver
function BristlebackThornweaver_OnCombat(Unit, Event)
	Unit:RegisterEvent("BristlebackThornweaver_Thorns", 3000, 1)
	Unit:RegisterEvent("BristlebackThornweaver_EntanglingRoots", 12000, 0)
end

function BristlebackThornweaver_Thorns(Unit, Event) 
	Unit:CastSpell(782) 
end

function BristlebackThornweaver_EntanglingRoots(Unit, Event) 
	Unit:FullCastSpellOnTarget(12747, Unit:GetMainTank()) 
end

function BristlebackThornweaver_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BristlebackThornweaver_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3261, 1, "BristlebackThornweaver_OnCombat")
RegisterUnitEvent(3261, 2, "BristlebackThornweaver_OnLeaveCombat")
RegisterUnitEvent(3261, 4, "BristlebackThornweaver_OnDied")

-- Bristleback Water Seeker
function BristlebackWaterSeeker_OnCombat(Unit, Event)
	Unit:RegisterEvent("BristlebackWaterSeeker_FrostNova", 8000, 0)
end

function BristlebackWaterSeeker_FrostNova(Unit, Event) 
	Unit:CastSpell(12748) 
end

function BristlebackWaterSeeker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BristlebackWaterSeeker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3260, 1, "BristlebackWaterSeeker_OnCombat")
RegisterUnitEvent(3260, 2, "BristlebackWaterSeeker_OnLeaveCombat")
RegisterUnitEvent(3260, 4, "BristlebackWaterSeeker_OnDied")

-- Burning Blade Acolyte
function BurningBladeAcolyte_OnCombat(Unit, Event)
	Unit:RegisterEvent("BurningBladeAcolyte_CurseofAgony", 8000, 2)
	Unit:RegisterEvent("BurningBladeAcolyte_Inmolate", 3000, 2)
end

function BurningBladeAcolyte_CurseofAgony(Unit, Event) 
	Unit:FullCastSpellOnTarget(980, Unit:GetMainTank()) 
end

function BurningBladeAcolyte_Inmolate(Unit, Event) 
	Unit:FullCastSpellOnTarget(707, Unit:GetMainTank()) 
end

function BurningBladeAcolyte_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BurningBladeAcolyte_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3380, 1, "BurningBladeAcolyte_OnCombat")
RegisterUnitEvent(3380, 2, "BurningBladeAcolyte_OnLeaveCombat")
RegisterUnitEvent(3380, 4, "BurningBladeAcolyte_OnDied")

-- Burning Blade Toxicologist
function BurningBladeToxicologist_OnCombat(Unit, Event)
	Unit:RegisterEvent("BurningBladeToxicologist_CurseofAgony", 8000, 2)
	Unit:RegisterEvent("BurningBladeToxicologist_Inmolate", 3000, 2)
end

function BurningBladeToxicologist_CurseofAgony(Unit, Event) 
	Unit:FullCastSpellOnTarget(980, Unit:GetMainTank()) 
end

function BurningBladeToxicologist_Inmolate(Unit, Event) 
	Unit:FullCastSpellOnTarget(707, Unit:GetMainTank()) 
end

function BurningBladeToxicologist_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BurningBladeToxicologist_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12319, 1, "BurningBladeToxicologist_OnCombat")
RegisterUnitEvent(12319, 2, "BurningBladeToxicologist_OnLeaveCombat")
RegisterUnitEvent(12319, 4, "BurningBladeToxicologist_OnDied")

-- Corrupted Dreadmaw Crocolisk
function CorruptedDreadmawCrocolisk_OnCombat(Unit, Event)
	Unit:RegisterEvent("CorruptedDreadmawCrocolisk_DecayedAgility", 10000, 1)
end

function CorruptedDreadmawCrocolisk_DecayedAgility(Unit, Event) 
	Unit:FullCastSpellOnTarget(7901, Unit:GetMainTank()) 
end

function CorruptedDreadmawCrocolisk_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CorruptedDreadmawCrocolisk_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3231, 1, "CorruptedDreadmawCrocolisk_OnCombat")
RegisterUnitEvent(3231, 2, "CorruptedDreadmawCrocolisk_OnLeaveCombat")
RegisterUnitEvent(3231, 4, "CorruptedDreadmawCrocolisk_OnDied")

-- Digger Flameforge
function DiggerFlameforge_OnCombat(Unit, Event)
	Unit:RegisterEvent("DiggerFlameforge_Backhand", 8000, 0)
	Unit:RegisterEvent("DiggerFlameforge_ThrowDynamite", 12000, 0)
end

function DiggerFlameforge_Backhand(Unit, Event) 
	Unit:FullCastSpellOnTarget(6253, Unit:GetMainTank()) 
end

function DiggerFlameforge_ThrowDynamite(Unit, Event) 
	Unit:CastSpell(7978) 
end

function DiggerFlameforge_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DiggerFlameforge_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5849, 1, "DiggerFlameforge_OnCombat")
RegisterUnitEvent(5849, 2, "DiggerFlameforge_OnLeaveCombat")
RegisterUnitEvent(5849, 4, "DiggerFlameforge_OnDied")

-- Dreadmaw Crocolisk
function DreadmawCrocolisk_OnCombat(Unit, Event)
	Unit:RegisterEvent("DreadmawCrocolisk_MuscleTear", 8000, 0)
end

function DreadmawCrocolisk_MuscleTear(Unit, Event) 
	Unit:FullCastSpellOnTarget(12166, Unit:GetMainTank()) 
end

function DreadmawCrocolisk_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DreadmawCrocolisk_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3110, 1, "DreadmawCrocolisk_OnCombat")
RegisterUnitEvent(3110, 2, "DreadmawCrocolisk_OnLeaveCombat")
RegisterUnitEvent(3110, 4, "DreadmawCrocolisk_OnDied")

-- Elder Mystic Razorsnout
function ElderMysticRazorsnout_OnCombat(Unit, Event)
	Unit:RegisterEvent("ElderMysticRazorsnout_EarthbindTotem", 4000, 1)
	Unit:RegisterEvent("ElderMysticRazorsnout_HealingWave", 12000, 0)
end

function ElderMysticRazorsnout_EarthbindTotem(Unit, Event) 
	Unit:CastSpell(2484) 
end

function ElderMysticRazorsnout_HealingWave(Unit, Event) 
	Unit:CastSpell(547) 
end

function ElderMysticRazorsnout_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ElderMysticRazorsnout_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3270, 1, "ElderMysticRazorsnout_OnCombat")
RegisterUnitEvent(3270, 2, "ElderMysticRazorsnout_OnLeaveCombat")
RegisterUnitEvent(3270, 4, "ElderMysticRazorsnout_OnDied")

-- Greater Barrens Kodo
function GreaterBarrensKodo_OnCombat(Unit, Event)
	Unit:RegisterEvent("GreaterBarrensKodo_RushingCharge", 8000, 0)
end

function GreaterBarrensKodo_RushingCharge(Unit, Event) 
	Unit:CastSpell(6268) 
end

function GreaterBarrensKodo_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GreaterBarrensKodo_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3235, 1, "GreaterBarrensKodo_OnCombat")
RegisterUnitEvent(3235, 2, "GreaterBarrensKodo_OnLeaveCombat")
RegisterUnitEvent(3235, 4, "GreaterBarrensKodo_OnDied")

-- Greater Thunderhawk
function GreaterThunderhawk_OnCombat(Unit, Event)
	Unit:RegisterEvent("GreaterThunderhawk_ThunderClap", 10000, 0)
end

function GreaterThunderhawk_ThunderClap(Unit, Event) 
	Unit:CastSpell(8078) 
end

function GreaterThunderhawk_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GreaterThunderhawk_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3249, 1, "GreaterThunderhawk_OnCombat")
RegisterUnitEvent(3249, 2, "GreaterThunderhawk_OnLeaveCombat")
RegisterUnitEvent(3249, 4, "GreaterThunderhawk_OnDied")

-- Kolkar Bloodcharger
function KolkarBloodcharger_OnCombat(Unit, Event)
	Unit:RegisterEvent("KolkarBloodcharger_Bloodlust", 4000, 1)
	Unit:RegisterEvent("KolkarBloodcharger_Corruption", 10000, 0)
end

function KolkarBloodcharger_Bloodlust(Unit, Event) 
	Unit:CastSpell(6742) 
end

function KolkarBloodcharger_Corruption(Unit, Event) 
	Unit:FullCastSpellOnTarget(172, Unit:GetMainTank()) 
end

function KolkarBloodcharger_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function KolkarBloodcharger_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3397, 1, "KolkarBloodcharger_OnCombat")
RegisterUnitEvent(3397, 2, "KolkarBloodcharger_OnLeaveCombat")
RegisterUnitEvent(3397, 4, "KolkarBloodcharger_OnDied")

-- Kolkar Invader
function KolkarInvader_OnCombat(Unit, Event)
	Unit:RegisterEvent("KolkarInvader_FlingTorch", 2000, 1)
	Unit:RegisterEvent("KolkarInvader_RushingCharge", 8000, 0)
	Unit:RegisterEvent("KolkarInvader_Strike", 6000, 0)
	Unit:RegisterEvent("KolkarInvader_Tetanus", 4000, 1)
end

function KolkarInvader_FlingTorch(Unit, Event) 
	Unit:CastSpell(14292) 
end

function KolkarInvader_RushingCharge(Unit, Event) 
	Unit:CastSpell(6268) 
end

function KolkarInvader_Strike(Unit, Event) 
	Unit:FullCastSpellOnTarget(11976, Unit:GetMainTank()) 
end

function KolkarInvader_Tetanus(Unit, Event) 
	Unit:FullCastSpellOnTarget(8014, Unit:GetMainTank()) 
end

function KolkarInvader_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function KolkarInvader_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(9524, 1, "KolkarInvader_OnCombat")
RegisterUnitEvent(9524, 2, "KolkarInvader_OnLeaveCombat")
RegisterUnitEvent(9524, 4, "KolkarInvader_OnDied")

-- Kolkar Marauder
function KolkarMarauder_OnCombat(Unit, Event)
	Unit:RegisterEvent("KolkarMarauder_Strike", 6000, 0)
end

function KolkarMarauder_Strike(Unit, Event) 
	Unit:FullCastSpellOnTarget(11976, Unit:GetMainTank()) 
end

function KolkarMarauder_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function KolkarMarauder_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3275, 1, "KolkarMarauder_OnCombat")
RegisterUnitEvent(3275, 2, "KolkarMarauder_OnLeaveCombat")
RegisterUnitEvent(3275, 4, "KolkarMarauder_OnDied")

-- Kolkar Pack Runner
function KolkarPackRunner_OnCombat(Unit, Event)
	Unit:RegisterEvent("KolkarPackRunner_BattleShout", 4000, 1)
end

function KolkarPackRunner_BattleShout(Unit, Event) 
	Unit:CastSpell(9128) 
end

function KolkarPackRunner_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function KolkarPackRunner_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3274, 1, "KolkarPackRunner_OnCombat")
RegisterUnitEvent(3274, 2, "KolkarPackRunner_OnLeaveCombat")
RegisterUnitEvent(3274, 4, "KolkarPackRunner_OnDied")

-- Kolkar Stormer
function KolkarStormer_OnCombat(Unit, Event)
	Unit:RegisterEvent("KolkarStormer_LightningBolt", 8000, 0)
	Unit:RegisterEvent("KolkarStormer_LightningCloud", 4000, 1)
end

function KolkarStormer_LightningBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9532, Unit:GetMainTank()) 
end

function KolkarStormer_LightningCloud(Unit, Event) 
	Unit:CastSpell(6535) 
end

function KolkarStormer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function KolkarStormer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3273, 1, "KolkarStormer_OnCombat")
RegisterUnitEvent(3273, 2, "KolkarStormer_OnLeaveCombat")
RegisterUnitEvent(3273, 4, "KolkarStormer_OnDied")

-- Kolkar Stormseer
function KolkarStormseer_OnCombat(Unit, Event)
	Unit:RegisterEvent("KolkarStormseer_FlingTorch", 2000, 1)
	Unit:RegisterEvent("KolkarStormseer_LightningBolt", 8000, 0)
	Unit:RegisterEvent("KolkarStormseer_LightningCloud", 4000, 1)
end

function KolkarStormseer_FlingTorch(Unit, Event) 
	Unit:CastSpell(14292) 
end

function KolkarStormseer_LightningBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9532, Unit:GetMainTank()) 
end

function KolkarStormseer_LightningCloud(Unit, Event) 
	Unit:CastSpell(6535) 
end

function KolkarStormseer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function KolkarStormseer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(9523, 1, "KolkarStormseer_OnCombat")
RegisterUnitEvent(9523, 2, "KolkarStormseer_OnLeaveCombat")
RegisterUnitEvent(9523, 4, "KolkarStormseer_OnDied")

-- Kolkar Wrangler
function KolkarWrangler_OnCombat(Unit, Event)
	Unit:RegisterEvent("KolkarWrangler_Net", 10000, 0)
	Unit:RegisterEvent("KolkarWrangler_Shoot", 6000, 0)
end

function KolkarWrangler_Net(Unit, Event) 
	Unit:FullCastSpellOnTarget(12024, Unit:GetMainTank()) 
end

function KolkarWrangler_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function KolkarStormseer_LightningCloud(Unit, Event) 
	Unit:CastSpell(6535) 
end

function KolkarWrangler_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function KolkarWrangler_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3272, 1, "KolkarWrangler_OnCombat")
RegisterUnitEvent(3272, 2, "KolkarWrangler_OnLeaveCombat")
RegisterUnitEvent(3272, 4, "KolkarWrangler_OnDied")

-- Lost Barrens Kodo
function LostBarrensKodo_OnCombat(Unit, Event)
	Unit:RegisterEvent("LostBarrensKodo_KodoStomp", 6000, 0)
end

function LostBarrensKodo_KodoStomp(Unit, Event) 
	Unit:CastSpell(6266) 
end

function LostBarrensKodo_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function LostBarrensKodo_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3236, 1, "LostBarrensKodo_OnCombat")
RegisterUnitEvent(3236, 2, "LostBarrensKodo_OnLeaveCombat")
RegisterUnitEvent(3236, 4, "LostBarrensKodo_OnDied")

-- Oasis Snapjaw
function OasisSnapjaw_OnCombat(Unit, Event)
	Unit:RegisterEvent("OasisSnapjaw_SlingDirt", 12000, 0)
end

function OasisSnapjaw_SlingDirt(Unit, Event) 
	Unit:FullCastSpellOnTarget(6530, Unit:GetMainTank()) 
end

function OasisSnapjaw_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function OasisSnapjaw_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3461, 1, "OasisSnapjaw_OnCombat")
RegisterUnitEvent(3461, 2, "OasisSnapjaw_OnLeaveCombat")
RegisterUnitEvent(3461, 4, "OasisSnapjaw_OnDied")

-- Razorfen Battleguard
function RazorfenBattleguard_OnCombat(Unit, Event)
	Unit:RegisterEvent("RazorfenBattleguard_Slam", 6000, 0)
end

function RazorfenBattleguard_Slam(Unit, Event) 
	Unit:FullCastSpellOnTarget(11430, Unit:GetMainTank()) 
end

function RazorfenBattleguard_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RazorfenBattleguard_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(7873, 1, "RazorfenBattleguard_OnCombat")
RegisterUnitEvent(7873, 2, "RazorfenBattleguard_OnLeaveCombat")
RegisterUnitEvent(7873, 4, "RazorfenBattleguard_OnDied")

-- Razorfen Thornweaver
function RazorfenThornweaver_OnCombat(Unit, Event)
	Unit:RegisterEvent("RazorfenThornweaver_HealingTouch", 15000, 0)
	Unit:RegisterEvent("RazorfenThornweaver_Thorns", 4000, 1)
end

function RazorfenThornweaver_HealingTouch(Unit, Event) 
	Unit:CastSpell(11431) 
end

function RazorfenThornweaver_Thorns(Unit, Event) 
	Unit:CastSpell(7966) 
end

function RazorfenThornweaver_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RazorfenThornweaver_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(7874, 1, "RazorfenThornweaver_OnCombat")
RegisterUnitEvent(7874, 2, "RazorfenThornweaver_OnLeaveCombat")
RegisterUnitEvent(7874, 4, "RazorfenThornweaver_OnDied")

-- Razormane Defender
function RazormaneDefender_OnCombat(Unit, Event)
	Unit:RegisterEvent("RazormaneDefender_BattleStance", 1000, 1)
	Unit:RegisterEvent("RazormaneDefender_DemoralizingShout", 4000, 1)
	Unit:RegisterEvent("RazormaneDefender_HeroicStrike", 6000, 0)
end

function RazormaneDefender_BattleStance(Unit, Event) 
	Unit:CastSpell(7165) 
end

function RazormaneDefender_DemoralizingShout(Unit, Event) 
	Unit:CastSpell(13730) 
end

function RazormaneDefender_HeroicStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(25710, Unit:GetMainTank()) 
end

function RazormaneDefender_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RazormaneDefender_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3266, 1, "RazormaneDefender_OnCombat")
RegisterUnitEvent(3266, 2, "RazormaneDefender_OnLeaveCombat")
RegisterUnitEvent(3266, 4, "RazormaneDefender_OnDied")

-- Razormane Geomancer
function RazormaneGeomancer_OnCombat(Unit, Event)
	Unit:RegisterEvent("RazormaneGeomancer_Fireball", 8000, 0)
	Unit:RegisterEvent("RazormaneGeomancer_FrostArmor", 1000, 1)
end

function RazormaneGeomancer_FrostArmor(Unit, Event) 
	Unit:CastSpell(12544) 
end

function RazormaneGeomancer_Fireball(Unit, Event) 
	Unit:FullCastSpellOnTarget(20793, Unit:GetMainTank()) 
end

function RazormaneGeomancer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RazormaneGeomancer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3269, 1, "RazormaneGeomancer_OnCombat")
RegisterUnitEvent(3269, 2, "RazormaneGeomancer_OnLeaveCombat")
RegisterUnitEvent(3269, 4, "RazormaneGeomancer_OnDied")

-- Razormane Hunter
function RazormaneHunter_OnCombat(Unit, Event)
	Unit:RegisterEvent("RazormaneHunter_Shoot", 6000, 0)
	Unit:RegisterEvent("RazormaneHunter_RazormaneWolf", 3000, 1)
end

function RazormaneHunter_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function RazormaneHunter_RazormaneWolf(Unit, Event) 
	Unit:CastSpell(6479) 
end

function RazormaneHunter_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RazormaneHunter_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3265, 1, "RazormaneHunter_OnCombat")
RegisterUnitEvent(3265, 2, "RazormaneHunter_OnLeaveCombat")
RegisterUnitEvent(3265, 4, "RazormaneHunter_OnDied")

-- Razormane Mystic
function RazormaneMystic_OnCombat(Unit, Event)
	Unit:RegisterEvent("RazormaneMystic_HealingWave", 12000, 0)
	Unit:RegisterEvent("RazormaneMystic_LightningShield", 3000, 0)
end

function RazormaneMystic_HealingWave(Unit, Event) 
	Unit:CastSpell(547) 
end

function RazormaneMystic_LightningShield(Unit, Event) 
	Unit:CastSpell(324) 
end

function RazormaneMystic_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RazormaneMystic_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3271, 1, "RazormaneMystic_OnCombat")
RegisterUnitEvent(3271, 2, "RazormaneMystic_OnLeaveCombat")
RegisterUnitEvent(3271, 4, "RazormaneMystic_OnDied")

-- Razormane Patchfinder
function RazormanePathfinder_OnCombat(Unit, Event)
	Unit:RegisterEvent("RazormanePathfinder_Shoot", 6000, 0)
	Unit:RegisterEvent("RazormanePathfinder_Thrash", 4000, 1)
end

function RazormanePathfinder_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function RazormanePathfinder_Thrash(Unit, Event) 
	Unit:FullCastSpellOnTarget(3391, Unit:GetMainTank()) 
end

function RazormanePathfinder_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RazormanePathfinder_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3456, 1, "RazormanePathfinder_OnCombat")
RegisterUnitEvent(3456, 2, "RazormanePathfinder_OnLeaveCombat")
RegisterUnitEvent(3456, 4, "RazormanePathfinder_OnDied")

-- Razormane Seer
function RazormaneSeer_OnCombat(Unit, Event)
	Unit:RegisterEvent("RazormaneSeer_HealingWard", 2000, 1)
	Unit:RegisterEvent("RazormaneSeer_SearingTotem", 4000, 1)
end

function RazormaneSeer_HealingWard(Unit, Event) 
	Unit:CastSpell(6274) 
end

function RazormaneSeer_SearingTotem(Unit, Event) 
	Unit:CastSpell(6363) 
end

function RazormaneSeer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RazormaneSeer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3458, 1, "RazormaneSeer_OnCombat")
RegisterUnitEvent(3458, 2, "RazormaneSeer_OnLeaveCombat")
RegisterUnitEvent(3458, 4, "RazormaneSeer_OnDied")

-- Razormane Stalker
function RazormaneStalker_OnCombat(Unit, Event)
	Unit:RegisterEvent("RazormaneStalker_SinesterStrike", 3000, 0)
end

function RazormaneStalker_SinesterStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(1758, Unit:GetMainTank()) 
end

function RazormaneStalker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RazormaneStalker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3457, 1, "RazormaneStalker_OnCombat")
RegisterUnitEvent(3457, 2, "RazormaneStalker_OnLeaveCombat")
RegisterUnitEvent(3457, 4, "RazormaneStalker_OnDied")

-- Razormane Thornweaver
function RazormaneThornweaver_OnCombat(Unit, Event)
	Unit:RegisterEvent("RazormaneThornweaver_FaerieFire", 8000, 1)
	Unit:RegisterEvent("RazormaneThornweaver_Thorns", 2000, 1)
end

function RazormaneThornweaver_FaerieFire(Unit, Event) 
	Unit:FullCastSpellOnTarget(6950, Unit:GetMainTank()) 
end

function RazormaneThornweaver_Thorns(Unit, Event) 
	Unit:CastSpell(467) 
end

function RazormaneThornweaver_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RazormaneThornweaver_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3268, 1, "RazormaneThornweaver_OnCombat")
RegisterUnitEvent(3268, 2, "RazormaneThornweaver_OnLeaveCombat")
RegisterUnitEvent(3268, 4, "RazormaneThornweaver_OnDied")

-- Razor Water Seeker
function RazormaneWaterSeeker_OnCombat(Unit, Event)
	Unit:RegisterEvent("RazormaneWaterSeeker_CreepingMold", 4000, 1)
end

function RazormaneWaterSeeker_CreepingMold(Unit, Event) 
	Unit:FullCastSpellOnTarget(6278, Unit:GetMainTank()) 
end

function RazormaneWaterSeeker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RazormaneWaterSeeker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3267, 1, "RazormaneWaterSeeker_OnCombat")
RegisterUnitEvent(3267, 2, "RazormaneWaterSeeker_OnLeaveCombat")
RegisterUnitEvent(3267, 4, "RazormaneWaterSeeker_OnDied")

-- Savannah Matriarch
function SavannahMatriarch_OnCombat(Unit, Event)
	Unit:RegisterEvent("SavannahMatriarch_SavannahCubs", 4000, 1)
end

function SavannahMatriarch_SavannahCubs(Unit, Event) 
	Unit:CastSpell(8210) 
end

function SavannahMatriarch_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SavannahMatriarch_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5865, 1, "SavannahMatriarch_OnCombat")
RegisterUnitEvent(5865, 2, "SavannahMatriarch_OnLeaveCombat")
RegisterUnitEvent(5865, 4, "SavannahMatriarch_OnDied")

-- Silithid Creeper Egg
function SilithidCreeperEgg_OnCombat(Unit, Event)
	Unit:RegisterEvent("SilithidCreeperEgg_Suicide", 20000, 1)
	Unit:RegisterEvent("SilithidCreeperEgg_SummonSilithidGrub", 4000, 1)
end

function SilithidCreeperEgg_Suicide(Unit, Event) 
	Unit:CastSpell(7) 
end

function SilithidCreeperEgg_SummonSilithidGrub(Unit, Event) 
	Unit:CastSpell(6588) 
end

function SilithidCreeperEgg_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SilithidCreeperEgg_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5781, 1, "SilithidCreeperEgg_OnCombat")
RegisterUnitEvent(5781, 2, "SilithidCreeperEgg_OnLeaveCombat")
RegisterUnitEvent(5781, 4, "SilithidCreeperEgg_OnDied")

-- Silithid Creeper
function SilithidCreeper_OnCombat(Unit, Event)
	Unit:RegisterEvent("SilithidCreeper_SilithidCreeperEgg", 4000, 1)
end

function SilithidCreeper_SilithidCreeperEgg(Unit, Event) 
	Unit:CastSpell(6587) 
end

function SilithidCreeper_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SilithidCreeper_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3250, 1, "SilithidCreeper_OnCombat")
RegisterUnitEvent(3250, 2, "SilithidCreeper_OnLeaveCombat")
RegisterUnitEvent(3250, 4, "SilithidCreeper_OnDied")

-- Silithid Harvester
function SilithidHarvester_OnCombat(Unit, Event)
	Unit:RegisterEvent("SilithidHarvester_HarvestSwarm", 6000, 0)
	Unit:RegisterEvent("SilithidHarvester_SummonHarvesterSwarm", 3000, 1)
end

function SilithidHarvester_HarvestSwarm(Unit, Event) 
	Unit:FullCastSpellOnTarget(7277, Unit:GetMainTank()) 
end

function SilithidHarvester_SummonHarvesterSwarm(Unit, Event) 
	Unit:CastSpell(7278) 
end

function SilithidHarvester_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SilithidHarvester_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3253, 1, "SilithidHarvester_OnCombat")
RegisterUnitEvent(3253, 2, "SilithidHarvester_OnLeaveCombat")
RegisterUnitEvent(3253, 4, "SilithidHarvester_OnDied")

-- Silithid Swarmer
function SilithidSwarmer_OnCombat(Unit, Event)
	Unit:RegisterEvent("SilithidSwarmer_SilithidSwarm", 3000, 1)
end

function SilithidSwarmer_SilithidSwarm(Unit, Event) 
	Unit:CastSpell(6589) 
end

function SilithidSwarmer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SilithidSwarmer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3252, 1, "SilithidSwarmer_OnCombat")
RegisterUnitEvent(3252, 2, "SilithidSwarmer_OnLeaveCombat")
RegisterUnitEvent(3252, 4, "SilithidSwarmer_OnDied")

-- Sludge Beast
function SludgeBeast_OnCombat(Unit, Event)
	Unit:RegisterEvent("SludgeBeast_BlackSludge", 6000, 0)
end

function SludgeBeast_BlackSludge(Unit, Event) 
	Unit:CastSpell(7279) 
end

function SludgeBeast_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SludgeBeast_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

function SludgeBeast_OnKilledTarget(Unit, Event) 
end

RegisterUnitEvent(3295, 1, "SludgeBeast_OnCombat")
RegisterUnitEvent(3295, 2, "SludgeBeast_OnLeaveCombat")
RegisterUnitEvent(3295, 4, "SludgeBeast_OnDied")

-- Southsea Brigand
function SouthseaBrigand_OnCombat(Unit, Event)
	Unit:RegisterEvent("SouthseaBrigand_Backhand", 8000, 0)
end

function SouthseaBrigand_Backhand(Unit, Event) 
	Unit:FullCastSpellOnTarget(6253, Unit:GetMainTank()) 
end

function SouthseaBrigand_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SouthseaBrigand_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3381, 1, "SouthseaBrigand_OnCombat")
RegisterUnitEvent(3381, 2, "SouthseaBrigand_OnLeaveCombat")
RegisterUnitEvent(3381, 4, "SouthseaBrigand_OnDied")

-- Southsea Cannoneer
function SouthseaCannoneer_OnCombat(Unit, Event)
	Unit:RegisterEvent("SouthseaCannoneer_Shoot", 6000, 0)
end

function SouthseaCannoneer_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function SouthseaCannoneer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SouthseaCannoneer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3382, 1, "SouthseaCannoneer_OnCombat")
RegisterUnitEvent(3382, 2, "SouthseaCannoneer_OnLeaveCombat")
RegisterUnitEvent(3382, 4, "SouthseaCannoneer_OnDied")

-- Southsea Privateer
function SouthseaPrivateer_OnCombat(Unit, Event)
	Unit:RegisterEvent("SouthseaPrivateer_FireShot", 9000, 0)
	Unit:RegisterEvent("SouthseaPrivateer_Shoot", 6000, 0)
end

function SouthseaPrivateer_FireShot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6979, Unit:GetMainTank()) 
end

function SouthseaPrivateer_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function SouthseaPrivateer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SouthseaPrivateer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3384, 1, "SouthseaPrivateer_OnCombat")
RegisterUnitEvent(3384, 2, "SouthseaPrivateer_OnLeaveCombat")
RegisterUnitEvent(3384, 4, "SouthseaPrivateer_OnDied")

-- Stormsnout
function Stormsnout_OnCombat(Unit, Event)
	Unit:RegisterEvent("Stormsnout_LizardBolt", 6000, 0)
end

function Stormsnout_LizardBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(5401, Unit:GetMainTank()) 
end

function Stormsnout_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Stormsnout_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3240, 1, "Stormsnout_OnCombat")
RegisterUnitEvent(3240, 2, "Stormsnout_OnLeaveCombat")
RegisterUnitEvent(3240, 4, "Stormsnout_OnDied")

-- Summoned Felhunter
function SummonedFelhunter_OnCombat(Unit, Event)
	Unit:RegisterEvent("SummonedFelhunter_ManaBurn", 6000, 0)
end

function SummonedFelhunter_ManaBurn(Unit, Event) 
	Unit:FullCastSpellOnTarget(2691, Unit:GetRandomPlayer(4)) 
end

function SummonedFelhunter_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SummonedFelhunter_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6268, 1, "SummonedFelhunter_OnCombat")
RegisterUnitEvent(6268, 2, "SummonedFelhunter_OnLeaveCombat")
RegisterUnitEvent(6268, 4, "SummonedFelhunter_OnDied")

-- Sunscale Lashtail
function SunscaleLashtail_OnCombat(Unit, Event)
	Unit:RegisterEvent("SunscaleLashtail_Lash", 6000, 0)
end

function SunscaleLashtail_Lash(Unit, Event) 
	Unit:FullCastSpellOnTarget(6607, Unit:GetMainTank()) 
end

function SunscaleLashtail_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SunscaleLashtail_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3254, 1, "SunscaleLashtail_OnCombat")
RegisterUnitEvent(3254, 2, "SunscaleLashtail_OnLeaveCombat")
RegisterUnitEvent(3254, 4, "SunscaleLashtail_OnDied")

-- Sunscale Scytheclaw
function SunscaleScytheclaw_OnCombat(Unit, Event)
	Unit:RegisterEvent("SunscaleScytheclaw_Thrash", 6000, 0)
end

function SunscaleScytheclaw_Thrash(Unit, Event) 
	Unit:FullCastSpellOnTarget(3391, Unit:GetMainTank()) 
end

function SunscaleScytheclaw_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SunscaleScytheclaw_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3256, 1, "SunscaleScytheclaw_OnCombat")
RegisterUnitEvent(3256, 2, "SunscaleScytheclaw_OnLeaveCombat")
RegisterUnitEvent(3256, 4, "SunscaleScytheclaw_OnDied")

-- Swinegart Spearhide
function SwinegartSpearhide_OnCombat(Unit, Event)
	Unit:RegisterEvent("SwinegartSpearhide_PierceArmor", 10000, 0)
end

function SwinegartSpearhide_PierceArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(6016, Unit:GetMainTank()) 
end

function SwinegartSpearhide_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SwinegartSpearhide_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5864, 1, "SwinegartSpearhide_OnCombat")
RegisterUnitEvent(5864, 2, "SwinegartSpearhide_OnLeaveCombat")
RegisterUnitEvent(5864, 4, "SwinegartSpearhide_OnDied")

-- Theramore Marine
function TheramoreMarine_OnCombat(Unit, Event)
	Unit:RegisterEvent("TheramoreMarine_DefensiveStance", 2000, 1)
	Unit:RegisterEvent("TheramoreMarine_Disarm", 6000, 0)
	Unit:RegisterEvent("TheramoreMarine_ShieldBash", 8000, 0)
end

function TheramoreMarine_DefensiveStance(Unit, Event) 
	Unit:CastSpell(7164) 
end

function TheramoreMarine_Disarm(Unit, Event) 
	Unit:FullCastSpellOnTarget(6713, Unit:GetMainTank()) 
end

function TheramoreMarine_ShieldBash(Unit, Event) 
	Unit:FullCastSpellOnTarget(72, Unit:GetMainTank()) 
end

function TheramoreMarine_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TheramoreMarine_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3385, 1, "TheramoreMarine_OnCombat")
RegisterUnitEvent(3385, 2, "TheramoreMarine_OnLeaveCombat")
RegisterUnitEvent(3385, 4, "TheramoreMarine_OnDied")

-- Theramore Preserver
function TheramorePreserver_OnCombat(Unit, Event)
	Unit:RegisterEvent("TheramorePreserver_Smite", 8000, 0)
	Unit:RegisterEvent("TheramorePreserver_LesserHeal", 12000, 0)
	Unit:RegisterEvent("TheramorePreserver_Renew", 5000, 1)
end

function TheramorePreserver_Smite(Unit, Event) 
	Unit:FullCastSpellOnTarget(9734, Unit:GetMainTank()) 
end

function TheramorePreserver_LesserHeal(Unit, Event) 
	Unit:CastSpell(2052) 
end

function TheramorePreserver_Renew(Unit, Event) 
	Unit:CastSpell(6074) 
end

function TheramorePreserver_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TheramorePreserver_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3386, 1, "TheramorePreserver_OnCombat")
RegisterUnitEvent(3386, 2, "TheramorePreserver_OnLeaveCombat")
RegisterUnitEvent(3386, 4, "TheramorePreserver_OnDied")

-- Thunderhawk Cloudscraper
function ThunderhawkCloudscraper_OnCombat(Unit, Event)
	Unit:RegisterEvent("ThunderhawkCloudscraper_ThunderClap", 10000, 0)
end

function ThunderhawkCloudscraper_ThunderClap(Unit, Event) 
	Unit:CastSpell(8078) 
end

function ThunderhawkCloudscraper_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ThunderhawkCloudscraper_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3424, 1, "ThunderhawkCloudscraper_OnCombat")
RegisterUnitEvent(3424, 2, "ThunderhawkCloudscraper_OnLeaveCombat")
RegisterUnitEvent(3424, 4, "ThunderhawkCloudscraper_OnDied")

-- Thunderhawk Hatchling
function ThunderhawkHatchling_OnCombat(Unit, Event)
	Unit:RegisterEvent("ThunderhawkHatchling_LightningShield", 4000, 0)
	Unit:RegisterEvent("ThunderhawkHatchling_LightningBolt", 8000, 0)
end

function ThunderhawkHatchling_LightningBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9532, Unit:GetMainTank()) 
end

function ThunderhawkHatchling_LightningShield(Unit, Event) 
	Unit:CastSpell(325) 
end

function ThunderhawkHatchling_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ThunderhawkHatchling_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3247, 1, "ThunderhawkHatchling_OnCombat")
RegisterUnitEvent(3247, 2, "ThunderhawkHatchling_OnLeaveCombat")
RegisterUnitEvent(3247, 4, "ThunderhawkHatchling_OnDied")

-- Venture Co. Enforcer
function VentureCoEnforcer_OnCombat(Unit, Event)
	Unit:RegisterEvent("VentureCoEnforcer_BattleShout", 2000, 1)
	Unit:RegisterEvent("VentureCoEnforcer_Disarm", 10000, 0)
end

function VentureCoEnforcer_BattleShout(Unit, Event) 
	Unit:CastSpell(9128) 
end

function VentureCoEnforcer_Disarm(Unit, Event) 
	Unit:FullCastSpellOnTarget(6713, Unit:GetMainTank()) 
end

function VentureCoEnforcer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function VentureCoEnforcer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3283, 1, "VentureCoEnforcer_OnCombat")
RegisterUnitEvent(3283, 2, "VentureCoEnforcer_OnLeaveCombat")
RegisterUnitEvent(3283, 4, "VentureCoEnforcer_OnDied")

-- Venture Co. Mercenary
function VentureCoMercenary_OnCombat(Unit, Event)
	Unit:RegisterEvent("VentureCoMercenary_Shoot", 6000, 0)
end

function VentureCoMercenary_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function VentureCoMercenary_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function VentureCoMercenary_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3382, 1, "VentureCoMercenary_OnCombat")
RegisterUnitEvent(3382, 2, "VentureCoMercenary_OnLeaveCombat")
RegisterUnitEvent(3382, 4, "VentureCoMercenary_OnDied")

-- Witchwing Ambusher
function WitchwingAmbusher_OnCombat(Unit, Event)
	Unit:RegisterEvent("WitchwingAmbusher_ExploitWeakness", 5000, 0)
end

function WitchwingAmbusher_ExploitWeakness(Unit, Event) 
	Unit:FullCastSpellOnTarget(6595, Unit:GetMainTank()) 
end

function WitchwingAmbusher_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WitchwingAmbusher_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3279, 1, "WitchwingAmbusher_OnCombat")
RegisterUnitEvent(3279, 2, "WitchwingAmbusher_OnLeaveCombat")
RegisterUnitEvent(3279, 4, "WitchwingAmbusher_OnDied")

-- Witchwing Harpy
function WitchwingHarpy_OnCombat(Unit, Event)
	Unit:RegisterEvent("WitchwingHarpy_CurseofMending", 4000, 1)
end

function WitchwingHarpy_CurseofMending(Unit, Event) 
	Unit:FullCastSpellOnTarget(7098, Unit:GetMainTank()) 
end

function WitchwingHarpy_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WitchwingHarpy_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3276, 1, "WitchwingHarpy_OnCombat")
RegisterUnitEvent(3276, 2, "WitchwingHarpy_OnLeaveCombat")
RegisterUnitEvent(3276, 4, "WitchwingHarpy_OnDied")

-- Witchwing Roguefeather
function WitchwingRoguefeather_OnCombat(Unit, Event)
	Unit:RegisterEvent("WitchwingRoguefeather_ExploitWeakness", 60000, 0)
	Unit:RegisterEvent("WitchwingRoguefeather_SlowingPoison", 10000, 0)
end

function WitchwingRoguefeather_ExploitWeakness(Unit, Event) 
	Unit:FullCastSpellOnTarget(6595, Unit:GetMainTank()) 
end

function WitchwingRoguefeather_SlowingPoison(Unit, Event) 
	Unit:FullCastSpellOnTarget(7992, Unit:GetMainTank()) 
end

function WitchwingRoguefeather_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WitchwingRoguefeather_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3277, 1, "WitchwingRoguefeather_OnCombat")
RegisterUnitEvent(3277, 2, "WitchwingRoguefeather_OnLeaveCombat")
RegisterUnitEvent(3277, 4, "WitchwingRoguefeather_OnDied")

-- Withwing Slayer
function WitchwingSlayer_OnCombat(Unit, Event)
	Unit:RegisterEvent("WitchwingSlayer_DemoralizingShout", 3000, 1)
end

function WitchwingSlayer_DemoralizingShout(Unit, Event) 
	Unit:CastSpell(13730) 
end

function WitchwingSlayer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WitchwingSlayer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3278, 1, "WitchwingSlayer_OnCombat")
RegisterUnitEvent(3278, 2, "WitchwingSlayer_OnLeaveCombat")
RegisterUnitEvent(3278, 4, "WitchwingSlayer_OnDied")

-- Witchwing Windcaller
function WitchwingWindcaller_OnCombat(Unit, Event)
	Unit:RegisterEvent("WitchwingWindcaller_EnvelopingWinds", 10000, 0)
end

function WitchwingWindcaller_EnvelopingWinds(Unit, Event) 
	Unit:FullCastSpellOnTarget(6728, Unit:GetMainTank()) 
end

function WitchwingWindcaller_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WitchwingWindcaller_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3280, 1, "WitchwingWindcaller_OnCombat")
RegisterUnitEvent(3280, 2, "WitchwingWindcaller_OnLeaveCombat")
RegisterUnitEvent(3280, 4, "WitchwingWindcaller_OnDied")