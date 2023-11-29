# Mesh.SetVertexColor

This method can be used to modify the color of a single vertex.

## Syntax

- void **SetVertexColor(uint index, float r, float g, float b, float a = 1.0f)**
- void **SetVertexColor(uint index, [Color](Color.md) color)**

| Parameter | Description |
|---|---|
| index | vertex indice |
| color (r,g,b,a) | color to set |

## Remarks

Vertex colors are not compatible with skinned meshes.

## Example

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

        //Create a world
        var world = CreateWorld();

        //Create a framebuffer
        var framebuffer = CreateFramebuffer(window);

        //Create a camera
        var camera = CreateCamera(world);
        camera.SetClearColor(0.125);
        camera.SetPosition(0, 0, -1);

        //Create a light
        var light = CreateBoxLight(world);
        light.SetRotation(45, 35, 0);
        light.SetRange(-10, 10);
        light.SetColor(2);

        //Create a model
        var model = CreateSphere(world);
        for (int v = 0; v < model.lods[0].meshes[0].vertices.Count; ++v)
        {
            model.lods[0].meshes[0].SetVertexColor(v, Random(), Random(), Random());
        }

        //Main loop
        while (!window.Closed() || !window.KeyDown(KeyCode.KEY_ESCAPE))
        {
            model.Turn(0, 1, 0);
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```