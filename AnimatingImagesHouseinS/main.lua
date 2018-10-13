-----------------------------------------------------------------------------------------
---- Title: Animating images
-- Name: Housein Shaib
-- Course: ICS2O
-- This program displays 3 images that move
-----------------------------------------------------------------------------------------

-- Hides the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Global variables
scrollSpeedPingu = 2.5
scrollSpeedSpaceship = 4
scrollSpeedYingyangX = 5.9
scrollSpeedYingyangY = 3
rotationSpeedYingyang = 5

-- Background image with width and height
local backgroundImage = display.newImageRect("Images/background.jpg", 2048, 1536)

-- Charcter image with width and height
local spaceship = display.newImageRect("Images/spaceship.png", 450, 450)
local yingyang = display.newImageRect("Images/yingyang.png", 300, 300)
local pingu = display.newImageRect("Images/pingu.png", 250, 250)

-- Sets images to be transparent
pingu.alpha = 1
spaceship.alpha = 1
yingyang.alpha = 1

-- Sets the x and y position of the charcters
pingu.x = -275
pingu.y = 500
spaceship.x = 700
spaceship.y = 400
yingyang.x = 200
yingyang.y = 200

-- Function: Move Pingu
-- Input: This function accepts an event listener
-- Output: None
-- Description: This function adds the scroll speed to the x-value of pingu
local function MovePingu(event)
	-- Adds the scroll speed to the x-value of pingu
	pingu.x = pingu.x + scrollSpeedPingu
	-- Changes the size of pingu
	pingu.xScale = pingu.xScale + 0.009
	pingu.yScale = pingu.yScale + 0.009
end

-- Function: Move Ship
-- Input: This function accepts an event listener
-- Output: None
-- Description: This function adds the scroll speed to the x-value of the ship and makes the ship fade out
local function MoveShip(event)
	-- Adds the scroll speed to the x-value of ship
	spaceship.x = spaceship.x - scrollSpeedSpaceship
	spaceship.alpha = spaceship.alpha - 0.001
end

-- Function: Move YingYang
-- Input: This function accepts an event listener
-- Output: None
-- Description: This function adds the scroll speed to the x-value of YingYang
local function MoveYingYang(event)
	-- Adds the scroll speed to the x-value and the y-value of YingYang
	yingyang.x = yingyang.x + scrollSpeedYingyangX
	yingyang.y = yingyang.y + scrollSpeedYingyangY
	yingyang.rotation = yingyang.rotation + rotationSpeedYingyang
end

-- Functions will be called over and over again
Runtime:addEventListener("enterFrame", MovePingu)
Runtime:addEventListener("enterFrame", MoveShip)
Runtime:addEventListener("enterFrame", MoveYingYang)