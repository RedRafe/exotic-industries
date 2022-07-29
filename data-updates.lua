--====================================================================================================
--PRE UPDATES
--====================================================================================================

-- info

ei_mod.stage = "data-updates"


--====================================================================================================
--CONTENT UPDATES
--====================================================================================================

-- reorganize vanilla data

-- remove vanilla resources from autoplace-controls
require("scripts/data-updates/vanilla_resources")
-- set science costs to startPrice and set prerequisite to "ei_temp" tech for vanilla techs
require("scripts/data-updates/tech_flattening")
-- set prerequisites of vanilla techs for IE
require("scripts/data-updates/tech_structure")