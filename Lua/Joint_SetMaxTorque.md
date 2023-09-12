# Joint:SetMaxTorque

This method sets the maximum torque a motorized hinge or kinematic joint can apply to reach its target rotation.

## Syntax

- Joint:**SetMaxTorque**(torque:number)

  - **torque**: maximum torque in Newton-meters (number)

## Example

```lua
-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER + WINDOW_TITLEBAR)

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
parent:SetMass(1)
parent:SetColor(0, 0, 1)

local child = CreateBox(world)
child:SetPosition(4, 0, 0)
child:SetMass(1)
child:SetColor(0, 1, 0)

local hinge = CreateHingeJoint(parent.position, Vec3(0, 0, 1), NULL, parent)
hinge:SetMaxTorque(100)

local slider = CreateSliderJoint(parent.position, Vec3(-1, 0, 0), parent, child)
slider:SetLimits(0, 8)

local a = 0

-- Main loop
while window:Closed() == false and window:KeyDown(KEY_ESCAPE) == false do
    a = a + 1
    hinge:SetPose(a)
    world:Update()
    world:Render(framebuffer)
end
```