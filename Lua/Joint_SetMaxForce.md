# Joint:SetMaxForce

This method sets the maximum force a motorized slider or kinematic joint can apply to reach its target position.

## Syntax

- **SetMaxForce**(number force)

| Parameter | Description |
|---|---|
| force | max force, in Newtons |

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
camera:SetPosition(0, 0, -6)

--Create light
local light = CreateBoxLight(world)
light:SetRange(-20, 20)
light:SetRotation(35, 35, 0)
light:SetColor(3)

local parent = CreateBox(world)
parent:SetColor(0, 0, 1)
parent:SetPosition(0, -2, 0)

local child = CreateBox(world)
child:SetMass(1)
child:SetColor(0, 1, 0)

--Create joint
local joint = CreateSliderJoint(parent.position, Vec3(0, 1, 0), parent, child)
joint:SetMaxForce(100)
joint:SetPose(2)

--Main loop
while window:Closed() == false and window:KeyDown(KEY_ESCAPE) == false do
    world:Update()
    world:Render(framebuffer)
end
```
