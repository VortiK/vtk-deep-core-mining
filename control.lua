require 'stdlib/area/area'
require 'stdlib/area/position'

function spawn_ore_patch_on_depleted_ore(event)
  local ore = event.entity
  local surface = ore.surface
  local areaToScan = Position.expand_to_area(ore.position, 5)
  local orePatchable = {"iron-ore", "copper-ore", "coal"}
  
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
  for _,v in pairs(orePatchable) do
    if v == ore.name then
      validOre = true
      break
    end
  end
  
  if validOre and not Area.inside(Position.expand_to_area({0,0}, 500), ore.position) then
    orePatch = ore.name .. "-patch"
    local number = math.random(1, 10)
    entitiesCount = surface.count_entities_filtered{area = areaToScan, name = orePatch}
    
    if number == 1 and entitiesCount == 0 then
      oreamount = math.random(60000, 300000)
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
