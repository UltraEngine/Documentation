# Entity:SetMass

This method sets the entity mass for physics interactivity.

## Syntax

- **SetMass**(number mass)

| Parameter | Description |
|---|---|
| mass | mass to set, in kilograms |

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_CENTER + WINDOW_TITLEBAR)

-- Create a world
local world = CreateWorld()

-- Create a framebuffer
local framebuffer = CreateFramebuffer(window)

-- Create a camera
local camera = CreateCamera(world)
camera:SetClearColor(0.125)
camera:SetPosition(0, 1, -4)

-- Create light
local light = CreateBoxLight(world)
light:SetRange(-10, 10)
light:SetRotation(45, 35, 0)
light:SetColor(2)

-- Create the ground
local ground = CreateBox(world, 10, 1, 10)
ground:SetPosition(0, -0.5, 0)
ground:SetColor(0, 1, 0)

-- Add some boxes
local box1 = CreateBox(world)
box1:SetMass(1)
box1:SetPosition(0, 5, 0)
box1:SetElasticity(1)
box1:SetColor(0, 0, 1)

local box2 = CreateBox(world)
box2:SetMass(1)
box2:SetPosition(0.5, 6.5, 0)
box2:SetElasticity(0.25)
box2:SetColor(0, 0, 1)

-- Very slow gravity
world:SetGravity(0, -2, 0)

-- Main loop
while not (window:Closed() or window:KeyDown(KEY_ESCAPE)) do
    world:Update()
    world:Render(framebuffer)
end
```
