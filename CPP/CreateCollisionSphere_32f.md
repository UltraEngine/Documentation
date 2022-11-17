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
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get displays list
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_TITLEBAR | WINDOW_CENTER);

    //Create framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create world
    auto world = CreateWorld();

    //Create camera
    auto camera = CreateCamera(world);
    camera->SetFOV(70);
    camera->Turn(15, 0, 0);
    camera->Move(0, 2, -8);
    camera->SetClearColor(0.125);

    //Create light
    auto light = CreateDirectionalLight(world);
    light->SetRotation(45, 35, 0);

    //Create ground
    auto ground = CreateBox(world, 10, 1, 10);
    ground->SetPosition(0, -0.5, 0);
    ground->SetColor(0, 1, 0);

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
