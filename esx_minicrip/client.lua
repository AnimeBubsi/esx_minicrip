ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_minicrip:pakkausP')
AddEventHandler('esx_minicrip:pakkausP', function()
	if Config.Animaatio then
 	ExecuteCommand("e uncuff")
        exports['progressBars']:startUI(3000, 'Pakkaat Puhelinta')
        Citizen.Wait(3000)
        ClearPedTasksImmediately(PlayerPedId())
	TriggerServerEvent('esx_minicrip:Mrikki', source)
	else
	TriggerServerEvent('esx_minicrip:Mrikki', source)
   end
end)

RegisterNetEvent('esx_minicrip:pakkausR')
AddEventHandler('esx_minicrip:pakkausR', function()
	if Config.Animaatio then
 	ExecuteCommand("e uncuff")
        exports['progressBars']:startUI(3000, 'Pakkaat Radiota')
        Citizen.Wait(3000)
        ClearPedTasksImmediately(PlayerPedId())
	TriggerServerEvent('esx_minicrip:Mrikki', source)
	else
	TriggerServerEvent('esx_minicrip:Mrikki', source)
   end
end)

RegisterNetEvent('esx_minicrip:poistoP')
AddEventHandler('esx_minicrip:poistoP', function()
	if Config.Animaatio then
 	ExecuteCommand("e uncuff")
        exports['progressBars']:startUI(3000, 'Poistat puhelinta pussista')
        Citizen.Wait(3000)
        ClearPedTasksImmediately(PlayerPedId())
	TriggerServerEvent('esx_minicrip:Mrikki', source)
	else
	TriggerServerEvent('esx_minicrip:Mrikki', source)
   end
end)

RegisterNetEvent('esx_minicrip:poistoR')
AddEventHandler('esx_minicrip:poistoR', function()
	if Config.Animaatio then
 	ExecuteCommand("e uncuff")
        exports['progressBars']:startUI(3000, 'Poistat radiota pussista')
        Citizen.Wait(3000)
        ClearPedTasksImmediately(PlayerPedId())
	TriggerServerEvent('esx_minicrip:Mrikki', source)
	else
	TriggerServerEvent('esx_minicrip:Mrikki', source)
   end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if not IsPedInAnyVehicle(Pelaaja, false) then 
		if IsPedSwimming(PlayerPedId()) then
			TriggerServerEvent('esx_minicrip:rikki')
		   end
	 	end
	end
end)
