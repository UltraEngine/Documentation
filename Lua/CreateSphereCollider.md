# CreateSphereCollider

This function creates a collision sphere shape for physics interactions.

## Syntax

- **CreateSphereCollider**(radius: number, depth: number, x: number = 0, y: number = 0, z: number = 0): [Collider](Collider.md)

- **CreateSphereCollider**(radius: number, offset: [Vec3](Vec3.md)): [Collider](Collider.md)

## Parameters

| Name | Description |
|---|----|
| radius |radius of shape|
| x |x component of shape offset|
| y |y component of shape offset|
| z |z component of shape offset|
| offset |offset of shape|

## Returns

Returns a new collider object.

## Example

```lua
--Get displays list
local displays = GetDisplays()

--Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_TITLEBAR | WINDOW_CENTER)

--Create framebuffer
local framebuffer = CreateFramebuffer(window)

--Create world
local world = CreateWorld()

--Create camera
local camera = CreateCamera(world)
camera:SetFOV(70)
camera:Turn(15, 0, 0)
camera:Move(0, 2, -8)
camera:SetClearColor(0.125)

--Create light
local light = CreateDirectionalLight(world)
light:SetRotation(45, 35, 0)

--Create ground
local ground = CreateBox(world, 10, 1, 10)
ground:SetPosition(0, -0.5, 0)
ground:SetColor(0, 1, 0)

--Create model
local model = CreateSphere(world, 0.5)
model:SetPosition(0, 5, 0)
model:Turn(90, 10, 0)
model:SetColor(0, 0, 1)
model:SetMass(1)
model:AddForce(100, 0, 0)

--Create collision
local collision = CreateSphereCollider(0.5)
model:SetCollider(collision)

while window:Closed() == false and window:KeyHit(KEY_ESCAPE) == false do
    world:Update()
    world:Render(framebuffer)
end
```
Note: The provided Lua example assumes that all required libraries have already been imported.