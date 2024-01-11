# CreateBoxLight

This function creates a new box light.

## Syntax

- shared_ptr<[Light](Light.md)\> **CreateBoxLight**(shared_ptr<[World](World.md)\> world)

| Parameter | Description |
|---|---|
| world | world to create the light in |

## Returns

Returns a new light.

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
    camera->SetClearColor(0.125);
    camera->SetFOV(70);
    camera->Move(0, 2, -8);

    //Create light
    auto light = CreateBoxLight(world);
    light->SetRotation(90, 0, 0);
    light->SetRange(-10, 10);
    light->SetArea(5, 5);

    //Create ground
    auto ground = CreateBox(world, 20, 1, 20);
    ground->SetPosition(0, -0.5, 0);
    ground->SetColor(0, 1, 0);

    //Main loop
    while (window->Closed() == false and window->KeyHit(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
