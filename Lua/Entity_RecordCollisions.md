# Entity:RecordCollisions

This method sets the entity collision recording mode. Entity collisions will not be stored in the world collision list unless collision recording is enabled.

## Syntax

```lua
entity:RecordCollisions(record)
```

| Parameter | Description |
|---|---|
| record | If set to true, collisions will be recorded in the world collision list. |

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

-- Create a light
local light = CreateBoxLight(world)
light:SetRange(-10, 10)
light:SetArea(15, 15)
light:SetRotation(45, 35, 0)
light:SetColor(2)

-- Create the ground
local ground = CreateBox(world, 10, 1, 10)
ground:SetPosition(0, -0.5, 0)
ground:SetColor(0, 1, 0)

-- Add some boxes
local box1 = CreateBox(world, 1, 1, 1)
box1:SetPosition(-1, 5, 0)
box1:SetColor(0, 0, 1)

local box2 = CreateBox(world, 1, 1, 1)
box2:SetPosition(1, 5, 0)
box2:SetColor(0, 0, 1)

-- Enable collision recording
box1:RecordCollisions(true)

-- Main loop
while window:Closed() == false and window:KeyDown(KEY_ESCAPE) == false do
    -- Press the space key to start physics
    if window:KeyHit(KEY_SPACE) then
        box1:SetMass(1)
        box2:SetMass(1)
    end

    -- Color the collided entity red when collision is detected
    for _, c in ipairs(world.collisions) do
        for n = 1, 2 do
            if c.entity[n]:GetMass() ~= 0.0 then
                c.entity[n]:SetColor(1, 0, 0)
            end
        end
    end

    world:Update()
    world:Render(framebuffer)
end
```