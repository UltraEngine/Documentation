# Entity::SetFriction

This method sets the friction of the entity.

## Syntax

- void **SetFriction**(const dFloat kinematicfriction, const dFloat staticfriction = 0)

| Parameter | Description |
|---|---|
| kinematicfriction | friction of an object in motion |
| staticfriction | initial friction a stationary object must overcome to begin sliding |

## Remarks

The Box2D physics engine only uses kinematic friction.

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
    sprite1->SetPosition(-400, 50);
    sprite1->SetMass(1);
    sprite1->SetColor(1, 0, 0);
    sprite1->SetVelocity(200, 0);
    sprite1->SetCollisionType(COLLISION_DEBRIS);
    sprite1->SetFriction(0.01);

    auto sprite2 = CreateSprite(world, 100, 100, false, 0, true);
    sprite2->SetPosition(-400, 50);
    sprite2->SetMass(1);
    sprite2->SetColor(0, 0, 1);
    sprite2->SetVelocity(200, 0);
    sprite2->SetCollisionType(COLLISION_DEBRIS);
    sprite2->SetFriction(0.95);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
