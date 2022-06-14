# Terrain::SetMaterial

This method sets the terrain material at any point on the heightmap. Up to four materials can be set per point.

## Syntax

- bool **SetMaterial**(const [iVec2](iVec2.md) coord, shared_ptr<[Material](Material.md)\> material, const float weight = 1.0f, const bool normalize = true)
- bool **SetMaterial**(const int x, const int y, shared_ptr<[Material](Material.md)\> material, const float weight = 1.0f, const bool normalize = true)
- bool **SetMaterial**(shared_ptr<[Material](Material.md)\> material, const bool recursive = false)
- bool **SetMaterial**(shared_ptr<[Material](Material.md)\> material, const [Vec3](Vec3.md)& slopeconstraints)
- bool **SetMaterial**(shared_ptr<[Material](Material.md)\> material, const [Vec3](Vec3.md)& slopeconstraints, const [Vec3](Vec3.md)& elevationconstraints)

| Parameter | Description |
|---|---|
| material | material to apply |
| weight | influence the material has at this point |
| normalize | if set to true, other materials at this point will be adjusted so the sum of all material weights is 1.0 |
| recursive | if set to true, the material will be applied to all children in the entity's subhierarchy |
| slopeconstraints | minimum and maximum slope over which the material will appear, and blending range, in degrees |
| elevationconstraints | minimum and maximum elevation over which the material will appear, and blending range, in meters |

## Returns

If the terrain is not currently using the specified material but is already using the maximum number of materials false is returned, otherwise true is returned.

## Remarks

The first variation of this method will apply the specified material to one point on the terrain, with a weighting value. Up to four materials can be applied to any terrain point. Their weights will be normalized before rendering. If the material has already been applied at this terrain point, its weighting value will be replaced.

The second variation will apply the material to the entire terrain.

The third and fourth variations will apply the material to the entire terrain, using slope and height constraints to determine where it should appear. The x coordinate of the constraint is the minimum value above which the material will appear. The y coordinate is the maximum value below which the material will appear. The z coordinate is a range over which the material will be blended in.

If the terrain point already has four materials applied, the material with the lowest influence less than or equal to the influence parameter will be replaced. If all materials have a higher influence than the new material, no change will occur.

If material is NULL, with any variation of this method, all materials will be removed.

If the terrain already is using the maximum number of materials, no change will occur.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Create a window
    auto window = CreateWindow("Terrain Paint", 0, 0, 1280, 720);

    //Create a world
    auto world = CreateWorld();

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);
    
    //Create a camera
    auto camera = CreateCamera(world);
    camera->SetFOV(70);
    camera->SetPosition(0, 15, -15);
    camera->SetClearColor(0.125);

    //Sunlight
    auto light = CreateLight(world, LIGHT_DIRECTIONAL);
    light->SetRotation(65, 35, 0);

    //Create terrain
    auto terrain = CreateTerrain(world, 512);
    terrain->SetScale(1, 100, 1);

    //Create base material
    auto diffusemap = LoadTexture("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Materials/Ground/groundsoil.dds");
    auto normalmap = LoadTexture("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Materials/Ground/groundsoil_dot3.dds");
    auto mtl = CreateMaterial();
    mtl->SetTexture(diffusemap, TEXTURE_DIFFUSE);
    mtl->SetTexture(normalmap, TEXTURE_NORMAL);
    terrain->SetMaterial(mtl);

    //Create paint material
    auto mtl2 = CreateMaterial();
    mtl2->SetColor(0, 1, 1, 1);

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
                            float wt = terrain->GetMaterialWeight(x, y, mtl2);
                            wt += 0.02f;
                            terrain->SetMaterial(x, y, mtl2, wt, true);
                        }
                    }
                }
            }
        }

        if (ActiveWindow() == window) camera->UpdateControls(window);
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
