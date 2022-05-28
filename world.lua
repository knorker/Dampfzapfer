local scale = 1

--called when tiles are changed
function updateWorld ()
	updatePressure()
	steamTiles = {}
	--pressureFlow (2,2)
	--pressureFlow (3,3)
	for i,v in ipairs(PS) do
		v.fadeAway=true
		v.ps:pause()
	end
	local closedCircuit = true
	for x=1, world.sizeX,1 do		
		for y=1 , world.sizeY,1 do
			world[x][y].openEnds = {}
			if (world[x][y].allowFlow) then
				for i = 0,3,1 do
					if (world[x][y].allowFlow[i]) then
						local nx, ny = neighbourXY (x,y, i)
						if (isInWorld (nx,ny)) then
							local neighourAllowFlow = world[nx][ny].allowFlow						
							local nAWr = getRotatedAllowFlow (neighourAllowFlow, 0)
							local ii = i -2
							if ii < 0 then ii = ii+4 end
							if (not nAWr[ii]) then						
								world[x][y].openEnds[i] = true
								--steamTiles[#steamTiles+1] = {tx=x, ty=y, direction=i}
								if (world[x][y].pressure>0) then
									local px,py=t2p(x,y)
									px=px+(math.sin (math.rad(i*90))*tileSize/2)
									py=py-(math.cos (math.rad(i*90))*tileSize/2)
									table.insert (PS, newPS(px,py,i*90))
									closedCircuit = false
								end
							end
						end
					end	
				end
			end
		end
	end
	world.closedCircuit = closedCircuit
	game.levelWon = checkVictory ()
end

function updatePressure ()
	for x=1, world.sizeX,1 do		
		for y=1 , world.sizeY,1 do
			world[x][y].pressure = 0
		end
	end
	--for i=1,#world.starts, 1 do
		--pressureFlow (world.starts[i].tx, world.starts[i].ty)
	--end
	for x=1, world.sizeX,1 do		
		for y=1 , world.sizeY,1 do
			if (world[x][y].isStart) then
				pressureFlow (x,y)
			end
		end
	end
end

function pressureFlow (x,y)
	pressureFlowRec (x or 5,y or 5)
end

-- 0
--3 1
 --2

--er = entrance rotation, von welcher richtung die pressure versucht reinzuflowen, yo
function pressureFlowRec (x,y, er)
	if (not isInWorld(x,y)) then return end
	local allowFlow = world[x][y].allowFlow
	if (not allowFlow) then return end
	if (er) then
		er=er+2
		if er > 3 then er = er -4 end
		if not allowFlow[er] then return end
	end
	if (x<1 or x>world.sizeX or y<1 or y>world.sizeY) then return end 
	if (not world[x][y].allowFlow) then return end
	
	if (world[x][y].pressure ==0) then 
		world[x][y].pressure = 1
			--die ifs checken exit-flow
			if allowFlow[0] then pressureFlowRec (x, y-1, 0) end
			if allowFlow[1] then pressureFlowRec (x+1, y, 1) end
			if allowFlow[2] then pressureFlowRec (x, y+1, 2) end
			if allowFlow[3] then pressureFlowRec (x-1, y, 3) end
	end
end

function changeTile (tx,ty, tileType)
	
end

--korrekt
function getRotatedAllowFlow (allowFlow, rotation)	
	if (not allowFlow) then return {[0]=false,[1]=false,[2]=false,[3]=false} end
	if (not rotation) then return allowFlow end
	if (rotation > 3) then rotation = rotation -4 end
	if (rotation == 0) then return {[0]=allowFlow[0],[1]=allowFlow[1],[2]=allowFlow[2],[3]=allowFlow[3],} end
	if (rotation == 1) then return {[0]=allowFlow[3],[1]=allowFlow[0],[2]=allowFlow[1],[3]=allowFlow[2],} end
	if (rotation == 2) then return {[0]=allowFlow[2],[1]=allowFlow[3],[2]=allowFlow[0],[3]=allowFlow[1],} end	
	if (rotation == 3) then return {[0]=allowFlow[1],[1]=allowFlow[2],[2]=allowFlow[3],[3]=allowFlow[0],} end	
end

function neighbourXY (tx,ty, r)
	if (tx and ty) then
	if (r==0) then return tx, ty-1 end
	if (r==1) then return tx+1, ty end
	if (r==2) then return tx, ty+1 end
	if (r==3) then return tx-1, ty end
	else return nil,nil
	end
end

function isInWorld (tx,ty)
	if (tx > world.sizeX) then return false end
	if (ty > world.sizeY) then return false end
	if (tx < 1) then return false end
	if (ty < 1) then return false end
	return true
end

----------pipe types
function tilePipeV (r)
if (not r) then r = 0 end
return  {
	tileType = PIPEV,
	allowFlow=getRotatedAllowFlow({[0]=true,[1]=false, [2]=true, [3]=false},r),
	rotation = r,
}
end

function tilePipeCorner (r)
if (not r) then r = 0 end
return {
	tileType = PIPECORNER,
	allowFlow=getRotatedAllowFlow({[0]=false,[1]=true, [2]=true, [3]=false},r),
	rotation = r,
}
end

function tilePipeCross (r)
if (not r) then r = 0 end
return {
	tileType = PIPECROSS,
	allowFlow=getRotatedAllowFlow({[0]=true,[1]=true, [2]=true, [3]=true},r),
	rotation = r,
}
end

function tilePipeT (r)
if (not r) then r = 0 end
return {
	tileType = PIPET,
	allowFlow=getRotatedAllowFlow({[0]=false,[1]=true, [2]=true, [3]=true},r),
	rotation = r,
}
end

function tileWall (r)
if (not r) then r = 0 end
return {
	tileType = WALL,
	allowFlow = nil, 
	rotation = r,
}
end

function tileEmpty (r)
if (not r) then r = 0 end
return {
	tileType = EMPTY,
	allowFlow=nil,
	rotation = r,
}
end

function tilePipeOneWay (r)
if (not r) then r = 0 end
return  {
	tileType = PIPEONEWAY,
	allowFlow=getRotatedAllowFlow({[0]=false,[1]=false, [2]=true, [3]=false},r),
	rotation = r,
}
end

function tile (tileType, r)
	if tileType == PIPEV then return tilePipeV(r) end
	if tileType == PIPECORNER then return tilePipeCorner(r) end
	if tileType == PIPET then return tilePipeT(r) end
	if tileType == PIPECROSS then return tilePipeCross(r) end 
	if tileType == WALL then return tileWall(r) end
	if tileType == EMPTY then return tileEmpty(r) end
	if tileType == PIPEONEWAY then return tilePipeOneWay(r) end
	return tileEmpty (0)
end

--0,1,2,3 to 0 90 180 270
function r2Rad (r)
	return math.rad ((r or 0) *90)
end

function rotateTile (tx,ty,diffR)
	if (not isInWorld(tx,ty)) then return end
	local isStart = world[tx][ty].isStart
	local isTarget = world[tx][ty].isTarget
	local r = world[tx][ty].rotation
	local newr = r +diffR
	if (newr<0) then newr = newr+4 end
	if (newr>4) then newr = newr-4 end
	world[tx][ty] = tile (world[tx][ty].tileType, newr)
	world[tx][ty].isStart = isStart
	world[tx][ty].isTarget = isTarget
end

function scrambleWorld (n)
	for i=1, n,1 do		
		local tx = math.random (2, world.sizeX-1)	--putting extra tiles on the outside makes it too easy
		local ty = math.random (2, world.sizeY-1)
		if (not world[tx][ty].isTarget and not world[tx][ty].isStart) then
			if (world[tx][ty].tileType ~= EMPTY) then
				rotateTile (tx,ty, math.random (0,3))
			else
				world[tx][ty] = tile (math.random (2,5), math.random (0,3))
			end
		end
	end
end

--***in andere datei
function checkVictory ()
	if (not world.closedCircuit) then return false end
	for x=1, world.sizeX,1 do
		for y=1 , world.sizeY,1 do
			if (world[x][y].isTarget) then
				if ((world[x][y].pressure or 0) == 0) then return false end
			end
		end
	end
	return true
end
-------------		SAVE/LOAD	----------------
--[[
2,1 2,3 ... \n
...
TILETYPE, ROTATION, ISSTART, ISTARGET space

--]]
function saveWorldToFile (fn)
	file = love.filesystem.newFile(fn)
	file:open('w')	
	for y=1 , world.sizeY,1 do
		for x=1, world.sizeX,1 do
			local isStart,isTarget=0,0
			if (world[x][y].isStart) then isStart = 1 end
			if (world[x][y].isTarget) then isTarget = 1 end
			local s = world[x][y].tileType..",".. world[x][y].rotation..","..isStart..","..isTarget .. " "
			file:write (s.." ")
		end
		--file:write ("\n")
	end
	file:close()
end

function loadWorldFromFile (fn)
	file = love.filesystem.newFile(fn)
	file:open('r')
	data = file:read()
	print (data)
	file:close()
	print "---"
	loadWorldFromData (data)
end

function loadWorldFromData (data)
	local x,y = 1,1	
	for token in string.gmatch(data, "[^%s]+") do
		if x>world.sizeX then x=1 y=y+1 end
		local t = explode (",", token)
		print("1 ->" .. (t[1] or "nil"))
		print("2 ->" .. (t[2] or "nil"))
		print("3 ->" .. (t[3] or "nil"))
		world[x][y] = tile (tonumber(t[1] or 0), tonumber( t[2] or 0))
		world[x][y].isStart = tonumber(t[3])~=0
		world[x][y].isTarget = tonumber(t[4])~=0
		x=x+1
	end
	game.levelData = data
end

--px,pz is the CENTER of the tile	
function drawTile (px,py, tile)	
	--****
	love.graphics.setColor(255, 255,255, 255)
	--love.graphics.draw(GFX.emptyTile, px,py, r2Rad(tile.rotation), 1,1,tileSize/2, tileSize/2)
	--always draw non-rotated background tiles
	love.graphics.draw(GFX.emptyTile, px,py, 0, scale,scale,tileSize/2, tileSize/2)
	if (tile.tileType) then
		if (tile.tileType == WALL) then			
			love.graphics.draw(GFX.wallTile, px,py, r2Rad(tile.rotation), scale,scale,tileSize/2, tileSize/2)
		end
		if (tile.tileType == PIPEV) then
			love.graphics.draw(GFX.pipeVTile, px,py, r2Rad(tile.rotation), scale,scale,tileSize/2, tileSize/2)
		end
		if (tile.tileType == PIPECORNER) then
			love.graphics.draw(GFX.pipeCornerTile, px,py, r2Rad(tile.rotation), scale,scale,tileSize/2, tileSize/2)
		end
		--if (tile.tileType == EMPTY) then
			--love.graphics.draw(GFX.emptyTile, px,py, r2Rad(tile.rotation), 1,1,tileSize/2, tileSize/2)
		--end
		if (tile.tileType == PIPECROSS) then
			love.graphics.draw(GFX.pipeCrossTile, px,py, r2Rad(tile.rotation), scale,scale,tileSize/2, tileSize/2)			
		end
		if (tile.tileType == PIPET) then
			love.graphics.draw(GFX.pipeTTile, px,py, r2Rad(tile.rotation), scale,scale,tileSize/2, tileSize/2)			
		end
		if (tile.tileType == PIPEONEWAY) then
			love.graphics.draw(GFX.pipeOneWay, px,py, r2Rad(tile.rotation), scale,scale,tileSize/2, tileSize/2)			
		end		
	end
	
	if (tile.isStart) then
		love.graphics.draw(GFX.start, px,py, r2Rad(tile.rotation), scale,scale,tileSize/2, tileSize/2)		
	end
	
	if (tile.isTarget) then
		if ((tile.pressure or 0) > 0) then
			love.graphics.draw(ANI.manometer.images[game.aniFrame], px,py, r2Rad(tile.rotation), scale,scale,tileSize/2, tileSize/2)
		else		
			love.graphics.draw(GFX.manometer, px,py, r2Rad(tile.rotation), scale,scale,tileSize/2, tileSize/2)
		end
		--love.graphics.setColor(255, 0,0, 255)
		--love.graphics.setColor(255, 255,255, 255)
	end
	
	--
	if (DEBUG) then-------debug
		love.graphics.setColor(255, 0,0, 255)
		love.graphics.circle ("fill",  px, py, 3,3)	--mark center of tile
		--print debug pressure		
		love.graphics.print("p:".. (tile.pressure or "nil"), px,py)
		love.graphics.print(tile.rotation or "nil", px,py-10)
		
		if (tile.allowFlow) then		
			love.graphics.setColor(0, 0,255, 255)
			love.graphics.circle ("line",  px, py, 3,3)
			drawAllowFlowDebug (px,py, tile.allowFlow)
		end
		
		if (tile.pressure and tile.pressure>0) then 
			love.graphics.setColor(0, 255,0, 255)
			love.graphics.circle ("line",  px, py, tileSize/3,20)
		end
		if (tile.isStart) then
			love.graphics.setColor(math.random(1,255), 255,255, 255)
			love.graphics.print("START", px-tileSize/2,py)
		end
	end------------------debug
	
end

function drawAllowFlowDebug (px,py, allowFlow)
	--local allowFlow = getRotatedAllowFlow (allowFlow,r)
	local d = tileSize/4
	love.graphics.setColor(0, 255,0, 255)
	if allowFlow[0] then love.graphics.circle ("fill",  px, py-d, 6,4) end
	if allowFlow[1] then love.graphics.circle ("fill",  px+d, py, 6,4) end
	if allowFlow[2] then love.graphics.circle ("fill",  px, py+d, 6,4) end
	if allowFlow[3] then love.graphics.circle ("fill",  px-d, py, 6,4) end
end

function initWorld (w,h)
	world = {}
	world.sizeX = w or 10
	world.sizeY = h or 8
	for x=1, world.sizeX,1 do
		world[x]={}
		for y=1 , world.sizeY,1 do
			world[x][y] = {}			
			world[x][y] = tileEmpty (0)--(math.random(0,3))
			--world[x][y] = tile (math.random (2,6),math.random(0,3))
			world[x][y].pressure = 0
		end
	end	
	--[[
	world.starts = {}
	world.starts[1] = {tx=1, ty=1}	
	world.starts[2] = {tx=5, ty=5}	
	for i=1,#world.starts, 1 do
		world[world.starts[i].tx][world.starts[i].ty].isStart = true
	end
	--]]
	updateWorld ()
end

function drawWorld ()
	love.graphics.setColor(255,255,255,255)
	for x=1, world.sizeX,1 do		
		for y=1 , world.sizeY,1 do
			--love.graphics.print(x.." " ..y, t2p (x,y))
			local px,py= t2p (x,y)		--drawTile (t2p (x,y),  world[x][y])	--das verkackt irgendwie?!
			drawTile (px,py, world[x][y])
			--Endstücke für offene Rohrenden
			if (world[x][y].allowFlow and world[x][y].openEnds) then				
				for i = 0,3,1 do
					if (world[x][y].allowFlow[i]) then
						if (world[x][y].openEnds[i]) then
							--flansch
							love.graphics.draw(GFX.flange, px,py, r2Rad(i), scale,scale,tileSize/2, tileSize/2)
						end
					end
				--love.graphics.setColor(0,255,255,255)
				--love.graphics.print (ii,px,py)
				end				
			----------------------------
			end
		end
	end
end


function makeRandomWorld ()
	local block = {}
	for x=1, world.sizeX,1 do
		block[x]={}
		for y=1 , world.sizeY,1 do
			block[x][y] = math.random (0,1)
		end
	end
	
	for y=1 , world.sizeY,1 do
		local s = ""
		for x=1, world.sizeX,1 do
			s = s .. block[x][y]
		end
		print (s)
	end	
end

function makeWorldFromBlock ()

end

-- http://lua-users.org/wiki/SplitJoin
-- explode(seperator, string)
function explode(d,p)
  local t, ll
  t={}
  ll=0
  if(#p == 1) then return {p} end
    while true do
      l=string.find(p,d,ll,true) -- find the next d in the string
      if l~=nil then -- if "not not" found then..
        table.insert(t, string.sub(p,ll,l-1)) -- Save it in our array.
        ll=l+1 -- save just after where we found it for searching next time.
      else
        table.insert(t, string.sub(p,ll)) -- Save what's left in our array.
        break -- Break at end, as it should be, according to the lua manual.
      end
    end
  return t
end