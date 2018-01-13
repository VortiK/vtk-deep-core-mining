data:extend({
	-- Global
	{
		type = "int-setting",
		name = "vtk-deep-core-mining-spawn-radius-from-spawn",
		setting_type = "runtime-global",
		minimum_value = 1,
		default_value = 1,
		maximum_value = 10000,
		order = "1"
	},
  {
		type = "int-setting",
		name = "vtk-deep-core-mining-min-richness",
		setting_type = "runtime-global",
		minimum_value = 1,
		default_value = 60000,
		maximum_value = 3000000,
		order = "1"
	},
  {
		type = "int-setting",
		name = "vtk-deep-core-mining-max-richness",
		setting_type = "runtime-global",
		minimum_value = 1,
		default_value = 300000,
		maximum_value = 3000000,
		order = "1"
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
      order = "e"
  },
	-- Per user
})
