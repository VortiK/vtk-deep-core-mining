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
    default_value = false,
    per_user = false,
		order = "5"
	},
  {
    type = "bool-setting",
		name = "vtk-deep-core-mining-allow-rotation",
		setting_type = "startup",
    default_value = false,
    per_user = false,
		order = "6"
	},
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-cracks",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "g"
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
})

if mods["SimpleSilicon"] then
  data:extend({
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-SiSi-quartz-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "ha5"
  },
})
end

if mods["angelsrefining"] then
  data:extend({
    {
      type = "bool-setting",
      name = "vtk-deep-core-mining-spawn-angels-ore1-patch",
      setting_type = "runtime-global",
      default_value = true,
      per_user = false,
      order = "hb1"
    },
    {
      type = "bool-setting",
      name = "vtk-deep-core-mining-spawn-angels-ore2-patch",
      setting_type = "runtime-global",
      default_value = true,
      per_user = false,
      order = "hb2"
    },
    {
      type = "bool-setting",
      name = "vtk-deep-core-mining-spawn-angels-ore3-patch",
      setting_type = "runtime-global",
      default_value = true,
      per_user = false,
      order = "hb3"
    },
    {
      type = "bool-setting",
      name = "vtk-deep-core-mining-spawn-angels-ore4-patch",
      setting_type = "runtime-global",
      default_value = true,
      per_user = false,
      order = "hb4"
    },
  })

  if mods["bobplates"] then
    data:extend({
      {
        type = "bool-setting",
        name = "vtk-deep-core-mining-spawn-angels-ore5-patch",
        setting_type = "runtime-global",
        default_value = true,
        per_user = false,
        order = "hb5"
      },
      {
        type = "bool-setting",
        name = "vtk-deep-core-mining-spawn-angels-ore6-patch",
        setting_type = "runtime-global",
        default_value = true,
        per_user = false,
        order = "hb6"
      },
    })
    
    if mods["Clowns-Extended-Minerals"] then
      data:extend({
        {
          type = "bool-setting",
          name = "vtk-deep-core-mining-spawn-clowns-ore1-patch",
          setting_type = "runtime-global",
          default_value = true,
          per_user = false,
          order = "hbc1"
        },
        {
          type = "bool-setting",
          name = "vtk-deep-core-mining-spawn-clowns-ore2-patch",
          setting_type = "runtime-global",
          default_value = true,
          per_user = false,
          order = "hbc2"
        },
        {
          type = "bool-setting",
          name = "vtk-deep-core-mining-spawn-clowns-ore3-patch",
          setting_type = "runtime-global",
          default_value = true,
          per_user = false,
          order = "hbc3"
        },
        {
          type = "bool-setting",
          name = "vtk-deep-core-mining-spawn-clowns-ore4-patch",
          setting_type = "runtime-global",
          default_value = true,
          per_user = false,
          order = "hbc4"
        },
        {
          type = "bool-setting",
          name = "vtk-deep-core-mining-spawn-clowns-ore5-patch",
          setting_type = "runtime-global",
          default_value = true,
          per_user = false,
          order = "hbc5"
        },
        {
          type = "bool-setting",
          name = "vtk-deep-core-mining-spawn-clowns-ore6-patch",
          setting_type = "runtime-global",
          default_value = true,
          per_user = false,
          order = "hbc6"
        },
        {
          type = "bool-setting",
          name = "vtk-deep-core-mining-spawn-clowns-ore7-patch",
          setting_type = "runtime-global",
          default_value = true,
          per_user = false,
          order = "hbc7"
        },
      })
    end
  end
end

if mods["bobores"] and not mods["angelsrefining"] then
  data:extend({
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-tin-ore-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "hc1"
  },
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-lead-ore-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "hc2"
  },
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-quartz-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "hc3"
  },
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-silver-ore-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "hc4"
  },
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-zinc-ore-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "hc5"
  },
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-gold-ore-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "hc6"
  },
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-bauxite-ore-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "hc7"
  },
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-rutile-ore-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "hc8"
  },
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-tungsten-ore-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "hc9"
  },
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-thorium-ore-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "hd1"
  },
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-nickel-ore-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "hd2"
  },
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-cobalt-ore-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "hd3"
  },
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-sulfur-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "hd4"
  },
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-gem-ore-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "hd5"
  }
})
end

if mods["Krastorio2"] then
  data:extend({
  {
    type = "bool-setting",
    name = "vtk-deep-core-mining-spawn-raw-rare-metals-patch",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
    order = "he1"
  },
})
end
