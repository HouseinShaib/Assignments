-----------------------------------------------------------------------------------------
---- Title: Animating images
-- Name: Housein Shaib
-- Course: ICS2O
-- This program displays 3 images that move
-----------------------------------------------------------------------------------------

-- Hides the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Global variables
scroolSpeedPingu = 
scroolSpeedSpaceship

-- Background image with width and height
local backgroundImage = display.newImageRect("Images/background.jpg", 2048, 1536)

-- Charcter image with width and height
local pingu = display.newImageRect("Images/pingu.png", 275, 275)
local spaceship = display.newImageRect("Images/spaceship.png", 450, 450)

-- Sets images to be transparent
pingu.alpha = 1
spaceship.alpha = 1

-- Sets the x and y position of the charcters
pingu.x = 300
pingu.y = 500