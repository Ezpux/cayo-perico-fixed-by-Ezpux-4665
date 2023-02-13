-- Made By KrizFrost
local IslandZone = BoxZone:Create(vector3(5113.64, -5141.78, 2.25), 2900, 2900, {
    name = "island",
    heading = 0,
    debugPoly = false
})

local insideIslandZone = false

Citizen.CreateThread(function()
    while true do
        local plyPed = PlayerPedId()
        local coord = GetEntityCoords(plyPed)
        insideIslandZone = IslandZone:isPointInside(coord)
        Citizen.Wait(500)
    end
end)

IslandZone:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
    if isPointInside then
        WaterOverrideSetStrength(1.0)
    else
        WaterOverrideSetStrength(0.0)
    end
end)