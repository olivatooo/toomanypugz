Package:Require ("FunMessages.lua")

on("KeyUp", function(KeyName, MouseX, MouseY)
  -- KEY Q --
  if KeyName == "Q" and shop ~= -1 then
    if shop_option == 1 then
      shop_option = 5
    else
      shop_option = shop_option - 1
    end
    OpenMenu("~ SHOP",
      "Option : " .. shop_option,
      "Price : " .. shop_items[shop_index[shop]][shop_option],
      "Q and E to cycle | B to buy")
  end
  -- KEY E --
  if KeyName == "E" and shop ~= -1 then
    if shop_option == 5 then
      shop_option = 1
    else
      shop_option = shop_option + 1
    end
    OpenMenu("SHOP : " .. shop_index[shop] ,
      "Tier : " .. shop_option,
      "Price : " .. shop_items[shop_index[shop]][shop_option],
      "Q and E to cycle | B to buy")
  end

  -- KEY B --
  if KeyName == "B" and shop ~= -1 then
    OpenMenu("Making transaction!", "pls", "wait...", "")
    Events:CallRemote("BuyWeapon", {NanosWorld:GetLocalPlayer(), shop, shop_option})
  end
  
  -- KEY K - Starting Game --
  if KeyName == "K" and shop == 666 then
	Render.ClearItems(1)
    Events:CallRemote("LetsDoABreak", {})
  end

end)

Events:on("AnnouncePurchased", function(option)
  if option == "0" then
    OpenMenu("You don't have money!","","","")
	-- Sound(Vector(0, 0, 0),"tmpz::Negate",true,false,0,1,1)
  else
    OpenMenu("Purchase complete!", "", "Tip:", get_random_from_list(fun_msgs))
	-- Sound(Vector(0, 0, 0),"tmpz::Confirm",true,false,0,1,1)
  end
end)

Events:on("EnterShop", function(option)
  if option == "RESTART_GAME" then
    shop = 666
    OpenMenu("Let's go??",
      "Make sure everyone is ready to go",
      "Good Luck, Have Fun",
      "Press K to Start")
  else
    shop = shop_index_rev[option]
    OpenMenu("SHOP : " .. shop_index[shop],
      "Tier : " .. shop_option,
      "Price : " .. shop_items[shop_index[shop]][shop_option],
      "Q and E to cycle | B to buy")
  end
end)

Events:on("LeaveShop", function(option)
  Render.ClearItems(1)
  shop = -1
  shop_option = 1
end)