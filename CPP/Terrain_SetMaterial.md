# Terrain::SetMaterial

This method sets the terrain material at any point on the heightmap. 

## Syntax

- bool **SetMaterial**(const [iVec2](iVec2.md) coord, shared_ptr<[Material](Material.md)\> material, const float weight = 1.0f, const bool normalize = true)
- bool **SetMaterial**(const int x, const int y, shared_ptr<[Material](Material.md)\> material, const float weight = 1.0f, const bool normalize = true)
- bool **SetMaterial**(shared_ptr<[Material](Material.md)\> material, const bool recursive = false)

| Parameter | Description |
|---|---|
| material | material to apply |
| weight | influence the material has at this point |
| normalize | if set to true, other materials at this point will be adjusted so the sum of all material weights is 1.0 |
| recursive | if set to true, the material will be applied to all children in the entity's subhierarchy |

## Returns

If the specified point lies outside of the terrain area, false is returned.

If the terrain is not currently using the specified material but is already using the maximum number of materials false is returned, otherwise true is returned.

## Remarks

Terrains can use a maximum of 256 different materials each. Up to four materials can influence each point.

The first variation of this method will apply the specified material to one point on the terrain, with a weighting value. Up to four materials can be applied to any terrain point. Their weights will be normalized before rendering. If the material has already been applied at this terrain point, its weighting value will be replaced.

The second variation will apply the material to the entire terrain.

If the terrain point already has four materials applied, the material with the lowest influence less than or equal to the influence parameter will be replaced. If all materials have a higher influence than the new material, no change will occur.

If material is NULL, with any variation of this method, all materials will be removed.

If the terrain already is using the maximum number of materials, no change will occur.

## Example

![](https://raw.githubusercontent.com/Leadwerks/Documentation/master/Images/terrain_setmaterial.jpg)

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the display list
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Terrain Paint", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create a world
    auto world = CreateWorld();

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);
    
    //Create a camera
    auto camera = CreateCamera(world);
    camera->SetFOV(70);
    camera->SetPosition(0, 60, -60);
    camera->SetRotation(-45, 0, 0);
    camera->SetClearColor(0.125);
    //camera->SetTessellation(8);// uncomment this line for tessellation

    //Sunlight
    auto light = CreateLight(world, LIGHT_DIRECTIONAL);
    light->SetRotation(65, 35, 0);

    //Create terrain
    auto terrain = CreateTerrain(world, 512);
    terrain->LoadHeightmap("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Terrain/512.r16");
    terrain->SetScale(1, 100, 1);
    
    //Create base material
    auto ground = CreateMaterial();
    auto diffusemap = LoadTexture("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Materials/Ground/river_small_rocks_diff_4k.dds");
    auto normalmap = LoadTexture("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Materials/Ground/river_small_rocks_nor_gl_4k.dds");
    ground->SetTexture(diffusemap, TEXTURE_DIFFUSE);
    ground->SetTexture(normalmap, TEXTURE_NORMAL);
    terrain->SetMaterial(ground);

    //Create paint material
    auto rocks = CreateMaterial();
    diffusemap = LoadTexture("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Materials/Ground/Rocks_Dirt_Ground_2k.dds");
    normalmap = LoadTexture("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Materials/Ground/Rocks_Dirt_Ground_2k_dot3.dds");
    auto dispmap = LoadTexture("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Materials/Ground/Rocks_Dirt_Ground_2k_disp.dds");
    rocks->SetTexture(diffusemap, TEXTURE_DIFFUSE);
    rocks->SetTexture(normalmap, TEXTURE_NORMAL);
    rocks->SetTexture(dispmap, TEXTURE_DISPLACEMENT);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        if (window->MouseDown(MOUSE_LEFT))
        {
            auto mousepos = window->GetMousePosition();
            PickInfo pickinfo;
            if (camera->Pick(framebuffer, mousepos.x, mousepos.y, pickinfo))
            {
                if (pickinfo.entity == terrain)
                {
                    iVec2 pos;
                    pos.x = Round(pickinfo.position.x) + terrain->resolution.x / 2;
                    pos.y = Round(pickinfo.position.z) + terrain->resolution.y / 2;
                    int radius = 20;
                    for (int x = pos.x - radius; x < pos.x + radius; ++x)
                    {
                        for (int y = pos.y - radius; y < pos.y + radius; ++y)
                        {
                            float strength = 1.0f - Vec3(x, y, 0).DistanceToPoint(Vec3(pos.x, pos.y, 0)) / float(radius);
                            if (strength <= 0.0f) continue;
                            float wt = terrain->GetMaterialWeight(x, y, rocks);
                            wt += 0.1f;
                            terrain->SetMaterial(x, y, rocks, wt);
                        }
                    }
                }
            }
        }

        //Simple camera controls
        if (ActiveWindow() == window) camera->UpdateControls(window);

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
