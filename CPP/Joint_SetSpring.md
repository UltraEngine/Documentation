# Joint::SetSpring

This method adds spring behavior to a hinge or slider joint.

## Syntax

- void **SetSpring**(const dFloat relaxation, const dFloat spring, const dFloat damper)

| Parameter | Description |
|---|---|
| relaxation | spring damper relaxation |
| spring | spring constant |
| damper | damping value |

## Remarks

Calling this method with zero for the spring parameter will disable spring behavior for this joint.

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
    child->SetPosition(4, 0, 0);
    child->SetMass(1);
    child->SetGravityMode(false);
    child->SetColor(0, 1, 0);
    child->AddForce(0, 500, 0);

    //Create joint
    auto hinge = CreateHingeJoint(parent->position, Vec3(0, 0, 1), parent, child);
    hinge->SetSpring(0.9, 2000, 0.01);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
