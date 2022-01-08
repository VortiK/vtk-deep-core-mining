if mods["IndustrialRevolution"] then
  data:extend({
    {
      type = "recipe",
      name = "vtk-deepcore-mining-drone",
      enabled = false,
      energy_required = 10,
      ingredients =
      {
        {"construction-robot", 1},
        {"electric-mining-drill", 1},
        {"advanced-circuit", 1}
      },
      result= "vtk-deepcore-mining-drone",
    }
  })
end
