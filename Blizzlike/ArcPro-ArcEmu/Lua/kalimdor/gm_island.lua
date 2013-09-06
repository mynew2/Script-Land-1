--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: Grimton1337, ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function GM_Island_Player_In(event, pPlayer)
local ZoneId = pPlayer:GetZoneId()
	if(ZoneId == 876) then
		if(pPlayer:IsGm() == true) then
			return 0;
		elseif(pPlayer:IsGm() == false) then
			local Name = pPlayer:GetName()
			pPlayer:SendAreaTriggerMessage(Name.." is not a Game Master/Administrator to enter this area. Your character will be frozen until a Game Master/Admin appears.")
			pPlayer:CastSpell(9454)
		end
	end
end

RegisterServerHook(4, "GM_Island_Player_In")