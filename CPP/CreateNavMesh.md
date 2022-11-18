# CreateNavMesh

This function creates a new navigation mesh for pathfinding.

## Syntax

- shared_ptr<[NavMesh](NavMesh.md)\> **CreateNavMesh**(shared_ptr<[World](World.md)\> world, const float width, const float height, const float depth, const int tilesx, const int tilesz, const float voxelsize = 0.25, const float agentradius = 0.4, const float agentheight = 1.8, const float agentstepheight = 0.501, const float maxslope = 45.01);

| Parameter | Description |
| --- | --- |
| world | world to create the navmesh in |
| width | width of the navmesh volume |
| height | width of the navmesh volume |
| depth | width of the navmesh volume |
| tilesx | number of tiles along the X axis |
| tilesz | number of tiles along the Z axis |
| voxelsize | resolution of voxel grid |
| agentradius | radius of the characters that will use this navmesh |
| agentheight | height of the characters that will use this navmesh |
| agentstepheight | maximum height that can be stepped up |
| maxslope | maximum slope that can be traversed, in degrees |

## Returns

Returns a new Navmesh object.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a world
    auto world = CreateWorld();

    //Create a camera    
    auto camera = CreateCamera(world);
    camera->SetFOV(70);
    camera->SetClearColor(0.125);
    camera->SetPosition(0, 3, -6);
    camera->SetRotation(35,0,0);

    //Create light
    auto light = CreateBoxLight(world);
    light->SetRange(-20, 20);
    light->SetArea(20, 20);
    light->SetRotation(35, 35, 0);
    light->SetColor(3);

    //Create scene
    auto ground = CreateBox(world, 10, 1, 10);
    ground->SetPosition(0, -0.5, 0);
    ground->SetColor(0, 1, 0);
    auto wall = CreateBox(world, 1, 2, 4);

    //Create navmesh
    auto navmesh = CreateNavMesh(world, 10, 5, 10, 4, 4);
    navmesh->Build();

    //Create player
    auto player = CreateCylinder(world, 0.4, 1.8);
    player->SetColor(0, 0, 1);
    auto agent = CreateNavAgent(navmesh);
    player->Attach(agent);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        if (window->MouseHit(MOUSE_LEFT))
        {
            auto mousepos = window->GetMousePosition();
            auto rayinfo = camera->Raycast(framebuffer, mousepos.x, mousepos.y);
            if (rayinfo.success)
            {
                agent->Navigate(rayinfo.position);
            }
        }

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
