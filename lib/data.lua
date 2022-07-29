-- store data like switch tables and other constants/parameters here
-- excluding global table stuff

local ei_data = {}

ei_data.tech_scaling = {}
ei_data.science = {}
ei_data.tech_structure = {}

--====================================================================================================
--TECH SCALING
--====================================================================================================

ei_data.tech_scaling.switch_table = {
    ["Very Cheap"]      =   1000,
    ["More Cheap"]      =   2500,
    ["Cheap"]           =   5000,
    ["Default"]         =  10000,
    ["Less Expensive"]  =  25000,
    ["Expensive"]       =  50000,
    ["Very Expensive"]  = 100000
}

--====================================================================================================
--SCIENCE PACKS
--====================================================================================================

-- science packs that are needed to research techs from their respective ages

ei_data.science["dark-age"] = {
    {"automation-science-pack",1},
}

ei_data.science["steam-age"] = {
    {"logistic-science-pack",1},
}

ei_data.science["electricity-age"] = {
    {"chemical-science-pack",1},
}

ei_data.science["computer-age"] = {
    {"production-science-pack",1},
}

ei_data.science["quantum-age"] = {
    {"utility-science-pack",1},
}

ei_data.science["exotic-age"] = {
    {"space-science-pack",1},
}

--====================================================================================================
--AGE STRUCTURE
--====================================================================================================

ei_data.ages = {
    "dark-age",
    "steam-age",
    "electricity-age",
    "computer-age",
    "quantum-age",
    "exotic-age"
}

-- store which age comes after which
-- used to make dummy techs

ei_data.ages_dummy_dict = {
    ["dark-age"] = "steam-age",
    ["steam-age"] = "electricity-age",
    ["electricity-age"] = "computer-age",
    ["computer-age"] = "quantum-age",
    ["quantum-age"] = "exotic-age",
}

--====================================================================================================
--ROUGH TECH STRUCTURE
--====================================================================================================

-- list tech names for their respective ages here

ei_data.tech_structure["dark-age"] = {
    "gun-turret",
    "heavy-armor",
    "logistics",
    "military",
}

ei_data.tech_structure["steam-age"] = {
    "automation",
    "electronics",
    -- steel furnace
    "advanced-material-processing",
    -- train
    "automated-rail-transportation",
    "rail-signals",
    "railway",
    "braking-force-1",
    "braking-force-2",
    "weapon-shooting-speed-1",
    "weapon-shooting-speed-2",
    "physical-projectile-damage-1",
    "physical-projectile-damage-2",
    "automobilism",
    "engine",
    "flamethrower",
    "flammables",
    "refined-flammables-1",
    "refined-flammables-2",
    "stronger-explosives-1",
    "stronger-explosives-2",
    "fluid-handling",
    "fluid-wagon",
    "tank",
    "gate",
    "stone-wall",
    "inserter-capacity-bonus-1",
    "research-speed-1",
    "landfill",
    "oil-processing",
    "steel-axe",
    "steel-processing",
    "toolbelt",
    "military-2",

}

ei_data.tech_structure["electricity-age"] = {
    -- red circ
    "advanced-electronics",
    -- electric furnace
    "advanced-material-processing-2",
    "automation-2",
    "battery",
    "battery-equipment",
    "belt-immunity-equipment",
    "energy-shield-equipment",
    "exoskeleton-equipment",
    "night-vision-equipment",
    "personal-roboport-equipment",
    "modular-armor",
    "power-armor",
    "braking-force-3",
    "braking-force-4",
    "braking-force-5",
    "circuit-network",
    "explosives",
    "stronger-explosives-3",
    "refined-flammables-3",
    "refined-flammables-4",
    "physical-projectile-damage-3",
    "physical-projectile-damage-4",
    "land-mine",
    "cliff-explosives",
    "concrete",
    "logistic-system",
    "worker-robots-speed-1",
    "worker-robots-speed-2",
    "electric-energy-accumulators",
    "electric-energy-distribution-1",
    "electric-energy-distribution-2",
    "electric-engine",
    "lubricant",
    "fast-inserter",
    "inserter-capacity-bonus-2",
    "research-speed-2",
    "optics",
    "laser",
    "laser-turret",
    "personal-laser-defense-equipment",
    "laser-shooting-speed-1",
    "laser-shooting-speed-2",
    "laser-shooting-speed-3",
    "weapon-shooting-speed-3",
    "weapon-shooting-speed-4",
    "logistics-2",
    "mining-productivity-1",
    "nuclear-power",
    "uranium-ammo",
    "uranium-processing",
    "nuclear-fuel-reprocessing",
    "plastics",
    "sulfur-processing",
    "solar-energy",
    "solar-panel-equipment",
    "military-3",
    "advanced-oil-processing",
    "coal-liquefaction",
    "defender",
    "destroyer",
    "discharge-defense-equipment",
    "distractor",
    "energy-weapons-damage-1",
    "energy-weapons-damage-2",
    "explosive-rocketry",
    "follower-robot-count-1",
    "follower-robot-count-2",
    

}

ei_data.tech_structure["computer-age"] = {
    -- green circ
    "advanced-electronics-2",
    "automation-3",
    "battery-mk2-equipment",
    "energy-shield-mk2-equipment",
    "power-armor-mk2",
    "personal-roboport-mk2-equipment",
    "braking-force-6",
    "braking-force-7",
    "modules",
    "effect-transmission",
    "effectivity-module",
    "effectivity-module-2",
    "effectivity-module-3",
    "productivity-module",
    "productivity-module-2",
    "productivity-module-3",
    "speed-module",
    "speed-module-2",
    "speed-module-3",
    "inserter-capacity-bonus-3",
    "inserter-capacity-bonus-4",
    "stronger-explosives-4",
    "stronger-explosives-5",
    "research-speed-3",
    "research-speed-4",
    "refined-flammables-5",
    "refined-flammables-6",
    "weapon-shooting-speed-5",
    "weapon-shooting-speed-6",
    "physical-projectile-damage-5",
    "physical-projectile-damage-6",
    "laser-shooting-speed-4",
    "laser-shooting-speed-5",
    "laser-shooting-speed-6",
    "laser-shooting-speed-7",
    "worker-robots-speed-3",
    "worker-robots-speed-4",
    "worker-robots-storage-1",
    "worker-robots-storage-2",
    "energy-weapons-damage-3",
    "energy-weapons-damage-4",
    "robotics",
    "logistic-robotics",
    "construction-robotics",
    "logistics-3",
    "low-density-structure",
    "mining-productivity-2",
    "rocket-control-unit",
    "rocket-fuel",
    "rocket-silo",
    "rocketry",
    "spidertron",
    "stack-inserter",
    "military-4",
    "artillery",
    "artillery-shell-range-1",
    "artillery-shell-speed-1",
    "follower-robot-count-3",
    "follower-robot-count-4",

}

ei_data.tech_structure["quantum-age"] = {
    "atomic-bomb",
    "fusion-reactor-equipment",
    "inserter-capacity-bonus-5",
    "inserter-capacity-bonus-6",
    "inserter-capacity-bonus-7",
    "worker-robots-speed-5",
    "worker-robots-speed-6",
    "worker-robots-storage-3",
    "refined-flammables-7",
    "physical-projectile-damage-7",
    "research-speed-5",
    "research-speed-6",
    "stronger-explosives-6",
    "stronger-explosives-7",
    "mining-productivity-3",
    "mining-productivity-4",
    "energy-weapons-damage-5",
    "energy-weapons-damage-6",
    "energy-weapons-damage-7",
    "follower-robot-count-5",
    "follower-robot-count-6",
    "follower-robot-count-7",

}

ei_data.tech_structure["exotic-age"] = {

}

return ei_data