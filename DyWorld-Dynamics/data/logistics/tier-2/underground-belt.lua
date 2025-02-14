

local DyWorld_Prototype_1 = DyDs_CopyPrototype("underground-belt", "fast-underground-belt", "underground-belt-2", true)
local DyWorld_Prototype_2 = DyDs_CopyPrototype("item", "fast-underground-belt", "underground-belt-2", true)
DyWorld_Prototype_1.speed = (30 / 480)
DyWorld_Prototype_1.next_upgrade = "underground-belt-3"
DyWorld_Prototype_1.fast_replaceable_group = "transport-belt"
DyWorld_Prototype_1.belt_animation_set = DyWorld_basic_belt_animation_set(Tier_2)
DyWorld_Prototype_1.icon = nil
DyWorld_Prototype_1.icons = {
	  {
		icon = DyDs_path_icon.."under-icon-base.png",
	  },
	  {
		icon = DyDs_path_icon.."under-icon-mask.png",
		tint = Tier_2,
	  },
	}
DyWorld_Prototype_2.icon = nil
DyWorld_Prototype_2.icons = {
	  {
		icon = DyDs_path_icon.."under-icon-base.png",
	  },
	  {
		icon = DyDs_path_icon.."under-icon-mask.png",
		tint = Tier_2,
	  },
	}
DyWorld_Prototype_2.stack_size = 200
DyWorld_Prototype_1.max_distance = 10
DyWorld_Prototype_2.order = "2"
DyWorld_Prototype_2.subgroup = DyDs.."transport-belt-underground"

data:extend({
  DyWorld_Prototype_1,
  DyWorld_Prototype_2,
  {
    type = "recipe",
    name = "underground-belt-2",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "transport-belt-2", amount = 3},
        {type = "item", name = "underground-belt-1", amount = 2},
        {type = "item", name = "tin-plate", amount = 2},
        {type = "item", name = "rubber", amount = 1},
      },
      result = "underground-belt-2",
	  result_count = 2,
	  energy_required = 1,
	  enabled = false,
    },
  },
})