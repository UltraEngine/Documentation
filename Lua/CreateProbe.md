# CreateProbe

This function creates a new environment probe.

## Syntax

- [Probe](Probe.md) **CreateProbe**([World](World.md) world)

| Paraemter | Description |
|---|---|
| world | world to create the entity in |

## Returns

Returns a new probe entity.

## Example

<img src="https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/probe.jpg">

```lua
local remotePath = "https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets"

-- Get the displays
local displays = GetDisplays()

-- Create window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_CENTER + WINDOW_TITLEBAR)

-- Create framebuffer
local framebuffer = CreateFramebuffer(window)
framebuffer:GetSize()

-- Create world
local world = CreateWorld()
world:SetAmbientLight(0.05)

-- Set environment maps
local specmap = LoadTexture(remotePath .. "/Materials/Environment/Storm/specular.dds")
local diffmap = LoadTexture(remotePath .. "/Materials/Environment/Storm/diffuse.dds")
world:SetEnvironmentMap(specmap, ENVIRONMENTMAP_SPECULAR)
world:SetEnvironmentMap(diffmap, ENVIRONMENTMAP_DIFFUSE)

-- Create light
local light = CreateDirectionalLight(world)
light:SetRotation(25, 315, 0)

-- Create camera
local camera = CreateCamera(world)
camera:SetFOV(70)
camera:SetPosition(8, 2.5, 0)
camera:SetClearColor(0.125)

-- Create the scene
local wall = CreateBox(world, 10, 5, 0.5)
wall:SetPosition(0, 2.5, 4.75)
wall:SetColor(0, 1, 1)

local wall2 = CreateBox(world, 10, 5, 0.5)
wall2:SetPosition(0, 2.5, -4.75)
wall2:SetColor(1, 0, 0)

local wall3 = CreateBox(world, 0.5, 5, 9)
wall3:SetPosition(-4.75, 2.5, 0)

local floor = CreateBox(world, 20, 1, 20)
floor:SetPosition(0, -0.5, 0)

local ceil = CreateBox(world, 10, 0.5, 10)
ceil:SetPosition(0, 5.25, 0)

local drag = LoadModel(world, remotePath .. "/Models/Stanford/dragon.glb")
drag:SetScale(0.1)
drag:SetColor(1, 1, 1, 1, true)
drag:SetReflection(false)
local mtl = CreateMaterial()
mtl:SetMetalness(0.75)
mtl:SetRoughness(0)
drag:SetMaterial(mtl, true)

-- Create environment probe
local probe = CreateProbe(world)
probe:SetScale(9.5, 5, 9.5)
probe:SetPosition(0, 2.5, 0)
probe:SetFadeDistance(1, CUBEMAP_POSITIVE_X)
probe:SetFadeDistance(0, CUBEMAP_NEGATIVE_X)
probe:SetFadeDistance(0, CUBEMAP_POSITIVE_Y)
probe:SetFadeDistance(0, CUBEMAP_NEGATIVE_Y)
probe:SetFadeDistance(0, CUBEMAP_POSITIVE_Z)
probe:SetFadeDistance(0, CUBEMAP_NEGATIVE_Z)

-- Camera controls
local actor = CreateActor(camera)
actor:Component<CameraControls>()

-- Main loop
while not window:Closed() and not window:KeyDown(KEY_ESCAPE) do
    world:Update()
    world:Render(framebuffer, true)
end
```

Note: The markdown links to `Probe.md` and `World.md` have been retained, assuming they contain the documentation for Probe and World respectively.
