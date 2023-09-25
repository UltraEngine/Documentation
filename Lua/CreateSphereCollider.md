# CreateSphereCollider

This function creates a collision sphere shape for physics interactions.

## Syntax

- [Collider](Collider.md) **CreateSphereCollider**(number radius, number x = 0, number y = 0, number z = 0)
- [Collider](Collider.md) **CreateSphereCollider**(number radius, [Vec3](Vec3.md) offset)

## Parameters

| Name | Description |
|---|----|
| radius |radius of shape|
| offset, (x, y, z) |offset of shape|

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
camera:SetFov(70)
camera:Turn(15, 0, 0)
camera:Move(0, 2, -8)
camera:SetClearColor(0.125)

--Create light
local light = CreateDirectionalLight(world)
light:SetColor(2)
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
