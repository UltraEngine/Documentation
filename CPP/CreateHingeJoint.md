# CreateHingeJoint

This function creates a new hinge joint. A hinge joint spins around an axis.

## Syntax

- shared_ptr<[Joint](Joint.md)> **CreateHingeJoint**(const [xVec3](xVec3.md)& position, const [xVec3](xVec3.md)& axis, shared_ptr<[Entity](Entity.md)> parent, shared_ptr<[Entity](Entity.md)> child)
- shared_ptr<[Joint](Joint.md)> **CreateHingeJoint**(const dFloat x, const dFLoat y, const dFloat z, const dFloat axisx, const dFloat axisy, const dFloat axisz, shared_ptr<[Entity](Entity.md)> parent, shared_ptr<[Entity](Entity.md)> child)

## Returns

Returns a new joint object.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

const float PhysicsScale = 50.0f;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create a world
    auto world = CreateWorld(PHYSICSENGINE_BOX2D);
    world->SetGravity(0, -9.81f * PhysicsScale, 0);

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a camera    
    auto camera = CreateCamera(world, PROJECTION_ORTHOGRAPHIC);
    camera->SetClearColor(0.125);

    //Create the ground sprite
    auto ground = CreateSprite(world, framebuffer->size.x, 50, false, 0, true);
    ground->SetPosition(-framebuffer->size.x / 2, -framebuffer->size.y / 2);
    ground->SetColor(0, 1, 0);

    //Add some boxes
    auto sprite1 = CreateSprite(world, 400, 25, false, 0, true);
    sprite1->SetMass(1);
    sprite1->SetPosition(-200, -12.5, 0);
    sprite1->SetColor(0, 0, 1);

    auto sprite2 = CreateSprite(world, 50, 50, false, 0, true);
    sprite2->SetMass(1);
    sprite2->SetPosition(100, 5000, 0);
    sprite2->SetColor(1, 0, 0);

    //Create a joint
    auto joint = CreateHingeJoint(Vec3(0), Vec3(0, 0, 1), NULL, sprite1);
    
    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
