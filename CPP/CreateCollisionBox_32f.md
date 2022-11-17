# CreateBoxCollider

This function creates a collider box shape for physics interactions.

## Syntax

- shared_ptr<[Collider](Collision.md)> **CreateBoxCollider**(const float width, const float height, const float depth, const float x = 0.0, const float y = 0.0, const float z = 0.0, const float pitch = 0.0, const float yaw = 0.0, const float roll = 0.0)

- shared_ptr<[Collider](Collision.md)> **CreateBoxCollider**(const [Vec3](Vec3.md)& size, const [Vec3](Vec3.md)& offset = 0.0, const [Vec3](Vec3.md)& rotation = 0.0)

## Parameters

| Name | Description |
|---|----|
|**width**|width of box|
|**height**|height of box|
|**depth**|depth of box|
|**x**|x component of box offset|
|**y**|y component of box offset|
|**z**|z component of box offset|
|**pitch**|pitch of box rotation|
|**yaw**|yaw of box rotation|
|**roll**|roll of box rotation|
|**size**|size of box|
|**offset**|offset of box|
|**rotation**|rotation of box|

## Returns

Returns a new collider object.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a world
    auto world = CreateWorld();

    //Create a camera
    auto camera = CreateCamera(world);
    camera->SetClearColor(0.125);
    camera->Move(0, 1, -3);
    camera->SetFOV(70);

    //Create light
    auto light = CreateDirectionalLight(world);
    light->SetRotation(45, 35, 0);

    //Create ground
    auto ground = CreateBox(world, 10, 1, 10);
    ground->SetPosition(0, -0.5, 0);
    ground->SetColor(0, 1, 0);

    //Load model
    auto model = LoadModel(world, "https://github.com/UltraEngine/Documentation/raw/master/Assets/Models/Containers/crate01.glb");
    model->SetPosition(0, 5, 0);
    model->SetRotation(0, 0, 15);
    model->SetMass(1);

    //Create collider
    auto bounds = model->GetBounds(BOUNDS_LOCAL);
    auto collider = CreateBoxCollider(bounds.size, bounds.center);
    model->SetCollider(collider);

    while (window->Closed() == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
