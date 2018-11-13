-----------------------------------------------------------------------------------------
---- Title: Comapny Logo Anamation
-- Name: Housein Shaib
-- Course: ICS2O
-- This program display our company logo anamation
-----------------------------------------------------------------------------------------

-- Hides the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Global variables
scrollSpeedCompanyLogo = 7

-- Creates "woosh" Sound
local woosh = audio.loadSound("Sounds/companyLogoSound.mp3")
local wooshChannel

-- Displays the company logo
local companyLogo = display.newImageRect("Images/CompanyLogoHouseinS@2x.png", 1024, 769)
companyLogo.x = display.contentCenterX
companyLogo.y = -display.contentHeight*1.1

-- This function plays the sound effect
local function PlaySound()
	wooshChannel = audio.play(woosh)
end

timer.performWithDelay(1797, PlaySound)

-- Function: MoveLogo
-- Input: This function accepts an event listener
-- Output: None
-- Description: This function adds the scroll speed to the y-value of companyLogo
local function MoveLogo(event)
	-- Adds the scroll speed to the x-value of pingu
	companyLogo.y = companyLogo.y + scrollSpeedCompanyLogo

	if (companyLogo.y > display.contentCenterY) then
		scrollSpeedCompanyLogo = 0
		companyLogo.alpha = companyLogo.alpha - 0.007
	end
end

-- Functions will be called over and over again
Runtime:addEventListener("enterFrame", MoveLogo)