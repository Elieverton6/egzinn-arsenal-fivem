local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

inMenu = true
local Menu = true
local player = PlayerPedId()

local arsenal = {
	{ 461.88, -983.08, 30.69 },
	{ 470.20706176758,-1086.1563720703,38.706546783447 },
	{ -2050.4089355469,-456.18185424805,16.424406051636 }, 
}

if Menu then
	Citizen.CreateThread(function()
	while true do
		Wait(0)
		for _,lugares in pairs(arsenal) do
			local x,y,z = table.unpack(lugares)
			local distance = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),x,y,z,true)
			DrawMarker(22,x,y+0.01,z-0.20,0,0,0,0,180.0,170.0,1.0,1.0,1.0,25,25,122,100,1,0,0,0)
			if distance <= 2 then
				if IsControlJustPressed(0, 51) then
					TriggerServerEvent('egzinn-arsenal:permissao')
				end
			end
		end
	end
		if IsControlJustPressed(1, 3) then
		  inMenu = false
		  SetNuiFocus(false)
		  SendNUIMessage({type = 'close'})
		end
	end)
end

RegisterNetEvent('egzinn-arsenal:permissao')
AddEventHandler('egzinn-arsenal:permissao',function()
	inMenu = true
	SetNuiFocus(true, true)
	SendNUIMessage({type = 'openGeneral'})
end)

RegisterNUICallback('NUIFocusOff', function()
  inMenu = false
  SetNuiFocus(false)
  SendNUIMessage({type = 'closeAll'})
end)

-- callbacks das armas --

RegisterNUICallback('kit-egzinn6', function()
	local ped = PlayerPedId()
	GiveWeaponToPed(ped,GetHashKey("WEAPON_NIGHTSTICK"),1,0,0)
	GiveWeaponToPed(ped,GetHashKey("WEAPON_STUNGUN"),1,0,0)
end)

RegisterNUICallback('colete-egzinn6', function()
	TriggerServerEvent('egzinn-arsenal:colete')
end)

RegisterNUICallback('teaser-egzinn6', function()
	local ped = PlayerPedId()
	GiveWeaponToPed(ped,GetHashKey("WEAPON_STUNGUN"),1,0,0)
end)

RegisterNUICallback('lanterna-egzinn6"', function()
	local ped = PlayerPedId()
	GiveWeaponToPed(ped,GetHashKey("WEAPON_FLASHLIGHT"),0,0,0)
end)

RegisterNUICallback('cacetete-egzinn6', function()
	local ped = PlayerPedId()
	GiveWeaponToPed(ped,GetHashKey("WEAPON_NIGHTSTICK"),1,0,1)
end)

RegisterNUICallback('glock-egzinn6', function()
	local ped = PlayerPedId()
	GiveWeaponToPed(ped,GetHashKey("WEAPON_COMBATPISTOL"),100,0,1)
end)

RegisterNUICallback('carbinerifle-egzinn6', function()
	local ped = PlayerPedId()
	GiveWeaponToPed(ped,GetHashKey("WEAPON_CARBINERIFLE"),200,0,1)
end)

RegisterNUICallback('pdw-egzinn6', function()
	local ped = PlayerPedId()
	GiveWeaponToPed(ped,GetHashKey("WEAPON_COMBATPDW"),200,0,1)
end)

RegisterNUICallback('ak47-egzinn6', function()
	local ped = PlayerPedId()
	GiveWeaponToPed(ped,GetHashKey("WEAPON_ASSAULTRIFLE"),200,0,1)
end)

RegisterNUICallback('mp5-egzinn6', function()
	local ped = PlayerPedId()
	GiveWeaponToPed(ped,GetHashKey("WEAPON_SMG"),200,0,1)
end)

RegisterNUICallback('limpar-armas-egzinn6', function()
	local ped = PlayerPedId()
	RemoveAllPedWeapons(ped,true)
end)