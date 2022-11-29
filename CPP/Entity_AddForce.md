# Entity::AddForce

This method adds a physical force to the object, measured in Newtons.

## Syntax

- void **AddForce**(const dFloat x, const dFloat y, const dFloat z, const bool global = true)
- void **AddForce**(const [xVec3](xVec3.md)& force, const bool global = true)

| Parameter | Description |
| ------ | ------ |
| force, (x, y, z) | force to add |
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
            box->AddForce(100, 0, 0);
        }

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
