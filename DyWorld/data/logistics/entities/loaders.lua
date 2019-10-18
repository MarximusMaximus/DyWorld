require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Belt then	
	local DyWorld_Prototype_Entity = DyWorld_CopyPrototype("loader", "loader", v.DyWorld.Name.."-loader", true)
	DyWorld_Prototype_Entity.speed = Round(((v.DyWorld.Entity.Belt.Speed * Transport_Belt_Modifier) / 426.67), 5)
	DyWorld_Prototype_Entity.localised_name = {"looped-name.belt-4", {"looped-name."..v.DyWorld.Name}}
	if v.DyWorld.Entity.Belt.Next then
		DyWorld_Prototype_Entity.next_upgrade = v.DyWorld.Entity.Belt.Next.."-loader"
	else
		DyWorld_Prototype_Entity.next_upgrade = nil
	end
	
	DyWorld_Prototype_Entity.structure = {
        direction_in = {
            sheets = {
                {
                    hr_version = {
                        filename = dyworld_path_entity.."hr-loader-base.png",
                        height = 64,
                        priority = "extra-high",
                        width = 80,
                        scale = 0.5,
                        shift = { 0.125, 0 }
                    },
                    filename = dyworld_path_entity.."lr-loader-base.png",
                    height = 32,
                    priority = "extra-high",
                    width = 40,
                    scale = 1,
                    shift = { 0.125, 0 }
                },
                {
                    hr_version = {
                        filename = dyworld_path_entity.."hr-loader-mask.png",
                        height = 64,
                        priority = "extra-high",
                        width = 80,
                        scale = 0.5,
                        tint = Material_Colors[v.DyWorld.Name],
                        shift = { 0.125, 0 }
                    },
                    filename = dyworld_path_entity.."lr-loader-mask.png",
                    height = 32,
                    priority = "extra-high",
                    width = 40,
                    scale = 1,
                    tint = Material_Colors[v.DyWorld.Name],
                    shift = { 0.125, 0 }
                },
            },
        },
        direction_out = {
            sheets = {
                {
                    hr_version = {
                        filename = dyworld_path_entity.."hr-loader-base.png",
                        height = 64,
                        priority = "extra-high",
                        width = 80,
                        scale = 0.5,
                        shift = { 0.125, 0 },
                    },
                    filename = dyworld_path_entity.."lr-loader-base.png",
                    height = 32,
                    priority = "extra-high",
                    width = 40,
                    scale = 1,
                    shift = { 0.125, 0 },
                },
                {
                    hr_version = {
                        filename = dyworld_path_entity.."hr-loader-mask.png",
                        height = 64,
                        priority = "extra-high",
                        width = 80,
                        scale = 0.5,
                        tint = Material_Colors[v.DyWorld.Name],
                        shift = { 0.125, 0 },
                        y = 64
                    },
                    filename = dyworld_path_entity.."lr-loader-mask.png",
                    height = 32,
                    priority = "extra-high",
                    width = 40,
                    scale = 1,
                    tint = Material_Colors[v.DyWorld.Name],
                    shift = { 0.125, 0 },
                    y = 32
                },
            },
        }
    }
	
	DyWorld_Prototype_Entity.max_health = 170 * Metal_Tiers[v.DyWorld.Name]
	DyWorld_Prototype_Entity.collision_box = {{-0.4, -0.4}, {0.4, 0.4}}
	DyWorld_Prototype_Entity.selection_box = {{-0.5, -0.5}, {0.5, 0.5}}
	DyWorld_Prototype_Entity.fast_replaceable_group = "transport-belt"
	DyWorld_Prototype_Entity.icon = nil
	DyWorld_Prototype_Entity.filter_count = math.ceil(v.DyWorld.Tier / 2)
	DyWorld_Prototype_Entity.belt_length = 0.5
	DyWorld_Prototype_Entity.container_distance = 1.0
	DyWorld_Prototype_Entity.belt_distance = 0
	--DyWorld_Prototype_Entity.collision_mask = {"item-layer", "object-layer", "player-layer", "water-tile"}
	DyWorld_Prototype_Entity.icons = {
	  {
		icon = dyworld_path_icon.."loader-icon-base.png",
	  },
	  {
		icon = dyworld_path_icon.."loader-icon-mask.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}
	DyWorld_Prototype_Entity.belt_animation_set = DyWorld_express_belt_animation_set(Material_Colors[v.DyWorld.Name])

	local DyWorld_Prototype_Item = DyWorld_CopyPrototype("item", "loader", v.DyWorld.Name.."-loader", true)
	DyWorld_Prototype_Item.localised_name = {"looped-name.belt-4", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Item.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype_Item.stack_size = 200
	DyWorld_Prototype_Item.flags = {}
	DyWorld_Prototype_Item.icon = nil
	DyWorld_Prototype_Item.icons = {
	  {
		icon = dyworld_path_icon.."loader-icon-base.png",
	  },
	  {
		icon = dyworld_path_icon.."loader-icon-mask.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Recipe = DyWorld_CopyPrototype("recipe", "loader", v.DyWorld.Name.."-loader", true)
	DyWorld_Prototype_Recipe.normal = {}
	DyWorld_Prototype_Recipe.expensive = {}
	DyWorld_Prototype_Recipe.normal.ingredients = {{type = "item", name = v.DyWorld.Name.."-transport-belt", amount = 2}}
	DyWorld_Prototype_Recipe.normal.result = v.DyWorld.Name.."-loader"
	DyWorld_Prototype_Recipe.expensive.ingredients = {{type = "item", name = v.DyWorld.Name.."-transport-belt", amount = Expensive_Check(2)}}
	DyWorld_Prototype_Recipe.expensive.result = v.DyWorld.Name.."-loader"
	DyWorld_Prototype_Recipe.ingredients = nil
	DyWorld_Prototype_Recipe.localised_name = {"looped-name.belt-4", {"looped-name."..v.DyWorld.Name}}
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

	data:extend({DyWorld_Prototype_Entity, DyWorld_Prototype_Item, DyWorld_Prototype_Recipe})
	
	if data.raw.technology["logistics-"..(v.DyWorld.Tier-1)] and v.DyWorld.Tier >= 3 then
		DyWorld_Add_To_Tech("logistics-"..(v.DyWorld.Tier-1), v.DyWorld.Name.."-loader")
	elseif data.raw.technology["logistics"] and v.DyWorld.Tier == 2 then
		DyWorld_Add_To_Tech("logistics", v.DyWorld.Name.."-loader")
	end
	if v.DyWorld.Entity.Belt.Loader_Ingredients then
		for q,a in pairs(v.DyWorld.Entity.Belt.Loader_Ingredients) do
			local Ingredient = {type = "item", name = q, amount = a}
			local Ingredient_2 = {type = "item", name = q, amount = Expensive_Check(a)}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-loader"].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe[v.DyWorld.Name.."-loader"].expensive.ingredients, Ingredient_2)
		end
	end
	if v.DyWorld.Entity.Belt.Previous then
		local Ingredient = {type = "item", name = v.DyWorld.Entity.Belt.Previous.."-loader", amount = 1}
		table.insert(data.raw.recipe[v.DyWorld.Name.."-loader"].normal.ingredients, Ingredient)
		table.insert(data.raw.recipe[v.DyWorld.Name.."-loader"].expensive.ingredients, Ingredient)
	end
end
end