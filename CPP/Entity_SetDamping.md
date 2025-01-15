# Entity::SetDamping

This method sets a damping factor to model resistance.

## Syntax

- void **SetDamping**(const dFloat lineardamping, const dFloat angulardamping)

| Parameter | Description |
|---|---|
| lineardamping | linear damping value, between 0 and 1 |
| angulardamping | angular damping value, between 0 and 1 |

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

    //Create models
    auto box1 = CreateBox(world);
    box1->SetMass(1);
    box1->SetColor(0, 0, 1);
    box1->SetGravityMode(false);
    box1->SetPosition(-1, 0, 0);

    auto box2 = CreateBox(world);
    box2->SetMass(1);
    box2->SetColor(0, 0, 1);
    box2->SetGravityMode(false);
    box2->SetPosition(1, 0, 0);
    box2->SetDamping(0.99, 0.99);
     
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        //Press the space key to apply a force
        if (window->KeyHit(KEY_SPACE))
        {
            box1->AddTorque(0, 0, 10);
            box2->AddTorque(0, 0, 10);
            box1->AddForce(0, 0, 10);
            box2->AddForce(0, 0, 10);
        }

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
