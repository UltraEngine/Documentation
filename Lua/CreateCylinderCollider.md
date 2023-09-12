# CreateCylinderCollider

This function creates a collision cylinder shape for physics interactions.

## Syntax

```
function CreateCylinderCollider(radius: number, height: number, x: number = 0.0, y: number = 0.0, z: number = 0.0, pitch: number = 0.0, yaw: number = 0.0, roll: number = 0.0): Collider
function CreateCylinderCollider(radius: number, height: number, offset: Vec3, rotation: Vec3 = 0.0): Collider
```

## Parameters

|Parameter|Description|
|---|----|
|radius|radius of shape|
|height|height of shape|
|x|x component of shape offset|
|y|y component of shape offset|
|z|z component of shape offset|
|pitch|pitch of shape rotation|
|yaw|yaw of shape rotation|
|roll|roll of shape rotation|
|offset|offset of shape|
|rotation|rotation of shape|

## Returns

Returns a new collider object.

## Example

```lua
-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_TITLEBAR | WINDOW_CENTER)

-- Create framebuffer
local framebuffer = CreateFramebuffer(window)

-- Create world
local world = CreateWorld()

-- Create camera
local camera = CreateCamera(world)
camera:SetFOV(70)
camera:Turn(15, 0, 0)
camera:Move(0, 2, -8)
camera:SetClearColor(0.125)

-- Create light
local light = CreateDirectionalLight(world)
light:SetRotation(45, 35, 0)

-- Create ground
local ground = CreateBox(world, 10, 1, 10)
ground:SetPosition(0, -0.5, 0)
ground:SetColor(0, 1, 0)

-- Create model
local model = CreateCylinder(world, 0.5, 4)
model:SetPosition(0, 5, 0)
model:Turn(90, 10, 0)
model:SetColor(0, 0, 1)
model:SetMass(1)
model:AddForce(100, 0, 0)

-- Create collider
local collider = CreateCylinderCollider(0.5, 4)
model:SetCollider(collider)

while window:Closed() == false and window:KeyHit(KEY_ESCAPE) == false do
    world:Update()
    world:Render(framebuffer)
end
```

Note: This example assumes that the necessary libraries have already been imported to Lua and that the required functions and variables are available.