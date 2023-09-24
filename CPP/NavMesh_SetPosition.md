# NavMesh::SetPosition

This method can be used to move a navigation mesh.

## Syntax

- void **SetPosition**(const dFloat x, const dFloat y, const dFloat z)
- void **SetPosition**(const [xVec3](xVec3.md)& position)

| Parameter | Description |
|---|---|
| position (x, y, z) | navigation mesh position |

## Example

In this example the entire scene is shifted 100 meters to the right.

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
    camera->SetFov(70);
    camera->SetClearColor(0.125);
    camera->SetPosition(100, 3, -6);
    camera->SetRotation(35, 0, 0);

    //Create light
    auto light = CreateBoxLight(world);
    light->SetRange(-20, 20);
    light->SetArea(20, 20);
    light->SetRotation(35, 35, 0);
    light->SetColor(3);
    light->SetPosition(100, 0, 0);

    //Create scene
    auto ground = CreateBox(world, 10, 1, 10);
    ground->SetPosition(100, 0, 0);
    ground->Move(0, -0.5, 0);
    ground->SetColor(0, 1, 0);
    auto wall = CreateBox(world, 1, 2, 4);
    wall->SetPosition(100, 0, 0);

    //Create navmesh
    auto navmesh = CreateNavMesh(world, 5, 4, 4);
    navmesh->SetPosition(100, 0, 0);
    navmesh->Build();

    //Create player
    auto player = CreateCylinder(world, 0.4, 1.8);
    player->SetNavObstacle(false);
    player->SetColor(0, 0, 1);
    auto agent = CreateNavAgent(navmesh);
    player->Attach(agent);
    agent->SetPosition(navmesh->RandomPoint());

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        if (window->MouseHit(MOUSE_LEFT))
        {
            auto mousepos = window->GetMousePosition();
            auto rayinfo = camera->Pick(framebuffer, mousepos.x, mousepos.y);
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
