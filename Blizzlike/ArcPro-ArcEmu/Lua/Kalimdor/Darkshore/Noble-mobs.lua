--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function AligartheTormentor_OnCombat(Unit, Event)
	Unit:RegisterEvent("AligartheTormentor_BattleStance", 2000, 1)
	Unit:RegisterEvent("AligartheTormentor_Hamstring", 9000, 0)
	Unit:RegisterEvent("AligartheTormentor_HeroicStrike", 7000, 0)
end

function AligartheTormentor_BattleStance(pUnit, Event) 
	pUnit:CastSpell(7165) 
end

function AligartheTormentor_Hamstring(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9080, 	pUnit:GetMainTank()) 
end

function AligartheTormentor_HeroicStrike(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(25712, 	pUnit:GetMainTank()) 
end

function AligartheTormentor_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AligartheTormentor_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3898, 1, "AligartheTormentor_OnCombat")
RegisterUnitEvent(3898, 2, "AligartheTormentor_OnLeaveCombat")
RegisterUnitEvent(3898, 4, "AligartheTormentor_OnDied")

function AnayaDawnrunner_OnCombat(Unit, Event)
	Unit:RegisterEvent("AnayaDawnrunner_BansheeCurse", 8000, 0)
end

function AnayaDawnrunner_BansheeCurse(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(5884, 	pUnit:GetMainTank()) 
end

function AnayaDawnrunner_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AnayaDawnrunner_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3667, 1, "AnayaDawnrunner_OnCombat")
RegisterUnitEvent(3667, 2, "AnayaDawnrunner_OnLeaveCombat")
RegisterUnitEvent(3667, 4, "AnayaDawnrunner_OnDied")

function BalizartheUmbrage_OnCombat(Unit, Event)
	Unit:RegisterEvent("BalizartheUmbrage_CurseofAgony", 11000, 0)
	Unit:RegisterEvent("BalizartheUmbrage_CurseofWeakness", 4000, 1)
	Unit:RegisterEvent("BalizartheUmbrage_ShadowBolt", 8000, 0)
	Unit:RegisterEvent("BalizartheUmbrage_SummonImp", 2000, 1)
end

function BalizartheUmbrage_CurseofAgony(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(14868, 	pUnit:GetMainTank()) 
end

function BalizartheUmbrage_CurseofWeakness(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11980, 	pUnit:GetMainTank()) 
end

function BalizartheUmbrage_ShadowBolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(20791, 	pUnit:GetMainTank()) 
end

function BalizartheUmbrage_SummonImp(pUnit, Event) 
	pUnit:CastSpell(11939) 
end

function BalizartheUmbrage_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BalizartheUmbrage_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3899, 1, "BalizartheUmbrage_OnCombat")
RegisterUnitEvent(3899, 2, "BalizartheUmbrage_OnLeaveCombat")
RegisterUnitEvent(3899, 4, "BalizartheUmbrage_OnDied")

function CaedakartheVicious_OnCombat(Unit, Event)
	Unit:RegisterEvent("CaedakartheVicious_HealingWave", 13000, 0)
	Unit:RegisterEvent("CaedakartheVicious_LightningBolt", 8000, 0)
	Unit:RegisterEvent("CaedakartheVicious_LightningShield", 5000, 0)
end

function CaedakartheVicious_HealingWave(pUnit, Event) 
	pUnit:CastSpell(913) 
end

function CaedakartheVicious_LightningBolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9532, 	pUnit:GetMainTank()) 
end

function CaedakartheVicious_LightningShield(pUnit, Event) 
	pUnit:CastSpell(905) 
end

function CaedakartheVicious_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CaedakartheVicious_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3900, 1, "CaedakartheVicious_OnCombat")
RegisterUnitEvent(3900, 2, "CaedakartheVicious_OnLeaveCombat")
RegisterUnitEvent(3900, 4, "CaedakartheVicious_OnDied")

function CarnivoustheBreaker_OnCombat(Unit, Event)
	Unit:RegisterEvent("CarnivoustheBreaker_PierceArmor", 9000, 0)
	Unit:RegisterEvent("CarnivoustheBreaker_Thrash", 5000, 0)
end

function CarnivoustheBreaker_PierceArmor(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6016, 	pUnit:GetMainTank()) 
end

function CarnivoustheBreaker_Thrash(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(3391, 	pUnit:GetMainTank()) 
end

function CarnivoustheBreaker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CarnivoustheBreaker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2186, 1, "CarnivoustheBreaker_OnCombat")
RegisterUnitEvent(2186, 2, "CarnivoustheBreaker_OnLeaveCombat")
RegisterUnitEvent(2186, 4, "CarnivoustheBreaker_OnDied")

function DelmanistheHated_OnCombat(Unit, Event)
	Unit:RegisterEvent("DelmanistheHated_FlameBlast", 12000, 0)
	Unit:RegisterEvent("DelmanistheHated_Frostbolt", 8000, 0)
end

function DelmanistheHated_FlameBlast(pUnit, Event) 
	pUnit:CastSpell(7101) 
end

function DelmanistheHated_Frostbolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(20792, 	pUnit:GetMainTank()) 
end

function DelmanistheHated_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DelmanistheHated_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3662, 1, "DelmanistheHated_OnCombat")
RegisterUnitEvent(3662, 2, "DelmanistheHated_OnLeaveCombat")
RegisterUnitEvent(3662, 4, "DelmanistheHated_OnDied")

function FirecallerRadison_OnCombat(Unit, Event)
	Unit:RegisterEvent("FirecallerRadison_Crazed", 2000, 1)
	Unit:RegisterEvent("FirecallerRadison_FireNova", 7000, 0)
	Unit:RegisterEvent("FirecallerRadison_Fireball", 8000, 0)
end

function FirecallerRadison_Crazed(pUnit, Event) 
	pUnit:CastSpell(5915) 
end

function FirecallerRadison_FireNova(pUnit, Event) 
	pUnit:CastSpell(11969) 
end

function FirecallerRadison_Fireball(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(20793, 	pUnit:GetMainTank()) 
end

function FirecallerRadison_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FirecallerRadison_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2192, 1, "FirecallerRadison_OnCombat")
RegisterUnitEvent(2192, 2, "FirecallerRadison_OnLeaveCombat")
RegisterUnitEvent(2192, 4, "FirecallerRadison_OnDied")

function FlagglemurktheCruel_OnCombat(Unit, Event)
	Unit:RegisterEvent("FlagglemurktheCruel_Knockdown", 9000, 0)
	Unit:RegisterEvent("FlagglemurktheCruel_Strike", 6000, 0)
end

function FlagglemurktheCruel_Knockdown(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11428, 	pUnit:GetMainTank()) 
end

function FlagglemurktheCruel_Strike(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11976, 	pUnit:GetMainTank()) 
end

function FlagglemurktheCruel_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FlagglemurktheCruel_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(7015, 1, "FlagglemurktheCruel_OnCombat")
RegisterUnitEvent(7015, 2, "FlagglemurktheCruel_OnLeaveCombat")
RegisterUnitEvent(7015, 4, "FlagglemurktheCruel_OnDied")--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

-- Cerellean Whiteclaw
function Cerellean_Whiteclaw_onSpawn(pUnit, Event)
	pUnit:Emote(68)
end

RegisterUnitEvent(3644, 6, "Cerellean_Whiteclaw_onSpawn")
RegisterUnitEvent(3644, 3, "Cerellean_Whiteclaw_onSpawn")
RegisterUnitEvent(3644, 2, "Cerellean_Whiteclaw_onSpawn")

function Cerellean_Whiteclaw_onCombat(pUnit, Event)
	pUnit:Emote(26)
end

RegisterUnitEvent(3644, 1, "Cerellean_Whiteclaw_onCombat")

-- Sentinel Tysha Moonblade
function Tysha_Moonblade_onSpawn(pUnit, Event)
	pUnit:Emote(68)
end

RegisterUnitEvent(3639, 6, "Tysha_Moonblade_onSpawn")
RegisterUnitEvent(3639, 3, "Tysha_Moonblade_onSpawn")
RegisterUnitEvent(3639, 2, "Tysha_Moonblade_onSpawn")

function Tysha_Moonblade_onCombat(pUnit, Event)
	pUnit:Emote(26)
end

RegisterUnitEvent(3639, 1, "Tysha_Moonblade_onCombat")

-- Asterion
function Asterion_onSpawn(pUnit, Event)
	pUnit:Emote(68)
	pUnit:SetCombatCapable(0)
end

RegisterUnitEvent(3650, 6, "Asterion_onSpawn")

-- Anaya Dawnrunner
function Anaya_Dawnrunner_onDeath(pUnit, Event)
	pUnit:SendChatMessage(0, 0, "Finally, my soul may rest... Oh, dearest Cerellean...")
end

RegisterUnitEvent(3667, 4, "Anaya_Dawnrunner_onDeath")

function LadyMoongazer_OnCombat(Unit, Event)
	Unit:RegisterEvent("LadyMoongazer_Net", 10000, 0)
	Unit:RegisterEvent("LadyMoongazer_Shoot", 6000, 0)
end

function LadyMoongazer_Net(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6533, 	pUnit:GetMainTank()) 
end

function LadyMoongazer_Shoot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6660, 	pUnit:GetMainTank()) 
end

function LadyMoongazer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function LadyMoongazer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2184, 1, "LadyMoongazer_OnCombat")
RegisterUnitEvent(2184, 2, "LadyMoongazer_OnLeaveCombat")
RegisterUnitEvent(2184, 4, "LadyMoongazer_OnDied")

function LadyVespira_OnCombat(Unit, Event)
	Unit:RegisterEvent("LadyVespira_ForkedLightning", 10000, 0)
	Unit:RegisterEvent("LadyVespira_Knockdown", 9000, 0)
	Unit:RegisterEvent("LadyVespira_Shoot", 6000, 0)
end

function LadyVespira_ForkedLightning(pUnit, Event) 
	pUnit:CastSpell(12549) 
end

function LadyVespira_Knockdown(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11428, 	pUnit:GetMainTank()) 
end

function LadyVespira_Shoot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6660, 	pUnit:GetMainTank()) 
end

function LadyVespira_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function LadyVespira_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(7016, 1, "LadyVespira_OnCombat")
RegisterUnitEvent(7016, 2, "LadyVespira_OnLeaveCombat")
RegisterUnitEvent(7016, 4, "LadyVespira_OnDied")

function Licillin_OnCombat(Unit, Event)
	Unit:RegisterEvent("Licillin_CurseofWeakness", 3000, 1)
	Unit:RegisterEvent("Licillin_ShadowBolt", 8000, 0)
end

function Licillin_CurseofWeakness(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11980, 	pUnit:GetMainTank()) 
end

function Licillin_ShadowBolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(20791, 	pUnit:GetMainTank()) 
end

function Licillin_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Licillin_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2191, 1, "Licillin_OnCombat")
RegisterUnitEvent(2191, 2, "Licillin_OnLeaveCombat")
RegisterUnitEvent(2191, 4, "Licillin_OnDied")

function MarinerEvenmist_OnCombat(Unit, Event)
	Unit:RegisterEvent("MarinerEvenmist_Net", 10000, 0)
end

function MarinerEvenmist_Net(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12024, 	pUnit:GetMainTank()) 
end

function MarinerEvenmist_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MarinerEvenmist_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25007, 1, "MarinerEvenmist_OnCombat")
RegisterUnitEvent(25007, 2, "MarinerEvenmist_OnLeaveCombat")
RegisterUnitEvent(25007, 4, "MarinerEvenmist_OnDied")

function MaroshtheDevious_OnCombat(Unit, Event)
	Unit:RegisterEvent("MaroshtheDevious_FaerieFire", 4000, 1)
	Unit:RegisterEvent("MaroshtheDevious_Thrash", 6000, 0)
end

function MaroshtheDevious_FaerieFire(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6950, 	pUnit:GetMainTank()) 
end

function MaroshtheDevious_Thrash(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(3391, 	pUnit:GetMainTank()) 
end

function MaroshtheDevious_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MaroshtheDevious_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11714, 1, "MaroshtheDevious_OnCombat")
RegisterUnitEvent(11714, 2, "MaroshtheDevious_OnLeaveCombat")
RegisterUnitEvent(11714, 4, "MaroshtheDevious_OnDied")--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: MikeBeck; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Murkdeep_OnCombat(Unit, Event)
	Unit:RegisterEvent("Murkdeep_Net", 10000, 0)
	Unit:RegisterEvent("Murkdeep_SunderArmor", 6000, 0)
end

function Murkdeep_Net(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6533, 	pUnit:GetMainTank()) 
end

function Murkdeep_SunderArmor(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11971, 	pUnit:GetMainTank()) 
end

function Murkdeep_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Murkdeep_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(10323, 1, "Murkdeep_OnCombat")
RegisterUnitEvent(10323, 2, "Murkdeep_OnLeaveCombat")
RegisterUnitEvent(10323, 4, "Murkdeep_OnDied")

function Shadowclaw_OnCombat(Unit, Event)
	Unit:RegisterEvent("Shadowclaw_CurseofWeakness", 4000, 1)
end

function Shadowclaw_CurseofWeakness(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(17227, pUnit:GetMainTank()) 
end

function Shadowclaw_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Shadowclaw_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2175, 1, "Shadowclaw_OnCombat")
RegisterUnitEvent(2175, 2, "Shadowclaw_OnLeaveCombat")
RegisterUnitEvent(2175, 4, "Shadowclaw_OnDied")

function Xabraxxis_OnCombat(Unit, Event)
	Unit:RegisterEvent("Xabraxxis_CurseofWeakness", 4000, 1)
	Unit:RegisterEvent("Xabraxxis_Enrage", 10000, 1)
	Unit:RegisterEvent("Xabraxxis_ShadowWordPain", 11390, 0)
end

function Xabraxxis_CurseofWeakness(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11980, 	pUnit:GetMainTank()) 
end

function Xabraxxis_Enrage(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(8599, 	pUnit:GetMainTank()) 
end

function Xabraxxis_ShadowWordPain(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11639, 	pUnit:GetMainTank()) 
end

function Xabraxxis_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Xabraxxis_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(10373, 1, "Xabraxxis_OnCombat")
RegisterUnitEvent(10373, 2, "Xabraxxis_OnLeaveCombat")
RegisterUnitEvent(10373, 4, "Xabraxxis_OnDied")