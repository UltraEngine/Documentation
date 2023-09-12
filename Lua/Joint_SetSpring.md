# Joint:SetSpring

This method adds spring behavior to a hinge or slider joint.

## Syntax

```lua
Joint:SetSpring(relaxation, spring, damper)
```

### Parameters

- `relaxation`: spring damper relaxation (number)
- `spring`: spring constant (number)
- `damper`: damping value (number)

## Remarks

Calling this method with zero for the spring parameter will disable spring behavior for this joint.

## Example

```lua
local displays = GetDisplays()

local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_CENTER | WINDOW_TITLEBAR)

local framebuffer = CreateFramebuffer(window)

local world = CreateWorld()

local camera = CreateCamera(world)
camera:SetClearColor(0.125)
camera:SetPosition(0, 0, -6)

local light = CreateBoxLight(world)
light:SetRange(-20, 20)
light:SetRotation(35, 35, 0)
light:SetColor(3)

local parent = CreateBox(world)
parent:SetColor(0, 0, 1)

local child = CreateBox(world)
child:SetPosition(4, 0, 0)
child:SetMass(1)
child:SetGravityMode(false)
child:SetColor(0, 1, 0)
child:AddForce(0, 500, 0)

local hinge = CreateHingeJoint(parent.position, Vec3(0, 0, 1), parent, child)
hinge:SetSpring(0.9, 2000, 0.01)

while window:Closed() == false and window:KeyDown(KEY_ESCAPE) == false do
    world:Update()
    world:Render(framebuffer)
end
```