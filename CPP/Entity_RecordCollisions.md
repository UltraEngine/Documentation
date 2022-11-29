# Entity::RecordCollisions

This method sets the entity collision recording mode. Entity collisions will not be stored in the world collision list unless collision recording is enabled.

## Syntax

- void **RecordCollisions**(const bool record)

| Parameter | Description |
|---|---|
| record | if set to true collisions will be recorded in the world collision list |

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

    //Create a world
    auto world = CreateWorld();

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a camera    
    auto camera = CreateCamera(world);
    camera->SetClearColor(0.125);
    camera->SetPosition(0, 1, -4);

    //Create light
    auto light = CreateBoxLight(world);
    light->SetRange(-10, 10);
    light->SetArea(15, 15);
    light->SetRotation(45, 35, 0);
    light->SetColor(2);

    //Create the ground
    auto ground = CreateBox(world, 10, 1, 10);
    ground->SetPosition(0, -0.5, 0);
    ground->SetColor(0, 1, 0);
    
    //Add some boxes
    auto box1 = CreateBox(world, 1, 1, 1);
    box1->SetPosition(-1, 5, 0);
    box1->SetColor(0, 0, 1);

    auto box2 = CreateBox(world, 1, 1, 1);
    box2->SetPosition(1, 05, 0);
    box2->SetColor(0, 0, 1);
    
    //Enable collision recording
    box1->RecordCollisions(true);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        //Press the space key to start physics
        if (window->KeyHit(KEY_SPACE))
        {
            box1->SetMass(1);
            box2->SetMass(1);
        }

        //Color the collided entity red when collision is detected
        for (const auto& c : world->collisions)
        {
            for (int n = 0; n < 2; ++n)
            {
                if (c.entity[n]->GetMass() != 0.0f) c.entity[n]->SetColor(1, 0, 0);
            }
        }

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
