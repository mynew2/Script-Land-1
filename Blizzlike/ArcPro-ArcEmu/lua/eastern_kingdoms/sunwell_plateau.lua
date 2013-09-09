--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation, BrantX, Shorts, Azolex
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

--[[
Spawn ID : 26246 = Velen
Spawn ID : 25246 = Liadrin

In Order, Start to Finish.
Mortal heroes, your victory here today was foretold long ago. My brother's anguished cry of defeat will echo across the universe, bringing renewed hope to all those who still stand against the Burning Crusade.
Sound ID : 12515
Talker : Velen

As the Legion's final defeat draws ever-nearer, stand proud in the knowledge that you have saved worlds without number from the flame.
Sound ID : 12516
Talker : Velen

Just as this day marks an ending, so too does it herald a new beginning...
Sound ID : 12517
Talker : Velen

The creature Entropius, whom you were forced to destroy, was once the noble naaru, M'uru. In life, M'uru channeled vast energies of Light and Hope. For a time, a misguided few sought to steal those energies... 
Sound ID : 12518
Talker : Velen

Our arrogance was unpardonable. We damned one of the most noble beings of all. We may never atone for this sin.
Sound ID : 12524
Talker : Liadrin

Then fortunate it is, that I have reclaimed the noble naaru's spark from where it fell! Where faith dwells, hope is never lost, young blood elf.
Sound ID: 12519
Talker : Velen

Can it be?
Sound ID : 12525
Talker : Liadrin

Gaze now, mortals - upon the Heat Of M'uru! Unblemished. Bathed by the light of Creation - just as it was at the Dawn.
Sound ID : 12520
Talker : Velen

In time, the light and hope held within - will rebirth more than this mere fount of power... Mayhap, they will rebirth the soul of a nation.
Sound ID : 12521
Talker : Velen

Blessed ancestors! I feel it... so much love... so much grace... there are... no words... impossible to describe...
Sound ID : 12526
Talker : Liadrin

Salvation, young one. It waits for us all.
Sound ID : 12522
Talker : Velen

Farewell...
Sound ID : 12523
Talker : Velen
--]]

--Sunblade Arch Mage.
function SunbladeArchMage_OnEnterCombat(pUnit,Event)
	pUnit:RegisterEvent("SunbladeArchMage_Arcane", 6000, 0)
	pUnit:RegisterEvent("SunbladeArchMage_FrostNova", 12000, 0)
end

function SunbladeArchMage_Arcane(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46553,pUnit:GetClosestPlayer())
end

function SunbladeArchMage_FrostNova(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46555,pUnit:GetClosestPlayer())
end

function SunbladeArchMage_OnLeaveCombat(pUnit,Event)
	pUnit:RemoveEvents()
end

function SunbladeArchMage_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(25367, 1, "SunbladeArchMage_OnEnterCombat")
RegisterUnitEvent(25367, 2, "SunbladeArchMage_OnLeaveCombat")
RegisterUnitEvent(25367, 4, "SunbladeArchMage_OnDied")

--Sunblade Cabalist.
function SunbladeCabalist_OnEnterCombat(pUnit,Event)
	pUnit:RegisterEvent("SunbladeCabalist_Shadow", 2000, 0)
	pUnit:RegisterEvent("SunbladeCabalist_Ignite", 7000, 0)
	pUnit:RegisterEvent("SunbladeCabalist_Imp", 80000, 0)
end

function SunbladeCabalist_Shadow(pUnit,Event)
	pUnit:FullCastSpellOnTarget(47248,pUnit:GetClosestPlayer())
end

function SunbladeCabalist_Ignite(pUnit,Event)
	pUnit:FullCastSpellOnTarget(47248,pUnit:GetRandomPlayer(0))
end

function SunbladeCabalist_Imp(pUnit,Event)
	pUnit:CastSpell(46544)
end

function SunbladeCabalist_OnLeaveCombat(pUnit,Event)
	pUnit:RemoveEvents()
end

function SunbladeCabalist_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(25363, 1, "SunbladeCabalist_OnEnterCombat")
RegisterUnitEvent(25363, 2, "SunbladeCabalist_OnLeaveCombat")
RegisterUnitEvent(25363, 4, "SunbladeCabalist_OnDied")

--Sunblade Dawn Priest.
function SunbladeDawnPriest_OnEnterCombat(pUnit,Event)
	pUnit:CastSpell(46565)
	pUnit:RegisterEvent("SunbladeDawnPriest_Holynova", 2000, 0)
	pUnit:RegisterEvent("SunbladeDawnPriest_Renew", 2000, 0)
end

function SunbladeDawnPriest_Holynova(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46564,pUnit:GetClosestPlayer())
end

function SunbladeDawnPriest_Renew(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46563,pUnit:GetRandomFriend())
	pUnit:CastSpell(46563)
end

function SunbladeDawnPriest_OnLeaveCombat(pUnit,Event)
	pUnit:RemoveEvents()
end

function SunbladeDawnPriest_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(25371, 1, "SunbladeDawnPriest_OnEnterCombat")
RegisterUnitEvent(25371, 2, "SunbladeDawnPriest_OnLeaveCombat")
RegisterUnitEvent(25371, 4, "SunbladeDawnPriest_OnDied")

--Sunblade Dragonhawk.
function SunbladeDragonHawk_OnEnterCombat(pUnit,Event)
	pUnit:RegisterEvent("SunbladeDragonHawk_Breath", 3500, 0)
end

function SunbladeDragonHawk_Breath(pUnit,Event)
	pUnit:FullCastSpellOnTarget(47251,pUnit:GetClosestPlayer())
end

function SunbladeDragonHawk_OnLeaveCombat(pUnit,Event)
	pUnit:RemoveEvents()
end

function SunbladeDragonHawk_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(25867, 1, "SunbladeDragonHawk_OnEnterCombat")
RegisterUnitEvent(25867, 2, "SunbladeDragonHawk_OnLeaveCombat")
RegisterUnitEvent(25867, 4, "SunbladeDragonHawk_OnDied")

--Sunblade Dusk Priest.
function SunbladeDuskPriest_OnEnterCombat(pUnit,Event)
	pUnit:RegisterEvent("SunbladeDuskPriest_SWP", 30000, 0)
	pUnit:RegisterEvent("SunbladeDuskPriest_MindFlay", 20000, 0)
	pUnit:RegisterEvent("SunbladeDuskPriest_Fear", 60000, 0)
end

function SunbladeDuskPriest_SWP(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46560,pUnit:GetClosestPlayer())
end

function SunbladeDuskPriest_MindFlay(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46562,pUnit:GetClosestPlayer())
end

function SunbladeDuskPriest_Fear(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46561,pUnit:GetClosestPlayer())
end

function SunbladeDuskPriest_OnLeaveCombat(pUnit,Event)
	pUnit:RemoveEvents()
end

function SunbladeDuskPriest_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(25370, 1, "SunbladeDuskPriest_OnEnterCombat")
RegisterUnitEvent(25370, 2, "SunbladeDuskPriest_OnLeaveCombat")
RegisterUnitEvent(25370, 4, "SunbladeDuskPriest_OnDied")

--Sunblade Protector
function SunbladeProtector_OnEnterCombat(pUnit,Event)
	pUnit:RegisterEvent("SunbladeProtector_Fel", 3000, 0)
end

function SunbladeProtector_Fel(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46480,pUnit:GetClosestPlayer())
end

function SunbladeProtector_OnLeaveCombat(pUnit,Event)
	pUnit:RemoveEvents()
end

function SunbladeProtector_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(25507, 1, "SunbladeProtector_OnEnterCombat")
RegisterUnitEvent(25507, 2, "SunbladeProtector_OnLeaveCombat")
RegisterUnitEvent(25507, 4, "SunbladeProtector_OnDied")

--Sunblade Scout
function SunbladeScout_OnEnterCombat(pUnit,Event)
	pUnit:RegisterEvent("SunbladeScout_Strike", 6000, 0)
end

function SunbladeScout_Strike(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46558,pUnit:GetClosestPlayer())
end

function SunbladeScout_OnLeaveCombat(pUnit,Event)
	pUnit:RemoveEvents()
end

function SunbladeScout_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(25372, 1, "SunbladeScout_OnEnterCombat")
RegisterUnitEvent(25372, 2, "SunbladeScout_OnLeaveCombat")
RegisterUnitEvent(25372, 4, "SunbladeScout_OnDied")

--Sunblade Slayer
function SunbladeSlayer_OnEnterCombat(pUnit,Event)
	pUnit:FullCastSpellOnTarget(47001,pUnit:GetClosestPlayer())
	pUnit:RegisterEvent("SunbladeSlayer_SlayShot", 11000, 0)
end

function SunbladeSlayer_SlayShot(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46557,pUnit:GetClosestPlayer())
end

function SunbladeSlayer_OnLeaveCombat(pUnit,Event)
	pUnit:RemoveEvents()
end

function SunbladeSlayer_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(25368, 1, "SunbladeSlayer_OnEnterCombat")
RegisterUnitEvent(25368, 2, "SunbladeSlayer_OnLeaveCombat")
RegisterUnitEvent(25368, 4, "SunbladeSlayer_OnDied")

--Sunblade Vindicator
function SunbladeVindicator_OnEnterCombat(pUnit,Event)
	pUnit:RegisterEvent("SunbladeVindicator_Strike", 120000, 0)
	pUnit:RegisterEvent("SunbladeVindicator_Cleave", 9000, 0)
end

function SunbladeVindicator_Strike(pUnit,Event)
	pUnit:FullCastSpellOnTarget(39171,pUnit:GetClosestPlayer())
end

function SunbladeVindicator_Cleave(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46559,pUnit:GetClosestPlayer())
end

function SunbladeVindicator_OnLeaveCombat(pUnit,Event)
	pUnit:RemoveEvents()
end

function SunbladeVindicator_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(25369, 1, "SunbladeVindicator_OnEnterCombat")
RegisterUnitEvent(25369, 2, "SunbladeVindicator_OnLeaveCombat")
RegisterUnitEvent(25369, 4, "SunbladeVindicator_OnDied")

--Shadowsword Assassin
function ShadowswordAssassin_OnEnterCombat(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46463,pUnit:GetClosestPlayer())
end

RegisterUnitEvent(25484, 1, "ShadowswordAssassin_OnEnterCombat")

--Shadowsword Lifeshaper
function ShadowswordLifeshaper_OnEnterCombat(pUnit,Event)
	pUnit:RegisterEvent("ShadowswordLifeshaper_HealthF", 60000, 0)
	pUnit:RegisterEvent("ShadowswordLifeshaper_Drain", 40000, 0)
end

function ShadowswordLifeshaper_HealthF(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46467,pUnit:GetRandomFriend())
end

function ShadowswordLifeshaper_Drain(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46466,pUnit:GetClosestPlayer())
end

function ShadowswordLifeshaper_OnLeaveCombat(pUnit,Event)
	pUnit:RemoveEvents()
end

function ShadowswordLifeshaper_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(25506, 1, "ShadowswordLifeshaper_OnEnterCombat")
RegisterUnitEvent(25506, 2, "ShadowswordLifeshaper_OnLeaveCombat")
RegisterUnitEvent(25506, 4, "ShadowswordLifeshaper_OnDied")

--Shadowsword Manafiend
function ShadowswordManafiend_OnEnterCombat(pUnit,Event)
	pUnit:RegisterEvent("ShadowswordManafiend_ArcExplosion", 9000, 0)
	pUnit:RegisterEvent("ShadowswordManafiend_DrainMana", 60000, 0)
end

function ShadowswordManafiend_ArcExplosion(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46457,pUnit:GetClosestPlayer())
end

function ShadowswordManafiend_DrainMana(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46453,pUnit:GetClosestPlayer())
end

function ShadowswordManafiend_OnLeaveCombat(pUnit,Event)
	pUnit:RemoveEvents()
end

function ShadowswordManafiend_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(25483, 1, "ShadowswordManafiend_OnEnterCombat")
RegisterUnitEvent(25483, 2, "ShadowswordManafiend_OnLeaveCombat")
RegisterUnitEvent(25483, 4, "ShadowswordManafiend_OnDied")

--Shadowsword Soulbinder
function ShadowswordSoulbinder_OnEnterCombat(pUnit,Event)
	pUnit:RegisterEvent("ShadowswordSoulbinder_FoD", 11000, 0)
	pUnit:RegisterEvent("ShadowswordSoulbinder_CoE", 30000, 0)
end

function ShadowswordSoulbinder_FoD(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46442,pUnit:GetClosestPlayer())
end

function ShadowswordSoulbinder_CoE(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46434,pUnit:GetClosestPlayer())
end

function ShadowswordSoulbinder_OnLeaveCombat(pUnit,Event)
	pUnit:RemoveEvents()
end

function ShadowswordSoulbinder_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(25373, 1, "ShadowswordSoulbinder_OnEnterCombat")
RegisterUnitEvent(25373, 2, "ShadowswordSoulbinder_OnLeaveCombat")
RegisterUnitEvent(25373, 4, "ShadowswordSoulbinder_OnDied")


--Shadowsword Vanquisher
function ShadowswordVanquisher_OnEnterCombat(pUnit,Event)
	pUnit:RegisterEvent("ShadowswordVanquisher_Cleave", 15000, 0)
	pUnit:RegisterEvent("ShadowswordVanquisher_Melt", 60000, 0)
end

function ShadowswordVanquisher_Cleave(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46468,pUnit:GetClosestPlayer())
end

function ShadowswordVanquisher_Melt(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46469,pUnit:GetClosestPlayer())
end

function ShadowswordVanquisher_OnLeaveCombat(pUnit,Event)
	pUnit:RemoveEvents()
end

function ShadowswordVanquisher_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(25486, 1, "ShadowswordVanquisher_OnEnterCombat")
RegisterUnitEvent(25486, 2, "ShadowswordVanquisher_OnLeaveCombat")
RegisterUnitEvent(25486, 4, "ShadowswordVanquisher_OnDied")

--Apocalypse Guard
function ApocalypseGuard_OnEnterCombat(pUnit,Event)
    pUnit:RegisterEvent("ApocalypseGuard_Cleave",5000,0)
    pUnit:RegisterEvent("ApocalypseGuard_Strike",3000,0)
    pUnit:RegisterEvent("ApocalypseGuard_Coil",15000,0)
    pUnit:RegisterEvent("ApocalypseGuard_Defense",1000,(1))
end

function ApocalypseGuard_Cleave(pUnit,Event)
    pUnit:FullCastSpellOnTarget(40504,pUnit:GetClosestPlayer())
end

function ApocalypseGuard_Strike(pUnit,Event)
    pUnit:FullCastSpellOnTarget(45029,pUnit:GetClosestPlayer())
end

function ApocalypseGuard_Coil(pUnit,Event)
    pUnit:FullCastSpellOnTarget(46283,pUnit:GetClosestPlayer())
end

function ApocalypseGuard_Defense(pUnit,Event)
    pUnit:CastSpell(46287)
end

function ApocalypseGuard_OnDied(pUnit,Event)
    pUnit:RemoveEvents()
end

function ApocalypseGuard_OnLeaveCombat(pUnit,Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent (25593, 1, "ApocalypseGuard_OnEnterCombat")
RegisterUnitEvent (25593, 2, "ApocalypseGuard_OnLeaveCombat")
RegisterUnitEvent (25593, 4, "ApocalypseGuard_OnDied")

--Cataclysm Hound
function CataclysmHound_OnEnterCombat(pUnit,Event)
	pUnit:RegisterEvent("CataclysmHound_Frenzy", 1000, 0)
	pUnit:RegisterEvent("CataclysmHound_CataBreath", 8000, 0)
end

function CataclysmHound_Frenzy(pUnit,Event)
	pUnit:FullCastSpellOnTarget(47399,pUnit:GetClosestPlayer())
end

function CataclysmHound_CataBreath(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46292,pUnit:GetClosestPlayer())
end

function CataclysmHound_OnLeaveCombat(pUnit,Event)
	pUnit:RemoveEvents()
end

function CataclysmHound_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(25599, 1, "CataclysmHound_OnEnterCombat")
RegisterUnitEvent(25599, 2, "CataclysmHound_OnEnterCombat")
RegisterUnitEvent(25599, 4, "CataclysmHound_OnEnterCombat")

--Chaos Gazer
function ChaosGazer_OnEnterCombat(pUnit,Event)
	pUnit:RegisterEvent("ChaosGazer_Petrify", 11000, 0)
	pUnit:RegisterEvent("ChaosGazer_TentacleSweep", 1000, 0)
end

function ChaosGazer_Petrify(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46288,pUnit:GetClosestPlayer())
end

function ChaosGazer_TentacleSweep(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46290,pUnit:GetClosestPlayer())
end

function ChaosGazer_OnLeaveCombat(pUnit,Event)
	pUnit:RemoveEvents()
end

function ChaosGazer_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(25595, 1, "ChaosGazer_OnEnterCombat")
RegisterUnitEvent(25595, 2, "ChaosGazer_OnLeaveCombat")
RegisterUnitEvent(25595, 4, "ChaosGazer_OnDied")

--Doomfire Destroyer
function DoomfireDestroyer_OnEnterCombat(pUnit,Event)
	pUnit:CastSpell(25592)
end

RegisterUnitEvent(25592, 1, "DoomfireDestroyer_OnEnterCombat")

--Oblivion Mage
function OblivionMage_OnEnterCombat(pUnit,Event)
	pUnit:RegisterEvent("OblivionMage_FlameBuffet", 3000, 0)
	pUnit:RegisterEvent("OblivionMage_Poly", 70000, 0)
end

function OblivionMage_FlameBuffet(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46279,pUnit:GetClosestPlayer())
end

function OblivionMage_Poly(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46280,pUnit:GetClosestPlayer())
end

function OblivionMage_OnLeaveCombat(pUnit,Event)
	pUnit:RemoveEvents()
end

function OblivionMage_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(25597, 1, "OblivionMage_OnEnterCombat")
RegisterUnitEvent(25597, 2, "OblivionMage_OnEnterCombat")
RegisterUnitEvent(25597, 4, "OblivionMage_OnEnterCombat")

--Priestess of Torment
function PriestessOfTorment_OnEnterCombat(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46271,pUnit:GetClosestPlayer())
	pUnit:RegisterEvent("PriestessOfTorment_Whirlwind", 7000, 0)
end

function PriestessOfTorment_Whirlwind(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46270,pUnit:GetClosestPlayer())
end

function PriestessOfTorment_OnLeaveCombat(pUnit,Event)
	pUnit:RemoveEvents()
end

function PriestessOfTorment_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(25509, 1, "PriestessOfTorment_OnEnterCombat")
RegisterUnitEvent(25509, 2, "PriestessOfTorment_OnLeaveCombat")
RegisterUnitEvent(25509, 4, "PriestessOfTorment_OnDied")

--Volatile Fiend
function VolatileFiend_OnEnterCombat(pUnit,Event)
	pUnit:RegisterEvent("VolatileFiend_FelFire", 7000, 0)
end

function VolatileFiend_FelFire(pUnit,Event)
	pUnit:FullCastSpellOnTarget(45779,pUnit:GetClosestPlayer())
end

function VolatileFiend_OnLeaveCombat(pUnit,Event)
	pUnit:RemoveEvents()
end

function VolatileFiend_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(25851, 1, "VolatileFiend_OnEnterCombat")
RegisterUnitEvent(25851, 2, "VolatileFiend_OnLeaveCombat")
RegisterUnitEvent(25851, 4, "VolatileFiend_OnDied")

--Volatile FelFire Fiend
function VolatileFelFireFiend_OnEnterCombat(pUnit,Event)
	pUnit:RegisterEvent("VolatileFelFireFiend_FelFire", 7000, 0)
end

function VolatileFelFireFiend_FelFire(pUnit,Event)
	pUnit:FullCastSpellOnTarget(45779,pUnit:GetClosestPlayer())
end

function VolatileFelFireFiend_OnLeaveCombat(pUnit,Event)
	pUnit:RemoveEvents()
end

function VolatileFelFireFiend_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(25598, 1, "VolatileFelFireFiend_OnEnterCombat")
RegisterUnitEvent(25598, 2, "VolatileFelFireFiend_OnLeaveCombat")
RegisterUnitEvent(25598, 4, "VolatileFelFireFiend_OnDied")

--Shadowsword Berserker
function ShadowswordBerserker_OnEnterCombat(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46160,pUnit:GetClosestPlayer())
end

RegisterUnitEvent(25798, 1, "ShadowswordBerserker_OnEnterCombat")

--Shadowsword Fury Mage
function ShadowswordFuryMage_OnEnterCombat(pUnit,Event)
	pUnit:CastSpell(46102)
	pUnit:RegisterEvent("ShadowswordFuryMage_FelFireball", 7000, 0)
end

function ShadowswordFuryMage_FelFireball(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46101,pUnit:GetClosestPlayer())
end

function ShadowswordFuryMage_OnLeaveCombat(pUnit,Event)
	pUnit:RemoveEvents()
end

function ShadowswordFuryMage_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(25799, 1, "ShadowswordFuryMage_OnEnterCombat")
RegisterUnitEvent(25799, 2, "ShadowswordFuryMage_OnLeaveCombat")
RegisterUnitEvent(25799, 4, "ShadowswordFuryMage_OnDied")

--Void Sentinel
function VoidSentinel_OnEnterCombat(pUnit,Event)
	pUnit:CastSpell(46087)
	pUnit:RegisterEvent("VoidSentinel_VoidBlast", 7000, 0)
end

function VoidSentinel_VoidBlast(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46161,pUnit:GetClosestPlayer())
end

function VoidSentinel_OnLeaveCombat(pUnit,Event)
	pUnit:RemoveEvents()
end

function VoidSentinel_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(25772, 1, "VoidSentinel_OnEnterCombat")
RegisterUnitEvent(25772, 2, "VoidSentinel_OnLeaveCombat")
RegisterUnitEvent(25772, 4, "VoidSentinel_OnDied")

--Void Spawn
function VoidSpawn_OnEnterCombat(pUnit,Event)
	pUnit:RegisterEvent("VoidSpawn_ShadowBolt", 4000, 0)
end

function VoidSpawn_ShadowBolt(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46082,pUnit:GetClosestPlayer())
end

function VoidSpawn_OnLeaveCombat(pUnit,Event)
	pUnit:RemoveEvents()
end

function VoidSpawn_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(25824, 1, "VoidSpawn_OnEnterCombat")
RegisterUnitEvent(25824, 2, "VoidSpawn_OnLeaveCombat")
RegisterUnitEvent(25824, 4, "VoidSpawn_OnDied")

--Shadowsword Commander
function ShadowswordCommander_OnEnterCombat(pUnit,Event)
	pUnit:RegisterEvent("ShadowswordCommander_SheildSlam", 3000, 0)
	pUnit:RegisterEvent("ShadowswordCommander_BattleShout", 40000, 0)
end

function ShadowswordCommander_SheildSlam(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46762,pUnit:GetClosestPlayer())
end

function ShadowswordCommander_BattleShout(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46763,pUnit:GetClosestPlayer())
end

function ShadowswordCommander_OnLeaveCombat(pUnit,Event)
	pUnit:RemoveEvents()
end

function ShadowswordCommander_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(25837, 1, "ShadowswordCommander_OnEnterCombat")
RegisterUnitEvent(25837, 2, "ShadowswordCommander_OnLeaveCombat")
RegisterUnitEvent(25837, 4, "ShadowswordCommander_OnDied")

--Shadowsword Deathbringer
function ShadowswordDeathbringer_OnEnterCombat(pUnit,Event)
	pUnit:RegisterEvent("ShadowswordDeathbringer_Spell", 6000, 0)
end

function ShadowswordDeathbringer_Spell(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46481,pUnit:GetClosestPlayer())
end

function ShadowswordDeathbringer_OnLeaveCombat(pUnit,Event)
	pUnit:RemoveEvents()
end

function ShadowswordDeathbringer_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(25485, 1, "ShadowswordDeathbringer_OnEnterCombat")
RegisterUnitEvent(25485, 2, "ShadowswordDeathbringer_OnLeaveCombat")
RegisterUnitEvent(25485, 4, "ShadowswordDeathbringer_OnDied")

--Shadowsword Guardian
function ShadowswordGuardian_OnEnterCombat(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46239,pUnit:GetClosestPlayer())
	pUnit:RegisterEvent("ShadowswordGuardian_Earthquake", 20000, 0)
end

function ShadowswordGuardian_Earthquake(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46240,pUnit:GetClosestPlayer())
end

function ShadowswordGuardian_OnLeaveCombat(pUnit,Event)
	pUnit:RemoveEvents()
end

function ShadowswordGuardian_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(25508, 1, "ShadowswordGuardian_OnEnterCombat")
RegisterUnitEvent(25508, 2, "ShadowswordGuardian_OnLeaveCombat")
RegisterUnitEvent(25508, 4, "ShadowswordGuardian_OnDied")


--Hand of The Deceiver
function HandOfTheDeceiver_OnEnterCombat(pUnit,Event)
	pUnit:SetUInt32Value(Unit_FIELD_CHANNEL_OBJECT,0)
	pUnit:SetUInt32Value(Unit_CHANNEL_SPELL,0)
	pUnit:RegisterEvent("HandOfTheDeceiver_ShadowInfusion", 1000,1)
	pUnit:RegisterEvent("HandOfTheDeceiver_FelfirePortal", 35000, 0)
	pUnit:RegisterEvent("HandOfTheDeceiver_Spell", 8000, 0)
end

function HandOfTheDeceiver_ShadowInfusion(pUnit,Event)
 if pUnit:GetHealthPct() == 20 then
	pUnit:CastSpell(45772)
end
end

function HandOfTheDeceiver_FelfirePortal(pUnit,Event)
	pUnit:SetCombatMeleeCapable(1)
	pUnit:CastSpell(46875)
	pUnit:RegisterEvent("HandOfTheDeceiver_FelfirePortalCombat", 6000, 1)
end

function HandOfTheDeceiver_FelfirePortalCombat(pUnit,Event)
	pUnit:SetCombatMeleeCapable(0)
end

function HandOfTheDeceiver_Spell(pUnit,Event)
	pUnit:FullCastSpellOnTarget(45770,pUnit:GetClosestPlayer())
end

function HandOfTheDeceiver_OnLeaveCombat(pUnit,Event)
	pUnit:RegisterEvent("HandOfTheDeceiver_LeaveWorld", 5000, 0)
	pUnit:RemoveEvents()
end

function HandOfTheDeceiver_OnDied(pUnit,Event)
	pUnit:Root()
	pUnit:RegisterEvent("HandOfTheDeceiver_LeaveWorld", 5000, 0)
end

function HandOfTheDeceiver_LeaveWorld(pUnit,Event)
	pUnit:RemoveFromWorld()
end

RegisterUnitEvent(25588, 1, "HandOfTheDeceiver_OnEnterCombat")
RegisterUnitEvent(25588, 2, "HandOfTheDeceiver_OnLeaveCombat")
RegisterUnitEvent(25588, 4, "HandOfTheDeceiver_OnDied")

function Teleporting_onUse(pUnit, Event, pMisc)
	pMisc:Teleport(530, 12804.165039, -6906.988281, 41.11567)
end

RegisterGameObjectEvent(455554, 2, "Teleporting_onUse")

--Lady Sacrolash AI Script
function Lady_OnCombat(pUnit, Event)
	setvars(pUnit, {AlyDead=0, LadyDead=0});
	pUnit:RegisterEvent("Confounding_Blow", 30000, 0)
	pUnit:RegisterEvent("ShadowNova", 35000, 0)
	pUnit:RegisterEvent("ShadowBlades", 15000, 0)
	pUnit:RegisterEvent("DarkTouched", 25000, 0)
	pUnit:RegisterEvent("LadyPhase2", 1000, 0)
	pUnit:RegisterEvent("LadyEnrage", 360000, 1)
end

function LadyPhase2(pUnit, Event)
	local args = getvars(pUnit);
	if(args.AlyDead == 1) then
		pUnit:SendChatMessage(14, 0, "Alythess! Your fire burns within me!")
		pUnit:PlaySoundToSet(12488)
		pUnit:RegisterEvent("LadyConflag",20000,0)
	end
end
		
function Lady_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()	
end

function Lady_OnKilledTarget(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Shadows engulf.")
	pUnit:PlaySoundToSet(12486)
end

function Lady_OnDied(pUnit, Event)
	local args = getvars(pUnit);
	local chance = math.random(1, 2)
	pUnit:RemoveEvents()
	if(chance == 1) then
		pUnit:SendChatMessage(12, 0, "I... fade.")
	elseif(chance == 2) then
		pUnit:SendChatMessage(12, 0, "Misery...confusion...mistrust. These are the hallmarks.")
	end
	args.LadyDead=1;
	setvars(pUnit, args);
end

function ShadowFury(pUnit, Event)
	pUnit:CastSpell(45270)	
end

function ConfoundingBlow(pUnit, Event)
	pUnit:CastSpellOnTarget(45256, pUnitGetRandomTarget(0))	
end

function ShadowNova(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Shadow to the aid of fire!")
	pUnit:PlaySoundToSet(12485)
	pUnit:FullCastSpell(45329)	
end

function DarkStrike(pUnit, Event)
	pUnit:CastSpellOnTarget(45271, pUnit:GetRandomTarget(0))	
end

function ShadowBlades(pUnit, Event)
	pUnit:CastSpellOnTarget(45248, pUnit:GetMainTank())
	pUnit:RegisterEvent(Dark_Strike, 1000, 1)
end

function DarkTouched(pUnit, Event)
	pUnit:CastSpellOnTarget(45347, pUnit:GetRandomTarget(0))	
end

function LadyConflag(pUnit, Event)
	pUnit:FullCastSpellOnTarget(45342, pUnit:GetMainTank())
end

function LadyEnrage(pUnit, Event)
	pUnit:CastSpell(26662)
end		

RegisterUnitEvent(25165, 1, "Lady_OnCombat")
RegisterUnitEvent(25165, 2, "Lady_OnLeaveCombat")
RegisterUnitEvent(25165, 3, "Lady_OnKilledTarget")
RegisterUnitEvent(25165, 4, "Lady_OnDied")

--Grand Warlock Alythess AI Script
function Warlock_OnCombat(pUnit, Event)
	setvars(pUnit, {AlyDead=0, LadyDead=0});
	pUnit:RegisterEvent("Flame_Touched", 15000, 0)
	pUnit:RegisterEvent("Pyrogenics", 1000, 1)
	pUnit:RegisterEvent("Flame_Sear", 20000, 0)
	pUnit:RegisterEvent("Conflagration", 20000, 0)
	pUnit:RegisterEvent("WarlockPhase2", 1000, 0)
	pUnit:RegisterEvent("AlyEnrage", 360000, 1)
end

function WarlockPhase2(pUnit, Event)
	local args = getvars(pUnit);
	if(args.LadyDead == 1) then
		pUnit:SendChatMessage(14, 0, "Sacrolash!")
		pUnit:PlaySoundToSet(12492)
		pUnit:RegisterEvent("AlyShadowNova", 35000, 0)
	end
end

function Warlock_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()	
end

function Warlock_OnKilledTarget(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Fires consume.")	
end

function Warlock_OnDied(pUnit, Event)
	local args = getvars(pUnit);
	pUnit:RemoveEvents()
	if(chance == 1) then
		pUnit:SendChatMessage(12, 0, "Depravity...hatred...chaos. These are the pillars.")
	elseif(chance == 2) then
		pUnit:SendChatMessage(12, 0, "Der'ek... manul.")
	end
	pUnit:PlaySoundToSet(12494)
	args.AlyDead=1;
	setvars(pUnit, args);
end

function FlameSear(pUnit, Event)
	pUnit:CastSpellOnTarget(46771, pUnit:GetRandomTarget(0))
	pUnit:CastSpellOnTarget(46771, pUnit:GetRandomTarget(0))
	pUnit:CastSpellOnTarget(46771, pUnit:GetRandomTarget(0))
end

function Conflagration(pUnit, Event)
	pUnit:PlaySoundToSet(12489)
	pUnit:SendChatMessage(14, 0, "Fire to the aid of shadow!")
	pUnit:FullCastSpellOnTarget(45342, pUnit:GetMainTank())	
end

function FlameTouched(pUnit, Event)
	pUnit:CastSpellOnTarget(45348, pUnit:GetRandomTarget(0))	
end

function Pyrogenics(pUnit, Event)
	pUnit:CastSpell(45230)	
end

function AlyShadowNova(pUnit, Event)
	pUnit:FullCastSpell(45329)	
end


function AlyEnrage(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Edir harach!")
	pUnit:CastSpell(26662)
end

RegisterUnitEvent(25166, 1, "Warlock_OnCombat")
RegisterUnitEvent(25166, 2, "Warlock_OnLeaveCombat")
RegisterUnitEvent(25166, 3, "Warlock_OnKilledTarget")
RegisterUnitEvent(25166, 4, "Warlock_OnDied")

--[[Brutallus yells: Bagh! Your magic is weak!
Brutallus yells: Come try your luck!
Brutallus yells: Puny lizard! Death is the only answer you'll find here!
Brutallus yells: That was fun, but I still await a true challenge!]]

function Brut_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Ah, more lambs to the slaughter!")
	pUnit:PlaySoundToSet(12463)
	pUnit:RegisterEvent("Combat_Talk", 30000, 0)
	--pUnit:RegisterEvent("Meteor_Slash", 60000, 0)
	pUnit:RegisterEvent("Burn", 70000, 0)
	pUnit:RegisterEvent("Stomp", 45000, 0)
	pUnit:RegisterEvent("Enrage", 360000, 1)
end

function Brut_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()	
end

function Brut_OnKilledTarget (pUnit, Event)
	local Choice = math.random(1, 3)
	if(Choice == 1) then
		pUnit:SendChatMessage(14, 0, "Perish, insect!")
		pUnit:PlaySoundToSet(12464)
	elseif(Choice == 2) then
		pUnit:SendChatMessage(14, 0, "You are meat!")
		pUnit:PlaySoundToSet(12465)
	elseif(Choice == 3) then
		pUnit:SendChatMessage(14, 0, "Too easy!")
		pUnit:PlaySoundToSet(12466)
	end
end

function Brut_OnDied(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Agghh! Well done! Now this gets... interesting...")
	pUnit:PlaySoundToSet(12471)
	pUnit:RemoveEvents()	
end


function Enrage(pUnit, Event)
	pUnit:CastSpell(26662)
	pUnit:SendChatMessage(14, 0, "So much for a real challenge. Die!")
	pUnit:PlaySoundToSet(12470)
end

function Stomp(pUnit, Event)
	local stomptarget = pUnit:GetMainTank();
	pUnit:FullCastSpellOnTarget(45185, stomptarget)
	stomptarget:RemoveAura(46394)	
end

function Burn(pUnit, Event)
	pUnit:CastSpellOnTarget(46394, pUnit:GetRandomPlayer(0))	
end

--[[function Meteor_Slash(pUnit, Event)
	pUnit:FullCastSpell(45150)
end]]

function Combat_Talk(pUnit, Event)
	local Choice = math.random(1, 3)
	if(Choice == 1) then
		pUnit:SendChatMessage(14, 0, "I will crush you!")
		pUnit:PlaySoundToSet(12467)
	elseif(Choice == 2) then
		pUnit:SendChatMessage(14, 0, "Another day, another glorious battle!")
		pUnit:PlaySoundToSet(12468)
	elseif(Choice == 3) then
		pUnit:SendChatMessage(14, 0, "I live for this!")
		pUnit:PlaySoundToSet(12469)
	end	
end

RegisterUnitEvent(24882, 1, "Brut_OnCombat")
RegisterUnitEvent(24882, 2, "Brut_OnLeaveCombat")
RegisterUnitEvent(24882, 3, "Brut_OnKilledTarget")
RegisterUnitEvent(24882, 4, "Brut_OnDied")

function Felmyst_OnEnterCombat(Unit,Event)
	Unit:Land()
	Unit:RegisterEvent("Felmyst_Cleave", 20000, 0)
	Unit:RegisterEvent("Felmyst_Corrosion", 36000, 0)
	Unit:RegisterEvent("Felmyst_GasNova", 30000, 0)
	Unit:RegisterEvent("Felmyst_NoxiousFumes", 27000, 0)
	Unit:RegisterEvent("Felmyst_Encapsulate", 45000, 0)
	--Unit:RegisterEvent("Felmyst_FogofCorruption", 000, 0)
	Unit:RegisterEvent("Felmyst_Enrage", 600000, 0)
	Unit:RegisterEvent("Felmyst_Phase2", 75000, 0)
end

function Felmyst_OnSpawn(Unit,Event)
	Unit:SetFlying()
	--Unit:MoveTo(X,Y,Z) She needs to move to the raid, Flys in and then lands.
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"Glory to Kil'jaeden! Death to all who oppose!")
end

function Felmyst_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function Felmyst_OnDied(Unit,Event)
	Unit:RemoveEvents()
	--Unit:SpawnCreature(ID,X,Y,Z,O,Faction,0)
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"Kil'jaeden... will... prevail...")
end

function Felmyst_OnKilledPlayer(Unit,Event)
	local Choice = math.random(1, 2)
	if(Choice == 1) then
		pUnit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "I kill for the master!")
	elseif(Choice == 2) then
		pUnit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "The end has come!")
	end
end

function Felmyst_Phase2(Unit,Event)
	Unit:SetFlying()
	Unit:RegisterEvent("Felmyst_DemonicVapor",000,0)
	Unit:RegisterEvent("Felmyst_Land",000,0)
end

RegisterUnitEvent(25038, 1, "Felmyst_OnEnterCombat")
RegisterUnitEvent(25038, 2, "Felmyst_OnLeaveCombat")
RegisterUnitEvent(25038, 3, "Felmyst_OnKilledPlayer")
RegisterUnitEvent(25038, 4, "Felmyst_OnDied")

function HandOfDeceiverVisual_OnSpawn(Unit,Event)
	Unit:FullCastSpell(51795)
	Unit:RegisterEvent("HandOfDeceiverVisual_Channel", 10000, 0)
end

function HandOfDeceiverVisual_Channel(Unit,Event)
	Unit:FullCastSpell(51795)
end

RegisterUnitEvent(25955, 18, "HandOfDeceiverVisual_OnSpawn")

--[[Kalecgos yells: Agghh!! Help me before I lose my mind!
Kalecgos yells: Another orb is ready! Make haste!
Kalecgos yells: Anveena I love you! Focus on my voice! Come back for me now! Only you can cleanse the Sunwell!
Kalecgos yells: Anveena, you must awaken! This world needs you!
Kalecgos yells: Hurry! There is not much of me left!
Kalecgos yells: I have channeled all I can! The power is in your hands!
Kalecgos yells: I have empowered another orb! Use it quickly!
Kalecgos yells: I need... your help! Cannot... resist him much longer!
Kalecgos yells: I will channel my powers into the orbs! Be ready!
Kalecgos yells: Madrigosa deserved a far better fate. You did what had to be done, but this battle is far from over!
Kalecgos yells: My awakening is complete! You shall all perish!
Kalecgos yells: Strike now heroes, while he is weakened! Vanquish the Deceiver!
Kalecgos yells: There is no time to waste!
Kalecgos yells: Yes Anveena! Let fate embrace you now!
Kalecgos yells: You are not alone! The blue dragonflight shall help you vanquish the Deceiver!
Kalecgos yells: You must let go! You must become what you were always meant to be! The time is now Anveena!
Kalecgos says: Goodbye Anveena, my love. Few will remember your name, yet this day you changed the course of destiny. What was once corrupt, is now pure. Heroes, do not let her sacrifice be in vain.
Kalecgos says: I am forever in your debt. Once we have triumphed over Kil'jaeden, this entire world will be in your debt as well.
Kalecgos says: Kil'jaeden must be destroyed!
Kalecgos says: The fate of the world hangs in the balance!
Kalecgos says: There is no time to waste!]]

function Kel_SpectralExhaustion(pUnit, Event)
	pUnit:CastSpell(44867)
end

function Kel_SpectralRealm(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "I will purge you!")
	pUnit:PlaySoundToSet(12423)
	pUnit:CastSpellOnTarget(46021, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("Kel_SpectralExhaustion", 60000, 1)
end

function Kel_SpectralBlast(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Your pain has only begun!")
	pUnit:PlaySoundToSet(12424)
	pUnit:CastSpellOnTarget(44866, pUnit:GetMainTank())
	pUnit:RegisterEvent("Kel_SpectralRealm", 1000, 1)
end

function Kel_WildMagic(pUnit, Event)
local Choice = math.random(1, 5)
	if(Choice == 1) then
		pUnit:CastSpell(44978)
	elseif(Choice == 2) then
		pUnit:CastSpell(45001)
	elseif(Choice == 3) then
		pUnit:CastSpell(45002)
	elseif(Choice == 4) then
		pUnit:CastSpell(45004)
	elseif(Choice == 5) then
		pUnit:CastSpell(45006)
	end
end

function Kel_FrostBreath(pUnit)
	pUnit:FullCastSpell(44799)	
end

function Kel_ArcaneBuffet(pUnit, Event)
	pUnit:CastSpell(45018)
end

function Kel_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Aggh!! No longer will I be a slave to Malygos! Challenge me and you will be destroyed!")
	pUnit:PlaySoundToSet(12422)
	pUnit:RegisterEvent("Kel_ArcaneBuffet", 5000, 0)
	pUnit:RegisterEvent("Kel_FrostBreath", 35000, 0)
	pUnit:RegisterEvent("Kel_WildMagic", 20000, 0)
	pUnit:RegisterEvent("Kel_SpectralBlast", 30000, 0)
end

function Kel_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()	
end

function Kel_OnKilledTarget(pUnit, Event)
	local Choice = math.random(1, 2)
	if(Choice == 1) then
		pUnit:SendChatMessage(14, 0, "In the name of Kil'jaeden!")
		pUnit:PlaySoundToSet(12425)
	elseif(Choice == 2) then
		pUnit:SencChatMessage(14, 0, "You were warned!")
		pUnit:PlaySoundToSet(12426)
	end	
end

function Kel_OnDied(pUnit, Event)
	pUnit:RemoveEvents()	
end

RegisterUnitEvent(24850, 1, "Kel_OnCombat")
RegisterUnitEvent(24850, 2, "Kel_OnLeaveCombat")
RegisterUnitEvent(24850, 3, "Kel_OnKilledTarget")
RegisterUnitEvent(24850, 4, "Kel_OnDied")

function Velen_OnSpawn(pUnit,Event)
	pUnit:RegisterEvent("Velen_Talk1", 4000, 1)
end

function Liadrin_OnSpawn(pUnit,Event)
	pUnit:RegisterEvent("Liadrin_Talk", 81000, 0)
end

function Velen_Talk1(pUnit,Event)
	pUnit:SendChatMessage(14, 0, "Mortal heroes, your victory here today was foretold long ago. My brother's anguished cry of defeat will echo across the universe, bringing renewed hope to all those who still stand against the Burning Crusade. ")
	pUnit:RegisterEvent("Velen_Talk2",25000, 1)
	pUnit:PlaySoundToSet(12515)
end

function Velen_Talk2(pUnit,Event)
	pUnit:SendChatMessage(14, 0, "As the Legion's final defeat draws ever-nearer, stand proud in the knowledge that you have saved worlds without number from the flame.")
	pUnit:PlaySoundToSet(12516)
	pUnit:RegisterEvent("Velen_Talk2part2",14000, 1)
	pUnit:RegisterEvent("Velen_Talk3",24000, 1)
	end

function Velen_Talk2part2(pUnit,Event)
	pUnit:SendChatMessage(14, 0, "Just as this day marks an ending, so too does it herald a new beginning...")
	pUnit:PlaySoundToSet(12517)
end

function Velen_Talk3(pUnit,Event)
	pUnit:SendChatMessage(14, 0, "The creature Entropius, whom you were forced to destroy, was once the noble naaru, M'uru. In life, M'uru channeled vast energies of Light and Hope. For a time, a misguided few sought to steal those energies... ")
	pUnit:PlaySoundToSet(12518)
	pUnit:RegisterEvent("Velen_Talk4",32000, 1)
	end

function Liadrin_Talk(pUnit,Event)
	pUnit:SendChatMessage(14, 0, "Our arrogance was unpardonable. We damned one of the most noble beings of all. We may never atone for this sin. ")
	pUnit:PlaySoundToSet(12524)
	pUnit:RegisterEvent("Liadrin_Talk2",9000, 1)
	end

function Velen_Talk4(pUnit,Event)
	pUnit:SendChatMessage(14, 0, "Then fortunate it is, that I have reclaimed the noble naaru's spark from where it fell! Where faith dwells, hope is never lost, young blood elf. ")
	pUnit:PlaySoundToSet(12519)
	pUnit:RegisterEvent("Velen_Talk5",5000, 1)
end

function Liadrin_Talk2(pUnit,Event)
	pUnit:SendChatMessage(14, 0, "Can it be?")
	pUnit:PlaySoundToSet(12525)
	pUnit:RegisterEvent("Liadrin_Talk3",2000, 1)
end

function Velen_Talk5(pUnit,Event)
	pUnit:SendChatMessage(14, 0, "Gaze now, mortals - upon the Heat Of M'uru! Unblemished. Bathed by the light of Creation - just as it was at the Dawn. ")
	pUnit:PlaySoundToSet(12519)
	pUnit:RegisterEvent("Velen_Talk6",16000, 1)
end

function Velen_Talk6(pUnit,Event)
	pUnit:SendChatMessage(14, 0, "In time, the light and hope held within - will rebirth more than this mere fount of power... Mayhap, they will rebirth the soul of a nation. ")
	pUnit:PlaySoundToSet(12521)
	pUnit:RegisterEvent("Velen_Talk7",15000, 1)
end

function Liadrin_Talk3(pUnit,Event)
	pUnit:SendChatMessage(14, 0, "Blessed ancestors! I feel it... so much love... so much grace... there are... no words... impossible to describe...")
	pUnit:PlaySoundToSet(12525)
	pUnit:RegisterEvent("Liadrin_Talk3",31000, 1)
end

function Velen_Talk7(pUnit,Event)
	pUnit:SendChatMessage(14, 0, "Salvation, young one. It waits for us all. ")
	pUnit:PlaySoundToSet(12522)
	pUnit:RegisterEvent("Velen_Talk8",6000, 1)
end

function Velen_Talk8(pUnit,Event)
	pUnit:SendChatMessage(14, 0, "Farewell... ")
	pUnit:PlaySoundToSet(12523)
end

RegisterUnitEvent(26246, 6, "Velen_OnSpawn")
RegisterUnitEvent(26247, 6, "Liadrin_OnSpawn")

local kiljaeden = 25315
local cn_kiljaeden = nil
local kiljaedendummy = nil
local handofkiljaeden = 25588
local handaddtable = {}
local anveena = nil
local blueorbs = {}
local startbl = {}
local spawnpts = {}
local activatedorbs = {}
local justspawned = {}
local spawnedorbs = false
spawnpts.x = {1747.962891,1695.568115,1652.105713,1705.071899}
spawnpts.y = {620.713135,676.063477,635.099670,582.911438 }
spawnpts.z = {28.050375,28.050201,28.125195,28.141369 }
spawnpts.o = {2.964534,4.755246,6.129690,1.743238}

for i = 1, 3 do 
	handaddtable[i] = 1
end
startbl[1] = 1
blueorbs[1] = 1

function Kiljaeden_SpawnOrbs(Unit)
	if(spawnedorbs == false) then
		spawnedorbs = true
		Unit:SpawnGameObject(188116,spawnpts.x[1],spawnpts.y[1],spawnpts.z[1],spawnpts.o[1],0)
		Unit:SpawnGameObject(187869,spawnpts.x[2],spawnpts.y[2],spawnpts.z[2],spawnpts.o[2],0)
		Unit:SpawnGameObject(188114,spawnpts.x[3],spawnpts.y[3],spawnpts.z[3],spawnpts.o[3],0)
		Unit:SpawnGameObject(188115,spawnpts.x[4],spawnpts.y[4],spawnpts.z[4],spawnpts.o[4],0)
	end
	if(spawnedorbs == true) then
		spawnedorbs = false
	end
end

function HandOfKil_OnSpawn(Unit)
	if(Unit:GetEntry() == 25588) then
		Unit:DisableRespawn()
		for k,v in pairs(handaddtable) do
			if v == 1 then
				table.remove(handaddtable,k)
				table.insert(handaddtable,Unit)
				break
			end
		end
		for k,v in pairs(startbl) do
			if v == 1 then
				table.remove(startbl,k)
				table.insert(startbl,Unit:SpawnCreature(25608,1699.204712,628.331482,27.618011,Unit:GetO(),Unit:GetUInt32Value(UnitField.Unit_FIELD_FACTIONTEMPLATE),0))
				table.insert(startbl,Unit:SpawnCreature(26046,1698.896729,629.173546,55.558176,Unit:GetO(), 35,0))
				break
			end
		end
		for k,v in pairs(blueorbs) do
			if v == 1 then
				table.remove(blueorbs,k)
				--Spawn the blue orbs
				Kiljaeden_SpawnOrbs(Unit)
				break;
			end
		end
		
		for k,v in pairs(startbl) do
			if v~= nil and v:GetEntry() == 25608 then
				kiljaedendummy = v;
			elseif v~=nil and v:GetEntry() == 26046 then
				anveena = v;
			end
		end
		for k,v in pairs(blueorbs) do
			if v == 1 then
				table.remove(blueorbs,k)
				break
			end
		end
		for k,v in pairs(handaddtable) do
			if v~= nil and type(v) ~= "number" then
				v:SetUInt32Value(UnitField.Unit_FIELD_CHANNEL_OBJECT,kiljaedendummy:GetGUID())
				v:SetUInt32Value(UnitField.Unit_CHANNEL_SPELL,46757)
			end
		end
	end
end

function HandOfKil_OnCombat(Unit)
	Unit:RemoveFlag(UnitField.Unit_FIELD_CHANNEL_OBJECT,Unit:GetUInt32Value(UnitField.Unit_FIELD_CHANNEL_OBJECT));
	Unit:RemoveFlag(UnitField.Unit_CHANNEL_SPELL,Unit:GetUInt32Value(UnitField.Unit_CHANNEL_SPELL))
	Unit:RegisterEvent("HandOfKil_ShadowBoltVolley",15000, 0)
	Unit:RegisterEvent("HandOfKil_FelFirePortal", 20000, 0)
	Unit:RegisterAIUpdateEvent(1000)
end

function HandOfKil_OnDeath(Unit)
	Unit:RemoveEvents()
	Unit:RemoveAIUpdateEvent()
	for k,v in pairs(handaddtable) do
		if(v ==  Unit) then
			table.remove(handaddtable, k)
		end
	end
end

function HandOfKil_OnWipe(Unit)
	for k,v in pairs(handaddtable) do
		if(v == Unit) then
			table.remove(handaddtable,k)
		end
	end
	Unit:RemoveEvents()
	Unit:RemoveAIUpdateEvent()
	Unit:RemoveFromWorld()
end

function HandOfKil_ShadowBoltVolley(Unit)
	if(Unit:GetRandomPlayer(0)) then
		Unit:FullCastSpell(45770)
	end
end

function HandOfKil_FelFirePortal(Unit)
	Unit:FullCastSpell(46875)
end

function HandOfKil_AIUpdate(Unit)
	if(Unit:GetHealthPct() <= 25) then
		Unit:FullCastSpell(45772)
		Unit:RemoveAIUpdateEvent()
	end
end

RegisterUnitEvent(handofkiljaeden, 18, "HandOfKil_OnSpawn")
RegisterUnitEvent(handofkiljaeden, 1, "HandOfKil_OnCombat")
RegisterUnitEvent(handofkiljaeden, 2, "HandOfKil_OnWipe")
RegisterUnitEvent(handofkiljaeden, 4, "HandOfKil_OnDeath")

function KilJaedenDummy_OnSpawn(Unit)
	Unit:EnableFlight()
	Unit:SetUInt32Value(UnitField.Unit_FIELD_FLAGS, UnitFieldFlags.Unit_FLAG_NOT_SELECTABLE+UnitFieldFlags.Unit_FLAG_NOT_ATTACKABLE_9)
	Unit:SetUInt32Value(UnitField.Unit_FIELD_MAXHEALTH, 1000000)
	Unit:SetUInt32Value(UnitField.Unit_FIELD_HEALTH, 1000000)
	Unit:DisableRespawn()
	Unit:SetCombatCapable(1)
	Unit:SetCombatTargetingCapable(1)
	Unit:RegisterAIUpdateEvent(1000)
	Unit:RegisterEvent("KilJaeden_PeriodicOrders", 2000, 1)
	Unit:RegisterEvent("InitializeKilJaedenDummy", 1000, 1)
end

function InitializeKilJaedenDummy(Unit)
	Unit:FullCastSpell(46410)
end

function KilJaeden_PeriodicOrders(Unit)
	local rand = tonumber(math.random(1, 5))
	if(rand == 1) then
		Unit:PlaySoundToSet(12495)
		return
	end
	if(rand == 2) then	
		Unit:PlaySoundToSet(12496)
		return
	end
	if(rand == 3) then
		Unit:PlaySoundToSet(12497)
		return
	end
	if(rand == 4) then
		Unit:PlaySoundToSet(12498)
		return
	end
	if(rand == 5) then
		Unit:PlaySoundToSet(12499)
		return
	end
	Unit:RegisterEvent("KilJaeden_PeriodicOrders", 20000, 1)
end

function KilJaedenDummy_AIUpdate(Unit)
	if(Unit:GetEntry() == 25608) then
		Unit:WipeThreatList()
		local no = table.getn(handaddtable)
		if((no ~= nil) and (no == 0)) then
			cn_kiljaeden = Unit:SpawnCreature(kiljaeden, 1699.204712, 628.331482, Unit:GetZ(), Unit:GetO(), Unit:GetUInt32Value(UnitField.Unit_FIELD_FACTIONTEMPLATE), 0)
			Unit:RemoveEvents()
			Unit:RemoveAIUpdateEvent()
			Unit:RemoveFromWorld()
		end
	end
end

RegisterUnitEvent(handofkiljaeden, 21, "HandOfKil_AIUpdate")
RegisterUnitEvent(25608, 18, "KilJaedenDummy_OnSpawn")
RegisterUnitEvent(25608, 21, "KilJaedenDummy_AIUpdate")

function AnveenaOnSpawn(Unit)
	Unit:EnableFlight()
	Unit:SetCombatMeleeCapable(1)
	Unit:SetUInt32Value(UnitField.Unit_FIELD_FLAGS, UnitFieldFlags.Unit_FLAG_NOT_ATTACKABLE_9)
	Unit:RegisterEvent("InitializeAnveena",500,1)
end

RegisterUnitEvent(26046, 18, "AnveenaOnSpawn")

function InitializeAnveena(Unit)
	Unit:FullCastSpell(46367)
	Unit:MoveTo(Unit:GetX(), Unit:GetY(), Unit:GetZ()+1, Unit:GetO())
end

function InitializeFelFirePortal(Unit)
	Unit:SetCombatTargetingCapable(1)
	Unit:SetCombatMeleeCapable(1)
	Unit:FullCastSpell(46464)
	Unit:WipeThreatList()
end

RegisterUnitEvent(25603, 18, "InitializeFelFirePortal")


function VolatileFiend_OnSpawn(Unit)
	Unit:RegisterEvent("InitializeFiend", 500, 1)
end

function InitializeFiend(Unit)
	Unit:DisableRespawn()
	Unit:SetCombatCapable(1)
	Unit:RegisterAIUpdateEvent(500)
	local plr = Unit:GetRandomPlayer(0)
	if(plr~= nil) then
		Unit:SetNextTarget(plr)
		Unit:SetUnitToFollow(plr, 3, 45)
	end
end
function VolatileFiend_AIUpdate(Unit)
	local tar = Unit:GetNextTarget()
	if((tar ~= nil) and (Unit:CalcDistance(tar) <= 5)) then
		Unit:FullCastSpell(45779)
		Unit:RemoveFromWorld()
	end
end
function VolatileFied_OnDeath(Unit)
	Unit:FullCastSpell(45779)
	Unit:RemoveAIUpdateEvent()
end

RegisterUnitEvent(25598, 18, "VolatileFiend_OnSpawn")
RegisterUnitEvent(25598, 21, "VolatileFiend_AIUpdate")
RegisterUnitEvent(25598, 4, "VolatileFied_OnDeath")

local legion_light =nil
local soul_flay = nil
local fire_bloom =nil
local shadow_spike = nil
local flame_dart =nil
local meteor_timer = nil
local shield_orbs = nil
local shield_orbtable = {}
local shield_orbtimer = nil
local soul_darkness = nil
local cancast = true
local castmeteor = false
local m_phase = nil
local meteors = 0
local sinister_reflect = false;
local kalec = nil
local saytable = {phase3say = false,phase4say = false,phase5say = false, orbsay1 = false, orbsay2 = false, orbsay3 = false, kalecsay1 = false,kalecsay2 = false,kalecsay3 = false,kalecsay4 = false, anveenasay1 = false,anveenasay2 = false,
anveenasay3 = false, anveenasay4 = false,kalecsay5 = false,kalecintrosay = false,introsay = false}

function KilJaeden_OnSpawn(Unit)
	Unit:RegisterEvent("InitializeKilJaeden", 500, 1)
	Unit:EnableFlight()
	Unit:StopMovement(100)
	Unit:DisableRespawn()
	Unit:SetUInt32Value(UnitField.Unit_FIELD_FLAGS, UnitFieldFlags.Unit_FLAG_NOT_SELECTABLE + UnitFieldFlags.Unit_FLAG_NOT_ATTACKABLE_9)
	Unit:SetCombatMeleeCapable(1)
	Unit:RegisterEvent("KiljaedenBattleReady", 10500, 1)
end

function InitializeKilJaeden(Unit)
	Unit:FullCastSpell(26586)
	Unit:CastSpell(47115)
end

function KiljaedenBattleReady(Unit)
	Unit:RemoveFlag(UnitField.Unit_FIELD_FLAGS, UnitFieldFlags.Unit_FLAG_NOT_SELECTABLE+UnitFieldFlags.Unit_FLAG_NOT_ATTACKABLE_9)
	Unit:SetCombatCapable(0)
	local plr = Unit:GetRandomPlayer(0)
	Unit:AttackReaction(plr, 1)
end

function KilJaeden_OnCombat(Unit)
	Unit:RemoveEvents()
	Unit:RegisterAIUpdateEvent(1000)
	m_phase = 1
	KilJaeden_PhaseCheck(Unit)
	saytable.introsay = true
	KilJaeden_Gossip(Unit)
	saytable.kalecintrosay = true
	Unit:RegisterEvent("KilJaeden_Gossip", 25000, 1)
	kalec = Unit:SpawnCreature(25319, 1699.204712, 628.331482, 27.558220+100.000000, Unit:GetO(), 35, 0)
end

function KilJaeden_OnKill(Unit,event,pMisc)
	if pMisc:IsPlayer() then
		if(math.random(2) == 1) then
			Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Another step towards destruction!")
			Unit:PlaySoundToSet(12501)
		else
			Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Anak'kiri")
			Unit:PlaySoundToSet(12502)
		end
	end
end

function KilJaeden_OnDeath(Unit)
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Nooooooooooooo!")
	Unit:RemoveEvents()
	Unit:RemoveAIUpdateEvent()
	for k,v in pairs(shield_orbtable) do 
		if((v ~= nil) and (v:IsInWorld() == true)) then
			v:RemoveFromWorld()
		end
	end
end

function KilJaeden_OnWipe(Unit)
	Unit:RemoveAIUpdateEvent()
	Unit:RemoveEvents()
	if(Unit:IsAlive() == true) then
		Unit:RemoveFromWorld()
	end
	for k,v in pairs(shield_orbtable) do 
		if((v ~= nil) and (v:IsInWorld() == true)) then
			v:RemoveFromWorld()
		end
	end
end

function KilJaeden_Gossip(Unit)
	if((saytable.introsay == true) and (m_phase == 1)) then
		saytable.introsay = false
		Unit:PlaySoundToSet(12500)
		Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "The expendible have perished... So be it! Now I shall succeed where Sargeras could not! I will bleed this wretched world and secure my place as the true master of the Burning Legion. The end has come! Let the unraveling of this world commence!")
	end
	if((saytable.kalecintrosay == true) and (kalec ~= nil) and (m_phase == 1)) then
		Unit:PlaySoundToSet(12438)
		kalec:SetMovementType(3)
		kalec:MoveToWaypoint(1);
		kalec:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "You are not alone. The Blue Dragonflight shall help you vanquish the Deceiver.")
		saytable.kalecintrosay = false
	end
	if((saytable.kalecsay1 == true) and (saytable.anveenasay1 == false) and (saytable.phase3say == false) and (kalec ~= nil) and (m_phase == 2)) then
		saytable.anveenasay1 = true
		Unit:PlaySoundToSet(12445)
		kalec:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Anveena, you must awaken, this world needs you!")
		Unit:RegisterEvent("KilJaeden_Gossip", 5000, 1)
	elseif((saytable.kalecsay1 == true) and (saytable.anveenasay1 == true) and (saytable.phase3say == false) and (anveena ~= nil) and (m_phase == 2)) then
		saytable.phase3say = true
		Unit:PlaySoundToSet(12511)
		anveena:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "I serve only the master now.")
		Unit:RegisterEvent("KilJaeden_Gossip", 5000, 1)
	elseif((saytable.kalecsay1 == true) and (saytable.anveenasay1 == true) and (saytable.phase3say == true) and (m_phase == 2)) then
		saytable.phase3say = false
		saytable.kalecsay1 = false
		saytable.anveenasay1 = false
		saytable.orbsay1 = true
		Unit:PlaySoundToSet(12508)
		Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "I will not be denied! This world shall fall!")
		Unit:RegisterEvent("KilJaeden_Gossip", 7000, 1)
	elseif((saytable.orbsay1 == true) and (kalec ~= nil) and (m_phase == 2)) then
		Unit:PlaySoundToSet(12440)
		kalec:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "I will channel my power into the orbs, be ready!")
		saytable.orbsay1 = false
		kalec:SetMovementType(3)
		kalec:MoveToWaypoint(1)
		local chosenorb = blueorbs[math.random(1,table.getn(blueorbs))]
		if((chosenorb ~= nil) and (chosenorb:IsInWorld() == true)) then
			local addy = tostring(chosenorb)
			activatedorbs[addy] = true
			chosenorb:SpawnCreature(25640, chosenorb:GetX(), chosenorb:GetY(), chosenorb:GetZ(), chosenorb:GetO(), 14, 0)
		end
	end
	if((saytable.kalecsay2 == true) and (saytable.anveenasay2 == false) and (saytable.phase4say == false) and (kalec ~= nil) and (m_phase == 3)) then
		Unit:PlaySoundToSet(12446)
		kalec:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "You must let go! You must become what you were always meant to be! The time is now, Anveena!")
		saytable.anveenasay2 = true
		Unit:RegisterEvent("KilJaeden_Gossip", 8000, 1)
	elseif((saytable.kalecsay2 == true) and (saytable.anveenasay2 == true) and (saytable.phase4say == false) and (anveena ~= nil) and (m_phase == 3))  then
		Unit:PlaySoundToSet(12512)
		anveena:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "But I'm... lost. I cannot find my way back.")
		saytable.phase4say = true
		Unit:RegisterEvent("KilJaeden_Gossip", 6000, 1)
	elseif((saytable.kalecsay2 == true) and (saytable.anveenasay2 == true) and (saytable.phase4say == true) and (m_phase == 3))  then
		Unit:PlaySoundToSet(12509)
		Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Do not harbor false hope. You cannot win!")
		saytable.kalecsay2 = false
		saytable.anveenasay2 = false
		saytable.phase4say = false
		saytable.orbsay2 = true
		Unit:RegisterEvent("KilJaeden_Gossip", 7000, 1)
	elseif((saytable.orbsay2 == true) and (kalec ~= nil) and (m_phase == 3))  then
		if(math.random(2) == 1) then
			kalec:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "I have empowered another orb! Use it quickly!")
			Unit:PlaySoundToSet(12441)
			kalec:SetMovementType(3)
			kalec:MoveToWaypoint(2)
			local chosenorb = blueorbs[math.random(1,table.getn(blueorbs))]
			if((chosenorb ~= nil) and (type(chosenorb) == "userdata") and (chosenorb:IsInWorld() == true))  then
				local addy = tostring(chosenorb)
				activatedorbs[addy] = true
				chosenorb:SpawnCreature(25640, chosenorb:GetX(), chosenorb:GetY(), chosenorb:GetZ(), chosenorb:GetO(), 14, 0)
			end
		else
			kalec:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Another orb is ready! Make haste!")
			Unit:PlaySoundToSet(12442)
			kalec:SetMovementType(3)
			kalec:MoveToWaypoint(2)
			local chosenorb = blueorbs[math.random(1,table.getn(blueorbs))]
			if((chosenorb ~= nil) and (type(chosenorb) == "userdata") and (chosenorb:IsInWorld() == true)) then
				local addy = tostring(chosenorb)
				activatedorbs[addy] = true
				chosenorb:SpawnCreature(25640, chosenorb:GetX(), chosenorb:GetY(), chosenorb:GetZ(), chosenorb:GetO(), 14, 0)
			end
		end
		saytable.orbsay2 = false
	end
	if((saytable.kalecsay3 == true) and (saytable.anveenasay3 == false) and (saytable.phase5say == false) and (m_phase == 4) and (kalec ~= nil)) then
		Unit:PlaySoundToSet(12447)
		kalec:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Anveena, I love you! Focus on my voice, come back for me now! Only you can cleanse the Sunwell!")
		saytable.anveenasay3 = true
		Unit:RegisterEvent("KilJaeden_Gossip", 10000, 1)
	elseif((saytable.kalecsay3 == true) and (saytable.anveenasay3 == true) and (saytable.phase5say == false) and (anveena ~= nil)) then
		Unit:PlaySoundToSet(12513)
		anveena:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Kalec...? Kalec?")
		saytable.kalecsay3 = false
		saytable.kalecsay4 = true
		saytable.anveenasay3 = false
		Unit:RegisterEvent("KilJaeden_Gossip", 2200, 1)
	elseif((saytable.kalecsay4 == true) and (saytable.anveenasay4 == false) and (kalec ~= nil)) then
		Unit:PlaySoundToSet(12448)
		kalec:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Yes, Anveena! Let fate embrace you now!")
		saytable.anveenasay4 = true
		Unit:RegisterEvent("KilJaeden_Gossip", 6500, 1)
	elseif((saytable.kalecsay4 == true) and (saytable.anveenasay4 == true) and (saytable.phase5say == false) and (anveena ~= nil)) then
		Unit:PlaySoundToSet(12514)
		anveena:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "The nightmare is over, the spell is broken! Goodbye, Kalec, my love!")
		saytable.phase5say = true
		Unit:RegisterEvent("KilJaeden_Gossip", 6000, 1)
	elseif((saytable.kalecsay4 == true) and (saytable.anveenasay4 == true) and (saytable.phase5say == true) and (anveena ~= nil)) then
		Unit:RegisterEvent("KilJaeden_CanCast", 5000, 1)
		Unit:PlaySoundToSet(12510)
		Unit:Emote(409, 0)
		Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Aggghh! The powers of the Sunwell... turn... against me! What have you done? What have you done???")
		Unit:FullCastSpellOnTarget(46474, Unit)
		anveena:RemoveFromWorld()
		saytable.orbsay3 = true
		saytable.kalecsay4 = false
		saytable.anveenasay4 = false
		saytable.phase5say = false
		Unit:RegisterEvent("KilJaeden_Gossip", 11000, 1)
	elseif((saytable.orbsay3 == true) and (saytable.kalecsay4 == false) and (kalec ~= nil)) then
		kalec:SetMovementType(3)
		kalec:MoveToWaypoint(4)
		kalec:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "I have channeled all I can! The power is in your hands!")
		Unit:PlaySoundToSet(12443)
		saytable.orbsay3 = false
		saytable.kalecsay4 = false
		saytable.kalecsay5 = true
		for k,v in pairs(blueorbs) do
			if((v ~= nil) and (type(v) == "userdata") and (v:IsInWorld() == true)) then
				local addy = tostring(v)
				activatedorbs[addy] = true
				v:SpawnCreature(25640, v:GetX(), v:GetY(), v:GetZ(), v:GetO(), 14, 0)
			end
		end
		Unit:RegisterEvent("KilJaeden_Gossip", 6000, 1)
	elseif((saytable.kalecsay5 == true) and (saytable.orbsay3 == false) and (kalec ~= nil)) then
		if(math.random(2) == 1) then
			Unit:PlaySoundToSet(12449)
			kalec:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Strike now, heroes, while he is weakened! Vanquish the Deceiver!")
		else
			Unit:PlaySoundToSet(12450)
			kalec:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Goodbye, Anveena, my love. Few will remember your name, yet this day you change the course of destiny. What was once corrupt is now pure. Heroes, do not let her sacrifice be in vain.")			
		end
	end
end

function KilJaeden_CanCast(Unit)
	if(cancast == false) then
		cancast = true
	end
	if(castmeteor == false) then
		castmeteor = true
	end
end

function KilJaeden_PhaseCheck(Unit)
	if(m_phase == 1) then
		shield_orbs = 1
		shield_orbtimer = 15
		soul_flay = 4
		legion_light = 0
		fire_bloom = 0
	end
	if(m_phase == 2) then
		shield_orbs = 2
		shield_orbtimer = 0
		shadow_spike = true
		flame_dart = 0
		soul_darkness = 0
		soul_flay = 0
		legion_light = 0
		fire_bloom = 0
	end
	if(m_phase == 3) then
		shield_orbtimer = 0
		fire_bloom = 0
		legion_light = 0
		soul_flay = 0
		soul_darkness = 0
		flame_dart = 0
		meteors = 0
		shield_orbs = 3
		shadow_spike = true
		castmeteor = true
		meteor_timer = 0;
	end
	if(m_phase == 4) then
		shield_orbtimer = nil
		shield_orbs = nil
		shield_spawn = nil
		meteor_timer = 0
		meteors = 0
		shadow_spike = true
		shield_orbs = 0
		legion_light = 0
		soul_flay = 0
		soul_darkness = 0
		flame_dart = 0
		fire_bloom = 0
	end
end

function KilJaeden_AIUpdate(Unit)
	if(m_phase == 1) then
		legion_light = legion_light +1
		soul_flay = soul_flay +1
		fire_bloom = fire_bloom +1
		shield_orbtimer = shield_orbtimer+1
	end
	if(m_phase == 2) then
		flame_dart =  flame_dart +1
		soul_darkness = soul_darkness +1
		legion_light = legion_light +1
		soul_flay = soul_flay +1
		fire_bloom = fire_bloom +1
		shield_orbtimer = shield_orbtimer+1
	end
	if(m_phase == 3) then
		flame_dart =  flame_dart +1
		soul_darkness = soul_darkness +1
		legion_light = legion_light +1
		soul_flay = soul_flay +1
		fire_bloom = fire_bloom +1
		meteor_timer = meteor_timer+1
		shield_orbtimer = shield_orbtimer+1
	end
	if(m_phase == 4) then
		flame_dart =  flame_dart +1
		soul_darkness = soul_darkness +1
		legion_light = legion_light +1
		soul_flay = soul_flay +1
		fire_bloom = fire_bloom +1
		meteor_timer = meteor_timer+1
	end
	local hp = Unit:GetHealthPct()
	local plr = Unit:GetRandomPlayer(0)
	local tank = Unit:GetMainTank()
	if(hp > 85) then
		if((soul_flay == 5) and (cancast == true) and (tank~= nil)) then
			cancast = false
			Unit:FullCastSpellOnTarget(45442, tank)
			soul_flay = 0
			Unit:RegisterEvent("KilJaeden_CanCast", 3500, 1)
		elseif((soul_flay == 5) and (cancast == false)) then
			soul_flay = soul_flay-1
		end
		if((shield_orbtimer == 30) and (table.getn(shield_orbtable) == 0)) then
			for i = 1,shield_orbs do
				local angle = nil
				local radius = 10
				if(math.random(math.random(2)) == 1) then
					angle = -math.pi
				else
					angle = math.pi
				end
				local newx,newy = math.cos(angle)*radius,math.sin(angle)*radius
				table.insert(shield_orbtable,Unit:SpawnCreature(25502,Unit:GetX()+newx,Unit:GetY()+newy,Unit:GetZ(),Unit:GetO(),16,0))
			end
			shield_orbtimer = 0
		elseif((shield_orbtimer == 30) and (table.getn(shield_orbtable) ~= 0)) then
			shield_orbtimer = shield_orbtimer - 5
		end
		if((legion_light == 10) and (cancast == true) and (plr ~=nil)) then
			cancast = false
			Unit:FullCastSpellOnTarget(45664,plr)
			legion_light = 0
			Unit:RegisterEvent("KilJaeden_CanCast", 3000,1)
		elseif((legion_light == 10) and (cancast == false) and (plr ~=nil)) then
			legion_light = legion_light-1
		end
		if((fire_bloom == 30) and (cancast == true)) then
			cancast = false
			Unit:FullCastSpell(45641)
			fire_bloom = 0
			Unit:RegisterEvent("KilJaeden_CanCast", 2000, 1)
		elseif((fire_bloom == 30) and (cancast == false)) then
			fire_bloom = fire_bloom-1
		end
	elseif((hp <= 85) and (hp > 55)) then
		if m_phase < 2 then
			m_phase = 2
			KilJaeden_PhaseCheck(Unit)
			sinister_reflect = true
		end
		if((sinister_reflect == true) and (cancast == true)) then
			sinister_reflect = false
			cancast = false
			Unit:RegisterEvent("KilJaeden_SinisterReflect", 1000,1)
		end
		if((shadow_spike == true) and (cancast == true) and (plr ~=nil)) then
			cancast = false
			shadow_spike = false
			saytable.kalecsay1 = true
			Unit:FullCastSpell(46680)
			Unit:RegisterEvent("KilJaeden_CanCast", 29000, 1)
			Unit:RegisterEvent("KilJaeden_Gossip", 18000, 1)
		end
		if((shield_orbtimer == 30) and (table.getn(shield_orbtable) == 0)) then
			for i = 1,shield_orbs do
				local angle = nil
				local radius = 10
				if(math.random(math.random(2)) == 1) then
					angle = -math.pi
				else
					angle = math.pi
				end
				local newx,newy = math.cos(angle)*radius,math.sin(angle)*radius
				table.insert(shield_orbtable, Unit:SpawnCreature(25502, Unit:GetX()+newx, Unit:GetY()+newy, Unit:GetZ(), Unit:GetO(), 16, 0))
			end
			shield_orbtimer = 0
		elseif((shield_orbtimer == 30) and (table.getn(shield_orbtable) ~= 0)) then
			shield_orbtimer = shield_orbtimer - 5
		end
		if((legion_light >= 15) and (plr ~=nil) and (cancast == true)) then
			cancast = false
			Unit:FullCastSpellOnTarget(45664, plr)
			legion_light = 0
			Unit:RegisterEvent("KilJaeden_CanCast", 3000, 1)
		elseif((legion_light >= 15) and (plr ~=nil) and (cancast == false)) then
			legion_light = legion_light-1
		end
		if((soul_flay >= 5) and (cancast == true) and (tank~= nil)) then
			cancast = false
			Unit:FullCastSpellOnTarget(45442, tank)
			Unit:RegisterEvent("KilJaeden_CanCast", 3500, 1)
			soul_flay = 0
		elseif((soul_flay >= 5) and (cancast == false)) then
			soul_flay = soul_flay-1
		end
		if((fire_bloom >= 30) and (cancast == true)) then
			cancast = false
			Unit:FullCastSpell(45641)
			fire_bloom = 0
			Unit:RegisterEvent("KilJaeden_CanCast", 2000, 1)
		elseif((fire_bloom >= 30) and (cancast == false)) then
			fire_bloom = fire_bloom-1
		end
		if((flame_dart >= 20) and (cancast == true) and (plr ~=nil)) then
			cancast = false
			Unit:FullCastSpellOnTarget(45737, plr)
			flame_dart = 0
			Unit:RegisterEvent("KilJaeden_CanCast", 2000, 1)
		elseif((flame_dart >= 20) and (cancast == false)) then
			flame_dart = flame_dart - 1
		end
		if((soul_darkness >= 40) and (cancast == true)) then
			cancast = false
			Unit:FullCastSpell(46605)
			Unit:SendChatMessage(ChatField.CHAT_MSG_TEXT_EMOTE, LangField.LANG_UNIVERSAL, tostring(Unit:GetName()).." begins to channel dark energy!")
			soul_darkness = 0
			Unit:RegisterEvent("KilJaeden_CanCast", 10000, 1)
			Unit:RegisterEvent("KilJaeden_SoulDarkness", 8800,1)
		elseif((soul_darkness >= 40) and (cancast == false)) then
			soul_darkness = soul_darkness-1
		end
	elseif((hp <= 55) and (hp > 25)) then
		if(m_phase < 3) then
			m_phase = 3
			KilJaeden_PhaseCheck(Unit)
			sinister_reflect = true
		end
		if((sinister_reflect == true) and (cancast == true)) then
			sinister_reflect = false
			cancast = false
			Unit:RegisterEvent("KilJaeden_SinisterReflect", 1000, 1)
		end
		if((shield_orbtimer == 30) and (table.getn(shield_orbtable) == 0)) then
			for i = 1,shield_orbs do
				if(math.random(math.random(2)) == 1) then
					angle = math.pi
				else
					angle = -math.pi
				end
				local newx,newy = math.cos(angle)*math.random(15,17),math.sin(angle)*math.random(15,17)
				table.insert(shield_orbtable,Unit:SpawnCreature(25502,Unit:GetX()+newx,Unit:GetY()+newy,Unit:GetZ(),Unit:GetO(),16,0))
			end
			shield_orbtimer = 0
		elseif((shield_orbtimer == 30) and (table.getn(shield_orbtable) ~= 0)) then
			shield_orbtimer = shield_orbtimer - 5
		end
		if((meteor_timer >= 3) and (meteors <= 3) and (castmeteor == true) and (plr ~=nil)) then
			Unit:SpawnCreature(25735, plr:GetX(), plr:GetY(), plr:GetZ()+30, plr:GetO(), 16, 8000)
			Unit:SpawnCreature(60000, plr:GetX(), plr:GetY(), plr:GetZ(), plr:GetO(), 16, 8000)
			meteors = meteors + 1
			meteor_timer = 0
		elseif((meteor_timer >= 3) and (castmeteor == false)) then
			meteor_timer = meteor_timer-1
		end
		if((shadow_spike == true) and (cancast == true) and (plr~= nil)) then
			cancast = false
			Unit:FullCastSpell(46680)
			shadow_spike = false
			saytable.kalecsay2 = true
			Unit:RegisterEvent("KilJaeden_CanCast",29000, 1)
			Unit:RegisterEvent("KilJaeden_Gossip", 15000,1)
		end
		if((legion_light >= 15) and (cancast == true) and (plr~= nil)) then
			cancast = false
			Unit:FullCastSpellOnTarget(45664, Unit:GetRandomPlayer(0))
			legion_light = 0
			Unit:RegisterEvent("KilJaeden_CanCast", 3000, 1)
		elseif((legion_light >= 15) and (Unit:GetRandomPlayer(0)) and (cancast == false)) then
			legion_light = legion_light-1
		end
		if((soul_flay >= 5) and (cancast == true) and (tank~= nil)) then
			cancast = false
			Unit:FullCastSpellOnTarget(45442, tank)
			soul_flay = 0
			Unit:RegisterEvent("KilJaeden_CanCast", 3500, 1)
		elseif((soul_flay >= 5) and (cancast == false) and (tank~= nil)) then
			soul_flay = soul_flay-1
		end
		if((fire_bloom >= 20) and (cancast == true)) then
			cancast = false
			Unit:FullCastSpell(45641)
			fire_bloom = 0
			Unit:RegisterEvent("KilJaeden_CanCast", 2000, 1)
		elseif((fire_bloom >= 20) and (cancast == false)) then
			fire_bloom = fire_bloom-1
		end
		if((flame_dart >= 15) and (cancast == true)) then
			cancast = false
			Unit:FullCastSpell(45737)
			flame_dart = 0
			Unit:RegisterEvent("KilJaeden_CanCast", 2000, 1)
		elseif((flame_dart >= 15) and (cancast == false)) then
			flame_dart = flame_dart - 1
		end
		if((soul_darkness >= 40) and (cancast == true)) then
			cancast = false
			castmeteor = false
			Unit:FullCastSpell(46605)
			Unit:SendChatMessage(ChatField.CHAT_MSG_TEXT_EMOTE, LangField.LANG_UNIVERSAL, tostring(Unit:GetName()).." begins to channel dark energy!")
			soul_darkness = 0
			Unit:RegisterEvent("KilJaeden_CanCast", 10000, 1)
			Unit:RegisterEvent("KilJaeden_SoulDarkness", 8800,1)
		elseif((soul_darkness >= 40) and (cancast == false)) then
			soul_darkness = soul_darkness-1
		end
	elseif(hp  <= 25) then
		if(m_phase < 4) then
			m_phase = 4
			KilJaeden_PhaseCheck(Unit)
			sinister_reflect = true
		end
		if((sinister_reflect == true) and (cancast == true)) then
			sinister_reflect = false
			cancast = false
			Unit:RegisterEvent("KilJaeden_SinisterReflect", 1000, 1)
		end
		if((shadow_spike == true) and (cancast == true) and (plr~= nil)) then
			cancast = false
			Unit:FullCastSpell(46680)
			shadow_spike = false
			saytable.kalecsay3 = true
			Unit:RegisterEvent("KilJaeden_Gossip", 6000, 1)
		end
		if((meteor_timer >= 3) and (meteors <= 5) and (castmeteor == true) and (plr~= nil)) then
			Unit:SpawnCreature(25735, plr:GetX(), plr:GetY(), plr:GetZ()+30, plr:GetO(), 16, 8000)
			Unit:SpawnCreature(60000, plr:GetX(), plr:GetY(), plr:GetZ(), plr:GetO(), 16, 8000)
			meteors = meteors + 1
			meteor_timer = 0
		elseif((meteor_timer >= 3) and (castmeteor == false)) then
			meteor_timer = meteor_timer-1
		end
		if((cancast == true) and (soul_flay >= 5) and (tank~= nil)) then
			cancast = false
			Unit:FullCastSpellOnTarget(45442, tank)
			soul_flay = 0
			Unit:RegisterEvent("KilJaeden_CanCast", 3500, 1)
		elseif((soul_flay >= 5) and (cancast == false) and (tank~= nil)) then
			soul_flay = soul_flay-1
		end
		if((legion_light >= 15) and (cancast == true) and (plr~= nil)) then
			cancast = false
			Unit:FullCastSpellOnTarget(45664, plr)
			legion_light = 0
			Unit:RegisterEvent("KilJaeden_CanCast", 3000, 1)
		elseif((legion_light >= 15) and (cancast == false) and (plr~= nil)) then
			legion_light = legion_light-1
		end
		if((fire_bloom >= 30) and (cancast == true)) then
			cancast = false
			Unit:FullCastSpell(45641)
			fire_bloom = 0
			Unit:RegisterEvent("KilJaeden_CanCast", 2500, 1)
		elseif((fire_bloom >= 30) and (cancast == false)) then
			fire_bloom = fire_bloom-1
		end
		if((flame_dart >= 15) and (cancast == true)) then
			cancast = false
			Unit:FullCastSpell(45737)
			flame_dart = 0
			Unit:RegisterEvent("KilJaeden_CanCast", 2500, 1)
		elseif((flame_dart >= 15) and (cancast == false)) then
			flame_dart = flame_dart - 1
		end
		if((soul_darkness >= 25) and (cancast == true)) then
			cancast = false
			Unit:FullCastSpell(46605)
			Unit:SendChatMessage(ChatField.CHAT_MSG_TEXT_EMOTE, LangField.LANG_UNIVERSAL, tostring(Unit:GetName()).." begins to channel dark energy!")
			soul_darkness = 0
			Unit:RegisterEvent("KilJaeden_CanCast", 10000, 1)
			Unit:RegisterEvent("KilJaeden_SoulDarkness", 8800,1)
		elseif((soul_darkness >= 25) and (cancast == false)) then
			soul_darkness = soul_darkness-1
		end
	end
end

function KilJaeden_SinisterReflect(Unit)
	for i = 1,4,1 do
		local plr = Unit:GetRandomPlayer(0)
		if(plr ~= nil) then
			plr:CastSpell(45891)
		end
	end
	Unit:Emote(404,0)
	Unit:RegisterEvent("KilJaeden_SinisterReflectdeux", 1500, 1)
	Unit:RegisterEvent("KilJaeden_CanCast", 2500, 1)
	local rand = math.random(1, 2)
	if(rand == 1) then
		Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Who can you trust?")
		Unit:PlaySoundToSet(12503)
	else
		Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "The enemy is among you.")
		Unit:PlaySoundToSet(12504)
	end
end

function KilJaeden_SinisterReflectdeux(Unit)
	Unit:Emote(405,0)
end

function KilJaeden_SoulDarkness(Unit)
	Unit:FullCastSpell(45657)
	local rand = math.random(1, 3)
	if(rand == 1) then
		Unit:PlaySoundToSet(12505)
		Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Chaos!")
	elseif(rand == 2) then
		Unit:PlaySoundToSet(12506)
		Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Destruction!")
	elseif(rand == 3) then
		Unit:PlaySoundToSet(12507)
		Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Oblivion!")
	end
end

RegisterUnitEvent(kiljaeden, 1, "KilJaeden_OnCombat")
RegisterUnitEvent(kiljaeden, 2, "KilJaeden_OnWipe")
RegisterUnitEvent(kiljaeden, 3, "KilJaeden_OnKill")
RegisterUnitEvent(kiljaeden, 4, "KilJaeden_OnDeath")
RegisterUnitEvent(kiljaeden, 18, "KilJaeden_OnSpawn")
RegisterUnitEvent(kiljaeden, 21,"KilJaeden_AIUpdate")
RegisterUnitEvent(kiljaeden, 22,"KilJaeden_SoulDarkness")

function KilJaeden_InitiliazeMeteor(Unit)
	Unit:EnableFlight()
	--Unit:SetUInt32Value(UnitField.Unit_FIELD_DISPLAYID, 22814)
	Unit:MoveTo(Unit:GetX(), Unit:GetY(), Unit:GetZ()+1, Unit:GetO())
	Unit:SetUInt32Value(UnitField.Unit_FIELD_FLAGS, UnitFieldFlags.Unit_FLAG_NOT_ATTACKABLE_9+UnitFieldFlags.Unit_FLAG_NOT_SELECTABLE)
	Unit:DisableRespawn()
	Unit:SetCombatCapable(1)
	Unit:SetCombatMeleeCapable(1)
	Unit:WipeThreatList()
	Unit:MonsterMove(Unit:GetX(), Unit:GetY(), Unit:GetZ()-25, 8000, 768)
	Unit:RegisterEvent("KilJaeden_MeteorStormFinish", 8000, 1)
end

function KilJaeden_MeteorStormFinish(Unit)
	Unit:SetPosition(Unit:GetX(), Unit:GetY(), Unit:GetZ()-40)
	Unit:StopMovement(0)
	Unit:RemoveEvents()
	Unit:RemoveFromWorld()
	meteors = meteors-1
end

function KilJaeden_OrbDummy(Unit)
	--Unit:SetUInt32Value(UnitField.Unit_FIELD_DISPLAYID,22452)
	Unit:EnableFlight()
	Unit:SetUInt32Value(UnitField.Unit_FIELD_FLAGS, UnitFieldFlags.Unit_FLAG_NOT_ATTACKABLE_9+UnitFieldFlags.Unit_FLAG_NOT_SELECTABLE)
	Unit:SetCombatCapable(1)
	Unit:WipeCurrentTarget()
	Unit:RegisterAIUpdateEvent(1000)
	--Unit:CastSpell(45911)
	Unit:RegisterEvent("KilJaeden_OrbFinish", 9000, 1)
end

function KilJaeden_OrbUpdate(Unit)
	Unit:PlaySpellVisual(Unit, 844)
end

function KilJaeden_OrbFinish(Unit)
	Unit:RemoveEvents()
	Unit:RemoveAIUpdateEvent()
	Unit:RegisterEvent("KilJaeden_OrbFinish2", 100, 1)
end

function KilJaeden_OrbFinish2(Unit)
	Unit:CastSpell(45915)
	Unit:PlaySpellVisual(Unit, 9312)
	Unit:RegisterEvent("KilJaeden_OrbDespawn", 1000, 1)
end

function KilJaeden_OrbDespawn(Unit)
	Unit:RemoveFromWorld()
end

RegisterUnitEvent(60000, 18, "KilJaeden_OrbDummy")
RegisterUnitEvent(25735, 18, "KilJaeden_InitiliazeMeteor")
RegisterUnitEvent(60000, 21, "KilJaeden_OrbUpdate")

function InitializeSinisterReflection(Unit)
	local tar = Unit:GetClosestPlayer()
	local class = tar:GetPlayerClass()
	Unit:WorldQuery("DELETE FROM ai_agents WHERE entry ='25708';")
	if(class == "Warlock") then
		Unit:WorldQuery("INSERT INTO ai_agents (entry,type,event,chance,maxcount,spell,spelltype,targettype,cooldown,floatMisc1,Misc2) VALUES('25708','4','0','100','0','46190','0','-1','15000','0','0');")
		Unit:WorldQuery("INSERT INTO ai_agents (entry,type,event,chance,maxcount,spell,spelltype,targettype,cooldown,floatMisc1,Misc2) VALUES('25708','4','0','100','0','47076','0','1','2000','0','0');")
	end
	if(class == "Priest") then
		Unit:WorldQuery("INSERT INTO ai_agents (entry,type,event,chance,maxcount,spell,spelltype,targettype,cooldown,floatMisc1,Misc2) VALUES('25708','4','0','100','0','47077','0','1','1000','0','0');")
		Unit:WorldQuery("INSERT INTO ai_agents (entry,type,event,chance,maxcount,spell,spelltype,targettype,cooldown,floatMisc1,Misc2) VALUES('25708','4','0','100','0','47079','0','1','10000','0','0');")
		Unit:SetCurrentAgent(4)
	end
	if(class == "Shaman") then
		Unit:WorldQuery("INSERT INTO ai_agents (entry,type,event,chance,maxcount,spell,spelltype,targettype,cooldown,floatMisc1,Misc2) VALUES('25708','4','0','100','0','47071','0','1','10000','0','0');")
		Unit:SetCurrentAgent(1)
	end
	if(class == "Hunter") then
		Unit:WorldQuery("INSERT INTO ai_agents (entry,type,event,chance,maxcount,spell,spelltype,targettype,cooldown,floatMisc1,Misc2) VALUES('25708','4','0','100','0','16496','0','1','100','0','0');")
		Unit:WorldQuery("INSERT INTO ai_agents (entry,type,event,chance,maxcount,spell,spelltype,targettype,cooldown,floatMisc1,Misc2) VALUES('25708','4','0','100','0','48098','0','1','10000','0','0');")
		Unit:WorldQuery("INSERT INTO ai_agents (entry,type,event,chance,maxcount,spell,spelltype,targettype,cooldown,floatMisc1,Misc2) VALUES('25708','4','0','100','0','40652','0','1','10000','0','0');")
		Unit:SetCurrentAgent(4)
	end
	if(class == "Paladin") then
		Unit:WorldQuery("INSERT INTO ai_agents (entry,type,event,chance,maxcount,spell,spelltype,targettype,cooldown,floatMisc1,Misc2) VALUES('25708','4','0','100','0','37369','0','1','20000','0','0');")
		Unit:WorldQuery("INSERT INTO ai_agents (entry,type,event,chance,maxcount,spell,spelltype,targettype,cooldown,floatMisc1,Misc2) VALUES('25708','4','0','100','0','38921','0','1','10000','0','0');")
	end
	if(class == "Mage") then
		Unit:WorldQuery("INSERT INTO ai_agents (entry,type,event,chance,maxcount,spell,spelltype,targettype,cooldown,floatMisc1,Misc2) VALUES('25708','4','0','100','0','47074','0','1','100','0','0');")
		Unit:SetCurrentAgent(4)
	end
	if(class == "Rogue") then
		Unit:WorldQuery("INSERT INTO ai_agents (entry,type,event,chance,maxcount,spell,spelltype,targettype,cooldown,floatMisc1,Misc2) VALUES('25708','4','0','100','0','45897','0','-1','100','0','0');")
	end
	if(class == "Druid") then
		Unit:WorldQuery("INSERT INTO ai_agents (entry,type,event,chance,maxcount,spell,spelltype,targettype,cooldown,floatMisc1,Misc2) VALUES('25708','4','0','100','0','47072','0','-1','100','0','0');")
		Unit:SetCurrentAgent(4)
	end
	if(class == "Warrior") then
		Unit:WorldQuery("INSERT INTO ai_agents (entry,type,event,chance,maxcount,spell,spelltype,targettype,cooldown,floatMisc1,Misc2) VALUES('25708','4','0','100','0','17207','0','-1','5000','0','0');")
		Unit:WorldQuery("INSERT INTO ai_agents (entry,type,event,chance,maxcount,spell,spelltype,targettype,cooldown,floatMisc1,Misc2) VALUES('25708','4','0','100','0','15576','0','-1','5000','0','0');")
	end
end

function DespawnSinisterReflections(Unit)
	Unit:RemoveFromWorld()
end

RegisterUnitEvent(25708, 18, "InitializeSinisterReflection")
RegisterUnitEvent(25708, 2, "DespawnSinisterReflections")

local radians = nil
local shieldx = nil
local shieldy = nil
local clockwise = false

function  Initialize_ShieldOrb(Unit)
	Unit:SetCombatCapable(1)
	Unit:SetCombatMeleeCapable(1)
	Unit:SetCombatTargetingCapable(1)
	Unit:SetUInt32Value(UnitField.Unit_FIELD_FLAGS, UnitFieldFlags.Unit_FLAG_NOT_ATTACKABLE_9)
	Unit:EnableFlight()
	Unit:ModifySpeed(5)
	Unit:MonsterMove(Unit:GetX(), Unit:GetY(), Unit:GetZ()+10, 5000, 768)
	Unit:RegisterEvent("ShieldOrb_AI",5000, 1)
	Unit:RegisterEvent("ShieldOrb_Movement", 5000, 1)
	radians = 0
	shieldx = 0
	shieldy = 0
	if(math.random(2) == 1) then
		clockwise = true
	else
		clockwise = false
	end
end

function ShieldOrb_AI(Unit)
	Unit:SetPosition(Unit:GetX(), Unit:GetY(), Unit:GetZ()+10)
	Unit:RegisterAIUpdateEvent(2000)
	Unit:SetUInt32Value(UnitField.Unit_FIELD_FLAGS, 0)
	if(Unit:GetRandomPlayer(0)) then
		Unit:GetRandomPlayer(0):AttackReaction(Unit, 1, 0)
	end
end

function ShieldOrb_Movement(Unit)
	if(clockwise == true) then
		radians = radians + 0.62818
	else
		radians = radians - 0.62818
	end
	shieldx = cn_kiljaeden:GetX()+math.cos(radians)*math.random(13, 17)
	shieldy = cn_kiljaeden:GetY()+math.sin(radians)*math.random(13, 17)
	Unit:MoveTo(shieldx, shieldy, Unit:GetZ(), Unit:GetO())
	Unit:RegisterEvent("ShieldOrb_Movement", 5000, 1)
end

function ShieldOrb_Update(Unit)
	Unit:WipeThreatList()
	if(Unit:GetRandomPlayer(0) ~= nil) then
		Unit:FullCastSpell(45680)
	end
end

function ShieldOrb_OnWipe(Unit)
	if(Unit:GetRandomPlayer(0) == nil) then
		Unit:RemoveAIUpdateEvent()
		Unit:RemoveEvents()
		for k,v in pairs(shield_orbtable) do
			if(v == Unit) then
				table.remove(shield_orbtable,k)
			end
		end
		Unit:RemoveFromWorld()
	end
end

function ShieldOrb_OnDeath(Unit)
	Unit:RemoveAIUpdateEvent()
	Unit:RemoveEvents()
	for k,v in pairs(shield_orbtable) do
		if(v == Unit) then
			table.remove(shield_orbtable,k)
		end
	end
	Unit:RemoveFromWorld()
end

function HelperKalec_OnSpawn(Unit)
	Unit:EnableFlight()
	Unit:MoveTo(Unit:GetX(), Unit:GetY(), Unit:GetZ()-1, Unit:GetO())
	Unit:MoveTo(Unit:GetX(), Unit:GetY(), Unit:GetZ()+1, Unit:GetO())
	Unit:ModifySpeed(5)
	Unit:CreateWaypoint(1, 1702.738037, 598.220520, 129.048126, 0.006295, 2000, 768, 0)
	Unit:CreateWaypoint(2, 1727.781128, 625.956665, 120.866765, 1.467142, 2000, 768, 0)
	Unit:CreateWaypoint(3, 1693.672974, 656.997437, 124.239868, 3.269632, 2000, 768, 0)
	Unit:CreateWaypoint(4, 1668.829346, 627.792847, 122.001450, 4.274939, 2000, 768, 0)
	Unit:SetMovementType(4)
	Unit:FullCastSpell(45670)
end

function HelperKalec_OnReachWp(Unit)
	Unit:SetMovementType(4)
end

RegisterUnitEvent(25319, 18, "HelperKalec_OnSpawn")
RegisterUnitEvent(25319, 19, "HelperKalec_OnReachWp")

local controllers = {}

function InitializeOrbOfBlue(Unit)
	local addy = tostring(Unit)
	if((activatedorbs[addy] ~= true) or (spawnedorbs == true)) then
		table.insert(blueorbs,Unit)
	end
end

function OrbOfBlue_OnActivate(Unit,event,pActivator)
	local addy = tostring(Unit)
	if(activatedorbs[addy] == true) then
		local drake = Unit:SpawnCreature(25653, pActivator:GetX(), pActivator:GetY(), pActivator:GetZ(), pActivator:GetO(), 14, 0)
		local dAddy = tostring(drake)
		controllers[dAddy] = pActivator
		activatedorbs[addy] = false
		Unit:Despawn(1,5000)
		local orbtar = Unit:GetCreatureNearestCoords(Unit:GetX(), Unit:GetY(), Unit:GetZ(), 25640)
		if(orbtar ~= nil) then
			orbtar:RemoveFromWorld()
		end
	end
end

function OrbOfBlue_OnDespawn(Unit,event)
	for k,v in pairs(blueorbs) do
		local addy = tostring(v)
		if(activatedorbs[addy] == false) then
			table.remove(blueorbs,k)
		end
	end
end

function OrbTarget_OnSpawn(Unit)
	Unit:SetUInt32Value(UnitField.Unit_FIELD_FLAGS, UnitFieldFlags.Unit_FLAG_NOT_ATTACKABLE_9+UnitFieldFlags.Unit_FLAG_NOT_SELECTABLE)
	Unit:SetUInt32Value(UnitField.Unit_FIELD_DISPLAYID, 21908)
	Unit:Root()
	Unit:SetCombatMeleeCapable(1)
	Unit:SetCombatTargetingCapable(1)
	Unit:WipeThreatList()
	Unit:RegisterEvent("InitializeOrbTarget", 500, 1)
end
function InitializeOrbTarget(Unit)
	Unit:FullCastSpell(37964)
	Unit:FullCastSpell(42709)
end

RegisterUnitEvent(25640, 18, "OrbTarget_OnSpawn")
RegisterUnitEvent(25640, 18, "OrbTarget_OnSpawn")

function InitBlueDrake(Unit)
	--Execute Query
	Unit:WorldQuery("DELETE FROM ai_agents WHERE entry ='25653';")
	Unit:WorldQuery("INSERT INTO ai_agents (entry,type,event,chance,maxcount,spell,spelltype,targettype,cooldown,floatMisc1,Misc2) VALUES('25653','4','0','100','0','45848','0','-1','20000','0','0');")
	Unit:WorldQuery("INSERT INTO ai_agents (entry,type,event,chance,maxcount,spell,spelltype,targettype,cooldown,floatMisc1,Misc2) VALUES('25653','4','0','100','0','45856','0','-1','10000','0','0');")
	Unit:WorldQuery("INSERT INTO ai_agents (entry,type,event,chance,maxcount,spell,spelltype,targettype,cooldown,floatMisc1,Misc2) VALUES('25653','4','0','100','0','45860','0','-1','10000','0','0');")
	Unit:WorldQuery("INSERT INTO ai_agents (entry,type,event,chance,maxcount,spell,spelltype,targettype,cooldown,floatMisc1,Misc2) VALUES('25653','4','0','100','0','45862','0','-1','15000','0','0');")
	--Unit:Despawn(1,1)
	Unit:RegisterEvent("BlueDrakeMasterController",500,1)
end

function BlueDrakeMasterController(Unit)
	local addy = tostring(Unit)
	local plr = nil
	if(controllers[addy] ~= nil) then
		plr = controllers[addy]
		cn_kiljaeden:AttackReaction(plr, 1)
		plr:FullCastSpellOnTarget(45839, Unit)
		plr:SetUInt32Value(UnitField.Unit_FIELD_FLAGS, UnitFieldFlags.Unit_FLAG_NOT_ATTACKABLE_9+UnitFieldFlags.Unit_FLAG_NOT_SELECTABLE)
		plr:SetInvisible(1)
	end
	cn_kiljaeden:AttackReaction(Unit,1)
	Unit:RegisterEvent("BlueDrakeDies", 119000, 1)
end

function BlueDrakeDies(Unit)
	local addy = tostring(Unit)
	local plr = nil
	if(type(controllers[addy]) == "userdata") then
		plr = (controllers[addy])
		plr:RemoveFlag(UnitField.Unit_FIELD_FLAGS, Unit:GetUInt32Value(UnitField.Unit_FIELD_FLAGS))
		plr:SetInvisible(0)
		cn_kiljaeden:AttackReaction(plr, 1)
		controllers[addy] = nil
	end
	Unit:Die()
end

RegisterGameObjectEvent(188116, 2, "InitializeOrbOfBlue")
RegisterGameObjectEvent(187869, 2, "InitializeOrbOfBlue")
RegisterGameObjectEvent(188114, 2, "InitializeOrbOfBlue")
RegisterGameObjectEvent(188115, 2, "InitializeOrbOfBlue")
--[[RegisterGameObjectEvent(188116, 5, "OrbOfBlueUpdate")
RegisterGameObjectEvent(187869, 5, "OrbOfBlueUpdate")
RegisterGameObjectEvent(188114, 5, "OrbOfBlueUpdate")
RegisterGameObjectEvent(188115, 5, "OrbOfBlueUpdate")]]--
RegisterGameObjectEvent(188116, 4, "OrbOfBlue_OnActivate")
RegisterGameObjectEvent(187869, 4, "OrbOfBlue_OnActivate")
RegisterGameObjectEvent(188114, 4, "OrbOfBlue_OnActivate")
RegisterGameObjectEvent(188115, 4, "OrbOfBlue_OnActivate")
RegisterGameObjectEvent(188116, 6, "OrbOfBlue_OnDespawn")
RegisterGameObjectEvent(187869, 6, "OrbOfBlue_OnDespawn")
RegisterGameObjectEvent(188114, 6, "OrbOfBlue_OnDespawn")
RegisterGameObjectEvent(188115, 6, "OrbOfBlue_OnDespawn")
RegisterUnitEvent(25653, 18, "InitBlueDrake")
RegisterUnitEvent(25502, 18, "Initialize_ShieldOrb")
RegisterUnitEvent(25502, 4, "ShieldOrb_OnDeath")
RegisterUnitEvent(25502, 2, "ShieldOrb_OnWipe")
RegisterUnitEvent(25502, 21, "ShieldOrb_Update")

function Muru_OnEnterCombat(Unit, Event)
	Unit:SetCombatMeleeCapable(1) 
	Unit:RegisterEvent("Muru_NegativeEnergy", 2000, 0)
	Unit:RegisterEvent("Muru_Darkness", 45000, 0)
	Unit:RegisterEvent("Muru_VoidSentinel", 30000, 0)
	Unit:RegisterEvent("Muru_Summonset", 60000, 0)
	Unit:RegisterEvent("Muru_Enrage", 67000, 0)
	Unit:StopMovement()
end

function Muru_NegativeEnergy(Unit, Event)
   Unit:CastSpellOnTarget(46008, Unit:GetRandomPlayer(0))
end

function Muru_Darkness(Unit, Event)
   Unit:CastSpell(45996)
end

function Muru_Enrage(Unit, Event)
    Unit:CastSpell(26662)
end

function Muru_Summonset(Unit, Event)
local Choice = math.random(1,2)
	if(Choice == 1) then
		Unit:SpawnCreature(25798, 1781.98, 665.4370, 71.2, 5.23, 16,0)
        Unit:SpawnCreature(25798, 1777.76, 662.8, 71.2, 5.21, 16,0)
        Unit:SpawnCreature(25799, 1848.0813, 598.78, 71.3143, 2.4368, 16,0)
	elseif(Choice == 2) then
        Unit:SpawnCreature(25799, 1781.98, 665.4370, 71.2, 5.23, 16,0)
        Unit:SpawnCreature(25798, 1849.64, 595.196, 71.3143, 2.4886, 16,0)
        Unit:SpawnCreature(25798, 1848.0813, 598.78, 71.3143, 2.4368, 16,0)
	end
end

function Muru_VoidSentinel(Unit, Event)
local Choice = math.random(1,2)
	if(Choice == 1) then
		Unit:SpawnCreature(25772, 1796.94 ,605.072, 71.203, 0.67, 16,0)  
	elseif(Choice == 2) then
		Unit:SpawnCreature(25772, 1838.32 ,650.789, 71.243, 4.26, 16,0)
	end
end

function Muru_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Muru_OnDied(Unit, Event)
	Unit:CastSpell(46217)
	Unit:RemoveFromWorld()
	Unit:RemoveEvents()
end

RegisterUnitEvent(25741, 1, "Muru_OnEnterCombat")
RegisterUnitEvent(25741, 2, "Muru_OnLeaveCombat")
RegisterUnitEvent(25741, 4, "Muru_OnDied")


--Entropius
function Entropius_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("Entropius_NegativeEnergy",4000,0)
	Unit:RegisterEvent("Entropius_Darkness",45000,0)
	Unit:RegisterEvent("Entropius_BlackHole",150000,0)
	Unit:RegisterEvent("Entropius_Enrage",6000000,0)
end

function Entropius_NegativeEnergy(Unit, Event)
   Unit:CastSpellOnTarget(46289, Unit:GetRandomPlayer(0))
   Unit:CastSpellOnTarget(46289, Unit:GetRandomPlayer(0))
   Unit:CastSpellOnTarget(46289, Unit:GetRandomPlayer(0))
   Unit:CastSpellOnTarget(46289, Unit:GetRandomPlayer(0))
   Unit:CastSpellOnTarget(46289, Unit:GetRandomPlayer(0))
end

function Entropius_Enrage(Unit, Event)
    Unit:CastSpell(26662)
end

function Entropius_Darkness(Unit, Event)
    Unit:FullCastSpellOnTarget(45141, Unit:GetRandomPlayer(0))   
end

function Entropius_BlackHole(Unit, Event)
   x = Unit:GetX ()
   y = Unit:GetY ()
   z = Unit:GetZ ()
   o = Unit:GetO ()
   Unit:SpawnCreature(25855, x-1, y, z, o, 16, o)
   Unit:SpawnCreature(25855, x+1, y, z, o, 16, o)
   Unit:CastSpellOnTarget(45996, Unit:GetRandomPlayer(0))
end

function Entropius_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Entropius_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(25840, 1, "Entropius_OnEnterCombat")
RegisterUnitEvent(25840, 2, "Entropius_OnLeaveCombat")
RegisterUnitEvent(25840, 4, "Entropius_OnDied")

function Summonmove(Unit)   
   Unit:MoveTo(1815.3, 625.193, 69.6075, 2.3)
end

RegisterUnitEvent(25798,6,"Summonmove")
RegisterUnitEvent(25799,6,"Summonmove")

function VoidSentinel1_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("VoidSentinel1_ShadowPulsePeriodic",7000,0)
	Unit:RegisterEvent("VoidSentinel1_VoidBlast",3000,0)
	Unit:Despawn(60000, 0)
end

function VoidSentinel1_ShadowPulsePeriodic(Unit, Event)
    Unit:CastSpellOnTarget (46086,Unit:GetRandomPlayer(0))
end

function VoidSentinel1_VoidBlast(Unit, Event)
    Unit:FullCastSpellOnTarget (46161,Unit:GetRandomPlayer(1))
end

function VoidSentinel1_OnDied(Unit, Event)
   x = Unit:GetX ()
   y = Unit:GetY ()
   z = Unit:GetZ ()
   o = Unit:GetO ()
   Unit:SpawnCreature(25782, x-1, y, z, o, 16, o)
   Unit:SpawnCreature(25782, x+1, y, z, o, 16, o)
   Unit:SpawnCreature(25782, x, y-1, z, o, 16, o)
   Unit:SpawnCreature(25782, x, y+1, z, o, 16, o)
   Unit:SpawnCreature(25782, x-3, y, z, o, 16, o)
   Unit:SpawnCreature(25782, x+5, y, z, o, 16, o)
end

function VoidSentinel1_spawndisplay(Unit, Event)
	Unit:SetModel(22742)
end

function VoidSentinel1_moveset(Unit)   
   Unit:RegisterEvent("VoidSentinel1_spawndisplay",1000,1)
   Unit:RegisterEvent("VoidSentinel1_move",4000,0)
end

function VoidSentinel1_move(Unit, Event)
	Unit:MoveTo(1815.3, 625.193, 69.6075, 2.3)
    Unit:SetModel(23372)
end

RegisterUnitEvent(25772, 1, "VoidSentinel1_OnEnterCombat")
RegisterUnitEvent(25772, 4, "VoidSentinel1_OnDied")
RegisterUnitEvent(25772, 6, "VoidSentinel1_moveset")

function VoidSentinel2_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("VoidSentinel2_ShadowBoltVolley", 5000, 0)
	Unit:Despawn(30000, 0)
end

function VoidSentinel2_ShadowBoltVolley(Unit, Event)
    Unit:FullCastSpellOnTarget(46082, Unit:GetRandomPlayer(1))
end

function VoidSentinel2_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(25782, 1, "VoidSentinel2_OnEnterCombat")
RegisterUnitEvent(25782, 4, "VoidSentinel2_OnDied")

function SummonFuryMage_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("SummonFuryMage_FelFireball", 5000, 0)
	Unit:RegisterEvent("SummonFuryMage_SpellFury", 5000, 0)
end

function SummonFuryMage_FelFireball(Unit, Event)
    Unit:FullCastSpellOnTarget(46101,Unit:GetRandomPlayer(1))
end

function SummonFuryMage_SpellFury(Unit, Event)
    Unit:FullCastSpellOnTarget(46102,Unit:GetRandomPlayer(1))
end

function SummonFuryMage_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(25798, 1, "SummonFuryMage_OnEnterCombat")
RegisterUnitEvent(25798, 4, "SummonFuryMage_OnDied")

function SummonBerserk_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("SummonBerserk_Flurry", math.random(25000, 30000),0)
end

function SummonBerserk_Flurry(Unit, Event)
   pUnit:CastSpell(46160)
end

function SummonBerserk_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(25798, 1, "SummonBerserk_OnEnterCombat")
RegisterUnitEvent(25798, 4, "SummonBerserk_OnDied")

function Sathrovarr_OnEnterCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "There will be no reprieve! My work here is nearly finished!")
	pUnit:RegisterEvent("Sath_Curse", 35000, 0)
	pUnit:RegisterEvent("Sath_ShadowBoltVolley", 10000, 0)
	pUnit:RegisterEvent("Sath_CorruptingStrike", 25000, 0)
	pUnit:RegisterEvent("Sathrovarr_Berserk", 60000, 0)
end

function Sathrovarr_Curse(pUnit, Event)
local Choice = math.random(1,2)
	if(Choice == 1) then
		pUnit:SendChatMessage(14, 0, "Your misery is my delight!")
	elseif(Choice == 2) then
		pUnit:SendChatMessage(14, 0, "I will watch you bleed!")
	end
	pUnit:CastSpellOnTarget(45034, pUnit:GetRandomPlayer(0))	
end

function Sathrovarr_ShadowBoltVolley(pUnit, Event)
local Choice = math.random(1,2)
	if(Choice == 1) then
		pUnit:SendChatMessage(14, 0, "Your misery is my delight!")
	elseif(Choice == 2) then
		pUnit:SendChatMessage(14, 0, "I will watch you bleed!")
	end
	pUnit:CastSpellOnTarget(45031,pUnit:GetRandomPlayer(0))
end

function Sathrovarr_CorruptingStrike(pUnit, Event)
local Choice = math.random(1,2)
	if(Choice == 1) then
		pUnit:SendChatMessage(14, 0, "Your misery is my delight!")
	elseif(Choice == 2) then
		pUnit:SendChatMessage(14, 0, "I will watch you bleed!")
	end
	pUnit:CastSpellOnTarget(45029,pUnit:GetRandomPlayer(0))	
end

function Sathrovarr_Berserk(pUnit,Event)
	pUnit:SendChatmessaeg(14, 0, "I have toyed with you long enough!")
	pUnit:CastSpellOnTarget(45032,pUnit:GetRandomPlayer(0))
end

function Sathrovarr_OnKill(pUnit, Event)
	local Choice = math.random(1,2)
	if(Choice == 1) then
		pUnit:SendChatMessage(14, 0, "Piteous mortal!")
	elseif(Choice == 2) then
		pUnit:SendChatMessage(14, 0, "Haven't you heard? I always win!")	
	end
end

function Sathrovarr_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Sathrovarr_OnDied(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "I'm never on the... losing... side!")
	pUnit:RemoveEvents()	
end

RegisterUnitEvent(24892, 1, "Sathrovarr_OnEnterCombat")
RegisterUnitEvent(24892, 2, "Sathrovarr_OnLeaveCombat")
RegisterUnitEvent(24892, 3, "Sathrovarr_OnKill")
RegisterUnitEvent(24892, 4, "Sathrovarr_OnDied")

--Sunblade Protector
function SUNBLADE_PROTECTOR_LIGHTING(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46480, Unit:GetRandomPlayer(0))
end

function SUNBLADE_PROTECTOR_OnCombat(Unit,event)
    Unit:RegisterEvent("SUNBLADE_PROTECTOR_LIGHTING", 10000, 0)
end

function SUNBLADE_PROTECTOR_OnLeaveCombat(Unit,Event)
    Unit:RemoveEvents()
end

function SUNBLADE_PROTECTOR_OnDied(Unit,Event)
    Unit:RemoveEvents()
end

--Sunblade Cabalist
function SUNBLADE_CABALIST_IGNITE_MANA(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46543, Unit:GetRandomPlayer(4))
end

function SUNBLADE_CABALIST_SUMMON_IMP(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46544, Unit:GetRandomPlayer(0))
end

function SUNBLADE_CABALIST_SHADOWBOLT(Unit, event, miscUnit, misc)
   Unit:CastSpellOnTarget(47248, Unit:GetRandomPlayer(0))
end

function SUNBLADE_CABALIST_OnCombat(Unit,event)
    Unit:RegisterEvent("SUNBLADE_CABALIST_IGNITE_MANA", 10000, 0)
    Unit:RegisterEvent("SUNBLADE_CABALIST_SUMMON_IMP", 10000, 0)
    Unit:RegisterEvent("SUNBLADE_CABALIST_SHADOWBOLT", 5000, 0)
end

function SUNBLADE_CABALIST_OnLeaveCombat(Unit,Event)
    Unit:RemoveEvents()
end

function SUNBLADE_CABALIST_OnDied(Unit,Event)
    Unit:RemoveEvents()
end

--Sunblade Arch Mage
function SUNBLADE_ARCHMAGE_ARCANE_EXPLOSION(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46553, Unit:GetRandomPlayer(0))
end

function SUNBLADE_ARCHMAGE_FROSTNOVA(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46555, Unit:GetClosestPlayer())
end

function SUNBLADE_ARCHMAGE_BLINK(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46573, Unit:GetRandomPlayer(0))
end

function SUNBLADE_ARCHMAGE_OnCombat(Unit,event)
    Unit:RegisterEvent("SUNBLADE_ARCHMAGE_ARCANE_EXPLOSION", 5000, 0)
    Unit:RegisterEvent("SUNBLADE_ARCHMAGE_FROSTNOVA", 10000, 0)
    Unit:RegisterEvent("SUNBLADE_ARCHMAGE_BLINK", 20000, 0)
end

function SUNBLADE_ARCHMAGE_OnLeaveCombat(Unit,Event)
    Unit:RemoveEvents()
end

function SUNBLADE_ARCHMAGE_OnDied(Unit,Event)
    Unit:RemoveEvents()
end

--Sunblade Dawn Priest
function SUNBLADE_DAWNPRIEST_RENEW(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46563, Unit:GetRandomFriend(0))
end

function SUNBLADE_DAWNPRIEST_HOLYNOVA(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46564, Unit:GetRandomPlayer(1))
end

function SUNBLADE_DAWNPRIEST_HOLYFORM(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46565, Unit:GetRandomPlayer(0))
end

function SUNBLADE_DAWNPRIEST_OnCombat(Unit,event)
    Unit:RegisterEvent("SUNBLADE_DAWNPRIEST_RENEW", 10000, 0)
    Unit:RegisterEvent("SUNBLADE_DAWNPRIEST_HOLYNOVA", 10000, 0)
    Unit:RegisterEvent("SUNBLADE_DAWNPRIEST_HOLYFORM", 20000, 0)
end

function SUNBLADE_DAWNPRIEST_OnLeaveCombat(Unit,Event)
    Unit:RemoveEvents()
end

function SUNBLADE_DAWNPRIEST_OnDied(Unit,Event)
    Unit:RemoveEvents()
end

--Sunblade Dragonhawk
function SUNBLADE_DRAGONHAWK_FLAMEBREATH(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(47251, Unit:GetRandomPlayer(1))
end

function SUNBLADE_DRAGONHAWK_OnCombat(Unit,event)
    Unit:RegisterEvent("SUNBLADE_DRAGONHAWK_FLAMEBREATH", 8000, 0)
end

function SUNBLADE_DRAGONHAWK_OnLeaveCombat(Unit,Event)
    Unit:RemoveEvents()
end

function SUNBLADE_DRAGONHAWK_OnDied(Unit,Event)
    Unit:RemoveEvents()
end

--Sunblade Dusk Priest
function SUNBLADE_DUSK_PRIEST_SHADOWORD_PAIN(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46560, Unit:GetRandomPlayer(0))
end

function SUNBLADE_DUSK_PRIEST_FEAR(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46561, Unit:GetRandomPlayer(1))
end

function SUNBLADE_DUSK_PRIEST_MIND_FLAY(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(47262, Unit:GetRandomPlayer(2))
end

function SUNBLADE_DUSK_PRIEST_OnCombat(Unit,event)
    Unit:RegisterEvent("SUNBLADE_DUSK_PRIEST_SHADOWORD_PAIN", 15000, 0)
    Unit:RegisterEvent("SUNBLADE_DUSK_PRIEST_FEAR", 15000, 0)
    Unit:RegisterEvent("SUNBLADE_DUSK_PRIEST_MIND_FLAY", 10000, 0)
end

function SUNBLADE_DUSK_PRIEST_OnLeaveCombat(Unit,Event)
    Unit:RemoveEvents()
end

function SUNBLADE_DUSK_PRIEST_OnDied(Unit,Event)
    Unit:RemoveEvents()
end

--Sunblade Scout
function SUNBLADE_SCOUT_SINISTER_STRIKE(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46558, Unit:GetRandomPlayer(1))
end

function SUNBLADE_SCOUT_OnCombat(Unit,event)
    Unit:RegisterEvent("SUNBLADE_SCOUT_SINISTER_STRIKE", 5000, 0)
end

function SUNBLADE_SCOUT_OnLeaveCombat(Unit,Event)
    Unit:RemoveEvents()
end

function SUNBLADE_SCOUT_OnDied(Unit,Event)
    Unit:RemoveEvents()
end

--SUNBLADE SLAYER
function SUNBLADE_SLAYER_SLAYING_SHOT(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46557, Unit:GetRandomPlayer(2))
end

function SUNBLADE_SLAYER_SHOOT(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(47001, Unit:GetRandomPlayer(2))
end

function SUNBLADE_SLAYER_OnCombat(Unit,event)
    Unit:RegisterEvent("SUNBLADE_SLAYER_SLAYING_SHOT", 10000, 0)
    Unit:RegisterEvent("SUNBLADE_SLAYER_SHOOT", 10000, 0)
end

function SUNBLADE_SLAYER_OnLeaveCombat(Unit,Event)
    Unit:RemoveEvents()
end

function SUNBLADE_SLAYER_OnDied(Unit,Event)
    Unit:RemoveEvents()
end

--Sunblade Vindicator
function SUNBLADE_VINDICATOR_MORTAL_STRIKE(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(39171, Unit:GetClosestPlayer())
end

function SUNBLADE_VINDICATOR_CLEAVE(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46559, Unit:GetClosestPlayer())
end

function SUNBLADE_VINDICATOR_OnCombat(Unit,event)
    Unit:RegisterEvent("SUNBLADE_VINDICATOR_MORTAL_STRIKE", 10000,0)
    Unit:RegisterEvent("SUNBLADE_VINDICATOR_CLEAVE", 7000, 0)
end

function SUNBLADE_VINDICATOR_OnLeaveCombat(Unit,Event)
    Unit:RemoveEvents()
end

function SUNBLADE_VINDICATOR_OnDied(Unit,Event)
    Unit:RemoveEvents()
end

--Shadowsword Soulbinder
function SHADOWSWORD_SOULBINDER_CURSE_OF_EXHAUSTION(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46434, Unit:GetRandomPlayer(7))
end

function SHADOWSWORD_SOULBINDER_FLASH_OF_DARKNESS(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46442, Unit:GetClosestPlayer())
end

function SHADOWSWORD_SOULBINDER_OnCombat(Unit,event)
    Unit:RegisterEvent("SHADOWSWORD_SOULBINDER_CURSE_OF_EXHAUSTION", 4000, 0)
    Unit:RegisterEvent("SHADOWSWORD_SOULBINDER_FLASH_OF_DARKNESS", 10000, 0)
end

function SHADOWSWORD_SOULBINDER_OnLeaveCombat(Unit,Event)
    Unit:RemoveEvents()
end

function SHADOWSWORD_SOULBINDER_OnDied(Unit,Event)
    Unit:RemoveEvents()
end

--Shadowsword Assassin
function SHADOWSWORD_ASSASSIN_ASSASSINS_MARK(Unit, event, miscUnit, misc)
   Unit:CastSpellOnTarget(46459, Unit:GetRandomPlayer(0))
end

function SHADOWSWORD_ASSASSIN_SHADOWSTEP(Unit, event, miscUnit, misc)
   Unit:CastSpellOnTarget(46463, Unit:GetRandomPlayer(0))
end

function SHADOWSWORD_ASSASSIN_OnCombat(Unit,event)
    Unit:RegisterEvent("SHADOWSWORD_ASSASSIN_ASSASSINS_MARK", 4000, 0)
    Unit:RegisterEvent("SHADOWSWORD_ASSASSIN_SHADOWSTEP", 10000, 0)
end

function SHADOWSWORD_ASSASSIN_OnLeaveCombat(Unit,Event)
    Unit:RemoveEvents()
end

function SHADOWSWORD_ASSASSIN_OnDied(Unit,Event)
    Unit:RemoveEvents()
end

--Shadowsword Lifeshaper
function SHADOWSWORD_LIFESHAPER_DRAIN_LIFE(Unit, event, miscUnit, misc)
   Unit:CastSpellOnTarget(46466, Unit:GetRandomPlayer(7))
end

function SHADOWSWORD_LIFESHAPER_HEALTH_FUNNEL(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46467, Unit:GetRandomFriend())
end

function SHADOWSWORD_LIFESHAPER_OnCombat(Unit,event)
    Unit:RegisterEvent("SHADOWSWORD_LIFESHAPER_DRAIN_LIFE", 10000, 0)
    Unit:RegisterEvent("SHADOWSWORD_LIFESHAPER_HEALTH_FUNNEL", 8000, 0)
end

function SHADOWSWORD_LIFESHAPER_OnLeaveCombat(Unit,Event)
    Unit:RemoveEvents()
end

function SHADOWSWORD_LIFESHAPER_OnDied(Unit,Event)
    Unit:RemoveEvents()
end

--Shadowsword Vanquisher
function SHADOWSWORD_VANQUISHER_CLEAVE(Unit, event, miscUnit, misc)
   Unit:CastSpellOnTarget(46468, Unit:GetclosestPlayer())
end

function SHADOWSWORD_VANQUISHER_MELT_ARMOR(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46469, Unit:GetMainTank())
end

function SHADOWSWORD_VANQUISHER_OnCombat(Unit,event)
    Unit:RegisterEvent("SHADOWSWORD_VANQUISHER_CLEAVE", 10000, 0)
    Unit:RegisterEvent("SHADOWSWORD_VANQUISHER_MELT_ARMOR", 20000, 0)
end

function SHADOWSWORD_VANQUISHER_OnLeaveCombat(Unit,Event)
    Unit:RemoveEvents()
end

function SHADOWSWORD_VANQUISHER_OnDied(Unit,Event)
    Unit:RemoveEvents()
end

--Shadowsword Manafiend
function SHADOWSWORD_MANA_FIEND_DRAIN_MANA(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46453, Unit:GetRandomPlayer(4))
end

function SHADOWSWORD_MANA_FIEND_ARCANE_EXPLOSION(Unit, event, miscUnit, misc)
   Unit:CastSpellOnTarget(46457, Unit:GetClosestPlayer())
end

function SHADOWSWORD_MANA_FIEND_OnCombat(Unit,event)
    Unit:RegisterEvent("SHADOWSWORD_MANA_FIEND_DRAIN_MANA", 10000, 0)
    Unit:RegisterEvent("SHADOWSWORD_MANA_FIEND_ARCANE_EXPLOSION", 8000, 0)
end

function SHADOWSWORD_MANA_FIEND_OnLeaveCombat(Unit,Event)
    Unit:RemoveEvents()
end

function SHADOWSWORD_MANA_FIEND_OnDied(Unit,Event)
    Unit:RemoveEvents()
end

RegisterUnitEvent(25483, 1,"SHADOWSWORD_MANA_FIEND_OnCombat")
RegisterUnitEvent(25483, 2,"SHADOWSWORD_MANA_FIEND_OnLeaveCombat")
RegisterUnitEvent(25483, 4,"SHADOWSWORD_MANA_FIEND_OnDied")
RegisterUnitEvent(25486, 1,"SHADOWSWORD_VANQUISHER_OnCombat")
RegisterUnitEvent(25486, 2,"SHADOWSWORD_VANQUISHER_OnLeaveCombat")
RegisterUnitEvent(25486, 4,"SHADOWSWORD_VANQUISHER_OnDied")
RegisterUnitEvent(25506, 1,"SHADOWSWORD_LIFESHAPER_OnCombat")
RegisterUnitEvent(25506, 2,"SHADOWSWORD_LIFESHAPER_OnLeaveCombat")
RegisterUnitEvent(25506, 4,"SHADOWSWORD_LIFESHAPER_OnDied")
RegisterUnitEvent(25484, 1,"SHADOWSWORD_ASSASSIN_OnCombat")
RegisterUnitEvent(25484, 2,"SHADOWSWORD_ASSASSIN_OnLeaveCombat")
RegisterUnitEvent(25484, 4,"SHADOWSWORD_ASSASSIN_OnDied")
RegisterUnitEvent(25373, 1,"SHADOWSWORD_SOULBINDER_OnCombat")
RegisterUnitEvent(25373, 2,"SHADOWSWORD_SOULBINDER_OnLeaveCombat")
RegisterUnitEvent(25373, 4,"SHADOWSWORD_SOULBINDER_OnDied")
RegisterUnitEvent(25369, 1, "SUNBLADE_VINDICATOR_OnCombat")
RegisterUnitEvent(25369, 2, "SUNBLADE_VINDICATOR_OnLeaveCombat")
RegisterUnitEvent(25369, 4, "SUNBLADE_VINDICATOR_OnDied")
RegisterUnitEvent(25368, 1, "SUNBLADE_SLAYER_OnCombat")
RegisterUnitEvent(25368, 2, "SUNBLADE_SLAYER_OnLeaveCombat")
RegisterUnitEvent(25368, 4, "SUNBLADE_SLAYER_OnDied")
RegisterUnitEvent(25372, 1, "SUNBLADE_SCOUT_OnCombat")
RegisterUnitEvent(25372, 2, "SUNBLADE_SCOUT_OnLeaveCombat")
RegisterUnitEvent(25372, 4, "SUNBLADE_SCOUT_OnDied")
RegisterUnitEvent(25370, 1, "SUNBLADE_DUSK_PRIEST_OnCombat")
RegisterUnitEvent(25370, 2, "SUNBLADE_DUSK_PRIEST_OnLeaveCombat")
RegisterUnitEvent(25370, 4, "SUNBLADE_DUSK_PRIEST_OnDied")
RegisterUnitEvent(25867, 1, "SUNBLADE_DRAGONHAWK_OnCombat")
RegisterUnitEvent(25867, 2, "SUNBLADE_DRAGONHAWK_OnLeaveCombat")
RegisterUnitEvent(25867, 4, "SUNBLADE_DRAGONHAWK_OnDied")
RegisterUnitEvent(25371, 1, "SUNBLADE_DAWNPRIEST_OnCombat")
RegisterUnitEvent(25371, 2, "SUNBLADE_DAWNPRIEST_OnLeaveCombat")
RegisterUnitEvent(25371, 4, "SUNBLADE_DAWNPRIEST_OnDied")
RegisterUnitEvent(25363, 1, "SUNBLADE_CABALIST_OnCombat")
RegisterUnitEvent(25363, 2, "SUNBLADE_CABALIST_OnLeaveCombat")
RegisterUnitEvent(25363, 4, "SUNBLADE_CABALIST_OnDied")
RegisterUnitEvent(25367, 1, "SUNBLADE_ARCHMAGE_OnCombat")
RegisterUnitEvent(25367, 2, "SUNBLADE_ARCHMAGE_OnLeaveCombat")
RegisterUnitEvent(25367, 4, "SUNBLADE_ARCHMAGE_OnDied")
RegisterUnitEvent(25507, 1, "SUNBLADE_PROTECTOR_OnCombat")
RegisterUnitEvent(25507, 2, "SUNBLADE_PROTECTOR_OnLeaveCombat")
RegisterUnitEvent(25507, 4, "SUNBLADE_PROTECTOR_OnDied")