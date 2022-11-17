# CreateSphereCollider

This function creates a collision sphere shape for physics interactions.

## Syntax

- shared_ptr<[Collider](Collider.md)> **CreateSphereCollider**(const float radius, const float depth, const float x = 0.0, const float y = 0.0, const float z = 0.0)
- shared_ptr<[Collider](Collider.md)> **CreateSphereCollider**(const float radius, const [Vec3](Vec3.md)& offset)

## Parameters
| Name | Description |
|---|----|
| radius |radius of shape|
| x |x component of shape offset|
| y |y component of shape offset|
| z |z component of shape offset|
| offset |offset of shape|

## Returns

Returns a new collider object.

## Example

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
    auto model = CreateSphere(world, 0.5);
    model->SetPosition(0, 5, 0);
    model->Turn(90, 10, 0);
    model->SetColor(0, 0, 1);
    model->SetMass(1);
    model->AddForce(100, 0, 0);

    //Create collision
    auto collision = CreateSphereCollider(0.5);
    model->SetCollider(collision);

    while (window->Closed() == false and window->KeyHit(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
