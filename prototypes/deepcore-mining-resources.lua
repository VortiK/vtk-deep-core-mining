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
    hardness = 10,
    mining_time = 2,
    mining_particle = "stone-particle",
    results = {
      {
        type = "item",
        name = "vtk-deepcore-mining-ore-chunk",
        amount_min = 1,
        amount_max = 1,
      }, 
    },
    fluid_amount = 100,
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

local function resource_patch_maker(ore_name, ore_patch_name, hardnessparam, miningtime, miningparticle, mapcolor, fluid)
  local fluid_req = {
    minable =
    {
      hardness = hardnessparam,
      mining_time = miningtime,
      results =
      {
        {
          type = "item",
          name = ore_name,
          amount_min = 1,
          amount_max = 1,
          probability = 1
        }
      },
      fluid_amount = 100,
      required_fluid = sulfuricacidname
    }
  }
  
  oredata = 
  {
    type = "resource",
    name = ore_patch_name,
    icon = "__vtk-deep-core-mining__/graphics/icons/"..ore_patch_name..".png",
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
      hardness = hardnessparam, 
      mining_time = miningtime,
      mining_particle = miningparticle,
      results =
      {
        {
          type = "item",
          name = ore_name,
          amount_min = 1,
          amount_max = 1,
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
        filename = "__vtk-deep-core-mining__/graphics/resource/"..ore_patch_name.."-sprite.png",
        priority = "extra-high",
        width = 100,
        height = 100,
        frame_count = 3,
        variation_count = 1,
        hr_version = {
          filename = "__vtk-deep-core-mining__/graphics/resource/hr-"..ore_patch_name.."-sprite.png",
          priority = "extra-high",
          width = 250,
          height = 250,
          frame_count = 3,
          variation_count = 1,
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

local copper_ore_patch = 
resource_patch_maker(
  "copper-ore", 
  "copper-ore-patch", 
  data.raw.resource["copper-ore"].minable.hardness,         -- hardnessparam
  data.raw.resource["copper-ore"].minable.mining_time,      -- miningtime
  data.raw.resource["copper-ore"].minable.mining_particle,  -- miningparticle
  data.raw.resource["copper-ore"].map_color,                -- mapcolor
  false                                                     -- fluid required
)

local iron_ore_patch = 
resource_patch_maker(
  "iron-ore", 
  "iron-ore-patch", 
  data.raw.resource["iron-ore"].minable.hardness, 
  data.raw.resource["iron-ore"].minable.mining_time, 
  data.raw.resource["iron-ore"].minable.mining_particle, 
  data.raw.resource["iron-ore"].map_color, 
  false
)

local coal_patch = 
resource_patch_maker(
  "coal", 
  "coal-patch", 
  data.raw.resource["coal"].minable.hardness, 
  data.raw.resource["coal"].minable.mining_time, 
  data.raw.resource["coal"].minable.mining_particle, 
  data.raw.resource["coal"].map_color, 
  false
)

local stone_patch = 
resource_patch_maker(
  "stone",
  "stone-patch",
  data.raw.resource["stone"].minable.hardness, 
  data.raw.resource["stone"].minable.mining_time, 
  data.raw.resource["stone"].minable.mining_particle, 
  data.raw.resource["stone"].map_color, 
  false
)

local uranium_ore_patch = 
resource_patch_maker(
  "uranium-ore", 
  "uranium-ore-patch", 
  data.raw.resource["uranium-ore"].minable.hardness, 
  data.raw.resource["uranium-ore"].minable.mining_time, 
  data.raw.resource["uranium-ore"].minable.mining_particle, 
  data.raw.resource["uranium-ore"].map_color, 
  true
)

data:extend({
  deep_core_resource_patch_category, 
  deep_core_resource_ore_category, 
  -- deep_core_noise_layer, 
  -- deep_core_control, 
  deep_core_ore, 
  copper_ore_patch, 
  iron_ore_patch, 
  coal_patch, 
  stone_patch, 
  uranium_ore_patch
})
make_ore_glow("uranium-ore-patch")


if mods["angelsrefining"] then

local angels_ore1_patch = 
resource_patch_maker(
  "angels-ore1", 
  "angels-ore1-patch", 
  data.raw.resource["angels-ore1"].minable.hardness, 
  data.raw.resource["angels-ore1"].minable.mining_time, 
  data.raw.resource["angels-ore1"].minable.mining_particle, 
  data.raw.resource["angels-ore1"].map_color, 
  false
)

local angels_ore2_patch = 
resource_patch_maker(
  "angels-ore2", 
  "angels-ore2-patch", 
  data.raw.resource["angels-ore2"].minable.hardness, 
  data.raw.resource["angels-ore2"].minable.mining_time, 
  data.raw.resource["angels-ore2"].minable.mining_particle, 
  data.raw.resource["angels-ore2"].map_color, 
  false
)

local angels_ore3_patch = 
resource_patch_maker(
  "angels-ore3", 
  "angels-ore3-patch", 
  data.raw.resource["angels-ore3"].minable.hardness, 
  data.raw.resource["angels-ore3"].minable.mining_time, 
  data.raw.resource["angels-ore3"].minable.mining_particle, 
  data.raw.resource["angels-ore3"].map_color, 
  false
)

local angels_ore4_patch = 
resource_patch_maker(
  "angels-ore4", 
  "angels-ore4-patch", 
  data.raw.resource["angels-ore4"].minable.hardness, 
  data.raw.resource["angels-ore4"].minable.mining_time, 
  data.raw.resource["angels-ore4"].minable.mining_particle, 
  data.raw.resource["angels-ore4"].map_color, 
  false
)

local angels_ore5_patch = 
resource_patch_maker(
  "angels-ore5", 
  "angels-ore5-patch", 
  data.raw.resource["angels-ore5"].minable.hardness, 
  data.raw.resource["angels-ore5"].minable.mining_time, 
  data.raw.resource["angels-ore5"].minable.mining_particle, 
  data.raw.resource["angels-ore5"].map_color, 
  false
)

local angels_ore6_patch = 
resource_patch_maker(
  "angels-ore6", 
  "angels-ore6-patch", 
  data.raw.resource["angels-ore6"].minable.hardness, 
  data.raw.resource["angels-ore6"].minable.mining_time, 
  data.raw.resource["angels-ore6"].minable.mining_particle, 
  data.raw.resource["angels-ore6"].map_color, 
  false
)

data:extend({
  angels_ore1_patch, 
  angels_ore2_patch, 
  angels_ore3_patch, 
  angels_ore4_patch, 
  angels_ore5_patch, 
  angels_ore6_patch, 
})

end
