
local ox = exports.ox_inventory

RegisterNetEvent('krs_outfitbag:addItems', function(source)
    local player = source
    ox:AddItem(player, 'outfitbag', 1)
end)