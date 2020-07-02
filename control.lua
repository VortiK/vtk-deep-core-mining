-- Factorio STD Lib
require 'stdlib/area/area'
require 'stdlib/area/position'
require 'stdlib/table'
require 'stdlib/string'
-- Sementic Version comparision tool
local v = require 'lib/semver'
-- This Mod's functions
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

-- prevent beacons
script.on_event(events.on_robot_built_entity,
    function(event)
        prevent_beacons(event.created_entity)
    end,
    {{filter="name", name = "vtk-deepcore-mining-drill-advanced"}, {filter="name", name = "vtk-deepcore-mining-drill"}}
)
script.on_event(events.on_built_entity,
    function(event)
        prevent_beacons(event.created_entity)
    end,
    {{filter="name", name = "vtk-deepcore-mining-drill-advanced"}, {filter="name", name = "vtk-deepcore-mining-drill"}}
)

-- adcmd_energy_companion place
script.on_event(events.on_robot_built_entity,
    function(event)
        adcmd_energy_companion_add(event.created_entity)
    end,
    {{filter="name", name = "vtk-deepcore-mining-drill-advanced"}}
)
script.on_event(events.on_built_entity,
    function(event)
        adcmd_energy_companion_add(event.created_entity)
    end,
    {{filter="name", name = "vtk-deepcore-mining-drill-advanced"}}
)

-- adcmd_energy_companion remove
script.on_event(events.on_entity_died,
    function(event)
        adcmd_energy_companion_remove(event.entity)
    end,
    {{filter="name", name = "vtk-deepcore-mining-drill-advanced"}}
)
script.on_event(events.on_player_mined_entity,
    function(event)
        adcmd_energy_companion_remove(event.entity)
    end,
    {{filter="name", name = "vtk-deepcore-mining-drill-advanced"}}
)
script.on_event(events.on_robot_pre_mined,
    function(event)
        adcmd_energy_companion_remove(event.entity)
    end,
    {{filter="name", name = "vtk-deepcore-mining-drill-advanced"}}
)

-- check power on adcmd energy interface companions every few and then
script.on_nth_tick(120, 
    function(event)
        adcmd_energy_switcher()
    end
)

-- on mod update fixes
script.on_configuration_changed(function(data)
    if data.mod_changes["vtk-deep-core-mining"] and data.mod_changes["vtk-deep-core-mining"].old_version ~= nil then
        local current = v(data.mod_changes["vtk-deep-core-mining"].old_version)
        if current < v(1,8,2) then
            upgrade182(data)
        end
        if current < v(2,0,0) then
            upgrade200(data)
        end
    end

end)
