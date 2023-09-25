# CreateConvexHullCollider

This function creates a convex hull that encapsulates all vertices of the input geometry.

## Syntax

- [Collider](Collider.md) **CreateConvexHullCollider**([Mesh](Mesh.md) geometry)
- [Collider](Collider.md) **CreateConvexHullCollider**([Model](Model.md) geometry)
- [Collider](Collider.md) **CreateConvexHullCollider**([table](https://www.lua.org/manual/5.4/manual.html#6.6) points)

| Parameter | Description |
|---|---|
| geometry | mesh or model to build the collision from |
| points | array of [Vec3](Vec3.md) vertices |

## Example

```lua
-- Get display list
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_TITLEBAR | WINDOW_CENTER)

-- Create framebuffer
local framebuffer = CreateFramebuffer(window)

-- Create world
local world = CreateWorld()

-- Create camera
local camera = CreateCamera(world)
camera:SetFov(70)
camera:Turn(15, 0, 0)
camera:Move(0, 2, -8)
camera:SetClearColor(0.125)

-- Create light
local light = CreateDirectionalLight(world)
light:SetColor(2)
light:SetRotation(45, 35, 0)

-- Create ground
local ground = CreateBox(world, 10, 1, 10)
ground:SetPosition(0, -0.5, 0)
ground:SetColor(0,1,0)

-- Create model
local model = CreateCylinder(world, 1, 1, 5)
model:SetPosition(0, 8, 0)
model:SetColor(0, 0, 1)
model:SetMass(1)
model:Turn(90, 30, 0)

-- Create collision
local collider = CreateConvexHullCollider(model)
model:SetCollider(collider)

while window:Closed() == false and window:KeyHit(KEY_ESCAPE) == false do
    world:Update()
    world:Render(framebuffer)
end
```
