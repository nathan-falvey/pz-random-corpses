require "Movables/ISMovableSpriteProps"


function ISMoveableSpriteProps:instanceItem(_spriteNameOverride)
	if self.isMoveable then
		local item;
        if self.customItem then
            item 	= instanceItem(self.customItem);
        else
            if self.isMultiSprite then
                item 	= instanceItem("Moveables.Moveable");
            else
                item 	= instanceItem("Moveables."..self.spriteName);
            end
            --item 	= instanceItem("Moveables."..self.spriteName); --instanceItem("Moveables.Moveable");
        end
        local spriteName = _spriteNameOverride or self.spriteName;
        if self.type == "Window" then                                   -- Some corrections
            if not self.spriteProps:Is("SmashedTileOffset") or self.spriteProps:Val("SmashedTileOffset") == 0 then
                return nil; -- cant instance broken windows
            end
        elseif self.type == "WindowObject" and self.isClosedState then
            spriteName = self.sheetName .. tostring(self.spriteID+4);
        end
		if self.customItem then
			item:setActualWeight(self.weight);
			return item;
		elseif item and item:ReadFromWorldSprite(spriteName) then
			item:setActualWeight(self.weight);
			return item;
		end
	end
end
