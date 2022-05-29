local TLfres = require "tlfres"
----------------------------------------------------------  BUTTONS ----------------------------------------------
function point_in_rect (x1, y1, x2, y2, px, py)
	if (px > x1 and px < x2 and py > y1 and py < y2) then return true end
	return false
end

function drawButtons (b)
	--font:setLineHeight (1.0)
	--love.graphics.setFont(small_font)
	local mousex, mousey = TLfres.getMousePosition(800, 600) --love.mouse.getPosition()
	for i = 1, #b, 1 do
		--love.graphics.print(b[i].text, b[i].x+10, b[i].y+b[i].h-5) --0.6.2		
		if (b[i].bitmap) then
			love.graphics.setColor(255, 255, 2, 255)
			love.graphics.draw(b[i].bitmap, b[i].x,b[i].y)--, r2Rad(tile.rotation), scale,scale,tileSize/2, tileSize/2)
		end
		
		--mouse-over hovering button
		if (point_in_rect (b[i].x, b[i].y, b[i].x+b[i].w, b[i].y+b[i].h,  mousex, mousey) or i == active_button) then			
			if (b[i].overBitmap) then
				love.graphics.setColor(255, 255, 255, 255)
				love.graphics.draw(b[i].overBitmap, b[i].x,b[i].y)--, r2Rad(tile.rotation), scale,scale,tileSize/2, tileSize/2)
			else				
				love.graphics.setColor(100, 255, 100, 150)
				love.graphics.rectangle ("fill", b[i].x, b[i].y, b[i].w, b[i].h)
				love.graphics.setColor(255, 255, 0, 255)
				love.graphics.rectangle ("fill", b[i].x, b[i].y, 10, b[i].h)		
				love.graphics.rectangle ("line", b[i].x+2, b[i].y+2, b[i].w-2, b[i].h-2)
			end
		else --unactive button
			--love.graphics.setColor(0, 255, 0, 255)
			--love.graphics.rectangle ("line", b[i].x, b[i].y, b[i].w, b[i].h)
		end
		
		if (b[i].highlight) then 
			if (b[i].highlightBitmap) then
				love.graphics.draw(b[i].highlightBitmap, b[i].x,b[i].y)
			else
				love.graphics.setColor(255, 0, 0, 255)
				love.graphics.rectangle ("line", b[i].x, b[i].y, b[i].w, b[i].h)
			end
		end		
		
		if (b[i].isChecked and b[i].checkedBitmap) then
			love.graphics.draw(b[i].checkedBitmap, b[i].x,b[i].y)
		end
		--text
		love.graphics.setColor(0, 255, 0, 255)
		love.graphics.print(b[i].text, b[i].x+10, b[i].y) --0.7.2
	end
end

--checkedBitmap: wird zusätzlich zu bitmap immer nochmal drüber gemalt. im moment nur als hack für die haken beim lvl select0r
function addButton (buttonlist, x,y, w, h, text, name, bitmap, overBitmap, highlightBitmap, checkedBitmap)
	if (h == nil) then h = 20 end
	--h = 25
	local new_button = {}
	new_button.x=x new_button.y=y new_button.w=w new_button.h=h new_button.text=text new_button.name=name
	new_button.bitmap=bitmap
	new_button.overBitmap = overBitmap	--mouse hover
	new_button.highlightBitmap=highlightBitmap
	new_button.checkedBitmap = checkedBitmap
	table.insert (buttonlist, new_button)
end

function clickedButton (b, mousex, mousey)
	--local mousex, mousey = love.mouse.getPosition()
	local click = love.mouse.isDown(1)
	if (mouse_was_down==false and click == false) then return "NOBUTTONCLICKED" end
	for i = 1, #b, 1 do	
		--if (mouse_was_down and click == false and point_in_rect (b[i].x, b[i].y, b[i].x+b[i].w, b[i].y+b[i].h,  mousex, mousey)) then mouse_was_down=false return b[i].name, i end
		--if (mouse_was_down == false and click == true and point_in_rect (b[i].x, b[i].y, b[i].x+b[i].w, b[i].y+b[i].h,  mousex, mousey)) then mouse_was_down = true end
		if (point_in_rect (b[i].x, b[i].y, b[i].x+b[i].w, b[i].y+b[i].h,  mousex, mousey)) then return b[i].name, i end
	end
	return "NOBUTTONCLICKED"
end

--highlights one button, de-highlights all other buttons (like radio buttons)
function radioHighLight (b, hi)
	for i = 1, #b, 1 do
		if (b[i]) then b[i].highlight = false end
	end
	if (b[hi]) then b[hi].highlight = true end
end