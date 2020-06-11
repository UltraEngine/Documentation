# CreateCollisionCylinder #
This function creates a collision cylinder shape for physics interactions.

## Syntax ##
- shared_ptr<[Collision](CPP_Collision.md)> **CreateCollisionCylinder**(const float radius, const float height, const float x = 0.0, const float y = 0.0, const float z = 0.0, const float pitch = 0.0, const float yaw = 0.0, const float roll = 0.0)
- shared_ptr<[Collision](CPP_Collision.md)> **CreateCollisionCylinder**(const float radius, const float height, const [Vec3](CPP_Vec3.md)& offset, const [Vec3](CPP_Vec3.md)& rotation = 0.0)

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
    auto displays = ListDisplays();
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
    auto model = CreateCylinder(world, 0.5, 4);
    model->SetPosition(0, 5, 0);
    model->Turn(90, 10, 0);
    model->SetColor(0, 0, 1);
    model->SetMass(1);
    model->AddForce(100, 0, 0);

    //Create collision
    auto collision = CreateCollisionCylinder(0.5,4);
    model->SetCollision(collision);

    while (window->Closed() == false and window->KeyHit(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
