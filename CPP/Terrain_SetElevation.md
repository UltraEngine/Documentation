# Terrain::SetElevation

This method sets the height of the terrain, taking into account its vertical scale.

## Syntax

- void **SetElevation**(const int x, const int y, const float elevation)
- void **SetElevation**(const [iVec2](iVec2.md)& coord, const float elevation)

| Parameter | Description |
|---|---|
| coord, (x, y) | terrain coordinate |
| elevation | height to set, between 0 and the terrain's vertical scale |

## Example

```c++
#include "UltraEngine.h"
#include "ComponentSystem.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays list
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Terrain Sculpt", 0, 0, 1280, 720, displays[0], WINDOW_TITLEBAR | WINDOW_CENTER);

    //Create a world
    auto world = CreateWorld();

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a camera
    auto camera = CreateCamera(world);
    camera->SetFOV(70);
    camera->SetPosition(0, 100, -100);
    camera->SetRotation(45, 0, 0);
    camera->SetClearColor(0.125);

    //Sunlight
    auto light = CreateDirectionalLight(world);
    light->SetRotation(45, 35, 0);

    //Create terrain
    auto terrain = CreateTerrain(world, 512);
    terrain->SetScale(1, 100, 1);

    //Create base material
    auto diffusemap = LoadTexture("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Ground/river_small_rocks_diff_4k.dds");
    auto normalmap = LoadTexture("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Ground/river_small_rocks_nor_gl_4k.dds");
    auto ground = CreateMaterial();
    ground->SetTexture(diffusemap, TEXTURE_DIFFUSE);
    ground->SetTexture(normalmap, TEXTURE_NORMAL);
    terrain->SetMaterial(ground);

    //Camera controls
    auto actor = CreateActor(camera);
    actor->AddComponent<CameraControls>();

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        if (window->MouseDown(MOUSE_LEFT))
        {
            auto mousepos = window->GetMousePosition();
            auto pickinfo = camera->Pick(framebuffer, mousepos.x, mousepos.y);
            if (pickinfo.success)
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
                            float h = terrain->GetElevation(x, y);
                            h += 0.5 * strength;
                            terrain->SetElevation(x, y, h);
                        }
                    }
                }
            }
        }

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
