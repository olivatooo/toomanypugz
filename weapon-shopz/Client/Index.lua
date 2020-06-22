bEnableShadow = true

function DrawText(text, position_x, position_y, fontSize)
		local location = Vector2D(position_x, position_y) -- Screen space position to render the text.
		local fontType = 0 -- Roboto
		local textColor = Color(1, 1, 1, 1) -- Color to render the text.
		local kerning = 0 -- Horizontal spacing adjustment to modify the spacing between each letter.
		local shadowColor = Color(0, 0, 0, 1) -- Color to render the shadow of the text.
		local shadowOffset = Vector2D(1, 1) -- Pixel offset relative to the screen space position to render the shadow of the text.
		local bCenterX = false -- If true, then interpret the screen space position X coordinate as the center of the rendered text.
		local bCenterY = false -- If true, then interpret the screen space position Y coordinate as the center of the rendered text.
		local bOutlined = false -- If true, then the text should be rendered with an outline.
		local outlineColor = Color(1, 1, 1, 1) -- Color to render the outline for the text.
		Render.AddText(0, text, location, fontType, fontSize, textColor, kerning, bCenterX, bCenterY, bEnableShadow, shadowOffset, shadowColor, bOutlined, outlineColor)
end


Events:on("UpdateMoney", function(money)
	Render.ClearItems(0)
    DrawText("Money : " .. tostring(money), 32, 32, 22)
end)
