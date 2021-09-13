# CreateKinematicJoint

This function creates a new kinematic joint. A kinematic joint can be used to control the orientation of an entity with physics forces.

## Syntax

- shared_ptr<[Joint](Joint.md)> **CreateKinematicJoint**(shared_ptr<[Entity](Entity.md)> entity)

| Parameter | Description |
|---|---|
| child | joint child |

## Returns

Returns a new joint object.

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
    camera->SetPosition(framebuffer->size.x / 2, framebuffer->size.y / 2);
    
    //Create the ground sprite
    auto ground = CreateSprite(world, framebuffer->size.x, 50, false, 0, true);
    ground->SetColor(0, 1, 0);

    //Create a sprite
    auto collider = CreateRectCollider(-50,-50,100,100);
    auto player = CreateSprite(world, 100, 100);
    player->SetPosition(framebuffer->size.x / 2, framebuffer->size.y / 2);
    player->mesh->Recenter();
    player->mesh->Finalize();
    player->UpdateBounds();
    player->SetCollider(collider);
    player->SetMass(1);
    player->SetColor(1, 0, 0);

    //Create kinamatic joint
    auto joint = CreateKinematicJoint(player->position + Vec3(50, 50, 0), player);
    joint->SetMaxForce(100000);
    joint->SetMaxTorque(1000);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        auto mousepos = window->GetMousePosition();
        joint->SetPosition(mousepos.x, framebuffer->size.y - mousepos.y, 0);

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
