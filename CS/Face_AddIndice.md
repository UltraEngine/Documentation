# Face::AddIndice

This method adds a new indice to a face.

## Syntax

- int **AddIndice**(int v)

| Parameter | Description |
|---|---|
| v | the brush vertex index to add |

## Returns

Returns the index of the new indice.

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
        var displays = UltraEngine.GetDisplays();

        //Create a window
        var window = UltraEngine.CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], UltraEngine.WINDOW_CENTER | UltraEngine.WINDOW_TITLEBAR);

        //Create a framebuffer
        var framebuffer = UltraEngine.CreateFramebuffer(window);

        //Create a world
        var world = UltraEngine.CreateWorld();

        //Create a camera    
        var camera = UltraEngine.CreateCamera(world);
        camera.SetClearColor(0.125);
        camera.Turn(35, 0, 0);
        camera.Move(0, 0, -4);

        //Create light
        var light = UltraEngine.CreateBoxLight(world);
        light.SetRange(-20, 20);
        light.SetArea(20, 20);
        light.SetRotation(35, 35, 0);

        //Create brush
        var brush = UltraEngine.CreateBrush(world);
        brush.SetColor(0, 0, 1);

        //Add brush vertices
        float w = 1; float h = 1; float d = 1;
        brush.AddVertex(w * 0.5f, h * 0.5f, d * 0.5f);
        brush.AddVertex(-w * 0.5f, h * 0.5f, d * 0.5f);
        brush.AddVertex(-w * 0.5f, h * 0.5f, -d * 0.5f);
        brush.AddVertex(w * 0.5f, h * 0.5f, -d * 0.5f);
        brush.AddVertex(w * 0.5f, -h * 0.5f, d * 0.5f);
        brush.AddVertex(-w * 0.5f, -h * 0.5f, d * 0.5f);
        brush.AddVertex(-w * 0.5f, -h * 0.5f, -d * 0.5f);
        brush.AddVertex(w * 0.5f, -h * 0.5f, -d * 0.5f);

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
        while (!window.Closed() && !window.KeyDown(UltraEngine.KEY_ESCAPE))
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```