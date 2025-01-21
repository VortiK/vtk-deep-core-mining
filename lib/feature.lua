-- Factorio STD Lib
local Position = require('__vtk-deep-core-mining__/stdlib/area/position')
local string = require('__vtk-deep-core-mining__/stdlib/utils/string')

function adcmd_energy_companion_add(drill)
    local surface = drill.surface
    local force = drill.force
    local position = drill.position
    local companion = surface.create_entity({name = "vtk-deepcore-mining-drill-advanced-energy-companion", position = position, force = force})
    
    -- debug
    -- local player = game.players[1]
    -- player.print("VTK-DEEP-CORE-MINING_DEBUG")
    -- player.print("companion created : "..serpent.block(companion))
    
    -- add drill in list to update
    storage.vtkdcm_script_data.drills[drill.unit_number] = drill
end

function adcmd_energy_companion_remove(entity)
    local surface = entity.surface
    local area = Position.expand_to_area(entity.position, 4)
    local entitiesCount = surface.count_entities_filtered{name = "vtk-deepcore-mining-drill-advanced-energy-companion", area = area}
    local companion = surface.find_entities_filtered{name="vtk-deepcore-mining-drill-advanced-energy-companion", area = area}

    if entitiesCount > 0 then
        -- debug
        -- local player = game.players[1]
        -- player.print("VTK-DEEP-CORE-MINING_DEBUG")
        -- player.print("companion destroyed : "..serpent.block(companion))
        companion[1].destroy()
        
        -- remove drill from list to update
        local index = tostring( entity.unit_number )
        local drill = storage.vtkdcm_script_data.drills[index]
        if drill then
            storage.vtkdcm_script_data.drills[index] = nil
        end
    end
end

function adcmd_energy_switcher(drill)
    local surface = drill.surface
    local position = drill.position
    local area = Position.expand_to_area(position, 4)
    local entitiesCount = surface.count_entities_filtered{name = "vtk-deepcore-mining-drill-advanced-energy-companion", area = area}
    local adcmdcompanions = surface.find_entities_filtered{name="vtk-deepcore-mining-drill-advanced-energy-companion", area = area}
    
    if entitiesCount > 0 then
        local companion = adcmdcompanions[1]
        -- local player = game.players[1]
        -- player.print("VTK-DEEP-CORE-MINING_DEBUG")
        -- player.print(drill.name .." ".. drill.unit_number .." status : ".. drill.status)
        -- player.print(companion.name .." ".. companion.unit_number .." energy : ".. math.floor(companion.energy) .." power_usage : ".. math.floor(companion.power_usage))
        -- player.print(companion.name .." ".. companion.unit_number .." energy : ".. math.floor(companion.energy) .." power_usage : ".. math.floor(companion.power_usage))

        if math.floor(companion.energy) == math.floor(companion.power_usage) then
            drill.active = true
        else
            drill.active = false
        end
        
        if drill.status ~= 1 and drill.status ~= 41 then
            companion.active = false
        else
            companion.active = true
        end
    end
end

function adcmd_updater()
    local index, drill = next( storage.vtkdcm_script_data.drills, storage.vtkdcm_script_data.next_index )
    if index then
        storage.vtkdcm_script_data.next_index = index
        if drill.valid then
            adcmd_energy_switcher(drill)
        end
    else
        storage.vtkdcm_script_data.next_index = nil
    end
end

function init_globals()
    storage.vtkdcm_script_data =
    {
        drills = {},
        next_index = nil
    }

    -- [re]build the list of ADCMD entities
    for _, surface in pairs(game.surfaces) do
        for _, drill in ipairs(surface.find_entities_filtered({name="vtk-deepcore-mining-drill-advanced"})) do
            storage.vtkdcm_script_data.drills[drill.unit_number] = drill
        end
    end
end

function dcm_dispatcher(entity, mode)
    if mode == "remove" then
        adcmd_energy_companion_remove(entity)
    else
        adcmd_energy_companion_add(entity)
    end
end