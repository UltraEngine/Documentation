# Entity::AddPointForce

This method applies a force, measured in Newtons, to an entity at a specified point. This can result in both movement and rotation of the entity.

## Syntax

- void **AddPointForce**(const float fx, const float fy, const float fz, const float x, const float y, const float z, const bool 
- void **AddPointForce**(const [Vec3](Vec3.md)& force, const [Vec3](Vec3.md)& position), const bool global = true)

| Parameter | Description |
| --- | --- |
| **fx** | x component of the force to add |
| **fy** | y component of the force to add |
| **fz** | z component of the force to add |
| **x** | x component of point where the force is applied |
| **y** | y component of point where the force is applied |
| **z** | z component of point where the force is applied |
| **force** | force to add |
| **position** | point where the force is applied |

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
            sprite->AddPointForce(100, 0, 0, 0, -50, 0);
        }

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
