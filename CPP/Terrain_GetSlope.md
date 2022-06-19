# Terrain::GetSlope

This method gets the slopw of the terrain at the specified point.

## Syntax

- float **GetSlope**(const [iVec2](iVec2.md)& position)
- float **GetSlope**(const int x, const int y)

## Returns

Returns the terrain slope in degrees.

## Example

This example applies a material to a terrain based on the slope at each point.

![](https://raw.githubusercontent.com/Leadwerks/Documentation/master/Images/Terrain_GetSlope.jpg)

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
    camera->SetPosition(0, 50, 0);
    camera->SetRotation(45, 0, 0);
    camera->SetClearColor(0.125);
    camera->SetDepthPrepass(false);
    
    //Sunlight
    auto light = CreateLight(world, LIGHT_DIRECTIONAL);
    light->SetRotation(65, 35, 0);
     
    //Create terrain
    auto terrain = CreateTerrain(world, 512);
    terrain->LoadHeightmap("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Terrain/512.r16");
    terrain->SetScale(1,100, 1);
    
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

    //Apply material based on terrain slope
    for (int x = 0; x < terrain->resolution.x; ++x)
    {
        for (int y = 0; y < terrain->resolution.y; ++y)
        {
            float slope = terrain->GetSlope(x, y);
            if (slope > 15.0f)
            {
                float wt = Min((slope - 15.0f) / 10.0f, 1.0f);
                terrain->SetMaterial(x, y, rocks, wt);
            }
        }
    }

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        //Simple camera controls
        if (ActiveWindow() == window) camera->UpdateControls(window);

        //Update the world
        world->Update();

        //Render the world
        world->Render(framebuffer, false);
    }
    return 0;
}
```
