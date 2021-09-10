# Entity::AddForce

This method adds a physical force to the object, measured in Newtons.

## Syntax

- void **AddForce**(const dFloat x, const dFloat y, const dFloat z, const bool global = true)
- void **AddForce**(const [xVec3](xVec3.md)& force, const bool global = true)

| Parameter | Description |
| ------ | ------ |
| x | x component of force to add |
| y | y component of force to add |
| z | z component of force to add |
| force | force to add |
| global | set to true to indicate a vector in global space, otherwise the vector will be in local space |

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

    //Create a camera
    auto camera = CreateCamera(world, PROJECTION_ORTHOGRAPHIC);
    camera->SetClearColor(0.125);

    //Create a sprite
    auto sprite = CreateSprite(world, 100, 100, false, 0, true);
    sprite->SetMass(1);
    sprite->SetColor(1, 0, 0);
    sprite->SetPosition(-500, 0);
    sprite->SetGravityMode(false);

    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        //Press the space key to apply a force
        if (window->KeyHit(KEY_SPACE))
        {
            sprite->AddForce(10000, 0, 0);
        }

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
