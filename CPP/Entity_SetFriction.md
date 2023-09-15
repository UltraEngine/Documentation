# Entity::SetFriction

This method sets the friction of the entity.

## Syntax

- void **SetFriction**(const dFloat kinematicfriction, const dFloat staticfriction)

| Parameter | Description |
|---|---|
| kinematicfriction | friction of an object in motion |
| staticfriction | initial friction a stationary object must overcome to begin sliding |

## Remarks

The Box2D physics engine only uses kinematic friction.

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
    auto ground = CreateBox(world, 10, 1, 10);
    ground->SetPosition(0, -0.5, 0);
    ground->SetColor(0, 1, 0);
    
    //Add some boxes
    auto box1 = CreateBox(world, 1, 1, 1);
    box1->SetPosition(-1, 0.5, 0);
    box1->SetColor(0, 0, 1);
    box1->SetMass(1);
    box1->SetFriction(0, 0);

    auto box2 = CreateBox(world, 1, 1, 1);
    box2->SetPosition(1, 0.5, 0);
    box2->SetColor(0, 0, 1);
    box2->SetMass(1);
    box2->SetFriction(1, 1);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        //Press the space key to push the boxes
        if (window->KeyHit(KEY_SPACE))
        {
            box1->AddForce(0, 0, 100);
            box2->AddForce(0, 0, 100);
        }

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
