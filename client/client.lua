local QBCore = exports['qb-core']:GetCoreObject()

PlayerJob = {}
local onDuty = false
local alcoholCount = 0
local blip = nil
local function installCheck()
	local items = { "fish","mince_meat","deerskin" }
	for k, v in pairs(items) do if QBCore.Shared.Items[v] == nil then print("Missing Item from QBCore.Shared.Items: '"..v.."'") end end
	if QBCore.Shared.Jobs["hyper"] == nil then print("Error: Job role not found - 'hyper'") end
	if Config.Debug then print((#Config.Chairs).." Total seating locations") print((#items).." Items required") end
end

local function jobCheck()
	canDo = true
	if not onDuty then TriggerEvent('QBCore:Notify', "Not clocked in!", 'error') canDo = false end
	return canDo
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
		installCheck()
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then if PlayerData.job.name == "hyper" then TriggerServerEvent("QBCore:ToggleDuty") end end
    end)
end)
RegisterNetEvent('QBCore:Client:OnJobUpdate') AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo) PlayerJob = JobInfo onDuty = PlayerJob.onduty end)
RegisterNetEvent('QBCore:Client:SetDuty') AddEventHandler('QBCore:Client:SetDuty', function(duty) onDuty = duty end)

AddEventHandler('onResourceStart', function(resource)
	installCheck()
    if GetCurrentResourceName() == resource then
		QBCore.Functions.GetPlayerData(function(PlayerData)
			PlayerJob = PlayerData.job
			if PlayerData.job.name == "hyper" then onDuty = PlayerJob.onduty end
		end)
    end
end)

CreateThread(function()
	local bossroles = {}
	for k, v in pairs(QBCore.Shared.Jobs["hyper"].grades) do
		if QBCore.Shared.Jobs["hyper"].grades[k].isboss == true then
			if bossroles["hyper"] ~= nil then
				if bossroles["hyper"] > tonumber(k) then bossroles["hyper"] = tonumber(k) end
			else bossroles["hyper"] = tonumber(k)	end
		end
	end
	for k, v in pairs(Config.Locations) do
		if Config.Locations[k].zoneEnable then
			JobLocation = PolyZone:Create(Config.Locations[k].zones, { name = Config.Locations[k].label, debugPoly = Config.Debug })
			JobLocation:onPlayerInOut(function(isPointInside) if not isPointInside and onDuty and PlayerJob.name == "hyper" then TriggerServerEvent("QBCore:ToggleDuty") end end)
		end
	end
	for k, v in pairs(Config.Locations) do
		if Config.Locations[k].zoneEnable then
			blip = AddBlipForCoord(Config.Locations[k].blip)
			SetBlipAsShortRange(blip, true)
			SetBlipSprite(blip, 107)
			SetBlipColour(blip, Config.Locations[k].blipcolor)
			SetBlipScale(blip, 0.7)
			SetBlipDisplay(blip,2)
			BeginTextCommandSetBlipName('STRING')
			AddTextComponentString("Hyper Market")
			EndTextCommandSetBlipName(blip)
		end
	end

	exports['qb-target']:AddCircleZone("hypermain", vector3(-1221.98, -1484.02, 4.37), 0.5, {
		name="hypermain",
		heading=160,
		debugPoly=false,
		useZ=true,
	}, {
		options = {
			{ 
				event = "hyper:stashmain",
				icon = "fas fa-circle",
				label = "Stash Main", 
				job = "hyper",
			},
			
		},
		distance = 1.8 
	})
	
	
	exports['qb-target']:AddBoxZone("hyperCoffee", vector3(-1228.23, -1481.86, 4.62), 0.5, 0.5, { name="hyperCoffee", heading = 202.61, debugPoly=Config.Debug, minZ=3.99, maxZ=5.19 },
		{ options = { { event = "qb-hyper:Menu:Coffee", icon = "fas fa-mug-hot", label = "Pour Coffee", job = "hyper" }, }, distance = 2.0 })

	exports['qb-target']:AddBoxZone("hyperoutfit", vector3(-1220.93, -1476.85, 4.51), 0.5, 0.5, { name="hyperoutfit", heading = 216.37, debugPoly=Config.Debug,  minZ=3.99, maxZ=5.19 },
	{ options = { {  event = "nv-outfits:client:openout", icon = "fas fa-tshirt", label = "Change Outfit", job='hyper' }, },  distance = 2.0 })

	exports['qb-target']:AddBoxZone("hyperFridge", vector3(-1223.02, -1478.87, 4.76), 0.5, 0.5, { name="hyperFridge", heading = 41.89, debugPoly=Config.Debug, minZ=3.99, maxZ=5.19 },
	{ options = { {  event = "qb-hyper:Stash", icon = "fas fa-temperature-low", label = "Open Fridge", stash = "Fridge", job = "hyper" }, }, distance = 1.0 })

	exports['qb-target']:AddBoxZone("hyperFridge1", vector3(-1222.35, -1479.74, 4.7), 0.5, 0.5, { name="hyperFridge1", heading = 236.89, debugPoly=Config.Debug, minZ=3.99, maxZ=5.19 },
	{ options = { {  event = "qb-hyper:Stash", icon = "fas fa-temperature-low", label = "Open Fridge", stash = "Fridge1", job = "hyper" }, }, distance = 1.0 })

	exports['qb-target']:AddBoxZone("hyperFridge2", vector3(-1221.68, -1480.73, 4.7), 0.9, 0.9, { name="hyperFridge2", heading = 236.89, debugPoly=Config.Debug, minZ=3.99, maxZ=5.19 },
	{ options = { {  event = "qb-hyper:Stash", icon = "fas fa-temperature-low", label = "Open Fridge", stash = "Fridge2", job = "hyper" }, }, distance = 1.0 })

	exports['qb-target']:AddBoxZone("hyperFridge3", vector3(-1223.2, -1484.81, 4.59), 0.5, 0.5, { name="hyperFridge3", heading = 236.89, debugPoly=Config.Debug, minZ=3.99, maxZ=5.19 },
	{ options = { {  event = "qb-hyper:Stash", icon = "fas fa-temperature-low", label = "Open Fridge", stash = "Fridge3", job = "hyper" }, }, distance = 1.0 })

	exports['qb-target']:AddBoxZone("hyperStorage", vector3(-1225.66, -1486.58, 4.58), 0.5, 0.5, { name="hyperStorage", heading = 90, debugPoly=Config.Debug, minZ=3.99, maxZ=5.19 },
		{ options = { {  event = "qb-hyper:Shop", icon = "fas fa-box-open", label = "Open Store", job = "hyper" }, }, distance = 2.0 })

	exports['qb-target']:AddBoxZone("hyperCounter1", vector3(-1225.78, -1484.4, 4.37), 0.5, 0.5, { name="hyperCounter1", heading = 209.7, debugPoly=Config.Debug, minZ=3.99, maxZ=5.19 },
		{ options = { { event = "qb-hyper:Stash", icon = "fas fa-hamburger", label = "Open Counter", stash = "Counter" }, }, distance = 2.0	})

	exports['qb-target']:AddBoxZone("hyperCounter2", vector3(-46.83, -1756.81, 29.1), 0.5, 0.5, { name="hyperCounter2", heading = 209.7, debugPoly=Config.Debug, minZ=3.99, maxZ=5.19 },
	{ options = { { event = "qb-hyper:Stash", icon = "fas fa-hamburger", label = "Open Counter", stash = "Counter" }, }, distance = 2.0	})

	exports['qb-target']:AddBoxZone("hyperBoard",vector3(-1223.5, -1481.68, 4.27), 0.7, 0.7, { name="hyperBoard", heading = 209.76, debugPoly=Config.Debug, minZ=3.99, maxZ=5.19 },
		{ options = { { event = "qb-hyper:Menu:hyperBoard", icon = "fas fa-utensils", label = "Prepare Food", job = "hyper" }, }, distance = 2.0 })

	exports['qb-target']:AddBoxZone("hyperClockin", vector3(-1220.61, -1482.8, 4.44), 0.7, 0.7, { name="hyperClockin", heading = 299.74, debugPoly=Config.Debug, minZ=3.99, maxZ=5.19 },
		{ options = { { type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = "Toggle Duty", job = "hyper" },
					  --{ event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-clipboard-check", label = "Open Bossmenu", job = bossroles, },
					}, distance = 2.0 })
end)

RegisterNetEvent('qb-hyper:washHands', function()
    QBCore.Functions.Progressbar('washing_hands', 'Washing hands', 5000, false, false, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true, },
	{ animDict = "mp_arresting", anim = "a_uncuff", flags = 8, }, {}, {}, function()
		TriggerEvent('QBCore:Notify', "You've washed your hands!", 'success')
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
		TriggerEvent('QBCore:Notify', "Cancelled", 'error')
    end)
end)

RegisterNetEvent('qb-hyper:MakeItem', function(data)
	if data.craftable then
		for k, v in pairs(data.craftable[data.tablenumber]) do
			QBCore.Functions.TriggerCallback('qb-hyper:get', function(amount)
				if not amount then TriggerEvent('QBCore:Notify', "You don't have the correct ingredients", 'error') else TriggerEvent("qb-hyper:FoodProgress", data) end
			end, data.item, data.tablenumber, data.craftable)
		end
	end
end)

RegisterNetEvent("hyper:stashmain", function()
	TriggerServerEvent("inventory:server:OpenInventory", "stash", "HyperMain", {
		maxweight = 5500000,
		slots = 250,
	})
	TriggerEvent("inventory:client:SetCurrentStash", "HyperMain")
end)

RegisterNetEvent('qb-hyper:Stash', function(data) TriggerServerEvent("inventory:server:OpenInventory", "stash", "HyperMarket_"..data.stash) TriggerEvent("inventory:client:SetCurrentStash", "HyperMarket_"..data.stash) end)

RegisterNetEvent('qb-hyper:Shop', function() if not jobCheck() then return else TriggerServerEvent("inventory:server:OpenInventory", "shop", "hyper", Config.Items) end end)

RegisterNetEvent('qb-hyper:FoodProgress', function(data)
	QBCore.Functions.Progressbar('making_food', data.bartext..QBCore.Shared.Items[data.item].label, data.time, false, false, {
		disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true, },
		{ animDict = data.animDict,	anim = data.anim, flags = 8, },
	{}, {}, function()
		TriggerServerEvent('qb-hyper:GetFood', data)
		StopAnimTask(GetPlayerPed(-1), data.animDict, data.anim, 1.0)
	end, function()
		TriggerEvent('inventory:client:busy:status', false)
		TriggerEvent('QBCore:Notify', "Cancelled!", 'error')
	end)
end)

RegisterNetEvent('qb-hyper:Menu:hyperBoard', function()
	if not jobCheck() then return end
	local ChopMenu = {}
	ChopMenu[#ChopMenu + 1] = { header = "Chopping Board", txt = "", isMenuHeader = true }
		for i = 1, #Crafting.ChoppingBoard do
			for k, v in pairs(Crafting.ChoppingBoard[i]) do
				if k ~= "img" then
					local text = ""
					local setheader = QBCore.Shared.Items[k].label
					if Crafting.ChoppingBoard[i]["img"] ~= nil then setheader = Crafting.ChoppingBoard[i]["img"]..setheader end
					for l, b in pairs(Crafting.ChoppingBoard[i][tostring(k)]) do
						if b == 1 then number = "" else number = " x"..b end
						text = text.."- "..QBCore.Shared.Items[l].label..number.."<br>"
						if b == 0 then text = "" end
						settext = text
					end
					ChopMenu[#ChopMenu + 1] = { header = "<img src=nui://"..Config.link..QBCore.Shared.Items[k].image.." width=35px> "..setheader, txt = settext,
												params = { event = "qb-hyper:MakeItem", args = { item = k, tablenumber = i, craftable = Crafting.ChoppingBoard,
														   bartext = "Preparing a ", time = 7000, animDict = "anim@heists@prison_heiststation@cop_reactions", anim = "cop_b_idle" } } }
					settext, setheader = nil
				end
			end
		end
	exports['qb-menu']:openMenu(ChopMenu)
end)

RegisterNetEvent('qb-hyper:Menu:Coffee', function()

	if not jobCheck() then return end
	local CoffeeMenu = {}
	CoffeeMenu[#CoffeeMenu + 1] = { header = "Coffee Menu", txt = "", isMenuHeader = true }
		for i = 1, #Crafting.Coffee do
			for k, v in pairs(Crafting.Coffee[i]) do
				if k ~= "img" then
					local text = ""
					local setheader = QBCore.Shared.Items[k].label
					if Crafting.Coffee[i]["img"] ~= nil then setheader = Crafting.Coffee[i]["img"]..setheader end
					for l, b in pairs(Crafting.Coffee[i][tostring(k)]) do
						if b == 1 then number = "" else number = " x"..b end
						text = text.."- "..QBCore.Shared.Items[l].label..number.."<br>"
						if b == 0 then text = "" end
						settext = text
						end
					CoffeeMenu[#CoffeeMenu + 1] = { header = "<img src=nui://"..Config.link..QBCore.Shared.Items[k].image.." width=35px> "..setheader, txt = settext,
													params = { event = "qb-hyper:MakeItem", args = { item = k, tablenumber = i, craftable = Crafting.Coffee,
															   bartext = "Pouring a ", time = 3000, animDict = "mp_ped_interaction", anim = "handshake_guy_a" } } }
					settext, setheader = nil
				end
			end
		end
	exports['qb-menu']:openMenu(CoffeeMenu)
end)


RegisterNetEvent('qb-hypermarket:takeitem',function()
    if PlayerJob.name == "farmers" then
        QBCore.Functions.TriggerCallback("QBCore:HasItem", function(data)
            if data then
                QBCore.Functions.Progressbar('washing_hands', 'Makeing Flour', 30000, false, false, {
					disableMovement = true, --
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {}, {}, {}, function()
					TriggerServerEvent('qb-hyper:startgivemoney')
					QBCore.Functions.Notify("You\'ve Get your Flours!", "success")
				end, function() -- Cancel
					TriggerEvent('inventory:client:busy:status', false)
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
            else
                QBCore.Functions.Notify("You don\'t have all ingredients!", "error")
            end
        end, "wheat")
    else
        QBCore.Functions.Notify("You aren\'t a Farm employee!", "error")
    end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		exports['qb-target']:RemoveZone("hyperBoard")
		exports['qb-target']:RemoveZone("hyperCounter2")
		exports['qb-target']:RemoveZone("hyperCounter")
		exports['qb-target']:RemoveZone("hyperClockin")
		exports['qb-target']:RemoveZone("hyperWash")
		exports['qb-target']:RemoveZone("hyperFridge2")
		exports['qb-target']:RemoveZone("hyperFridge")
		exports['qb-target']:RemoveZone("hyperStorage")
		exports['qb-target']:RemoveZone("hyperCoffee")
	end
end)