# Entity::SetSweptCollision

This method is used to enable or disable continuous collision. Fast-moving or small objects will have more accurate collision when this feature is enabled, but performance will be slower.

- void **SetSweptCollision**(const bool mode)

| Parameter | Description |
|---|---|
| mode | swept collision mode |

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
    camera->SetPosition(0, 1, -4);

    //Create light
    auto light = CreateBoxLight(world);
    light->SetRange(-10, 10);
    light->SetArea(15, 15);
    light->SetRotation(45, 35, 0);
    light->SetColor(2);

    //Create the ground
    auto ground = CreateBox(world, 10, 0.01, 10);
    ground->SetPosition(0, -0.005, 0);
    ground->SetColor(0, 1, 0);
    ground->SetElasticity(0);

    //Add some boxes
    auto box1 = CreateBox(world, 1, 1, 1);
    box1->SetPosition(-1, 5, 0);
    box1->SetColor(0, 0, 1);
    box1->SetElasticity(0);

    auto box2 = CreateBox(world, 1, 1, 1);
    box2->SetPosition(1, 5, 0);
    box2->SetColor(0, 0, 1);
    box2->SetElasticity(0);

    //Enable continuous collision
    box2->SetSweptCollision(true);
    
    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        //Press the space key to throw the boxes at the ground
        if (window->KeyHit(KEY_SPACE))
        {
            box1->SetMass(1);
            box2->SetMass(1);
            box1->SetVelocity(0, -100, 0);
            box2->SetVelocity(0, -100, 0);
        }

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
