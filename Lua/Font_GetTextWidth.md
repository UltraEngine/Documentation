# Font:GetTextWidth

This method returns the width of a line of text rendered with the font with the specified settings.

## Syntax

- number **GetTextWidth**([string](https://www.lua.org/manual/5.4/manual.html#6.4) text, number size)

| Parameter | Description |
|---|---|
| text | string to determine the width of |
| size | font size |

## Returns

Returns the width the text will be when rendered.

## Example

```lua
require "UltraEngine"

--Get the displays
local displays = GetDisplays()

--Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_TITLEBAR | WINDOW_CENTER)

--Create a framebuffer
local framebuffer = CreateFramebuffer(window)

--Create a world
local world = CreateWorld()

--Create a camera
local camera = CreateCamera(world, PROJECTION_ORTHOGRAPHIC)
camera:SetClearColor(0.125)

--Create sprite
local fontsize = 36
local font = LoadFont("Fonts/arial.ttf")
local sprite = CreateSprite(world, font, "Hello, World!", fontsize)
local rect = CreateSprite(world, font:GetTextWidth("Hello, World!", fontsize), font:GetHeight(fontsize), true)

--Center the text relative to the camera
camera:SetPosition(sprite:GetBounds().center)

--Main loop
while not window:Closed() and not window:KeyHit(KEY_ESCAPE) do
    --Update world
    world:Update()

    --Render world
    world:Render(framebuffer, true)
end
```
