

local Data_Table_Item_Group = {
	{
		Name = "fluids",
		Type = "main",
		Icon = "metals.png"
	},
	{
		Name = "fluids-0",
		Type = "sub",
		Main = "fluids"
	},
	{
		Name = "fluids-1",
		Type = "sub",
		Main = "fluids"
	},
	{
		Name = "fluids-2",
		Type = "sub",
		Main = "fluids"
	},
	{
		Name = "fluids-3",
		Type = "sub",
		Main = "fluids"
	},
	{
		Name = "fluids-4",
		Type = "sub",
		Main = "fluids"
	},
	{
		Name = "fluids-5",
		Type = "sub",
		Main = "fluids"
	},
	{
		Name = "fluids-6",
		Type = "sub",
		Main = "fluids"
	},
	{
		Name = "fluids-7",
		Type = "sub",
		Main = "fluids"
	},
	{
		Name = "fluids-8",
		Type = "sub",
		Main = "fluids"
	},
	{
		Name = "fluids-9",
		Type = "sub",
		Main = "fluids"
	},
}

function DyWorld_Item_Main_Group(NAME, ICON)
  local result =
  {
    type = "item-group",
    name = DyDs..NAME,
    icon = DyDs_path_item_group..ICON,
    icon_size = 64,
    order = "z-"..DyDs..NAME,
  }
  return result
end

function DyWorld_Item_Sub_Group(NAME, MAIN)
  local result =
  {
    type = "item-subgroup",
    name = DyDs..NAME,
    group = DyDs..MAIN,
    order = DyDs..NAME
  }
  return result
end

for k,v in pairs(Data_Table_Item_Group) do
	if v.Type == "main" then
		data:extend(
			{
				DyWorld_Item_Main_Group(v.Name, v.Icon)
			})
	elseif v.Type == "sub" then
		data:extend(
			{
				DyWorld_Item_Sub_Group(v.Name, v.Main)
			})
	end
end