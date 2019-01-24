local sulfuricacidname = "sulfuric-acid"
if mods["angelspetrochem"] then
    sulfuricacidname = "liquid-sulfuric-acid"
end

-- item
data:extend({
    {
        type = "item",
        name = "vtk-deepcore-mining-drill",
        icon = "__vtk-deep-core-mining__/graphics/icons/deepcore-mine.png",
        icon_size = 32,
        flags = {"goes-to-quickbar"},
        subgroup = "extraction-machine",
        order = "v[items]-d1[vtk-deepcore-mining-drill]",
        place_result = "vtk-deepcore-mining-drill",
        stack_size = 25
    },
    {
        type = "item",
        name = "vtk-deepcore-mining-drill-advanced",
        icon = "__vtk-deep-core-mining__/graphics/icons/deepcore-mine-advanced.png",
        icon_size = 32,
        flags = {"goes-to-quickbar"},
        subgroup = "extraction-machine",
        order = "v[items]-d2[vtk-deepcore-mining-drill-advanced]",
        place_result = "vtk-deepcore-mining-drill-advanced",
        stack_size = 10
    },
    {
        type = "item",
        name = "vtk-deepcore-mining-drone",
        icon = "__vtk-deep-core-mining__/graphics/icons/mining-drone.png",
        icon_size = 32,
        flags = {"goes-to-main-inventory"},
        subgroup = "intermediate-product",
        order = "v[vtk-deepcore-mining-drone]",
        stack_size = 50
    },
    {
        type = "item",
        name = "vtk-deepcore-mining-ore-chunk",
        icon = "__vtk-deep-core-mining__/graphics/icons/deepcore-ore-chunk.png",
        icon_size = 32,
        flags = {"goes-to-main-inventory"},
        subgroup = "raw-resource",
        order = "vz[vtk-deepcore-mining-ore-chunk]",
        stack_size = 100
    }
})

local i = 1
for ore, oredata in pairs(vtk_deepcoremining_supported_ores) do
  local oretint = nil
  if oredata.tint then
    if data.raw.resource[ore].tint then
      oretint = data.raw.resource[ore].tint
    else
      oretint = data.raw.resource[ore].map_color
    end
  end

  local ore_patch = 
    {
        type = "item",
    name = "vtk-deepcore-mining-"..ore.."-chunk",
    icons = {
    {
        icon = "__vtk-deep-core-mining__/graphics/icons/"..oredata.img.."-chunk.png",
        tint = oretint
      }
    },
        icon_size = 32,
        flags = {"goes-to-main-inventory"},
        subgroup = "raw-resource",
    order = "va[vtk-deepcore-mining-chunk-"..i.."]",
        stack_size = 100
  }
  data:extend({
    ore_patch, 

})
  i = i + 1
end

-- planner
data:extend({
    {
        type = "selection-tool",
        name = "vtk-deepcore-mining-planner",
        icon = "__vtk-deep-core-mining__/graphics/icons/mining-drone-blueprint.png",
        icon_size = 32,
        stack_size = 1,
        subgroup = "tool",
        order = "v[automated-construction]-d[deep-core-mining]",
        flags = {"goes-to-quickbar"},
        selection_color = {r = 1.0, g = 0.2, b = 1.0, a = 0.3},
        alt_selection_color = {r = 0.2, g = 0.8, b = 0.3, a = 0.3},
        selection_mode = {"any-entity"},
        alt_selection_mode = {"any-entity"},
        selection_cursor_box_type = "entity",
        alt_selection_cursor_box_type = "entity"
    },
    {
        type = "recipe",
        name = "vtk-deepcore-mining-planner",
        enabled = false,
        energy_required = 1,
        ingredients =
        {
            {"advanced-circuit", 5},
            {"vtk-deepcore-mining-drone", 5}
        },
        result = "vtk-deepcore-mining-planner"
    }
})

-- recipe
data:extend({
    {
        type = "recipe",
        name = "vtk-deepcore-mining-drill",
        enabled = false,
        energy_required = 100,
        ingredients =
        {
            {"electric-mining-drill", 10},
            {"steel-plate", 20},
            {"advanced-circuit", 5},
            {"vtk-deepcore-mining-drone", 10}
        },
        result = "vtk-deepcore-mining-drill",
    },
    {
        type = "recipe",
        name = "vtk-deepcore-mining-drill-advanced",
        enabled = false,
        energy_required = 100,
        ingredients =
        {
            {"vtk-deepcore-mining-drill", 10},
            {"steel-plate", 100},
            {"processing-unit", 20},
            {"vtk-deepcore-mining-drone", 50}
        },
        result = "vtk-deepcore-mining-drill-advanced",
    },
    {
        type = "recipe",
        name = "vtk-deepcore-mining-drone",
        enabled = false,
        energy_required = 10,
        ingredients =
        {
            {"flying-robot-frame", 1},
            {"electric-mining-drill", 1},
            {"advanced-circuit", 1}
        },
        result = "vtk-deepcore-mining-drone",
    },
    {
        type = "recipe",
        name = "vtk-deepcore-mining-ore-chunk-refining",
        energy_required = 30,
        enabled = false,
        category = "centrifuging",
        ingredients = {
            {"vtk-deepcore-mining-ore-chunk", 100},
            {"vtk-deepcore-mining-drone", 1}
        },
        icons = {
          {
            icon = "__vtk-deep-core-mining__/graphics/icons/deepcore-ore-chunk-refining.png"
          },
          {
            icon = "__vtk-deep-core-mining__/graphics/icons/acid.png"
          }
        },
        icon_size = 32,
        subgroup = "intermediate-product",
        order = "v[vtk-deepcore-mining]-a[deepcore-ore-processing]",
        main_product = "",
        results =
        {
        },
        allow_decomposition = false
    },
})

for ore, oredata in pairs(vtk_deepcoremining_supported_ores) do
    table.insert(data.raw['recipe']['vtk-deepcore-mining-ore-chunk-refining']['results'], {name = "vtk-deepcore-mining-"..ore.."-chunk", probability = oredata.probability, amount = 10 })

    -- on the fly focus deep core chunk refining recipes creation
    local ore_chunk_focus_recipe = table.deepcopy(data.raw['recipe']['vtk-deepcore-mining-ore-chunk-refining'])
    ore_chunk_focus_recipe.name = 'vtk-deepcore-mining-ore-chunk-refining-'..ore..'-focus'
    -- focused refining is wasteful and will only get half the result amount compared to the non focused refining method but guarrantee the ore type refinied
    ore_chunk_focus_recipe.incredients['vtk-deepcore-mining-ore-chunk'] = 200
    ore_chunk_focus_recipe.results = {{name = "vtk-deepcore-mining-"..ore.."-chunk", amount = math.ceil(6 * (oredata.refineamount / 100) * oredata.probability)}}

    -- tint "generic" ores (like bobs)
    local oretint = nil
    if oredata.tint then
        if data.raw.resource[ore].tint then
            oretint = data.raw.resource[ore].tint
        else
            oretint = data.raw.resource[ore].map_color
        end
        table.insert(ore_chunk_focus_recipe.icons, {icon = "__vtk-deep-core-mining__/graphics/icons/"..oredata.img.."-focus.png", tint = oretint})
    else
        table.insert(ore_chunk_focus_recipe.icons, {icon = "__vtk-deep-core-mining__/graphics/icons/"..oredata.img.."-focus.png"})
    end
    data:extend({ore_chunk_focus_recipe})
end

local function chunk_refining_recipe_maker(
  ore_name, 
  ore_icon, 
  refining_result, 
  result_amount, 
  refining_liquid, 
  refining_liquid_amount, 
  oretint
)
    local recipe =
    {
        type = "recipe",
        name = "vtk-deepcore-mining-"..ore_name.."-chunk-refining",
        enabled = false,
        energy_required = 5,
        category = "chemistry",
        subgroup = "raw-material",
        ingredients = 
        {
            {"vtk-deepcore-mining-"..ore_name.."-chunk", 1},
            {type="fluid", name=refining_liquid, amount=refining_liquid_amount},
        },
        main_product = "", -- to force use of recipe locales and icons instead of result's
        icons = {
          {
            icon = "__vtk-deep-core-mining__/graphics/icons/"..ore_icon.."-chunk-refining.png", 
            tint = oretint
          },
          {
            icon = "__vtk-deep-core-mining__/graphics/icons/acid.png",
          }
        },
        icon_size = 32,
        results = 
        {
            {type="item", name=refining_result, amount=result_amount/4}, 
            {type="item", name=refining_result, amount=result_amount/4}, 
            {type="item", name=refining_result, amount=result_amount/4}, 
            {type="item", name=refining_result, amount=result_amount/4}, 
        },
        crafting_machine_tint =
        {
            -- primary = {r = 0.000, g = 0.680, b = 0.894, a = 0.000}, -- #00ade45b -- to change?
            -- secondary = {r = 0.700, g = 0.130, b = 0.180, a = 0.357}, -- steel blue #4682B4
            -- tertiary = {r = 0.430, g = 0.805, b = 0.726, a = 0.000}, -- #6dcdb900 -- to change?
            primay = oretint,
            secondary = oretint,
            tertiary = oretint,
        }
    }
    
    return recipe
end

for ore, oredata in pairs(vtk_deepcoremining_supported_ores) do
  local oretint = nil
  if oredata.tint then
    if data.raw.resource[ore].tint then
        oretint = data.raw.resource[ore].tint
    else
        oretint = data.raw.resource[ore].map_color
    end
  end
  
  local ore_chunk_refining_recipe = chunk_refining_recipe_maker(
    ore,                  -- ore_name : used for recipe name "-chunk-refining" and ingredient "-chunk")
    oredata.img,          -- ore refining icon "-chunk-refining.png
    oredata.result,       -- result
    oredata.refineamount, -- result amount
    sulfuricacidname,     -- refining liquid
    oredata.refineliquid, -- refining liquid amount
    oretint               -- tint
    -- {r = 0.700, g = 0.130, b = 0.180, a = 0.357}, -- steel blue #4682B4
)

data:extend({
    ore_chunk_refining_recipe
})
end

-- entity
data:extend({
    {
        type = "mining-drill",
        name = "vtk-deepcore-mining-drill",
        icon = "__vtk-deep-core-mining__/graphics/icons/deepcore-mine.png",
        icon_size = 32,
        flags = {
            "placeable-neutral",
            "placeable-player",
            "player-creation",
        },
        minable = {mining_time = 5, result = "vtk-deepcore-mining-drill"},
        resource_categories = {"vtk-deepcore-mining-ore-patch"},
        max_health = 3000,
        dying_explosion = "massive-explosion",
        corpse = "big-remnants",
        
        collision_box = {{ -2.1, -2.1}, {2.1, 2.5}},
        selection_box = {{ -2.5, -2.5}, {2.5, 2.5}},
        drawing_box = {{-2.5, -2.5}, {2.5, 2.5}},
        
        vehicle_impact_sound =    { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        
        mining_speed = 0.5,
        mining_power = 15,
        resource_searching_radius = 0.49,
        
        rotatable = false,
        supports_direction = false,
        
        input_fluid_box =
        {
            production_type = "input",
            --pipe_picture = assembler2pipepictures(),
            pipe_covers = pipecoverspictures(),
            base_area = 10, -- = x 100 fluid storage
            --height = 10, -- ??
            base_level = 1,-- so it requires a pump to inject
            pipe_connections =
            {
                { position = {1, 3} },
            }
        },
        
        energy_usage = "1MW",
        energy_source =
        {
            type = "electric",
            -- will produce this much * energy pollution units per tick
            emissions = 0.15,
            usage_priority = "secondary-input",
        },
        vector_to_place_result = {-2, 3},
        base_picture =
        {
            sheet =
            {
                filename = "__vtk-deep-core-mining__/graphics/entity/deepcore-mine-sheet.png",
                priority = "high",
                width = 330,
                height = 400,
                shift = util.by_pixel(8, -8),
                scale = 0.50
            }
        },
        animations =
        {
            north =
            {
                priority = "low",
                width = 120, 
                height = 122, 
                line_length = 7,
	            -- shift = util.by_pixel(9, 33),
	            shift = util.by_pixel(7, 30),
                filename = "__vtk-deep-core-mining__/graphics/entity/deepcore-miner-drill-animation.png",
                frame_count = 20,
                run_mode = "forward", 
                animation_speed = 0.50,
                scale = 0.50,
                
            }
        },
        input_fluid_patch_sprites =
        {
            north =
            {
                priority = "extra-high",
                filename = "__vtk-deep-core-mining__/graphics/entity/deepcore-mine-pipe.png",
                line_length = 1,
                width = 330,
                height = 400,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(8, -8),
                scale = 0.5
            }, 
            south =
            {
                priority = "extra-high",
                filename = "__vtk-deep-core-mining__/graphics/entity/deepcore-mine-pipe.png",
                line_length = 1,
                width = 330,
                height = 400,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(8, -8),
                scale = 0.5
            }, 
            east =
            {
                priority = "extra-high",
                filename = "__vtk-deep-core-mining__/graphics/entity/deepcore-mine-pipe.png",
                line_length = 1,
                width = 330,
                height = 400,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(8, -8),
                scale = 0.5
            }, 
            west =
            {
                priority = "extra-high",
                filename = "__vtk-deep-core-mining__/graphics/entity/deepcore-mine-pipe.png",
                line_length = 1,
                width = 330,
                height = 400,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(8, -8),
                scale = 0.5
            }, 
        },
        working_sound =
        {
            sound =
            {
                filename = "__base__/sound/electric-mining-drill.ogg",
                volume = 1.5
            },
            match_speed_to_activity = true,
            apparent_volume = 2.5,
        },
        module_specification = { module_slots = 2 },
        allowed_effects = {"productivity", "consumption", "pollution"}, 
        radius_visualisation_picture =
        {
            filename = "__base__/graphics/entity/pumpjack/pumpjack-radius-visualization.png",
            width = 12,
            height = 12
        },
        monitor_visualization_tint = {r=78, g=173, b=255},
        -- fast_replaceable_group = "vtk-deepcore-mining-drill",
        --[[
        circuit_wire_connection_points =
        {
            get_circuit_connector_wire_shifting_for_connector({-0.09375, -1.65625}, {-0.09375, -1.65625}, 4),
            get_circuit_connector_wire_shifting_for_connector({1.28125, -0.40625},    {1.28125, -0.40625},    2),
            get_circuit_connector_wire_shifting_for_connector({0.09375, 1},                 {0.09375, 1},                 0),
            get_circuit_connector_wire_shifting_for_connector({-1.3125, -0.3125},     {-1.3125, -0.3125},     6)
        },
        circuit_connector_sprites =
        {
            get_circuit_connector_sprites({-0.09375, -1.65625}, {-0.09375, -1.65625}, 4),
            get_circuit_connector_sprites({1.28125, -0.40625},    {1.28125, -0.40625},    2),
            get_circuit_connector_sprites({0.09375, 1},                 {0.09375, 1},                 0),
            get_circuit_connector_sprites({-1.3125, -0.3125},     {-1.3125, -0.3125},     6)
        },
        circuit_wire_max_distance = 9,
        --]]
        
        circuit_wire_connection_points = circuit_connector_definitions["pumpjack"].points,
        circuit_connector_sprites = circuit_connector_definitions["pumpjack"].sprites,
        circuit_wire_max_distance = 14,
    },
    {
        type = "mining-drill",
        name = "vtk-deepcore-mining-drill-advanced",
        icon = "__vtk-deep-core-mining__/graphics/icons/deepcore-mine-advanced.png",
        icon_size = 32,
        flags = {
            "placeable-neutral",
            "placeable-player",
            "player-creation",
        },
        minable = {mining_time = 10, result = "vtk-deepcore-mining-drill-advanced"},
        resource_categories = {"vtk-deepcore-mining-crack"},
        max_health = 10000,
        dying_explosion = "massive-explosion",
        corpse = "big-remnants",
        
        collision_box = {{ -4.1, -4.1}, {4.1, 4.5}},
        selection_box = {{ -4.5, -4.5}, {4.5, 4.5}},
        drawing_box = {{-4.5, -4.5}, {4.5, 4.5}},
        
        vehicle_impact_sound =    { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        
        mining_speed = 1,
        mining_power = 60,
        resource_searching_radius = 0.49,
        
        rotatable = false,
        supports_direction = false,
        
        input_fluid_box =
        {
            production_type = "input",
            --pipe_picture = assembler2pipepictures(),
            pipe_covers = pipecoverspictures(),
            base_area = 10, -- = x 100 fluid storage
            --height = 10, -- ??
            base_level = 1,-- so it requires a pump to inject
            pipe_connections =
            {
                { position = {-5, 3} },
            }
        },
        
        energy_usage = "10MW",
        energy_source =
        {
            type = "electric",
            -- will produce this much * energy pollution units per tick
            emissions = 0.15,
            usage_priority = "secondary-input",
        },
        vector_to_place_result = {0, 5},
        base_picture =
        {
            sheet =
            {
                filename = "__vtk-deep-core-mining__/graphics/entity/deepcore-miner-advanced-sheet.png",
                priority = "high",
                width = 380, 
                height = 380,
                --shift = util.by_pixel(8, -8),
                scale = 0.90
            }
        },
        animations =
        {
            north =
            {
                priority = "extra-high",
                width = 380, 
                height = 380, 
                line_length = 1,
	            -- shift = util.by_pixel(9, 33),
                filename = "__vtk-deep-core-mining__/graphics/entity/deepcore-miner-advanced.png",
                frame_count = 1,
                animation_speed = 1,
                scale = 0.90
            }
        },
        working_sound =
        {
            activate_sound =
            {
                filename = "__vtk-deep-core-mining__/sounds/advdeepcore_start.ogg",
                volume = 2
            },
            deactivate_sound =
            {
                filename = "__vtk-deep-core-mining__/sounds/advdeepcore_stop.ogg",
                volume = 2
            },
            sound =
            {
                filename = "__vtk-deep-core-mining__/sounds/advdeepcore_working.ogg",
                volume = 2
            },
            -- match_volume_to_activity = true,
            match_speed_to_activity = true,
            audible_distance_modifier = 1,
        },
        module_specification = { module_slots = 2 },
        allowed_effects = {"productivity", "consumption", "pollution"}, 
        -- module_specification = { module_slots = 0 },
        -- allowed_effects = nil, 
        radius_visualisation_picture =
        {
            filename = "__base__/graphics/entity/pumpjack/pumpjack-radius-visualization.png",
            width = 12,
            height = 12
        },
        monitor_visualization_tint = {r=78, g=173, b=255},
        -- fast_replaceable_group = "vtk-deepcore-mining-drill-advanced",
        circuit_wire_connection_points = circuit_connector_definitions["pumpjack"].points,
        circuit_connector_sprites = circuit_connector_definitions["pumpjack"].sprites,
        circuit_wire_max_distance = 14,
    }
})

if not settings.startup["vtk-deep-core-mining-allow-rotation"].value then
    table.insert(data.raw["mining-drill"]["vtk-deepcore-mining-drill"].flags, "not-rotatable")
    table.insert(data.raw["mining-drill"]["vtk-deepcore-mining-drill-advanced"].flags, "not-rotatable")
end