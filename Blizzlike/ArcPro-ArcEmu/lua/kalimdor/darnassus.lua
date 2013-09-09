--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function HuntressRavenoak_OnCombat(Unit, Event)
	Unit:RegisterEvent("HuntressRavenoak_HookedNet", 13000, 0)
	Unit:RegisterEvent("HuntressRavenoak_SunderArmor", 8000, 0)
end

function HuntressRavenoak_HookedNet(Unit, Event) 
	Unit:FullCastSpellOnTarget(14030, Unit:GetMainTank()) 
end

function HuntressRavenoak_SunderArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(15572, Unit:GetMainTank()) 
end

function HuntressRavenoak_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HuntressRavenoak_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14379, 1, "HuntressRavenoak_OnCombat")
RegisterUnitEvent(14379, 2, "HuntressRavenoak_OnLeaveCombat")
RegisterUnitEvent(14379, 4, "HuntressRavenoak_OnDied")

function HuntressSkymane_OnCombat(Unit, Event)
	Unit:RegisterEvent("HuntressSkymane_HookedNet", 13000, 0)
	Unit:RegisterEvent("HuntressSkymane_SunderArmor", 8000, 0)
end

function HuntressSkymane_HookedNet(Unit, Event) 
	Unit:FullCastSpellOnTarget(14030, Unit:GetMainTank()) 
end

function HuntressSkymane_SunderArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(15572, Unit:GetMainTank()) 
end

function HuntressSkymane_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HuntressSkymane_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14378, 1, "HuntressSkymane_OnCombat")
RegisterUnitEvent(14378, 2, "HuntressSkymane_OnLeaveCombat")
RegisterUnitEvent(14378, 4, "HuntressSkymane_OnDied")

function ArchDruidFandralStaghelm_OnCombat(Unit, Event)
	Unit:RegisterEvent("ArchDruidFandralStaghelm_EntanglingRoots", 25000, 0)
	Unit:RegisterEvent("ArchDruidFandralStaghelm_Rejuvenation", 35000, 0)
	Unit:RegisterEvent("ArchDruidFandralStaghelm_SummonTreantAllies", 4000, 1)
	Unit:RegisterEvent("ArchDruidFandralStaghelm_Wrath", 13000, 0)
end

function ArchDruidFandralStaghelm_EntanglingRoots(Unit, Event) 
	Unit:FullCastSpellOnTarget(20699, Unit:GetMainTank()) 
end

function ArchDruidFandralStaghelm_Rejuvenation(Unit, Event) 
	Unit:CastSpell(20701) 
end

function ArchDruidFandralStaghelm_SummonTreantAllies(Unit, Event) 
	Unit:CastSpell(20702) 
end

function ArchDruidFandralStaghelm_Wrath(Unit, Event) 
	Unit:FullCastSpellOnTarget(20698, Unit:GetMainTank()) 
end

function ArchDruidFandralStaghelm_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ArchDruidFandralStaghelm_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3516, 1, "ArchDruidFandralStaghelm_OnCombat")
RegisterUnitEvent(3516, 2, "ArchDruidFandralStaghelm_OnLeaveCombat")
RegisterUnitEvent(3516, 4, "ArchDruidFandralStaghelm_OnDied")

function HuntressLeafrunner_OnCombat(Unit, Event)
	Unit:RegisterEvent("HuntressLeafrunner_HookedNet", 13000, 0)
	Unit:RegisterEvent("HuntressLeafrunner_SunderArmor", 8000, 0)
end

function HuntressLeafrunner_HookedNet(Unit, Event) 
	Unit:FullCastSpellOnTarget(14030, Unit:GetMainTank()) 
end

function HuntressLeafrunner_SunderArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(15572, Unit:GetMainTank()) 
end

function HuntressLeafrunner_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HuntressLeafrunner_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14380, 1, "HuntressLeafrunner_OnCombat")
RegisterUnitEvent(14380, 2, "HuntressLeafrunner_OnLeaveCombat")
RegisterUnitEvent(14380, 4, "HuntressLeafrunner_OnDied")

function TyrandeWhisperwind_OnCombat(Unit, Event)
	Unit:RegisterEvent("TyrandeWhisperwind_Cleave", 12000, 0)
	Unit:RegisterEvent("TyrandeWhisperwind_Moonfire", 18000, 0)
	Unit:RegisterEvent("TyrandeWhisperwind_SearingArrow", 20000, 0)
	Unit:RegisterEvent("TyrandeWhisperwind_Starfall", 25000, 0)
end

function TyrandeWhisperwind_Cleave(Unit, Event) 
	Unit:CastSpell(20691) 
end

function TyrandeWhisperwind_Moonfire(Unit, Event) 
	Unit:FullCastSpellOnTarget(20690, Unit:GetMainTank()) 
end

function TyrandeWhisperwind_SearingArrow(Unit, Event) 
	Unit:FullCastSpellOnTarget(20688, Unit:GetMainTank()) 
end

function TyrandeWhisperwind_Starfall(Unit, Event) 
	Unit:CastSpell(20687) 
end

function TyrandeWhisperwind_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TyrandeWhisperwind_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(7999, 1, "TyrandeWhisperwind_OnCombat")
RegisterUnitEvent(7999, 2, "TyrandeWhisperwind_OnLeaveCombat")
RegisterUnitEvent(7999, 4, "TyrandeWhisperwind_OnDied")