ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(5000)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)


function menu()


    
    local shopillegal = RageUI.CreateMenu("Shop Ilégal","Shop Ilégal")
    local arme = RageUI.CreateSubMenu(shopillegal, "Armes à feu", "Armes à feu")
    local blanche = RageUI.CreateSubMenu(shopillegal, "Armes Blanches", "Armes Blanches")




    RageUI.Visible(shopillegal, not RageUI.Visible(shopillegal))

    while shopillegal do
        
        Citizen.Wait(0)

        RageUI.IsVisible(shopillegal,true,true,true,function()

            RageUI.Separator("____________________")

            RageUI.ButtonWithStyle("Armes à feu", nil, {RightLabel = "→→→"}, true, function(Hovered, Active, Selected)
            end,arme)

            RageUI.ButtonWithStyle("Armes Blanches", nil, {RightLabel = "→→→"}, true, function(Hovered, Active, Selected)
            end,blanche)







         
        end, function()
        end)

        RageUI.IsVisible(arme,true,true,true,function()

            RageUI.Separator("____________________")

            for k,v in pairs(Shop.armefeu) do
                RageUI.ButtonWithStyle(v.Label, nil, {RightLabel = "~g~"..(v.Price).."$"}, true, function(Hovered, Active, Selected)
                  if (Selected) then
                      TriggerServerEvent('treifa:illegal', v.Name, v.Price)
                    end
                end)
            end


         
        end, function()
        end)

        RageUI.IsVisible(blanche,true,true,true,function()

            RageUI.Separator("____________________")

            for k,v in pairs(Shop.armeblanche) do
                RageUI.ButtonWithStyle(v.Label, nil, {RightLabel = "~g~"..(v.Price).."$"}, true, function(Hovered, Active, Selected)
                  if (Selected) then
                      TriggerServerEvent('treifa:illegal', v.Name, v.Price)
                    end
                end)
            end




         
        end, function()
        end)

       

        


       
        if not RageUI.Visible(shopillegal) and not RageUI.Visible(arme) and not RageUI.Visible(blanche) then
            shopillegal=RMenu:DeleteType("treifa", true)
        end

    end

end

Citizen.CreateThread(function()
    while true do
        local Timer = 500
        local plyCoords3 = GetEntityCoords(GetPlayerPed(-1), false)
        local dist3 = Vdist(plyCoords3.x, plyCoords3.y, plyCoords3.z, trf_emploi.pos.Menu.position.x, trf_emploi.pos.Menu.position.y, trf_emploi.pos.Menu.position.z)
            if dist3 <= 3.0 then
            Timer = 0   
                RageUI.Text({ message = "Appuyez sur ~b~[E]~s~ pour accéder au Shop Ilégal", time_display = 1 })
                if IsControlJustPressed(1,51) then
                 TriggerEvent('esx:showAdvancedNotification', "Shop Ilégal", "Chargement" , 'Scan de vos données...', 'CHAR_ILLEGAL')
                 Citizen.Wait(2000)
                 menu()
                end   
            end
    Citizen.Wait(Timer)
 end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey(trf_emploi.Peds)
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVMALE", trf_emploi.Peds, trf_emploi.pos.Peds.position.x, trf_emploi.pos.Peds.position.y, trf_emploi.pos.Peds.position.z, trf_emploi.pos.Peds.position.h, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, 1)
end)