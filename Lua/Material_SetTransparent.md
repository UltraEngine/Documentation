# Material:SetTransparent

This method sets the transparency mode of the material.

## Syntax

- **SetTransparent**(boolean mode)

## Example

![refraction.jpg](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/refraction.jpg)

```lua
--Get the displays
local displays = GetDisplays()

--Create window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_CENTER | WINDOW_TITLEBAR)

--Create framebuffer
local framebuffer = CreateFramebuffer(window)
framebuffer:GetSize()

--Create world
local world = CreateWorld()
world:SetAmbientLight(0.05)

--Set environment maps
local remotepath = "https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets";
local specmap = LoadTexture(remotepath .. "/Materials/Environment/Storm/specular.dds")
local diffmap = LoadTexture(remotepath .. "/Materials/Environment/Storm/diffuse.dds")
world:SetEnvironmentMap(specmap, ENVIRONMENTMAP_BACKGROUND)
world:SetEnvironmentMap(specmap, ENVIRONMENTMAP_SPECULAR)
world:SetEnvironmentMap(diffmap, ENVIRONMENTMAP_DIFFUSE)

--Create light
local light = CreateBoxLight(world)
light:SetRotation(45, 35, 0)
light:SetArea(30, 30)
light:SetRange(-20, 20)

--Create camera
local camera = CreateCamera(world)
camera:SetFov(70)
camera:SetPosition(0, 1.5, -4)
camera:SetClearColor(0.125)
camera:SetRefraction(true)

--Create the scene
local floor = CreateBox(world, 20, 1, 20)
floor:SetPosition(0, -0.5, 0)
local floormtl = CreateMaterial()
floormtl:SetTexture(LoadTexture(remotepath .. "/Materials/tiles.dds"))
floor:SetMaterial(floormtl)

local drag = LoadModel(world, remotepath .. "/Models/Stanford/dragon.glb")
drag:SetScale(0.1)
drag:SetColor(1, 1, 1, 1, true)

--Transparent material
local mtl = CreateMaterial()
mtl:SetColor(1, 1, 1, 0.5)
mtl:SetMetalness(0.5)
mtl:SetRoughness(0.5)
mtl:SetTransparent(true)
drag:SetMaterial(mtl, true)

local camerarotation = Vec3(0)
local axis = Vec3(0)

--Main loop
while window:Closed() == false and window:KeyDown(KEY_ESCAPE) == false do

    --Camera rotate controls
    local newpos = window:GetMouseAxis()
    local diff = newpos - axis
    axis = newpos
    camerarotation.x = camerarotation.x + diff.y * 50.0
    camerarotation.y = camerarotation.y + diff.x * 50.0
    camera:SetPosition(0, 1.5, 0)
    camera:SetRotation(camerarotation)
    camera:Move(0, 0, -4)

    world:Update()
    world:Render(framebuffer, true)
end
```
