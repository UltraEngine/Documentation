# Model::SetLodDistance

This method sets the base Lod distance factor.

- void **SetLodDistance**(number basefactor)

| Parameter | Description |
|---|---|
| basefactor | distance factor for Lod changes |

## Remarks

Each level of detail above zero will be shown when the distance from the center of the model's global bounding box to the camera exceeds the level's distance, as calculated by this equation:

distance = (2 ^ (level - 1)) * basefactor

For example, if basefactor is 10 then Lod 1 will be shown at a distance of 10 meters, Lod 2 will be shown at a distance of 20 meters, and Lod 3 will be shown at a distance of 40 meters.

## Example

```lua
--Get the displays
local displays = GetDisplays()

--Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_CENTER | WINDOW_TITLEBAR)

--Create a world
local world = CreateWorld()

--Create a framebuffer
local framebuffer = CreateFramebuffer(window)

--Create a camera
local camera = CreateCamera(world)
camera:SetClearColor(0.125)
camera:SetPosition(0, 0, -1)
camera:SetWireframe(true)
camera:SetFOV(70)

--Create a light
local light = CreateBoxLight(world)
light:SetRotation(45, 35, 0)
light:SetRange(-10, 10)
light:SetColor(2)

--Create a model
local model = CreateSphere(world, 0.5, 64)
model:SetColor(0, 1, 0)

--Add Lod
local temp = CreateSphere(world, 0.5, 32)
model:AddLod()
model:AddMesh(temp["lods"][1]["meshes"][1], 1)

--Add Lod
temp = CreateSphere(world, 0.5, 16)
model:AddLod()
model:AddMesh(temp["lods"][1]["meshes"][1], 2)

--Add Lod
temp = CreateSphere(world, 0.5, 8)
model:AddLod()
model:AddMesh(temp["lods"][1]["meshes"][1], 3)
temp = nil

model:SetLodDistance(1)

local z = camera.position.z

--Main loop
while not window:Closed() and not window:KeyDown(KEY_ESCAPE) do
    --Move the camera forward and backwards to change detail levels
    if window:KeyDown(KEY_UP) then
        z = z + 0.005
    end
    if window:KeyDown(KEY_DOWN) then
        z = z - 0.005
    end
    z = math.min(-1.0, z)
    camera:SetPosition(0,0,z)

    world:Update()
    world:Render(framebuffer)
end

return 0
```
