# createHingeJoint

This function creates a new hinge joint. A hinge joint spins around an axis.

## Syntax

`createHingeJoint(position, axis, parent, child)`

- `position`: a vector representing the position of the joint
- `axis`: a vector representing the axis the joint will spin around
- `parent`: the parent entity of the joint (can be set to nil for a fixed point)
- `child`: the child entity of the joint

## Returns

Returns a new joint object.

## Example

```lua
-- Import necessary libraries
require("UltraEngine")

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, GetDisplays()[1], WINDOW_CENTER | WINDOW_TITLEBAR)

-- Create a framebuffer
local framebuffer = CreateFramebuffer(window)

-- Create a world
local world = CreateWorld()

-- Create a camera    
local camera = CreateCamera(world)
camera:SetClearColor(0.125)
camera:SetPosition(0, 0, -6)

-- Create light
local light = CreateBoxLight(world)
light:SetRange(-20, 20)
light:SetRotation(35, 35, 0)
light:SetColor(3)

local parent = CreateBox(world)
parent:SetColor(0, 0, 1)

local child = CreateBox(world)
child:SetPosition(4, 0, 0)
child:SetMass(1)
child:SetColor(0, 1, 0)

local joint = createHingeJoint(parent.position, Vec3(0, 0, 1), parent, child)

-- Main loop
while not window:Closed() and not window:KeyDown(KEY_ESCAPE) do
    world:Update()
    world:Render(framebuffer)
end
```
