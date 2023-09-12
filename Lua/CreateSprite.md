# CreateSprite

This function creates a sprite that displays a rectangle or a string of text.

## Syntax

`CreateSprite(world, width, height, wireframe = false)`

`CreateSprite(world, text, font, size, textalignment = TEXT_LEFT | TEXT_TOP)`

### Parameters

- `world` : shared_ptr<[World](World.md)\> - canvas to add the sprite to
- `width` : float - width of the sprite, in pixels
- `height` : float - height of the sprite, in pixels
- `wireframe` : bool - set to true for wireframe or false for solid
- `text` : [WString](WString.md) - text to display
- `font` : shared_ptr<[Font](Font.md)\> - font to render text with
- `size` : int - font size
- `textalignment` : TextAlignment - alignment flags, can be any combination of TEXT_LEFT, TEXT_CENTER, TEXT_RIGHT, TEXT_TOP, TEXT_MIDDLE, and TEXT_BOTTOM

### Returns

Returns a new sprite object.

## Example

```lua
-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR)

-- Create framebuffer
local framebuffer = CreateFramebuffer(window)

-- Create world
local world = CreateWorld()

-- Create camera
local camera = CreateCamera(world, PROJECTION_ORTHOGRAPHIC)
camera:SetClearColor(0.125)
camera:SetPosition(framebuffer.size.x * 0.5, framebuffer.size.y * 0.5, 0.0)

-- Create sprite
local sprite = CreateSprite(world, 100, 100)
sprite:SetColor(0, 0, 1)
sprite:SetPosition(10, 10)

-- Main loop
while not window:Closed() and not window:KeyHit(KEY_ESCAPE) do
    world:Update()
    world:Render(framebuffer)
end
```
