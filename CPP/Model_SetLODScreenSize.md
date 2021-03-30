# Model::SetLODScreenSize #
Sets the approximate screen size of the model at which this LOD level or higher will be displayed. The screen size is calculated based on the extents of the model bounding box. This method will account for camera FOV, screen DPI and resolution, as well as distance from the camera.

## Syntax ##
- void **SetLODScreenSize**(const int level, const float screenpixels)

## Example ##
```c++
#include "pch.h"

using namespace UltraEngine;

void main(const char* args, const int argc)
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a world
    auto world = CreateWorld();

    //Create a light
    auto light = CreateLight(world, LIGHT_DIRECTIONAL);
    light->SetRotation(45, 35, 0);

    //Create a camera
    auto camera = CreateCamera(world);
    camera->Move(0, 0, -3);
    camera->SetWireframe(true);

    //Create box and set its orientation
    auto model = CreateSphere(world, 0.5, 64);

    //Create LOD levels
    auto lod1 = CreateSphere(world, 0.5, 32);
    auto lod2 = CreateSphere(world, 0.5, 16);
    auto lod3 = CreateSphere(world, 0.5, 8);

    //Add LOD levels
    model->AddLOD(lod1);
    model->AddLOD(lod2);
    model->AddLOD(lod3);

    //Delete LOD models
    lod1 = NULL;
    lod2 = NULL;
    lod3 = NULL;

    //Set LOD pixel sizes (optional)
    model->SetLODScreenSize(1, 256);
    model->SetLODScreenSize(2, 128);
    model->SetLODScreenSize(3, 64);

    float zoom = 1;

    //Main loop
    while (window->Closed() == false and window->KeyHit(KEY_ESCAPE) == false)
    {
        model->Turn(0, 1, 0);

        //Up / Down keys move forward and back
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