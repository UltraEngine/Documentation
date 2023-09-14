# CreateBoxLight

This function creates a new box light.

## Syntax

[Light](Light.md) **CreateBoxLight**([World](World.md) world)

| Parameter | Description |
|---|---|
| world | the world to create the entity in |

## Returns

Returns a new light.

## Example

```lua
 -- Get the displays
local displays = GetDisplays()

 -- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR)

 -- Create a framebuffer
local framebuffer = CreateFramebuffer(window)

 -- Create a world
local world = CreateWorld()

 -- Create a camera
local camera = CreateCamera(world)
camera:SetClearColor(0.125)
camera:SetFOV(70)
camera:Move(0, 2, -8)

 -- Create light
local light = CreateBoxLight(world)
light:SetRotation(90, 0, 0)
light:SetRange(-10, 10)
light:SetArea(5, 5)

 -- Create ground
local ground = CreateBox(world, 20, 1, 20)
ground:SetPosition(0, -0.5, 0)
ground:SetColor(0, 1, 0)

 -- Main loop
while window:Closed() == false and window:KeyHit(KEY_ESCAPE) == false do
    world:Update()
    world:Render(framebuffer)
end
```
