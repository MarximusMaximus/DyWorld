data:extend({
  {
    type = "recipe",
    name = "cast-iron",
	category = "kiln-basic",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-ore-impure", amount = 2},
        {type = "item", name = "charcoal", amount = 1},
      },
      result = "iron-plate",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "iron-ore-impure", amount = 5},
        {type = "item", name = "charcoal", amount = 1},
      },
      result = "iron-plate",
	  result_count = 1,
	  energy_required = 15,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "cast-copper",
	category = "kiln-basic",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "copper-ore-impure", amount = 2},
      },
      result = "copper-plate",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "copper-ore-impure", amount = 5},
      },
      result = "copper-plate",
	  result_count = 1,
	  energy_required = 15,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "bronze-basic",
	category = "kiln-basic",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "copper-ore-impure", amount = 7},
        {type = "item", name = "tin-ore-impure", amount = 1},
      },
      result = "bronze-plate",
	  result_count = 5,
	  energy_required = 5,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "iron-ore-impure", amount = 21},
        {type = "item", name = "tin-ore-impure", amount = 3},
      },
      result = "bronze-plate",
	  result_count = 5,
	  energy_required = 15,
	  enabled = false,
    },
  },
})