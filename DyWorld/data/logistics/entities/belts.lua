require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

if settings.startup["DyWorld_Logistics"].value then

for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Belt then	
	local DyWorld_Prototype_Entity = DyWorld_CopyPrototype("transport-belt", "transport-belt", v.DyWorld.Name.."-transport-belt", true)
	DyWorld_Prototype_Entity.speed = Round(((v.DyWorld.Entity.Belt.Speed * Transport_Belt_Modifier) / 426.67), 5)
	DyWorld_Prototype_Entity.localised_name = {"looped-name.belt-1", {"looped-name."..v.DyWorld.Name}}
	if v.DyWorld.Entity.Belt.Next then
		DyWorld_Prototype_Entity.next_upgrade = v.DyWorld.Entity.Belt.Next.."-transport-belt"
	else
		DyWorld_Prototype_Entity.next_upgrade = nil
	end
	DyWorld_Prototype_Entity.max_health = 150 * Metal_Tiers[v.DyWorld.Name]
	DyWorld_Prototype_Entity.icon = nil
	DyWorld_Prototype_Entity.resistances = v.DyWorld.Resistances
	DyWorld_Prototype_Entity.hide_resistances = settings.startup["DyWorld_Hide_Resistances"].value
	DyWorld_Prototype_Entity.icons = {
	  {
		icon = dyworld_path_icon.."belt-icon-base.png",
	  },
	  {
		icon = dyworld_path_icon.."belt-icon-mask.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}
	DyWorld_Prototype_Entity.belt_animation_set = DyWorld_express_belt_animation_set(Material_Colors[v.DyWorld.Name])
	
	local DyWorld_Prototype_Item = DyWorld_CopyPrototype("item", "transport-belt", v.DyWorld.Name.."-transport-belt", true)
	DyWorld_Prototype_Item.localised_name = {"looped-name.belt-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Item.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype_Item.stack_size = 200
	DyWorld_Prototype_Item.icon = nil
	DyWorld_Prototype_Item.icons = {
	  {
		icon = dyworld_path_icon.."belt-icon-base.png",
	  },
	  {
		icon = dyworld_path_icon.."belt-icon-mask.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Recipe = DyWorld_CopyPrototype("recipe", "transport-belt", v.DyWorld.Name.."-transport-belt", true)
	DyWorld_Prototype_Recipe.localised_name = {"looped-name.belt-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Recipe.normal = {}
	DyWorld_Prototype_Recipe.expensive = {}
	DyWorld_Prototype_Recipe.normal.ingredients = {}
	DyWorld_Prototype_Recipe.normal.results = {{type = "item", name = v.DyWorld.Name.."-transport-belt", amount = 6}}
	DyWorld_Prototype_Recipe.expensive.ingredients = {}
	DyWorld_Prototype_Recipe.expensive.results = {{type = "item", name = v.DyWorld.Name.."-transport-belt", amount = 6}}
	DyWorld_Prototype_Recipe.ingredients = nil
	DyWorld_Prototype_Recipe.energy_required = 0
	DyWorld_Prototype_Recipe.normal.energy_required = (0.5 * v.DyWorld.Tier) * v.DyWorld.Tier
	DyWorld_Prototype_Recipe.expensive.energy_required = (0.5 * v.DyWorld.Tier) * v.DyWorld.Tier
	if v.DyWorld.Tier == 1 then 
		DyWorld_Prototype_Recipe.enabled = true
		DyWorld_Prototype_Recipe.normal.enabled = true
		DyWorld_Prototype_Recipe.expensive.enabled = true
	else
		DyWorld_Prototype_Recipe.enabled = false
		DyWorld_Prototype_Recipe.normal.enabled = false
		DyWorld_Prototype_Recipe.expensive.enabled = false
	end
	
	DyWorld_Prototype_Entity.icon_size = 32
	DyWorld_Prototype_Item.icon_size = 32

	data:extend({DyWorld_Prototype_Entity, DyWorld_Prototype_Item, DyWorld_Prototype_Recipe})
	
	if data.raw.technology["logistics-"..(v.DyWorld.Tier-1)] and v.DyWorld.Tier >= 3 then
		DyWorld_Add_To_Tech("logistics-"..(v.DyWorld.Tier-1), v.DyWorld.Name.."-transport-belt")
	elseif data.raw.technology["logistics"] and v.DyWorld.Tier == 2 then
		DyWorld_Add_To_Tech("logistics", v.DyWorld.Name.."-transport-belt")
	end
	if v.DyWorld.Entity.Belt.Ingredients then
		for q,a in pairs(v.DyWorld.Entity.Belt.Ingredients) do
			local Ingredient = {type = "item", name = q, amount = a}
			local Ingredient_2 = {type = "item", name = q, amount = Expensive_Check(a)}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-transport-belt"].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe[v.DyWorld.Name.."-transport-belt"].expensive.ingredients, Ingredient_2)
		end
	end
	if v.DyWorld.Entity.Belt.Previous then
		local Ingredient = {type = "item", name = v.DyWorld.Entity.Belt.Previous.."-transport-belt", amount = 6}
		table.insert(data.raw.recipe[v.DyWorld.Name.."-transport-belt"].normal.ingredients, Ingredient)
		table.insert(data.raw.recipe[v.DyWorld.Name.."-transport-belt"].expensive.ingredients, Ingredient)
	end
end
end

end