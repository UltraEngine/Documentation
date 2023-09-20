# Font:GetHeight

This method returns the font's line height.

## Syntax

- number **GetHeight**(size)

| Parameter | Description |
|---|---|
| size | font size to use |

## Returns

Returns the font's line height. For most fonts, this will be the distance between the base of a capital letter and its maximum height, known as the font *ascent*.

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_TITLEBAR + WINDOW_CENTER)

-- Create a framebuffer
local framebuffer = CreateFramebuffer(window)

-- Create a world
local world = CreateWorld()

-- Create a camera
local camera = CreateCamera(world, PROJECTION_ORTHOGRAPHIC)
camera:SetClearColor(0.125)

-- Create sprite
local fontsize = 36
local font = LoadFont("Fonts/arial.ttf")
local sprite = CreateSprite(world, font, "Hello, World!", fontsize)
local rect = CreateSprite(world, font:GetTextWidth("Hello, World!", fontsize), font:GetHeight(fontsize), true)

-- Center the text relative to the camera
camera:SetPosition(sprite:GetBounds().center)

-- Main loop
while (not window:Closed()) and (not window:KeyHit(KEY_ESCAPE)) do
    -- Update world
    world:Update()

    -- Render world
    world:Render(framebuffer, true)
end
```
