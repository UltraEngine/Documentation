# CreateCamera

This function creates a new camera entity.

## Syntax 

shared_ptr<[Camera](Camera.md)\> **CreateCamera**(shared_ptr<[World](World.md)\> world, const projectionmode = PROJECTION_PERSPECTIVE)

| Parameter | Description |
|---|---|
| world | |
| projectionmode | this can be PROJECTION_PERSPECTIVE or PROJECTION_ORTHOGRAPHIC |

## Remarks

You can create multiple cameras to render with. Cameras will be rendered in the order they are created. In most cases you will want to call [Camera::SetClearMode](Camera_SetClearMode.md) with CLEAR_DEPTH as the argument, for all cameras created after the first one. This will ensure that the results of the previous camera render remain visible on the screen.

You can control which entities are visible to a camera with the [Entity::SetRenderLayer](Entity_SetRenderLayer.md) method.

There are no 2D objects or drawing commands in Ultra Engine. Instead, all rendering is done through one uniform pipeline and the camera projection mode is used to control whether objects appear in 3D or 2D space. This has the benefits of very fast performance for 3D and 2D rendering, as well as effortless application of 3D effects in 2D, 2D physics in a 3D world, and other possibilities.

If you want to render 2D objects on top of a 3D scene, as you would for a head-up display in a game, you can create an extra camera to render in 2D in top of the perspective camera.

If orthographic projection is used, the new camera will have a depth range of (-1,1). With the default zoom (1.0) one pixel onscreen will be equal to one meter in space.

If perspective projection is used, the new camera will have a near depth range of 0.1 (ten centimeters) and a far depth range of 1000 (one kilometer).

Any camera in the sequence can use post-processing effects, but only the first camera's post-processing effects will be used and subsequent cameras will have post-processing effects ignored. Transparency with refraction counts as a post-processing effect.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create a world
    auto world = CreateWorld();

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a camera
    auto camera = CreateCamera(world);
    camera->SetClearColor(0.125);
    
    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
