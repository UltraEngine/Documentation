# Material::SetTessellation

This method controls whether a material will use hardware tessellation.

## Syntax

- void **SetTessellation**(const bool mode)

| Parameter | Description |
|---|---|
| mode | set to true to enable tessellation |

## Remarks

Tessellation will only be used if the camera has it enabled with [Camera::SetTessellation](Camera_SetTessellation.md).

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
    world->SetAmbientLight(0);

    //Create a camera
    auto camera = CreateCamera(world);
    camera->SetPosition(0, 0, -1);
    camera->SetFov(70);
    camera->SetClearColor(0.125);
    camera->SetTessellation(4);

    //Create a light
    auto  light = CreateBoxLight(world);
    light->SetRange(-10, 10);
    light->SetRotation(35, 35, 0);
    light->SetColor(4);

    //Display material
    auto model = CreateCubeSphere(world, 0.5, 8, MESH_QUADS);
    auto mtl = LoadMaterial(remotepath + "/Materials/Ground/rocks_ground_02.json");
    mtl->SetTessellation(true);
    mtl->SetDisplacement(0.075f);
    model->SetMaterial(mtl);

    //Main loop
    while (window->Closed() == false and window->KeyHit(KEY_ESCAPE) == false)
    {
        //Arrow keys move
        if (window->KeyDown(KEY_DOWN)) camera->Move(0, 0, -0.01);
        if (window->KeyDown(KEY_UP)) camera->Move(0, 0, 0.01);

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
