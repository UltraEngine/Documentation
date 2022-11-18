# CreateWorld

This function creates a new world object.

## Syntax

- shared_ptr<[World](World.md)\> **CreateWorld**(const [PhysicsEngine](Constants.md#PhysicsEngine) physicsengine)

| Parameter | Description |
|---|---|
| physicsengine | physics engine to use, can be PHYSICSENGINE_NONE, PHYSICSENGINE_BOX2D, or PHYSICSENGINE_NEWTON |

## Returns

Returns a new world object.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create world
    auto world = CreateWorld();

    //Create framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a camera
    auto camera = CreateCamera(world, PROJECTION_ORTHOGRAPHIC);
    camera->SetClearColor(0.125);

    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
