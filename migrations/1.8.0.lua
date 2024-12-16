-- Apply unlocks and bonuses if already researched (case of loading an existing savegame)
for i, force in pairs(game.forces) do 
	force.reset_recipes()
	force.reset_technology_effects()
  --[[
  if mods["angelsrefining"] and force.technologies["vtk-deepcore"].researched then
    force.recipes["vtk-deepcore-mining-angels-ore1-chunk-refining"].enabled = true
    force.recipes["vtk-deepcore-mining-angels-ore2-chunk-refining"].enabled = true
    force.recipes["vtk-deepcore-mining-angels-ore3-chunk-refining"].enabled = true
    force.recipes["vtk-deepcore-mining-angels-ore4-chunk-refining"].enabled = true
    force.recipes["vtk-deepcore-mining-angels-ore5-chunk-refining"].enabled = true
    force.recipes["vtk-deepcore-mining-angels-ore6-chunk-refining"].enabled = true
  end
  ]]--
end