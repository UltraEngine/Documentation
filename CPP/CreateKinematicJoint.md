# CreateKinematicJoint

This function creates a new kinematic joint. A kinematic joint can be used to control the orientation of an entity with physics forces.

## Syntax

- shared_ptr<[Joint](Joint.md)> **CreateKinematicJoint**(shared_ptr<[Entity](Entity.md)> entity)

| Parameter | Description |
|---|---|
| entity | entity the joint controls |

## Returns

Returns a new joint object.

## Remarks

A kinematic joint can control the entity position, rotation, or both.

To control the entity position, you must call [Joint::SetMaxForce](Joint_SetMaxForce.md) and [Joint::SetTargetPosition](Joint_SetTargetPosition.md).

To control the entity rotation, you must call [Joint::SetMaxTorque](Joint_SetMaxTorque.md) and [Joint::SetTargetRotation](Joint_SetTargetRotation.md).

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
    camera->SetPosition(0, 0, -5);

    //Create light
    auto light = CreateBoxLight(world);
    light->SetRotation(35, 35, 0);
    light->SetRange(-20, 20);
    
    auto box = CreateBox(world);
    box->SetMass(1);
    box->SetColor(0, 1, 0);

    auto joint = CreateKinematicJoint(box->position, box);

    //Main loop
    float a = 0, y = 0;
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        if (window->KeyDown(KEY_RIGHT)) a -= 2;
        if (window->KeyDown(KEY_LEFT)) a += 2;
        if (window->KeyDown(KEY_UP)) y += 0.1;
        if (window->KeyDown(KEY_DOWN)) y -= 0.1;

        joint->SetPose(Vec3(0, y, 0), Vec3(0, 0, a));

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
