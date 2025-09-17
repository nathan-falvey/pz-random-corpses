function checkDeadZone(square)
	if not square then square = getPlayer():getSquare() end
	if not square then print("Player Square Failure!") return false end
	if (not square:getZone() and square:getZone():getType()) then return false end
	if (not getVehicleZoneAt(square:getX(), square:getY(), square:getZ())) then return false end
	if (not square:getRoom() and not square:getRoom():getName() ) then return false end	
end

function isFreeTile( _square )
    if not _square or _square:Is("BlocksPlacement") or _square:Is(IsoFlagType.canBeCut) or _square:Is("tree") then
        return false;
    end
    return true;
end

function hasWaterObject(square)	
	for i=0, square:getObjects():size()-1 do
		local v = square:getObjects():get(i);
		if instanceof(v, "IsoObject") and v:getSprite() and v:getSprite():getProperties() and v:getSprite():getProperties():Is(IsoFlagType.water) then
			--print("Water Tile")
			return true;
		end
	end
end
 
function checkBlockedSquare(square)
	if not square then square = getPlayer():getSquare() end
	if not square then
		--print("Player Square Failure!")
		return false
	end
	if not isFreeTile(square) then
		--print("Not Free Tile")
		return false
	end
	if square:isVehicleIntersecting() then
		--print("Vehicle Intersecting!")
		return false
	end		
	if hasWaterObject(square) then
		--print("Water!")
		return false
	end
	if square:HasStairs() then
		--print("Stairs!")
		return false
	end	
	if not square:hasFloor(true) then
		--print("No Floor!")
		return false
	end
	local door = square:getDoor(true) or square:getDoor(false) or square:haveDoor()
	if door then
		--print("Door!")
		return false
	end
	if square:Is("IsTable") then
		--print("Table!")
		return false
	end
	if square:Is("IsTableTop") then
		--print("Is TableTop!")
		return false
	end	
	if square:isSolid() then
		--print("Solid!")
		return false
	end
	if square:isSolidTrans() then
		--print("Solid Trans!")
		return false
	end
	local cell = square:getCell() -- the cell wont change. no need to getWorld():getCell() every step of the loop
	local x, y, z = square:getX(), square:getY(), square:getZ()
	local square2 = cell:getGridSquare(x-1, y, z)
	if square2 and square:getDoorFrameTo(square2) then
		--print("Door Frame!")
		return false
	end
	local square2 = cell:getGridSquare(x+1, y, z)
	if square2 and square:getDoorFrameTo(square2) then
		--print("Door Frame!")
		return false
	end
	local square2 = cell:getGridSquare(x, y-1, z)
	if square2 and square:getDoorFrameTo(square2) then
		--print("Door Frame!")
		return false
	end
	local square2 = cell:getGridSquare(x, y+1, z)
	if square2 and square:getDoorFrameTo(square2 ) then
		--print("Door Frame!")
		return false
	end	
	return true
end
	
	