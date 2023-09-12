# Probe:SetFadeDistance

This method sets the probe volume edge fade. This can be used to make specified edges of the probe fade in more gradually.

## Syntax

- **SetFadeDistance**(distance: number, face: number)

  - distance: fade distance
  - face: cubemap face, can be CUBEMAP_POSITIVE_X, CUBEMAP_NEGATIVE_X, CUBEMAP_POSITIVE_Y, CUBEMAP_NEGATIVE_Y, CUBEMAP_POSITIVE_Z, or CUBEMAP_NEGATIVE_Z

## Example

![Probe Example](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/probe.jpg)

```lua
-- Import required libraries
local UltraEngine = require("UltraEngine")
local ComponentSystem = require("ComponentSystem")

-- Store remote path
local remotepath = "https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets"

-- Create displays
local displays = UltraEngine.GetDisplays()

-- Create window
local window = UltraEngine.CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], UltraEngine.WINDOW_CENTER | UltraEngine.WINDOW_TITLEBAR)

-- Create framebuffer
local framebuffer = UltraEngine.CreateFramebuffer(window)
framebuffer:GetSize()

-- Create world
local world = UltraEngine.CreateWorld()
world:SetAmbientLight(0.05)

-- Set environment maps
local specmap = UltraEngine.LoadTexture(remotepath .. "/Materials/Environment/Storm/specular.dds")
local diffmap = UltraEngine.LoadTexture(remotepath .. "/Materials/Environment/Storm/diffuse.dds")
world:SetEnvironmentMap(specmap, UltraEngine.ENVIRONMENTMAP_SPECULAR)
world:SetEnvironmentMap(diffmap, UltraEngine.ENVIRONMENTMAP_DIFFUSE)

-- Create light
local light = UltraEngine.CreateDirectionalLight(world)
light:SetRotation(25, 315, 0)

-- Create camera
local camera = UltraEngine.CreateCamera(world)
camera:SetFOV(70)
camera:SetPosition(8, 2.5, 0)
camera:SetClearColor(0.125)

-- Create the scene
local wall = UltraEngine.CreateBox(world, 10, 5, 0.5)
wall:SetPosition(0, 2.5, 4.75)
wall:SetColor(0, 1, 1)

local wall2 = UltraEngine.CreateBox(world, 10, 5, 0.5)
wall2:SetPosition(0, 2.5, -4.75)
wall2:SetColor(1, 0, 0)

local wall3 = UltraEngine.CreateBox(world, 0.5, 5, 9)
wall3:SetPosition(-4.75, 2.5, 0)

local floor = UltraEngine.CreateBox(world, 20, 1, 20)
floor:SetPosition(0, -0.5, 0)

local ceil = UltraEngine.CreateBox(world, 10, 0.5, 10)
ceil:SetPosition(0, 5.25, 0)

local drag = UltraEngine.LoadModel(world, remotepath .. "/Models/Stanford/dragon.glb")
drag:SetScale(0.1)
drag:SetColor(1, 1, 1, 1, true)
drag:SetReflection(false)
local mtl = UltraEngine.CreateMaterial()
mtl:SetMetalness(0.75)
mtl:SetRoughness(0)
drag:SetMaterial(mtl, true)

-- Create environment probe
local probe = UltraEngine.CreateProbe(world)
probe:SetScale(9.5, 5, 9.5)
probe:SetPosition(0, 2.5, 0)
probe:SetFadeDistance(1, UltraEngine.CUBEMAP_POSITIVE_X)
probe:SetFadeDistance(0, UltraEngine.CUBEMAP_NEGATIVE_X)
probe:SetFadeDistance(0, UltraEngine.CUBEMAP_POSITIVE_Y)
probe:SetFadeDistance(0, UltraEngine.CUBEMAP_NEGATIVE_Y)
probe:SetFadeDistance(0, UltraEngine.CUBEMAP_POSITIVE_Z)
probe:SetFadeDistance(0, UltraEngine.CUBEMAP_NEGATIVE_Z)

-- Camera controls
local actor = UltraEngine.CreateActor(camera)
actor:AddComponent(ComponentSystem.CameraControls())

-- Main loop
while window:Closed() == false and window:KeyDown(UltraEngine.KEY_ESCAPE) == false do
    world:Update()
    world:Render(framebuffer, true)
end
```