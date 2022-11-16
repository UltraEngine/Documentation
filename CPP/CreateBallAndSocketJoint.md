# CreateBallAndSocketJoint


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
    camera->SetPosition(0,0,-4);

    //Create light
    auto light = CreateDirectionalLight(world);
    light->SetRotation(35, 35, 0);
    light->SetColor(3);

    auto parent = CreateBox(world);
    parent->SetMass(1);
    //parent->SetGravityMode(false);

    auto joint = CreateBallAndSocketJoint(Vec3(0,2,0), parent, NULL);
    //parent->AddTorque(0, 100, 0);
    //joint->SetMaxTorque(10000);
    //joint->SetLimits(-2, 2);
    //joint->SetMotorSpeed(360);
    //joint->SetMaxForce(100);

    joint->SetLimits(45, 360);

    //Main loop
    float a = 0;
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        if (window->KeyHit(KEY_F)) parent->AddTorque(0, -50, 0, false);
        if (window->KeyHit(KEY_G)) parent->AddTorque(0, 50, 0, false);
        if (window->KeyHit(KEY_R)) parent->AddForce(100, 0, 0, false);
        if (window->KeyHit(KEY_T)) parent->AddForce(0, 0, 100, false);

        if (window->KeyDown(KEY_RIGHT)) a += 1;
        if (window->KeyDown(KEY_LEFT)) a -= 1;
        //joint->SetPose(Vec3(0), Vec3(0,0,a));

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
