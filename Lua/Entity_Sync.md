# Entity:Sync

This method synchronizes changes to an entity's orientation and color. Use this to disable rendering interpolation when an object is "teleported" to a new location.

## Syntax

- **Sync**()

## Remarks

Rendering is performed on a separate thread, and is likely to run at a different frequency than the main thread. In the rendering thread, changes to an entity's position, rotation, scale, and color are smoothly interpolated between the most recent two updates received, resulting in smooth motion. If for any reason you want motion and color forced to the current value when they are received, this command can be called after setting the orientation or color. For example, if you load a model and then place it in a position where it is supposed to appear, you may wish to call this command to ensure there is not any interpolation between its original and final positions.

Note that if physics are enabled it may introduce additional interpolation if the entity has a non-zero mass.

## Example

In this example the box on the top will use rendering interpolation, while the box on the bottom will continuously call Sync() to prevent interpolation.

```lua
-- Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_CENTER | WINDOW_TITLEBAR)

-- Create a framebuffer
local framebuffer = CreateFramebuffer(window)

-- Create a world
local world = CreateWorld()

-- Create a camera
local camera = CreateCamera(world)
camera:SetClearColor(0.125)
camera:Move(0, 0, -2)
camera:SetFOV(70)

-- Create light
local light = CreateBoxLight(world)
light:SetRange(-20, 20)
light:SetArea(20, 20)
light:SetRotation(45, 35, 0)

-- Create model
local box1 = CreateBox(world, 0.8, 0.8, 0.8)
box1:SetColor(0,0,1)
box1:SetPhysicsMode(PHYSICS_DISABLED)

local box2 = CreateBox(world, 0.8, 0.8, 0.8)
box2:SetColor(0,1,0)
box2:SetPhysicsMode(PHYSICS_DISABLED)

local n = 0
local pos = { -1.0, 1.0 }

while window:Closed() == false do
    box1:SetPosition(pos[n], 0.5, 0)
    box2:SetPosition(pos[n], -0.5, 0)
    box2:Sync()

    n = n + 1
    if n == 2 then
        n = 0
    end

    world:Update()
    world:Render(framebuffer, false)
end
```
