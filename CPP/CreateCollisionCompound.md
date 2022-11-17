# CreateCompoundCollider

This function creates a complex collision shape that is made up of multiple sub-shapes.

## Syntax

- shared_ptr<[Collider](Collider.md)\> **CreateCompoundCollider**(vector<shared_ptr<[Collider](Collider.md)\> \> subshapes)

| Parameter | Description |
|---|---|
| subshapes | array of collision objects to be combined into the created shape |

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create window
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
    light->SetRotation(45, -35, 0);

    //Create ground
    auto ground = CreateBox(world, 20, 1, 20);
    ground->SetPosition(0, -0.5, 0);

    //Create model
    auto model = CreateSphere(world, 1);
    model->SetMass(1);
    model->SetColor(0, 0, 1);
    model->AddForce(10, 0, -10);

    //Add some parts
    auto part = CreateCone(world);
    part->SetColor(0, 1, 0);
    part->SetPosition(1, 0, 0);
    part->SetRotation(0, 0, -90);
    part->SetParent(model);

    part = CreateCone(world);
    part->SetColor(0, 1, 0);
    part->SetPosition(-1, 0, 0);
    part->SetRotation(0, 0, 90);
    part->SetParent(model);

    part = CreateCone(world);
    part->SetColor(0, 1, 0);
    part->SetPosition(0, 0, 1);
    part->SetRotation(90, 0, 0);
    part->SetParent(model);

    part = CreateCone(world);
    part->SetColor(0, 1, 0);
    part->SetPosition(0, 0, -1);
    part->SetRotation(-90, 0, 0);
    part->SetParent(model);

    part = CreateCone(world);
    part->SetColor(0, 1, 0);
    part->SetPosition(0, -1, 0);
    part->SetRotation(180, 0, 0);
    part->SetParent(model);

    part = CreateCone(world);
    part->SetColor(0, 1, 0);
    part->SetPosition(0, 1, 0);
    part->SetParent(model);

    model->SetPosition(0, 5, 0);
    
    //Remove colliders from child primitives
    for (auto child : model->kids)
    {
        child->SetCollider(NULL);
    }

    //Create collision
    vector<shared_ptr<Collider> > collisions;
    collisions.push_back(CreateSphereCollider(1));
    collisions.push_back(CreateConeCollider(0.5, 1, 1, 0, 0, 0, 0, -90));
    collisions.push_back(CreateConeCollider(0.5, 1, -1, 0, 0, 0, 0, 90));
    collisions.push_back(CreateConeCollider(0.5, 1, 0, 1, 0, 0, 0, 0));
    collisions.push_back(CreateConeCollider(0.5, 1, 0, -1, 0, 180, 0, 0));
    collisions.push_back(CreateConeCollider(0.5, 1, 0, 0, 1, 90, 0, 0));
    collisions.push_back(CreateConeCollider(0.5, 1, 0, 0, -1, -90, 0, 0));
    auto collider = CreateCompoundCollider(collisions);
    model->SetCollider(collider);

    while (window->Closed() == false and window->KeyHit(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
