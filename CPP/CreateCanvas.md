# CreateCanvas

This function creates a new canvas object.

## Syntax

- shared_ptr<[Canvas](Canvas.md)\> **CreateCanvas**(shared_ptr<[Camera](Camera.md)\> camera)

| Parameter | Description |
| --- | --- |
| camera | camera to attach the canvas to |

## Returns

Returns a new canvas object.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("", 0, 0, 800, 600, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create world
    auto world = CreateWorld();

    //Create camera
    auto camera = CreateCamera(world);
    camera->SetClearColor(0, 0, 1);

    //Create canvas
    auto canvas = CreateCanvas(camera);

    //Main loop
    while (window->Closed()==false and window->KeyHit(KEY_ESCAPE)==false)
    {
        world->Update();
        world->Render(framebuffer, true);
    }
    return 0;
}
```
