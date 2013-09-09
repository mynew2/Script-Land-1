--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation, Mathix
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function JergoshOnCombat(Unit, Event, Attacker)
	Unit:RegisterEvent(JergoshSpell1, 15000, 0)
	Unit:RegisterEvent(JergoshSpell2, 10000, 0)
end

function JergoshSpell1(Unit, Event, Attacker)
	Unit:FullCastSpellOnTarget(20800, Unit:GetMainTank())
end

function JergoshSpell2(Unit, Event, Attacker)
	Unit:FullCastSpellOnTarget(18267, Unit:GetMainTank())
end

RegisterUnitEvent(11518, 1, "JergoshOnCombat")

function OggleflintOnCombat(Unit, Event, Attacker)
	Unit:RegisterEvent(OggleflintSpell1, 10000, 0)
end

function OggleflintSpell2(Unit, Event, Attacker)
	Unit:FullCastSpellOnTarget(40505, Unit:GetMainTank())
end

RegisterUnitEvent(11517, 1, "OggleflintOnCombat")

function TaragamanOnCombat(Unit, Event, Attacker)
	Unit:RegisterEvent(TaragamanSpell1, 10000, 0)
	Unit:RegisterEvent(TaragamanSpell2, 10000, 0)
end

function TaragamanSpell1(Unit, Event, Attacker)
	Unit:FullCastSpellOnTarget(11970, Unit)
end

function TaragamanSpell2(Unit, Event, Attacker)
	Unit:FullCastSpellOnTarget(18072, Unit:GetMainTank())
end

RegisterUnitEvent(11520, 1, "TaragamanOnCombat")

--TODO: Poison - 744
function BazzalanOnCombat(Unit, Event, Attacker)
	Unit:RegisterEvent(BazzalanSpell1, 15000, 0)
	Unit:RegisterEvent(BazzalanSpell2, 5000, 0)
end

function BazzalanSpell1(Unit, Event, Attacker)
	Unit:FullCastSpellOnTarget(14873, Unit:GetMainTank())
end

function BazzalanSpell2(Unit, Event, Attacker)
	local maintank = Unit:GetMainTank()
	maintank:AddAura(2818, 12000)
end

RegisterUnitEvent(11519, 1, "BazzalanOnCombat")

--[[ Bloodfiller Orb
when you click this orb a npc will spawn (need gobject ID to complete this)]]

-- Earthborer
function EarthborerOnCombat(Unit, Event, Attacker)
	Unit:RegisterEvent(EarthborerSpell1, 15000, 0)
end

function EarthBorerSpell1(Unit, Event, Attacker)
	Unit:FullCastSpellOnTarget(18070, Unit:GetMainTank())
end

RegisterUnitEvent(11320, 1, "EarthborerOnCombat")

-- Molten Elemental
function MoltenElementalOnCombat(Unit, Event, Attacker)
	Unit:RegisterEvent(MoltenElementalSpell1, 40000, 0)
end

function MoltenElementalSpell1(Unit, Event, Attacker)
	Unit:FullCastSpellOnTarget(134, Unit)
end

RegisterUnitEvent(11321, 1, "MoltenElementalOnCombat")

-- Blade Cultist
function BladeCultistOnCombat(Unit, Event, Attacker)
	Unit:RegisterEvent(BladCultistSpell1, 30000, 0)
end

function BladeCultistSpell1(Unit, Event, Attacker)
	Unit:FullCastSpellOnTarget(18266, Unit:GetMainTank())
end

RegisterUnitEvent(11322, 1, "BladeCultistOnCombat")

-- Searing Blade Enforcerer
function SearingBladeEnforcererOnCombat(Unit, Event, Attacker)
	Unit:RegisterEvent(SearingBladeEnforcererSpell1, 15000, 0)
end

function SearingBladeEnforcererSpell1(Unit, Event, Attacker)
	Unit:FullCastSpellOnTarget(8242, Unit:GetMainTank())
end

RegisterUnitEvent(11323, 1, "SearingBladeEnforcererOnCombat")

-- Searing Blade Warlock
function SearingBladeWarlockOnCombat(Unit, Event, Attacker)
	Unit:RegisterEvent(SearingBladeWarlockSpell1, 20000, 0)
	Unit:RegisterEvent(SearingBladeWarlockSpell2, 1000, 1)
end

function SearingBladeWarlockSpell1(Unit, Event, Attacker)
	Unit:FullCastSpellOnTarget(20791, Unit:GetMainTank())
end

function SearingBladeWarlockSpell2(Unit, Event, Attacker)
	if(SearingBladeWarlockPet == 0) then
		Unit:CreateGuardian(8996, 120000, 0, 14)
		local SearingBladeWarlockPet = 1
	end
end

function SearingBladeWarlockPetOnDied(Unit, Event, lasttarget)
	local SearingBladeWarlockPet = 0
end

RegisterUnitEvent(11324, 1, "SearingBladeWarlockOnCombat")
RegisterUnitEvent(8996, 4, "SearingBladeWarlockPetOnDied")

-- Ragefire Trogg

function RagefireTroggOnCombat(Unit, Event, Attacker)
	Unit:RegisterEvent(RagefireTroggSpell1, 40000, 0)
end

function RagefireTroggSpell1(Unit, Event, Attacker)
	Unit:FullCastSpellOnTarget(11976, Unit:GetMainTank())
end

RegisterUnitEvent(11318, 1, "RagefireTroggOnCombat")

-- Ragefire Shaman
function RagefireShamanOnCombat(Unit, Event, Attacker)
	Unit:RegisterEvent(RagefireShamanSpell1, 15, 0)
	Unit:RegisterEvent(RagefireShamanSpell2, 20, 0)
end

function RagefireShamanSpell1(Unit, Event, Attacker)
	local RagefireShamanFriend = Unit:GetRandomFriend()
	if(RagefireShamanFriend:GetHealthPct() <= 75) then
		Unit:FullCastSpellOnTarget(11986, RagefireShamanFriend)
	else 
		local RagefireShamanFriend = Unit:GetRandomFriend()
	end
end

function RagefireShamanSpell2(Unit, Event, Attacker)
	Unit:FullCastSpellOnTarget(9532, Unit:GetMainTank())
end

RegisterUnitEvent(11319, 1, "RagefireShamanOnCombat")