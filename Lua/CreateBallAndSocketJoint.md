# CreateBallAndSocketJoint

This function creates a ball and socket joint.

## Syntax

```lua
function CreateBallAndSocketJoint(position, parent, child)
```

### Parameters

| Parameter | Description |
|---|---|
| position | joint position |
| parent | parent entity, or nil for a fixed position |
| child | child entity |

### Returns

Returns a new joint.

## Example

```lua
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

local child = CreateBox(world)
child:SetPosition(4, 0, 0)
child:SetMass(1)
child:SetColor(0, 1, 0)
child:AddForce(0, 0, 100)
child:AddTorque(100, 0, 0)

local joint = CreateBallAndSocketJoint(parent.position, parent, child)
joint:SetLimits(0, 360)

while window:Closed() == false and window:KeyDown(KEY_ESCAPE) == false do
    world:Update()
    world:Render(framebuffer)
end
```