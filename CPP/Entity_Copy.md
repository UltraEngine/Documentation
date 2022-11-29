# Entity::Copy

This method returns a unique copy of the entity. Resources such as model meshes are duplicated, creating a new unique object. For faster performance and lower memory usage, consider using the [Instantiate](Entity_Instantiate.md) method instead.

## Syntax

- shared_ptr<[Entity](Entity.md)\> **Copy**(shared_ptr<[World](World.md)> world, const bool recursive = true, const bool callstart = true)

| Parameter | Description |
| --- | --- |
| world | world to create new copy in | 
| recursive | if set to true the entity subhierarchy will also be copied |
| callstart | if set to true the Start function will be called for all attached actors and scripts |

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1024, 768, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a world
    auto world = CreateWorld();
    
    //Create a camera
    auto camera = CreateCamera(world, PROJECTION_ORTHOGRAPHIC);
    camera->SetClearColor(0.125);

    //Create a sprite
    auto sprite = CreateSprite(world, 100, 100);
    sprite->SetPosition(200 - 50, -50);
    sprite->SetColor(0, 0, 1);

    //Make an instance
    auto sprite2 = sprite->Copy(world);
    sprite2->SetPosition(-200 - 50, -50);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
