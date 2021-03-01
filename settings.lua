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

-- Leighzer's Morphite support
if mods.leighzermorphite then
  data:extend({
    {
      type = "bool-setting",
      name = "vtk-deep-core-mining-spawn-morphite-ore-patch",
      setting_type = "runtime-global",
      default_value = true,
      per_user = false,
      order = "he1"
    },
  })
end

-- Pyanodons Raw Ores support
if mods.pyrawores then
  data:extend({
    {
      type = "bool-setting",
      name = "vtk-deep-core-mining-spawn-ore-tin-patch",
      setting_type = "runtime-global",
      default_value = true,
      per_user = false,
      order = "hf1"
    },
    {
      type = "bool-setting",
      name = "vtk-deep-core-mining-spawn-ore-quartz-patch",
      setting_type = "runtime-global",
      default_value = true,
      per_user = false,
      order = "hf2"
    },
	{
      type = "bool-setting",
      name = "vtk-deep-core-mining-spawn-ore-aluminium-patch",
      setting_type = "runtime-global",
      default_value = true,
      per_user = false,
      order = "hf3"
    },
    {
      type = "bool-setting",
      name = "vtk-deep-core-mining-spawn-ore-chromium-patch",
      setting_type = "runtime-global",
      default_value = true,
      per_user = false,
      order = "hf4"
    },
    {
      type = "bool-setting",
      name = "vtk-deep-core-mining-spawn-ore-lead-patch",
      setting_type = "runtime-global",
      default_value = true,
      per_user = false,
      order = "hf5"
    },
    {
      type = "bool-setting",
      name = "vtk-deep-core-mining-spawn-ore-nickel-patch",
      setting_type = "runtime-global",
      default_value = true,
      per_user = false,
      order = "hf6"
    },
    {
      type = "bool-setting",
      name = "vtk-deep-core-mining-spawn-raw-coal-patch",
      setting_type = "runtime-global",
      default_value = true,
      per_user = false,
      order = "hf7"
    },
    {
      type = "bool-setting",
      name = "vtk-deep-core-mining-spawn-ore-titanium-patch",
      setting_type = "runtime-global",
      default_value = true,
      per_user = false,
      order = "hf8"
    },
    {
      type = "bool-setting",
      name = "vtk-deep-core-mining-spawn-ore-zinc-patch",
      setting_type = "runtime-global",
      default_value = true,
      per_user = false,
      order = "hf9"
    },
  })
end

-- Pyanodons Coal Processing support
if mods.pycoalprocessing then
  data:extend({
    {
      type = "bool-setting",
      name = "vtk-deep-core-mining-spawn-raw-borax-patch",
      setting_type = "runtime-global",
      default_value = true,
      per_user = false,
      order = "hf10"
    },
    {
      type = "bool-setting",
      name = "vtk-deep-core-mining-spawn-niobium-ore-patch",
      setting_type = "runtime-global",
      default_value = true,
      per_user = false,
      order = "hf11"
    },
  })
end

-- Brevvens's Titanium support
if mods.bztitanium then
  data:extend({
    {
      type = "bool-setting",
      name = "vtk-deep-core-mining-spawn-titanium-ore-patch",
      setting_type = "runtime-global",
      default_value = true,
      per_user = false,
      order = "hg1"
    },
  })
end

-- Brevvens's Lead support
if mods.bzlead and not mods.bobores and not mods.angelsrefining then
  data:extend({
    {
      type = "bool-setting",
      name = "vtk-deep-core-mining-spawn-lead-ore-patch",
      setting_type = "runtime-global",
      default_value = true,
      per_user = false,
      order = "he1"
    },
  })
end

-- Space Exploration support
if mods["space-exploration"] then
  data:extend({
    {
      type = "bool-setting",
      name = "vtk-deep-core-mining-spawn-se-beryllium-ore-patch",
      setting_type = "runtime-global",
      default_value = true,
      per_user = false,
      order = "hh1"
    },
    {
      type = "bool-setting",
      name = "vtk-deep-core-mining-spawn-se-cryonite-patch",
      setting_type = "runtime-global",
      default_value = true,
      per_user = false,
      order = "hh2"
    },
    {
      type = "bool-setting",
      name = "vtk-deep-core-mining-spawn-se-holmium-ore-patch",
      setting_type = "runtime-global",
      default_value = true,
      per_user = false,
      order = "hh3"
    },
    {
      type = "bool-setting",
      name = "vtk-deep-core-mining-spawn-se-iridium-ore-patch",
      setting_type = "runtime-global",
      default_value = true,
      per_user = false,
      order = "hh4"
    },
    {
      type = "bool-setting",
      name = "vtk-deep-core-mining-spawn-se-naquium-ore-patch",
      setting_type = "runtime-global",
      default_value = true,
      per_user = false,
      order = "hh5"
    },
    {
      type = "bool-setting",
      name = "vtk-deep-core-mining-spawn-se-vulcanite-patch",
      setting_type = "runtime-global",
      default_value = true,
      per_user = false,
      order = "hh6"
    },
    {
      type = "bool-setting",
      name = "vtk-deep-core-mining-spawn-se-vitamelange-patch",
      setting_type = "runtime-global",
      default_value = true,
      per_user = false,
      order = "hh7"
    },
  })
end
