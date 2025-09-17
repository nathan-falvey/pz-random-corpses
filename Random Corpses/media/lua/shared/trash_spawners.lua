require "ScatteredStashes"

function scattered_trash(square)
	local roll = ZombRand(0,51)
	if roll > 12 then roll = roll + 3 end	
	local sprite_type = tostring("trash_01_" .. tostring(roll))
	if not sprite_type then return end	
	local newSprite = (IsoObject.new(getCell(), square, sprite_type));	
	if not newSprite then
		print("NO NEW SPRITE!")
		return false
	end	
	if newSprite and newSprite:getProperties() then 
		if newSprite:getProperties():Val("ContainerType") or newSprite:getProperties():Val("container") then
			 newSprite:createContainersFromSpriteProperties() --end
				
		end
	end
	newSprite:getModData().forage = false
	square:getObjects():add(newSprite)
	square:RecalcProperties()	
	square:getModData().specialSquare = true
	
	newSprite:transmitCompleteItemToServer()
	newSprite:transmitCompleteItemToClients()
	

	
	
	
	return newSprite 
end
