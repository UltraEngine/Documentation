# Joint::EnableMotor


## Examples

The first example demonstrates a hinge joint with motor enabled:

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
    ground->SetPosition(-framebuffer->size.x / 2, -framebuffer->size.y / 2);
    ground->SetColor(0, 1, 0);

    //Add some boxes
    auto sprite1 = CreateSprite(world, 400, 25, false, 0, true);
    sprite1->SetMass(1);
    sprite1->SetPosition(-200, -12.5, 0);
    sprite1->SetColor(0, 0, 1);

    auto sprite2 = CreateSprite(world, 50, 50, false, 0, true);
    sprite2->SetMass(1);
    sprite2->SetPosition(100, 1000, 0);
    sprite2->SetColor(1, 0, 0);

    //Create a joint
    auto joint = CreateHingeJoint(Vec3(0), Vec3(0, 0, 1), NULL, sprite1);
    joint->EnableMotor(true);
    joint->SetMaxTorque(1000);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        //Adjust motor rotation
        float roll = sprite1->GetRotation().z;
        joint->SetRotation(roll + 10.0f);

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
This example demonstrates a slider joint with motor enabled:
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
    ground->SetPosition(-framebuffer->size.x / 2, -framebuffer->size.y / 2);
    ground->SetColor(0, 1, 0);

    //Add some boxes
    auto sprite1 = CreateSprite(world, 400, 25, false, 0, true);
    sprite1->SetMass(1);
    sprite1->SetPosition(-200, -12.5, 0);
    sprite1->SetColor(0, 0, 1);

    auto sprite2 = CreateSprite(world, 50, 50, false, 0, true);
    sprite2->SetMass(1);
    sprite2->SetPosition(100, 300, 0);
    sprite2->SetColor(1, 0, 0);

    //Create a joint
    auto joint = CreateSliderJoint(Vec3(0), Vec3(1, 0, 0), NULL, sprite1);
    joint->EnableMotor(true);
    joint->SetMaxForce(10000);
    
    float x = sprite1->position.x;
    float speed = 3;
    
    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        //Adjust joint motor position
        x += speed;
        if (x > 000) speed = -Abs(speed);
        if (x < -400) speed = Abs(speed);
        joint->SetPosition(x);

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
