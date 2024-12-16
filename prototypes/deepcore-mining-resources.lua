local item_tints = require("__base__.prototypes.item-tints")


--
-- Deep Core resource category
--
local deep_core_resource_patch_category = {
  type = "resource-category",
  name = "vtk-deepcore-mining-ore-patch"
}

local deep_core_resource_ore_category = {
  type = "resource-category",
  name = "vtk-deepcore-mining-crack"
}
-- not used for now, generates way too much cracks and autoplace is dark magic
-- generated in control.lua on tile explore instead with a low chance by empirical design
--[[
local deep_core_noise_layer = {
  type = "noise-layer",
  name = "vtk-deepcore-mining-crack"
}

local deep_core_control = {
  type = "autoplace-control",
  name = "vtk-deepcore-mining-crack",
  richness = true,
  order = "b-b-z[vtk-deep-core-mining]-a[ore]",
  category = "resource"
}
--]]

-- Deep Core Chunks Variations definitino
local function deepcorechunksvariations(oretint)
  return
  {
    {
      layers = {
        {
          filename = "__vtk-deep-core-mining__/graphics/icons/ore-chunk-1.png",
          height = 64,
          width = 64,
          scale = 0.5,
        },
        {
          filename = "__vtk-deep-core-mining__/graphics/icons/ore-chunk-1-layer.png",
          height = 64,
          width = 64,
          scale = 0.5,
          tint = oretint
        }
      }
    },
    {
      layers = {
        {
          filename = "__vtk-deep-core-mining__/graphics/icons/ore-chunk-2.png",
          height = 64,
          width = 64,
          scale = 0.5,
        },
        {
          filename = "__vtk-deep-core-mining__/graphics/icons/ore-chunk-2-layer.png",
          height = 64,
          width = 64,
          scale = 0.5,
          tint = oretint
        }
      }
    },
    {
      layers = {
        {
          filename = "__vtk-deep-core-mining__/graphics/icons/ore-chunk-3.png",
          height = 64,
          width = 64,
          scale = 0.5,
        },
        {
          filename = "__vtk-deep-core-mining__/graphics/icons/ore-chunk-3-layer.png",
          height = 64,
          width = 64,
          scale = 0.5,
          tint = oretint
        }
      }
    },
    {
      layers = {
        {
          filename = "__vtk-deep-core-mining__/graphics/icons/ore-chunk-4.png",
          height = 64,
          width = 64,
          scale = 0.5,
        },
        {
          filename = "__vtk-deep-core-mining__/graphics/icons/ore-chunk-4-layer.png",
          height = 64,
          width = 64,
          scale = 0.5,
          tint = oretint
        }
      }
    },
    {
      layers = {
        {
          filename = "__vtk-deep-core-mining__/graphics/icons/ore-chunk-5.png",
          height = 64,
          width = 64,
          scale = 0.5,
        },
        {
          filename = "__vtk-deep-core-mining__/graphics/icons/ore-chunk-5-layer.png",
          height = 64,
          width = 64,
          scale = 0.5,
          tint = oretint
        }
      }
    },
    {
      layers = {
        {
          filename = "__vtk-deep-core-mining__/graphics/icons/ore-chunk-6.png",
          height = 64,
          width = 64,
          scale = 0.5,
        },
        {
          filename = "__vtk-deep-core-mining__/graphics/icons/ore-chunk-6-layer.png",
          height = 64,
          width = 64,
          scale = 0.5,
          tint = oretint
        }
      }
    },
    {
      layers = {
        {
          filename = "__vtk-deep-core-mining__/graphics/icons/ore-chunk-7.png",
          height = 64,
          width = 64,
          scale = 0.5,
        },
        {
          filename = "__vtk-deep-core-mining__/graphics/icons/ore-chunk-7-layer.png",
          height = 64,
          width = 64,
          scale = 0.5,
          tint = oretint
        }
      }
    },
    {
      layers = {
        {
          filename = "__vtk-deep-core-mining__/graphics/icons/ore-chunk-8.png",
          height = 64,
          width = 64,
          scale = 0.5,
        },
        {
          filename = "__vtk-deep-core-mining__/graphics/icons/ore-chunk-8-layer.png",
          height = 64,
          width = 64,
          scale = 0.5,
          tint = oretint
        }
      }
    },
  }
end

--
-- Deep Core Cracks
--
local deep_core_ore = {
  type = "resource",
  name = "vtk-deepcore-mining-crack",
  icon = "__vtk-deep-core-mining__/graphics/icons/deep-core.png",
  icon_size = 32,
  flags = { "placeable-neutral" },
  allow_decomposition = false,
  collision_box = { { -5.4, -5.4 }, { 5.4, 5.4 } },
  selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } },
  category = "vtk-deepcore-mining-crack",
  order = "z[vtk-deepcore-mining]-b[ore]",
  infinite = true,
  highlight = true,
  infinite_depletion_amount = 0,
  minimum = 10000,
  normal = 10000,
  enable_cliff_removal = false,
  tree_removal_probability = 0,
  cliff_removal_probability = 0,
  minable = {
    mining_time = 400,
    mining_particle = "stone-particle",
    results = {
      {
        type = "item",
        name = "vtk-deepcore-mining-ore-chunk",
        amount_min = 800,
        amount_max = 1200,
      },
    },
    --    fluid_amount = 9000,
    --    required_fluid = sulfuricacidname
  },
  --[[
  autoplace =
  {
    control = "vtk-deepcore-mining-crack",
    sharpness = 0.98,
    max_probability = 0.04,
    richness_base = 75000,
    richness_multiplier = 100000,
    richness_multiplier_distance_bonus = 1000,
    coverage = 0,
    peaks =
    {
      {
        noise_layer = "vtk-deepcore-mining-crack",
        noise_octaves_difference = -1.5,
        noise_persistence = 0.3,
        starting_area_weight_optimal = 0,
        starting_area_weight_range = 0,
        starting_area_weight_max_range = 2,
      }
    }
  },
  ]] --

  stages =
  {
    sheet =
    {
      filename = "__vtk-deep-core-mining__/graphics/resource/deep-core-sheet.png",
      priority = "extra-high",
      width = 512,
      height = 512,
      frame_count = 6,
      line_length = 3,
      variation_count = 1,
    }
  },
  stage_counts = { 0 },
  map_color = util.color "001eff",
  map_grid = false
}

data:extend({
  deep_core_resource_patch_category,
  deep_core_resource_ore_category,
  -- deep_core_noise_layer,
  -- deep_core_control,
  deep_core_ore,
})


--
-- DeepCore Ore Mining Patches
--
local function resource_patch_maker(
    ore_name,
    ore_patch_name,
    ore_results,
    oreimg,
    frame,
    variation,
    miningtime,
    miningparticle,
    mapcolor,
    oretint,
    fluid,
    fluidamount
)
  -- The mining results can be chunks or the original results.
  -- The original mining results get amplified by factor 3.
  -- If they do not have variance (no amount_min, amount_max specified), then
  -- we introduce some.
  local mining_results = {
    {
      type = "item",
      name = "vtk-deepcore-mining-" .. ore_name .. "-chunk", -- ore chunks
      amount_min = 2,
      amount_max = 4,
      probability = 1
    }
  }
  for _, result in pairs(ore_results) do
    local mod_result = util.table.deepcopy(result)
    if not mod_result.probability then
      -- we will set a probability later, so set it here if it is missing.
      mod_result.probability = 1
    end
    if mod_result.amount or mod_result[2] then
      -- introduce some variance (on average amplified by 3)
      mod_result.amount_min = 2 * (mod_result.amount or mod_result[2])
      mod_result.amount_max = 4 * (mod_result.amount or mod_result[2])
      -- unset amount, since its value overrides amount_min/amount_max
      mod_result.amount = nil
      mod_result[2] = nil
    else
      -- amplify the variance by 3
      if mod_result.amount_min then
        mod_result.amount_min = mod_result.amount_min * 3
      end
      if mod_result.amount_max then
        mod_result.amount_max = mod_result.amount_max * 3
      end
    end
    table.insert(mining_results, mod_result)
  end

  local oredata =
  {
    type = "resource",
    name = ore_patch_name,
    tint = oretint,
    icons = {
      {
        icon = "__vtk-deep-core-mining__/graphics/icons/" .. oreimg .. "-patch.png",
        tint = oretint
      }
    },
    icon_size = 64,
    flags = { "placeable-neutral" },
    category = "vtk-deepcore-mining-ore-patch",
    order = "a-b-a",
    infinite = true,
    highlight = true,
    infinite_depletion_resource_amount = 0,
    minimum = 10000,
    normal = 10000,
    resource_patch_search_radius = 20,
    minable =
    {
      mining_time = miningtime * 12,
      mining_particle = miningparticle,
      results = mining_results
    },
    collision_box = { { -1.4, -1.4 }, { 1.4, 1.4 } },
    selection_box = { { -0.75, -0.75 }, { 0.75, 0.75 } },
    stage_counts = { 0 },
    stages =
    {
      sheet =
      {
        filename = "__vtk-deep-core-mining__/graphics/resource/" .. oreimg .. "-patch-sprite-hr.png",
        tint = oretint,
        width = 250,
        height = 250,
        frame_count = frame,
        variation_count = variation,
        scale = 0.5
      }
    },
    map_color = mapcolor,
    map_grid = false
  }

  if fluid ~= nil then
    table.insert(oredata.minable, { ["fluid_amount"] = fluidamount, ["required_fluid"] = fluid })
  end

  return oredata
end

local function make_ore_glow(oreresource)
  data.raw.resource[oreresource].stage_counts = { 1 }
  data.raw.resource[oreresource].effect_animation_period = 5
  data.raw.resource[oreresource].effect_animation_period_deviation = 1
  data.raw.resource[oreresource].effect_darkness_multiplier = 3.6

  data.raw.resource[oreresource].stages =
  {
    sheet =
    {
      filename = "__vtk-deep-core-mining__/graphics/resource/" .. oreresource .. "-sprite.png",
      priority = "extra-high",
      width = 100,
      height = 100,
      frame_count = 3,
      variation_count = 1,
    }
  }
  data.raw.resource[oreresource].stages_effect =
  {
    sheet =
    {
      filename = "__vtk-deep-core-mining__/graphics/resource/" .. oreresource .. "-glow.png",
      priority = "extra-high",
      width = 100,
      height = 100,
      frame_count = 3,
      variation_count = 1,
      blend_mode = "additive",
      flags = { "light" },
    }
  }
end

for ore, oredata in pairs(vtk_deepcoremining_supported_ores) do
  local oretint = nil
  if oredata.patchtint then
    if data.raw.resource[ore].tint then
      oretint = data.raw.resource[ore].tint
    else
      oretint = data.raw.resource[ore].map_color
    end
  end

  local fluid = nil;
  if oredata["mining-liquid"] then
    if oredata["mining-liquid"] == "sulfuric-acid" then
      fluid = sulfuricacidname
    else
      fluid = oredata["mining-liquid"]
    end
  end
  local fluidamount = nil;
  if oredata["mining-liquid-amount"] then
    fluidamount = oredata["mining-liquid-amount"]
  end
  local ore_patch = resource_patch_maker(
    ore,                                               -- ore_name
    ore .. "-patch",                                   -- ore_patch_name
    oredata.results,                                   -- patch mining ore result
    oredata.patchimg,                                  -- ore image name (icon, entity, hrentity)
    oredata.frame,                                     -- frame
    oredata.variation,                                 -- variation
    data.raw.resource[ore].minable['mining_time'],     -- miningtime,
    data.raw.resource[ore].minable['mining_particle'], -- miningparticle
    data.raw.resource[ore].map_color,                  -- mapcolor
    oretint,                                           -- tint
    fluid,                                             -- fluid required
    fluidamount                                        -- fluid amount
  )

  local ore_patch_ore = util.table.deepcopy(ore_patch)
  local ore_patch_chunk = util.table.deepcopy(ore_patch)
  ore_patch_ore.name = ore_patch_ore.name .. "-ore"
  -- the first entry is the chunk result
  ore_patch_ore.minable.results[1].probability = 0
  ore_patch_ore.minable.mining_time = ore_patch_ore.minable.mining_time / 4
  ore_patch_ore.hidden_in_factoriopedia = true
  ore_patch_ore.hidden = true
  ore_patch_chunk.name = ore_patch_chunk.name .. "-chunk"
  -- all other results are the original ore result
  for i = 2, #ore_patch_chunk.minable.results do
    ore_patch_chunk.minable.results[i].probability = 0
  end
  ore_patch_chunk.hidden = true
  ore_patch_chunk.hidden_in_factoriopedia = true

  data:extend({
    ore_patch,
    ore_patch_ore,
    ore_patch_chunk
  })

  if ore == "uranium-ore" then
    make_ore_glow("uranium-ore-patch")
  end
end

--
-- DeepCore Ore chunks
--
local i = 1
for ore, oredata in pairs(vtk_deepcoremining_supported_ores) do
  local oretint = nil
  if oredata.tint then
    if data.raw.resource[ore].tint then
      oretint = data.raw.resource[ore].tint
    else
      oretint = data.raw.resource[ore].map_color
    end
  end

  local ore_chunk =
  {
    type = "item",
    name = "vtk-deepcore-mining-" .. ore .. "-chunk",
    icons = {
      {
        icon = "__vtk-deep-core-mining__/graphics/icons/ore-chunk-icon.png",
      },
      {
        icon = "__vtk-deep-core-mining__/graphics/icons/ore-chunk-icon-layer.png",
        tint = oretint
      },
    },
    icon_size = 64,
    mipmap_count = 1,

    pictures = deepcorechunksvariations(oretint),
    subgroup = "raw-resource",
    order = "va[vtk-deepcore-mining-chunk-" .. i .. "]",
    stack_size = 100,
    random_tint_color = item_tints.iron_rust
  }
  data:extend({
    ore_chunk,
  })
  i = i + 1
end

data:extend({
  {
    type = "item",
    name = "vtk-deepcore-mining-ore-chunk",
    icon = "__vtk-deep-core-mining__/graphics/icons/deepcore-ore-chunk.png",
    icon_size = 64,
    pictures = deepcorechunksvariations({ 240, 225, 142 }),
    subgroup = "raw-resource",
    order = "vz[vtk-deepcore-mining-ore-chunk]",
    stack_size = 100,
    random_tint_color = item_tints.iron_rust
  }
})
