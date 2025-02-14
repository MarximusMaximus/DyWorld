
data:extend(
{
  {
    type = "assembling-machine",
    name = "greenhouse",
    icons = 
	{
	  {
		icon = DyDs_path_icon.."greenhouse.png",
	  },
	},
	icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "greenhouse"},
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    max_health = 250,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    fast_replaceable_group = "greenhouse",
    crafting_categories = {"farming"},
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = -0.25,
    },
    energy_usage = "750kW", 
    ingredient_count = 25,
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -2} }}
      },
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, 2} }}
      },
    },
    module_specification =
    {
      module_slots = 0
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    animation =
    {
      filename = DyDs_path_entity.."greenhouse.png",
      width = 113,
      height = 91,
      frame_count = 1,
      shift = {0.2, 0.15},
    },
    working_visualisations =
    {
      {
        light = {intensity = 1, size = 6},
        animation =
        {
          filename = DyDs_path_entity.."greenhouse-light.png",
          width = 113,
          height = 91,
          frame_count = 1,
          shift = {0.2, 0.15}
        }
      }
    },
  },
  {
    type = "item",
    name = "greenhouse",
    icon = DyDs_path_icon.."greenhouse.png",
    icon_size = 32, icon_mipmaps = 4,
    subgroup = DyDs.."greenhouse",
    order = "greenhouse",
    place_result = "greenhouse",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "greenhouse",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-pipe", amount = 1},
        {type = "item", name = "steel-plate", amount = 25},
      },
      result = "greenhouse",
	  enabled = false,
	  energy_required = 2,
    },
  },
})