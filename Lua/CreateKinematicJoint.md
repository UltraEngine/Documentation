# CreateKinematicJoint

This function creates a new kinematic joint. A kinematic joint can be used to control the orientation of an entity with physics forces.

## Syntax

`CreateKinematicJoint(entity: table): table`

- `entity`: The entity the joint controls.

## Returns

Returns a new joint object, or `nil` if the joint could not be created.

## Remarks

The entity's mass must be greater than zero.

A kinematic joint can control the entity position, rotation, or both.

To control the entity position, you must call [Joint:SetMaxForce](Joint_SetMaxForce.md) and [Joint:SetTargetPosition](Joint_SetTargetPosition.md).

To control the entity rotation, you must call [Joint:SetMaxTorque](Joint_SetMaxTorque.md) and [Joint:SetTargetRotation](Joint_SetTargetRotation.md).

## Example

```lua
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
camera:SetPosition(0, 0, -5)

--Create light
local light = CreateBoxLight(world)
light:SetRotation(35, 35, 0)
light:SetRange(-20, 20)

local box = CreateBox(world)
box:SetMass(1)
box:SetColor(0, 1, 0)

local joint = CreateKinematicJoint(box.position, box)

--Main loop
local a = 0
local y = 0
while (not window:Closed() and not window:KeyDown(KEY_ESCAPE)) do
    if window:KeyDown(KEY_RIGHT) then
        a = a - 2
    end
    if window:KeyDown(KEY_LEFT) then
        a = a + 2
    end
    if window:KeyDown(KEY_UP) then
        y = y + 0.1
    end
    if window:KeyDown(KEY_DOWN) then
        y = y - 0.1
    end

    joint:SetPose(Vec3(0, y, 0), Vec3(0, 0, a))

    world:Update()
    world:Render(framebuffer)
end
```
