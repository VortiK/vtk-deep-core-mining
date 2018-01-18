-- Apply unlocks and bonuses if already researched (case of loading an existing savegame)
for i, force in pairs(game.forces) do 

  if force.technologies["vtk-deepcore-mining-advanced"].researched then
    force.technologies["vtk-deepcore-mining-advanced"].researched = false
  end
	if force.technologies["vtk-deepcore-mining"].researched then 
    force.technologies["vtk-deepcore"].researched = true
		force.recipes["vtk-deepcore-mining-drone"].enabled = true
    force.recipes["vtk-deepcore-mining-planner"].enabled = true
    force.recipes["vtk-deepcore-mining-iron-ore-chunk-refining"].enabled = true
    force.recipes["vtk-deepcore-mining-copper-ore-chunk-refining"].enabled = true
    force.recipes["vtk-deepcore-mining-coal-chunk-refining"].enabled = true
    force.recipes["vtk-deepcore-mining-stone-chunk-refining"].enabled = true
    force.recipes["vtk-deepcore-mining-uranium-ore-chunk-refining"].enabled = true
	end

end