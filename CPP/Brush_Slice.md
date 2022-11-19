# Brush::Slice

This method will slice a brush in half along a plane and return the two resulting pieces. The original brush will be unharmed.

## Syntax

- array<shared_ptr<[Brush](Brush.md)\>, 2\> **Slice**(const [Plane](Plane.md)& plane, shared_ptr<[Face](Face.md)> sliceface = NULL, const float tolerance = 0.001)

| Parameter | Description |
|---|---|
| plane | slice plane |
| tolerance | error tolerance, should be greater than zero |
| sliceface | if provided, material and texture mapping settings will be copied from this face to the end caps of the resulting brushes. This is useful for boolean operations, where one brush carves a volume out of another.

## Returns

If the plane does not intersect the brush, the returned array will be empty. Otherwise, the returned array will contain two resulting brushes.

## Example

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
    
    //Slice in half
    Plane sliceplane = Plane(1, 1, -1, 0);
    auto operands = brush->Slice(sliceplane);
    brush = NULL;

    if (operands[0])
    {
        operands[0]->Move(-0.75, 0, 0);
        operands[0]->SetColor(0, 1, 0);
    }

    if (operands[1])
    {
        operands[1]->Move(0.75, 0, 0);
        operands[1]->SetColor(0, 0, 1);
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
