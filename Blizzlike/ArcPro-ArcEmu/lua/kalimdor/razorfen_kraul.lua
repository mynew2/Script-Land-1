--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]
--[[ TODO: Auld Stonespire, Heralath Fallowbrook, Spirit of Agamaggan, Willix the Importer]]--

-- Agathelos
function Agathelos_OnCombat(pUnit, event)
	pUnit:RegisterEvent("Frenzy", 7000, 0)
	pUnit:RegisterEvent("Rushing", 14000, 0)
	pUnit:RegisterEvent("Rampage", 21000, 0)
	pUnit:RegisterEvent("Left", 28000, 0)
end

function Frenzy(pUnit, Event)
	pUnit:CastSpell(8269)
	pUnit:RegisterEvent("Frenzy", 7000, 0)
end

function Rushing(pUnit, Event)
	pUnit:CastSpell(8260)
	pUnit:RegisterEvent("Rushing", 14000, 0)
end

function Rampage(pUnit, Event)
	pUnit:CastSpellOnTarget(8285)
	pUnit:RegisterEvent("Rampage", 21000, 0)
end

function Left(pUnit, Event)
	pUnit:CastSpellOnTarget(8555)
	pUnit:RegisterEvent("Left", 28000, 0)
end

function Agathelos_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end

function Agathelos_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(4422, 1, "Agathelos_OnCombat")
RegisterUnitEvent(4422, 2, "Agathelos_OnLeaveCombat")
RegisterUnitEvent(4422, 4, "Agathelos_OnDeath")

-- Aggem
function Aggem_OnCombat(pUnit, event)
	pUnit:CastSpell(8286)
	pUnit:RegisterEvent("Battle", 7000, 0)
	pUnit:RegisterEvent("Heal", 14000, 0)
end
 
function Battle(pUnit, Event)
	pUnit:CastSpell(6192)
	pUnit:RegisterEvent("Battle", 7000, 0)
end
 
function Heal(pUnit, Event)
	pUnit:CastSpell(14900)
	pUnit:RegisterEvent("Heal", 14000, 0)
end
 
function Aggem_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end
 
function Aggem_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end
 
RegisterUnitEvent(4832, 1, "Aggem_OnCombat")
RegisterUnitEvent(4832, 2, "Aggem_OnLeaveCombat")
RegisterUnitEvent(4832, 4, "Aggem_OnDeath")

-- Blind
function Blind_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end
 
function Blind_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end
 
RegisterUnitEvent(4425, 2, "Blind_OnLeaveCombat")
RegisterUnitEvent(4425, 4, "Blind_OnDeath")

-- Charlga
function Charlga_OnCombat(pUnit, event)
local chance = math.random(1,3)
	if (chance == 1) then
		pUnit:SendChatMessage(14, 0, "Troublesome whelps. I'll teach you to interfere!")
--		pUnit:PlaySoundToSet()
	elseif (chance == 2) then
		pUnit:SendChatMessage(14, 0, "You outsiders will pay for encroahing on our land!")
--		pUnit:PlaySoundToSet()
	elseif (chance == 3) then
		pUnit:SendChatMessage(14, 0, "Bah! My power rules here!")
--		pUnit:PlaySoundToSet()
	end
	pUnit:RegisterEvent("Chain", 7000, 0)
	pUnit:RegisterEvent("Mana", 14000, 0)
	pUnit:RegisterEvent("Purity", 21000, 0)
	pUnit:RegisterEvent("Renew", 28000, 0)
end

function Chain(pUnit, Event)
	pUnit:FullCastSpellOnTarget(8292, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("Chain", 7000, 0)
end

function Mana(pUnit, Event)
	pUnit:CastSpell(8358)
	pUnit:RegisterEvent("Mana", 14000, 0)
end

function Purity(pUnit, Event)
	pUnit:CastSpell(8361)
	pUnit:RegisterEvent("Purity", 21000, 0)
end

function Renew(pUnit, Event)
	pUnit:CastSpell(25058)
	pUnit:RegisterEvent("Renew", 28000, 0)
end

function Charlga_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end

function Charlga_OnKilledPlayer(pUnit, event)
	pUnit:SendChatMessage(14, 0, "Who's next?")
--	pUnit:PlaySoundToSet()
end

function Charlga_OnDeath(pUnit, event)
	pUnit:SendChatMessage(14, 0, "Our new allies will avenge us!")
--	pUnit:PlaySoundToSet()
	pUnit:RemoveEvents()
end

RegisterUnitEvent(4421, 1, "Charlga_OnCombat")
RegisterUnitEvent(4421, 2, "Charlga_OnLeaveCombat")
RegisterUnitEvent(4421, 3, "Charlga_OnKilledPlayer")
RegisterUnitEvent(4421, 4, "Charlga_OnDeath")

-- Jargba
function Jargba_OnCombat(pUnit, event)
	pUnit:RegisterEvent("Shadow", 7000, 0)
	pUnit:RegisterEvent("Mind", 14000, 0)
end
 
function Shadow(pUnit, Event)
	pUnit:FullCastSpellOnTarget(9613, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("Shadow", 7000, 0)
end
 
function Mind(pUnit, Event)
	pUnit:FullCastSpellOnTarget(14515, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("Mind", 14000, 0)
end
 
function Jargba_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end
 
function Jargba_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end
 
RegisterUnitEvent(4428, 1, "Jargba_OnCombat")
RegisterUnitEvent(4428, 2, "Jargba_OnLeaveCombat")
RegisterUnitEvent(4428, 4, "Jargba_OnDeath")

-- Halmgar
function Halmgar_OnCombat(pUnit, event)
	pUnit:RegisterEvent("Lightning", 7000, 0)
	pUnit:RegisterEvent("Earth", 14000, 0)
	pUnit:RegisterEvent("Totem", 21000, 0)
end
 
function Lightning(pUnit, Event)
	pUnit:FullCastSpellOnTarget(9532, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("Lightning", 7000, 0)
end
 
function Earth(pUnit, Event)
	pUnit:CastSpell(8270)
	pUnit:RegisterEvent("Earth", 14000, 0)
end
 
function Totem(pUnit, Event)
	pUnit:CastSpell(2484)
	pUnit:RegisterEvent("Totem", 14000, 0)
end
 
function Halmgar_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end
 
function Halmgar_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end
 
RegisterUnitEvent(4842, 1, "Halmgar_OnCombat")
RegisterUnitEvent(4842, 2, "Halmgar_OnLeaveCombat")
RegisterUnitEvent(4842, 4, "Halmgar_OnDeath")

-- Ramtusk
function Ramtusk_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "For Victory! For Agamaggan!")
--	pUnit:PlaySoundToSet()
	pUnit:RegisterEvent("Shout", 0, 0)
	pUnit:RegisterEvent("Stance", 7000, 0)
	pUnit:RegisterEvent("Clap", 14000, 0)
end
 
function Shout(pUnit, Event)
	pUnit:CastSpell(9128)
end
 
function Stance(pUnit, Event)
	pUnit:CastSpell(7165)
	pUnit:RegisterEvent("Stance", 7000, 0)
end
 
function Clap(pUnit, Event)
	pUnit:CastSpell(15548)
	pUnit:RegisterEvent("Clap", 14000, 0)
end
 
function Ramtusk_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end
 
function Ramtusk_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end
 
RegisterUnitEvent(4420, 1, "Ramtusk_OnCombat")
RegisterUnitEvent(4420, 2, "Ramtusk_OnLeaveCombat")
RegisterUnitEvent(4420, 4, "Ramtusk_OnDeath")

-- Roogug
function Roogug_OnCombat(pUnit, event)
	pUnit:RegisterEvent("Lightning", 7000, 0)
	pUnit:RegisterEvent("Earth", 14000, 0)
end
 
function Lightning(pUnit, Event)
	pUnit:FullCastSpellOnTarget(9532, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("Lightning", 7000, 0)
end
 
function Earth(pUnit, Event)
	pUnit:CastSpell(8270)
	pUnit:RegisterEvent("Earth", 14000, 0)
end
 
function Roogug_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end
 
function Roogug_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end
 
RegisterUnitEvent(6168, 1, "Roogug_OnCombat")
RegisterUnitEvent(6168, 2, "Roogug_OnLeaveCombat")
RegisterUnitEvent(6168, 4, "Roogug_OnDeath")