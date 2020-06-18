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
        amount_min = 900,
        amount_max = 900,
      },
    },
    fluid_amount = 9000,
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
  ore_result,
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
  local oredata = 
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
    icon_size = 64,
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
      mining_time = miningtime*2,
      mining_particle = miningparticle,
      results =
      {
        {
          type = "item",
          name = ore_result,
          amount_min = 4,
          amount_max = 4,
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
  
  if fluid ~= nil then
    table.merge(oredata.minable, {["fluid_amount"] = fluidamount, ["required_fluid"] = fluid})
    
    
  local fluid_req = {
    minable =
    {
      mining_time = miningtime*2,
      results =
      {
        {
          type = "item",
          name = ore_result,
          amount_min = 2,
          amount_max = 2,
          probability = 1
        }
      },
      fluid_amount = fluidamount,
      required_fluid = sulfuricacidname
    }
  }
    -- for k,v in pairs(fluid_req) do oredata[k] = v end
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
    ore,                                                -- ore_name
    oredata.result.."-patch",                           -- ore_patch_name
    oredata.result,                                     -- ore_result
    oredata.patchimg,                                   -- ore image name (icon, entity, hrentity)
    oredata.frame,                                      -- frame
    oredata.variation,                                  -- variation
    data.raw.resource[ore].minable['mining_time'],      -- miningtime,
    data.raw.resource[ore].minable['mining_particle'],  -- miningparticle
    data.raw.resource[ore].map_color,                   -- mapcolor
    oretint,                                            -- tint
    fluid,                                              -- fluid required
    fluidamount                                         -- fluid amount
  )
  
  data:extend({
    ore_patch
  })

  if ore == "uranium-ore" then
    make_ore_glow("uranium-ore-patch")
  end

end
