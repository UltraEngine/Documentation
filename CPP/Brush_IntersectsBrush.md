# Brush::IntersectsBrush

This method can be used to test whether two brushes intersect.

## Syntax

- bool **IntersectsBrush**(shared_ptr<[Brush](Brush.md)> brush)

| Parameter | Description |
|---|---|
| brush | brush to test intersection against |

## Returns

Returns true of the two brushes overlap, otherwise false is returned.

## Example

Use the left and right key to move the blue brush. When the two objects intersects, it will turn red.

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a world
    auto world = CreateWorld();

    //Create a camera    
    auto camera = CreateCamera(world);
    camera->SetClearColor(0.125);
    camera->Turn(35, 0, 0);
    camera->Move(0, 0, -6);

    //Create light
    auto light = CreateBoxLight(world);
    light->SetRange(-20, 20);
    light->SetArea(20, 20);
    light->SetRotation(35, 35, 0);
    light->SetColor(3);

    //Create brush
    auto brush = CreateBoxBrush(world, 10, 2, 2);

    //Slice brush
    auto A = CreateBrush(world);
    auto B = CreateBrush(world);
    Plane sliceplane = Plane(1, 1, -1, 0);
    (brush->Slice(sliceplane, A, B);
    A->SetColor(0, 1, 0);
    A->Move(-0.75, 0, 0);
    B->SetColor(0, 0, 1);
    B->Move(0.75, -0.5, 0.5);
    brush = NULL;

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        B->Move(float(window->KeyDown(KEY_RIGHT) - window->KeyDown(KEY_LEFT)) * 0.1, 0, 0);

        if (A->IntersectsBrush(B))
        {
            B->SetColor(1, 0, 0);
        }
        else
        {
            B->SetColor(0, 0, 1);
        }

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
