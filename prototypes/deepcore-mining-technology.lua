data:extend(
{
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
          recipe = "vtk-deepcore-mining-drone"
        },
        {
          type = "unlock-recipe",
          recipe = "vtk-deep-core-planner"
        },
        {
          type = "unlock-recipe",
          recipe = "vtk-deepcore-iron-ore-chunk-refining"
        },
      },
    prerequisites = {"advanced-material-processing-2", "productivity-module-3", "mining-productivity-4"}, 
    unit =
    {
      count = 1000,
      ingredients = {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"production-science-pack", 1},
      },
      time = 60,
    },
    upgrade = true,
    order = "e-c-c-a"
  },
})
