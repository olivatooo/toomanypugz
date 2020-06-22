Package:Require ("WeaponGenerator.lua")

initial_money = 16000
offset = 0
items = {}
bank = {}


Events:on("CreateBank", function(charac)
	Package:Log("Created bank!")
	bank[charac] = initial_money
end)


function createRandomWeapon()
	return items[math.random(#items)]
end

-- We need a better way to create object instances...
function buyItem(character, prop)
	if bank[character] >= items[prop] then
		bank[character] = bank[character] - items[prop]
		Events:Call("UpdateMoney", bank[character])
	end
end

function addItem(model, price)
	Prop(
		Vector(offset, offset, 0),
		Rotator(0, 0, 0),
		model
	)
	offset = offset + 32
	items[model] = price
end

Player:on("Spawn", function(player)
	Events:CallRemote("UpdateMoney", {initial_money})
end)

-- Spawns weapon shop props --
Server:on("Start", function()
	local wep = nil
	for i=1,5 do
		for j=1,5 do
				TmpzWeapons.RifleTier(Vector(100*i, 120*j, 100), Rotator(), i)
				TmpzWeapons.ShotgunTier(Vector(110*i, 120*j, 100), Rotator(), i)
		end
	end
end)

Character:on("GrabProp", function(character, prop)
	 -- TmpzWeapons.buyItem(character, prop:GetAssetName())
end)