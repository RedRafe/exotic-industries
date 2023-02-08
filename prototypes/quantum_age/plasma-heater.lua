ei_data = require("lib/data")

--====================================================================================================
--PLASMA HEATER
--====================================================================================================

data:extend({
    {
        name = "ei_plasma-heater",
        type = "recipe-category",
    },
    {
        name = "ei_plasma-heater",
        type = "item",
        icon = ei_graphics_item_path.."plasma-heater.png",
        icon_size = 64,
        subgroup = "production-machine",
        order = "d-a-c-5",
        place_result = "ei_plasma-heater",
        stack_size = 50
    },
    {
        name = "ei_plasma-heater",
        type = "recipe",
        category = "crafting",
        energy_required = 4,
        ingredients =
        {
            {"ei_insulated-tank", 2},
            {"ei_arc-furnace", 1},
            {"ei_magnet", 20},
            {"ei_steel-mechanical-parts", 18}
        },
        result = "ei_plasma-heater",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_plasma-heater",
    },
    {
        name = "ei_plasma-heater",
        type = "technology",
        icon = ei_graphics_tech_path.."plasma-heater.png",
        icon_size = 256,
        prerequisites = {"ei_quantum-computer"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_plasma-heater"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_protium"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_heated-protium"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_heated-deuterium"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_heated-tritium"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_heated-helium-3"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_plasma-data:protium"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_plasma-data:deuterium"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_plasma-data:tritium"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["quantum-age"],
            time = 20
        },
        age = "quantum-age",
    },
    {
        name = "ei_plasma-heater",
        type = "furnace",
        icon = ei_graphics_item_path.."plasma-heater.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 1,
            result = "ei_plasma-heater"
        },
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
        selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
        map_color = ei_data.colors.assembler,
        crafting_categories = {"ei_arc-furnace", "ei_plasma-heater"},
        crafting_speed = 1,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
        },
        energy_usage = "20MW",
        result_inventory_size = 1,
        source_inventory_size = 1,
        allowed_effects = {"speed", "consumption", "pollution"},
        module_specification = {
            module_slots = 2
        },
        fluid_boxes = {
            
            {   
                base_area = 1,
                base_level = -1,
                height = 2,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_big_insulated,
                pipe_connections = {
                    {type = "input", position = {3, 0}},
                },
                production_type = "input",
            },
            {   
                base_area = 1,
                base_level = 1,
                height = 2,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_big_insulated,
                pipe_connections = {
                    {type = "output", position = {-3, 0}},
                },
                production_type = "output",
            },
            off_when_no_fluid_recipe = true
        },
        animation = {
            filename = ei_graphics_entity_path.."plasma-heater.png",
            size = {512,512},
            shift = {0, 0},
	        scale = 0.35,
            line_length = 1,
            --lines_per_file = 2,
            frame_count = 1,
            -- animation_speed = 0.2,
        },
        working_visualisations = {
            {
              animation = 
              {
                filename = ei_graphics_entity_path.."plasma-heater_animation.png",
                size = {512,512},
                shift = {0, 0},
	            scale = 0.35,
                line_length = 4,
                lines_per_file = 4,
                frame_count = 16,
                animation_speed = 0.4,
                run_mode = "backward",
              }
            },
            {
                light = {
                type = "basic",
                intensity = 1,
                size = 15
                }
            }
        },
        working_sound =
        {
            sound = {filename = "__base__/sound/electric-furnace.ogg", volume = 0.6},
            apparent_volume = 0.3,
        },
    },
    {
        name = "ei_protium",
        type = "recipe",
        category = "oil-processing",
        energy_required = 0.5,
        ingredients = {
            {type = "fluid", name = "ei_hydrogen-gas", amount = 5},
        },
        results = {
            {type = "fluid", name = "ei_protium", amount = 10, probability = 0.9998},
            {type = "fluid", name = "ei_deuterium", amount = 10, probability = 0.001},
            {type = "fluid", name = "ei_tritium", amount = 10, probability = 0.0001},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_protium",
    },
    {
        name = "ei_heated-protium",
        type = "recipe",
        category = "ei_plasma-heater",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "ei_protium", amount = 1},
        },
        results = {
            {type = "fluid", name = "ei_heated-protium", amount = ei_data.fusion.plasma_per_unit},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_heated-protium",
    },
    {
        name = "ei_heated-deuterium",
        type = "recipe",
        category = "ei_plasma-heater",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "ei_deuterium", amount = 1},
        },
        results = {
            {type = "fluid", name = "ei_heated-deuterium", amount = ei_data.fusion.plasma_per_unit},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_heated-deuterium",
    },
    {
        name = "ei_heated-tritium",
        type = "recipe",
        category = "ei_plasma-heater",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "ei_tritium", amount = 1},
        },
        results = {
            {type = "fluid", name = "ei_heated-tritium", amount = ei_data.fusion.plasma_per_unit},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_heated-tritium",
    },
    {
        name = "ei_heated-helium-3",
        type = "recipe",
        category = "ei_plasma-heater",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "ei_helium-3", amount = 1},
        },
        results = {
            {type = "fluid", name = "ei_heated-helium-3", amount = ei_data.fusion.plasma_per_unit},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_heated-helium-3",
    },
    {
        name = "ei_plasma-data",
        type = "item",
        icon = ei_graphics_item_path.."plasma-data.png",
        icon_size = 128,
        subgroup = "ei_refining-tech",
        order = "a-a-e",
        stack_size = 200,
        pictures = {
            layers =
            {
              {
                size = 128,
                filename = ei_graphics_item_path.."plasma-data.png",
                scale = 0.25/2
              },
              {
                draw_as_light = true,
                flags = {"light"},
                size = 128,
                filename = ei_graphics_item_path.."plasma-data_light.png",
                scale = 0.25/2
              }
            }
          },
    },
    {
        name = "ei_plasma-data:protium",
        type = "recipe",
        category = "ei_quantum-computer",
        energy_required = 5,
        ingredients = {
            {type = "fluid", name = "ei_computing-power", amount = 200},
            {type = "fluid", name = "ei_liquid-nitrogen", amount = 200},
            {type = "fluid", name = "ei_heated-protium", amount = 80},
            {type = "item", name = "stone", amount = 20},
        },
        results = {
            {type = "item", name = "ei_plasma-data", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_plasma-data",
    },
    {
        name = "ei_plasma-data:deuterium",
        type = "recipe",
        category = "ei_quantum-computer",
        energy_required = 5,
        ingredients = {
            {type = "fluid", name = "ei_computing-power", amount = 200},
            {type = "fluid", name = "ei_liquid-nitrogen", amount = 200},
            {type = "fluid", name = "ei_heated-deuterium", amount = 1},
            {type = "item", name = "stone", amount = 20},
        },
        results = {
            {type = "item", name = "ei_plasma-data", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_plasma-data",
    },
    {
        name = "ei_plasma-data:tritium",
        type = "recipe",
        category = "ei_quantum-computer",
        energy_required = 5,
        ingredients = {
            {type = "fluid", name = "ei_computing-power", amount = 200},
            {type = "fluid", name = "ei_liquid-nitrogen", amount = 200},
            {type = "fluid", name = "ei_heated-tritium", amount = 1},
            {type = "item", name = "stone", amount = 20},
        },
        results = {
            {type = "item", name = "ei_plasma-data", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_plasma-data",
    },
})