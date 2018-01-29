data:extend({
	-- Global
	{
		type = "int-setting",
		name = "vtk-deep-core-mining-spawn-radius-from-start",
		setting_type = "runtime-global",
		minimum_value = 1,
		default_value = 1,
		maximum_value = 10000,
		order = "1"
  },
  {
		type = "int-setting",
		name = "vtk-deep-core-mining-patch-min-richness",
		setting_type = "runtime-global",
		minimum_value = 1,
		default_value = 10000,
		maximum_value = 3000000,
		order = "2"
	},
  {
		type = "int-setting",
		name = "vtk-deep-core-mining-patch-max-richness",
		setting_type = "runtime-global",
		minimum_value = 1,
		default_value = 10000,
		maximum_value = 3000000,
		order = "3"
	},
  {
		type = "int-setting",
		name = "vtk-deep-core-mining-crack-richness",
		setting_type = "runtime-global",
		minimum_value = 1,
		default_value = 10000,
		maximum_value = 3000000,
		order = "4"
	},
  {
    type = "bool-setting",
		name = "vtk-deep-core-mining-allow-beacon",
		setting_type = "runtime-global",
    default_value = true,
    per_user = false,
		order = "5"
	},
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-iron-ore-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "b"
  },
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-copper-ore-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "c"
  },
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-coal-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "d"
  },
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-stone-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "e"
  },
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-uranium-ore-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "f"
  },
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-cracks",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "g"
  },
})
  
if mods["angelsrefining"] then
data:extend({
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-angels-ore1-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "h"
  },
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-angels-ore2-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "i"
  },
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-angels-ore3-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "j"
  },
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-angels-ore4-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "k"
  },
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-angels-ore5-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "l"
  },
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-angels-ore6-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "m"
  },
})
end