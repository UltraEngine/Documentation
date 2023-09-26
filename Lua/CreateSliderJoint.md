# CreateSliderJoint

This function creates a new slider joint. A hinge joint moves freely along the joint axis.

## Syntax

- [Joint](Joint.md) **CreateSliderJoint**([xVec3](xVec3.md) position, [xVec3](xVec3.md) axis, [Entity](Entity.md) parent, [Entity](Entity.md) child)

| Parameter | Description |
|---|---|
| position | position of the joint |
| axis | axis the joint will slide along |
| parent | joint parent or NULL for a fixed point |
| child | joint child |

## Example

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
camera:SetPosition(0, 0, -6)

-- Create light
local light = CreateBoxLight(world)
light:SetRange(-20, 20)
light:SetRotation(35, 35, 0)
light:SetColor(3)
light:SetArea(20,20)

local parent = CreateBox(world)
parent:SetColor(0, 0, 1)

local child = CreateBox(world)
child:SetPosition(4, 0.1, 0)
child:SetMass(1)
child:SetColor(0, 1, 0)

local joint = CreateSliderJoint(parent.position, child.position - parent.position, parent, child)

-- Main loop
while window:Closed() == false and window:KeyDown(KEY_ESCAPE) == false do
    world:Update()
    world:Render(framebuffer)
end
```
