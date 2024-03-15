function JetpackKontrol()
if isPedWearingJetpack(localPlayer) then
triggerServerEvent("jetpacktespiti", localPlayer)


end
end


setTimer(JetpackKontrol, 1000, 0)









local yasaklifonksiyonlar = {
    'outputChatBox',
    'addBox',
    'function',
    'triggerEvent',
    'triggerClientEvent',
    'triggerServerEvent',
    'setElementData',
    'addEvent',
    'addEventHandler',
    'addDebugHook',
    'createExplosion',
    'createProjectile',
    'setElementPosition',
    'shutdown',
    'addCommandHandler',
    'while',
    'math.random',
}

function onPreFunction( sourceResource, functionName, isAllowedByACL, luaFilename, luaLineNumber, text )
    for i, v in ipairs(yasaklifonksiyonlar) do -- fonksiyon döngüsü
        if text:find(v) then -- eğer ki yasaklı fonksiyon döngüsündeki fonksiyon tespit edilirse
			triggerServerEvent('tespit-edildi', localPlayer) -- servera yönlendirme
			cancelEvent()
            break
        end
    end
end


addEventHandler("onClientPaste", root, function(text)
  for i, v in ipairs(yasaklifonksiyonlar) do -- fonksiyon döngüsü
        if text:find(v) then -- eğer ki yasaklı fonksiyon döngüsündeki fonksiyon tespit edilirse
			triggerServerEvent('tespit-edildi', localPlayer) -- servera yönlendirme
			cancelEvent() -- spami iptal ettirme
			
			end
			end
end)



function Escaac()
    addDebugHook( "preFunction", onPreFunction, {"loadstring"} )
end

addEventHandler("onClientResourceStart", resourceRoot, Escaac)
