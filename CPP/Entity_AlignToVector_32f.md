# Entity::AlignToVector
This method will align one axis of an entity along a specified vector in global space.

## Syntax

- void **AlignToVector**(const float x, const float y, const float z, const int axis = 2, const float rate = 1.0, const float roll = 0.0)
- void **AlignToVector**(const [Vec3](Vec3.md)& v, const int axis = 2, const float rate = 1.0, const float roll = 0.0)

| Parameter | Description |
| --- | --- |
| **x** | x component of the alignment vector  |
| **y** | y component of the alignment vector |
| **z** | z component of the alignment vector  |
| **v** | alignment vector  |
| **axis** | entity axis to align to the vector (0, 1, or 2) |
| **rate** | can be used to gradually align vector |
| **roll** | rotation around axis |

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
    auto world = CreateWorld(PHYSICSENGINE_BOX2D);
    world->SetGravity(0, -9.81 * 100, 0);

    //Create a camera
    auto camera = CreateCamera(world, PROJECTION_ORTHOGRAPHIC);
    camera->SetClearColor(0.125);

    //Create a sprite
    auto sprite = CreateSprite(world, 10, 100);
    sprite->SetColor(1, 0, 0);
    sprite->mesh->Recenter(true, false, false);
    sprite->mesh->Finalize();
    sprite->UpdateBounds();

    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        auto mousepos = window->GetMousePosition();
        Vec3 dir;
        dir.x = mousepos.x - framebuffer->size.x / 2;
        dir.y = -(mousepos.y - framebuffer->size.y / 2);
        sprite->AlignToVector(dir, 1, 0.1);
        
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
