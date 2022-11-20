# Brush::Slice

This method will slice a brush along a plane and return the two resulting pieces. The original brush will be unharmed.

## Syntax

- bool **Slice**(const [Plane](Plane.md)& plane, shared_ptr<[Brush](Brush.md)> operandA, shared_ptr<[Brush](Brush.md)> operandB, shared_ptr<[Face](Face.md)> sliceface = NULL, const float tolerance = 0.001)

| Parameter | Description |
|---|---|
| plane | slice plane |
| operandA | brush to receive the volume behind the slice plane |
| operandB | brush to receive the volume in front of the slice plane |
| sliceface | if provided, material and texture mapping settings will be copied from this face to the end caps of the resulting brushes. This is useful for boolean operations, where one brush carves a volume out of another.
| tolerance | error tolerance, should be greater than zero |

## Returns

If the plane intersects the brush true is returned, otherwise false is returned. The results of the slice operation will be added to operandA and operandB.

Either operandA or operandB may be NULL, but if both are NULL the operation will always return false.

Brushes can be fractured by performing multiple slices.

Boolean addition and subtraction can be performed by slicing multiple planes, discarding one operand, and grouping the resulting brushes.

## Example

This example will create a brush and cut it into two pieces.

![](https://github.com/UltraEngine/Documentation/raw/master/Images/brush_slice.jpg)

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
    if (brush->Slice(sliceplane, A, B))
    {
        A->SetColor(0, 1, 0);
        A->Move(-0.75, 0, 0);

        B->SetColor(0, 0, 1);
        B->Move(0.75, 0, 0);

        brush = NULL;
    }
    else
    {
        A = NULL;
        B = NULL;
    }

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
