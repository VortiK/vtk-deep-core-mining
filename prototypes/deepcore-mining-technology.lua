data:extend(
{
  {
    type = "technology",
    name = "vtk-deepcore",
    icon_size = 128,
    icon = "__vtk-deep-core-mining__/graphics/technology/deepcore-tech.png",
    effects = 
    {
        {
          type = "unlock-recipe",
          recipe = "vtk-deepcore-mining-drone"
        },
        {
          type = "unlock-recipe",
          recipe = "vtk-deepcore-mining-moho"
        },
      },
    prerequisites = {"advanced-circuit", "robotics", "advanced-material-processing", "sulfur-processing", "chemical-science-pack"}, 
    unit =
    {
      count = 500,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
      },
      time = 30,
    },
    upgrade = true,
    order = "e-c-c-a"
  },
  {
    type = "technology",
    name = "vtk-deepcore-mining",
    icon_size = 128,
    icon = "__vtk-deep-core-mining__/graphics/technology/deepcore-mining.png",
    effects = 
    {
        {
          type = "unlock-recipe",
          recipe = "vtk-deepcore-mining-drill"
        },
        {
          type = "unlock-recipe",
          recipe = "vtk-deepcore-mining-planner"
        },
      },
    prerequisites = {"vtk-deepcore", "advanced-material-processing-2", "productivity-module-2", "mining-productivity-1", "production-science-pack"}, 
    unit =
    {
      count = 1000,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
      },
      time = 60,
    },
    upgrade = true,
    order = "e-c-c-a"
  },
  {
    type = "technology",
    name = "vtk-deepcore-mining-advanced",
    icon_size = 128,
    icon = "__vtk-deep-core-mining__/graphics/technology/deepcore-mining-advanced.png",
    effects = 
    {
        {
          type = "unlock-recipe",
          recipe = "vtk-deepcore-mining-drill-advanced"
        },
        {
          type = "unlock-recipe",
          recipe = "vtk-deepcore-mining-ore-chunk-refining"
        },
        {
          type = "unlock-recipe",
          recipe = "vtk-deepcore-mining-ore-chunk-refining-no-uranium"
        },
    },
    prerequisites = {"vtk-deepcore", "vtk-deepcore-mining", "mining-productivity-2", "production-science-pack", "utility-science-pack"}, 
    unit =
    {
      count = 1500,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
      },
      time = 60,
    },
    upgrade = true,
    order = "e-c-c-a"
  },
})

for ore, oredata in pairs(vtk_deepcoremining_supported_ores) do
  if oredata.probability ~= nil then
    table.insert(data.raw['technology']['vtk-deepcore-mining']['effects'], {type = "unlock-recipe", recipe = "vtk-deepcore-mining-"..ore.."-chunk-refining" })
    if oredata['probability'] > 0 then
      table.insert(data.raw['technology']['vtk-deepcore-mining-advanced']['effects'], {type = "unlock-recipe", recipe = "vtk-deepcore-mining-ore-chunk-refining-"..ore.."-focus" })
    end
  end
end

if mods["space-age"] then
  table.insert(data.raw["technology"]["vtk-deepcore-mining-advanced"]["prerequisites"], "space-science-pack")
  table.insert(data.raw["technology"]["vtk-deepcore-mining-advanced"]["prerequisites"], "metallurgic-science-pack")
  table.insert(data.raw["technology"]["vtk-deepcore-mining-advanced"]["unit"]["ingredients"], { "space-science-pack", 1 })
  table.insert(data.raw["technology"]["vtk-deepcore-mining-advanced"]["unit"]["ingredients"], { "metallurgic-science-pack", 1 })
  
  data.raw["technology"]["vtk-deepcore-mining"].prerequisites = {"vtk-deepcore", "advanced-material-processing-2", "productivity-module-2", "mining-productivity-1", "production-science-pack", "space-science-pack", "big-mining-drill"}
  table.insert(data.raw["technology"]["vtk-deepcore-mining"]["unit"]["ingredients"], { "space-science-pack", 1 })
end
