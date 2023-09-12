# Model:AddLod

This method adds a [Lod](Lod.md) to a model.

## Syntax

```lua
function Model:AddLod() -> number
```

## Returns

Returns the index of the new level of detail.

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_CENTER | WINDOW_TITLEBAR)

-- Create a world
local world = CreateWorld()

-- Create a framebuffer
local framebuffer = CreateFramebuffer(window)

-- Create a camera
local camera = CreateCamera(world)
camera:SetClearColor(0.125)
camera:SetPosition(0, 0, -1)
camera:SetWireframe(true)
camera:SetFOV(70)

-- Create a light
local light = CreateBoxLight(world)
light:SetRotation(45, 35, 0)
light:SetRange(-10, 10)
light:SetColor(2)

-- Create a model
local model = CreateSphere(world, 0.5, 64)
model:SetColor(0, 1, 0)

-- Add Lod
local temp = CreateSphere(world, 0.5, 32)
model:AddLod()
model:AddMesh(temp.lods[1].meshes[1], 1)

-- Add Lod
temp = CreateSphere(world, 0.5, 16)
model:AddLod()
model:AddMesh(temp.lods[1].meshes[1], 2)

-- Add Lod
temp = CreateSphere(world, 0.5, 8)
model:AddLod()
model:AddMesh(temp.lods[1].meshes[1], 3)
temp = nil

model:SetLodDistance(1)

local z = camera.position.z

-- Main loop
while window:Closed() == false and window:KeyDown(KEY_ESCAPE) == false do
    -- Move the camera forward and backwards to change detail levels
    if window:KeyDown(KEY_UP) then z = z + 0.005 end
    if window:KeyDown(KEY_DOWN) then z = z - 0.005 end
    z = math.min(-1.0, z)
    camera:SetPosition(0, 0, z)

    world:Update()
    world:Render(framebuffer)
end
return 0
```