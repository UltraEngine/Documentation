# Camera.SetTessellation

This method sets the desired polygon edge size for tessellated materials.

## Syntax

- void **SetTessellation**(int polygonsize)

| Parameter | Description |
| --- | --- |
| polygonsize | desired polygon edge length, in screen pixels |

## Remarks

A polygonsize value of 4 is suitable for high quality tessellation. If it is zero then tessellation will be disabled.

## Example

![Example](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/tessellation.jpg)

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the primary display
        var displays = Display.GetDisplays();

        //Create a window
        var window = Window.Create("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

        //Create a rendering framebuffer
        var framebuffer = Framebuffer.Create(window);

        //Create a world
        var world = World.Create();
        world.SetAmbientLight(0);

        //Create a camera
        var camera = Camera.Create(world);
        camera.SetPosition(0, 0, -1);
        camera.SetFov(70);
        camera.SetClearColor(0.125);
        camera.SetTessellation(4);

        //Create a light
        var light = BoxLight.Create(world);
        light.SetRange(-10, 10);
        light.SetRotation(35, 35, 0);
        light.SetColor(4);

        //Display material
        var model = CreateCubeSphere(world, 0.5, 8, MeshFlags.MESH_QUADS);
        var mtl = Material.Load(remotepath + "/Materials/Ground/rocks_ground_02.json");
        mtl.SetTessellation(true);
        mtl.SetDisplacement(0.075f);
        model.SetMaterial(mtl);

        //Main loop
        while (!window.Closed() && !window.KeyHit(KeyCode.KEY_ESCAPE))
        {
            //Arrow keys move
            if (window.KeyDown(KeyCode.KEY_DOWN)) camera.Move(0, 0, -0.01);
            if (window.KeyDown(KeyCode.KEY_UP)) camera.Move(0, 0, 0.01);

            //Show wireframe render when key is pressed
            camera.SetWireframe(window.KeyDown(KeyCode.KEY_W));

            //Rotate the model
            model.Turn(0, 0.1, 0);

            world.Update();
            world.Render(framebuffer);
        }
    }
}
```