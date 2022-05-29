require ("buttons")
require ("levels")

menuButtons = {}
levelSelectButtons = {}

function toMenu()
	love.mouse.setVisible(true)
	game.status = MENU
	menuButtons = {}
	addButton (menuButtons, 240,520, 112,60, "", "startgame", love.graphics.newImage("buttons/start.png"), love.graphics.newImage("buttons/over/start.png"))
	addButton (menuButtons, 680, 520, 112,60, "", "quit", love.graphics.newImage("buttons/ende.png"), love.graphics.newImage("buttons/over/ende.png"))
	levelSelectButtons = {}
	local x,y=0,0
	for i=1, #levels,1 do
			addButton (levelSelectButtons, 240+(x*64),260+(y*64),64,64, "", i, 
			love.graphics.newImage("buttons/"..i..".png"), 
			love.graphics.newImage("buttons/over/"..i..".png"),
			love.graphics.newImage("buttons/frame.png"),
			love.graphics.newImage("buttons/haken.png")
			)
		
		x = x+1
		if (x==5) then x = 0 y=y+1 end
	end
	unlockLevels (game.highestCompletedLevel or 0)	
	--levelSelectButtons[3].isChecked=true
end

function drawMenu ()	
	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.draw(GFX.menuBG, 0,0)
	love.graphics.draw(GFX.logo, 200,25)
	--[[
	love.graphics.draw(ANI.manometer.images[math.random(1,5)], 100,50, 0, 1,1,tileSize/2, tileSize/2)
	love.graphics.print("drawMenu()", 70,55)
	love.graphics.print("game.selectedLevelNr="..(game.selectedLevelNr or "nil"), 150,20)
	--]]
	--love.graphics.print("Level Auswahl:", 200,400)
	drawButtons (menuButtons)
	drawButtons (levelSelectButtons)
	love.graphics.print("Passwort: " .. levelCode, 400,540)
	
	--credits
	local cx,cy=20,500
	love.graphics.setColor(0, 0, 0, 255)
	--love.graphics.draw(GFX.textbox, 20, 500)	
end

function menuMousePressed (x,y, button)
	print (x,y,button)
	local clicked = clickedButton (menuButtons, x, y)
	print (clicked)
	if (clicked == "quit") then love.event.push("quit") end
	if (clicked == "startgame") then 
		if (levels[game.selectedLevelNr] and levels[game.selectedLevelNr].comic) then
			startComic (levels[game.selectedLevelNr].comic)
		else		
			startPlaying (game.selectedLevelNr)
		end
	return end
	
	local levelSelectClick,lvl = clickedButton (levelSelectButtons, x, y)
	if (levelSelectClick ~= "NOBUTTONCLICKED") then
		if (lvl-2 < game.highestCompletedLevel) then	--only allow selecting if levels are completed so far
			game.selectedLevelNr = levelSelectClick
			radioHighLight (levelSelectButtons, levelSelectClick)
		end
	end
	
	--startPlaying ()
	print (clicked)
end

levelCode = ""
allowedKeys = {["0"]="0",["1"]="1",["2"]="2",["3"]="3",["4"]="4",["5"]="5",["6"]="6",["7"]="7",["8"]="8",["9"]="9",
["kp0"]="0",["kp1"]="1",["kp2"]="2",["kp3"]="3",["kp4"]="4",["kp5"]="5",["kp6"]="6",["kp7"]="7",["kp8"]="8",["kp9"]="9"}
function menuKeyPressed (key, unicode)
	if (allowedKeys[key] and #levelCode < 10) then
		levelCode = levelCode .. allowedKeys[key]
		checkLevelCodeUnlock()		
	end
	if (key == "backspace" or #levelCode >= 10) then levelCode = "" end
end

function checkLevelCodeUnlock ()
	for i=1, #levels,1 do
		if ((levels[i].code or 0) == levelCode) then
			game.highestCompletedLevel = i
			unlockLevels (game.highestCompletedLevel)
			levelCode = ""
			return
		end
	end
end

function unlockLevels (highest)
	for i=1, #levels,1 do
		if (i <= game.highestCompletedLevel) then 
			levelSelectButtons[i].isChecked = true 
		else
			levelSelectButtons[i].isChecked = false
		end	
	end
radioHighLight (levelSelectButtons, (game.highestCompletedLevel or 1)+1)
game.selectedLevelNr = highest+1
end

function menuLoop ()

end