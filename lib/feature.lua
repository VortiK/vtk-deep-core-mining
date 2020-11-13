local script_data =
{
    drills = {},
    next_index = nil
}

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
    script_data.drills[drill.unit_number] = drill
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
        local drill = script_data.drills[index]
        if drill then
            script_data.drills[index] = nil
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
        -- player.print(adcmd.name .." ".. adcmd.unit_number .." status : ".. drill.status)
        if companion.energy < companion.power_usage then
            drill.active = false
        else
            drill.active = true
        end
    end
end

function adcmd_updater()
    local index, drill = next( script_data.drills, script_data.next_index )
    if index then
        script_data.next_index = index
        if drill.valid then
            adcmd_energy_switcher(drill)
        end
    else
        script_data.next_index = nil
    end
end

function init_globals()
    -- [re]build the list of ADCMD entities
    for _, surface in pairs(game.surfaces) do
        for _, drill in ipairs(surface.find_entities_filtered({name="vtk-deepcore-mining-drill-advanced"})) do
            script_data.drills[drill.unit_number] = drill
        end
    end
end

function moho_hot_swapper(drill, mode)
    local surface = drill.surface
    local area = Position.expand_to_area(drill.position, 2)

    local patches = get_all_patches()
    
    local patchesCount = surface.count_entities_filtered{name = patches, area = area}
    local patchesFound = surface.find_entities_filtered{name = patches, area = area}

    -- debug
    -- local player = game.players[1]
    -- player.print("VTK-DEEP-CORE-MINING_DEBUG")
    -- player.print("found entity : " .. patchesCount)

    if patchesCount > 0 then
        for _, entity in pairs(patchesFound) do
            -- debug
            -- player.print("found entity : "..serpent.block(entity.name))
            -- player.print("found entity category : "..serpent.block(entity.prototype.resource_category))
            
            if entity.type == "resource"
            and entity.prototype.resource_category == "vtk-deepcore-mining-ore-patch" then
                if mode == "remove" then -- replace back to normal ore patch
                    swap_ore_patch(entity, "patch")
                -- else depending on drill type
                elseif(drill.name == "vtk-deepcore-mining-drill") then
                    swap_ore_patch(entity, "chunk")
                else
                    swap_ore_patch(entity, "ore")
                end
            end
        end
    end
end

function swap_ore_patch(entity, newpatch)
    -- ore
    -- patch
    -- chunk
    if string.sub(entity.name, -5) == newpatch
    or string.sub(entity.name, -3) == newpatch
    then
        -- patch is already the expected one, do nothing !
        return
    end
    
    local newentityname = entity.name
    if string.sub(entity.name, -3) == "ore" then
        newentityname = entity.name:sub(1, -5)
    elseif string.sub(entity.name, -5) == "chunk" then
        newentityname = entity.name:sub(1, -7)
    elseif string.sub(entity.name, -5) == "patch" then
        newentityname = entity.name.."-"..newpatch
    end
    
    -- debug
    -- local player = game.players[1]
    -- player.print("old entity : "..serpent.block(entity.name))
    -- player.print("new entity : "..serpent.block(newentityname))
    local newpatch = entity.surface.create_entity({name = newentityname, position = entity.position, force = entity.force})
    entity.destroy()
end

function dcm_dispatcher(entity, mode)
    if entity.name == "vtk-deepcore-mining-drill-advanced" then
        if mode == "remove" then
            adcmd_energy_companion_remove(entity)
        else
            adcmd_energy_companion_add(entity)
        end
    else
        moho_hot_swapper(entity, mode)
    end
end