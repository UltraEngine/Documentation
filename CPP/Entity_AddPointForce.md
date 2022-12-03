# Entity::AddPointForce

This method applies a force, measured in Newtons, to an entity at a specified point. This can result in both movement and rotation of the entity.

## Syntax

- void **AddPointForce**(const dFloat fx, const dFloat fy, const dFloat fz, const dFloat x, const dFloat y, const dFloat z, const bool global = true)
- void **AddPointForce**(const [xVec3](xVec3.md)& force, const [xVec3](xVec3.md)& position), const bool global = true)

| Parameter | Description |
| --- | --- |
| force, (fx, fy, fz) | force to add |
| position, (x, y, z) | point where the force is applied |

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
    box->SetMass(1);
    box->SetColor(0, 0, 1);
    box->SetGravityMode(false);
    box->SetDamping(0.9, 0.9);

    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        //Click the mouse to apply a force
        if (window->MouseHit(MOUSE_LEFT))
        {
            auto mousepos = window->GetMousePosition();
            auto pick = camera->Pick(framebuffer, mousepos.x, mousepos.y);
            if (pick.success)
            {
                box->AddPointForce(Vec3(0, 0, 1), pick.position);
            }
        }

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
