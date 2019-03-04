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
          recipe = "vtk-deepcore-mining-planner"
        },
      },
    prerequisites = {"advanced-electronics", "robotics", "advanced-material-processing", "sulfur-processing"}, 
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
      },
    prerequisites = {"vtk-deepcore", "advanced-material-processing-2", "productivity-module-3", "mining-productivity-1"}, 
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
    },
    prerequisites = {"vtk-deepcore", "vtk-deepcore-mining", "mining-productivity-3"}, 
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
  table.insert(data.raw['technology']['vtk-deepcore']['effects'], {type = "unlock-recipe", recipe = "vtk-deepcore-mining-"..ore.."-chunk-refining" })
  table.insert(data.raw['technology']['vtk-deepcore-mining-advanced']['effects'], {type = "unlock-recipe", recipe = "vtk-deepcore-mining-ore-chunk-refining-"..ore.."-focus" })
end
