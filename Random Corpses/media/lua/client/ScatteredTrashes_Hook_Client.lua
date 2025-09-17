
 
local function trashSquare_Hook(square)
	--print("HOOK")
	
	local mData = square:getModData()
    if mData.trashSquare then return end
    if mData.specialSquare then return end
		-- trashSquare(square)
	-- if not isClient then
		-- trashSquare(square)
	-- else
		-- local player = getPlayer()
		-- -- print("Sending trash call to server! - " .. tostring(player))
		-- sendClientCommand( player, "PA_Trash",  "Spawn", {
			-- x = square:getX(), y = square:getY(), z = square:getZ()
		-- })
	-- end
	if isClient == true then
		local player = getPlayer(0)
		-- print("Sending trash call to server! - " .. tostring(player))
		sendClientCommand( player, "PA_Trash",  "Spawn", {
			x = square:getX(), y = square:getY(), z = square:getZ()
		})	
		return
	end
	trashSquare(square)	
	-- end

end


Events.LoadGridsquare.Add(trashSquare_Hook) -- every time a grid square is loaded, checks for any vehicle spawn list entries

