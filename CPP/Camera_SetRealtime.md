# Camera::SetRealtime

This method allows you to control whether a camera renders continously or only when prompted to.

## Syntax

- void **SetRealtime**(const bool mode)

| Parameter | Description |
|---|---|
| realtime | if set to true the camera will render continuously, otherwise it will render only when [Camera::Render](Camera_Render.md) is called |

## Remarks

You may want some cameras to only render once in a while, or when something changes. For example, a security camera that shows an image on a monitor in-game only needs to refreshed when the monitor is visible.

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

    //Create light
    auto light = CreateBoxLight(world);
    light->SetRange(-10, 10);
    light->SetRotation(15, 15, 0);
    light->SetColor(2);

    //Create camera
    auto camera = CreateCamera(world);
    camera->SetClearColor(0.125);
    camera->SetPosition(0, 0, -3);
    camera->SetFOV(70);

    //Create scenery
    auto box = CreateBox(world);

    auto cone = CreateCone(world);
    cone->SetPosition(1.25, 0, 0);
    cone->SetColor(0, 0, 1);

    auto sphere = CreateSphere(world);
    sphere->SetPosition(-1.25, 0, 0);
    sphere->SetColor(1, 0, 0);

    //Create camera and texture buffer
    auto texbuffer = CreateTextureBuffer(256, 256);
    auto cam2 = CreateCamera(world);
    cam2->SetClearColor(1, 1, 1);
    cam2->SetRenderTarget(texbuffer);
    cam2->SetRealtime(false);

    //Create material
    auto mtl = CreateMaterial();
    auto tex = texbuffer->GetColorAttachment();
    mtl->SetTexture(tex);
    box->SetMaterial(mtl);
    cone->SetMaterial(mtl);
    sphere->SetMaterial(mtl);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        //Orient the texturebuffer camera
        cam2->SetPosition(0, 0, 0);
        cam2->Turn(0, 1, 0);
        cam2->Move(0, 0, -3);

        //Press the space key to redraw the texture buffer camera
        if (window->KeyHit(KEY_SPACE)) cam2->Render();

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
