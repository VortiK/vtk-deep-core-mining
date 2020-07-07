
local sulfuricacidname = "sulfuric-acid"
if mods["angelspetrochem"] then
    sulfuricacidname = "liquid-sulfuric-acid"
end

-- 
-- DeepCore Ore Refining
-- 
data:extend({
    {
        type = "recipe",
        name = "vtk-deepcore-mining-ore-chunk-refining",
        energy_required = 50,
        enabled = false,
--        category = "centrifuging",
        category = "chemistry",
        subgroup = "raw-material",
        allow_decomposition = false,
        ingredients = {
            {"vtk-deepcore-mining-ore-chunk", 200},
            {type="fluid", name=sulfuricacidname, amount=50}
        },
        icons = {
        {
            icon = "__vtk-deep-core-mining__/graphics/icons/deepcore-ore-chunk-refining.png"
        },
        {
          icon = "__base__/graphics/icons/fluid/sulfuric-acid.png",
          scale = 0.25,
          shift = {10, 10},
        }
--        {
--            icon = "__vtk-deep-core-mining__/graphics/icons/mining-drone.png",
--            scale = 0.25,
--            shift = {10, 10},
--        },
        },
        icon_size = 64,
        order = "v[vtk-deepcore-mining]-a[deepcore-ore-processing]",
        main_product = "",
        results =
        {
        },
        crafting_machine_tint =
        {
            -- primary = {r = 0.000, g = 0.680, b = 0.894, a = 0.000}, -- #00ade45b -- to change?
            -- secondary = {r = 0.700, g = 0.130, b = 0.180, a = 0.357}, -- steel blue #4682B4
            -- tertiary = {r = 0.430, g = 0.805, b = 0.726, a = 0.000}, -- #6dcdb900 -- to change?
            -- quaternary = {r=1,g=1,b=1,a=1}}
            primay = {r = 0.800, g = 0.800, b = 0.100, a = 0.400},
            secondary = {r = 0.800, g = 0.800, b = 0.100, a = 0.400},
            tertiary = {r = 0.800, g = 0.800, b = 0.100, a = 0.400},
            quaternary = {r = 0.800, g = 0.800, b = 0.100, a = 0.400},
        }
    },
})

-- 
-- DeepCore ore Chunks as DeepCore Ore refining results
-- 
for ore, oredata in pairs(vtk_deepcoremining_supported_ores) do

    local oreprobability = oredata.probability
    if vtk_deepcoremining_supported_ores_count > 10 then
        oreprobability = oredata.probability * 0.50
    elseif vtk_deepcoremining_supported_ores_count > 5 then
        oreprobability = oredata.probability * 0.75
    end

    table.insert(data.raw['recipe']['vtk-deepcore-mining-ore-chunk-refining']['results'], {name = "vtk-deepcore-mining-"..oredata.result.."-chunk", probability = oreprobability, amount = 100 })

    -- on the fly focus deep core chunk refining recipes creation
    local ore_chunk_focus_recipe = table.deepcopy(data.raw['recipe']['vtk-deepcore-mining-ore-chunk-refining'])
    ore_chunk_focus_recipe.name = 'vtk-deepcore-mining-ore-chunk-refining-'..ore..'-focus'
    -- focused refining is wasteful and will only get half the result amount compared to the non focused refining method but guarrantee the ore type refinied
--    ore_chunk_focus_recipe.ingredients = {{"vtk-deepcore-mining-ore-chunk", 200}, {"vtk-deepcore-mining-drone", 1}}
    ore_chunk_focus_recipe.energy_required = 50
    ore_chunk_focus_recipe.ingredients = {{"vtk-deepcore-mining-ore-chunk", 300}, {type="fluid", name=sulfuricacidname, amount=100}}
    ore_chunk_focus_recipe.results = {{name = "vtk-deepcore-mining-"..oredata.result.."-chunk", amount = math.ceil(100 * (oredata.refineamount / 10) * oreprobability)}}

    -- tint "generic" ores (like bobs)
    local oretint = nil
    if oredata.tint then
        if data.raw.resource[ore].tint then
            oretint = data.raw.resource[ore].tint
        else
            oretint = data.raw.resource[ore].map_color
        end
        
        -- table.insert(ore_chunk_focus_recipe.icons, {icon = "__vtk-deep-core-mining__/graphics/icons/"..oredata.img.."-focus.png", tint = oretint})
        table.insert(ore_chunk_focus_recipe.icons, 
            {
              icon = "__vtk-deep-core-mining__/graphics/icons/ore-chunk-icon.png",
              scale = 0.25,
              shift = {-10, 10},
            })
        table.insert(ore_chunk_focus_recipe.icons, 
            {
              icon = "__vtk-deep-core-mining__/graphics/icons/ore-chunk-icon-layer.png",
              scale = 0.25,
              shift = {-10, 10},
              tint = oretint,
            })
    else
        table.insert(ore_chunk_focus_recipe.icons, {icon = "__vtk-deep-core-mining__/graphics/icons/"..oredata.img.."-focus.png"})
    end
    data:extend({ore_chunk_focus_recipe})
end

-- 
-- DeepCore ore Chunks refining recipes
-- 
local function chunk_refining_recipe_maker(
  ore_name, 
  ore_icon, 
  refining_result, 
  result_amount, 
  refining_liquid,
  refining_liquid_amount,
  refining_liquid2,
  refining_liquid2_amount,
  oretint,
  machinetint
)
    local recipe =
    {
        type = "recipe",
        name = "vtk-deepcore-mining-"..ore_name.."-chunk-refining",
        enabled = false,
        energy_required = 16,
        category = "chemistry",
        subgroup = "raw-material",
        allow_decomposition = false,
        ingredients = 
        {
            {"vtk-deepcore-mining-"..refining_result.."-chunk", 30},
            {type="fluid", name=refining_liquid, amount=refining_liquid_amount},
			      refining_liquid2 and {type="fluid", name=refining_liquid2, amount=refining_liquid2_amount},
        },
        main_product = "", -- to force use of recipe locales and icons instead of result's
        icons = {
          {
            icon = "__vtk-deep-core-mining__/graphics/icons/ore-chunk-icon.png",
          },
          {
            icon = "__vtk-deep-core-mining__/graphics/icons/ore-chunk-icon-layer.png",
            tint = oretint
          },
          {
            icon = "__base__/graphics/icons/fluid/sulfuric-acid.png",
            scale = 0.25,
            shift = {10, 10},
          }
        },
        icon_size = 64,
        results = 
        {
            {type="item", name=refining_result, amount=result_amount},
        },
        crafting_machine_tint =
        {
            -- primary = {r = 0.000, g = 0.680, b = 0.894, a = 0.000}, -- #00ade45b -- to change?
            -- secondary = {r = 0.700, g = 0.130, b = 0.180, a = 0.357}, -- steel blue #4682B4
            -- tertiary = {r = 0.430, g = 0.805, b = 0.726, a = 0.000}, -- #6dcdb900 -- to change?
            primay = oretint,
            secondary = oretint,
            tertiary = oretint,
            quaternary = oretint
        }
    }
    
    return recipe
end

for ore, oredata in pairs(vtk_deepcoremining_supported_ores) do
  local oretint = nil
  local machinetint = nil
  if data.raw.resource[ore].tint then
    machinetint = data.raw.resource[ore].tint
  else
    machinetint = data.raw.resource[ore].map_color
  end
  if oredata.tint then
    oretint = machinetint
  end
  
  local ore_chunk_refining_recipe = chunk_refining_recipe_maker(
    ore,                          -- ore_name : used for recipe name "-chunk-refining" and ingredient "-chunk")
    oredata.img,                  -- ore refining icon "-chunk-refining.png
    oredata.result,               -- result
    oredata.refineamount,         -- result amount
    sulfuricacidname,             -- refining liquid
    oredata.refineliquid,         -- refining liquid amount
    oredata.refineliquid2_name,   -- refining liquid 2
    oredata.refineliquid2,        -- refining liquid 2 amount
    oretint,                      -- tint
    machinetint                   -- machinetint
    -- {r = 0.700, g = 0.130, b = 0.180, a = 0.357}, -- steel blue #4682B4
  )

  data:extend({
    ore_chunk_refining_recipe
  })
end
