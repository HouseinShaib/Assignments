-----------------------------------------------------------------------------------------
---- Title: Animating images
-- Name: Housein Shaib
-- Course: ICS2O
-- This program displays 3 images that move
-----------------------------------------------------------------------------------------

-- Hides the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Global variables
scrollSpeedPingu = 6
scrollSpeedSpaceship = 5
scrollSpeedYingyang

-- Background image with width and height
=local backgroundImage = display.newImageRect("Images/background.jpg", 2048, 1536)

-- Charcter image with width and height
local pingu = display.newImageRect("Images/pingu.png", 275, 275)
local spaceship = display.newImageRect("Images/spaceship.png", 450, 450)
local yingyang = display.newImageRect("Images/yingyang.png", 300, 300)
-- Sets images to be transparent
pingu.alpha = 1
spaceship.alpha = 1
yingyang.alpha = 1

-- Sets the x and y position of the charcters
pingu.x = 300
pingu.y = 500
spaceship.x = 700
spaceship.y = 400
yingyang.x = 200
yingyang.y = 200

-- Function: Move beetleship
-- Input: This function accepts an event listener
-- Output: None
-- Description: This function adds the scroll speed to the x-value of the ship
--local function MovePingu(event)
	-- Adds the scroll speed to the x-value of the ship
	--pingu.x = pingu.x + scrollSpeedPingu
	-- Change the transparency of the ship every time it moves
	--pingu.alpha = pingu.alpha + 0.01
--end