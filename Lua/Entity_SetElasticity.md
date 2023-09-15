# Entity:SetElasticity

This method sets the elasticity or "bounciness" of the entity.

## Syntax

- **SetElasticity**(number elasticity)

| Parameter  | Description                                       |
| ---------- | ------------------------------------------------- |
| elasticity | elasticity value, between 0 and 1                 |

## Example

```lua
-- Create the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_CENTER | WINDOW_TITLEBAR)

-- Create a world
local world = CreateWorld()

-- Create a framebuffer
local framebuffer = CreateFramebuffer(window)

-- Create a camera
local camera = CreateCamera(world)
camera:SetClearColor(0.125)
camera:SetPosition(Vec3(0, 1, -4))

-- Create light
local light = CreateBoxLight(world)
light:SetRange(-10, 10)
light:SetRotation(Vec3(45, 35, 0))
light:SetColor(Vec4(2, 2, 2, 1))

-- Create the ground
local ground = CreateBox(world, 10, 1, 10)
ground:SetPosition(Vec3(0, -0.5, 0))
ground:SetColor(Vec4(0, 1, 0, 1))

-- Add some boxes
local box1 = CreateBox(world)
box1:SetMass(1)
box1:SetPosition(Vec3(-1, 5, 0))
box1:SetElasticity(1)
box1:SetColor(Vec4(0, 0, 1, 1))

local box2 = CreateBox(world)
box2:SetMass(1)
box2:SetPosition(Vec3(1, 5, 0))
box2:SetElasticity(0.25)
box2:SetColor(Vec4(0, 0, 1, 1))

-- Very slow gravity
world:SetGravity(Vec3(0, -1, 0))

-- Main loop
while not window:Closed() and not window:KeyDown(KEY_ESCAPE) do
    world:Update()
    world:Render(framebuffer)
end
```
