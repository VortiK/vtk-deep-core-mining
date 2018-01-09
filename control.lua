require 'stdlib/area/area'
require 'stdlib/area/position'

function spawn_ore_patch_on_depleted_ore(event)
  local ore = event.entity
  local surface = ore.surface
  local areaToScan = Position.expand_to_area(ore.position, 5)
  local patchableOres = {"iron-ore", "copper-ore", "coal", "stone"; "uranium-ore"}
  
  -- logic : 
  -- - depleted ore has an equivalent patch entity
  -- - 10% chance to spawn an ore patch on depletion
  -- - check if there isn't a nearby ore patch already
  -- - then spawn it on the location the ore was depleted
  
  -- debug
  -- local player = game.players[1]
  -- player.print("VTK-DEEP-CORE-MINING_DEBUG")
  -- player.print(serpent.block(player))
  
  validOre = false
  for _,patchableOre in pairs(patchableOres) do
    if patchableOre == ore.name then
      if settings.global["vtk-deep-core-mining-spawn-"..patchableOre.."-patch"].value then
        validOre = true
        break
      end
    end
  end
  
  if validOre and not Area.inside(Position.expand_to_area({0,0}, settings.global["vtk-deep-core-mining-spawn-radius-from-spawn"].value), ore.position) then
    orePatch = ore.name .. "-patch"
    local number = math.random(1, 10)
    entitiesCount = surface.count_entities_filtered{area = areaToScan, name = orePatch}
    
    if number == 1 and entitiesCount == 0 then
      oreamount = math.random(settings.global["vtk-deep-core-mining-min-richness"].value, settings.global["vtk-deep-core-mining-max-richness"].value)
      newOreEntity = surface.create_entity({name = orePatch, amount = oreamount, position = ore.position, force = game.forces.neutral})
    end
  end
  
end

-- events hook
events = defines.events
script.on_event({
    events.on_resource_depleted
}, function(event)
    spawn_ore_patch_on_depleted_ore(event)
end)
