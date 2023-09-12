## Terrain:SetMaterial

This method sets the terrain material at any point on the heightmap.

## Syntax
- **SetMaterial**(material: [Material](Material.md), recursive: boolean = false) : boolean
- **SetMaterial**(coord: [iVec2](iVec2.md), material: [Material](Material.md), weight: number = 1.0, normalize: boolean = true) : boolean
- **SetMaterial**(x: number, y: number, material: [Material](Material.md), weight: number = 1.0, normalize: boolean = true) : boolean

### Parameters
- **material**: The material to apply.
- **recursive**: If set to true, the material will be applied to all children in the entity's subhierarchy.
- **coord**: The terrain point to modify.
- **x**: The x-coordinate of the terrain point to modify.
- **y**: The y-coordinate of the terrain point to modify.
- **weight**: The influence the material has at this point.
- **normalize**: If set to true, other materials at this point will be adjusted so the sum of all material weights is 1.0.

### Returns
- If the specified point lies outside of the terrain area, false is returned.
- If the terrain is not currently using the specified material but is already using the maximum number of materials, false is returned. Otherwise, true is returned.

## Remarks
Terrains can use a maximum of 256 different materials each. Up to four materials can influence each point.

The first variation of this method will apply the specified material to one point on the terrain, with a weighting value. Up to four materials can be applied to any terrain point. Their weights will be normalized before rendering. If the material has already been applied at this terrain point, its weighting value will be replaced.

The second variation will apply the material to the entire terrain.

If the terrain point already has four materials applied, the material with the lowest influence less than or equal to the influence parameter will be replaced. If all materials have a higher influence than the new material, no change will occur.

If the material is null, with any variation of this method, all materials will be removed.

If the terrain already is using the maximum number of materials, no change will occur.

## Example

This example lets you paint a material onto the terrain.

![Terrain Example](https://raw.githubusercontent.com/Leadwerks/Documentation/master/Images/terrain_setmaterial.jpg)

```lua
-- Create a window
local window = CreateWindow("Terrain Paint", 0, 0, 1280, 720, WINDOW_CENTER | WINDOW_TITLEBAR)

-- Create a world
local world = CreateWorld()
world:SetAmbientLight(0)

-- Create a framebuffer
local framebuffer = CreateFramebuffer(window)

-- Create a camera
local camera = CreateCamera(world)
camera:SetFov(70)
camera:SetPosition(0, 100, -100)
camera:SetRotation(45, 0, 0)
camera:SetClearColor(0.125)

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
terrain:SetMaterial(ground)

-- Create paint material
local rocks = CreateMaterial()
diffusemap = LoadTexture("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Ground/Rocks_Dirt_Ground_2k.dds")
normalmap = LoadTexture("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Ground/Rocks_Dirt_Ground_2k_dot3.dds")
local dispmap = LoadTexture("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Ground/Rocks_Dirt_Ground_2k_disp.dds")
rocks:SetTexture(diffusemap, TEXTURE_DIFFUSE)
rocks:SetTexture(normalmap, TEXTURE_NORMAL)
rocks:SetTexture(dispmap, TEXTURE_DISPLACEMENT)

-- Main loop
while not window:Closed() and not window:KeyDown(KEY_ESCAPE) do
    if window:MouseDown(MOUSE_LEFT) then
        local mousepos = window:GetMousePosition();
        local pickinfo = camera:Pick(framebuffer, mousepos.x, mousepos.y);
        if pickinfo.success then
            if pickinfo.entity == terrain then
                local pos = {}
                pos.x = Round(pickinfo.position.x) + terrain.resolution.x / 2;
                pos.y = Round(pickinfo.position.z) + terrain.resolution.y / 2;
                local radius = 20;
                for x = pos.x - radius, pos.x + radius do
                    for y = pos.y - radius, pos.y + radius do
                        local strength = 1.0 - Vec3(x, y, 0):DistanceToPoint(Vec3(pos.x, pos.y, 0)) / radius;
                        if strength <= 0.0 then
                            continue
                        end
                        local wt = terrain:GetMaterialWeight(x, y, rocks)
                        wt = wt + 0.1
                        terrain:SetMaterial(x, y, rocks, wt)
                    end
                end
            end
        end
    end
    world:Update()
    world:Render(framebuffer)
end
```
