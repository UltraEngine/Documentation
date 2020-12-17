# Model::SetLODScreensize #
Sets the approximate screen size of the model at which this LOD level or higher will be displayed. The screen size is calculated based on the extents of the model bounding box. This method will account for camera FOV, screen DPI and resolution, as well as distance from the camera.

## Syntax ##
- void SetLODDistance(const int level, const float screenpixels)

## Example ##
```c++
#include "pch.h"

using namespace UltraEngine;

void main(const char* args, const int argc)
{
    //Get the displays
    auto displays = ListDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_TITLEBAR | WINDOW_CENTER);

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a world
    auto world = CreateWorld();

    //Create a light
    auto light = CreateLight(world, LIGHT_DIRECTIONAL);
    light->SetRotation(45, 35, 0);

    //Create a camera
    auto camera = CreateCamera(world);
    camera->Move(0, 1.5, -4);
    camera->SetWireframe(true);

    //Create box and set its orientation
    auto model = LoadModel(world, "https://github.com/Leadwerks/Documentation/raw/master/Assets/Models/Stanford/dragon.glb");
    model->SetColor(0.5, 0.5, 0.5, 1, true);
    model->SetScale(0.1);

    auto d = model->GetLODScreensize(1);

    model->SetLODScreensize(1, 500);
    model->SetLODScreensize(2, 250);
    model->SetLODScreensize(3, 125);

    float zoom = 1;

    //Main loop
    while (window->Closed() == false and window->KeyHit(KEY_ESCAPE) == false)
    {
        model->Turn(0, 0.1, 0);

        //  Up/Down keys move forward and back
        if (window->KeyDown(KEY_UP)) camera->Move(0, 0, 0.03);
        if (window->KeyDown(KEY_DOWN)) camera->Move(0, 0, -0.03);

        // +/- keys zoom in and out
        if (window->KeyDown(KEY_EQUALS)) zoom *= 1.01;;
        if (window->KeyDown(KEY_SUBTRACT)) zoom /= 1.01;
        camera->SetZoom(zoom);

        //Update world
        world->Update();

        //Render world
        world->Render(framebuffer);
    }
}
```
