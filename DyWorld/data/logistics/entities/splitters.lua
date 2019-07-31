require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

--@todo change belt script to work with predefined data table
for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Belt then	
	local DyWorld_Prototype_Entity = DyWorld_CopyPrototype("splitter", "splitter", v.DyWorld.Name.."-splitter", true)
	DyWorld_Prototype_Entity.speed = Round((v.DyWorld.Entity.Belt_Speed / 426.67), 2)
	DyWorld_Prototype_Entity.localised_name = {"looped-name.belt-3", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Entity.next_upgrade = v.DyWorld.Entity.Belt_Next.."-splitter"
	DyWorld_Prototype_Entity.structure.north.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.north.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.east.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.east.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.south.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.south.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.west.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.west.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.max_health = 170 * Metal_Tiers[v.DyWorld.Name]
	DyWorld_Prototype_Entity.icon = nil
	DyWorld_Prototype_Entity.icons = {
	  {
		icon = "__base__/graphics/icons/splitter.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}
	DyWorld_Prototype_Entity.belt_animation_set = DyWorld_express_belt_animation_set(Material_Colors[v.DyWorld.Name])

	local DyWorld_Prototype_Item = DyWorld_CopyPrototype("item", "splitter", v.DyWorld.Name.."-splitter", true)
	DyWorld_Prototype_Item.localised_name = {"looped-name.belt-3", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Item.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype_Item.icon = nil
	DyWorld_Prototype_Item.icons = {
	  {
		icon = "__base__/graphics/icons/splitter.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Recipe = DyWorld_CopyPrototype("recipe", "splitter", v.DyWorld.Name.."-splitter", true)
	DyWorld_Prototype_Recipe.enabled = false
	DyWorld_Prototype_Recipe.localised_name = {"looped-name.belt-3", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Recipe.normal = {}
	DyWorld_Prototype_Recipe.expensive = {}
	DyWorld_Prototype_Recipe.normal.ingredients = {{type = "item", name = v.DyWorld.Name.."-transport-belt", amount = 2}}
	DyWorld_Prototype_Recipe.normal.result = v.DyWorld.Name.."-splitter"
	DyWorld_Prototype_Recipe.expensive.ingredients = {{type = "item", name = v.DyWorld.Name.."-transport-belt", amount = 10}}
	DyWorld_Prototype_Recipe.expensive.result = v.DyWorld.Name.."-splitter"
	DyWorld_Prototype_Recipe.ingredients = nil

	data:extend({DyWorld_Prototype_Entity, DyWorld_Prototype_Item, DyWorld_Prototype_Recipe})
	
	if v.DyWorld.Entity.Belt_Tech then
		DyWorld_Add_To_Tech(v.DyWorld.Entity.Belt_Tech, v.DyWorld.Name.."-splitter")
	end
	if v.DyWorld.Entity.Loader_Ingredients then
		for q,a in pairs(v.DyWorld.Entity.Loader_Ingredients) do
			local Ingredient = {type = "item", name = q, amount = a}
			local Ingredient_2 = {type = "item", name = q, amount = a * 5}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-splitter"].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe[v.DyWorld.Name.."-splitter"].expensive.ingredients, Ingredient_2)
		end
	end
end
end

data.raw["splitter"]["splitter"].next_upgrade = "iron-splitter"
data.raw["splitter"]["splitter"].speed = Round((5 / 426.67), 5)
data.raw["splitter"]["splitter"].localised_name = {"looped-name.belt-3", {"looped-name.stone"}}
data.raw["item"]["splitter"].localised_name = {"looped-name.belt-3", {"looped-name.stone"}}
data.raw["recipe"]["splitter"].localised_name = {"looped-name.belt-3", {"looped-name.stone"}}
data.raw.recipe["splitter"].enabled = true
data.raw.recipe["splitter"].ingredients = nil
data.raw.recipe["splitter"].normal = {}
data.raw.recipe["splitter"].expensive = {}
data.raw.recipe["splitter"].normal.ingredients = {
	{type = "item", name = "electronic-circuit", amount = 1},
	{type = "item", name = "transport-belt", amount = 2},
	{type = "item", name = "stone", amount = 3},
}
data.raw.recipe["splitter"].expensive.ingredients = {
	{type = "item", name = "electronic-circuit", amount = 5},
	{type = "item", name = "transport-belt", amount = 10},
	{type = "item", name = "stone", amount = 15},
}
data.raw.recipe["splitter"].normal.result = "splitter"
data.raw.recipe["splitter"].expensive.result = "splitter"