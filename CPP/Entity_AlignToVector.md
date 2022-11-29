# Entity::AlignToVector

This method will align one axis of an entity along a specified vector in global space.

## Syntax

- void **AlignToVector**(const dFloat x, const dFloat y, const dFloat z, const int axis = 2, const dFloat rate = 1.0, const dFloat roll = 0.0)
- void **AlignToVector**(const [xVec3](xVec3.md)& v, const int axis = 2, const dFloat rate = 1.0, const dFloat roll = 0.0)

| Parameter | Description |
| --- | --- |
| v, (x, y, z) | alignment vector  |
| axis | entity axis to align to the vector (0, 1, or 2) |
| rate | can be used to gradually align vector |
| roll | rotation around axis |

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
    camera->SetPosition(0, 0, -2);
    camera->SetClearColor(0.125);

    //Create light
    auto light = CreateBoxLight(world);
    light->SetRange(-10, 10);
    light->SetRotation(45, 35, 0);
    light->SetColor(2);

    //Create model
    auto box = CreateBox(world);
    box->SetColor(0, 0, 1);

    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        //Move the mouse to point the box
        auto mousepos = window->GetMousePosition();
        Vec3 dir;
        dir.x = mousepos.x - framebuffer->size.x / 2;
        dir.y = -(mousepos.y - framebuffer->size.y / 2);
        box->AlignToVector(dir, 1, 0.1);

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
