local wh_datas = {
    ["money"]=true,
	["bankmoney"]=true,
	["admin_level"]=true,
	["gmlevel"]=true,
	["bakiyeMiktar"] = true,
}

addEventHandler('onElementDataChange', root,function(dataName, oldValue )
    -- eğer değiştirilen data tabloda varsa ve bu bir client tarafından yapılıyor ise.
    if wh_datas[dataName] and client then
        setElementData( source, dataName, oldValue )
        local serial = getPlayerSerial(client)
        local desc = "Pasha Yakaladı! (onElementDataChange : "..dataName..")"
        cancelEvent()
        local reason = desc
    	addBan( nil, nil, serial, source, reason )   
	end
    -- eğer client tarafından başka oyuncunun datasını değiştirmeye kalkışırsa
    if client and client ~= source and wh_datas[dataName] then
        setElementData( source, dataName, oldValue )
        local serial = getPlayerSerial(client)
        local desc = "Pasha Yakaladı! (onElementDataChange : "..dataName..")"
        cancelEvent()
        local reason = desc
    	addBan( nil, nil, serial, source, reason )   
	end
end)

function pashaAddBan()
	local serial = getPlayerSerial(source)
    local desc = "Pasha Yakaladı! ( Lua Executor )"
    local reason = desc
	addBan( nil, nil, serial, source, reason )   
	outputDebugString("Bir kullanıcı banlandı ("..serial.." - "..desc.." )")
end
addEvent("pashaBanDetected", true)
addEventHandler("pashaBanDetected", root , pashaAddBan)

addEvent("pasha_log",true)
addEventHandler("pasha_log",root,function(message)
    iprint(message)
end)
