bEnableShadow = true
screen_x = Render.GetViewportSize().X
screen_y = Render.GetViewportSize().Y


function DrawText(GroupID, text, position_x, position_y, fontSize)
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
  Render.AddText(GroupID, text, location, fontType, fontSize, textColor, kerning, bCenterX, bCenterY, bEnableShadow, shadowOffset, shadowColor, bOutlined, outlineColor)
end

function UpdateGUI()
  Render.ClearItems(0)
  DrawText(0, "Crystal HP : " .. crystal_hp, 32 , screen_y - 100, 18)
  DrawText(0,  "HP : " .. hp, 32 , screen_y - 64, 24)
  DrawText(0,  "$ " .. money, screen_x - 128 , screen_y - 64, 24)
end

function OpenMenu(title, subtitle, description, action)
  Render.ClearItems(1)
  DrawText(1, title, 32, screen_y/8, 22)
  DrawText(1, subtitle, 32, screen_y/8 + 64, 18)
  DrawText(1, description, 32, screen_y/8 + 96, 16)
  DrawText(1, action, 32, screen_y/8 + 128, 16)
end
