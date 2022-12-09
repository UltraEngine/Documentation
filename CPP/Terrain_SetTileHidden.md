# Terrain::SetTileHidden

This method is used to show or hide a single terrain tile.

## Syntax

- void **SetTileHidden**(const int x, const int y, const bool hidden)
- void **SetTileHidden**(const [iVec2](iVec2.md) coord, const bool hidden)

| Parameter | Description |
|---|---|
| coord, (x, y) | tile coordinate |
| hidden | if set to true the tile will be hidden, otherwise it will be visible |

## Example

This example lets you cut holes in the terrain.

![](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/terrain_settilehidden.jpg)

```c++
#include "UltraEngine.h"
#include "ComponentSystem.h"

using namespace UltraEngine;

const WString remotepath = "https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets";

int main(int argc, const char* argv[])
{
    //Get the display list
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Terrain Cut", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create a world
    auto world = CreateWorld();

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a camera
    auto camera = CreateCamera(world);
    camera->SetFov(70);
    camera->SetPosition(0, 100, -100);
    camera->SetRotation(45, 0, 0);
    camera->SetClearColor(0.125);

    //Sunlight
    auto light = CreateDirectionalLight(world);
    light->SetRotation(45, 35, 0);
    light->SetColor(2);

    //Create terrain
    auto terrain = CreateTerrain(world, 512);
    terrain->LoadHeightmap(remotepath + "/Terrain/512.r16");
    terrain->SetScale(1, 100, 1);

    //Create base material
    auto ground = CreateMaterial();
    auto diffusemap = LoadTexture(remotepath + "/Materials/Ground/river_small_rocks_diff_4k.dds");
    auto normalmap = LoadTexture(remotepath + "/Materials/Ground/river_small_rocks_nor_gl_4k.dds");
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
                    int radius = 10;
                    for (int x = pos.x - radius; x < pos.x + radius; ++x)
                    {
                        for (int y = pos.y - radius; y < pos.y + radius; ++y)
                        {
                            terrain->SetTileHidden(x, y, not window->KeyDown(KEY_CONTROL));
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
