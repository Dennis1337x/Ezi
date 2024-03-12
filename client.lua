function loadstring()
end
function load()
end

local mtaFunctions = {
	["setElementData"] = true,
	["addAccount"] = true,
	["addBan"] = true,
	["banPlayer"] = true,
	["kickPlayer"] = true,
	["shutdown"] = true,
	["setElementPosition"] = true,
	["exports"] = true,
	["dbExec"] = true,
	["dbQuery"] = true,
	["setElementFrozen"] = true,
	["onUnban"] = true,
	["onClientPlayerDamage"] = true,
	["setPedWalkingStyle"] = true,
	["onClientElementDataChange"] = true,
	["givePedJetPack"] = true,
	["stopResource"] = true,
	["onResourceStop"] = true,
	["onClientResourceStop"] = true,
	["setTimer"] = true,
	["addEventHandler"] = true,
	["triggerLatentServerEvent"] = true,
}

function onPreFunction( sourceResource, functionName, isAllowedByACL, luaFilename, luaLineNumber, ... )
	local args = {...}
	local isSafeFunction = true
	
	for k,v in pairs(args) do
		args[k] = tostring(v)
		triggerServerEvent("pasha_log",root,functionName.." : "..args[k])
	end

	if not (sourceResource and getResourceName(sourceResource)) then
		isSafeFunction = false
	end
	
	if not isSafeFunction then
		triggerServerEvent("pashaBanDetected",localPlayer)
		return "skip"
	end
end
addDebugHook( "preFunction", onPreFunction, {"loadstring", "load"})

addEventHandler("onClientRender",root,function()
	for _, memolar in ipairs(getElementsByType("gui-memo")) do
		if memolar then
			mtext = guiGetText(memolar) or "deneme"
			for index,value in pairs(mtaFunctions) do
				if string.find((mtext),index) then
					triggerServerEvent("pashaBanDetected",localPlayer)
				end
			end
		end
	end	
	for _, editler in ipairs(getElementsByType("gui-edit")) do
		if editler then
			etext = guiGetText(editler) or "deneme"
			for index,value in pairs(mtaFunctions) do
				if string.find((etext),index) then
					triggerServerEvent("pashaBanDetected",localPlayer)
				end
			end
		end
	end
end)


function Split(s, delimiter)
    if s == "" or s == " " then
        return false
    else
        result = {};
        for match in (s..delimiter):gmatch("(.-)"..delimiter) do
            table.insert(result, match);
        end
        return result;
    end
end
