# CreateVehicle #

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
    camera->Move(0, 1, -4);
    camera->SetFOV(70);

    //Create light
    auto light = CreateLight(world, LIGHT_DIRECTIONAL);
    light->SetRotation(45, 35, 0);

    //Create ground
    auto ground = CreateBox(world,1000,1,1000);
    ground->SetColor(0.5);
    ground->SetPosition(0, -5.5, 0);

    //Create Vehicle
    auto chassis = CreateBox(world,1,0.1,4);
    chassis->SetPosition(0, 3, 0);
    chassis->SetMass(1000);

    auto vehicle = CreateVehicle(chassis);

    const float tireradius = 0.5;
    const float tiremass = 25;
    const float tirewidth = 0.15;

    auto tire1 = CreateBox(world);
    tire1->SetPosition(-1, -2, 1.5);
    tire1->SetMass(tiremass);

    auto tire2 = CreateBox(world);
    tire2->SetPosition(1, -2, 1.5);
    tire2->SetMass(tiremass);

    auto tire3 = CreateBox(world);
    tire3->SetPosition(-1, -2, -1.5);
    tire3->SetMass(tiremass);

    auto tire4 = CreateBox(world);
    tire4->SetPosition(1, -2, -1.5);
    tire4->SetMass(tiremass);

    vehicle->AddTire(tire1, tireradius, tirewidth);
    vehicle->AddTire(tire2, tireradius, tirewidth);
    vehicle->AddTire(tire3, tireradius, tirewidth);
    vehicle->AddTire(tire4, tireradius, tirewidth);

    vehicle->AddAxle(0, 1);
    vehicle->AddAxle(2, 3);

    vehicle->Finalize();

    while (window->Closed() == false)
    {
        if (window->KeyDown(KEY_SPACE)) chassis->AddForce(0, 10000, 0);

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```