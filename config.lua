Config = {}
Config.Debug = false -- false to remove green boxes

Config.link = "qb-inventory/html/images/" --Set this to the image directory of your inventory script

Config.Items = {
    label = "Ingredients Storage",
    slots = 45,
    items = {
        [1] = { name = "fire_sauce", price = 19, amount = 150, info = {}, type = "item", slot = 1, },
        [2] = { name = "cucumber", price = 14, amount = 150, info = {}, type = "item", slot = 2, },
        [3] = { name = "susage", price = 28, amount = 150, info = {}, type = "item", slot = 3, },
        [4] = { name = "ketchup", price = 15, amount = 150, info = {}, type = "item", slot = 4, },
        [5] = { name = "tofu", price = 19, amount = 150, info = {}, type = "item", slot = 5, },
		[6] = { name = "mince_meat", price = 34, amount = 150, info = {}, type = "item", slot = 6, },
		[7] = { name = "yeast", price = 10, amount = 150, info = {}, type = "item", slot = 7, },
		[8] = { name = "apple", price = 19, amount = 150, info = {}, type = "item", slot = 8, },
		[9] = { name = "blueberry", price = 12, amount = 150, info = {}, type = "item", slot = 9, },
		[10] = { name = "ice", price = 3, amount = 150, info = {}, type = "item", slot = 10, },
		[11] = { name = "suger", price = 11, amount = 150, info = {}, type = "item", slot = 11, },
		[12] = { name = "bento_box", price = 50, amount = 100, info = {}, type = "item", slot = 12, },
        [13] = { name = "boba", price = 62, amount = 100, info = {}, type = "item", slot = 13, },
        [14] = { name = "egg", price = 5, amount = 100, info = {}, type = "item", slot = 14, },
        [15] = { name = "sugar", price = 11, amount = 100, info = {}, type = "item", slot = 15, },
        [16] = { name = "ham", price = 20, amount = 100, info = {}, type = "item", slot = 16, },
        [17] = { name = "chicken", price = 42, amount = 100, info = {}, type = "item", slot = 17, },
		[18] = { name = "tea", price = 20, amount = 40, info = {}, type = "item", slot = 18, },
		[19] = { name = "cheddar", price = 8, amount = 150, info = {}, type = "item", slot = 19, },
        [20] = { name = "meat", price = 39, amount = 50, info = {}, type = "item", slot = 20, },
        [21] = { name = "frozennugget", price = 39, amount = 50, info = {}, type = "item", slot = 21, },
		[22] = { name = "murdermeal", price = 50, amount = 50, info = {}, type = "item", slot = 22, },
        [23] = { name = "orange", price = 2, amount = 50, info = {}, type = "item", slot = 23, },
        [24] = { name = "sugar", price = 11, amount = 50, info = {}, type = "item", slot = 24, },
        [25] = { name = "chickenbreast", price = 5, amount = 50, info = {}, type = "item", slot = 25, },
        [26] = { name = "rhinohorn", price = 10, amount = 50, info = {}, type = "item", slot = 26, },
		[27] = { name = "oystershell", price = 5, amount = 50, info = {}, type = "item", slot = 27, },
        [28] = { name = "curry", price = 10, amount = 50, info = {}, type = "item", slot = 28, },
        [29] = { name = "creampowder", price = 20, amount = 50, info = {}, type = "item", slot = 29, },
        [30] = { name = "beancoffee", price = 3, amount = 50, info = {}, type = "item", slot = 30, },
		[31] = { name = "matcha_leaf", price = 25, amount = 150, info = {}, type = "item", slot = 31, },
        [32] = { name = "coffeebean", price = 25, amount = 150, info = {}, type = "item", slot = 32, },
		[33] = { name = "butter", price = 10, amount = 150, info = {}, type = "item", slot = 33, },
		[34] = { name = "yeast", price = 15, amount = 150, info = {}, type = "item", slot = 34, },
		[35] = { name = "saffron", price = 30, amount = 150, info = {}, type = "item", slot = 35, },
		[36] = { name = "sugar", price = 10, amount = 150, info = {}, type = "item", slot = 36, },
		[37] = { name = "rockcandy", price = 10, amount = 150, info = {}, type = "item", slot = 37, },
		[38] = { name = "almond", price = 5, amount = 150, info = {}, type = "item", slot = 38, },
		[39] = { name = "dried_borage_flower", price = 25, amount = 150, info = {}, type = "item", slot = 39, },
		[40] = { name = "strawberry", price = 10, amount = 150, info = {}, type = "item", slot = 40, },
		[41] = { name = "happy_meal", price = 10, amount = 1, info = {}, type = "item", slot = 41, },
		[42] = { name = "peperoni", price = 41, amount = 150, info = {}, type = "item", slot = 42, },
		[43] = { name = "mince_meat", price = 34, amount = 150, info = {}, type = "item", slot = 43, },
		[44] = { name = "cheese_sausage", price = 41, amount = 150, info = {}, type = "item", slot = 44, },
		[45] = { name = "coffee_powder", price = 10, amount = 150, info = {}, type = "item", slot = 45, },
		[46] = { name = "matcha_powder", price = 10, amount = 150, info = {}, type = "item", slot = 46, },
		[47] = { name = "syrup", price = 15, amount = 150, info = {}, type = "item", slot = 47, },
		[48] = { name = "raisins", price = 10, amount = 150, info = {}, type = "item", slot = 48, },
		[49] = { name = "water_bottle", price = 8, amount = 150, info = {}, type = "item", slot = 49, },
		[50] = { name = "nori", price =10, amount = 150, info = {}, type = "item", slot = 50, },
		[51] = { name = "redrose", price =9, amount = 150, info = {}, type = "item", slot = 51, },
	},
}

Config.Locations = {
    [1] = {
		zoneEnable = true,
        label = "hyper",
        zones = {
			vector2(-54.15, -1772.88),
			vector2(-82.49, -1749.89),
			vector2(-53.64, -1727.8),
			vector2(-29.7, -1748.18),

        },
		blip = vector3(-1225.24, -1482.02, 4.37),
		blipcolor = 76,
    },
}

Crafting = {}


Crafting.ChoppingBoard = {
	[1] = { ['mince_meat'] = { ['fish'] = 1, }, },
	[2] = { ['mince_meat'] = { ['deerskin'] = 1,}, },

}

Crafting.Coffee = {
	[1] = { ['cheddar'] = { ['milk'] = 1, }, },
	[2] = { ['yeast'] = { ['water_bottle'] = 1, }, },
	[3] = { ['frozennugget'] = { ['chiken'] = 1, }, },

}