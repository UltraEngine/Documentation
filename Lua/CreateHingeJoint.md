# CreateHingeJoint

This function creates a new hinge joint. A hinge joint spins around an axis.

## Syntax

- [Joint](Joint.md) **CreateHingeJoint**([xVec3](xVec3.md) position, [xVec3](xVec3.md) axis, [Entity](Entity.md) parent, [Entity](Entity.md) child)

| Parameter | Description |
|---|---|
| position | position of the joint |
| axis | axis the joint will spin around |
| parent | joint parent or nil for a fixed point |
| child | joint child |

## Returns

Returns a new joint object.

## Example

```lua
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
light:SetColor(2)

local parent = CreateBox(world)
parent:SetColor(0, 0, 1)

local child = CreateBox(world)
child:SetPosition(4, 0, 0)
child:SetMass(1)
child:SetColor(0, 1, 0)

local joint = CreateHingeJoint(parent.position, Vec3(0, 0, 1), parent, child)

-- Main loop
while not window:Closed() and not window:KeyDown(KEY_ESCAPE) do
    world:Update()
    world:Render(framebuffer)
end
```
