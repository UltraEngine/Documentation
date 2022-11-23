# ASyncRender

This function can be used to disable multithreaded rendering.

## Syntax

- void **ASyncRender**(const bool mode)

| Parameter | Description |
|---|---|
| mode | set to false to disable multithreaded rendering |

## Remarks

A framebuffer can only be created on a resizable window when multithreaded rendering is disabled using this function. This should not be done for real-time applications, but can be useful for making tools that do not need to render in real-time.

If you use this function, you must call it before any other API commands.

Once the engine is initialized, the multithreaded rendering mode cannot be changed.

## Example

This example creates an event-based application with a resizable window and 3D viewport.

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(const char* args, const int argc)
{
    //Disable multithreaded rendering
    ASyncRender(false);

    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_RESIZABLE | WINDOW_TITLEBAR | WINDOW_CENTER);

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a world
    auto world = CreateWorld();
    
    //Create a camera
    auto camera = CreateCamera(world, PROJECTION_ORTHOGRAPHIC);
    camera->SetClearColor(0.125f);

    //Main loop
    while (true)
    {
        const auto e = WaitEvent();
        switch (e.id)
        {
        case EVENT_WINDOWCLOSE:
            return 0;
            break;
        case EVENT_WINDOWPAINT:
            world->Render(framebuffer);
            break;
        }
    }
    return 0;
}
```
