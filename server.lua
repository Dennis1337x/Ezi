function onElementDataChangeBasicAC(dataKey, oldValue, newValue)
	if not client then 
		return false 
	end

	local checkSpecialThing = dataKey == "special_thing" 
	local checkFlagWaving = dataKey == "flag_waving" 

	if checkSpecialThing then 
		local invalidElement = client ~= source 

		if invalidElement then 
			reportAndRevertDataChange(client, source, dataKey, oldValue, newValue) 
		end
	end

	if checkFlagWaving then 
		local playerVehicle = getPedOccupiedVehicle(client) 
		local invalidVehicle = playerVehicle ~= source 

		if invalidVehicle then 
			reportAndRevertDataChange(client, source, dataKey, oldValue, newValue) 
		end
	end
end
addEventHandler("onElementDataChange", root, onElementDataChangeBasicAC)


function reportAndRevertDataChange(clientElement, sourceElement, dataKey, oldValue, newValue) 
	local logClient = getPlayerName(clientElement)
	local logSource = "Sahte ElementData"
	local logText = 
		"=======================================\n"..
		"Supheli Hileci - Esca Scripting Anti Hile\n"..
		"Hileci Adi: "..logClient.."\n"..
		"Kullanilan Hile: "..logSource..""..
		"======================================="
	
	outputConsole(logText, root) 
	setElementData(sourceElement, dataKey, oldValue) 
	kickPlayer(clientElement, clientElement, "Esca Scripting Anti Hile tarafından atıldın!")
	outputChatBox(""..logClient.." adlı oyuncu sahte ElementData denedi ve Esca Scripting Anti Hile tarafından atıldı!", getRootElement())
end












local veriler = {
   
    ["money"]=true,
    ["bankmoney"]=true,
    ["admin_level"]=true,
    ["vip"]=true,
    ["emote"]=true,
    ["bakiyeMiktar"]=true,
    ["etiket"]=true,
    ["hoursplayed"]=true,
    ["scripter_level"]=true,
    ["supporter_level"]=true,
}

addEventHandler('onElementDataChange', root,function(dataName, oldValue )
    if veriler[dataName] and client then -- veri client taraflı geldiyse
        setElementData( source, dataName, oldValue )
        local serial = getPlayerSerial(client)
        local desc = "onElementDataChange "..dataName
        cancelEvent()
        local reason = desc
        addBan ( serial, nil, nil, getRootElement(), reason)        
   
    end
	
	if client and client ~= source and veriler[dataName] then
		setElementData( source, dataName, oldValue )
        local serial = getPlayerSerial(client)
        local desc = "onElementDataChangeC "..dataName
        cancelEvent()
        local reason = desc
        addBan ( serial, nil, nil, getRootElement(), reason)    

	
	
    end
	
	
	
	
end)




addEvent("tespit-edildi" , true)
addEventHandler("tespit-edildi" , root , function()
		local logClient = getPlayerName(source)
		local logSource = "Fonksiyon"
		local logText = 
		"=======================================\n"..
		"Supheli Hileci - Esca Roleplay Anti Hile\n"..
		"Hileci Adi: "..logClient.."\n"..
		"Kullanilan Hile: "..logSource..""..
		"======================================="
		local ip = getPlayerIP(source)
		local serial = getPlayerSerial(source)
		local kad = getPlayerName(source)
		addBan(ip, kad, serial, "Esca AC", "Fonksiyon Hilesi", 0)
		outputDebugString(logText)
		outputChatBox(""..logClient.." adlı oyuncu Fonksiyon hilesi denedi ve Esca Anti Hile tarafından banlandı!", getRootElement())
		end)
		
		
		
		
		
		
		
		
addEventHandler ("onPlayerWeaponFire", root, 
function (weapon, endX, endY, endZ, hitElement, startX, startY, startZ)
if not exports.global:hasItem(source, 115) then
local msg = "[ADMIN KANALI] " .. getPlayerName(source) .. " adlı oyuncu silah hilesi denedi ve atıldı!"
exports.global:sendMessageToAdmins(msg)
kickPlayer(source, source, "Esca Roleplay Anti Hile tarafından atıldın!") 
cancelEvent()
end
   end
)


addEvent("jetpacktespiti" , true)
addEventHandler("jetpacktespiti" , root , function(price)
		local logClient = getPlayerName(source)
		local logSource = "Jetpack"
		local logText = 
		"=======================================\n"..
		"Supheli Hileci - Esca Scripting Anti Hile\n"..
		"Hileci Adi: "..logClient.."\n"..
		"Kullanilan Hile: "..logSource..""..
		"======================================="
	
	outputConsole(logText, root) 
	kickPlayer(source, source, "Esca Scripting Anti Hile tarafından atıldın!") 
	outputChatBox(""..logClient.." adlı oyuncu Jetpack hilesi denedi ve Esca Scripting Anti Hile tarafından atıldı!", getRootElement())
	end)
	
	
	


addEvent("Esca-supheli" , true)
addEventHandler("Esca-supheli" , root , function(price)
kickPlayer(source, source, "Esca Scripting Anti Hile tarafından atıldın!") 
for k , v in ipairs(getElementsByType("player")) do 
local veri = tonumber(getElementData(v, "admin_level")) or 0
if veri > 0 then 
outputChatBox("#FFFF00[Esca SCRIPTING ANTI HILE] "..getPlayerName(source).." adlı oyuncu şüpheli tuşa bastığı için oyundan atıldı!",v,0,153,255,true)
end
end	
end)


addEvent("Esca-jtesti" , true)
addEventHandler("Esca-jtesti" , root , function(price)
for k , v in ipairs(getElementsByType("player")) do 
local veri = tonumber(getElementData(v, "admin_level")) or 0
if veri > 0 then 
outputChatBox("#FFFF00[Esca SCRIPTING ANTI HILE] "..getPlayerName(source).." adlı oyuncu J tuşuna bastı. Eğer kicklenmediyse temizdir.",v,0,153,255,true)
end
end		
end)




addEvent("Esca-aimlockhead" , true)
addEventHandler("Esca-aimlockhead" , root , function(price)
for k , v in ipairs(getElementsByType("player")) do 
local veri = tonumber(getElementData(v, "admin_level")) or 0
if veri > 0 then 
outputChatBox("#FFFF00[Esca SCRIPTING ANTI HILE] "..getPlayerName(source).." adlı oyuncu AIMLOCK kullanıyor olabilir. O tuşuna basıp görüntüsünü alın!",v,0,153,255,true)
end
end		
end)





local allowedSerials = { 
    "C13551598AC07174632D18D02AB31E52",	
}

function isSerialAllowed(serial)
    for i, allowedSerial in ipairs(allowedSerials) do
        if serial == allowedSerial then
            return true
        end
    end
    return false
end



addEvent("Esca-silent" , true)
addEventHandler("Esca-silent" , root , function(price)
for k , v in ipairs(getElementsByType("player")) do 
local veri = tonumber(getElementData(v, "admin_level")) or 0
if veri > 0 then 
outputChatBox("#FFFF00[Esca SCRIPTING ANTI HILE] "..getPlayerName(source).." adlı oyuncu SILENT kullanıyor olabilir.",v,0,153,255,true)
end
end		
end)



function player_Spawn ( posX, posY, posZ, spawnRotation, theTeam, theSkin, theInterior, theDimension )
--outputDebugString("Bir oyuncu spawn oldu! 1")
local oyuncu = source
local normalveri = tonumber(getElementData(source, "Escaac-spawn")) or 0
   local veri = tonumber(getElementData(source, "Escaac-spawn")) or 0
   if veri == 0 then
   --outputDebugString("Bir oyuncu spawn oldu! 2")
   setElementData(source, "Esca-supheli", 1)
  



   
   setTimer(function()
   if isElement(oyuncu) and getElementType(oyuncu) == "player" then
   setElementData(oyuncu, "Esca-supheli", 0)
   end
   end,300000,1)
   end
end
-- add the player_Spawn function as a handler for onPlayerSpawn
addEventHandler ( "onPlayerSpawn", getRootElement(), player_Spawn )





function quitPlayer ( quitType )
	--outputDebugString("Bir oyuncu cikis yapti!")
	setElementData(source, "Escaac-spawn", 0)
	setElementData(source, "Esca-supheli", 0)
	setElementData(source, "Esca-yolladi", 0)
	
end

addEventHandler ( "onPlayerQuit", root, quitPlayer )




function jTespit(thePlayer, commandName, who)
	local yetki = tonumber(getElementData(thePlayer, "admin_level")) or 0
	if yetki > 0 then
	local targetPlayer = getPlayerFromName ( who ) 
		if not (targetPlayer) then
			outputChatBox("* * /" .. commandName .. " [İsim]", thePlayer, 255, 194, 14)
		else
			

		
				local veri = tonumber(getElementData(targetPlayer, "Esca-j")) or 0
				if veri == 0 then
				setElementData(targetPlayer, "Esca-j", 1)
				outputChatBox(""..getPlayerName(targetPlayer).." adlı oyuncunun J tespiti başladı, J'ye basmasını talep edin!", thePlayer)
				outputChatBox("Tespiti duraklatmak için tekrar /jtespit yazın!", thePlayer)
				else
				setElementData(targetPlayer, "Esca-j", 0)
				outputChatBox(""..getPlayerName(targetPlayer).." adlı oyuncunun J tespiti duraklatıldı!", thePlayer)
				end
		  
			
		end
	end
end
addCommandHandler("jtespit", jTespit, false, false)





