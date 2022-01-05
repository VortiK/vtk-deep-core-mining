local sounds = require("__base__/prototypes/entity/sounds")


data:extend({
    {
        type = "item-subgroup",
        name = "vtk-deepcore-mining",
        group = "intermediate-products",
        order = "v",
    },
})

--
-- Deep Core Items
-- 
data:extend({
    {
        type = "item",
        name = "vtk-deepcore-mining-moho",
        icon = "__vtk-deep-core-mining__/graphics/icons/deepcore-moho-icon.png",
        icon_size = 64,
        subgroup = "extraction-machine",
        order = "v[items]-d1[vtk-deepcore-mining-moho]",
        place_result = "vtk-deepcore-mining-moho",
        stack_size = 25
    },
    {
        type = "item",
        name = "vtk-deepcore-mining-drill",
        icon = "__vtk-deep-core-mining__/graphics/icons/deepcore-mine.png",
        icon_size = 64,
        subgroup = "extraction-machine",
        order = "v[items]-d2[vtk-deepcore-mining-drill]",
        place_result = "vtk-deepcore-mining-drill",
        stack_size = 25
    },
    {
        type = "item",
        name = "vtk-deepcore-mining-drill-advanced",
        icon = "__vtk-deep-core-mining__/graphics/icons/deepcore-mine-advanced.png",
        icon_size = 64,
        subgroup = "extraction-machine",
        order = "v[items]-d3[vtk-deepcore-mining-drill-advanced]",
        place_result = "vtk-deepcore-mining-drill-advanced",
        stack_size = 10
    },
    {
        type = "fuel-category",
        name = "vtk-deepcore-mining-drone"
    },
    {
        type = "item",
        name = "vtk-deepcore-mining-drone",
        icon = "__vtk-deep-core-mining__/graphics/icons/mining-drone.png",
        icon_size = 64,
        fuel_value = '120MJ',
        fuel_category = 'vtk-deepcore-mining-drone',
        subgroup = "vtk-deepcore-mining",
        order = "v[items]-a1",
        stack_size = 50
    }
})

-- planner
data:extend({
    {
        type = "selection-tool",
        name = "vtk-deepcore-mining-planner",
        icon = "__vtk-deep-core-mining__/graphics/icons/mining-drone-blueprint.png",
        icon_size = 64,
        stack_size = 1,
        subgroup = "vtk-deepcore-mining",
        order = "v[items]-a2",
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

-- 
-- Deep Core Item Recipe
-- 
data:extend({
    {
        type = "recipe",
        name = "vtk-deepcore-mining-moho",
        enabled = false,
        energy_required = 80,
        ingredients =
        {
            {"electric-mining-drill", 10},
            {"steel-plate", 20},
            {"advanced-circuit", 10},
            {"vtk-deepcore-mining-drone", 10}
        },
        result = "vtk-deepcore-mining-moho",
    },
    {
        type = "recipe",
        name = "vtk-deepcore-mining-drill",
        enabled = false,
        energy_required = 100,
        ingredients =
        {
            {"electric-mining-drill", 20},
            {"steel-plate", 20},
            {"advanced-circuit", 20},
            {"vtk-deepcore-mining-drone", 20}
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
            {"electric-mining-drill", 50},
            {"steel-plate", 50},
            {"processing-unit", 50},
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
})

-- 
-- Deep Core Entities
-- 

data:extend({
    {
        type = "corpse",
        name = "vtk-deepcore-mining-drill-remnants",
        localised_name = {"entity-name.big-remnants"},
        icon = "__base__/graphics/icons/remnants.png",
        icon_size = 64, icon_mipmaps = 4,
        flags = {"placeable-neutral", "not-on-map"},
        subgroup = "generic-remnants",
        order = "a-c-a",
        collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        tile_width = 3,
        tile_height = 3,
        selectable_in_game = false,
        time_before_removed = 60 * 60 * 60 * 1000, -- 1000 hours
        final_render_layer = "remnants",
        remove_on_tile_placement = true,
        animation =
        {
            {
                width = 330,
                height = 400,
                frame_count = 1,
                direction_count = 1,
                filename = "__vtk-deep-core-mining__/graphics/entity/deepcore-mine-ruin.png",
                scale = 0.50
            },
        }
    },
    {
        type = "mining-drill",
        name = "vtk-deepcore-mining-moho",
        icon = "__vtk-deep-core-mining__/graphics/icons/deepcore-moho-icon.png",
        icon_size = 64,
        flags = {
            "placeable-neutral",
            "placeable-player",
            "player-creation",
        },
        minable = {mining_time = 5, result = "vtk-deepcore-mining-moho"},
        resource_categories = {"vtk-deepcore-mining-ore-patch"},
        max_health = 1500,
        dying_explosion = "massive-explosion",
        corpse = "big-remnants",

        -- for collision box * .45
        -- for selection box * .5
        -- for drawing box * .5 should work

        collision_box = {{ -2.25, -2.25 }, { 2.25, 2.25 }},
        selection_box = {{ -2.5, -2.5 }, { 2.5, 2.5 }},
        drawing_box = {{-2.5, -2.5}, {2.5, 2.5}},
        
        vehicle_impact_sound = sounds.generic_impact,
        open_sound = sounds.machine_open,
        close_sound = sounds.machine_close,

        mining_speed = 5,
        resource_searching_radius = 0.49,
        
        rotatable = false,
        supports_direction = false,
        input_fluid_box =
        {
            production_type = "input",
            pipe_picture = assembler2pipepictures(),
            pipe_covers = pipecoverspictures(),
            base_area = 10, 
            base_level = 0,
            pipe_connections = {{ position = {1, 3} },}
        },
        
        energy_usage = settings.startup["vtk-deep-core-mining-moho-energy"].value.."MW", -- default 2
        energy_source =
        {
            type = "electric",
            emissions_per_minute = settings.startup["vtk-deep-core-mining-moho-pollution"].value, -- default 200
            usage_priority = "secondary-input",
        },
        vector_to_place_result = {-2, 3},
        base_picture =
        {
            sheet =
            {
                filename = "__vtk-deep-core-mining__/graphics/entity/deepcore-moho-sheet.png",
                width = 256,
                height = 256,
                shift = util.by_pixel(10, 0),
                scale = 0.70
            }
        },
        animations =
        {
            north =
            {
                width = 120, 
                height = 122, 
                line_length = 7,
                shift = util.by_pixel(15, 20),
                filename = "__vtk-deep-core-mining__/graphics/entity/deepcore-miner-drill-animation.png",
                frame_count = 20,
                run_mode = "forward", 
                animation_speed = 0.50,
                scale = 0.45,
            },
        },
        working_sound =
        {
            sound =
            {
                filename = "__base__/sound/electric-mining-drill.ogg",
                volume = 0.8
            },
            match_speed_to_activity = true,
            audible_distance_modifier = 1,
        },
        module_specification = { module_slots = 2 },
        allowed_effects = {"consumption", "pollution"}, 
        radius_visualisation_picture =
        {
            filename = "__base__/graphics/entity/pumpjack/pumpjack-radius-visualization.png",
            width = 12,
            height = 12
        },
        monitor_visualization_tint = {r=78, g=173, b=255},
        circuit_wire_connection_points = circuit_connector_definitions["pumpjack"].points,
        circuit_connector_sprites = circuit_connector_definitions["pumpjack"].sprites,
        circuit_wire_max_distance = 14,
    },
    {
        type = "mining-drill",
        name = "vtk-deepcore-mining-drill",
        icon = "__vtk-deep-core-mining__/graphics/icons/deepcore-mine.png",
        icon_size = 64,
        flags = {
            "placeable-neutral",
            "placeable-player",
            "player-creation",
        },
        minable = {mining_time = 5, result = "vtk-deepcore-mining-drill"},
        resource_categories = {"vtk-deepcore-mining-ore-patch"},
        max_health = 3000,
        dying_explosion = "massive-explosion",
        corpse = "vtk-deepcore-mining-drill-remnants",
        
        collision_box = {{ -2.1, -2.1}, {2.1, 2.5}},
        selection_box = {{ -2.5, -2.5}, {2.5, 2.5}},
        drawing_box = {{-2.5, -2.5}, {2.5, 2.5}},
        
        vehicle_impact_sound = sounds.generic_impact,
        open_sound = sounds.machine_open,
        close_sound = sounds.machine_close,

        mining_speed = 5,
        resource_searching_radius = 0.49,
        
        rotatable = false,
        supports_direction = false,
        
        input_fluid_box =
        {
            production_type = "input",
            pipe_picture = assembler2pipepictures(),
            pipe_covers = pipecoverspictures(),
            --pipe_picture = assembler2pipepictures(),
            --pipe_covers = pipecoverspictures(),
            base_area = 10, -- = x 100 fluid storage
            --height = 10, -- ??
            --base_level = 1,-- so it requires a pump to inject
            base_level = 0,
            pipe_connections =
            {
                { position = {1, 3} },
            }
        },
        
        energy_usage = settings.startup["vtk-deep-core-mining-deepcore-energy"].value.."MW", -- default 10 MW
        energy_source =
        {
            type = "electric",
            emissions_per_minute = settings.startup["vtk-deep-core-mining-deepcore-pollution"].value, -- default 500,
            usage_priority = "secondary-input",
        },
        vector_to_place_result = {-2, 3},
        base_picture =
        {
            sheet =
            {
                filename = "__vtk-deep-core-mining__/graphics/entity/deepcore-mine-sheet.png",
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
            },
        },

        input_fluid_patch_sprites =
        {
            north =
            {
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
                volume = 0.8
            },
            match_speed_to_activity = true,
            audible_distance_modifier = 1,
        },
        module_specification = { module_slots = 2 },
        allowed_effects = {"consumption", "pollution"}, 
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
        icon_size = 64,
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
        
        vehicle_impact_sound = sounds.generic_impact,
        open_sound = sounds.machine_open,
        close_sound = sounds.machine_close,

        mining_speed = 10,
        resource_searching_radius = 0.49,
        
        rotatable = false,
        supports_direction = false,
        
        input_fluid_box =
        {
            production_type = "input",
            pipe_picture = assembler2pipepictures(),
            pipe_covers = pipecoverspictures(),
            base_area = 100, -- = x 100 fluid storage
            --height = 10, -- ??
            -- base_level = 1,-- so it requires a pump to inject
            base_level = 0,
            pipe_connections =
            {
                { position = {-5, 3} },
            }
        },
        energy_usage = "10MW",
        energy_source =
        {
            type = "burner",
            fuel_category = "vtk-deepcore-mining-drone",
            effectivity = 1,
            fuel_inventory_size = 1,
            emissions_per_minute = settings.startup["vtk-deep-core-mining-deepcore-advanced-pollution"].value, -- default 1000,
            smoke =
            {
              {
                  name = "smoke",
                  north_position = {-1.6, -4},
                  east_position = {-1.6, -4},
                  west_position = {-1.6, -4},
                  south_position = {-1.6, -4},
                  frequency = 60,
                  starting_vertical_speed = 0.02,
                  movement_slow_down_factor  = 0.8,
                  starting_frame_deviation = 30,
                  fade_in_duration = 60,
                  spread_duration = 100,
                  fade_away_duration = 100,
                  start_scale = 2,
                  color = {r = 0.6, g = 0.6, b = 0.3, a = 0.7},
              }
            },
        },
        vector_to_place_result = {0, 5},
        base_picture =
        {
            sheet =
            {
                filename = "__vtk-deep-core-mining__/graphics/entity/deepcore-miner-advanced-sheet.png",
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
                width = 380, 
                height = 380, 
                line_length = 5,
                -- shift = util.by_pixel(9, 33),
                filename = "__vtk-deep-core-mining__/graphics/entity/deepcore-miner-advanced-animation.png",
                frame_count = 10,
                animation_speed = 1,
                scale = 0.90
            }
        },
        working_sound =
        {
            activate_sound =
            {
                filename = "__vtk-deep-core-mining__/sounds/advdeepcore_start.ogg",
                volume = 0.8
            },
            deactivate_sound =
            {
                filename = "__vtk-deep-core-mining__/sounds/advdeepcore_stop.ogg",
                volume = 0.8
            },
            sound =
            {
                filename = "__vtk-deep-core-mining__/sounds/advdeepcore_working.ogg",
                volume = 0.8
            },
            -- match_volume_to_activity = true,
            match_speed_to_activity = true,
            audible_distance_modifier = 1,
        },
        module_specification = { module_slots = 2 },
        allowed_effects = {"consumption", "pollution"}, 
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
    },
    {
        type = "electric-energy-interface",
        name = "vtk-deepcore-mining-drill-advanced-energy-companion",
        flags = {
            "not-on-map",
            "not-deconstructable",
            "not-blueprintable",
            "hidden",
            "no-copy-paste",
            "not-selectable-in-game",
        },
        destructible = false,
        minable = nil,
        icon = "__vtk-deep-core-mining__/graphics/icons/deepcore-mine-advanced.png",
        icon_size = 64,
        energy_source =
        {
            type = "electric",
            emissions_per_minute = 0,
            usage_priority = "primary-input",
            buffer_capacity = settings.startup["vtk-deep-core-mining-deepcore-advanced-energy"].value.."MW",
            input_flow_limit = settings.startup["vtk-deep-core-mining-deepcore-advanced-energy"].value.."MW",
            output_flow_limit = "0kW",
        },
        energy_usage = settings.startup["vtk-deep-core-mining-deepcore-advanced-energy"].value.."MW",
        energy_production = "0GW",
        collision_box = {{ -4.1, -4.1}, {4.1, 4.5}},
    }
})

if not settings.startup["vtk-deep-core-mining-allow-rotation"].value then
    table.insert(data.raw["mining-drill"]["vtk-deepcore-mining-moho"].flags, "not-rotatable")
    table.insert(data.raw["mining-drill"]["vtk-deepcore-mining-drill"].flags, "not-rotatable")
    table.insert(data.raw["mining-drill"]["vtk-deepcore-mining-drill-advanced"].flags, "not-rotatable")
end
