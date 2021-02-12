# CreateConvexHullCollider #
This function creates a convex hull that encapsulates all vertices of the input geometry.

## Syntax ##
- shared_ptr<[Collider](Collision.md)\> **CreateConvexHullCollider**(shared_ptr<[Mesh](Mesh.md)\> geometry)
- shared_ptr<[Collider](Collision.md)\> **CreateConvexHullCollider**(shared_ptr<[Model](Model.md)\> geometry)

## Parameters ##
|Name|Description|
|-|-|
|**geometry**|mesh or model to build the collision from|

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