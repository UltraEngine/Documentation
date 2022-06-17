# Terrain::SetTileHidden


## Example

This example lets you cut holes in the terrain.

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

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
    camera->SetFOV(70);
    camera->SetPosition(0, 100, -300);
    //camera->SetRotation(-45, 0, 0);
    camera->SetClearColor(0.125);
    camera->SetDepthPrepass(false);
    camera->SetTessellation(8);// uncomment this line for tessellation
    
    //Sunlight
    auto light = CreateLight(world, LIGHT_DIRECTIONAL);
    light->SetRotation(65, 35, 0);

    //Create terrain
    auto terrain = CreateTerrain(world, 512);
    terrain->LoadHeightmap("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Terrain/512.r16");
    terrain->SetScale(1, 200, 1);

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

    for (int x = 0; x < terrain->resolution.x / 2; ++x)
    {
        for (int y = 0; y < terrain->resolution.y / 2; ++y)
        {
         //   terrain->SetTileHidden(x, y, true);
        }
    }

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
                    int radius = 10;
                    auto layer = rocks;
                    if (window->KeyDown(KEY_CONTROL)) layer = ground;
                    for (int x = pos.x - radius; x < pos.x + radius; ++x)
                    {
                        for (int y = pos.y - radius; y < pos.y + radius; ++y)
                        {
                            float strength = 1.0f - Vec3(x, y, 0).DistanceToPoint(Vec3(pos.x, pos.y, 0)) / float(radius);
                            //if (strength <= 0.0f) continue;
                            float wt = terrain->GetMaterialWeight(x, y, layer);
                            wt += 0.1f;
                            //terrain->SetMaterial(x, y, layer, wt);
                            terrain->SetTileHidden(x, y, not window->KeyDown(KEY_CONTROL));
                        }
                    }
                }
            }
        }

        //Simple camera controls
        if (ActiveWindow() == window) camera->UpdateControls(window);

        world->Update();
        world->Render(framebuffer, false);
    }
    return 0;
}
```
