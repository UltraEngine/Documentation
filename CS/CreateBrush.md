# CreateBrush

This function creates a new empty brush entity.

## Syntax

- `Brush CreateBrush`(World world)

| Parameter | Description |
|---|---|
| world | world to create the brush in |

## Returns

Returns a new brush entity.

## Example

This example creates a box brush from scratch.

```csharp
using System;
using UltraEngine;

namespace Game
{
    class Program
    {
        static void Main(string[] args)
        {
            //Get the displays
            var displays = Display.GetDisplays();

            //Create a window
            var window = Window.Create("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlag.WINDOW_CENTER | WindowFlag.WINDOW_TITLEBAR);

            //Create a framebuffer
            var framebuffer = Framebuffer.Create(window);

            //Create a world
            var world = World.Create();

            //Create a camera    
            var camera = Camera.Create(world);
            camera.SetClearColor(0.125f);
            camera.Turn(35, 0, 0);
            camera.Move(0, 0, -4);

            //Create light
            var light = BoxLight.Create(world);
            light.SetRange(-20, 20);
            light.SetArea(20, 20);
            light.SetRotation(35, 35, 0);

            //Create brush
            var brush = CreateBrush(world);
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
            face.AddIndex(0);
            face.AddIndex(1);
            face.AddIndex(2);
            face.AddIndex(3);

            face = brush.AddFace();
            face.AddIndex(4);
            face.AddIndex(5);
            face.AddIndex(6);
            face.AddIndex(7);

            face = brush.AddFace();
            face.AddIndex(0);
            face.AddIndex(1);
            face.AddIndex(5);
            face.AddIndex(4);

            face = brush.AddFace();
            face.AddIndex(2);
            face.AddIndex(3);
            face.AddIndex(7);
            face.AddIndex(6);

            face = brush.AddFace();
            face.AddIndex(1);
            face.AddIndex(2);
            face.AddIndex(6);
            face.AddIndex(5);

            face = brush.AddFace();
            face.AddIndex(0);
            face.AddIndex(3);
            face.AddIndex(7);
            face.AddIndex(4);

            //Finalize the brush
            brush.Build();

            //Main loop
            while (window.Closed() == false && window.KeyDown(Key.KEY_ESCAPE) == false)
            {
                world.Update();
                world.Render(framebuffer);
            }
        }
    }
}
```