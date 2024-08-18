local propModel = "prop_cs_heist_bag_02"
local choiceAppearance = "illenium-appearance"  -- fivem-appearance / illenium-appearance
local labelPickup = "Pick up bag"
local iconPickup = "fa-solid fa-hand-back-fist"
local labelUse = "Use bag"
local iconUse = "fa-solid fa-shirt" 
local oxT = exports.ox_target
local ox = exports.ox_inventory

local function openOutfitBag()
    local playerPed = cache.ped 

    TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD")

    if choiceAppearance == 'illenium-appearance' then
        TriggerEvent("illenium-appearance:client:openOutfitMenu", function()
            OpenMenu(nil, "outfit")
        end)
    elseif choiceAppearance == 'fivem-appearance' then
        exports['fivem-appearance']:openWardrobe()
    end
end

local function placeOutfitBag()

    lib.requestAnimDict("pickup_object")
    lib.requestModel(propModel)

    local playerPed = cache.ped
    local coords = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 0.5, 0.0)

    TaskPlayAnim(playerPed, "pickup_object", "pickup_low", 8.0, 8.0, 1000, 50, 0, false, false, false)

    Wait(900)

    local outfitbag = CreateObjectNoOffset(propModel, coords.x, coords.y, coords.z, true, false)
    PlaceObjectOnGroundProperly(outfitbag)

    oxT:addLocalEntity(outfitbag, {
        {
            name = 'useBag_' .. outfitbag,
            label = labelUse,
            icon = iconUse,
            onSelect = function(data)
                openOutfitBag()
            end
        },
        {
            name = 'closeBag_' .. outfitbag,
            label = labelPickup,
            icon = iconPickup,
            onSelect = function(data)

                TaskPlayAnim(playerPed, "pickup_object", "pickup_low", 8.0, 8.0, 1000, 50, 0, false, false, false)
                Wait(900)
                DeleteEntity(data.entity)
                ClearPedTasks(playerPed)

                TriggerServerEvent('krs_outfitbag:addItems', 1)
            end
        },
    })
end

exports('outfitbag', function(data, slot)
    ox:useItem(data, function(success)
        if success then
            placeOutfitBag()
            print(json.encode(data, {indent = true}))
        end
    end)
end)