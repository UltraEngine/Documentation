# CreateFramebuffer

This function creates a new framebuffer object for 2D and 3D rendering.

## Syntax
- shared_ptr<Framebuffer> **CreateFramebuffer**(shared_ptr<[Window](Window.md)\> window)

| Parameter | Description |
| --- | --- |
| window | window to create the framebuffer on |

## Returns

Returns a new framebuffer object.

## Example
  
```c++
#include "UltraEngine.h"

using namespace UltraEngine;

void main(const char* args, const int argc)
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR | WINDOW_RESIZABLE);
    
    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a world
    auto world = CreateWorld();

    //Create a camera
    auto camera = CreateCamera(world);
    
    //Main loop
    while (!window->Closed() and !window->KeyHit(KEY_ESCAPE))
    {
        //Update world
        world->Update();

        //Render world
        world->Render(framebuffer, true);
    }

    window->Hide();
}  
```
