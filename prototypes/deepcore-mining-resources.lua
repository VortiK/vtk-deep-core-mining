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
  infinite_depletion_amount = 1,
  minimum = 1000,
  normal = 10000,
  enable_cliff_removal = false,
  tree_removal_probability = 0,
  cliff_removal_probability = 0,
  minable = {
    hardness = 10,
    mining_time = 10,
    mining_particle = "stone-particle",
    results = {
      {
        type = "item",
        name = "vtk-deepcore-mining-ore-chunk",
        amount_min = 10,
        amount_max = 10,
      }, 
    },
    fluid_amount = 100,
    required_fluid = "sulfuric-acid"
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
      required_fluid = "sulfuric-acid"
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
    infinite_depletion_amount = 5,
    minimum = 60000,
    normal = 300000,
    resource_patch_search_radius = 20,
    minable =
    {
      hardness = hardnessparam * 10,
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
    0.9,                         -- hardnessparam
    2,                           -- miningtime
    "copper-ore-particle",       -- miningparticle
    {r=0.803, g=0.388, b=0.215}, -- mapcolor
    false                        -- fluid
  )


local iron_ore_patch = 
  resource_patch_maker(
    "iron-ore", 
    "iron-ore-patch", 
    0.9, 
    2, 
    "iron-ore-particle",
    {r=0.337, g=0.419, b=0.427},
    false
  )


local coal_patch = 
  resource_patch_maker(
    "coal", 
    "coal-patch", 
    0.9, 
    2, 
    "coal-particle",
    {r=0, g=0, b=0},
    false
  )


local stone_patch = 
  resource_patch_maker(
    "stone",
    "stone-patch",
    0.4, 
    2, 
    "stone-particle",
    {r=0.478, g=0.450, b=0.317},
    false
  )


local uranium_ore_patch = 
  resource_patch_maker(
    "uranium-ore", 
    "uranium-ore-patch", 
    0.9, 
    4, 
    "stone-particle",
    {r=0, g=0.7, b=0},
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