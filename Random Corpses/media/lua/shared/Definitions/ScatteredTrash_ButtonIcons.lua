require "Definitions/ContainerButtonIcons"

ContainerButtonIcons = ContainerButtonIcons or {}

local t = {}

t.Trash= getTexture("media/textures/Trash.png")
t.TrashPaper= getTexture("media/textures/TrashPaper.png")

ContainerButtonIcons.Trash = t.Trash
ContainerButtonIcons.TrashPaper = t.TrashPaper