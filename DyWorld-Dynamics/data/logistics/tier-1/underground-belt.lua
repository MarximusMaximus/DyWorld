

local DyWorld_Prototype_1 = DyDs_CopyPrototype("underground-belt", "underground-belt", "basic-underground-belt", true)
local DyWorld_Prototype_2 = DyDs_CopyPrototype("item", "underground-belt", "basic-underground-belt", true)
DyWorld_Prototype_1.speed = (15 / 480)
DyWorld_Prototype_1.next_upgrade = "underground-belt-2"
DyWorld_Prototype_1.belt_animation_set = DyWorld_basic_belt_animation_set(Tier_1)
DyWorld_Prototype_1.icon = nil
DyWorld_Prototype_1.icons = {
	  {
		icon = DyDs_path_icon.."under-icon-base.png",
	  },
	  {
		icon = DyDs_path_icon.."under-icon-mask.png",
		tint = Tier_1,
	  },
	}
DyWorld_Prototype_2.icon = nil
DyWorld_Prototype_2.icons = {
	  {
		icon = DyDs_path_icon.."under-icon-base.png",
	  },
	  {
		icon = DyDs_path_icon.."under-icon-mask.png",
		tint = Tier_1,
	  },
	}
DyWorld_Prototype_2.stack_size = 200
DyWorld_Prototype_2.order = "1"
DyWorld_Prototype_2.subgroup = DyDs.."transport-belt-underground"

data:extend({
  DyWorld_Prototype_1,
  DyWorld_Prototype_2,
  {
    type = "recipe",
    name = "basic-underground-belt",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "basic-transport-belt", amount = 3},
        {type = "item", name = "bronze-gear", amount = 1},
        {type = "item", name = "bronze-plate", amount = 2},
      },
      result = "basic-underground-belt",
	  result_count = 2,
	  energy_required = 1,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "basic-transport-belt", amount = 4},
        {type = "item", name = "bronze-gear", amount = 1},
        {type = "item", name = "bronze-plate", amount = 5},
      },
      result = "basic-underground-belt",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
})