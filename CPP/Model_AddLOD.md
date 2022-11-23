# Model::AddLOD #
Adds a new level of detail to the model. The LOD can be empty or copied from another model. If another model is specified, its entity hierarchy must match this model's subhierarchy.

## Syntax ##
- int **AddLOD**()
- int **AddLOD**(shared_ptr<Model\> lodmodel)

## Example ##
```c++
#include "UltraEngine.h"

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
    auto light = CreateDirectionalLight(world);
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
