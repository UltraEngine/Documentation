# CreateConeCollider

This function creates a collision cone shape for physics interactions.

## Syntax

- [Collider](Collider.md) **CreateConeCollider**(number radius, number height, [xVec3](xVec3.md) offset, [xVec3](xVec3.md) rotation = 0)
- [Collider](Collider.md) **CreateConeCollider**(number radius, number height, number x = 0, number y = 0, number z = 0, number pitch = 0, number yaw = 0, number roll = 0)

|Parameter|Description|
|---|---|
|radius|radius of shape|
|height|height of shape|
|offset, (x, y, z)|offset of shape|
|rotation, (pitch, yaw, roll)|rotation of shape|

## Returns

Returns a new collider object.

## Example

```lua
local displays = GetDisplays()

--Create window
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
light:SetRotation(45, 35, 0)
light:SetColor(2)

--Create ground
local ground = CreateBox(world, 10, 1, 10)
ground:SetColor(0,1,0)
ground:SetPosition(0, -0.5, 0)

--Create model
local model = CreateCone(world, 0.5, 2)
model:SetPosition(0, 5, 0)
model:SetRotation(90, 0, 0)
model:SetColor(0, 0, 1)
model:SetMass(1)
model:AddForce(100, 0, 0)

--Create collision
local collider = CreateConeCollider(0.5, 2)
model:SetCollider(collider)

while not window:Closed() and not window:KeyHit(KEY_ESCAPE) do
    world:Update()
    world:Render(framebuffer)
end
```
