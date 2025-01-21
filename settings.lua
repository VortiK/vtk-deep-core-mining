data:extend({
	-- Global
  {
    type = "bool-setting",
		name = "vtk-deep-core-mining-allow-rotation",
		setting_type = "startup",
    default_value = false,
    per_user = false,
		order = "1"
  },
  {
    type = "int-setting",
		name = "vtk-deep-core-mining-moho-energy",
		setting_type = "startup",
		minimum_value = 1,
		default_value = 2,
		maximum_value = 10000,
		order = "2a"
  },
  {
    type = "int-setting",
		name = "vtk-deep-core-mining-moho-pollution",
		setting_type = "startup",
		minimum_value = 1,
		default_value = 200,
		maximum_value = 10000,
		order = "2aa"
  },
  {
    type = "int-setting",
		name = "vtk-deep-core-mining-deepcore-energy",
		setting_type = "startup",
		minimum_value = 1,
		default_value = 10,
		maximum_value = 10000,
		order = "2b"
  },
  {
    type = "int-setting",
		name = "vtk-deep-core-mining-deepcore-pollution",
		setting_type = "startup",
		minimum_value = 1,
		default_value = 500,
		maximum_value = 10000,
		order = "2ba"
  },
  {
    type = "int-setting",
		name = "vtk-deep-core-mining-deepcore-advanced-energy",
		setting_type = "startup",
		minimum_value = 1,
		default_value = 20,
		maximum_value = 10000,
		order = "2c"
  },
  {
    type = "int-setting",
		name = "vtk-deep-core-mining-deepcore-advanced-pollution",
		setting_type = "startup",
		minimum_value = 1,
		default_value = 1000,
		maximum_value = 10000,
		order = "2ca"
  },
  {
		type = "int-setting",
		name = "vtk-deep-core-mining-spawn-radius-from-start",
		setting_type = "runtime-global",
		minimum_value = 1,
		default_value = 1,
		maximum_value = 10000,
		order = "3"
  },
  {
		type = "int-setting",
		name = "vtk-deep-core-mining-patch-spawn-chance",
		setting_type = "runtime-global",
		minimum_value = 1,
		default_value = 10,
		maximum_value = 100,
		order = "4"
  },
  {
		type = "int-setting",
		name = "vtk-deep-core-mining-patch-spawn-distance",
		setting_type = "runtime-global",
		minimum_value = 1,
		default_value = 10,
		maximum_value = 100,
		order = "5"
	},
  {
		type = "int-setting",
		name = "vtk-deep-core-mining-patch-min-richness",
		setting_type = "runtime-global",
		minimum_value = 1,
		default_value = 10000,
		maximum_value = 3000000,
		order = "6"
	},
  {
		type = "int-setting",
		name = "vtk-deep-core-mining-patch-max-richness",
		setting_type = "runtime-global",
		minimum_value = 1,
		default_value = 10000,
		maximum_value = 3000000,
		order = "7"
	},
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-cracks",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "8"
  },
  {
		type = "int-setting",
		name = "vtk-deep-core-mining-crack-spawn-chance",
		setting_type = "runtime-global",
		minimum_value = 250,
		default_value = 500,
		maximum_value = 3000000,
		order = "9"
	},
  {
		type = "int-setting",
		name = "vtk-deep-core-mining-crack-richness",
		setting_type = "runtime-global",
		minimum_value = 1,
		default_value = 10000,
		maximum_value = 3000000,
		order = "10"
	},
  {
    type = "int-setting",
    name = "vtk-deep-core-mining-spawn-min-group",
    setting_type = "runtime-global",
		minimum_value = 1,
		default_value = 2,
		maximum_value = 20,
		order = "11"
  },
  {
    type = "int-setting",
    name = "vtk-deep-core-mining-spawn-max-group",
    setting_type = "runtime-global",
		minimum_value = 1,
		default_value = 5,
		maximum_value = 20,
		order = "12"
  },
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-iron-ore-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "ha1"
  },
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-copper-ore-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "ha2"
  },
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-coal-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "ha3"
  },
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-stone-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "ha4"
  },
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-uranium-ore-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "ha5"
  },
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-tungsten-ore-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "ha6"
  },
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-calcite-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "ha7"
  },
})
