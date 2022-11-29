# Entity::AddTorque

This method adds physical torque to the entity, measured in Newton metres.

## Syntax

- void **AddTorque**(const [xVec3](xVec3.md)& torque, const bool global = true)
- void **AddTorque**(const dFloat x, const dFloat y, const dFloat z, const bool global = true)

| Parameter | Description |
| - | - |
| torque, (x, y, z) | torque to add |
| global | set to true to indicate a rotation in global space, otherwise the rotation will be in local space |

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
    box->SetMass(1);
    box->SetColor(0, 0, 1);
    box->SetGravityMode(false);
    
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        //Press the space key to apply a force
        if (window->KeyHit(KEY_SPACE))
        {
            box->AddTorque(0, 0, 10);
        }

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
