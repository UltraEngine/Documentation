# Joint::SetLimits

This method sets the angular limit of a hinge joint.

## Syntax

- void **SetLimits**(const dFloat minangle, const dFloat maxangle)

| Parameter | Description |
|---|---|
| minangle | minimum joint angle, in degrees |
| maxangle | maximum joint angle, in degrees |

## Remarks

If both minangle and maxangle are set to zero, joint limits will be disabled.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create a world
    auto world = CreateWorld(PHYSICSENGINE_BOX2D);

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a camera    
    auto camera = CreateCamera(world, PROJECTION_ORTHOGRAPHIC);
    camera->SetClearColor(0.125);
    
    //Create the ground sprite
    auto ground = CreateSprite(world, framebuffer->size.x, 50, false, 0, true);
    ground->SetPosition(-framebuffer->size.x / 2, -framebuffer->size.y/2);
    ground->SetColor(0, 1, 0);
    
    //Add some boxes
    auto sprite1 = CreateSprite(world, 400, 25, false, 0, true);
    sprite1->SetMass(1);
    sprite1->SetPosition(-200, -12.5, 0);
    sprite1->SetColor(0, 0, 1);

    auto sprite2 = CreateSprite(world, 50, 50, false, 0, true);
    sprite2->SetMass(1);
    sprite2->SetPosition(100, 500, 0);
    sprite2->SetColor(1, 0, 0);

    auto sprite3 = CreateSprite(world, 50, 50, false, 0, true);
    sprite3->SetMass(1);
    sprite3->SetPosition(-150, 2000, 0);
    sprite3->SetColor(1, 1, 0);

    //Create a joint
    auto joint = CreateHingeJoint(Vec3(0), Vec3(0, 0, 1), NULL, sprite1);
    joint->SetLimits(-35,35);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
