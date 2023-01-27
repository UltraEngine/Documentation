# Mesh::SetVertexColor

This method can be used to modify the color of a single vertex.

## Syntax

- void **SetVertexColor(const uint32_t index, const float r, const float g, const float b, const float a = 1.0f)
- void **SetVertexColor(const uint32_t index, const [Vec4](Vec4.md)& color)

| Parameter | Description |
|---|---|
| index | vertex indice |
| color (r,g,b,a) | color to set |

## Remarks

Vertex colors are not compatible with skinned meshes.

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

    //Create a light
    auto light = CreateBoxLight(world);
    light->SetRotation(45, 35, 0);
    light->SetRange(-10, 10);
    light->SetColor(2);

    //Create a model
    auto model = CreateSphere(world);
    for (int v = 0; v < model->lods[0]->meshes[0]->vertices.size(); ++v)
    {
        model->lods[0]->meshes[0]->SetVertexColor(v, Random(), Random(), Random());
    }

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        model->Turn(0, 1, 0);
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
