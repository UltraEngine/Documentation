# Brush::Slice

This method will slice a brush along a plane and return the two resulting pieces. The original brush will be unharmed.

## Syntax

- bool **Slice**(Plane plane, [Brush](Brush.md) operandA, [Brush](Brush.md) operandB, [Face](Face.md) sliceface = null, float tolerance = 0.001f)

| Parameter | Description |
|---|---|
| plane | slice plane |
| operandA | brush to receive the volume behind the slice plane |
| operandB | brush to receive the volume in front of the slice plane |
| sliceface | if provided, material and texture mapping settings will be copied from this face to the end caps of the resulting brushes. This is useful for boolean operations, where one brush carves a volume out of another. |
| tolerance | error tolerance, should be greater than zero |

## Returns

If the plane intersects the brush true is returned, otherwise false is returned. The results of the slice operation will be added to operandA and operandB.

Either operandA or operandB may be null, but if both are null the operation will always return false.

Brushes can be fractured by performing multiple slices.

Boolean addition and subtraction can be performed by slicing multiple planes, discarding one operand, and grouping the resulting brushes.

## Example

This example will create a brush and cut it into two pieces.

![](https://github.com/UltraEngine/Documentation/raw/master/Images/brush_slice.jpg)

```C#
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create a window
        var window = Window.Create("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

        //Create a framebuffer
        var framebuffer = Framebuffer.Create(window);

        //Create a world
        var world = World.Create();

        //Create a camera    
        var camera = Camera.Create(world);
        camera.SetClearColor(0.125);
        camera.Turn(35, 0, 0);
        camera.Move(0, 0, -6);

        //Create light
        var light = BoxLight.Create(world);
        light.SetRange(-20, 20);
        light.SetArea(20, 20);
        light.SetRotation(35, 35, 0);
        light.SetColor(3);

        //Create brush
        var brush = BoxBrush.Create(world, 10, 2, 2);
        
        //Slice brush
        var A = Brush.Create(world);
        var B = Brush.Create(world);
        Plane sliceplane = new Plane(1, 1, -1, 0);
        if (brush.Slice(sliceplane, A, B))
        {
            A.SetColor(0, 1, 0);
            A.Move(-0.75, 0, 0);

            B.SetColor(0, 0, 1);
            B.Move(0.75, 0, 0);

            brush = null;
        }
        else
        {
            A = null;
            B = null;
        }

        //Main loop
        while (!window.Closed() && !window.KeyDown(Key.KEY_ESCAPE))
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```