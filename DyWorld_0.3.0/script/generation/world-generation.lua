module("generation", package.seeall)
require "script/generation/noise"

Ruins = {"small-scorchmark", "stone-rock", "red-desert-rock-big-01"}
Hell = {"dyworld-hell-fire-flame"}

local keysetRuins = {}
local keysetHell = {}
for k in pairs(Ruins) do
    table.insert(keysetRuins, k)
end
for k in pairs(Hell) do
    table.insert(keysetHell, k)
end

function Ruins_Spawner(event)
	for i = 1, (math.random(5,15)) do
		BuildEntity = Ruins[keysetRuins[math.random(#keysetRuins)]]
		PosX = event.area.left_top.x+math.random(-63,63)
		PosY = event.area.left_top.y+math.random(-63,63)
		if game.surfaces[1].can_place_entity{name=(BuildEntity), position={PosX,PosY}} then
			game.surfaces[1].create_entity{name=(BuildEntity), position={PosX,PosY}, force=game.forces.player}
		end
	end
	--debug("Generator: Created "..BuildEntity.." at "..PosX..", "..PosY)
end

function Hell_Spawner(event)
	noise.Perlin_Load()
    for i=1,(math.random(20,100)) do
		PosX = event.area.left_top.x+math.random((-32*1.5),(31*1.5))
		PosY = event.area.left_top.y+math.random((-32*1.5),(31*1.5))
        for j=1,(math.random(20,100)) do
			BuildEntity = Hell[keysetHell[math.random(#keysetHell)]]
			PosX2 = PosX+noise.Perlin_Noise(i/10, j/10, 0.3)
			PosY2 = PosY+noise.Perlin_Noise(i/10, j/10, 0.3)
			if math.random(25) == 5 then
				if game.surfaces[1].can_place_entity{name=(BuildEntity), position={PosX2,PosY2}} then 
					game.surfaces[1].create_entity{name=(BuildEntity), position={PosX2,PosY2}, force=game.forces.neutral}
				end
			end
		end
	end
	--debug("Generator: Created "..BuildEntity.." at "..PosX..", "..PosY)
end

--function Hell_Spawner(event) --OLD ONE!
	--for i = 1, (math.random(20,100)) do
		--BuildEntity = Hell[keysetHell[math.random(#keysetHell)]]
		--PosX = event.area.left_top.x+math.random(-319,319)
		--PosY = event.area.left_top.y+math.random(-319,319)
		--if game.surfaces[1].can_place_entity{name=(BuildEntity), position={PosX,PosY}} then 
			--game.surfaces[1].create_entity{name=(BuildEntity), position={PosX,PosY}, force=game.forces.neutral}
		--end
	--end
	--debug("Generator: Created "..BuildEntity.." at "..PosX..", "..PosY)
--end

--[[function love.draw(  )
    for i=1,500 do
        for j=1,500 do
            local x = Perlin_Noise(i/10, j/10, 0.3)
            local y = Perlin_Noise(i/10, j/10, 0.3)
            love.graphics.setColor(math.floor(x*255), math.floor(x*255), math.floor(x*255))
            love.graphics.rectangle("fill", 5*(i-1), 5*(j-1), 5, 5)
        end
    end
end]]--

function Ship_Spawner(event)
	PosX = event.area.left_top.x
	PosY = event.area.left_top.y
	BuildEntity1 = "big-ship-wreck-1"
	BuildEntity2 = "big-ship-wreck-2"
	BuildEntity3 = "big-ship-wreck-3"
	Ship_1_Pos = game.surfaces[1].find_non_colliding_position(BuildEntity1, {PosX,PosY}, 250, 250)
	Ship_2_Pos = game.surfaces[1].find_non_colliding_position(BuildEntity2, {PosX,PosY}, 250, 250)
	Ship_3_Pos = game.surfaces[1].find_non_colliding_position(BuildEntity3, {PosX,PosY}, 250, 250)
	if not global.dyworld.Generation_Ship_1 then 
		Ship_1_Created = game.surfaces[1].create_entity{name=(BuildEntity1), position=Ship_1_Pos, force=game.forces.player}
		Ship_1_Created.insert{name="stone", count=math.random(100)}
		if math.random(1,10) == 5 then
			Ship_1_Created.insert{name="iron-ore", count=math.random(100)}
		end
		if math.random(1,10) == 5 then
			Ship_1_Created.insert{name="repair-pack", count=math.random(50)}
		end
		global.dyworld.Generation_Ship_1 = true
	end
	if not global.dyworld.Generation_Ship_2 then 
		Ship_2_Created = game.surfaces[1].create_entity{name=(BuildEntity2), position=Ship_2_Pos, force=game.forces.player}
		Ship_2_Created.insert{name="coal", count=math.random(100)}
		if math.random(1,10) == 5 then
			Ship_2_Created.insert{name="copper-plate", count=math.random(50)}
		end
		if math.random(1,10) == 5 then
			Ship_2_Created.insert{name="raw-wood", count=math.random(100)}
		end
		global.dyworld.Generation_Ship_2 = true
	end
	if not global.dyworld.Generation_Ship_3 then 
		Ship_3_Created = game.surfaces[1].create_entity{name=(BuildEntity3), position=Ship_3_Pos, force=game.forces.player}
		if math.random(1,10) == 5 then
			Ship_3_Created.insert{name="iron-plate", count=math.random(50)}
		end
		Ship_3_Created.insert{name="wood", count=math.random(25)}
		global.dyworld.Generation_Ship_3 = true
	end
end