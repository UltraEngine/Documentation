# CreateFramebuffer

This function creates a new framebuffer object for 2D and 3D rendering.

## Syntax
- shared_ptr<[Framebuffer](Framebuffer.md)\> **CreateFramebuffer**(shared_ptr<[Window](Window.md)\> window)

| Parameter | Description |
| --- | --- |
| window | window to create the framebuffer on |

## Returns

Returns a new framebuffer object if one is successfully created, otherwise NULL is returned.

## Remarks

A framebuffer cannot be created on a window that uses the WINDOW_RESIZABLE window style, unless the multi-threaded renderer is disabled by calling [AsyncRender](AsyncRender.md) prior to engine initialization.

## Example
  
```c++
#include "UltraEngine.h"

using namespace UltraEngine;

void main(const char* args, const int argc)
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_TITLEBAR | WINDOW_CENTER);

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a world
    auto world = CreateWorld();

    //Create a camera
    auto camera = CreateCamera(world);
    camera->SetClearColor(0.125f);
    
    //Main loop
    while (!window->Closed() and !window->KeyHit(KEY_ESCAPE))
    {
        //Update world
        world->Update();

        //Render world
        world->Render(framebuffer, true);
    }
}  
```
