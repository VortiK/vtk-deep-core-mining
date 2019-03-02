local sulfuricacidname = "sulfuric-acid"
if mods["angelspetrochem"] then
    sulfuricacidname = "liquid-sulfuric-acid"
end

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


local deep_core_ore = {
  type = "resource",
  name = "vtk-deepcore-mining-crack",
  icon = "__vtk-deep-core-mining__/graphics/icons/deep-core.png",
  icon_size = 32,
  flags = {"placeable-neutral"},
  collision_box = {{ -5.4, -5.4}, {5.4, 5.4}},
  selection_box = {{ -2.5, -2.5}, {2.5, 2.5}},
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
    mining_time = 30,
    mining_particle = "stone-particle",
    results = {
      {
        type = "item",
        name = "vtk-deepcore-mining-ore-chunk",
        amount_min = 30,
        amount_max = 30,
      }, 
    },
    fluid_amount = 1000,
    required_fluid = sulfuricacidname
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
  ]]--

  stages =
  {
    sheet =
    {
      filename = "__vtk-deep-core-mining__/graphics/resource/deep-core.png",
      priority = "extra-high",
      width = 512,
      height = 512,
      frame_count = 1,
      variation_count = 1,
    }
  },
  stage_counts = {0},
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


local function resource_patch_maker(
  ore_name, 
  ore_patch_name, 
  oreimg, 
  frame, 
  variation, 
  hardnessparam, 
  miningtime, 
  miningparticle, 
  mapcolor, 
  oretint, 
  fluid
)
  local fluid_req = {
    minable =
    {
      mining_time = miningtime,
      results =
      {
        {
          type = "item",
          name = ore_name,
          amount_min = 10,
          amount_max = 10,
          probability = 1
        }
      },
      fluid_amount = 1000,
      required_fluid = sulfuricacidname
    }
  }
  
  oredata = 
  {
    type = "resource",
    name = ore_patch_name,
    tint = oretint,
    icons = {
      {
        icon = "__vtk-deep-core-mining__/graphics/icons/"..oreimg.."-patch.png",
        tint = oretint
      }
    },
    icon_size = 32,
    flags = {"placeable-neutral"},
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
      mining_time = miningtime,
      mining_particle = miningparticle,
      results =
      {
        {
          type = "item",
          name = ore_name,
          amount_min = 10,
          amount_max = 10,
          probability = 1
        }
      }
    },
    collision_box = {{ -1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{ -0.75, -0.75}, {0.75, 0.75}},
    stage_counts = {0},
    stages =
    {
      sheet =
      {
        filename = "__vtk-deep-core-mining__/graphics/resource/"..oreimg.."-patch-sprite.png", 
        priority = "extra-high",
        tint = oretint,
        width = 100,
        height = 100,
        frame_count = frame,
        variation_count = variation,
        hr_version = {
          filename = "__vtk-deep-core-mining__/graphics/resource/"..oreimg.."-patch-sprite-hr.png",
          priority = "extra-high",
          tint = oretint,
          width = 250,
          height = 250,
          frame_count = frame,
          variation_count = variation,
          scale = 0.5
        }
      }
    },
    map_color = mapcolor,
    map_grid = false
  }
  
  if fluid then
    for k,v in pairs(fluid_req) do oredata[k] = v end

    return oredata
  end
  
  return oredata
end

local function make_ore_glow(oreresource)

  data.raw.resource[oreresource].stage_counts = {1}
  data.raw.resource[oreresource].effect_animation_period = 5
  data.raw.resource[oreresource].effect_animation_period_deviation = 1
  data.raw.resource[oreresource].effect_darkness_multiplier = 3.6

  data.raw.resource[oreresource].stages =
  {
    sheet =
    {
      filename = "__vtk-deep-core-mining__/graphics/resource/"..oreresource.."-sprite.png",
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
      filename = "__vtk-deep-core-mining__/graphics/resource/"..oreresource.."-glow.png",
      priority = "extra-high",
      width = 100,
      height = 100,
      frame_count = 3,
      variation_count = 1,
      blend_mode = "additive",
      flags = {"light"},
    }
  }
end

for ore, oredata in pairs(vtk_deepcoremining_supported_ores) do
  local oretint = nil
  if oredata.tint then
    if data.raw.resource[ore].tint then
      oretint = data.raw.resource[ore].tint
    else
      oretint = data.raw.resource[ore].map_color
    end
  end
  
  local ore_patch = resource_patch_maker(
    ore,                                            -- ore_name
    ore.."-patch",                                  -- ore_patch_name
    oredata.img,                                    -- ore image name (icon, entity, hrentity)
    oredata.frame,                                  -- frame
    oredata.variation,                              -- variation
    data.raw.resource[ore].minable.mining_time*10,  -- miningtime * 10 and yields 10 units
    data.raw.resource[ore].minable.mining_particle, -- miningparticle
    data.raw.resource[ore].map_color,               -- mapcolor
    oretint,                                        -- tint
    false                                           -- fluid required
  )
  
  data:extend({
    ore_patch
  })
end

local uranium_ore_patch = 
resource_patch_maker(
  "uranium-ore", 
  "uranium-ore-patch", 
  "uranium-ore", 
  3, 
  1, 
  data.raw.resource["uranium-ore"].minable.mining_time, 
  data.raw.resource["uranium-ore"].minable.mining_particle, 
  data.raw.resource["uranium-ore"].map_color, 
  nil,
  true
)

data:extend({
  uranium_ore_patch
})
make_ore_glow("uranium-ore-patch")
