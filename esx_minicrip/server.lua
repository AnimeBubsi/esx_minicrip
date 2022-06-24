ESX  = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('esx_minicrip:rikki')
AddEventHandler('esx_minicrip:rikki', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local puhelin = xPlayer.getInventoryItem('phone').count
    local radio = xPlayer.getInventoryItem('radio').count

    if puhelin > 0 then
        xPlayer.addInventoryItem('rphone', puhelin)
        xPlayer.removeInventoryItem('phone', puhelin)
	xPlayer.showNotification('Vesi ~r~rikkoi puhelimesi')
    elseif radio > 0 then
	xPlayer.addInventoryItem('rradio', radio)
        xPlayer.removeInventoryItem('radio', radio)
        xPlayer.showNotification('Vesi ~r~rikkoi radiosi')
  end
end)

RegisterServerEvent('esx_minicrip:Radio')
AddEventHandler('esx_minicrip:Radio', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.addInventoryItem('radio', 1)
        xPlayer.addInventoryItem('mcp', 1)
        xPlayer.removeInventoryItem('mcpr',1)
end)

RegisterServerEvent('esx_minicrip:Puhelin')
AddEventHandler('esx_minicrip:Puhelin', function()
        local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.addInventoryItem('phone', 1)
        xPlayer.addInventoryItem('mcp', 1)
        xPlayer.removeInventoryItem('mcpp',1)
end)

ESX.RegisterUsableItem('mcp', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local puhelin = xPlayer.getInventoryItem('phone').count
    local radio = xPlayer.getInventoryItem('radio').count
  
    if radio > 0 then
	TriggerClientEvent('esx_minicrip:pakkausR', source)
        xPlayer.removeInventoryItem('radio', 1)
        xPlayer.addInventoryItem('mcpr', 1)
	xPlayer.removeInventoryItem('mcp', 1)
    elseif puhelin > 0 then
	TriggerClientEvent('esx_minicrip:pakkausP', source)
        xPlayer.removeInventoryItem('phone',1)
        xPlayer.addInventoryItem('mcpp', 1)
	xPlayer.removeInventoryItem('mcp', 1)
    elseif radio == 0 and puhelin == 0 then
        xPlayer.showNotification('Sinulla ei ole radiota eikä puhelinta')
    else
        xPlayer.ShowNotification('jokin meni pieleen')
   end
end)

ESX.RegisterUsableItem('mcpr', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('esx_minicrip:poistoR', source)
	Citizen.Wait(3000)

	xPlayer.addInventoryItem('radio', 1)
        xPlayer.addInventoryItem('mcp', 1)
        xPlayer.removeInventoryItem('mcpr',1)
	xPlayer.showNotification('Otit radion pois pussista')

end)

ESX.RegisterUsableItem('mcpp', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('esx_minicrip:poistoP', source)
	Citizen.Wait(3000)

	xPlayer.addInventoryItem('phone', 1)
        xPlayer.addInventoryItem('mcp', 1)
        xPlayer.removeInventoryItem('mcpp',1)
	xPlayer.showNotification('Otit puhelimen pois pussista')

end)