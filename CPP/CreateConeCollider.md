# CreateConeCollider

This function creates a collision cone shape for physics interactions.

## Syntax
- shared_ptr<[Collider](Collider.md)> **CreateConeCollider**(const dFloat radius, const dFloat height, const dFloat x = 0, const dFloat y = 0, const dFloat z = 0, const dFloat pitch = 0, const dFloat yaw = 0, const dFloat roll = 0)

- shared_ptr<[Collider](Collider.md)> **CreateConeCollider**(const dFloat radius, const dFloat height, const [xVec3](xVec3.md)& offset, const [xVec3](xVec3.md)& rotation = 0)

|Parameter|Description|
|---|---|
|radius|radius of shape|
|height|height of shape|
|x|x component of shape offset|
|y|y component of shape offset|
|z|z component of shape offset|
|pitch|pitch of shape rotation|
|yaw|yaw of shape rotation|
|roll|roll of shape rotation|
|offset|offset of shape|
|rotation|rotation of shape|

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
    light->SetRotation(45, 35, 0);

    //Create ground
    auto ground = CreateBox(world, 10, 1, 10);
    ground->SetColor(0,1,0);
    ground->SetPosition(0, -0.5, 0);
     
    //Create model
    auto model = CreateCone(world, 0.5, 2);
    model->SetPosition(0, 5, 0);
    model->SetRotation(90, 0, 0);
    model->SetColor(0, 0, 1);
    model->SetMass(1);
    model->AddForce(100, 0, 0);

    //Create collision
    auto collider = CreateConeCollider(0.5, 2);
    model->SetCollider(collider);

    while (window->Closed() == false and window->KeyHit(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
