# CreateTerrain

This function creates a new terrain entity.

## Syntax

```lua
function CreateTerrain(world: World, width: number, height: number): shared_ptr<Terrain>
function CreateTerrain(world: World, resolution: iVec2): shared_ptr<Terrain>
```

| Parameter | Description |
|---|---|
| world | world to create the terrain in |
| resolution, (width, height) | number of terrain points on each axis |

## Example

```lua
window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR)
world = CreateWorld()
world:SetAmbientLight(0)
framebuffer = CreateFramebuffer(window)
camera = CreateCamera(world)
camera:SetFOV(70)
camera:SetPosition(0, 50, 0)
camera:SetRotation(45, 0, 0)
camera:SetClearColor(0.125)
light = CreateDirectionalLight(world)
light:SetRotation(45, 35, 0)
light:SetColor(2)
terrain = CreateTerrain(world, iVec2(512, 512))
terrain:LoadHeightmap("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Terrain/512.r16")
terrain:SetScale(1, 100, 1)
ground = CreateMaterial()
diffusemap = LoadTexture("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Ground/river_small_rocks_diff_4k.dds")
normalmap = LoadTexture("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Ground/river_small_rocks_nor_gl_4k.dds")
ground:SetTexture(diffusemap, TEXTURE_DIFFUSE)
ground:SetTexture(normalmap, TEXTURE_NORMAL)
terrain:SetMaterial(ground)
rocks = CreateMaterial()
diffusemap = LoadTexture("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Ground/Rocks_Dirt_Ground_2k.dds")
normalmap = LoadTexture("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Ground/Rocks_Dirt_Ground_2k_dot3.dds")
dispmap = LoadTexture("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Ground/Rocks_Dirt_Ground_2k_disp.dds")
rocks:SetTexture(diffusemap, TEXTURE_DIFFUSE)
rocks:SetTexture(normalmap, TEXTURE_NORMAL)
rocks:SetTexture(dispmap, TEXTURE_DISPLACEMENT)
for x = 0, terrain.resolution.x - 1 do
    for y = 0, terrain.resolution.y - 1 do
        slope = terrain:GetSlope(x, y)
        if slope > 15.0 then
            wt = math.min((slope - 15.0) / 10.0, 1.0)
            terrain:SetMaterial(x, y, rocks, wt)
        end
    end
end
camera:AddComponent(CameraControls)
while window:Closed() == false and window:KeyDown(KEY_ESCAPE) == false do
    world:Update()
    world:Render(framebuffer)
end
```

Note: The code has been changed to Lua syntax and the required libraries have been removed assuming they have already been imported.