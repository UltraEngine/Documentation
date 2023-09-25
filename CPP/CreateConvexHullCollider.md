# CreateConvexHullCollider

This function creates a convex hull that encapsulates all vertices of the input geometry.

## Syntax

- shared_ptr<[Collider](Collider.md)\> **CreateConvexHullCollider**(shared_ptr<[Mesh](Mesh.md)\> geometry)
- shared_ptr<[Collider](Collider.md)\> **CreateConvexHullCollider**(shared_ptr<[Model](Model.md)\> geometry)
- shared_ptr<[Collider](Collider.md)\> **CreateConvexHullCollider**(const std::vector<[Vec3](Vec3.md)\>& points)

| Parameter | Description |
|---|---|
| geometry | mesh or model to build the collision from |
| points | array of vertices |

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get display list
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

    //Create model
    auto model = CreateCylinder(world, 0.5, 1, 5);
    model->SetPosition(0, 8, 0);
    model->SetColor(0, 0, 1);
    model->SetMass(1);
    model->Turn(90, 30, 0);

    //Create collision
    auto collider = CreateConvexHullCollider(model);
    model->SetCollider(collider);

    while (window->Closed() == false and window->KeyHit(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
