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
    auto world = CreateWorld(PHYSICSENGINE_BOX2D);
    world->SetGravity(0, -9.81 * 100, 0);

    //Create a camera
    auto camera = CreateCamera(world, PROJECTION_ORTHOGRAPHIC);
    camera->SetClearColor(0.125);

    //Create a sprite
    auto sprite = CreateSprite(world, 100, 100, false, 0, true);
    sprite->SetMass(1);
    sprite->SetColor(1, 0, 0);
    sprite->SetPosition(-50, -50);
    sprite->SetGravityMode(false);

    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        //Press the space key to apply torque
        if (window->KeyHit(KEY_SPACE))
        {
            sprite->AddTorque(0,0,100000);
        }

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
