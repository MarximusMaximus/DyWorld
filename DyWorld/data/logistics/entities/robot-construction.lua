require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

--TODO Add more Robots
--BODY @ZukiiG
for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Robot then	
	local DyWorld_Prototype_Entity = DyWorld_CopyPrototype("construction-robot", "construction-robot", v.DyWorld.Name.."-construction-robot", true)
	DyWorld_Prototype_Entity.localised_name = {"looped-name.construction-robot-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Entity.max_health = 100 * v.DyWorld.Tier
	DyWorld_Prototype_Entity.idle.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.idle.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.in_motion.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.in_motion.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.working.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.working.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.max_payload_size = v.DyWorld.Tier
	DyWorld_Prototype_Entity.speed = v.DyWorld.Entity.Robot_Speed + 0.01
	DyWorld_Prototype_Entity.max_energy = v.DyWorld.Entity.Robot_Energy_Max
	DyWorld_Prototype_Entity.energy_per_tick = v.DyWorld.Entity.Robot_Energy_Tick
	DyWorld_Prototype_Entity.energy_per_move = v.DyWorld.Entity.Robot_Energy_Move
	DyWorld_Prototype_Entity.icon = nil
	DyWorld_Prototype_Entity.icons = {
	  {
		icon = "__base__/graphics/icons/construction-robot.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Item = DyWorld_CopyPrototype("item", "construction-robot", v.DyWorld.Name.."-construction-robot", true)
	DyWorld_Prototype_Item.localised_name = {"looped-name.construction-robot-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Item.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype_Item.icon = nil
	DyWorld_Prototype_Item.icons = {
	  {
		icon = "__base__/graphics/icons/construction-robot.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Recipe = DyWorld_CopyPrototype("recipe", "construction-robot", v.DyWorld.Name.."-construction-robot", true)
	DyWorld_Prototype_Recipe.normal = {}
	DyWorld_Prototype_Recipe.expensive = {}
	DyWorld_Prototype_Recipe.normal.ingredients = {}
	DyWorld_Prototype_Recipe.normal.result = v.DyWorld.Name.."-construction-robot"
	DyWorld_Prototype_Recipe.expensive.ingredients = {}
	DyWorld_Prototype_Recipe.expensive.result = v.DyWorld.Name.."-construction-robot"
	DyWorld_Prototype_Recipe.ingredients = nil
	DyWorld_Prototype_Recipe.localised_name = {"looped-name.construction-robot-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Recipe.energy_required = 0
	DyWorld_Prototype_Recipe.normal.energy_required = (2 * v.DyWorld.Tier) * v.DyWorld.Tier
	DyWorld_Prototype_Recipe.expensive.energy_required = (2 * v.DyWorld.Tier) * v.DyWorld.Tier
	DyWorld_Prototype_Recipe.enabled = false
	DyWorld_Prototype_Recipe.normal.enabled = false
	DyWorld_Prototype_Recipe.expensive.enabled = false

	data:extend({DyWorld_Prototype_Entity, DyWorld_Prototype_Item, DyWorld_Prototype_Recipe})
	
	if data.raw.technology["construction-robotics"] and v.DyWorld.Tier == 1 then 
		DyWorld_Add_To_Tech("construction-robotics", v.DyWorld.Name.."-construction-robot")
	elseif data.raw.technology["construction-robotics-"..v.DyWorld.Tier] and v.DyWorld.Tier >= 2 then
		DyWorld_Add_To_Tech("construction-robotics-"..v.DyWorld.Tier, v.DyWorld.Name.."-construction-robot")
	end
	
	if v.DyWorld.Entity.Construction_Robot_Ingredients then
		for q,a in pairs(v.DyWorld.Entity.Construction_Robot_Ingredients) do
			local Ingredient = {type = "item", name = q, amount = a}
			local Ingredient_2 = {type = "item", name = q, amount = a * 5}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-construction-robot"].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe[v.DyWorld.Name.."-construction-robot"].expensive.ingredients, Ingredient_2)
		end
	end
	if v.DyWorld.Entity.Robot_Previous then
		local Ingredient = {type = "item", name = v.DyWorld.Entity.Robot_Previous.."-construction-robot", amount = 1}
		table.insert(data.raw.recipe[v.DyWorld.Name.."-construction-robot"].normal.ingredients, Ingredient)
	end
end
end