# Joint::SetMaxForce

This method sets the maximum force a motorized slider or kinematic joint can apply to reach its target position.

## Syntax

- void **SetMaxForce**(const dFloat force)

| Parameter | Description |
|---|---|
| force | max force, in Newtons |

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
    parent->SetPosition(0, -2, 0);

    auto child = CreateBox(world);
    child->SetMass(1);
    child->SetColor(0, 1, 0);
    
    //Create joint
    auto joint = CreateSliderJoint(parent->position, Vec3(0, 1, 0), parent, child);
    joint->SetMaxForce(100);
    joint->SetPose(2);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
