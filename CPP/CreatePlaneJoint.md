# CreatePlaneJoint

This function creates a plane joint. Plane joints can be used to lock an entity to a plane, for 2D game physics.

## Syntax

shared_ptr<[Joint](Joint.md)\> **CreatePlaneJoint**(const [Vec3](Vec3.md)& position, const [Vec3](Vec3.md)& axis, shared_ptr<[Entity](Entity.md)\> parent, shared_ptr<[Entity](Entity.md)\> child)

| Parameter | Description |
|---|---|
| position | joint position |
| pin | joint axis |
| parent | parent entity, or NULL for a fixed position |
| child | child entity |

## Returns

Returns a new joint.

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

    //Create a world
    auto world = CreateWorld();
    
    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a camera
    auto camera = CreateCamera(world);
    camera->SetClearColor(0.125);
    camera->SetPosition(0, 0, -5);

    //Create a light
    auto light = CreateBoxLight(world);
    light->SetRotation(45,35,0);
    light->SetArea(20, 20);
    light->SetRange(-20, 20);

    //Create a ramp
    auto ramp = CreateBox(world, 10, 0.25, 2);
    ramp->SetRotation(0, 0, 5);
    ramp->SetPosition(0, -1, 0);
    ramp->SetColor(0, 0, 1);

    //Create rolling object
    auto drum = CreateCylinder(world);
    drum->SetRotation(90,0,0);
    drum->SetPosition(4, 4, 0);
    drum->SetColor(0, 1, 0);
    drum->SetMass(1);

    //Create joint
    auto joint = CreatePlaneJoint(drum->position, Vec3(0, 0, 1), NULL, drum);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
