Make sure you put these in different .lua files 


Mall command:


--Created--------------
----by-----Simple Lua--
--Felnious-------------
function mallcommand(event, pPlayer, message, type, language)
        if(message == ".mall") then
		pPlayer:Teleport(530, -1827.785034, 5418.160645, -12.427759)
        return false
        end
end
RegisterServerHook(16, "mallcommand")





Arena Command: Teleports to gurubashi







function arenacommand(event, pPlayer, message, type, language)
        if(message == ".arena") then
		pPlayer:Teleport(0, -13243.240234, 197.949799, 32.112690)
        return false
        end
end
RegisterServerHook(16, "arenacommand")







Buff command: (again dont know who made it but credits to whoever did)

function Buffcommand(event, pPlayer, message, type, language)
        if(message == ".buff") then
        pPlayer:AddAura(48162, 3000000)
        pPlayer:AddAura(48074, 3000000)
        pPlayer:AddAura(48170, 3000000)
        pPlayer:AddAura(43223, 3000000)
        pPlayer:AddAura(36880, 3000000)
        pPlayer:AddAura(467, 3000000)
        pPlayer:AddAura(48469, 3000000)
        pPlayer:PlayerSendChatMessage(1, 0, "You've been buffed!")
        return false
        end
end
RegisterServerHook(16, "Buffcommand")





Enrage Command:

function Enragecommand(event, pPlayer, message, type, language)
        if(message == ".enrage") then
        pPlayer:AddAura(72143, 3000000)
        pPlayer:AddAura(59697, 3000000)
        pPlayer:AddAura(54356, 3000000)
		pPlayer:AddAura(17, 3000000)
        return false
        end
end
RegisterServerHook(16, "Enragecommand")







Heal Command:

function healcommand(event, pPlayer, message, type, language)
        if(message == ".heal") then
        pPlayer:CastSpell(48788)
        return false
        end
end
RegisterServerHook(16, "healcommand")