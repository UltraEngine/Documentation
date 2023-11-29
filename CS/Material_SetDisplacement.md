# Material.SetDisplacement

This method sets the maximum vertex displacement distance.

## Syntax

- `void SetDisplacement(float distance)`

| Parameter | Description |
|---|---|
| distance | maximum displacement, in meters |

## Example

![tessellation](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/tessellation.jpg)

```csharp
using System;
using Ultraviolet;

namespace GameEngineAPIExample
{
    class Program
    {
        static void Main(string[] args)
        {
            //Get the primary display
            var displays = Ultraviolet.GetDisplays();

            //Create a window
            var window = Ultraviolet.CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.CENTER | WindowFlags.TITLEBAR);

            //Create a rendering framebuffer
            var framebuffer = Ultraviolet.CreateFramebuffer(window);

            //Create a world
            var world = Ultraviolet.CreateWorld();
            world.SetAmbientLight(0);

            //Create a camera
            var camera = Ultraviolet.CreateCamera(world);
            camera.SetPosition(0, 0, -1);
            camera.SetFov(70);
            camera.SetClearColor(0.125);
            camera.SetTessellation(4);

            //Create a light
            var light = Ultraviolet.CreateBoxLight(world);
            light.SetRange(-10, 10);
            light.SetRotation(35, 35, 0);
            light.SetColor(4);

            //Display material
            var model = Ultraviolet.CreateCubeSphere(world, 0.5, 8, MeshFlags.QUADS);
            var mtl = Ultraviolet.LoadMaterial(remotepath + "/Materials/Ground/rocks_ground_02.json");
            mtl.SetDisplacement(0.075f);
            model.SetMaterial(mtl);

            //Main loop
            while (!window.Closed() && !window.KeyHit(KeyCode.ESCAPE))
            {
                //Arrow keys move
                if (window.KeyDown(KeyCode.DOWN)) camera.Move(0, 0, -0.01f);
                if (window.KeyDown(KeyCode.UP)) camera.Move(0, 0, 0.01f);

                //Show wireframe render when key is pressed
                camera.SetWireframe(window.KeyDown(KeyCode.W));

                //Rotate the model
                model.Turn(0, 0.1f, 0);

                world.Update();
                world.Render(framebuffer);
            }
        }
    }
}
```