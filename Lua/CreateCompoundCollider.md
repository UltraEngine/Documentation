# CreateCompoundCollider

This function creates a complex collision shape that is made up of multiple sub-shapes.

## Syntax

- [Collider](Collider.md) **CreateCompoundCollider**([table](https://www.lua.org/manual/5.4/manual.html#6.6))

Parameter | Description 
---|---
subshapes | an array of collision objects to be combined into the created shape

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_TITLEBAR | WINDOW_CENTER)

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
local light = CreateBoxLight(world)
light:SetRange(-20, 20)
light:SetArea(30, 30)
light:SetRotation(45, 35, 0)
light:SetColor(2)

-- Create ground
local ground = CreateBox(world, 20, 1, 20)
ground:SetPosition(0, -0.5, 0)
ground:SetColor(0, 1, 0)

-- Create model
local model = CreateSphere(world, 1)
model:SetMass(1)
model:SetColor(0, 0, 1)
model:AddForce(10, 0, -10)

-- Add some parts
local part = CreateCone(world)
part:SetColor(1, 0, 0)
part:SetPosition(1, 0, 0)
part:SetRotation(0, 0, -90)
part:SetParent(model)

part = CreateCone(world)
part:SetColor(1, 0, 0)
part:SetPosition(-1, 0, 0)
part:SetRotation(0, 0, 90)
part:SetParent(model)

part = CreateCone(world)
part:SetColor(1, 0, 0)
part:SetPosition(0, 0, 1)
part:SetRotation(90, 0, 0)
part:SetParent(model)

part = CreateCone(world)
part:SetColor(1, 0, 0)
part:SetPosition(0, 0, -1)
part:SetRotation(-90, 0, 0)
part:SetParent(model)

part = CreateCone(world)
part:SetColor(1, 0, 0)
part:SetPosition(0, -1, 0)
part:SetRotation(180, 0, 0)
part:SetParent(model)

part = CreateCone(world)
part:SetColor(1, 0, 0)
part:SetPosition(0, 1, 0)
part:SetParent(model)

model:SetPosition(0, 5, 0)

-- Remove colliders from child primitives
for i,child in ipairs(model.kids) do
    child:SetCollider(nil)
end

-- Create collision
local collisions = {}
table.insert(collisions, CreateSphereCollider(1))
table.insert(collisions, CreateConeCollider(0.5, 1, 1, 0, 0, 0, 0, -90))
table.insert(collisions, CreateConeCollider(0.5, 1, -1, 0, 0, 0, 0, 90))
table.insert(collisions, CreateConeCollider(0.5, 1, 0, 1, 0, 0, 0, 0))
table.insert(collisions, CreateConeCollider(0.5, 1, 0, -1, 0, 180, 0, 0))
table.insert(collisions, CreateConeCollider(0.5, 1, 0, 0, 1, 90, 0, 0))
table.insert(collisions, CreateConeCollider(0.5, 1, 0, 0, -1, -90, 0, 0))
local collider = CreateCompoundCollider(collisions)
model:SetCollider(collider)

while window:Closed() == false and window:KeyHit(KEY_ESCAPE) == false do
    world:Update()
    world:Render(framebuffer)
end
```
