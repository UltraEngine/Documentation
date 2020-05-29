# CreateCollisionBox #
This function creates a collision box shape for physics interactions.

## Syntax ##
- shared_ptr<[Collision](CPP_Collision.md)> **CreateCollisionBox**(const float width, const float height, const float depth, const float x = 0.0f, const float y = 0.0f, const float z = 0.0f, const float pitch = 0.0f, const float yaw = 0.0f, const float roll = 0.0f)
- shared_ptr<[Collision](CPP_Collision.md)> **CreateCollisionBox**(const [Vec3](CPP_Vec3.md)& size, const [Vec3](CPP_Vec3.md)& offset = 0.0f, const [Vec3](CPP_Vec3.md)& rotation = 0.0f)

## Parameters ##
|Name|Description|
|---|----|
|**width**|width of collision box|
|**height**|height of collision box|
|**depth**|depth of collision box|
|**x**|x component of collision box offset|
|**y**|y component of collision box offset|
|**z**|z component of collision box offset|
|**pitch**|pitch of collision box rotation|
|**yaw**|yaw of collision box rotation|
|**roll**|roll of collision box rotation|
|**size**|size of collision box|
|**offset**|offset of collision box|
|**rotation**|rotation of collision box|

## Returns ##
Returns a new collision object.

## Example ##
```c++
#include "pch.h"
#include "Project.h"

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = ListDisplays();

    //Create a window
    auto window = CreateWindow(displays[0], L"", 0, 0, 1280, 720, WINDOW_CENTER | WINDOW_TITLEBAR);

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
    auto light = CreateLight(world, LIGHT_DIRECTIONAL);
    light->SetRotation(45, 35, 0);

    //Create ground
    auto ground = CreateBox(world, 10, 1, 10);
    ground->SetPosition(0, -0.5, 0);

    //Load model
    auto model = LoadModel(world, "https://github.com/Leadwerks/Documentation/raw/master/Assets/Models/Containers/crate01.glb");
    model->SetPosition(0, 3, 0);
    model->SetRotation(0, 0, 15);
    model->SetMass(1);

    //Create collision
    auto bounds = model->GetBounds(BOUNDS_LOCAL);
    auto collision = CreateCollisionBox(bounds.size, bounds.center);
    model->SetCollision(collision);

    while (window->Closed() == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
