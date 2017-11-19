require "data/prefix"

local Data_Table = {
	{
		Name = "water-clean",
		Icon = dyworld_path_fluid.."clean-water.png",
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Barrel = true,
	},
	{
		Name = "sewage",
		Icon = dyworld_path_fluid.."sewage.png",
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Barrel = true,
	},
	{
		Name = "sludge",
		Icon = dyworld_path_fluid.."sludge.png",
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Barrel = true,
	},
	{
		Name = "acid",
		Icon = dyworld_path_fluid.."acid.png",
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=10, g=255, b=10},
		Color_Flow = {r=10, g=255, b=10},
		Barrel = true,
	},
	{
		Name = "methane",
		Icon = dyworld_path_fluid.."methane.png",
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Barrel = true,
	},
	{
		Name = "oxygen",
		Icon = dyworld_path_fluid.."oxygen.png",
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Barrel = true,
	},
	{
		Name = "hydrogen",
		Icon = dyworld_path_fluid.."hydrogen.png",
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Barrel = true,
	},
	{
		Name = "blood",
		Icon = dyworld_path_fluid.."blood.png",
		Def_Temp = 37,
		Max_Temp = 100,
		Color_Base = {r=255, g=10, b=10},
		Color_Flow = {r=255, g=10, b=10},
		Barrel = true,
	},
	{
		Name = "clean-oil",
		Icon = dyworld_path_fluid.."clean-oil.png",
		Def_Temp = 25,
		Max_Temp = 100,
		Color_Base = {r=0, g=0, b=0},
		Color_Flow = {r=0.5, g=0.5, b=0.5},
		Barrel = true,
	},
	{
		Name = "science-fluid-1",
		Icon = dyworld_path_fluid.."blood.png",
		Def_Temp = 50,
		Max_Temp = 50,
		Color_Base = {r=255, g=10, b=10},
		Color_Flow = {r=255, g=10, b=10},
		Barrel = true,
	},
	{
		Name = "science-fluid-2",
		Icon = dyworld_path_fluid.."blood.png",
		Def_Temp = 50,
		Max_Temp = 50,
		Color_Base = {r=255, g=10, b=10},
		Color_Flow = {r=255, g=10, b=10},
		Barrel = true,
	},
	{
		Name = "science-fluid-3",
		Icon = dyworld_path_fluid.."blood.png",
		Def_Temp = 50,
		Max_Temp = 50,
		Color_Base = {r=255, g=10, b=10},
		Color_Flow = {r=255, g=10, b=10},
		Barrel = true,
	},
	{
		Name = "science-fluid-4",
		Icon = dyworld_path_fluid.."blood.png",
		Def_Temp = 50,
		Max_Temp = 50,
		Color_Base = {r=255, g=10, b=10},
		Color_Flow = {r=255, g=10, b=10},
		Barrel = true,
	},
	{
		Name = "science-fluid-5",
		Icon = dyworld_path_fluid.."blood.png",
		Def_Temp = 50,
		Max_Temp = 50,
		Color_Base = {r=255, g=10, b=10},
		Color_Flow = {r=255, g=10, b=10},
		Barrel = true,
	},
	{
		Name = "science-fluid-6",
		Icon = dyworld_path_fluid.."blood.png",
		Def_Temp = 50,
		Max_Temp = 50,
		Color_Base = {r=255, g=10, b=10},
		Color_Flow = {r=255, g=10, b=10},
		Barrel = true,
	},
	{
		Name = "science-fluid-7",
		Icon = dyworld_path_fluid.."blood.png",
		Def_Temp = 50,
		Max_Temp = 50,
		Color_Base = {r=255, g=10, b=10},
		Color_Flow = {r=255, g=10, b=10},
		Barrel = true,
	},
}

for k,v in pairs(Data_Table) do
data:extend(
	{
		DyWorld_Fluid(v),
	})
end