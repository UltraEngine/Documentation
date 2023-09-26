# CreateSliderJoint

This function creates a new slider joint. A hinge joint moves freely along the joint axis.

## Syntax

- shared_ptr<[Joint](Joint.md)> **CreateSliderJoint**(const [xVec3](xVec3.md)& position, const [xVec3](xVec3.md)& axis, shared_ptr<[Entity](Entity.md)> parent, shared_ptr<[Entity](Entity.md)> child)

| Parameter | Description |
|---|---|
| position | position of the joint |
| axis | axis the joint will slide along |
| parent | joint parent or NULL for a fixed point |
| child | joint child |

## Returns

Returns a new joint object.

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
    camera->SetPosition(0, 0, -6);

    //Create light
    auto light = CreateBoxLight(world);
    light->SetRange(-20, 20);
    light->SetRotation(35, 35, 0);
    light->SetColor(3);

    auto parent = CreateBox(world);
    parent->SetColor(0, 0, 1);

    auto child = CreateBox(world);
    child->SetPosition(4, 0.1, 0);
    child->SetMass(1);
    child->SetColor(0, 1, 0);

    auto joint = CreateSliderJoint(parent->position, child->position - parent->position, parent, child);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
