# Entity::SetElasticity

This methods sets the elasticity of the entity.

## Syntax

- void **SetElasticity**(const dFloat elasticity)

| Parameter | Description |
|---|---|
| elasticity | elasticity value, between 0 and 1 |

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

    //Create the ground sprite
    auto ground = CreateSprite(world, framebuffer->size.x, 50, false, 0, true);
    ground->SetPosition(-framebuffer->size.x / 2, -framebuffer->size.y / 2, 1);
    ground->SetColor(0, 1, 0);

    //Add some boxes
    auto sprite1 = CreateSprite(world, 100, 100, false, 0, true);
    sprite1->SetPosition(100, 1500);
    sprite1->SetMass(1);
    sprite1->SetColor(1, 0, 0);
    sprite1->SetElasticity(0.5);

    auto sprite2 = CreateSprite(world, 100, 100, false, 0, true);
    sprite2->SetPosition(-200, 1500);
    sprite2->SetMass(1);
    sprite2->SetColor(1, 0, 0);
    sprite2->SetElasticity(0.75);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
