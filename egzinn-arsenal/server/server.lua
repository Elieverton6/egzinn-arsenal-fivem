local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

local armas = {
}

RegisterServerEvent('egzinn-arsenal:permissao')
AddEventHandler('egzinn-arsenal:permissao', function()
	local src = source
	local user_id = vRP.getUserId(src)
	if vRP.hasPermission(user_id,"policia.permissao") then
		TriggerClientEvent('egzinn-arsenal:permissao', src)
	end
end)

RegisterServerEvent('egzinn-arsenal:colete')
AddEventHandler('egzinn-arsenal:colete', function()
	local src = source
	local user_id = vRP.getUserId(src)
	if vRP.hasPermission(user_id,"policia.permissao") then
		local colete = 100
		vRPclient.setArmour(src,100)
		vRP.setUData(user_id,"vRP:colete", json.encode(colete))
	end
end)
