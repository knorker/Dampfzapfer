local comic = {}

function startComic (comicToStart)	
	if (not comicToStart) then return end
	comic = comicToStart
	comic.texti = 1
--	{background=background, text=text, texti=1}
	game.status = COMIC
	--table.insert (PS, newPS(px,py,90))
	 --comicPS = newPS (200,200,0,"bigsteam").ps--(comic.steamX,comic.steamY,0)
	 PS = {}
	 if (comic.steam) then
		for i=1,#comic.steam,1 do
			table.insert (PS, newPS(comic.steam[i].x, comic.steam[i].y, 0,"bigsteam"))
		end
	end
end

function drawComic ()
	love.graphics.setColor(0, 64,100, 255)
	love.graphics.rectangle("fill", 0, 0, 800, 600 )
	love.graphics.setColor(255, 255,255, 255)
	love.graphics.draw(comic.background, 0, 0)
	love.graphics.draw(GFX.textbox, 85, 480)
	love.graphics.setColor(0, 0,0, 255)
	
	local s = comic.text[comic.texti]
	local linei = 0
	for token in string.gmatch(s, "[^\n]+") do
		love.graphics.print(token, 100,520+(20*linei))
		linei=linei+1
	end
	
	if (PS) then
		for i,v in ipairs(PS) do
			love.graphics.draw(v.ps, 0, 0)
		end
	end
end

function comicLoop (dt)

end

function comicMousePressed (x,y,button)
	if (button~=1) then return end
	--comic finished
	if (comic.texti >= #comic.text) then 
		startPlaying (game.selectedLevelNr)
	end
	comic.texti = comic.texti+1
end

function nextTextLine ()
end