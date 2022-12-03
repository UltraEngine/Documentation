# Model::SetLodDistance

This method sets the base Lod distance factor.

- void **SetLodDistance**(const dFloat basefactor)

| Parameter | Description |
|---|---|
| basefactor | distance factor for Lod changes |

## Remarks

Each level of detail above zero will be shown when the distance from the center of the model's global bounding box to the camera exceeds the level's distance, as calculated by this equation:

distance = (2 ^ (level - 1)) * basefactor

For example, if basefactor is 10 then Lod 1 will be shown at a distance of 10 meters, Lod 2 will be shown at a distance of 20 meters, and Lod 3 will be shown at a distance of 40 meters.

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
    camera->SetPosition(0, 0, -1);
    camera->SetWireframe(true);
    camera->SetFOV(70);

    //Create a light
    auto light = CreateBoxLight(world);
    light->SetRotation(45, 35, 0);
    light->SetRange(-10, 10);
    light->SetColor(2);

    //Create a model
    auto model = CreateSphere(world, 0.5, 64);
    model->SetColor(0, 1, 0);

    //Add Lod
    auto temp = CreateSphere(world, 0.5, 32);
    model->AddLod();
    model->AddMesh(temp->lods[0]->meshes[0], 1);
    
    //Add Lod
    temp = CreateSphere(world, 0.5, 16);
    model->AddLod();
    model->AddMesh(temp->lods[0]->meshes[0], 2);

    //Add Lod
    temp = CreateSphere(world, 0.5, 8);
    model->AddLod();
    model->AddMesh(temp->lods[0]->meshes[0], 3);
    temp = NULL;

    model->SetLodDistance(1);

    auto z = camera->position.z;

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        //Move the camera forward and backwards to change detail levels
        if (window->KeyDown(KEY_UP)) z += 0.005f;
        if (window->KeyDown(KEY_DOWN)) z -= 0.005f;
        z = Min(-1.0f, z);
        camera->SetPosition(0,0,z);

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
