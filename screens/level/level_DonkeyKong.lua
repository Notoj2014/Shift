local Screen = Level:extend()

function Screen:activate()
	-- levelName
	local levelName = "大金刚"

	-- Rectangle
	local reZ = 100
	local reLenX = base.guiWidth-75
	local reLenY = base.guiHeight/2
	local reDir = math.pi/18
	--ball
	local cR = 20

	-- player location
	local playerX = base.guiWidth/2
	local playerY = base.guiHeight/2+80
	local playerZ = 100
	-- destination location
	local destinationX = base.guiWidth-50
	local destinationY = base.guiHeight/2+20
	local destinationZ = base.guiHeight+10
	-- create player and destination
	Screen.super.activate(self, playerX, playerY, playerZ, destinationX, destinationY, destinationZ, levelName)
	
	--- here to create shape
	Screen:addShapeList(Ball,		base.guiWidth-80, 80, 0,			cR)

	Screen:addShapeList(Rectangle, 80, 0, reZ,				reLenX, reLenY,			math.pi/2 +reDir)
	Screen:addShapeList(Rectangle, 0, reLenY, reZ+50,		reLenX, reLenY, 		math.pi/2 -reDir)

	-- add drawList
	Screen:addDrawList()
end

return Screen