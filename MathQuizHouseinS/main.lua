-----------------------------------------------------------------------------------------
-- Title: Math Quiz
-- Name: Housein Shaib
-- Course: ICS2O
-- This program displays a numeric text field where the user can enter their answer for a
-- addition, subtraction, multiplication, or division math question
-----------------------------------------------------------------------------------------

-- Hides the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Sets the background colour
display.setDefault("background", 0/255, 220/255, 200/255)

-----------------------------------------------------------------------------------------
-- LOCAL VARIBLES
-----------------------------------------------------------------------------------------

-- Create local varibles
local questionObject
local correctObject
local incorrectObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local randomOperator
local numberPoints = 0
local correctCounter
local gameOver
local win
local mult = 10^(1)

-- Varibles for the timer
local totalSeconds = 10
local secondsLeft = 10
local clockText
local countDownTimer

local lives = 3
local heart1
local heart2
local heart3

-----------------------------------------------------------------------------------------
-- SOUNDS
-----------------------------------------------------------------------------------------

local correctSound = audio.loadSound("Sounds/trains2.mp3")
local correctSoundChannel
local incorrectSound = audio.loadSound("Sounds/water1.mp3")
local incorrectSoundChannel
local gameOversound = audio.loadSound("Sounds/electronics018.mp3")
local gameOversoundChannel
local winSound = audio.loadSound("Sounds/comic003.mp3")
local winSoundChannel

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

local function AskQuestion()
	randomOperator = math.random(1, 4)

	-- Create question in text object and sets the value of correctAnswer
	if (randomOperator == 1) then
		randomNumber1 = math.random(1, 20)
		randomNumber2 = math.random(1, 20)
		correctAnswer = randomNumber1 + randomNumber2
		questionObject.text = (randomNumber1 .. "+" .. randomNumber2 .. "=")
		questionObject.xScale = 2
		questionObject.yScale = 2
	elseif (randomOperator == 2) then
		randomNumber1 = math.random(1, 20)
		randomNumber2 = math.random(1, 20)
		correctAnswer = randomNumber1 - randomNumber2
		questionObject.text = (randomNumber1 .. "-" .. randomNumber2 .. "=")
		questionObject.xScale = 2
		questionObject.yScale = 2
	if (randomNumber2 > randomNumber1) then
		correctAnswer = randomNumber2 - randomNumber1
		questionObject.text = (randomNumber2 .. "-" .. randomNumber1 .. "=")
		questionObject.xScale = 2
		questionObject.yScale = 2
	end
	elseif (randomOperator == 3) then
			randomNumber1 = math.random(1, 100)
			randomNumber2 = math.random(1, 100)
  			correctAnswer =  math.floor(randomNumber1/randomNumber2 * mult + 0.5) / mult
			questionObject.text = (randomNumber1 .. "/" .. randomNumber2 .. "=")
			questionObject.xScale = 2
			questionObject.yScale = 2
			print(correctAnswer)
		if (correctAnswer < 1) then
			correctAnswer = math.floor(randomNumber2/randomNumber1 * mult + 0.5) / mult		questionObject.text = (randomNumber2 .. "/" .. randomNumber1 .. "=")
			questionObject.xScale = 2
			questionObject.yScale = 2
			print(correctAnswer)
		end
	else
		randomNumber1 = math.random(1, 10)
		randomNumber2 = math.random(1, 10)
		correctAnswer = randomNumber1 * randomNumber2
		questionObject.text = (randomNumber1 .. "x" .. randomNumber2 .. "=")
		questionObject.xScale = 2
		questionObject.yScale = 2
	end
end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

local function UpdateHearts()
		if (lives == 0) then
		heart1.isVisible = false
		gameOversoundChannel = audio.play(gameOversound)
		clockText.isVisible = false
		timer.cancel(countDownTimer)
		gameOver.isVisible = true
		numericField.isVisible = false
	elseif (lives == 1) then
		heart2.isVisible = false
	elseif (lives == 2) then
		heart3.isVisible = false
	end
end

local function UpdatePoints()
	if (numberPoints == 5) then
		win.isVisible = true
		clockText.isVisible = false
		timer.cancel(countDownTimer)
		numericField.isVisible = false
		winSoundChannel = audio.play(winSound)
	end
end


local function UpdateTime()

	-- Decrement the number of seconds
	secondsLeft = secondsLeft - 1

	-- Display the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0) then
		secondsLeft = totalSeconds
		lives = lives - 1
		incorrectSoundChannel = audio.play(incorrectSound)
		AskQuestion()
		UpdateHearts()
	end
end


local function NumericFieldListener(event)

	-- User begins editing "numericField"
	if (event.phase == "began") then

		-- Clear text field
		event.target.text = ""

	elseif event.phase == "submitted" then

			-- When answer is submitted (enter key is presed) set user input to user's answer
			userAnswer = tonumber(event.target.text)

			-- If the user's answer and the correct answer are the same or different:
			if (userAnswer == correctAnswer) then
				correctSoundChannel = audio.play(correctSound)
				numberPoints = numberPoints + 1
				correctObject.isVisible = true
				secondsLeft = totalSeconds
				timer.performWithDelay(2500, HideCorrect)
				-- Calls the UpdatePoints function
				UpdatePoints()
				-- Creates number of correct answers
				correctCounter.text = ("Correct: " .. numberPoints)
			else
				incorrectSoundChannel = audio.play(incorrectSound)
				lives = lives - 1
				UpdateHearts()
				incorrectObject.isVisible = true
				secondsLeft = totalSeconds
				timer.performWithDelay(2500, HideIncorrect)
			end
		numericField.text = ""	
	end
end


-- Function that calls the timer
local function StartTimer()
	-- Create a countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay(1000, UpdateTime, 0)
end

-----------------------------------------------------------------------------------------
-- OBJECT CREATION
-----------------------------------------------------------------------------------------

-- Displays a question and sets the colour
questionObject = display.newText("", display.contentWidth/3, display.contentHeight/2, nil, 50)
questionObject.x = display.contentWidth/2
questionObject:setTextColor(155/255, 42/255, 198/255)

-- Create the correct text object and make it invisible
correctObject = display.newText("Correct!", display.contentWidth/2, display.contentHeight/3, nil, 50)
correctObject:setTextColor(0/255, 0/255, 0/255)
correctObject.isVisible = false

-- Create the incorrect text object and make it invisible
incorrectObject = display.text("Incorrect, the answer was" .. correctAnswer --, display.contentWidth/2, display.contentHeight/3, nil, 55)
incorrectObject:setTextColor(150/255, 0/255, 255/255)
incorrectObject.isVisible = false

-- Create numeric field
numericField = native.newTextField(display.contentWidth/2, display.contentHeight/2, 150, 80)
numericField.xScale = 2.5
numericField.x = display.contentWidth/2
numericField.y = 500
numericField.inputType = "default"

-- Create score counter
correctCounter = display.newText("", 200, 100, nil, 75)
correctCounter:setTextColor(10/255, 30/255, 50/255)
correctCounter.text = ("Correct: " .. numberPoints)

-- Create the lives to display on the screen
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7

heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7

clockText = display.newText("", 90, 200, nil, 50)
clockText:setTextColor(255/255, 255/255, 255/255)
clockText.xScale = 2
clockText.yScale = 2

gameOver = display.newImageRect("Images/gameOver.png", 1350, 900)
gameOver.x = display.contentCenterX
gameOver.y = 400
gameOver.isVisible = false

win = display.newImageRect("Images/win.png", 1150,875)
win.x = display.contentCenterX - 20
win.y = 415
win.isVisible = false

-- Add the event listener for numeric fiel
numericField:addEventListener("userInput", NumericFieldListener)

-----------------------------------------------------------------------------------------
-- FUNCTION CALLS
-----------------------------------------------------------------------------------------

-- Call the function to ask the question
AskQuestion()
StartTimer()
UpdateTime()