# CreatePlaneJoint

This function creates a plane joint. Plane joints can be used to lock an entity to a plane, for 2D game physics.

## Syntax

- [Joint](Joint.md) **CreatePlaneJoint**([xVec3](xVec3.md) position, [xVec3](xVec3.md) axis, [Entity](Entity.md) parent, [Entity](Entity.md) child)

Parameter | Description
---|---
position, (x, y, z) | the joint position
axis (px, py, pz) | the joint axis
parent | the parent entity to use, or nil for a fixed position
child | the child entity to use

## Returns

Returns a new joint.

## Example

```lua
-- Get the displays
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
camera:SetPosition(0, 0, -5)

-- Create a light
local light = CreateBoxLight(world)
light:SetRotation(45, 35, 0)
light:SetArea(20, 20)
light:SetRange(-20, 20)

-- Create a ramp
local ramp = CreateBox(world, 10, 0.25, 2)
ramp:SetRotation(0, 0, 5)
ramp:SetPosition(0, -1, 0)
ramp:SetColor(0, 0, 1)

-- Create rolling object
local drum = CreateCylinder(world)
drum:SetRotation(90, 0, 0)
drum:SetPosition(4, 4, 0)
drum:SetColor(0, 1, 0)
drum:SetMass(1)

-- Create joint
local joint = CreatePlaneJoint(drum.position, Vec3(0, 0, 1), nil, drum)

-- Main loop
while window:Closed() == false and window:KeyDown(KEY_ESCAPE) == false do
    world:Update()
    world:Render(framebuffer)
end
```
