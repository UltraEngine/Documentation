# Terrain:GetSlope

This method gets the terrain slope at the specified coordinate or 3D position.

## Syntax

- float **GetSlope**(const int tx, const int ty)
- float **GetSlope**(const [iVec2](iVec2.md)& coord)
- float **GetSlope**(const [xVec3](xVec3.md)& coord)
- float **GetSlope**(const dFloat x, const dFloat y, const dFloat z)

| Parameter | Description |
|---|---|
| coord, (tx, ty) | terrain coordinate |
| position, (x, y, z) | position in global space |

## Returns

Returns the terrain slope in degrees at the specified coordinate or the interpolated normal at the specified position in global space.

## Example

This example applies a material to a terrain based on the slope at each point.

![](https://raw.githubusercontent.com/Leadwerks/Documentation/master/Images/Terrain_GetSlope.jpg)

```lua
-- Get the display list
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_CENTER + WINDOW_TITLEBAR)

-- Create a world
local world = CreateWorld()
world:SetAmbientLight(0)

-- Create a framebuffer
local framebuffer = CreateFramebuffer(window)

-- Create a camera
local camera = CreateCamera(world)
camera:SetFov(70)
camera:SetPosition(0, 50, 0)
camera:SetRotation(45, 0, 0)
camera:SetClearColor(Vec4(0.125))

-- Sunlight
local light = CreateDirectionalLight(world)
light:SetRotation(45, 35, 0)
light:SetColor(2)

-- Create terrain
local terrain = CreateTerrain(world, 512)
terrain:LoadHeightmap("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Terrain/512.r16")
terrain:SetScale(1, 100, 1)

-- Create base material
local ground = CreateMaterial()
local diffusemap = LoadTexture("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Ground/river_small_rocks_diff_4k.dds")
local normalmap = LoadTexture("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Ground/river_small_rocks_nor_gl_4k.dds")
ground:SetTexture(diffusemap, TEXTURE_DIFFUSE)
ground:SetTexture(normalmap, TEXTURE_NORMAL)
local groundlayer = terrain:AddLayer(ground)
terrain:Fill(groundlayer)

-- Create paint material
local rocks = CreateMaterial()
diffusemap = LoadTexture("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Ground/Rocks_Dirt_Ground_2k.dds")
normalmap = LoadTexture("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Ground/Rocks_Dirt_Ground_2k_dot3.dds")
local dispmap = LoadTexture("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Ground/Rocks_Dirt_Ground_2k_disp.dds")
rocks:SetTexture(diffusemap, TEXTURE_DIFFUSE)
rocks:SetTexture(normalmap, TEXTURE_NORMAL)
rocks:SetTexture(dispmap, TEXTURE_DISPLACEMENT)

local rocklayer = terrain:AddLayer(rocks)

terrain:SetLayerScale(groundlayer, 4)
terrain:SetLayerScale(rocklayer, 8)

-- Apply material based on terrain slope
for x = 0, terrain.resolution.x - 1 do
    for y = 0, terrain.resolution.y - 1 do
        local slope = terrain:GetSlope(x, y)
        if slope > 15.0 then
            local wt = Min((slope - 15.0) / 10.0, 1.0)
            terrain:SetLayerWeight(rocklayer, x, y, wt)
        end
    end
end

-- Camera controls
require "Components/Player/CameraControls"
camera:AddComponent(CameraControls)

-- Main loop
while not window:Closed() and not window:KeyDown(KEY_ESCAPE) do
    world:Update()
    world:Render(framebuffer)
end
```
