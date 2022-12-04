# Camera::SetTessellation

This method sets the desired polygon edge size for tessellated materials.

## Syntax

- void **SetTessellation**(const int polygonsize)

| Parameter | Description |
| --- | --- |
| polygonsize | desired polygon edge length, in screen pixels |

## Remarks

A polygonsize value of 4 is suitable for high quality tessellation. If it is zero then tessellation will be disabled.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

const WString remotepath = "https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets";

int main(int argc, const char* argv[])
{
    //Get the primary display
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create a rendering framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a world
    auto world = CreateWorld();
    auto specmap = LoadTexture(remotepath + "/Materials/Environment/Storm/specular.dds");
    auto diffmap = LoadTexture(remotepath + "/Materials/Environment/Storm/diffuse.dds");
    world->SetEnvironmentMap(specmap, ENVIRONMENTMAP_SPECULAR);
    world->SetEnvironmentMap(diffmap, ENVIRONMENTMAP_DIFFUSE);

    //Create a camera
    auto camera = CreateCamera(world);
    camera->SetPosition(0, 0, -0.85);
    camera->SetClearColor(0.125);
    camera->SetTessellation(4);

    //Create a light
    auto  light = CreateBoxLight(world);
    light->SetRange(-10, 10);
    light->SetRotation(45, 35, 0);
    light->SetColor(2);

    //Display material
    auto model = CreateCubeSphere(world, 0.5, 8, true);
    auto mtl = LoadMaterial(remotepath + "/Materials/Ground/rocks_ground_02.json");
    mtl->SetDisplacement(0.05f);
    model->SetMaterial(mtl);

    //Main loop
    while (window->Closed() == false and window->KeyHit(KEY_ESCAPE) == false)
    {
        //Show wireframe render when key is pressed
        camera->SetWireframe(window->KeyDown(KEY_W));

        //Rotate the model
        model->Turn(0, 0.1, 0);

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
