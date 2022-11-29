# Entity::SetCollisionType

This method sets the entity collision type, for filtering collisions for physics.

## Syntax
- void **SetCollisionType**(const int collisiontype, const bool recursive = false)

| Parameter | Description |
|---|---|
| collisiontype | entity collision type to set |
| recursive | if set to true all children in the sub-hierarchy wlll also be set |

## Remarks

The collision type can be any integer value or predefined collision type:
- COLLISIONTYPE_NONE
- COLLISIONTYPE_PROP
- COLLISIONTYPE_SCENE
- COLLISIONTYPE_PLAYER
- COLLISIONTYPE_TRIGGER
- COLLISIONTYPE_DEBRIS
- COLLISIONTYPE_PROJECTILE

Collision responses can be controlled with the [World::SetCollsiionResponse](World_SetCollsiionResponse.md) command.

The table below shows the default collision responses the engine defines for each new world:

| Type 1 | Type 2 | Response |
|---|---|---|
| COLLISIONTYPE_PROP | COLLISIONTYPE_PROP | COLLISIONRESPONSE_COLLIDE |
| COLLISIONTYPE_PROP | COLLISIONTYPE_SCENE | COLLISIONRESPONSE_COLLIDE |
| COLLISIONTYPE_DEBRIS | COLLISIONTYPE_SCENE | COLLISIONRESPONSE_COLLIDE |
| COLLISIONTYPE_DEBRIS | COLLISIONTYPE_PROP | COLLISIONRESPONSE_COLLIDE |
| COLLISIONTYPE_SCENE | COLLISIONTYPE_PLAYER | COLLISIONRESPONSE_COLLIDE |
| COLLISIONTYPE_PROP | COLLISIONTYPE_PLAYER | COLLISIONRESPONSE_COLLIDE |
| COLLISIONTYPE_PLAYER | COLLISIONTYPE_PLAYER | COLLISIONRESPONSE_COLLIDE |
| COLLISIONTYPE_SCENE | COLLISIONTYPE_PROJECTILE | COLLISIONRESPONSE_COLLIDE |
| COLLISIONTYPE_PROP | COLLISIONTYPE_PROJECTILE | COLLISIONRESPONSE_COLLIDE |
| COLLISIONTYPE_PLAYER | COLLISIONTYPE_TRIGGER | COLLISIONRESPONSE_DETECT |

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
    light->SetRotation(45, 35, 0);
    light->SetColor(2);

    //Create the ground
    auto ground = CreateBox(world, 10, 1, 10);
    ground->SetPosition(0, -0.5, 0);
    ground->SetColor(0, 1, 0);

    //Add some boxes
    auto box1 = CreateBox(world);
    box1->SetMass(1);
    box1->SetPosition(-1, 5, 0);
    box1->SetCollisionType(COLLISION_PROP);
    box1->SetColor(0, 0, 1);

    auto box2 = CreateBox(world);
    box2->SetMass(1);
    box2->SetPosition(1, 5, 0);
    box2->SetCollisionType(COLLISION_NONE);
    box2->SetColor(0, 0, 1);

    //Very slow gravoty
    world->SetGravity(0, -1, 0);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
