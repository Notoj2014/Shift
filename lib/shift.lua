Shift = Object:extend()

local shiftTimerMax
local shiftTimer
local shifting
local shiftFlag
local shiftSpd


function Shift:new(ScreenManager)
	self.screen = ScreenManager
end


function Shift:activate()
    -- shift
	shiftMode = 0-- 0=xy, 1=xz
	shiftFlag = false
	shifting = false
	shiftTimerMax = 1.25
	shiftTimer = 0
    shiftSpd = 0
end


function Shift:update(dt)
	-- update shiftMode
	if shifting then
		local shiftAddSpd = 2*dt
		local shiftAddTime = 0.3
		-- start spd
		if shiftMode == 0 or shiftMode == 1 then
			shiftSpd = 0
		end
		-- add spd
		if shiftFlag then
			if shiftMode < shiftAddTime then
					shiftSpd = shiftSpd + shiftAddSpd
			elseif shiftMode > 1-shiftAddTime then
				shiftSpd = shiftSpd - shiftAddSpd
			end
		else
			if shiftMode < shiftAddTime then
				shiftSpd = shiftSpd - shiftAddSpd
			elseif shiftMode > 1-shiftAddTime then
				shiftSpd = shiftSpd + shiftAddSpd
			end
		end
		local _dt = math.abs(shiftSpd) / shiftTimerMax * dt
		-- change shiftMode
		if shiftMode < 1 and shiftFlag then
			local _border =  1 - shiftMode
			if _border < _dt then
				shiftMode = 1
				shifting = false -- close
			else
				shiftMode = shiftMode + _dt
			end
		end
		if shiftMode > 0 and not shiftFlag then
			if shiftMode < _dt then
				shiftMode = 0
				shifting = false -- close
			else
				shiftMode = shiftMode - _dt
			end
		end
    end
end


function Shift:keypressed(key)
    -- switch shiftMode
    if key == keys.Y and not shifting then
        shiftFlag = not shiftFlag
        shifting = true
    end
end