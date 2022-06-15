# Terrain::SetElevation

This method sets the height of the terrain, taking into account its vertical scale.

## Syntax

- void **SetElevation**(const [iVec2](iVec2.md)& position, const float elevation)
- void **SetElevation**(const int x, const int y, const float elevation)

| Parameter | Description |
|---|---|
| position | position of the point to modify |
| x | x coordinate of the point to modify |
| y | y coordinate of the point to modify |
| elevation | height to set, between 0.0 and the terrain's vertical scale |

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Create a window
    auto window = CreateWindow("Terrain Sculpt", 0, 0, 1280, 720);

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

    //Create base material
    auto diffusemap = LoadTexture("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Materials/Ground/groundsoil.dds");
    auto normalmap = LoadTexture("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Materials/Ground/groundsoil_dot3.dds");
    auto mtl = CreateMaterial();
    mtl->SetTexture(diffusemap, TEXTURE_DIFFUSE);
    mtl->SetTexture(normalmap, TEXTURE_NORMAL);
    
    //Create terrain
    auto terrain = CreateTerrain(world, 512);
    terrain->SetScale(1, 100, 1);
    terrain->SetMaterial(mtl);
    terrain->BuildTiles(0, 0, terrain->resolution.x, terrain->resolution.y);

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
                            float h = terrain->GetElevation(pos.x, pos.y);
                            h += 1.0 * strength;
                            terrain->SetElevation(x, y, h);
                        }
                    }
                }
            }
        }

        if (ActiveWindow() == window) camera->UpdateControls(window);
        world->Update();
        world->Render(framebuffer, true);
    }
    return 0;
}
```
