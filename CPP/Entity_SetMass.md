# Entity::SetMass

This method sets the entity mass for physics interactivity.

## Syntax

void **SetMass**(const dFloat mass)

| Parameter | Description |
| --- | --- |
| mass | mass to set, or zero for immovable objects |

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
    sprite1->SetPosition(-150, 1000, 0);
    sprite1->SetMass(1);

    auto sprite2 = CreateSprite(world, 100, 100, false, 0, true);
    sprite2->SetPosition(-100, 1500, 0);
    sprite2->SetMass(1);

    auto sprite3 = CreateSprite(world, 100, 100, false, 0, true);
    sprite3->SetPosition(-50, 2000, 0);
    sprite3->SetMass(1);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
