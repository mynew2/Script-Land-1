--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: Grimton1337
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

local Romogg = nil
Romogg = {}

function Romogg_OnSpawn(pUnit, Event)
	Romogg = pUnit
end

function Romogg_OnCombat(pUnit, Event)
	Romogg:SendChatMessage(14, 0, "Boss Cho'gall not gonna be happy 'bout dis!")
	Romogg:PlaySoundToSet(18925)
	Romogg:RegisterEvent(Quake, math.random(20000, 38500), 0)
	Romogg:RegisterEvent(WoundingStrike, math.random(15000, 36000), 0)
	Romogg:RegisterEvent(CallForHelp, math.random(27000, 40000), 0)
	Romogg:RegisterEvent(ChainsOfWoe, 1, 0) -- Why? Because his health needs to be 66% in order to do this.
end

function Quake(pUnit, Event)
	Romogg:FullCastSpell(75272)
	Romogg:Root()
	Romogg:RegisterEvent(UnRootCrap, 3000, 1) -- 3 seconds, because the casting is 3 seconds + 2 seconds to unleash the Angered Earth.
end

function UnRootCrap(pUnit, Event)
Romogg:UnRoot()
end

function WoundingStrike(pUnit, Event)
local tank = Romogg:GetMainTank()
Romogg:FullCastSpellOnTarget(69651, tank)
end

function CallForHelp(pUnit, Event)
Romogg:FullCastSpell(82137)
end

function ChainsOfWoe(pUnit, Event)
	if(Romogg:GetHealthPct() <= 66) then
		Romogg:RemoveEvents() -- Back to line 12, this is why.
		Romogg:FullCastSpell(75539)
		Romogg:Root() -- If the players are scum-bags and move away from him, he might bug sometimes.
		Romogg:RegisterEvent(UnRootShit, 2000, 1) -- 2 seconds, because the casting of the spell is 2 seconds.
	end
end

function UnRootShit(pUnit, Event)
	Romogg:UnRoot()
	Romogg:FullCastSpell(75543)
	Romogg:SendChatMessage(42, 0, "Rom'ogg Bonecrusher prepares to unleash The Skullcracker on nearby enemies!")
	Romogg:SendChatMessage(14, 0, "Stand still! Rom'ogg crack your skulls!")
	Romogg:PlaySoundToSet(18927)
	Romogg:RegisterEvent(Quake1, math.random(20000,38500), 0)
	Romogg:RegisterEvent(WoundingStrike1, math.random(15000,36000), 0)
	Romogg:RegisterEvent(CallForHelp1, math.random(27000,40000), 0)
	Romogg:RegisterEvent(ChainsOfWoe1, 1, 0)
end

function Quake1(pUnit, Event)
	Romogg:FullCastSpell(75272)
	Romogg:Root()
	Romogg:RegisterEvent(UnRootCrap1, 3000, 1) -- 3 seconds, because the casting is 3 seconds + 2 seconds to unleash the Angered Earth. ^^
end

function UnRootCrap1(pUnit, Event)
	Romogg:UnRoot()
end

function WoundingStrike1(pUnit, Event)
	Romogg:FullCastSpellOnTarget(69651, Romogg:GetMainTank())
end

function CallForHelp1(pUnit, Event)
	Romogg:FullCastSpell(82137)
end

function ChainsOfWoe1(pUnit, Event)
	if(Romogg:GetHealthPct() <= 33) then
		Romogg:RemoveEvents()
		Romogg:FullCastSpell(75539)
		Romogg:Root()
		Romogg:RegisterEvent(UnRootShit1, 2000, 1)
	end
end

function UnRootShit1(pUnit, Event)
	Romogg:UnRoot()
	Romogg:FullCastSpell(75543)
	Romogg:SendChatMessage(42, 0, "Rom'ogg Bonecrusher prepares to unleash The Skullcracker on nearby enemies!")
	Romogg:SendChatMessage(14, 0, "Stand still! Rom'ogg crack your skulls!")
	--Romogg:PlaySoundToSet()
	Romogg:RegisterEvent(Quake2, math.random(20000,38500), 0)
	Romogg:RegisterEvent(WoundingStrike2, math.random(15000,36000), 0)
	Romogg:RegisterEvent(CallForHelp2, math.random(27000,40000), 0)
end

function Quake2(pUnit, Event)
	Romogg:FullCastSpell(75272)
	Romogg:Root()
	Romogg:RegisterEvent(UnRootCrap2, 3000, 1) -- 3 seconds, because the casting is 3 seconds + 2 seconds to unleash the Angered Earth. ^^
end

function UnRootCrap2(pUnit, Event)
	Romogg:UnRoot()
end

function WoundingStrike2(pUnit, Event)
	Romogg:FullCastSpellOnTarget(69651, Romogg:GetMainTank())
end

function CallForHelp2(pUnit, Event)
	Romogg:FullCastSpell(82137)
end

function Romogg_OnKilledPlayer(pUnit, Event)
	Romogg:SendChatMessage(14, 0, "That what you get! Nothing!")
	Romogg:PlaySoundToSet(18926)
end

function Romogg_OnDeath(pUnit, Event)
	Romogg:SendChatMessage(14, 0, "Rom'ogg...sorry...")
	Romogg:PlaySoundToSet(18928)
end

RegisterUnitEvent(39665, 18, "Romogg_OnSpawn")
RegisterUnitEvent(39665, 1, "Romogg_OnCombat")
RegisterUnitEvent(39665, 3, "Romogg_OnKilledPlayer")
RegisterUnitEvent(39665, 4, "Romogg_OnDeath")