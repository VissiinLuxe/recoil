local luxe      = 300

local crosshair     = false     --//-- Crosshair päälle tai pois

local heilahdus       = 0.0       --//-- Näytön heilahdus ampuessa [0.0-1.0]

local isSniper        = {         --//-- Snipuihin kiikarihudi

    100416529,         --//-- WEAPON_SNIPERRIFLE

    205991906,         --//-- WEAPON_HEAVYSNIPER

    177293209,          --//-- WEAPON_HEAVYSNIPER_MK2

    -952879014,         --//-- WEAPON_MARKSMANRIFLE

    1785463520,         --//-- WEAPON_MARKSMANRIFLE_MK2

}

function HashInTable ( hash )

    for k, v in pairs ( isSniper ) do

        if ( hash == v ) then

            return true

        end

    end

    return false

end



function ManageCrosshair()

    local ped = GetPlayerPed ( -1 )

    local _, hash = GetCurrentPedWeapon( ped, true )

        if not HashInTable ( hash ) then

            HideHudComponentThisFrame( 14 )

        end

end


Citizen.CreateThread(function()

    while true do

        Citizen.Wait(5)

        local ped = GetPlayerPed( -1 )

        local ase = GetSelectedPedWeapon(ped)


        ManageCrosshair()


       
        if IsPedArmed(ped, 6) then
       
            DisableControlAction(1, 140, true)
       
            DisableControlAction(1, 141, true)    --// KOLKKAUKSEN POISTO
       
            DisableControlAction(1, 142, true)
       
        end


        DisplayAmmoThisFrame(false)
        
        end

end)

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(100)
      SetPlayerHealthRechargeMultiplier(PlayerId(), 0)  --// HEALTH REGENIN POISTO
    end
  end)



local rekyylit = {


	--//-- PISTOOLIT

    [453432689]     = 0.2,      -- PISTOL

    [-1075685676]   = 0.23,      -- PISTOL MK2

    [1593441988]    = 0.27,      -- COMBAT PISTOL

    [-1716589765]   = 0.85,      -- PISTOL .50

    [-1076751822]   = 0.1,      -- SNS PISTOL

    [-2009644972] 	= 0.16, 		-- SNS PISTOL MK2

    [-771403250]    = 0.32,      -- HEAVY PISTOL

    [137902532]     = 0.24,      -- VINTAGE PISTOL

    [-598887786]    = 4.7,      -- MARKSMAN PISTOL

    [-1045183535]   = 3.4,      -- REVOLVER

    [-879347409]    = 2.1,      -- REVOLVER MK2

    [584646201]     = 0.0,      -- AP PISTOL

    [-1746263880]   = 2.1,      -- DOUBLEACTION REVOLVER

    [911657153]     = 0.4,      -- TAZER


    --//-- SMGT

    [324215364]     = 0.06,      -- MICRO SMG

    [736523883]     = 0.1,      -- SMG

    [2024373456]    = 0.09,      -- SMG MK2

    [-1121678507]   = 0.12,      -- MINISMG

    [-270015777]    = 0.13,      -- ASSAULTSMG

    [-619010992]    = 0.09,      -- MACHINE PISTOL

    [171789620]     = 0.22,      -- COMBAT PDW


    --//-- RIFLET

    [-1074790547]   = 0.3,      -- ASSAULT RIFLE

    [961495388]     = 0.33,		-- ASSAULT RIFLE MK2
    
    [-2084633992]   = 0.27,  	-- CARBINE RIFLE 	
    	
    [-86904375]     = 0.3,      -- CARBINE RIFLE MK2
    
    [-1357824103]   = 0.19,      -- ADVANCED RIFLE
    
    [-1063057011]   = 0.23,      -- SPECIAL CARBINE
    
    [-1768145561]   = 0.24,      -- SPECIAL CARBINE MK2
    
    [2132975508]    = 0.2,      -- BULLPUP RIFLE
    
    [-2066285827]   = 0.19,      -- BULLPUP RIFLE MK2
    
    [1649403952]    = 0.13,      -- COMPACT RIFLE
    

    --//-- LMGT

    [-1660422300]   = 0.28,      -- MG

    [2144741730]    = 0.33,      -- COMBATMG

    [-608341376]    = 0.32,      -- COMBATMG MK2

    [1627465347]    = 0.13,      -- GUSENBERG


    --//-- HAULIKOT

    [487013001]     = 0.4,     -- PUMP SHOTGUN

    [1432025498]    = 0.4, 		-- PUMP SHOTGUN MK2
    
    [2017895192]    = 0.7, 		-- SAWNOFF SHOTGUN
    
    [-1654528753]   = 0.8, 		-- BULLPUP SHOTGUN
    
    [-494615257]    = 0.4, 		-- ASSAULT SHOTGUN
    
    [-1466123874]   = 3.5, 		-- MUSKET
    
    [984333226]     = 0.6, 		-- HEAVY SHOTGUN
    
    [-275439685]    = 1.1, 		-- DOUBLE BARREL SHOTGUN
    
    [317205821]     = 0.5,		-- SWEEPER SHOTGUN
    

    --//-- SNIPERIT

    [100416529]     = 2.2, 		-- SNIPER RIFLE

    [205991906]     = 4.0, 		-- HEAVY SNIPER
    
    [177293209]     = 6.0,		-- HEAVY SNIPER MK2
    
    [-952879014]    = 1.5,      -- MARKSMAN RIFLE
    
    [1785463520]    = 1.7,      -- MARKSMAN RIFLE MK2
    

    --//-- MUU SÄLÄ

    [-1568386805]   = 0.1,      -- GRENADE LAUNCHER

    [-1312131151]   = 6.5,      -- RPG

    [1119849093]    = 3.0,      -- MINIGUN

    [2138347493]    = 0.5, 		-- FIREWORK LAUNCHER

    [1834241177]    = 9.5, 		-- RAILGUN

    [1672152130]    = 8.1, 		-- HOMING LAUNCHER	
}



Citizen.CreateThread(function()

    
    while true do
    
        if IsPedArmed(PlayerPedId(), 6) then
    
            local isSniper = false
    
            local currentWeaponHash = GetSelectedPedWeapon(PlayerPedId())
    
            if currentWeaponHash == GetHashKey('WEAPON_MARKSMANRIFLE') then
    
                isSniper = true

            elseif currentWeaponHash == GetHashKey('WEAPON_MARKSMANRIFLE_MK2') then
    
                isSniper = true

            elseif currentWeaponHash == GetHashKey('WEAPON_HEAVYSNIPER') then
    
                isSniper = true
    
            elseif currentWeaponHash == GetHashKey('WEAPON_HEAVYSNIPER_MK2') then
    
                isSniper = true

            elseif currentWeaponHash == GetHashKey('WEAPON_SNIPERRIFLE') then
    
                isSniper = true
    
            end



            if not isSniper then

                HideHudComponentThisFrame(14)

            end

        else

            Wait(1000)

        end

        Wait(0)

    end

end)



Citizen.CreateThread(function()

    while true do

        Citizen.Wait(1)

        if IsPedShooting(PlayerPedId()) and not IsPedDoingDriveby(PlayerPedId()) then

            local _,pyssy = GetCurrentPedWeapon(PlayerPedId())

            _,luoti = GetAmmoInClip(PlayerPedId(), pyssy)

            if rekyylit[pyssy] and rekyylit[pyssy] ~= 0 then

                tv = 0

                if GetFollowPedCamViewMode() ~= 4 then

                    repeat 

                        Wait(5)

                        p = GetGameplayCamRelativePitch()

                        SetGameplayCamRelativePitch(p+0.1, 0.2)

                        tv = tv+0.1

                    until tv >= rekyylit[pyssy]

                else

                    repeat 

                        Wait(5)

                        p = GetGameplayCamRelativePitch()

                        if rekyylit[pyssy] > 0.1 then

                            SetGameplayCamRelativePitch(p+0.6, 1.2)

                            tv = tv+0.6

                        else

                            SetGameplayCamRelativePitch(p+0.016, 0.333)

                            tv = tv+0.1

                        end

                    until tv >= rekyylit[pyssy]

                end

            end

        end

    end

end)

Citizen.CreateThread(function()

    local odota = luxe

    math.random(GetGameTimer())

    while true do

        Citizen.Wait(odota)

        local ped = PlayerPedId()

        if IsPedArmed(PlayerPedId(), 6) then

            odota = 5

            if IsPedShooting(ped) then

                local _, pyssy = GetCurrentPedWeapon(ped)

                _, cpanos = GetAmmoInClip(ped, pyssy)

                if rekyylit[pyssy] and rekyylit[pyssy] ~= 0 then

                    tv = 0

                    repeat 

                        Wait(1)

                        x = GetGameplayCamRelativePitch()

                        local cx

                        if GetFollowVehicleCamViewMode() == 4 then

                            if IsPedDoingDriveby(ped) then

                                cx = math.random(100, 200)/100

                            else

                                cx = math.random(0, 100)/100

                            end

                        else

                            if IsPedDoingDriveby(ped) then

                                cx = math.random(250, 350)/100

                            else

                                cx = math.random(0, 100)/100

                            end

                        end


                        
                        SetGameplayCamRelativePitch(x+cx, 0.1)
                        
                        tv = tv+0.1

                    until tv >= rekyylit[pyssy]
                
                end
                
            end
            
        else
            
            odota = luxe
            
        end
        
    end
    
end)