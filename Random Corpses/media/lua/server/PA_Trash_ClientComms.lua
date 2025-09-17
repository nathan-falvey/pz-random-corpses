-- this method was copied from the excellent Skateboard mod by Dislaik https://steamcommunity.com/sharedfiles/filedetails/?id=2728300240
-- I considered making new code from scratch, albeit I would still be "copying their homework", but decided against, for the sake of ease of comprehension + conistency
if not isServer() then return end 
local Commands = {}
Commands.PA_Trash = {}

Commands.PA_Trash.Spawn = function(origin, args)
	-- print("Trash command recieved " .. tostring(origin)  .. " - " .. tostring(args))
	local cell = origin:getCell()
	-- if not cell then print("No cell!") return end
	
	local x = args.x
	local y = args.y
	local z = args.z 
	-- print("Trash command recieved " .. tostring(origin)  .. " - " .. tostring(cell) .. " - " .. tostring(args))	
	-- print("Trash command recieved " .. tostring(x)  .. " - " .. tostring(y) .. " - " .. tostring(z))
	local square = cell:getGridSquare(x, y, z) or cell:getOrCreateGridSquare( x, y, x)	
	-- local square = args.square	
	-- if not square then print("No square!") return end
	-- print("Recieved trash call from client -" .. tostring(origin) .. " - " .. tostring(square))
	trashSquare(square)

end

local onClientCommand = function(module, command, player, args)
	if Commands[module] and Commands[module][command] then
		Commands[module][command](player, args)
	end
end

Events.OnClientCommand.Add(onClientCommand)
