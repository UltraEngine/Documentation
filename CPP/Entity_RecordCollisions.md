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
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create a world
    auto world = CreateWorld(PHYSICSENGINE_BOX2D);

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a camera    
    auto camera = CreateCamera(world, PROJECTION_ORTHOGRAPHIC);
    camera->SetClearColor(0.125);
    camera->SetPosition(0, framebuffer->size.y / 2);
    
    //Create the ground sprite
    auto ground = CreateSprite(world, framebuffer->size.x, 50, false, 0, true);
    ground->SetPosition(-framebuffer->size.x / 2, 0);
    ground->SetColor(0, 1, 0);
    
    //Add some boxes
    auto sprite1 = CreateSprite(world, 100, 100, false, 0, true);
    sprite1->SetMass(1);
    sprite1->SetPosition(-200, 1000, 0);
    
    auto sprite2 = CreateSprite(world, 100, 100, false, 0, true);
    sprite2->SetMass(1);
    sprite2->SetPosition(100, 1000, 0);

    //Enable collision recording on one entity
    sprite1->RecordCollisions(true);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
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
