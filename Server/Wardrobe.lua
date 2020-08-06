
explosives_position = {
	Vector(1650.0, 3650.0, 500.0),
	Vector(1650.0, 3150.0, 500.0),
	Vector(1650.0, 2650.0, 500.0),
	Vector(1650.0, 2150.0, 500.0),
	Vector(-1150.0, 2650.0, 500.0),
	Vector(-1150.0, 3150.0, 500.0),
	Vector(-1150.0, 2150.0, 500.0),
	Vector(-1150.0, 3650.0, 500.0),
}

beards = {
	"NanosWorld::SM_Beard_Extra",
	"NanosWorld::SM_Beard_Middle",
	"NanosWorld::SM_Beard_Mustache_01",
	"NanosWorld::SM_Beard_Mustache_02",
	"NanosWorld::SM_Beard_Side"
}

hairs = {
	"NanosWorld::SM_Hair_Long",
	"NanosWorld::SM_Hair_Short",
	"NanosWorld::SM_Hair_Kwang"
}


function buy_clothes(chr, opt)
	if opt == 1 then
		chr:AddStaticMeshAttached("beard", get_random_from_list(beards), "beard", Vector(), Rotator())
		-- chr:SetSpeedMultiplier(chr:GetSpeedMultiplier*1.2)
	end
	if opt == 2 then
		chr:AddStaticMeshAttached("beard", get_random_from_list(hairs), "beard", Vector(), Rotator())
		-- chr:SetValue("Discount", 0.90)
	end
	if opt == 3 then
		chr:AddSkeletalMeshAttached("pants", "NanosWorld::SK_Pants")
		--  chr:SetSpeedMultiplier(chr:GetSpeedMultiplier*1.2)
	end
	if opt == 4 then
		chr:AddSkeletalMeshAttached("shirt", "NanosWorld::SK_Shirt")
		-- chr:SetMaxHealth(1000)
		-- chr:SetHealth(1000)
	end
	if opt == 5 then
		chr:AddSkeletalMeshAttached("shoes", "NanosWorld::SK_Tie")
		-- chr:SetValue("Discount", 0.80)
	end
end

TmpzWardrobe = {
  Shop = function(chr, opt)
    return buy_clothes(chr, opt)
  end
}