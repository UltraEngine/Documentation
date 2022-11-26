# CreateBox

This function creates a new box model with a physics collider.

## Syntax

- shared_ptr<[Model](Model.md)\> **CreateBox**(shared_ptr<[World](World.md)\> world, const float size = 1)
- shared_ptr<[Model](Model.md)\> **CreateBox**(shared_ptr<[World](World.md)\> world, const float width, const float height, const float depth, const int xsegs = 1, const int ysegs = 1, const int zsegs = 1, const bool quads = false))

| Parameter | Description |
|---|---|
| world | world to create the model in |
| size, (width, height, depth) | uniform size or dimensions of the box |
| xsegs, ysegs, zsegs | number of segments on each axis |
| quads | if true the mesh will use quads, otherwise it will use triangles |

## Remarks

For materials that use tessellation, set the *quad* parameter to true.

## Returns

Returns a new model.

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
    camera->SetPosition(0, 0, -4);

    //Create a light
    auto light = CreateBoxLight(world);
    light->SetRotation(45, 35, 0);
    light->SetRange(-10, 10);

    //Create a model
    auto model = CreateBox(world);
    model->SetColor(0,0,1);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
