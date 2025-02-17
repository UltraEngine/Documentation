# CreateCollisionCone #
This function creates a collision cone shape for physics interactions.

## Syntax ##
- shared_ptr<[Collision](Collision.md)> **CreateCollisionCone**(const double radius, const double height, const double x = 0.0, const double y = 0.0, const double z = 0.0, const double pitch = 0.0, const double yaw = 0.0, const double roll = 0.0)
- shared_ptr<[Collision](Collision.md)> **CreateCollisionCone**(const double radius, const double height, const [dVec3](dVec3.md)& offset, const [dVec3](dVec3.md)& rotation = 0.0)

## Parameters ##
|Name|Description|
|---|----|
|**radius**|radius of collision shape|
|**height**|height of collision shape|
|**x**|x component of collision shape offset|
|**y**|y component of collision shape offset|
|**z**|z component of collision shape offset|
|**pitch**|pitch of collision shape rotation|
|**yaw**|yaw of collision shape rotation|
|**roll**|roll of collision shape rotation|
|**offset**|offset of collision shape|
|**rotation**|rotation of collision shape|

## Returns ##
Returns a new collision object.

## Example ##
```c++
#include "pch.h"
#include "Project.h"

int main(int argc, const char* argv[])
{
    auto displays = GetDisplays();
    Vec2 displayscale = displays[0]->GetScale();

    auto window = CreateWindow(displays[0], L"Example", 0, 0, 1280 * displayscale.x, 720 * displayscale.y);

    auto framebuffer = CreateFramebuffer(window);

    auto world = CreateWorld();

    auto camera = CreateCamera(world);
    camera->SetFOV(70);
    camera->Turn(15, 0, 0);
    camera->Move(0, 2, -8);
    camera->SetClearColor(0.125);

    auto light = CreateLight(world, LIGHT_DIRECTIONAL);
    light->SetRotation(45, 35, 0);

    //Create ground
    auto ground = CreateBox(world, 10, 1, 10);
    ground->SetPosition(0, -0.5, 0);

    //Create model
    auto model = CreateCone(world, 0.5, 2);
    model->SetPosition(0, 5, 0);
    model->SetRotation(90, 0, 0);
    model->SetColor(0, 0, 1);
    model->SetMass(1);
    model->AddForce(100, 0, 0);

    //Create collision
    auto collision = CreateCollisionCone(0.5, 2);
    model->SetCollision(collision);

    while (window->Closed() == false and window->KeyHit(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```