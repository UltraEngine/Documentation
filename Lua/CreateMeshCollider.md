# CreateMeshCollider

This function creates a collider from a mesh or model.

## Syntax
- `CreateMeshCollider(geometry: shared_ptr<Mesh>): shared_ptr<Collider>`
- `CreateMeshCollider(geometry: shared_ptr<Model>): shared_ptr<Collider>`

## Parameters

| Name | Description |
|---|---|
| geometry | mesh or model to build the collision from |

## Remarks

An entity that uses a mesh collider will remain stationary and will not react to physics forces, although other objects will collide with it.

## Example

```lua
--Get display list
local displays = GetDisplays()

--Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_TITLEBAR | WINDOW_CENTER)

--Create framebuffer
local framebuffer = CreateFramebuffer(window)

--Load plugin for texture loading
local plugin = LoadPlugin("Plugins/FITextureLoader")

--Create world
local world = CreateWorld()

--Create camera
local camera = CreateCamera(world)
camera:SetFOV(70)
camera:Turn(15, 0, 0)
camera:Move(0, 0, -12)
camera:SetClearColor(0.125)

--Create light
local light = CreateDirectionalLight(world)
light:SetRotation(45, 35, 0)

--Load model
local model = LoadModel(world, "https://github.com/UltraEngine/Documentation/raw/master/Assets/Models/Structures/wooden%20bridge.glb")
model:SetRotation(0, 90, 0)

--Create collision
local collision = CreateMeshCollider(model)
model:SetCollider(collision)
model:SetCollisionType(COLLISION_SCENE)

--Add some objects to show collision
local boxes = {}
for n = 0, 4 do
    local box = CreateBox(world)
    box:SetScale(2)
    box:SetPosition(Random(-2, 2), 8 + 3 * n, Random(-2, 2))
    box:SetColor(0, Random(), Random())
    box:SetMass(1)
    table.insert(boxes, box)
end

while window:Closed() == false and window:KeyHit(KEY_ESCAPE) == false do
    world:Update()
    world:Render(framebuffer)
end
return 0
```