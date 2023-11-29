# Brush.AddVertex

This method adds a new vertex to a brush.

## Syntax

- int **AddVertex**(float x, float y, float z)
- int **AddVertex**(Vec3 position)


| Parameter | Description |
|---|---|
| position, (x, y, z) | position to set |

## Returns

Returns the new vertex index.

## Example

This example creates a box brush from scratch.

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = GetDisplays();

        //Create a window
        var window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

        //Create a framebuffer
        var framebuffer = CreateFramebuffer(window);

        //Create a world
        var world = CreateWorld();

        //Create a camera    
        var camera = CreateCamera(world);
        camera.SetClearColor(0.125);
        camera.Turn(35, 0, 0);
        camera.Move(0, 0, -4);

        //Create light
        var light = CreateBoxLight(world);
        light.SetRange(-20, 20);
        light.SetArea(20, 20);
        light.SetRotation(35, 35, 0);

        //Create brush
        var brush = CreateBrush(world);
        brush.SetColor(0, 0, 1);

        //Add brush vertices
        float w = 1; float h = 1; float d = 1;
        brush.AddVertex(w * 0.5, h * 0.5, d * 0.5);
        brush.AddVertex(-w * 0.5, h * 0.5, d * 0.5);
        brush.AddVertex(-w * 0.5, h * 0.5, -d * 0.5);
        brush.AddVertex(w * 0.5, h * 0.5, -d * 0.5);
        brush.AddVertex(w * 0.5, -h * 0.5, d * 0.5);
        brush.AddVertex(-w * 0.5, -h * 0.5, d * 0.5);
        brush.AddVertex(-w * 0.5, -h * 0.5, -d * 0.5);
        brush.AddVertex(w * 0.5, -h * 0.5, -d * 0.5);

        //Add faces
        var face = brush.AddFace();
        face.AddIndice(0);
        face.AddIndice(1);
        face.AddIndice(2);
        face.AddIndice(3);

        face = brush.AddFace();
        face.AddIndice(4);
        face.AddIndice(5);
        face.AddIndice(6);
        face.AddIndice(7);

        face = brush.AddFace();
        face.AddIndice(0);
        face.AddIndice(1);
        face.AddIndice(5);
        face.AddIndice(4);

        face = brush.AddFace();
        face.AddIndice(2);
        face.AddIndice(3);
        face.AddIndice(7);
        face.AddIndice(6);

        face = brush.AddFace();
        face.AddIndice(1);
        face.AddIndice(2);
        face.AddIndice(6);
        face.AddIndice(5);

        face = brush.AddFace();
        face.AddIndice(0);
        face.AddIndice(3);
        face.AddIndice(7);
        face.AddIndice(4);

        //Finalize the brush
        brush.Build();
	
        //Main loop
        while (!window.Closed() && !window.KeyDown(Key.KEY_ESCAPE))
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```