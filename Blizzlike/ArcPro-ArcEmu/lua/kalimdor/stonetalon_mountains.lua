--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function BrotherRavenoak_OnCombat(Unit, Event)
	UnitRegisterEvent("BrotherRavenoak_LowSwipe", 10000, 0)
	UnitRegisterEvent("BrotherRavenoak_Maul", 6000, 0)
end

function BrotherRavenoak_LowSwipe(Unit, Event) 
	UnitFullCastSpellOnTarget(8716, UnitGetMainTank()) 
end

function BrotherRavenoak_Maul(Unit, Event) 
	UnitFullCastSpellOnTarget(12161, UnitGetMainTank()) 
end

function BrotherRavenoak_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function BrotherRavenoak_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(5915, 1, "BrotherRavenoak_OnCombat")
RegisterUnitEvent(5915, 2, "BrotherRavenoak_OnLeaveCombat")
RegisterUnitEvent(5915, 4, "BrotherRavenoak_OnDied")

function ForemanRigger_OnCombat(Unit, Event)
	UnitRegisterEvent("ForemanRigger_Net", 10000, 0)
	UnitRegisterEvent("ForemanRigger_PierceArmor", 12000, 1)
end

function ForemanRigger_Net(Unit, Event) 
	UnitFullCastSpellOnTarget(6533, UnitGetRandomPlayer(4)) 
end

function ForemanRigger_PierceArmor(Unit, Event) 
	UnitFullCastSpellOnTarget(6016, UnitGetMainTank()) 
end

function ForemanRigger_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function ForemanRigger_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(5931, 1, "ForemanRigger_OnCombat")
RegisterUnitEvent(5931, 2, "ForemanRigger_OnLeaveCombat")
RegisterUnitEvent(5931, 4, "ForemanRigger_OnDied")

function Goggeroc_OnCombat(Unit, Event)
	UnitRegisterEvent("Goggeroc_SnapKick", 6000, 0)
	UnitRegisterEvent("Goggeroc_Uppercut", 1000, 0)
end

function Goggeroc_SnapKick(Unit, Event) 
	UnitFullCastSpellOnTarget(8646, UnitGetMainTank()) 
end

function Goggeroc_Uppercut(Unit, Event) 
	UnitFullCastSpellOnTarget(10966, UnitGetMainTank()) 
end

function Goggeroc_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function Goggeroc_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(11920, 1, "Goggeroc_OnCombat")
RegisterUnitEvent(11920, 2, "Goggeroc_OnLeaveCombat")
RegisterUnitEvent(11920, 4, "Goggeroc_OnDied")

function GorehooftheBlack_OnCombat(Unit, Event)
	UnitRegisterEvent("GorehooftheBlack_WarStomp", 8000, 0)
end

function GorehooftheBlack_WarStomp(Unit, Event) 
	UnitCastSpell(45) 
end

function GorehooftheBlack_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function GorehooftheBlack_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(11914, 1, "GorehooftheBlack_OnCombat")
RegisterUnitEvent(11914, 2, "GorehooftheBlack_OnLeaveCombat")
RegisterUnitEvent(11914, 4, "GorehooftheBlack_OnDied")

function Naltaszar_OnCombat(Unit, Event)
	UnitRegisterEvent("Naltaszar_ChainBurn", 10000, 0)
	UnitRegisterEvent("Naltaszar_ChainLightning", 6000, 0)
end

function Naltaszar_ChainBurn(Unit, Event) 
	UnitFullCastSpellOnTarget(8211, UnitGetRandomPlayer(4)) 
end

function Naltaszar_ChainLightning(Unit, Event) 
	UnitFullCastSpellOnTarget(15305, UnitGetMainTank()) 
end

function Naltaszar_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function Naltaszar_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4066, 1, "Naltaszar_OnCombat")
RegisterUnitEvent(4066, 2, "Naltaszar_OnLeaveCombat")
RegisterUnitEvent(4066, 4, "Naltaszar_OnDied")

function RyntharieltheKeymaster_OnCombat(Unit, Event)
	UnitRegisterEvent("RyntharieltheKeymaster_SlowingPoison", 10000, 0)
	UnitRegisterEvent("RyntharieltheKeymaster_Throw", 6000, 0)
end

function RyntharieltheKeymaster_SlowingPoison(Unit, Event) 
	UnitFullCastSpellOnTarget(7992, UnitGetMainTank()) 
end

function RyntharieltheKeymaster_Throw(Unit, Event) 
	UnitFullCastSpellOnTarget(10277, UnitGetMainTank()) 
end

function RyntharieltheKeymaster_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function RyntharieltheKeymaster_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(8518, 1, "RyntharieltheKeymaster_OnCombat")
RegisterUnitEvent(8518, 2, "RyntharieltheKeymaster_OnLeaveCombat")
RegisterUnitEvent(8518, 4, "RyntharieltheKeymaster_OnDied")

function SentinelAmarassan_OnCombat(Unit, Event)
	UnitRegisterEvent("SentinelAmarassan_Wrath", 5000, 2)
	UnitRegisterEvent("SentinelAmarassan_CatForm", 12000, 1)
	UnitRegisterEvent("SentinelAmarassan_TigersFury", 14000, 1)
end

function SentinelAmarassan_Wrath(Unit, Event) 
	UnitFullCastSpellOnTarget(9739, UnitGetMainTank()) 
end

function SentinelAmarassan_CatForm(Unit, Event) 
	UnitCastSpell(5759) 
end

function SentinelAmarassan_TigersFury(Unit, Event) 
	UnitCastSpell(5217) 
end

function SentinelAmarassan_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function SentinelAmarassan_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(5916, 1, "SentinelAmarassan_OnCombat")
RegisterUnitEvent(5916, 2, "SentinelAmarassan_OnLeaveCombat")
RegisterUnitEvent(5916, 4, "SentinelAmarassan_OnDied")

function SisterRiven_OnCombat(Unit, Event)
	UnitRegisterEvent("SisterRiven_FireShieldII", 1000, 1)
	UnitRegisterEvent("SisterRiven_FlameLash", 4000, 1)
	UnitRegisterEvent("SisterRiven_FlameSpike", 6000, 1)
end

function SisterRiven_FireShieldII(Unit, Event) 
	UnitCastSpell(184) 
end

function SisterRiven_FlameLash(Unit, Event) 
	UnitFullCastSpellOnTarget(3356, UnitGetMainTank()) 
end

function SisterRiven_FlameSpike(Unit, Event) 
	UnitCastSpell(6725) 
end

function SisterRiven_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function SisterRiven_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(5930, 1, "SisterRiven_OnCombat")
RegisterUnitEvent(5930, 2, "SisterRiven_OnLeaveCombat")
RegisterUnitEvent(5930, 4, "SisterRiven_OnDied")

function SorrowWing_OnCombat(Unit, Event)
	UnitRegisterEvent("SorrowWing_SoulRend", 6000, 1)
	UnitRegisterEvent("SorrowWing_DeadlyLeechPoison", 8000, 1)
end

function SorrowWing_SoulRend(Unit, Event) 
	UnitFullCastSpellOnTarget(3405, UnitGetMainTank()) 
end

function SorrowWing_DeadlyLeechPoison(Unit, Event) 
	UnitFullCastSpellOnTarget(3388, UnitGetMainTank()) 
end

function SorrowWing_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function SorrowWing_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(5928, 1, "SorrowWing_OnCombat")
RegisterUnitEvent(5928, 2, "SorrowWing_OnLeaveCombat")
RegisterUnitEvent(5928, 4, "SorrowWing_OnDied")

function Besseleth_OnCombat(Unit, Event)
	UnitRegisterEvent("Besseleth_VenomSting", 10000, 0)
	UnitRegisterEvent("Besseleth_Web", 12000, 0)
end

function Besseleth_VenomSting(Unit, Event) 
	UnitFullCastSpellOnTarget(5416, UnitGetMainTank()) 
end

function Besseleth_Web(Unit, Event) 
	UnitFullCastSpellOnTarget(745, UnitGetMainTank()) 
end

function Besseleth_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function Besseleth_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(11921, 1, "Besseleth_OnCombat")
RegisterUnitEvent(11921, 2, "Besseleth_OnLeaveCombat")
RegisterUnitEvent(11921, 4, "Besseleth_OnDied")

--Antlered Courser
function AntleredCourser_OnCombat(Unit, Event)
	UnitRegisterEvent("AntleredCourser_RushingCharge", 8000, 0)
end

function AntleredCourser_RushingCharge(Unit, Event) 
	UnitCastSpell(6268) 
end

function AntleredCourser_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function AntleredCourser_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4018, 1, "AntleredCourser_OnCombat")
RegisterUnitEvent(4018, 2, "AntleredCourser_OnLeaveCombat")
RegisterUnitEvent(4018, 4, "AntleredCourser_OnDied")

--Blackened Basilisk
function BlackenedBasilisk_OnCombat(Unit, Event)
	UnitRegisterEvent("BlackenedBasilisk_CrystallineSlumber", 15000, 1)
end

function BlackenedBasilisk_CrystallineSlumber(Unit, Event) 
	UnitFullCastSpellOnTarget(3636, UnitGetMainTank()) 
end

function BlackenedBasilisk_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function BlackenedBasilisk_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4044, 1, "BlackenedBasilisk_OnCombat")
RegisterUnitEvent(4044, 2, "BlackenedBasilisk_OnLeaveCombat")
RegisterUnitEvent(4044, 4, "BlackenedBasilisk_OnDied")

--Bloodfury Ambusher
function BloodfuryAmbusher_OnCombat(Unit, Event)
	UnitRegisterEvent("BloodfuryAmbusher_Shock", 8000, 1)
end

function BloodfuryAmbusher_Shock(Unit, Event) 
	UnitFullCastSpellOnTarget(2608, UnitGetMainTank()) 
end

function BloodfuryAmbusher_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function BloodfuryAmbusher_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4025, 1, "BloodfuryAmbusher_OnCombat")
RegisterUnitEvent(4025, 2, "BloodfuryAmbusher_OnLeaveCombat")
RegisterUnitEvent(4025, 4, "BloodfuryAmbusher_OnDied")

--Bloodfury Ripper
function BloodfuryRipper_OnCombat(Unit, Event)
	UnitRegisterEvent("BloodfuryRipper_Enrage", 15000, 1)
	UnitRegisterEvent("BloodfuryRipper_Rend", 10000, 0)
end

function BloodfuryRipper_Enrage(Unit, Event) 
	UnitCastSpell(8599) 
end

function BloodfuryRipper_Rend(Unit, Event) 
	UnitFullCastSpellOnTarget(13443, UnitGetMainTank()) 
end

function BloodfuryRipper_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function BloodfuryRipper_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(12579, 1, "BloodfuryRipper_OnCombat")
RegisterUnitEvent(12579, 2, "BloodfuryRipper_OnLeaveCombat")
RegisterUnitEvent(12579, 4, "BloodfuryRipper_OnDied")

--Bloodfury Roguefeather
function BloodfuryRoguefeather_OnCombat(Unit, Event)
	UnitRegisterEvent("BloodfuryRoguefeather_Thrash", 5000, 0)
end

function BloodfuryRoguefeather_Thrash(Unit, Event) 
	UnitFullCastSpellOnTarget(3391, 	UnitGetMainTank()) 
end

function BloodfuryRoguefeather_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function BloodfuryRoguefeather_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4023, 1, "BloodfuryRoguefeather_OnCombat")
RegisterUnitEvent(4023, 2, "BloodfuryRoguefeather_OnLeaveCombat")
RegisterUnitEvent(4023, 4, "BloodfuryRoguefeather_OnDied")

--Bloodfury Slayer
function BloodfurySlayer_OnCombat(Unit, Event)
	UnitRegisterEvent("BloodfuryRoguefeather_CurseofRecklessness", 5000, 2)
end

function BloodfuryRoguefeather_CurseofRecklessness(Unit, Event) 
	UnitFullCastSpellOnTarget(16231, UnitGetMainTank()) 
end

function BloodfurySlayer_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function BloodfurySlayer_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4024, 1, "BloodfurySlayer_OnCombat")
RegisterUnitEvent(4024, 2, "BloodfurySlayer_OnLeaveCombat")
RegisterUnitEvent(4024, 4, "BloodfurySlayer_OnDied")

--Bloodfury Storm Witch
function BloodfuryStormWitch_OnCombat(Unit, Event)
	UnitRegisterEvent("BloodfuryStormWitch_LightningBolt", 8000, 0)
	UnitRegisterEvent("BloodfuryStormWitch_LightningCloud", 4000, 1)
end

function BloodfuryStormWitch_LightningBolt(Unit, Event) 
	UnitFullCastSpellOnTarget(9532, UnitGetMainTank()) 
end

function BloodfuryStormWitch_LightningCloud(Unit, Event) 
	UnitFullCastSpellOnTarget(6535, UnitGetMainTank()) 
end

function BloodfuryStormWitch_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function BloodfuryStormWitch_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4027, 1, "BloodfuryStormWitch_OnCombat")
RegisterUnitEvent(4027, 2, "BloodfuryStormWitch_OnLeaveCombat")
RegisterUnitEvent(4027, 4, "BloodfuryStormWitch_OnDied")

--Bloodfury Windcaller
function BloodfuryWindcaller_OnCombat(Unit, Event)
	UnitRegisterEvent("BloodfuryWindcaller_EnvelopingWinds", 15000, 0)
end

function BloodfuryWindcaller_EnvelopingWinds(Unit, Event) 
	UnitFullCastSpellOnTarget(6728, UnitGetMainTank()) 
end

function BloodfuryWindcaller_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function BloodfuryWindcaller_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4026, 1, "BloodfuryWindcaller_OnCombat")
RegisterUnitEvent(4026, 2, "BloodfuryWindcaller_OnLeaveCombat")
RegisterUnitEvent(4026, 4, "BloodfuryWindcaller_OnDied")

--Burning Destroyer
function BurningDestroyer_OnCombat(Unit, Event)
	UnitRegisterEvent("BurningDestroyer_AreaBurn", 3000, 2)
	UnitRegisterEvent("BurningDestroyer_Fireball", 8000, 0)
end

function BurningDestroyer_AreaBurn(Unit, Event) 
	UnitCastSpell(8000) 
end

function BurningDestroyer_Fireball(Unit, Event) 
	UnitFullCastSpellOnTarget(9053, UnitGetMainTank()) 
end

function BurningDestroyer_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function BurningDestroyer_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4038, 1, "BurningDestroyer_OnCombat")
RegisterUnitEvent(4038, 2, "BurningDestroyer_OnLeaveCombat")
RegisterUnitEvent(4038, 4, "BurningDestroyer_OnDied")

--Burning Ravager
function BurningRavager_OnCombat(Unit, Event)
	UnitRegisterEvent("BurningRavager_FireShieldII", 4000, 2)
end

function BurningRavager_FireShieldII(Unit, Event) 
	UnitCastSpell(184) 
end

function BurningDestroyer_Fireball(Unit, Event) 
	UnitFullCastSpellOnTarget(9053, UnitGetMainTank()) 
end

function BurningRavager_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function BurningRavager_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4037, 1, "BurningRavager_OnCombat")
RegisterUnitEvent(4037, 2, "BurningRavager_OnLeaveCombat")
RegisterUnitEvent(4037, 4, "BurningRavager_OnDied")

--Cenarion Botanist
function CenarionBotanist_OnCombat(Unit, Event)
	UnitRegisterEvent("CenarionBotanist_Rejuvenation", 10000, 0)
	UnitRegisterEvent("CenarionBotanist_Wrath", 7000, 0)
end

function CenarionBotanist_Rejuvenation(Unit, Event) 
	UnitCastSpell(1430) 
end

function CenarionBotanist_Wrath(Unit, Event) 
	UnitFullCastSpellOnTarget(9739, UnitGetMainTank()) 
end

function CenarionBotanist_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function CenarionBotanist_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4051, 1, "CenarionBotanist_OnCombat")
RegisterUnitEvent(4051, 2, "CenarionBotanist_OnLeaveCombat")
RegisterUnitEvent(4051, 4, "CenarionBotanist_OnDied")

--Cenarion Caretaker
function CenarionCaretaker_OnCombat(Unit, Event)
	UnitRegisterEvent("CenarionCaretaker_Maul", 5000, 0)
	UnitRegisterEvent("CenarionCaretaker_BearForm", 2000, 1)
	UnitRegisterEvent("CenarionCaretaker_Thorns", 1000, 1)
end

function CenarionCaretaker_BearForm(Unit, Event) 
	UnitCastSpell(7090) 
end

function CenarionCaretaker_Maul(Unit, Event) 
	UnitFullCastSpellOnTarget(12616, UnitGetMainTank()) 
end

function CenarionCaretaker_Thorns(Unit, Event) 
	UnitCastSpell(782) 
end

function CenarionCaretaker_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function CenarionCaretaker_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4050, 1, "CenarionCaretaker_OnCombat")
RegisterUnitEvent(4050, 2, "CenarionCaretaker_OnLeaveCombat")
RegisterUnitEvent(4050, 4, "CenarionCaretaker_OnDied")

--Cenarion Druid
function CenarionDruid_OnCombat(Unit, Event)
	UnitRegisterEvent("CenarionDruid_Wrath", 5000, 2)
	UnitRegisterEvent("CenarionDruid_CatForm", 12000, 1)
	UnitRegisterEvent("CenarionDruid_TigersFury", 14000, 1)
end

function CenarionDruid_Wrath(Unit, Event) 
	UnitFullCastSpellOnTarget(9739, UnitGetMainTank()) 
end

function CenarionDruid_CatForm(Unit, Event) 
	UnitCastSpell(5759) 
end

function CenarionDruid_TigersFury(Unit, Event) 
	UnitCastSpell(5217) 
end

function CenarionDruid_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function CenarionDruid_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4052, 1, "CenarionDruid_OnCombat")
RegisterUnitEvent(4052, 2, "CenarionDruid_OnLeaveCombat")
RegisterUnitEvent(4052, 4, "CenarionDruid_OnDied")

--Charred Ancient
function CharredAncient_OnCombat(Unit, Event)
	UnitRegisterEvent("CharredAncient_EntanglingRoots", 10000, 0)
end

function CharredAncient_EntanglingRoots(Unit, Event) 
	UnitFullCastSpellOnTarget(12747, UnitGetMainTank()) 
end

function CharredAncient_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function CharredAncient_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4028, 1, "CharredAncient_OnCombat")
RegisterUnitEvent(4028, 2, "CharredAncient_OnLeaveCombat")
RegisterUnitEvent(4028, 4, "CharredAncient_OnDied")

--Chimaera Matriarch
function ChimaeraMatriarch_OnCombat(Unit, Event)
	UnitRegisterEvent("ChimaeraMatriarch_CorrosivePoison", 10000, 0)
end

function ChimaeraMatriarch_CorrosivePoison(Unit, Event) 
	UnitFullCastSpellOnTarget(3397, UnitGetMainTank()) 
end

function ChimaeraMatriarch_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function ChimaeraMatriarch_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(6167, 1, "ChimaeraMatriarch_OnCombat")
RegisterUnitEvent(6167, 2, "ChimaeraMatriarch_OnLeaveCombat")
RegisterUnitEvent(6167, 4, "ChimaeraMatriarch_OnDied")

--Cliff Stormer
function CliffStormer_OnCombat(Unit, Event)
	UnitRegisterEvent("CliffStormer_LizardBolt", 5000, 0)
end

function CliffStormer_LizardBolt(Unit, Event) 
	UnitFullCastSpellOnTarget(5401, UnitGetMainTank()) 
end

function CliffStormer_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function CliffStormer_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4008, 1, "CliffStormer_OnCombat")
RegisterUnitEvent(4008, 2, "CliffStormer_OnLeaveCombat")
RegisterUnitEvent(4008, 4, "CliffStormer_OnDied")

--Corrosive SapBeast
function CorrosiveSapBeast_OnCombat(Unit, Event)
	UnitRegisterEvent("CorrosiveSapBeast_CorrosivePoison", 10000, 0)
end

function CorrosiveSapBeast_CorrosivePoison(Unit, Event) 
	UnitFullCastSpellOnTarget(3397, UnitGetMainTank()) 
end

function CorrosiveSapBeast_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function CorrosiveSapBeast_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4021, 1, "CorrosiveSapBeast_OnCombat")
RegisterUnitEvent(4021, 2, "CorrosiveSapBeast_OnLeaveCombat")
RegisterUnitEvent(4021, 4, "CorrosiveSapBeast_OnDied")

--Daughter of Cenarius
function DaughterofCenarius_OnCombat(Unit, Event)
	UnitRegisterEvent("DaughterofCenarius_DispelMagic", 6000, 0)
	UnitRegisterEvent("DaughterofCenarius_Throw", 4000, 0)
end

function DaughterofCenarius_DispelMagic(Unit, Event) 
	UnitCastSpell(527) 
end

function DaughterofCenarius_Throw(Unit, Event) 
	UnitFullCastSpellOnTarget(10277, UnitGetMainTank()) 
end

function DaughterofCenarius_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function DaughterofCenarius_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4053, 1, "DaughterofCenarius_OnCombat")
RegisterUnitEvent(4053, 2, "DaughterofCenarius_OnLeaveCombat")
RegisterUnitEvent(4053, 4, "DaughterofCenarius_OnDied")

--Deepmoss Creeper
function DeepmossCreeper_OnCombat(Unit, Event)
	UnitRegisterEvent("DeepmossCreeper_Poison", 10000, 0)
end

function DeepmossCreeper_Poison(Unit, Event) 
	UnitFullCastSpellOnTarget(744, UnitGetMainTank()) 
end

function DeepmossCreeper_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function DeepmossCreeper_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4005, 1, "DeepmossCreeper_OnCombat")
RegisterUnitEvent(4005, 2, "DeepmossCreeper_OnLeaveCombat")
RegisterUnitEvent(4005, 4, "DeepmossCreeper_OnDied")

--Deepmoss Hatchling
function DeepmossHatchling_OnCombat(Unit, Event)
	UnitRegisterEvent("DaughterofCenarius_SummonDeepmossMatriarch", 4000, 1)
end

function DeepmossCreeper_Poison(Unit, Event) 
	UnitFullCastSpellOnTarget(744, UnitGetMainTank()) 
end

function DaughterofCenarius_SummonDeepmossMatriarch(Unit, Event) 
	UnitCastSpell(6536) 
end

function DeepmossHatchling_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function DeepmossHatchling_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4263, 1, "DeepmossHatchling_OnCombat")
RegisterUnitEvent(4263, 2, "DeepmossHatchling_OnLeaveCombat")
RegisterUnitEvent(4263, 4, "DeepmossHatchling_OnDied")

--Deepmoss Venomspitter
function DeepmossVenomspitter_OnCombat(Unit, Event)
	UnitRegisterEvent("DeepmossVenomspitter_ToxicSpit", 10000, 0)
end

function DeepmossVenomspitter_ToxicSpit(Unit, Event) 
	UnitFullCastSpellOnTarget(7951, UnitGetMainTank()) 
end

function DeepmossVenomspitter_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function DeepmossVenomspitter_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4007, 1, "DeepmossVenomspitter_OnCombat")
RegisterUnitEvent(4007, 2, "DeepmossVenomspitter_OnLeaveCombat")
RegisterUnitEvent(4007, 4, "DeepmossVenomspitter_OnDied")

--Fey Dragon
function FeyDragon_OnCombat(Unit, Event)
	UnitRegisterEvent("FeyDragon_NullifyMana", 6000, 0)
end

function FeyDragon_NullifyMana(Unit, Event) 
	UnitFullCastSpellOnTarget(7994, UnitGetRandomPlayer(4)) 
end

function FeyDragon_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function FeyDragon_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4016, 1, "FeyDragon_OnCombat")
RegisterUnitEvent(4016, 2, "FeyDragon_OnLeaveCombat")
RegisterUnitEvent(4016, 4, "FeyDragon_OnDied")

--Fledgling Chimaera
function FledglingChimaera_OnCombat(Unit, Event)
	UnitRegisterEvent("FledglingChimaera_CorrosivePoison", 10000, 0)
end

function FledglingChimaera_CorrosivePoison(Unit, Event) 
	UnitFullCastSpellOnTarget(3397, UnitGetMainTank()) 
end

function FledglingChimaera_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function FledglingChimaera_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4031, 1, "FledglingChimaera_OnCombat")
RegisterUnitEvent(4031, 2, "FledglingChimaera_OnLeaveCombat")
RegisterUnitEvent(4031, 4, "FledglingChimaera_OnDied")

--Furious Stone Spirit
function FuriousStoneSpirit_OnCombat(Unit, Event)
	UnitRegisterEvent("FuriousStoneSpirit_Knockdown", 8000, 0)
end

function FuriousStoneSpirit_Knockdown(Unit, Event) 
	UnitFullCastSpellOnTarget(5164, UnitGetMainTank()) 
end

function FuriousStoneSpirit_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function FuriousStoneSpirit_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4035, 1, "FuriousStoneSpirit_OnCombat")
RegisterUnitEvent(4035, 2, "FuriousStoneSpirit_OnLeaveCombat")
RegisterUnitEvent(4035, 4, "FuriousStoneSpirit_OnDied")

--Gogger Geomancer
function GoggerGeomancer_OnCombat(Unit, Event)
	UnitRegisterEvent("GoggerGeomancer_Fireball", 8000, 0)
	UnitRegisterEvent("GoggerGeomancer_RainofFire", 11000, 1)
end

function GoggerGeomancer_Fireball(Unit, Event) 
	UnitFullCastSpellOnTarget(20793, UnitGetMainTank()) 
end

function GoggerGeomancer_RainofFire(Unit, Event) 
	UnitCastSpell(11990) 
end

function GoggerGeomancer_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function GoggerGeomancer_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(11917, 1, "GoggerGeomancer_OnCombat")
RegisterUnitEvent(11917, 2, "GoggerGeomancer_OnLeaveCombat")
RegisterUnitEvent(11917, 4, "GoggerGeomancer_OnDied")

--Gogger Rock Keeper
function GoggerRockKeeper_OnCombat(Unit, Event)
	UnitRegisterEvent("GoggerRockKeeper_EarthShock", 8000, 0)
end

function GoggerRockKeeper_EarthShock(Unit, Event) 
	UnitFullCastSpellOnTarget(13281, UnitGetMainTank()) 
end

function GoggerRockKeeper_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function GoggerRockKeeper_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(11915, 1, "GoggerRockKeeper_OnCombat")
RegisterUnitEvent(11915, 2, "GoggerRockKeeper_OnLeaveCombat")
RegisterUnitEvent(11915, 4, "GoggerRockKeeper_OnDied")

--Great Courser
function GreatCourser_OnCombat(Unit, Event)
	UnitRegisterEvent("GreatCourser_RushingCharge", 8000, 0)
end

function GreatCourser_RushingCharge(Unit, Event) 
	UnitCastSpell(6268) 
end

function GreatCourser_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function GreatCourser_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4019, 1, "GreatCourser_OnCombat")
RegisterUnitEvent(4019, 2, "GreatCourser_OnLeaveCombat")
RegisterUnitEvent(4019, 4, "GreatCourser_OnDied")

--Grimtotem Brute
function GrimtotemBrute_OnCombat(Unit, Event)
	UnitRegisterEvent("GrimtotemBrute_RushingCharge", 8000, 0)
end

function GrimtotemBrute_RushingCharge(Unit, Event) 
	UnitCastSpell(6268) 
end

function GrimtotemBrute_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function GrimtotemBrute_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(11912, 1, "GrimtotemBrute_OnCombat")
RegisterUnitEvent(11912, 2, "GrimtotemBrute_OnLeaveCombat")
RegisterUnitEvent(11912, 4, "GrimtotemBrute_OnDied")

--Grimtotem Mercenary
function GrimtotemMercenary_OnCombat(Unit, Event)
	UnitRegisterEvent("GrimtotemMercenary_Pummel", 10000, 0)
	UnitRegisterEvent("GrimtotemMercenary_Throw", 6000, 0)
end

function GrimtotemMercenary_Pummel(Unit, Event) 
	UnitFullCastSpellOnTarget(12555, UnitGetMainTank()) 
end

function GrimtotemMercenary_Throw(Unit, Event) 
	UnitFullCastSpellOnTarget(15607, UnitGetMainTank()) 
end

function GrimtotemMercenary_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function GrimtotemMercenary_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(11911, 1, "GrimtotemMercenary_OnCombat")
RegisterUnitEvent(11911, 2, "GrimtotemMercenary_OnLeaveCombat")
RegisterUnitEvent(11911, 4, "GrimtotemMercenary_OnDied")

--Grimtotem Sorcerer
function GrimtotemSorcerer_OnCombat(Unit, Event)
	UnitRegisterEvent("GrimtotemSorcerer_LightningBolt", 8000, 0)
	UnitRegisterEvent("GrimtotemSorcerer_Rejuvenation", 12000, 0)
end

function GrimtotemSorcerer_LightningBolt(Unit, Event) 
	UnitFullCastSpellOnTarget(20802, UnitGetMainTank()) 
end

function GrimtotemSorcerer_Rejuvenation(Unit, Event) 
	UnitCastSpell(12160) 
end

function GrimtotemSorcerer_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function GrimtotemSorcerer_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(11913, 1, "GrimtotemSorcerer_OnCombat")
RegisterUnitEvent(11913, 2, "GrimtotemSorcerer_OnLeaveCombat")
RegisterUnitEvent(11913, 4, "GrimtotemSorcerer_OnDied")

--Mirkfallon Dryad
function MirkfallonDryad_OnCombat(Unit, Event)
	UnitRegisterEvent("MirkfallonDryad_SlowingPoison", 10000, 0)
	UnitRegisterEvent("MirkfallonDryad_Throw", 6000, 0)
end

function MirkfallonDryad_SlowingPoison(Unit, Event) 
	UnitFullCastSpellOnTarget(7992, UnitGetMainTank()) 
end

function MirkfallonDryad_Throw(Unit, Event) 
	UnitFullCastSpellOnTarget(10277, UnitGetMainTank()) 
end

function MirkfallonDryad_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function MirkfallonDryad_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4061, 1, "MirkfallonDryad_OnCombat")
RegisterUnitEvent(4061, 2, "MirkfallonDryad_OnLeaveCombat")
RegisterUnitEvent(4061, 4, "MirkfallonDryad_OnDied")

--Mirkfallon Keeper
function MirkfallonKeeper_OnCombat(Unit, Event)
	UnitRegisterEvent("MirkfallonKeeper_MirkfallonFungus", 10000, 1)
end

function MirkfallonKeeper_MirkfallonFungus(Unit, Event) 
	UnitFullCastSpellOnTarget(8138, UnitGetMainTank()) 
end

function MirkfallonKeeper_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function MirkfallonKeeper_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4056, 1, "MirkfallonKeeper_OnCombat")
RegisterUnitEvent(4056, 2, "MirkfallonKeeper_OnLeaveCombat")
RegisterUnitEvent(4056, 4, "MirkfallonKeeper_OnDied")

--Pridewing Skyhunter
function PridewingSkyhunter_OnCombat(Unit, Event)
	UnitRegisterEvent("PridewingSkyhunter_Poison", 10000, 0)
	UnitRegisterEvent("PridewingSkyhunter_Swoop", 6000, 0)
end

function PridewingSkyhunter_Poison(Unit, Event) 
	UnitFullCastSpellOnTarget(744, UnitGetMainTank()) 
end

function PridewingSkyhunter_Swoop(Unit, Event) 
	UnitFullCastSpellOnTarget(5708, UnitGetMainTank()) 
end

function PridewingSkyhunter_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function PridewingSkyhunter_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4013, 1, "PridewingSkyhunter_OnCombat")
RegisterUnitEvent(4013, 2, "PridewingSkyhunter_OnLeaveCombat")
RegisterUnitEvent(4013, 4, "PridewingSkyhunter_OnDied")

--Pridewing Wyvern
function PridewingWyvern_OnCombat(Unit, Event)
	UnitRegisterEvent("PridewingWyvern_CorrosivePoison", 10000, 0)
end

function PridewingWyvern_CorrosivePoison(Unit, Event) 
	UnitFullCastSpellOnTarget(3397, UnitGetMainTank()) 
end

function PridewingWyvern_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function PridewingWyvern_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4012, 1, "PridewingWyvern_OnCombat")
RegisterUnitEvent(4012, 2, "PridewingWyvern_OnLeaveCombat")
RegisterUnitEvent(4012, 4, "PridewingWyvern_OnDied")

--Pridewing Patriarch
function PridewingPatriarch_OnCombat(Unit, Event)
	UnitRegisterEvent("PridewingPatriarch_CorrosivePoison", 10000, 0)
end

function PridewingPatriarch_CorrosivePoison(Unit, Event) 
	UnitFullCastSpellOnTarget(3397, UnitGetMainTank()) 
end

function PridewingPatriarch_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function PridewingPatriarch_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4015, 1, "PridewingPatriarch_OnCombat")
RegisterUnitEvent(4015, 2, "PridewingPatriarch_OnLeaveCombat")
RegisterUnitEvent(4015, 4, "PridewingPatriarch_OnDied")

--Raging Cliff Stormer
function RagingCliffStormer_OnCombat(Unit, Event)
	UnitRegisterEvent("RagingCliffStormer_RushingCharge", 10000, 0)
	UnitRegisterEvent("RagingCliffStormer_Thunderclap", 6000, 0)
end

function RagingCliffStormer_RushingCharge(Unit, Event) 
	UnitCastSpell(6268) 
end

function RagingCliffStormer_Thunderclap(Unit, Event) 
	UnitFullCastSpellOnTarget(8078, UnitGetMainTank()) 
end

function RagingCliffStormer_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function RagingCliffStormer_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4009, 1, "RagingCliffStormer_OnCombat")
RegisterUnitEvent(4009, 2, "RagingCliffStormer_OnLeaveCombat")
RegisterUnitEvent(4009, 4, "RagingCliffStormer_OnDied")

--Rogue Flame Spirit
function RogueFlameSpirit_OnCombat(Unit, Event)
	UnitRegisterEvent("RogueFlameSpirit_Inmolate", 10000, 0)
end

function RogueFlameSpirit_Inmolate(Unit, Event) 
	UnitFullCastSpellOnTarget(1094, UnitGetMainTank()) 
end

function RogueFlameSpirit_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function RogueFlameSpirit_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4036, 1, "RogueFlameSpirit_OnCombat")
RegisterUnitEvent(4036, 2, "RogueFlameSpirit_OnLeaveCombat")
RegisterUnitEvent(4036, 4, "RogueFlameSpirit_OnDied")

--Scorched Basilisk
function ScorchedBasilisk_OnCombat(Unit, Event)
	UnitRegisterEvent("ScorchedBasilisk_CrystallineSlumber", 15000, 1)
end

function ScorchedBasilisk_CrystallineSlumber(Unit, Event) 
	UnitFullCastSpellOnTarget(3636, UnitGetMainTank()) 
end

function ScorchedBasilisk_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function ScorchedBasilisk_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4041, 1, "ScorchedBasilisk_OnCombat")
RegisterUnitEvent(4041, 2, "ScorchedBasilisk_OnLeaveCombat")
RegisterUnitEvent(4041, 4, "ScorchedBasilisk_OnDied")

--Singed Basilisk
function SingedBasilisk_OnCombat(Unit, Event)
	UnitRegisterEvent("SingedBasilisk_CrystallineSlumber", 15000, 1)
end

function SingedBasilisk_CrystallineSlumber(Unit, Event) 
	UnitFullCastSpellOnTarget(3636, UnitGetMainTank()) 
end

function SingedBasilisk_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function SingedBasilisk_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4042, 1, "SingedBasilisk_OnCombat")
RegisterUnitEvent(4042, 2, "SingedBasilisk_OnLeaveCombat")
RegisterUnitEvent(4042, 4, "SingedBasilisk_OnDied")

--Son of Cenarius
function SonofCenarius_OnCombat(Unit, Event)
	UnitRegisterEvent("SonofCenarius_SummonTreantAlly", 4000, 1)
end

function SonofCenarius_SummonTreantAlly(Unit, Event) 
	UnitCastSpell(7993) 
end

function SonofCenarius_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function SonofCenarius_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4057, 1, "SonofCenarius_OnCombat")
RegisterUnitEvent(4057, 2, "SonofCenarius_OnLeaveCombat")
RegisterUnitEvent(4057, 4, "SonofCenarius_OnDied")

--Taskmaster Whipfang
function TaskmasterWhipfang_OnCombat(Unit, Event)
	UnitRegisterEvent("TaskmasterWhipfang_IntimidatingRoar", 12000, 0)
end

function TaskmasterWhipfang_IntimidatingRoar(Unit, Event) 
	UnitFullCastSpellOnTarget(16508, UnitGetMainTank()) 
end

function TaskmasterWhipfang_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function TaskmasterWhipfang_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(5932, 1, "TaskmasterWhipfang_OnCombat")
RegisterUnitEvent(5932, 2, "TaskmasterWhipfang_OnLeaveCombat")
RegisterUnitEvent(5932, 4, "TaskmasterWhipfang_OnDied")

--Venture Co. Builder
function VentureCoBuilder_OnCombat(Unit, Event)
	UnitRegisterEvent("VentureCoBuilder_Shoot", 6000, 0)
end

function VentureCoBuilder_Shoot(Unit, Event) 
	UnitFullCastSpellOnTarget(6660, UnitGetMainTank()) 
end

function VentureCoBuilder_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function VentureCoBuilder_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4070, 1, "VentureCoBuilder_OnCombat")
RegisterUnitEvent(4070, 2, "VentureCoBuilder_OnLeaveCombat")
RegisterUnitEvent(4070, 4, "VentureCoBuilder_OnDied")

--Venture Co. Deforester
function VentureCoDeforester_OnCombat(Unit, Event)
	UnitRegisterEvent("VentureCoDeforester_Fireball", 8000, 0)
end

function VentureCoDeforester_Fireball(Unit, Event) 
	UnitFullCastSpellOnTarget(20793, UnitGetMainTank()) 
end

function VentureCoDeforester_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function VentureCoDeforester_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(3991, 1, "VentureCoDeforester_OnCombat")
RegisterUnitEvent(3991, 2, "VentureCoDeforester_OnLeaveCombat")
RegisterUnitEvent(3991, 4, "VentureCoDeforester_OnDied")

--Venture Co. Engineer
function VentureCoEngineer_OnCombat(Unit, Event)
	UnitRegisterEvent("VentureCoEngineer_ThrowDynamite", 8000, 0)
end

function VentureCoEngineer_ThrowDynamite(Unit, Event) 
	UnitCastSpell(7978) 
end

function VentureCoEngineer_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function VentureCoEngineer_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(3992, 1, "VentureCoEngineer_OnCombat")
RegisterUnitEvent(3992, 2, "VentureCoEngineer_OnLeaveCombat")
RegisterUnitEvent(3992, 4, "VentureCoEngineer_OnDied")

--Venture Co. Logger
function VentureCoLogger_OnCombat(Unit, Event)
	UnitRegisterEvent("VentureCoLogger_Throw", 6000, 0)
end

function VentureCoLogger_Throw(Unit, Event) 
	UnitFullCastSpellOnTarget(10277, UnitGetMainTank()) 
end

function VentureCoLogger_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function VentureCoLogger_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(3989, 1, "VentureCoLogger_OnCombat")
RegisterUnitEvent(3989, 2, "VentureCoLogger_OnLeaveCombat")
RegisterUnitEvent(3989, 4, "VentureCoLogger_OnDied")

--Venture Co. Machine Smith
function VentureCoMachineSmith_OnCombat(Unit, Event)
	UnitRegisterEvent("VentureCoMachineSmith_CompactHarvestReaper", 6000, 1)
end

function VentureCoMachineSmith_CompactHarvestReaper(Unit, Event) 
	UnitCastSpell(7979) 
end

function VentureCoMachineSmith_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function VentureCoMachineSmith_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(3993, 1, "VentureCoMachineSmith_OnCombat")
RegisterUnitEvent(3993, 2, "VentureCoMachineSmith_OnLeaveCombat")
RegisterUnitEvent(3993, 4, "VentureCoMachineSmith_OnDied")

--Wily Fey Dragon
function WilyFeyDragon_OnCombat(Unit, Event)
	UnitRegisterEvent("WilyFeyDragon_ManaBurn", 6000, 0)
end

function WilyFeyDragon_ManaBurn(Unit, Event) 
	UnitFullCastSpellOnTarget(17630, UnitGetRandomPlayer(4)) 
end

function WilyFeyDragon_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function WilyFeyDragon_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4017, 1, "WilyFeyDragon_OnCombat")
RegisterUnitEvent(4017, 2, "WilyFeyDragon_OnLeaveCombat")
RegisterUnitEvent(4017, 4, "WilyFeyDragon_OnDied")

--Windshear Geomancer
function WindshearGeomancer_OnCombat(Unit, Event)
	UnitRegisterEvent("WindshearGeomancer_Frostbolt", 8000, 0)
end

function WindshearGeomancer_Frostbolt(Unit, Event) 
	UnitFullCastSpellOnTarget(20792, UnitGetMainTank()) 
end

function WindshearGeomancer_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function WindshearGeomancer_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4003, 1, "WindshearGeomancer_OnCombat")
RegisterUnitEvent(4003, 2, "WindshearGeomancer_OnLeaveCombat")
RegisterUnitEvent(4003, 4, "WindshearGeomancer_OnDied")

--Windshear Overlord
function WindshearOverlord_OnCombat(Unit, Event)
	UnitRegisterEvent("WindshearOverlord_BattleFury", 2000, 1)
end

function WindshearOverlord_BattleFury(Unit, Event) 
	UnitCastSpell(3631) 
end

function WindshearOverlord_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function WindshearOverlord_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4004, 1, "WindshearOverlord_OnCombat")
RegisterUnitEvent(4004, 2, "WindshearOverlord_OnLeaveCombat")
RegisterUnitEvent(4004, 4, "WindshearOverlord_OnDied")

--Young Chimaera
function YoungChimaera_OnCombat(Unit, Event)
	UnitRegisterEvent("YoungChimaera_LightningBolt", 8000, 0)
end

function YoungChimaera_LightningBolt(Unit, Event) 
	UnitFullCastSpellOnTarget(9532, UnitGetMainTank()) 
end

function YoungChimaera_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function YoungChimaera_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4032, 1, "YoungChimaera_OnCombat")
RegisterUnitEvent(4032, 2, "YoungChimaera_OnLeaveCombat")
RegisterUnitEvent(4032, 4, "YoungChimaera_OnDied")

--Young Pridewing
function YoungPridewing_OnCombat(Unit, Event)
	UnitRegisterEvent("YoungPridewing_Poison", 10000, 0)
end

function YoungPridewing_Poison(Unit, Event) 
	UnitFullCastSpellOnTarget(744, UnitGetMainTank()) 
end

function YoungPridewing_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function YoungPridewing_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4005, 1, "YoungPridewing_OnCombat")
RegisterUnitEvent(4005, 2, "YoungPridewing_OnLeaveCombat")
RegisterUnitEvent(4005, 4, "YoungPridewing_OnDied")