# Camera::SetClearMode

This method sets the camera clear behavior.

## Syntax

- void **SetClearMode**(const ClearMode mode);

| Parameter | Description |
|---|---|
| mode | can be any combination of CLEAR_DEPTH and CLEAR_COLOR |

## Remarks

By default a camera will clear the color and depth buffer before rendering begins. Multiple cameras can be used to render a larger area than what the depth buffer precision would allow otherwise. This is done by first rendering one camera, then rendering another camera that is set to only clear the depth buffer.

Cameras are always drawn in the order they are created.

## Example

This example uses two camera to draw the far and near scene, with small gap between their ranges to show the effect.

```c++
#include "UltraEngine.h"
#include "Components/Player/CameraControls.hpp"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create a world
    auto world = CreateWorld();
    world->SetAmbientLight(0);

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a camera    
    auto camera = CreateCamera(world);
    camera->SetClearColor(0.125);
    camera->SetPosition(0, 1, -4);
    camera->SetRange(5, 1000);

    //Create second camera
    auto cam2 = CreateCamera(world);
    cam2->SetPosition(0, 1, -5);
    cam2->SetRange(0.1, 4.5);
    cam2->SetClearMode(CLEAR_DEPTH);
    cam2->SetParent(camera);

    //Create light
    auto light = CreateBoxLight(world);
    light->SetRange(-10, 10);
    light->SetArea(15, 15);
    light->SetRotation(45, 35, 0);
    light->SetColor(2);

    //Create the ground
    auto ground = CreateBox(world, 10, 1, 10);
    ground->SetPosition(0, -0.5, 0);
    ground->SetColor(0, 1, 0);

    //Create model
    auto model = CreateBox(world);
    model->SetPosition(0, 0.5, 0);
    model->SetColor(0, 0, 1);

    //Camera controls
    camera->AddComponent<CameraControls>();

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
