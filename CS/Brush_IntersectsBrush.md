# Brush.IntersectsBrush

This method can be used to test whether two brushes intersect.

## Syntax

- bool **IntersectsBrush**(Brush brush)

| Parameter | Description |
|---|---|
| brush | brush to test intersection against |

## Returns

Returns true if the two brushes overlap, otherwise false is returned.

## Example

Use the left and right key to move the blue brush. When the two objects intersect, it will turn red.

![Brush Intersects Brush](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/brush_intersectsbrush.jpg)

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        // Get the displays
        var displays = Functions.GetDisplays();

        // Create a window
        var window = Functions.CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowStyle.WINDOW_CENTER | WindowStyle.WINDOW_TITLEBAR);

        // Create a framebuffer
        var framebuffer = Functions.CreateFramebuffer(window);

        // Create a world
        var world = Functions.CreateWorld();

        // Create a camera    
        var camera = Functions.CreateCamera(world);
        camera.SetClearColor(0.125f);
        camera.Turn(35, 0, 0);
        camera.Move(0, 0, -6);

        // Create light
        var light = Functions.CreateBoxLight(world);
        light.SetRange(-20, 20);
        light.SetArea(20, 20);
        light.SetRotation(35, 35, 0);
        light.SetColor(3f);

        // Create brush
        var brush = Functions.CreateBoxBrush(world, 10, 2, 2);

        // Slice brush
        var A = Functions.CreateBrush(world);
        var B = Functions.CreateBrush(world);
        var sliceplane = new Plane(1, 1, -1, 0);
        brush.Slice(sliceplane, A, B);
        A.SetColor(0, 1, 0);
        A.Move(-0.75f, 0, 0);
        B.SetColor(0, 0, 1);
        B.Move(0.75f, -0.5f, 0.5f);
        brush = null;

        // Main loop
        while (!window.Closed() && !window.KeyDown(Key.KEY_ESCAPE))
        {
            B.Move((window.KeyDown(Key.KEY_RIGHT) ? 1 : 0) - (window.KeyDown(Key.KEY_LEFT) ? 1 : 0) * 0.1f, 0, 0);

            if (A.IntersectsBrush(B))
            {
                B.SetColor(1, 0, 0);
            }
            else
            {
                B.SetColor(0, 0, 1);
            }

            world.Update();
            world.Render(framebuffer);
        }
    }
}
```