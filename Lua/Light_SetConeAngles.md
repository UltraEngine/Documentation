# Light:SetConeAngles

This method sets a spotlight's inner and outer cone angles.

## Syntax

- void **SetConeAngles**(number outerconeangle, number innerconeangle)

| Parameter | Description |
|---|---|
| outerconeangle | outer cone angle where light ends |
| innerconeangle | inner cone angle where light reaches the maximum brightness |

## Example

```lua
--Get the displays
local displays = GetDisplays()

--Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_CENTER | WINDOW_TITLEBAR)

--Create a framebuffer
local framebuffer = CreateFramebuffer(window)

--Create a world
local world = CreateWorld()

--Create a camera
local camera = CreateCamera(world)
camera:SetClearColor(0.125)
camera:SetFov(70)
camera:Move(0, 4, 1)
camera:SetRotation(70, 0, 0)

--Create light
local light = CreateSpotLight(world)
light:SetPosition(0, 1, 0)
light:SetRotation(35, 0, 0)
light:SetColor(8)
light:SetConeAngles(35, 25)
light:SetRange(0.1, 30)

--Create ground
local ground = CreateBox(world, 20, 1, 20)
ground:SetPosition(0, -0.5, 0)
ground:SetColor(0, 1, 0)

--Main loop
while window:Closed() == false and window:KeyHit(KEY_ESCAPE) == false do
    world:Update()
    world:Render(framebuffer)
end
```
