local QBCore = exports['qb-core']:GetCoreObject()

--Consumables


RegisterServerEvent('qb-hyper:GetFood', function(data)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	--This grabs the table from client and removes the item requirements
	amount = 1
	if data.craftable ~= nil then
		for k, v in pairs(data.craftable[tonumber(data.tablenumber)][tostring(data.item)]) do
			if Config.Debug then print("GetFood Table Result: craftable["..data.tablenumber.."]['"..data.item.."']['"..k.."']['"..v.."']") end
			-- if item requirement number = 0 then don't try to remove (this poorly allows crafting recipies with 0 requirements)
			if v == 0 or v == nil then else
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[tostring(k)], "remove", v)
				Player.Functions.RemoveItem(tostring(k), v)
			end
		end
		if data.craftable[tonumber(data.tablenumber)]["amount"] ~= nil then amount = data.craftable[tonumber(data.tablenumber)]["amount"] else amount = 1 end
	end
	--This should give the item, while the rest removes the requirements
	Player.Functions.AddItem(data.item, 1, false, {["quality"] = nil})
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[data.item], "add", 1)

	if Config.Debug then print("Giving ["..src.."]: x"..amount.." "..data.item) end
end)

---ITEM REQUIREMENT CHECKS
QBCore.Functions.CreateCallback('qb-hyper:get', function(source, cb, item, tablenumber, craftable)
	local src = source
	local hasitem = nil
	local hasanyitem = nil
		for k, v in pairs(craftable[tonumber(tablenumber)][tostring(item)]) do
			if QBCore.Functions.GetPlayer(src).Functions.GetItemByName(k) and QBCore.Functions.GetPlayer(src).Functions.GetItemByName(k).amount >= v then
				hasitem = true
				number = tostring(QBCore.Functions.GetPlayer(src).Functions.GetItemByName(k).amount)
			else
				hasitem = false
				hasanyitem = false
				number = "0"
			end
			if Config.Debug then print("craftable["..tablenumber.."]['"..item.."']['"..k.."']['"..v.."'] = "..tostring(hasitem).." ("..tostring(number)..")")
			hasitem = nil
			end
		end
	if hasanyitem == false then cb(false)
	elseif hasanyitem == nil then cb(true) end
end)

RegisterServerEvent('qb-hyper:startgivemoney', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Item = Player.Functions.GetItemByName('wheat')
    if Item ~= nil and Item.amount > 0  then
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['wheat'], "remove")
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['flour'], "add")
        Player.Functions.RemoveItem('wheat', Item.amount)
        Player.Functions.AddItem('flour', math.floor(Item.amount))
    else
        TriggerClientEvent('QBCore:Notify', src, 'You Dont Have Wheat..', 'error')
    end
end)