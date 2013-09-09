--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function TwilightKeeperHavunth_OnCombat(Unit, Event)
	Unit:RegisterEvent("TwilightKeeperHavunth_FireBlast", 6000, 0)
	Unit:RegisterEvent("TwilightKeeperHavunth_FireNova", 8000, 0)
end

function TwilightKeeperHavunth_FireBlast(Unit, Event) 
	Unit:FullCastSpellOnTarget(13339, Unit:GetMainTank()) 
end

function TwilightKeeperHavunth_FireNova(Unit, Event) 
	Unit:CastSpell(17366) 
end

function TwilightKeeperHavunth_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TwilightKeeperHavunth_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11804, 1, "TwilightKeeperHavunth_OnCombat")
RegisterUnitEvent(11804, 2, "TwilightKeeperHavunth_OnLeaveCombat")
RegisterUnitEvent(11804, 4, "TwilightKeeperHavunth_OnDied")

function TwilightKeeperMayna_OnCombat(Unit, Event)
	Unit:RegisterEvent("TwilightKeeperMayna_ShadowWordPain", 2000, 2)
	Unit:RegisterEvent("TwilightKeeperMayna_MindFlay", 6000, 0)
	Unit:RegisterEvent("TwilightKeeperMayna_PsychicScream", 10000, 0)
end

function TwilightKeeperMayna_ShadowWordPain(Unit, Event) 
	Unit:FullCastSpellOnTarget(15654, Unit:GetMainTank()) 
end

function TwilightKeeperMayna_MindFlay(Unit, Event) 
	Unit:FullCastSpellOnTarget(17165, Unit:GetMainTank()) 
end

function TwilightKeeperMayna_PsychicScream(Unit, Event) 
	Unit:FullCastSpellOnTarget(22884, Unit:GetMainTank()) 
end

function TwilightKeeperMayna_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TwilightKeeperMayna_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(15200, 1, "TwilightKeeperMayna_OnCombat")
RegisterUnitEvent(15200, 2, "TwilightKeeperMayna_OnLeaveCombat")
RegisterUnitEvent(15200, 4, "TwilightKeeperMayna_OnDied")

function TwilightLordEverun_OnCombat(Unit, Event)
	Unit:RegisterEvent("TwilightLordEverun_Fireball", 8000, 0)
	Unit:RegisterEvent("TwilightLordEverun_ShadowShock", 6000, 0)
end

function TwilightLordEverun_Fireball(Unit, Event) 
	Unit:FullCastSpellOnTarget(19816, Unit:GetMainTank()) 
end

function TwilightLordEverun_ShadowShock(Unit, Event) 
	Unit:FullCastSpellOnTarget(17439, Unit:GetMainTank()) 
end

function TwilightLordEverun_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TwilightLordEverun_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14479, 1, "TwilightLordEverun_OnCombat")
RegisterUnitEvent(14479, 2, "TwilightLordEverun_OnLeaveCombat")
RegisterUnitEvent(14479, 4, "TwilightLordEverun_OnDied")

function TwilightMarauderMorna_OnCombat(Unit, Event)
	Unit:RegisterEvent("TwilightMarauderMorna_MortalStrike", 6000, 0)
	Unit:RegisterEvent("TwilightMarauderMorna_PiercingHowl", 10000, 0)
	Unit:RegisterEvent("TwilightMarauderMorna_SunderArmor", 4000, 0)
end

function TwilightMarauderMorna_MortalStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(16856, Unit:GetMainTank()) 
end

function TwilightMarauderMorna_PiercingHowl(Unit, Event) 
	Unit:CastSpell(23600) 
end

function TwilightMarauderMorna_SunderArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(15572, Unit:GetMainTank()) 
end

function TwilightMarauderMorna_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TwilightMarauderMorna_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(15541, 1, "TwilightMarauderMorna_OnCombat")
RegisterUnitEvent(15541, 2, "TwilightMarauderMorna_OnLeaveCombat")
RegisterUnitEvent(15541, 4, "TwilightMarauderMorna_OnDied")

function VyraltheVile_OnCombat(Unit, Event)
	Unit:RegisterEvent("VyraltheVile_Fireball", 8000, 0)
	Unit:RegisterEvent("VyraltheVile_ShadowShock", 6000, 0)
end

function VyraltheVile_Fireball(Unit, Event) 
	Unit:FullCastSpellOnTarget(19816, Unit:GetMainTank()) 
end

function VyraltheVile_ShadowShock(Unit, Event) 
	Unit:FullCastSpellOnTarget(17439, Unit:GetMainTank()) 
end

function VyraltheVile_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function VyraltheVile_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(15202, 1, "VyraltheVile_OnCombat")
RegisterUnitEvent(15202, 2, "VyraltheVile_OnLeaveCombat")
RegisterUnitEvent(15202, 4, "VyraltheVile_OnDied")

function Xilxix_OnCombat(Unit, Event)
	Unit:RegisterEvent("Xilxix_BerserkerCharge", 6000, 0)
end

function Xilxix_BerserkerCharge(Unit, Event) 
	Unit:FullCastSpellOnTarget(19471, Unit:GetRandomPlayer(0)) 
end

function Xilxix_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Xilxix_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(15286, 1, "Xilxix_OnCombat")
RegisterUnitEvent(15286, 2, "Xilxix_OnLeaveCombat")
RegisterUnitEvent(15286, 4, "Xilxix_OnDied")

function Zora_OnCombat(Unit, Event)
	Unit:RegisterEvent("Zora_PoisonBolt", 8000, 0)
end

function Zora_PoisonBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(21067, Unit:GetMainTank()) 
end

function Zora_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Zora_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14474, 1, "Zora_OnCombat")
RegisterUnitEvent(14474, 2, "Zora_OnLeaveCombat")
RegisterUnitEvent(14474, 4, "Zora_OnDied")

function Aluntir_OnCombat(Unit, Event)
	Unit:RegisterEvent("Aluntir_BerserkerCharge", 6000, 0)
end

function Aluntir_BerserkerCharge(Unit, Event) 
	Unit:FullCastSpellOnTarget(19471, Unit:GetRandomPlayer(0)) 
end

function Aluntir_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Aluntir_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(15288, 1, "Aluntir_OnCombat")
RegisterUnitEvent(15288, 2, "Aluntir_OnLeaveCombat")
RegisterUnitEvent(15288, 4, "Aluntir_OnDied")

function Arakis_OnCombat(Unit, Event)
	Unit:RegisterEvent("Arakis_BerserkerCharge", 6000, 0)
end

function Arakis_BerserkerCharge(Unit, Event) 
	Unit:FullCastSpellOnTarget(19471, Unit:GetRandomPlayer(0)) 
end

function Arakis_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Arakis_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(15290, 1, "Arakis_OnCombat")
RegisterUnitEvent(15290, 2, "Arakis_OnLeaveCombat")
RegisterUnitEvent(15290, 4, "Arakis_OnDied")

function ArcanistNozzlespring_OnCombat(Unit, Event)
	Unit:RegisterEvent("ArcanistNozzlespring_ArcaneMissiles", 8000, 0)
	Unit:RegisterEvent("ArcanistNozzlespring_Fireball", 12000, 0)
end

function ArcanistNozzlespring_ArcaneMissiles(Unit, Event) 
	Unit:FullCastSpellOnTarget(15791, Unit:GetRandomPlayer(0)) 
end

function ArcanistNozzlespring_Fireball(Unit, Event) 
	Unit:FullCastSpellOnTarget(13375, Unit:GetMainTank()) 
end

function ArcanistNozzlespring_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ArcanistNozzlespring_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(15444, 1, "ArcanistNozzlespring_OnCombat")
RegisterUnitEvent(15444, 2, "ArcanistNozzlespring_OnLeaveCombat")
RegisterUnitEvent(15444, 4, "ArcanistNozzlespring_OnDied")

function Deathclasp_OnCombat(Unit, Event)
	Unit:RegisterEvent("Deathclasp_KnockAway", 6000, 0)
	Unit:RegisterEvent("Deathclasp_ParalyzingPoison", 12000, 0)
end

function Deathclasp_KnockAway(Unit, Event) 
	Unit:FullCastSpellOnTarget(18670, Unit:GetMainTank()) 
end

function Deathclasp_ParalyzingPoison(Unit, Event) 
	Unit:FullCastSpellOnTarget(3609, Unit:GetRandomPlayer(0)) 
end

function Deathclasp_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Deathclasp_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(15196, 1, "Deathclasp_OnCombat")
RegisterUnitEvent(15196, 2, "Deathclasp_OnLeaveCombat")
RegisterUnitEvent(15196, 4, "Deathclasp_OnDied")

function EmissaryRomankhan_OnCombat(Unit, Event)
	Unit:RegisterEvent("EmissaryRomankhan_Wilt", 15000, 0)
end

function EmissaryRomankhan_Wilt(Unit, Event) 
	Unit:CastSpell(23772) 
end

function EmissaryRomankhan_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function EmissaryRomankhan_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14862, 1, "EmissaryRomankhan_OnCombat")
RegisterUnitEvent(14862, 2, "EmissaryRomankhan_OnLeaveCombat")
RegisterUnitEvent(14862, 4, "EmissaryRomankhan_OnDied")

function Grubthor_OnCombat(Unit, Event)
	Unit:RegisterEvent("Grubthor_Tramble", 6000, 0)
end

function Grubthor_Tramble(Unit, Event) 
	Unit:CastSpell(5568) 
end

function Grubthor_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Grubthor_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14477, 1, "Grubthor_OnCombat")
RegisterUnitEvent(14477, 2, "Grubthor_OnLeaveCombat")
RegisterUnitEvent(14477, 4, "Grubthor_OnDied")

function Huricanian_OnCombat(Unit, Event)
	Unit:RegisterEvent("Huricanian_ChainLightning", 8000, 0)
end

function Huricanian_ChainLightning(Unit, Event) 
	Unit:FullCastSpellOnTarget(15659, Unit:GetRandomPlayer(0)) 
end

function Huricanian_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Huricanian_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14478, 1, "Huricanian_OnCombat")
RegisterUnitEvent(14478, 2, "Huricanian_OnLeaveCombat")
RegisterUnitEvent(14478, 4, "Huricanian_OnDied")

function JanelaStouthammer_OnCombat(Unit, Event)
	Unit:RegisterEvent("JanelaStouthammer_CrusaderStrike", 8000, 0)
	Unit:RegisterEvent("JanelaStouthammer_HolyLight", 12000, 0)
end

function JanelaStouthammer_CrusaderStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(14518, Unit:GetMainTank()) 
end

function JanelaStouthammer_HolyLight(Unit, Event) 
	Unit:CastSpell(25263) 
end

function JanelaStouthammer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function JanelaStouthammer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(15443, 1, "JanelaStouthammer_OnCombat")
RegisterUnitEvent(15443, 2, "JanelaStouthammer_OnLeaveCombat")
RegisterUnitEvent(15443, 4, "JanelaStouthammer_OnDied")

function Krellack_OnCombat(Unit, Event)
	Unit:RegisterEvent("Krellack_FatalSting", 8000, 0)
end

function Krellack_FatalSting(Unit, Event) 
	Unit:FullCastSpellOnTarget(17170, Unit:GetMainTank()) 
end

function Krellack_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Krellack_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14476, 1, "Krellack_OnCombat")
RegisterUnitEvent(14476, 2, "Krellack_OnLeaveCombat")
RegisterUnitEvent(14476, 4, "Krellack_OnDied")

function Lapress_OnCombat(Unit, Event)
	Unit:RegisterEvent("Lapress_Rend", 8000, 0)
end

function Lapress_Rend(Unit, Event) 
	Unit:FullCastSpellOnTarget(13455, Unit:GetMainTank()) 
end

function Lapress_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Lapress_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14473, 1, "Lapress_OnCombat")
RegisterUnitEvent(14473, 2, "Lapress_OnLeaveCombat")
RegisterUnitEvent(14473, 4, "Lapress_OnDied")

function MistressNataliaMaralith_OnCombat(Unit, Event)
	Unit:RegisterEvent("MistressNataliaMaralith_Blackout", 9000, 0)
	Unit:RegisterEvent("MistressNataliaMaralith_GreaterHeal", 15000, 0)
	Unit:RegisterEvent("MistressNataliaMaralith_MindFlay", 7000, 0)
	Unit:RegisterEvent("MistressNataliaMaralith_PsychicScream", 16000, 0)
	Unit:RegisterEvent("MistressNataliaMaralith_ShadowWordPain", 2000, 2)
end

function MistressNataliaMaralith_Blackout(Unit, Event) 
	Unit:FullCastSpellOnTarget(44415, Unit:GetMainTank()) 
end

function MistressNataliaMaralith_GreaterHeal(Unit, Event) 
	Unit:CastSpell(35096) 
end

function MistressNataliaMaralith_MindFlay(Unit, Event) 
	Unit:FullCastSpellOnTarget(16568, Unit:GetRandomPlayer(0)) 
end

function MistressNataliaMaralith_PsychicScream(Unit, Event) 
	Unit:FullCastSpellOnTarget(13704, Unit:GetRandomPlayer(0)) 
end

function MistressNataliaMaralith_ShadowWordPain(Unit, Event) 
	Unit:FullCastSpellOnTarget(11639, Unit:GetMainTank()) 
end

function MistressNataliaMaralith_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MistressNataliaMaralith_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(15215, 1, "MistressNataliaMaralith_OnCombat")
RegisterUnitEvent(15215, 2, "MistressNataliaMaralith_OnLeaveCombat")
RegisterUnitEvent(15215, 4, "MistressNataliaMaralith_OnDied")

function RexAshil_OnCombat(Unit, Event)
	Unit:RegisterEvent("RexAshil_PierceArmor", 8000, 0)
end

function RexAshil_PierceArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(12097, Unit:GetMainTank()) 
end

function RexAshil_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RexAshil_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14475, 1, "RexAshil_OnCombat")
RegisterUnitEvent(14475, 2, "RexAshil_OnLeaveCombat")
RegisterUnitEvent(14475, 4, "RexAshil_OnDied")

function Setis_OnCombat(Unit, Event)
	Unit:RegisterEvent("Setis_CrowdPummel", 8000, 0)
	Unit:RegisterEvent("Setis_WarStomp", 10000, 0)
end

function Setis_CrowdPummel(Unit, Event) 
	Unit:CastSpell(10887) 
end

function Setis_WarStomp(Unit, Event) 
	Unit:CastSpell(16727) 
end

function Setis_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Setis_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14471, 1, "Setis_OnCombat")
RegisterUnitEvent(14471, 2, "Setis_OnLeaveCombat")
RegisterUnitEvent(14471, 4, "Setis_OnDied")

function TheDukeofCynders_OnCombat(Unit, Event)
	Unit:RegisterEvent("TheDukeofCynders_BlastWave", 8000, 0)
	Unit:RegisterEvent("TheDukeofCynders_FireBlast", 6000, 0)
	Unit:RegisterEvent("TheDukeofCynders_Flamestrike", 2000, 2)
end

function TheDukeofCynders_BlastWave(Unit, Event) 
	Unit:CastSpell(22424) 
end

function TheDukeofCynders_FireBlast(Unit, Event) 
	Unit:FullCastSpellOnTarget(25028, Unit:GetMainTank()) 
end

function TheDukeofCynders_Flamestrike(Unit, Event) 
	Unit:CastSpell(18399) 
end

function TheDukeofCynders_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TheDukeofCynders_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(15206, 1, "TheDukeofCynders_OnCombat")
RegisterUnitEvent(15206, 2, "TheDukeofCynders_OnLeaveCombat")
RegisterUnitEvent(15206, 4, "TheDukeofCynders_OnDied")

function TheDukeofFathoms_OnCombat(Unit, Event)
	Unit:RegisterEvent("TheDukeofFathoms_KnockAway", 6000, 0)
	Unit:RegisterEvent("TheDukeofFathoms_Knockdown", 8000, 0)
	Unit:RegisterEvent("TheDukeofFathoms_Thrash", 5000, 0)
end

function TheDukeofFathoms_KnockAway(Unit, Event) 
	Unit:FullCastSpellOnTarget(18670, Unit:GetMainTank()) 
end

function TheDukeofFathoms_Knockdown(Unit, Event) 
	Unit:FullCastSpellOnTarget(16790, Unit:GetMainTank()) 
end

function TheDukeofFathoms_Thrash(Unit, Event) 
	Unit:FullCastSpellOnTarget(3391, Unit:GetMainTank()) 
end

function TheDukeofFathoms_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TheDukeofFathoms_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(15207, 1, "TheDukeofFathoms_OnCombat")
RegisterUnitEvent(15207, 2, "TheDukeofFathoms_OnLeaveCombat")
RegisterUnitEvent(15207, 4, "TheDukeofFathoms_OnDied")

function TheDukeofShards_OnCombat(Unit, Event)
	Unit:RegisterEvent("TheDukeofShards_GroundTremor", 8000, 0)
	Unit:RegisterEvent("TheDukeofShards_Strike", 5000, 0)
	Unit:RegisterEvent("TheDukeofShards_Thunderclap", 11000, 0)
end

function TheDukeofShards_GroundTremor(Unit, Event) 
	Unit:CastSpell(6524) 
end

function TheDukeofShards_Strike(Unit, Event) 
	Unit:FullCastSpellOnTarget(13446, Unit:GetMainTank()) 
end

function TheDukeofShards_Thunderclap(Unit, Event) 
	Unit:CastSpell(8078) 
end

function TheDukeofShards_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TheDukeofShards_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(15208, 1, "TheDukeofShards_OnCombat")
RegisterUnitEvent(15208, 2, "TheDukeofShards_OnLeaveCombat")
RegisterUnitEvent(15208, 4, "TheDukeofShards_OnDied")

function TheDukeofZephyrs_OnCombat(Unit, Event)
	Unit:RegisterEvent("TheDukeofZephyrs_ForkedLightning", 6000, 0)
	Unit:RegisterEvent("TheDukeofZephyrs_LightningCloud", 8000, 0)
	Unit:RegisterEvent("TheDukeofZephyrs_WingFlap", 12000, 0)
end

function TheDukeofZephyrs_ForkedLightning(Unit, Event) 
	Unit:CastSpell(25034) 
end

function TheDukeofZephyrs_LightningCloud(Unit, Event) 
	Unit:CastSpell(44417) 
end

function TheDukeofZephyrs_WingFlap(Unit, Event) 
	Unit:FullCastSpellOnTarget(12882, Unit:GetMainTank()) 
end

function TheDukeofZephyrs_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TheDukeofZephyrs_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(15220, 1, "TheDukeofZephyrs_OnCombat")
RegisterUnitEvent(15220, 2, "TheDukeofZephyrs_OnLeaveCombat")
RegisterUnitEvent(15220, 4, "TheDukeofZephyrs_OnDied")

function TheWindreaver_OnCombat(Unit, Event)
	Unit:RegisterEvent("TheWindreaver_ChainLightning", 8000, 0)
	Unit:RegisterEvent("TheWindreaver_EnvelopingWinds", 12000, 0)
	Unit:RegisterEvent("TheWindreaver_LightningCloud", 6000, 0)
	Unit:RegisterEvent("TheWindreaver_Shock", 4000, 0)
end

function TheWindreaver_ChainLightning(Unit, Event) 
	Unit:FullCastSpellOnTarget(23106, Unit:GetMainTank()) 
end

function TheWindreaver_EnvelopingWinds(Unit, Event) 
	Unit:FullCastSpellOnTarget(23103, Unit:GetRandomPlayer(0)) 
end

function TheWindreaver_LightningCloud(Unit, Event) 
	Unit:CastSpell(23105) 
end

function TheWindreaver_Shock(Unit, Event) 
	Unit:FullCastSpellOnTarget(23104, Unit:GetMainTank()) 
end

function TheWindreaver_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TheWindreaver_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14454, 1, "TheWindreaver_OnCombat")
RegisterUnitEvent(14454, 2, "TheWindreaver_OnLeaveCombat")
RegisterUnitEvent(14454, 4, "TheWindreaver_OnDied")

function TwilightKeeperExeter_OnCombat(Unit, Event)
	Unit:RegisterEvent("TwilightKeeperExeter_ConcussionBlow", 10000, 0)
	Unit:RegisterEvent("TwilightKeeperExeter_MortalStrike", 8000, 0)
end

function TwilightKeeperExeter_ConcussionBlow(Unit, Event) 
	Unit:FullCastSpellOnTarget(22427, Unit:GetMainTank()) 
end

function TwilightKeeperExeter_MortalStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(16856, Unit:GetMainTank()) 
end

function TwilightKeeperExeter_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TwilightKeeperExeter_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11803, 1, "TwilightKeeperExeter_OnCombat")
RegisterUnitEvent(11803, 2, "TwilightKeeperExeter_OnLeaveCombat")
RegisterUnitEvent(11803, 4, "TwilightKeeperExeter_OnDied")

--Azure Templar
function AzureTemplar_OnCombat(Unit, Event)
	Unit:RegisterEvent("AzureTemplar_FrostNova", 8000, 0)
	Unit:RegisterEvent("AzureTemplar_FrostShock", 6000, 0)
end

function AzureTemplar_FrostNova(Unit, Event) 
	Unit:CastSpell(14907) 
end

function AzureTemplar_FrostShock(Unit, Event) 
	Unit:FullCastSpellOnTarget(12548, Unit:GetMainTank()) 
end

function AzureTemplar_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AzureTemplar_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(15211, 1, "AzureTemplar_OnCombat")
RegisterUnitEvent(15211, 2, "AzureTemplar_OnLeaveCombat")
RegisterUnitEvent(15211, 4, "AzureTemplar_OnDied")

--Crimson Templar
function CrimsonTemplar_OnCombat(Unit, Event)
	Unit:RegisterEvent("CrimsonTemplar_FireballVolley", 10000, 0)
	Unit:RegisterEvent("CrimsonTemplar_FlameBuffet", 8000, 0)
end

function CrimsonTemplar_FireballVolley(Unit, Event) 
	Unit:CastSpell(11989) 
end

function CrimsonTemplar_FlameBuffet(Unit, Event) 
	Unit:FullCastSpellOnTarget(16536, Unit:GetMainTank()) 
end

function CrimsonTemplar_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CrimsonTemplar_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(15209, 1, "CrimsonTemplar_OnCombat")
RegisterUnitEvent(15209, 2, "CrimsonTemplar_OnLeaveCombat")
RegisterUnitEvent(15209, 4, "CrimsonTemplar_OnDied")

--Cyclone Warrior
function CycloneWarrior_OnCombat(Unit, Event)
	Unit:RegisterEvent("CycloneWarrior_Shock", 6000, 0)
end

function CycloneWarrior_Shock(Unit, Event) 
	Unit:FullCastSpellOnTarget(12553, Unit:GetMainTank()) 
end

function CycloneWarrior_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CycloneWarrior_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11745, 1, "CycloneWarrior_OnCombat")
RegisterUnitEvent(11745, 2, "CycloneWarrior_OnLeaveCombat")
RegisterUnitEvent(11745, 4, "CycloneWarrior_OnDied")

--Desert Rager
function DesertRager_OnCombat(Unit, Event)
	Unit:RegisterEvent("DesertRager_EarthShock", 8000, 0)
	Unit:RegisterEvent("DesertRager_Enrage", 12000, 1)
end

function DesertRager_EarthShock(Unit, Event) 
	Unit:FullCastSpellOnTarget(13728, Unit:GetMainTank()) 
end

function DesertRager_Enrage(Unit, Event) 
	Unit:CastSpell(8599) 
end

function DesertRager_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DesertRager_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11747, 1, "DesertRager_OnCombat")
RegisterUnitEvent(11747, 2, "DesertRager_OnLeaveCombat")
RegisterUnitEvent(11747, 4, "DesertRager_OnDied")

--Desert Rumbler
function DesertRumbler_OnCombat(Unit, Event)
	Unit:RegisterEvent("DesertRumbler_Trample", 6000, 0)
end

function DesertRumbler_Trample(Unit, Event) 
	Unit:CastSpell(5568) 
end

function DesertRumbler_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DesertRumbler_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11746, 1, "DesertRumbler_OnCombat")
RegisterUnitEvent(11746, 2, "DesertRumbler_OnLeaveCombat")
RegisterUnitEvent(11746, 4, "DesertRumbler_OnDied")

--Dredge Crusher
function DredgeCrusher_OnCombat(Unit, Event)
	Unit:RegisterEvent("DredgeCrusher_Lash", 8000, 0)
end

function DredgeCrusher_Lash(Unit, Event) 
	Unit:FullCastSpellOnTarget(6607, Unit:GetMainTank()) 
end

function DredgeCrusher_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DredgeCrusher_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11741, 1, "DredgeCrusher_OnCombat")
RegisterUnitEvent(11741, 2, "DredgeCrusher_OnLeaveCombat")
RegisterUnitEvent(11741, 4, "DredgeCrusher_OnDied")

--Dredge Striker
function DredgeStriker_OnCombat(Unit, Event)
	Unit:RegisterEvent("DredgeStriker_Charge", 8000, 0)
end

function DredgeStriker_Charge(Unit, Event) 
	Unit:FullCastSpellOnTarget(22911, Unit:GetRandomPlayer(0)) 
end

function DredgeStriker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DredgeStriker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11740, 1, "DredgeStriker_OnCombat")
RegisterUnitEvent(11740, 2, "DredgeStriker_OnLeaveCombat")
RegisterUnitEvent(11740, 4, "DredgeStriker_OnDied")

--Dust Stormer
function DustStormer_OnCombat(Unit, Event)
	Unit:RegisterEvent("DustStormer_LightningShield", 6000, 0)
	Unit:RegisterEvent("DustStormer_LightningCloud", 10000, 0)
end

function DustStormer_LightningShield(Unit, Event) 
	Unit:CastSpell(19514) 
end

function DustStormer_LightningCloud(Unit, Event) 
	Unit:CastSpell(19513) 
end

function DustStormer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DustStormer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11744, 1, "DustStormer_OnCombat")
RegisterUnitEvent(11744, 2, "DustStormer_OnLeaveCombat")
RegisterUnitEvent(11744, 4, "DustStormer_OnDied")

--Earthen Templar
function EarthenTemplar_OnCombat(Unit, Event)
	Unit:RegisterEvent("EarthenTemplar_KnockAway", 6000, 0)
	Unit:RegisterEvent("EarthenTemplar_EntanglingRoots", 8000, 0)
end

function EarthenTemplar_KnockAway(Unit, Event) 
	Unit:FullCastSpellOnTarget(18813, Unit:GetMainTank()) 
end

function EarthenTemplar_EntanglingRoots(Unit, Event) 
	Unit:FullCastSpellOnTarget(22127, Unit:GetRandomPlayer(0)) 
end

function EarthenTemplar_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function EarthenTemplar_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(15307, 1, "EarthenTemplar_OnCombat")
RegisterUnitEvent(15307, 2, "EarthenTemplar_OnLeaveCombat")
RegisterUnitEvent(15307, 4, "EarthenTemplar_OnDied")

--Glacial Lieutenant
function GlacialLieutenant_OnCombat(Unit, Event)
	Unit:RegisterEvent("GlacialLieutenant_FrostNova", 8000, 0)
	Unit:RegisterEvent("GlacialLieutenant_FrostShock", 6000, 0)
end

function GlacialLieutenant_FrostNova(Unit, Event) 
	Unit:CastSpell(14907) 
end

function GlacialLieutenant_FrostShock(Unit, Event) 
	Unit:FullCastSpellOnTarget(12548, Unit:GetMainTank()) 
end

function GlacialLieutenant_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GlacialLieutenant_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26215, 1, "GlacialLieutenant_OnCombat")
RegisterUnitEvent(26215, 2, "GlacialLieutenant_OnLeaveCombat")
RegisterUnitEvent(26215, 4, "GlacialLieutenant_OnDied")

--Hive'Ashi Defender
function HiveAshiDefender_OnCombat(Unit, Event)
	Unit:RegisterEvent("HiveAshiDefender_Disarm", 9000, 0)
end

function HiveAshiDefender_Disarm(Unit, Event) 
	Unit:FullCastSpellOnTarget(6713, Unit:GetMainTank()) 
end

function HiveAshiDefender_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HiveAshiDefender_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11722, 1, "HiveAshiDefender_OnCombat")
RegisterUnitEvent(11722, 2, "HiveAshiDefender_OnLeaveCombat")
RegisterUnitEvent(11722, 4, "HiveAshiDefender_OnDied")

--Hive'Regal Ambusher
function HiveRegalAmbusher_OnCombat(Unit, Event)
	Unit:RegisterEvent("HiveRegalAmbusher_Poison", 10000, 0)
end

function HiveRegalAmbusher_Poison(Unit, Event) 
	Unit:FullCastSpellOnTarget(744, Unit:GetRandomPlayer(0)) 
end

function HiveRegalAmbusher_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HiveRegalAmbusher_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11730, 1, "HiveRegalAmbusher_OnCombat")
RegisterUnitEvent(11730, 2, "HiveRegalAmbusher_OnLeaveCombat")
RegisterUnitEvent(11730, 4, "HiveRegalAmbusher_OnDied")

--Hive'Regal HiveLord
function HiveRegalHiveLord_OnCombat(Unit, Event)
	Unit:RegisterEvent("HiveRegalHiveLord_BerserkerCharge", 6000, 0)
end

function HiveRegalHiveLord_BerserkerCharge(Unit, Event) 
	Unit:FullCastSpellOnTarget(19471, Unit:GetRandomPlayer(0)) 
end

function HiveRegalHiveLord_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HiveRegalHiveLord_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11734, 1, "HiveRegalHiveLord_OnCombat")
RegisterUnitEvent(11734, 2, "HiveRegalHiveLord_OnLeaveCombat")
RegisterUnitEvent(11734, 4, "HiveRegalHiveLord_OnDied")

--Hive'Regal Slavemaker
function HiveRegalSlavemaker_OnCombat(Unit, Event)
	Unit:RegisterEvent("HiveRegalSlavemaker_VolatileInfection", 10000, 0)
end

function HiveRegalSlavemaker_VolatileInfection(Unit, Event) 
	Unit:FullCastSpellOnTarget(3584, Unit:GetMainTank()) 
end

function HiveRegalSlavemaker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HiveRegalSlavemaker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11733, 1, "HiveRegalSlavemaker_OnCombat")
RegisterUnitEvent(11733, 2, "HiveRegalSlavemaker_OnLeaveCombat")
RegisterUnitEvent(11733, 4, "HiveRegalSlavemaker_OnDied")

--Hive'Regal Spitfire
function HiveRegalSpitfire_OnCombat(Unit, Event)
	Unit:RegisterEvent("HiveRegalSpitfire_CorrosiveAcidSpit", 8000, 0)
end

function HiveRegalSpitfire_CorrosiveAcidSpit(Unit, Event) 
	Unit:FullCastSpellOnTarget(21047, Unit:GetRandomPlayer(0)) 
end

function HiveRegalSpitfire_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HiveRegalSpitfire_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11732, 1, "HiveRegalSpitfire_OnCombat")
RegisterUnitEvent(11732, 2, "HiveRegalSpitfire_OnLeaveCombat")
RegisterUnitEvent(11732, 4, "HiveRegalSpitfire_OnDied")

--Hive'Zora Abomination
function HiveZoraAbomination_OnCombat(Unit, Event)
	Unit:RegisterEvent("HiveZoraAbomination_AbominationSpit", 8000, 0)
	Unit:RegisterEvent("HiveZoraAbomination_PoisonCloud", 10000, 0)
	Unit:RegisterEvent("HiveZoraAbomination_WingsofDespair", 12000, 0)
end

function HiveZoraAbomination_AbominationSpit(Unit, Event) 
	Unit:FullCastSpellOnTarget(25262, Unit:GetMainTank()) 
end

function HiveZoraAbomination_PoisonCloud(Unit, Event) 
	Unit:CastSpell(25198) 
end

function HiveZoraAbomination_WingsofDespair(Unit, Event) 
	Unit:FullCastSpellOnTarget(25260, Unit:GetRandomPlayer(0)) 
end

function HiveZoraAbomination_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HiveZoraAbomination_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(15449, 1, "HiveZoraAbomination_OnCombat")
RegisterUnitEvent(15449, 2, "HiveZoraAbomination_OnLeaveCombat")
RegisterUnitEvent(15449, 4, "HiveZoraAbomination_OnDied")

--Hive'Zora HiveSister
function HiveZoraHiveSister_OnCombat(Unit, Event)
	Unit:RegisterEvent("HiveZoraHiveSister_ToxicSpit", 5000, 0)
end

function HiveZoraHiveSister_ToxicSpit(Unit, Event) 
	Unit:FullCastSpellOnTarget(7951, Unit:GetClosestPlayer()) 
end

function HiveZoraHiveSister_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HiveZoraHiveSister_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11729, 1, "HiveZoraHiveSister_OnCombat")
RegisterUnitEvent(11729, 2, "HiveZoraHiveSister_OnLeaveCombat")
RegisterUnitEvent(11729, 4, "HiveZoraHiveSister_OnDied")

--Hive'Zora Reaver
function HiveZoraReaver_OnCombat(Unit, Event)
	Unit:RegisterEvent("HiveZoraReaver_Cleave", 8000, 0)
	Unit:RegisterEvent("HiveZoraReaver_Knockdown", 10000, 0)
end

function HiveZoraReaver_Cleave(Unit, Event) 
	Unit:CastSpell(40504) 
end

function HiveZoraReaver_Knockdown(Unit, Event) 
	Unit:CastSpell(16790) 
end

function HiveZoraReaver_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HiveZoraReaver_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11728, 1, "HiveZoraReaver_OnCombat")
RegisterUnitEvent(11728, 2, "HiveZoraReaver_OnLeaveCombat")
RegisterUnitEvent(11728, 4, "HiveZoraReaver_OnDied")

--Hive'Zora Wasp
function HiveZoraWasp_OnCombat(Unit, Event)
	Unit:RegisterEvent("HiveZoraWasp_Poison", 10000, 0)
end

function HiveZoraWasp_Poison(Unit, Event) 
	Unit:FullCastSpellOnTarget(744, Unit:GetRandomPlayer(0)) 
end

function HiveZoraWasp_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HiveZoraWasp_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11727, 1, "HiveZoraWasp_OnCombat")
RegisterUnitEvent(11727, 2, "HiveZoraWasp_OnLeaveCombat")
RegisterUnitEvent(11727, 4, "HiveZoraWasp_OnDied")

--Hoary Templar
function HoaryTemplar_OnCombat(Unit, Event)
	Unit:RegisterEvent("HoaryTemplar_LightningShield", 6000, 0)
end

function HoaryTemplar_LightningShield(Unit, Event) 
	Unit:CastSpell(19514) 
end

function HoaryTemplar_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HoaryTemplar_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(15212, 1, "HoaryTemplar_OnCombat")
RegisterUnitEvent(15212, 2, "HoaryTemplar_OnLeaveCombat")
RegisterUnitEvent(15212, 4, "HoaryTemplar_OnDied")

--Rock Stalker
function RockStalker_OnCombat(Unit, Event)
	Unit:RegisterEvent("RockStalker_Poison", 8000, 0)
	Unit:RegisterEvent("RockStalker_Web", 10000, 0)
end

function RockStalker_Poison(Unit, Event) 
	Unit:FullCastSpellOnTarget(744, Unit:GetMainTank()) 
end

function RockStalker_Web(Unit, Event) 
	Unit:FullCastSpellOnTarget(745, Unit:GetRandomPlayer(0)) 
end

function RockStalker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RockStalker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11739, 1, "RockStalker_OnCombat")
RegisterUnitEvent(11739, 2, "RockStalker_OnLeaveCombat")
RegisterUnitEvent(11739, 4, "RockStalker_OnDied")

--Sand Skitterer
function SandSkitterer_OnCombat(Unit, Event)
	Unit:RegisterEvent("SandSkitterer_Poison", 10000, 0)
end

function SandSkitterer_Poison(Unit, Event) 
	Unit:FullCastSpellOnTarget(744, 	Unit:GetRandomPlayer(0)) 
end

function SandSkitterer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SandSkitterer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11738, 1, "SandSkitterer_OnCombat")
RegisterUnitEvent(11738, 2, "SandSkitterer_OnLeaveCombat")
RegisterUnitEvent(11738, 4, "SandSkitterer_OnDied")

--Stonelash Flayer
function StonelashFlayer_OnCombat(Unit, Event)
	Unit:RegisterEvent("StonelashFlayer_Thrash", 5000, 0)
	Unit:RegisterEvent("StonelashFlayer_VenomSting", 8000, 0)
end

function StonelashFlayer_Thrash(Unit, Event) 
	Unit:FullCastSpellOnTarget(3391, Unit:GetMainTank()) 
end

function StonelashFlayer_VenomSting(Unit, Event) 
	Unit:FullCastSpellOnTarget(5416, Unit:GetMainTank()) 
end

function StonelashFlayer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function StonelashFlayer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11737, 1, "StonelashFlayer_OnCombat")
RegisterUnitEvent(11737, 2, "StonelashFlayer_OnLeaveCombat")
RegisterUnitEvent(11737, 4, "StonelashFlayer_OnDied")

--Stonelash Pincer
function StonelashPincer_OnCombat(Unit, Event)
	Unit:RegisterEvent("StonelashPincer_TendonRip", 6000, 0)
	Unit:RegisterEvent("StonelashPincer_VenomSting", 8000, 0)
end

function StonelashPincer_TendonRip(Unit, Event) 
	Unit:FullCastSpellOnTarget(3604, Unit:GetMainTank()) 
end

function StonelashPincer_VenomSting(Unit, Event) 
	Unit:FullCastSpellOnTarget(5416, Unit:GetMainTank()) 
end

function StonelashPincer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function StonelashPincer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11736, 1, "StonelashPincer_OnCombat")
RegisterUnitEvent(11736, 2, "StonelashPincer_OnLeaveCombat")
RegisterUnitEvent(11736, 4, "StonelashPincer_OnDied")

--Stonelash Scorpid
function StonelashScorpid_OnCombat(Unit, Event)
	Unit:RegisterEvent("StonelashScorpid_VenomSting", 8000, 0)
end

function StonelashScorpid_VenomSting(Unit, Event) 
	Unit:FullCastSpellOnTarget(5416, 	Unit:GetMainTank()) 
end

function StonelashScorpid_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function StonelashScorpid_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11735, 1, "StonelashScorpid_OnCombat")
RegisterUnitEvent(11735, 2, "StonelashScorpid_OnLeaveCombat")
RegisterUnitEvent(11735, 4, "StonelashScorpid_OnDied")

--Tortured Druid
function TorturedDruid_OnCombat(Unit, Event)
	Unit:RegisterEvent("TorturedDruid_HealingTouch", 15000, 0)
	Unit:RegisterEvent("TorturedDruid_Moonfire", 6000, 0)
	Unit:RegisterEvent("TorturedDruid_SummonHiveAshiDrones", 2000, 1)
end

function TorturedDruid_HealingTouch(Unit, Event) 
	Unit:CastSpell(23381) 
end

function TorturedDruid_Moonfire(Unit, Event) 
	Unit:FullCastSpellOnTarget(23380, Unit:GetMainTank()) 
end

function TorturedDruid_SummonHiveAshiDrones(Unit, Event) 
	Unit:CastSpell(21327) 
end

function TorturedDruid_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TorturedDruid_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12178, 1, "TorturedDruid_OnCombat")
RegisterUnitEvent(12178, 2, "TorturedDruid_OnLeaveCombat")
RegisterUnitEvent(12178, 4, "TorturedDruid_OnDied")

--Tortured Sentinel
function TorturedSentinel_OnCombat(Unit, Event)
	Unit:RegisterEvent("TorturedSentinel_SummonHiveAshiDrones", 2000, 1)
end

function TorturedSentinel_SummonHiveAshiDrones(Unit, Event) 
	Unit:CastSpell(21327) 
end

function TorturedSentinel_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TorturedSentinel_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12179, 1, "TorturedSentinel_OnCombat")
RegisterUnitEvent(12179, 2, "TorturedSentinel_OnLeaveCombat")
RegisterUnitEvent(12179, 4, "TorturedSentinel_OnDied")

--Twilight Avenger
function TwilightAvenger_OnCombat(Unit, Event)
	Unit:RegisterEvent("TwilightAvenger_Enrage", 10000, 1)
end

function TwilightAvenger_Enrage(Unit, Event) 
	Unit:CastSpell(8599) 
end

function TwilightAvenger_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TwilightAvenger_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11880, 1, "TwilightAvenger_OnCombat")
RegisterUnitEvent(11880, 2, "TwilightAvenger_OnLeaveCombat")
RegisterUnitEvent(11880, 4, "TwilightAvenger_OnDied")

--Twilight Geolord
function TwilightGeolord_OnCombat(Unit, Event)
	Unit:RegisterEvent("TwilightGeolord_Boulder", 6000, 0)
	Unit:RegisterEvent("TwilightGeolord_EarthShock", 8000, 0)
end

function TwilightGeolord_Boulder(Unit, Event) 
	Unit:FullCastSpellOnTarget(9483, Unit:GetMainTank()) 
end

function TwilightGeolord_EarthShock(Unit, Event) 
	Unit:FullCastSpellOnTarget(13728, Unit:GetMainTank()) 
end

function TwilightGeolord_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TwilightGeolord_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11881, 1, "TwilightGeolord_OnCombat")
RegisterUnitEvent(11881, 2, "TwilightGeolord_OnLeaveCombat")
RegisterUnitEvent(11881, 4, "TwilightGeolord_OnDied")

--Twilight Marauder
function TwilightMarauder_OnCombat(Unit, Event)
	Unit:RegisterEvent("TwilightMarauder_PiercingHowl", 10000, 0)
	Unit:RegisterEvent("TwilightMarauder_Enrage", 12000, 1)
end

function TwilightMarauder_PiercingHowl(Unit, Event) 
	Unit:CastSpell(23600) 
end

function TwilightMarauder_Enrage(Unit, Event) 
	Unit:CastSpell(8599) 
end

function TwilightMarauder_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TwilightMarauder_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(15542, 1, "TwilightMarauder_OnCombat")
RegisterUnitEvent(15542, 2, "TwilightMarauder_OnLeaveCombat")
RegisterUnitEvent(15542, 4, "TwilightMarauder_OnDied")

--Twilight Master
function TwilightMaster_OnCombat(Unit, Event)
	Unit:RegisterEvent("TwilightMaster_ChainLightning", 10000, 0)
	Unit:RegisterEvent("TwilightMaster_Frostbolt", 7000, 0)
end

function TwilightMaster_ChainLightning(Unit, Event) 
	Unit:FullCastSpellOnTarget(12058, Unit:GetMainTank()) 
end

function TwilightMaster_Frostbolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9672, Unit:GetMainTank()) 
end

function TwilightMaster_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TwilightMaster_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11883, 1, "TwilightMaster_OnCombat")
RegisterUnitEvent(11883, 2, "TwilightMaster_OnLeaveCombat")
RegisterUnitEvent(11883, 4, "TwilightMaster_OnDied")

--Twilight Overlord
function TwilightOverlord_OnCombat(Unit, Event)
	Unit:RegisterEvent("TwilightOverlord_ChainLightning", 10000, 0)
	Unit:RegisterEvent("TwilightOverlord_FireBlast", 6000, 0)
	Unit:RegisterEvent("TwilightOverlord_Frostbolt", 8000, 0)
end

function TwilightOverlord_ChainLightning(Unit, Event) 
	Unit:FullCastSpellOnTarget(12058, Unit:GetMainTank()) 
end

function TwilightOverlord_FireBlast(Unit, Event) 
	Unit:FullCastSpellOnTarget(13339, Unit:GetMainTank()) 
end

function TwilightOverlord_Frostbolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9672, Unit:GetMainTank()) 
end

function TwilightOverlord_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TwilightOverlord_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(15213, 1, "TwilightOverlord_OnCombat")
RegisterUnitEvent(15213, 2, "TwilightOverlord_OnLeaveCombat")
RegisterUnitEvent(15213, 4, "TwilightOverlord_OnDied")

--Twilight Prophet
function TwilightProphet_OnCombat(Unit, Event)
	Unit:RegisterEvent("TwilightProphet_ChainLightning", 10000, 0)
	Unit:RegisterEvent("TwilightProphet_FireNova", 4000, 0)
	Unit:RegisterEvent("TwilightProphet_FrostNova", 8000, 0)
	Unit:RegisterEvent("TwilightProphet_PsychicScream", 12000, 0)
end

function TwilightProphet_ChainLightning(Unit, Event) 
	Unit:FullCastSpellOnTarget(15308, Unit:GetMainTank()) 
end

function TwilightProphet_FireNova(Unit, Event) 
	Unit:CastSpell(17366) 
end

function TwilightProphet_FrostNova(Unit, Event) 
	Unit:CastSpell(15531) 
end

function TwilightProphet_PsychicScream(Unit, Event) 
	Unit:CastSpell(22884) 
end

function TwilightProphet_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TwilightProphet_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(15308, 1, "TwilightProphet_OnCombat")
RegisterUnitEvent(15308, 2, "TwilightProphet_OnLeaveCombat")
RegisterUnitEvent(15308, 4, "TwilightProphet_OnDied")

--Twilight Stonecaller
function TwilightStonecaller_OnCombat(Unit, Event)
	Unit:RegisterEvent("TwilightStonecaller_Fireball", 8000, 0)
	Unit:RegisterEvent("TwilightStonecaller_Petrify", 10000, 0)
end

function TwilightStonecaller_Fireball(Unit, Event) 
	Unit:FullCastSpellOnTarget(9053, Unit:GetMainTank()) 
end

function TwilightStonecaller_Petrify(Unit, Event) 
	Unit:FullCastSpellOnTarget(11020, Unit:GetMainTank()) 
end

function TwilightStonecaller_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TwilightStonecaller_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11882, 1, "TwilightStonecaller_OnCombat")
RegisterUnitEvent(11882, 2, "TwilightStonecaller_OnLeaveCombat")
RegisterUnitEvent(11882, 4, "TwilightStonecaller_OnDied")

--Whirling Invader
function WhirlingInvader_OnCombat(Unit, Event)
	Unit:RegisterEvent("WhirlingInvader_Whirlwind", 6000, 0)
end

function WhirlingInvader_Whirlwind(Unit, Event) 
	Unit:CastSpell(17207) 
end

function WhirlingInvader_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WhirlingInvader_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14455, 1, "WhirlingInvader_OnCombat")
RegisterUnitEvent(14455, 2, "WhirlingInvader_OnLeaveCombat")
RegisterUnitEvent(14455, 4, "WhirlingInvader_OnDied")