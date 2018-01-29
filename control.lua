require 'stdlib/area/area'
require 'stdlib/area/position'
require 'stdlib/table'
require 'lib/resource'
require 'lib/feature'
require 'lib/upgrade'

-- events hook

-- Spawn ore patches on ore depletion
events = defines.events
script.on_event({
    events.on_resource_depleted
}, function(event)
    spawn_ore_patch_on_depleted_ore(event)
end)

-- spawn cracks in the world on exploration
script.on_event({
  events.on_chunk_generated, 
}, function(event)
    place_deep_core_cracks(event.area, event.surface)
end)

-- manual planner remove tool
script.on_event({
  events.on_player_selected_area
}, function(event)
  if event.item == "vtk-deepcore-mining-planner" then
      local player = game.players[event.player_index]
      local surface = player.surface
      remove_ore_patch(player, surface, event.area, event.entities)
  end
end)

-- force DMCD rotation
script.on_event({
    events.on_robot_built_entity, 
    events.on_built_entity
}, function(event)
    force_rotation(event.created_entity)
    prevent_beacons(event.created_entity)
end)

-- on mod update fixes
script.on_configuration_changed(function(data)
    if data.mod_changes["vtk-deep-core-mining"] and data.mod_changes["vtk-deep-core-mining"].old_version ~= nil then
        upgrade182(data)
    end
end)