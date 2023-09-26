# Joint::SetLimits

This method sets the limits of a hinge, slider, or ball and socket joint.

## Syntax

- **SetLimits**(number lower, number upper)

| Parameter | Description |
|---|---|
| lower | minimum joint angle or offset |
| upper | maximum joint angle or offset |

## Remarks

For hinge and slider joints, if both the minimum and maximum limits are set to zero, joint limits will be disabled.

For ball and socket joints, the minimum limit will be used as a maximum cone angle, and the maximum limit will be used for the maximum twist angle.

For ball and socket joints, if the minimum limit is set to zero and the maximum limit is set to 360, joint limits will be disabled.

### Example

```lua
require "UltraEngine"

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
parent:SetMass(1)
parent:SetColor(0, 0, 1)

local child = CreateBox(world)
child:SetPosition(4, 0, 0)
child:SetMass(1)
child:SetColor(0, 1, 0)

local hinge = CreateHingeJoint(parent.position, Vec3(0, 0, 1), nil, parent)
hinge:SetMaxTorque(100)

local slider = CreateSliderJoint(parent.position, Vec3(-1, 0, 0), parent, child)
slider:SetLimits(0, 8)

local a = 0

--Main loop
while not window:Closed() and not window:KeyDown(KEY_ESCAPE) do
    a = a + 1
    hinge:SetPose(a)
    world:Update()
    world:Render(framebuffer)
end
```
