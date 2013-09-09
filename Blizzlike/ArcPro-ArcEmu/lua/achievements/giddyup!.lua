--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function OnCast(event, pPlayer, SpellId, pSpellObject)
	if(SpellId == 33388) then
		pPlayer:AddAchievement(891)
	else
		if(pPlayer:HasAchievement(891)) then
			pPlayer:RemoveAchievement(891)
		else
		end
	end
end

RegisterServerHook(4, "OnCast")