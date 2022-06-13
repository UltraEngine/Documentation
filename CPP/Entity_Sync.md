# Entity::Sync

This method synchronizes changes to an entity's orientation and color. Use this to disable rendering interpolation when an object is "teleported" to a new location.

## Syntax

- void **Sync**()

## Remarks

Rendering is performed on a separate thread, and is likely to run at a different frequency than the main thread. In the rendering thread, changes to an entity's position, rotation, scale, and color are smoothly inerpolated between the most recent two updates received, resulting in smooth motion. If for any reason you want motion and color forced to the current value when they are received, this command can be called after setting the orientation or color. For example, if you load a model and then place it in a position where it is supposed to appear, you may wish to call this command to ensure there is not any interpolation between its original and final positions.

Note that if physics are enabled it may introduce additional interpolation if the entity has a non-zero mass.

## Example ##
```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0]);

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a world
    auto world = CreateWorld();

    //Create a camera
    auto camera = CreateCamera(world);
    camera->SetClearColor(0.125);
    camera->Move(0, 0, -2);
    camera->SetFOV(70);

    //Create light
    auto light = CreateLight(world, LIGHT_DIRECTIONAL);
    light->SetRotation(45, 35, 0);

    //Create model
    auto box1 = CreateBox(world, 0.8, 0.8, 0.8);
    box1->SetColor(0.5);
    box1->SetPhysicsMode(PHYSICS_DISABLED);

    auto box2 = CreateBox(world, 0.8, 0.8, 0.8);
    box2->SetColor(0.5);
    box2->SetPhysicsMode(PHYSICS_DISABLED);

    int n = 0;
    float pos[2] = { -1, 1 };

    while (window->Closed() == false)
    {
        box1->SetPosition(pos[n],0.5,0);
        box2->SetPosition(pos[n],-0.5,0);
        box2->Sync();

        n++;
        if (n == 2) n = 0;

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
