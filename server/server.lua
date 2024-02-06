-- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
-- ██ ██ ██ ▄▄▄ █ ▄▄▀██ ▄▄▀██ █████ ▄▄▄███▄ ▄█▄▄ ▄▄██ ▄▄▄██ ▄▀▄ 
-- ██ ██ ██▄▄▄▀▀█ ▀▀ ██ ▄▄▀██ █████ ▄▄▄████ ████ ████ ▄▄▄██ █ █ 
-- ██▄▀▀▄██ ▀▀▀ █ ██ ██ ▀▀ ██ ▀▀ ██ ▀▀▀███▀ ▀███ ████ ▀▀▀██ ███ 
-- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀

local ox = exports.ox_inventory

local outfitbag = 'outfitbag'

ESX.RegisterUsableItem(outfitbag, function(source)
    local src = source
    ox:RemoveItem(src, outfitbag, 1)
    TriggerClientEvent('krs_outfitbag:removeItems', src, outfitbag)
end)

RegisterNetEvent('krs_outfitbag:addItems', function(source)
    local src = source
    ox:AddItem(src, outfitbag, 1)
end)