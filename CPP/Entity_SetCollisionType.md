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
| COLLISIONTYPE_SCENE | COLLISIONTYPE_SCENE | COLLISIONRESPONSE_NONE |
| COLLISIONTYPE_PROP | COLLISIONTYPE_SCENE | COLLISIONRESPONSE_COLLIDE |
| COLLISIONTYPE_DEBRIS | COLLISIONTYPE_SCENE | COLLISIONRESPONSE_COLLIDE |
| COLLISIONTYPE_DEBRIS | COLLISIONTYPE_PROP | COLLISIONRESPONSE_COLLIDE |
| COLLISIONTYPE_DEBRIS | COLLISIONTYPE_PLAYER | COLLISIONRESPONSE_NONE |
| COLLISIONTYPE_SCENE | COLLISIONTYPE_PLAYER | COLLISIONRESPONSE_COLLIDE |
| COLLISIONTYPE_PROP | COLLISIONTYPE_PLAYER | COLLISIONRESPONSE_COLLIDE |
| COLLISIONTYPE_PLAYER | COLLISIONTYPE_PLAYER | COLLISIONRESPONSE_COLLIDE |
| COLLISIONTYPE_DEBRIS | COLLISIONTYPE_PROJECTILE | COLLISIONRESPONSE_NONE |
| COLLISIONTYPE_DEBRIS | COLLISIONTYPE_DEBRIS | COLLISIONRESPONSE_NONE |
| COLLISIONTYPE_SCENE | COLLISIONTYPE_PROJECTILE | COLLISIONRESPONSE_COLLIDE |
| COLLISIONTYPE_PROP | COLLISIONTYPE_PROJECTILE | COLLISIONRESPONSE_COLLIDE |
| COLLISIONTYPE_PLAYER | COLLISIONTYPE_PROJECTILE | COLLISIONRESPONSE_NONE |
| COLLISIONTYPE_PROJECTILE | COLLISIONTYPE_PROJECTILE | COLLISIONRESPONSE_NONE |

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
    sprite1->SetCollisionType(COLLISION_PROP);

    auto sprite2 = CreateSprite(world, 100, 100, false, 0, true);
    sprite2->SetMass(1);
    sprite2->SetPosition(100, 1000, 0);
    sprite2->SetCollisionType(COLLISION_NONE);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
