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

-- ore patches toggle and adcmd companion management on placed drill
script.on_event(events.on_robot_built_entity,
    function(event)
        dcm_dispatcher(event.entity, "create")
    end,
    {
        {filter="name", name = "vtk-deepcore-mining-drill-advanced"}
    }
)
script.on_event(events.on_built_entity,
    function(event)
        dcm_dispatcher(event.entity, "create")
    end,
    {
        {filter="name", name = "vtk-deepcore-mining-drill-advanced"}
    }
)

-- ore patches toggle and adcmd companion management on removed drill
script.on_event(events.on_entity_died,
    function(event)
        dcm_dispatcher(event.entity, "remove")
    end,
    {
        {filter="name", name = "vtk-deepcore-mining-drill-advanced"}
    }
)
script.on_event(events.on_player_mined_entity,
    function(event)
        dcm_dispatcher(event.entity, "remove")
    end,
    {
        {filter="name", name = "vtk-deepcore-mining-drill-advanced"}
    }
)
script.on_event(events.on_robot_pre_mined,
    function(event)
        dcm_dispatcher(event.entity, "remove")
    end,
    {
        {filter="name", name = "vtk-deepcore-mining-drill-advanced"}
    }
)

-- on mod update fixes
script.on_configuration_changed(function(data)
    --[[ if data.mod_changes["vtk-deep-core-mining"] and data.mod_changes["vtk-deep-core-mining"].old_version ~= nil then
        local current = v(data.mod_changes["vtk-deep-core-mining"].old_version)
        if current < v(1,8,2) then
            upgrade182(data)
        end
        if current < v(2,0,0) then
            upgrade200(data)
        end
        if current < v(2,2,0) then
            upgrade220(data)
        end
    end ]]
    -- init ADCMD list
    init_globals()
end)

-- init ADCMD list
script.on_init(function()
    init_globals()
end)

-- check power on adcmd energy interface companions every few and then
script.on_nth_tick(120, 
    function(event)
        adcmd_updater()
    end
)
