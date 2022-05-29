--[[
pressureFlow nachbarn:
         0
         0
         | 
270  3--X--1 90
         |
         2
        180	

--]]



 DEBUG = false

 resX = 800
 resY = 600
 tileSize = 64 --pixel

world = {}
world.sizeX = 10
world.sizeY = 8

GFX = {}
ANI = {}

CTRL = {}
CTRL.mouseX = 0
CTRL.mouseY = 0
CTRL.mouseB1 = false


 EMPTY = 0
 WALL = 1
 
 PIPEV = 2
 PIPECROSS = 3
 PIPECORNER = 4
 PIPET = 5
 PIPEONEWAY = 6

--[[
steamPS = love.graphics.newImage("steam.png");
steamPS = love.graphics.newParticleSystem(steamPS, 1000)
steamPS:setEmissionRate(20)
steamPS:setSpeed(150, 200)
steamPS:setDirection(360)
steamPS:setGravity(0, 0)
steamPS:setSize(0.4, 0.4)
steamPS:setColor(255, 255, 255, 220,   150, 150, 150, 100)  -- r1, g1, b1, a1, r2, g2, b2, a2 )
steamPS:setPosition(400, 300)
steamPS:setLifetime(0.1)
steamPS:setParticleLife(0.5)
steamPS:setSpin(-10, 10)
steamPS:setSpread(.3)
steamPS:stop()
--]]
steamTiles = {}	--.tx .ty .direction .PS

PS = {}	--particle systems: .ps  .fadeAway

PLAYING=1
MENU=2
INTRO=3
HIGHSCORE=4
COMIC = 5
game = {}	-- 	.level 	.levelWon	.status	.levelData (zum level neustarten)	.aniFrame (für multiImage) 	.selectedLevelNr	.playMusic	.playSound
--				game. 	game.level[levelNummer].unlocked .complete	game.highestCompletedLevel	.continueShown ist der continue button schon geaddet worden?
game.aniFrame = 1

local ingameButtons = {}

local TLfres = require "tlfres"
require ("world")
require ("buttons")
require ("sound")
require ("menu")
require ("levels")
require ("comic")


function newPS (px,py, direction, PStype)
	if (not PStype) then	--der ingame dampf
		local img = love.graphics.newImage("steam.png");
		local p = love.graphics.newParticleSystem(img, 1000)
		p:setEmissionRate(20)
		p:setSpeed(150, 200)
		p:setDirection(math.rad((direction or 0) -90))
		p:setLinearAcceleration(0, 0)
		p:setSizes(0.4, 0.8) --0.4,0.4
		p:setColors(255, 255, 255, 220,   200, 200, 200, 100)  -- r1, g1, b1, a1, r2, g2, b2, a2 )
		p:setPosition(px, py)
		p:setEmitterLifetime (0.1)
		p:setParticleLifetime(0.5)
		p:setSpin(-10, 10)
		p:setSpread(.6)
		p:stop()	
		return {ps=p, fadeAway=false}
	end
	
	if (PStype=="bigsteam") then
		local img = love.graphics.newImage("steam.png");
		local p = love.graphics.newParticleSystem(img, 1000)
		p:setEmissionRate(20)
		p:setSpeed(150, 200)
		p:setDirection(math.rad((direction or 0) -90))
		p:setLinearAcceleration(0, 0)
		p:setSizes(0.6, 1) --0.4,0.4
		p:setColors(255, 255, 255, 220,   200, 200, 200, 100)  -- r1, g1, b1, a1, r2, g2, b2, a2 )
		p:setPosition(px, py)
		p:setEmitterLifetime(0.1)
		p:setParticleLifetime(1)
		p:setSpin(-5, 5)
		p:setSpread(.6)
		p:stop()	
		return {ps=p, fadeAway=false}
	end
end

function love.load()
	GFX.wallTile = love.graphics.newImage("wall.png")
	GFX.pipeVTile = love.graphics.newImage("pipeV.png")
	GFX.pipeCornerTile = love.graphics.newImage("pipeCorner.png")
	GFX.pipeCrossTile = love.graphics.newImage("kreuzung.png")
	GFX.pipeTTile = love.graphics.newImage("t-kreuzung.png")
	GFX.pipeOneWay = love.graphics.newImage("pipeEnd.png")
	GFX.emptyTile = love.graphics.newImage("boden_hell.png")
	
	GFX.flange = love.graphics.newImage("flansch.png")
	GFX.start = love.graphics.newImage("start.png")
	GFX.target = love.graphics.newImage("target.png")	
	
	--GFX.manometer = loadMultiImage ("messgeraet_p", 8)
	GFX.manometer = love.graphics.newImage("messgeraet_p1.png")
	GFX.wrench = love.graphics.newImage("zange_schatten.png")
	GFX.textbox = love.graphics.newImage("textbox.png")
	
	GFX.logo = love.graphics.newImage ("logo2.png")
	GFX.menuBG = love.graphics.newImage ("background/menubg.png")
	GFX.ingameFrame = love.graphics.newImage ("background/ingamebg_sepia.png")	
	
	ANI.manometer = {images=loadMultiImage ("messgeraet_p", 8), }
	largeFont = love.graphics.newFont( 20 )
	love.graphics.setFont(largeFont)
	love.window.setMode(resX, resY,{fullscreen=false, resizable=true, minwidth=400, minheight=300})
	love.mouse.setGrabbed (false)
	initWorld ()
	--startPlaying ()
	--loadWorldFromData ("0,2,0,0  0,1,0,0  0,1,0,0  0,2,0,0  2,0,1,0  0,2,0,0  0,0,0,0  4,0,0,0  2,1,0,0  4,2,0,0  0,1,0,0  4,2,0,0  2,3,0,0  4,4,0,0  2,3,0,0  4,4,0,0  4,2,0,0  4,3,0,0  4,2,0,0  2,0,0,0  4,0,0,0  5,1,0,0  4,3,0,0  4,3,0,0  5,3,0,0  3,1,0,0  5,4,0,0  2,1,0,0  5,3,0,0  4,2,0,0  2,1,0,0  3,4,0,0  4,4,0,0  2,4,0,0  4,4,0,0  5,2,0,0  4,2,0,0  4,1,0,0  2,3,0,0  2,1,0,0  2,0,0,0  4,1,0,0  2,3,0,0  5,2,0,0  5,1,0,0  4,4,0,0  4,2,0,0  5,3,0,0  5,1,0,0  4,2,0,0  4,4,0,0  5,3,0,0  5,2,0,0  4,1,0,0  5,2,0,0  5,3,0,0  4,1,0,0  2,3,0,0  2,1,0,0  4,2,0,0  0,0,0,0  4,2,0,0  5,3,0,0  5,1,0,0  4,2,0,0  4,3,0,0  5,4,0,0  5,3,0,0  3,4,0,0  2,1,0,1  0,0,0,0  0,2,0,0  2,0,0,1  4,3,0,0  2,2,0,0  2,2,0,0  4,2,0,0  4,4,0,0  4,4,0,0  0,0,0,0  ")
	--updateWorld()
	game.highestCompletedLevel = 0--0
	game.selectedLevelNr = 1
	game.playMusic = true
	game.playSound = true
	bgmSource =love.audio.play("orgelgabsnichtmehr.mp3", "stream", true)
	toMenu()	
end

function love.draw()
	love.graphics.push()
	TLfres.beginRendering(800, 600, false)
	--love.graphics.setColor(0, 0, 1, 1)
	--love.graphics.rectangle ("line", 0, 0, 800, 600)
	
	if (game.status==PLAYING) then drawPlaying () end
	if (game.status==MENU) then drawMenu () end
	if (game.status == COMIC) then drawComic() end
	--love.graphics.print("game.aniFrame="..game.aniFrame or "nil", 600,550)
	love.graphics.setColor(1,1,1,1)
	love.graphics.setBlendMode("alpha")
	TLfres.endRendering({0.1,0,0.1, 1})
	love.graphics.pop()
end

function drawPlaying ()	
	--background
	love.graphics.setColor(1, 1,1, 1)
	--love.graphics.rectangle("fill", 0, 0, 800, 600 )
	love.graphics.draw(GFX.ingameFrame, 0,0)
	drawWorld ()
	if (isInWorld (p2t (CTRL.mouseX,CTRL.mouseY))) then
		--love.mouse.setVisible(false)
		drawTileHighLight (t2p (p2t (CTRL.mouseX,CTRL.mouseY)))
		love.graphics.draw(GFX.wrench, CTRL.mouseX-tileSize/2, CTRL.mouseY-tileSize/2)
	else
		love.mouse.setVisible(true)
	end
	
	love.graphics.print("Level: ".. (game.selectedLevelNr or "nil"), 700,20)
	if (PS) then
		for i,v in ipairs(PS) do
			love.graphics.draw(v.ps, 0, 0)
		end
	end
	drawButtons (ingameButtons)
	---
	local s = ""
	if (world.closedCircuit) then
		s = "Scheint dicht zu sein. Aber es ist noch nicht alles angeschlossen."
	else
		s = "Oh oh. Da kommt ja ueberall Dampf raus."
	end	
	if (game.levelWon) then 
		local c = "Passwort: " .. levels[game.selectedLevelNr].code
		love.graphics.setColor(255,0,0,255)
		love.graphics.print(c, 480,560)
		s="Gute Arbeit! Auf zur naechsten Aufgabe!" 
	end
	love.graphics.setColor(255,255,255,255)
	love.graphics.print(s, 50,560)
end

local tick = 0
function love.update(dt)
	tick = tick +dt
	if (tick > 0.25) then
		game.aniFrame = game.aniFrame +1
		if (game.aniFrame > 8) then game.aniFrame = 1 end
		tick = 0
	end
	local reLoop = true
	while (reLoop) do
		reLoop=false
		for i,v in ipairs(PS) do
			if (v.fadeAway == true and v.ps:getCount() <1) then
				table.remove (PS,i)
				--PS[i]=nil
				reLoop = true
				break
			end			
		end
	end	
	
	if (PS) then
		for i,v in ipairs(PS) do
			if (not v.fadeAway) then
				v.ps:start()
			end
			v.ps:update (dt)
		end
	end
	
	CTRL.mouseX, CTRL.mouseY = TLfres.getMousePosition(800, 600) --love.mouse.getPosition()
	--game physics
	if (game.status == PLAYING) then
		gameLoop (dt)
	end
	--comic
	if (game.status == COMIC) then
		comicLoop (dt)
	end
end

function getMouseTileXY ()
	return p2t (CTRL.mouseX,CTRL.mouseY)
end

function love.keypressed(key, unicode)
	--if (key == "escape") then love.event.push("q") return end	--remove before release

	local x,y = getMouseTileXY ()
	if (DEBUG) then
		if (key == "kp7") then world[x][y] = tilePipeCorner (0) updateWorld () end
		if (key == "kp9") then world[x][y] = tilePipeCorner (1) updateWorld () end
		if (key == "kp3") then world[x][y] = tilePipeCorner (2) updateWorld () end
		if (key == "kp1") then world[x][y] = tilePipeCorner (3) updateWorld () end
		
		if (key == "kp5") then world[x][y] = tilePipeCross (0) updateWorld () end
		
		if (key == "kp4") then world[x][y] = tilePipeV (0) updateWorld () end
		if (key == "kp6") then world[x][y] = tilePipeV (0) updateWorld () end	
		if (key == "kp8") then world[x][y] = tilePipeV (1) updateWorld () end
		if (key == "kp2") then world[x][y] = tilePipeV (1) updateWorld () end
		if (key == "kp0") then world[x][y] = tilePipeOneWay (0) updateWorld () end
		
		if (key == "w") then world[x][y] = tilePipeT (0) updateWorld () end
		if (key == "a") then world[x][y] = tilePipeT (1) updateWorld () end	
		if (key == "d") then world[x][y] = tilePipeT (2) updateWorld () end
		if (key == "s") then world[x][y] = tilePipeT (3) updateWorld () end	
		if (key == "q") then world[x][y] = tileEmpty (0) updateWorld () end	
		
		if (key == "n") then initWorld () end
		if (key == "i") then world[x][y].isStart = not (world[x][y].isStart or false) updateWorld() end
		if (key == "o") then world[x][y].isTarget = not (world[x][y].isTarget or false) updateWorld() end
		
		if (key == "backspace") then game.levelWon = true end
		
		if (key == "r") then scrambleWorld(20) updateWorld() end
		
		if (key=="f1") then saveWorldToFile ("drucktest.txt") end
		if (key=="f2") then loadWorldFromFile ("drucktest.txt") end
		
		if (key=="f5") then makeRandomWorld() end
	end
	
	if (key == "f") then
		for i,v in ipairs(PS) do
			v.fadeAway=true
			v.ps:pause()
		end
	end
	
	if (game.status == MENU) then menuKeyPressed (key, unicode) return end
end

function love.mousepressed(x, y, button)	
	x,y=TLfres.getMousePosition (800,600)
	if (game.status == PLAYING) then 
		ingameMenuMousePressed (x,y, button)	
		if (button==1) then CTRL.mouseB1 = true end
		if (button==2) then
			local x,y = getMouseTileXY ()
			updateWorld ()
			pressureFlow (x,y)
		end
		return
	end
	if (game.status == MENU) then menuMousePressed (x,y, button) return end
	if (game.status == COMIC) then comicMousePressed (x,y, button) return end
end



function drawTileHighLight (px,py)
	love.graphics.setColor(255,255,255,255)
	love.graphics.rectangle ("line", px-tileSize/2-1, py-tileSize/2, tileSize-1, tileSize)
end

--tile to pixel coordinates
function t2p (tx,ty)
	return tx*tileSize, ty*tileSize
end

function p2t (px,py)
	return math.floor((px/tileSize)+0.5), math.floor((py/tileSize)+0.5)
end

function gameLoop (dt)
	if (CTRL.mouseB1 == true) then
		CTRL.mouseB1 = false
		local tx,ty = getMouseTileXY ()		
		if (isInWorld (tx,ty) and (not world[tx][ty].isStart and not world[tx][ty].isTarget and not game.levelWon) or DEBUG) then
			rotateTile (tx,ty,1)
			updateWorld ()
		end
	end
	if (game.levelWon and not game.continueShown) then
		addButton (ingameButtons, 682,530, 112,64, "", "continue", love.graphics.newImage("buttons/continue.png"), love.graphics.newImage("buttons/over/continue.png"))
		game.continueShown = true
	end	
end

function startPlaying (level)
	game.status = PLAYING
	game.levelWon = false
	game.level = level
	game.continueShown = false
	CTRL.mouseB1 = false
	if (level > 0) then 
		loadWorldFromData (levels[level].dataString)
	end
	ingameButtons = {}
	addButton (ingameButtons, 680,60, 112,64, "", "menu", love.graphics.newImage("buttons/menu.png"), love.graphics.newImage("buttons/over/menu.png"))
	addButton (ingameButtons, 680,160, 112,64, "", "levelreset", love.graphics.newImage("buttons/neu.png"),love.graphics.newImage("buttons/over/neu.png"))
	addButton (ingameButtons, 680,260, 112,64, "", "sound", love.graphics.newImage("buttons/sound_on.png"))
	addButton (ingameButtons, 680,360, 112,64, "", "music", love.graphics.newImage("buttons/music_on.png"), love.graphics.newImage("buttons/over/music_on.png"))
--	addButton (ingameButtons, 680,480, 112,64, "", "music", love.graphics.newImage("buttons/music_on.png"), love.graphics.newImage("buttons/over/music_on.png"))
	updateWorld()
end

function nextLevel ()
	game.highestCompletedLevel = game.level
	game.level = game.level + 1
	game.selectedLevelNr = game.level	
	if (levels[game.level].comic) then
		startComic (levels[game.level].comic)
	else
		startPlaying (game.level)
	end
end

--fn..1 bis fn..n -> blabla1 bis blabla8
function loadMultiImage (fn, n)	
	local multiImage = {}
	--multiImage.imagesn = n
	for i = 1, n, 1 do		
		multiImage[i] = love.graphics.newImage (fn .. i.. ".png")
	end
	return multiImage
end


----------ingame menu
function ingameMenuMousePressed (x,y, button)
	print ("ingameMenuMousePressed:", x,y,button)
	local clicked, ci = clickedButton (ingameButtons, x, y)
	print (clicked)
	if (clicked == "menu") then toMenu() end
	if (clicked == "levelreset") then
		loadWorldFromData (game.levelData) 
		updateWorld ()
	end
	if (clicked == "continue") then nextLevel () end
	
	if (clicked == "music") then
		game.playMusic = not game.playMusic
		if (game.playMusic) then
			ingameButtons[ci].bitmap = love.graphics.newImage("buttons/music_on.png")
			ingameButtons[ci].overBitmap = love.graphics.newImage("buttons/over/music_on.png")
			bgmSource =love.audio.play("orgelgabsnichtmehr.mp3", "stream", true)
		else
			ingameButtons[ci].bitmap = love.graphics.newImage("buttons/music_off.png")
			ingameButtons[ci].overBitmap = love.graphics.newImage("buttons/over/music_off.png")
			--love.audio.play("orgelgabsnichtmehr.mp3", "stream", true) 
			love.audio.stop(bgmSource)
		end
	end
end