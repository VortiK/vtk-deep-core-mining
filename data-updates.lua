require("prototypes.deepcore-mining-supported-ore")

require("prototypes.deepcore-mining-resources")
require("prototypes.deepcore-mining-refining")
require("prototypes.deepcore-mining-technology")
require("prototypes.deepcore-mining-exceptions-bobs")
require("prototypes.deepcore-mining-exceptions-ir2")

-- TOTO : put in an exceptions-aai prototype
-- Disallow AAI vehicles to mine resource-category vtk-deepcore-mining-ore-patch and vtk-deepcore-mining-crack
--[[
if mods["aai-vehicles-miner"] then
  for _, resource in pairs(data.raw.resource) do

    if resource.category ~= nil and string.match(resource.category, "vtk-deepcore-mining") then
      settings.global["vehicle-mining-disallow-resources"].value = settings.global["vehicle-mining-disallow-resources"].value .. " " .. resource.name 
    end
  end
end
]]--
