# Model.AddLod()

This method adds a [Lod](Lod.md) to a model.

## Syntax

- **int AddLod**()

## Returns

Returns the index of the new level of detail.

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create a window
        var window = new Window("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

        //Create a world
        var world = new World();

        //Create a framebuffer
        var framebuffer = new Framebuffer(window);

        //Create a camera
        var camera = new Camera(world);
        camera.SetClearColor(0.125);
        camera.SetPosition(0, 0, -1);
        camera.SetWireframe(true);
        camera.SetFOV(70);

        //Create a light
        var light = new BoxLight(world);
        light.SetRotation(45, 35, 0);
        light.SetRange(-10, 10);
        light.SetColor(2);

        //Create a model
        var model = new Sphere(world, 0.5, 64);
        model.SetColor(0, 1, 0);

        //Add Lod
        var temp = new Sphere(world, 0.5, 32);
        model.AddLod();
        model.AddMesh(temp.lods[0].meshes[0], 1);

        //Add Lod
        temp = new Sphere(world, 0.5, 16);
        model.AddLod();
        model.AddMesh(temp.lods[0].meshes[0], 2);

        //Add Lod
        temp = new Sphere(world, 0.5, 8);
        model.AddLod();
        model.AddMesh(temp.lods[0].meshes[0], 3);
        temp = null;

        model.SetLodDistance(1);

        var z = camera.position.z;

        //Main loop
        while (!window.Closed() && !window.KeyDown(Key.KEY_ESCAPE))
        {
            //Move the camera forward and backwards to change detail levels
            if (window.KeyDown(Key.KEY_UP)) z += 0.005f;
            if (window.KeyDown(Key.KEY_DOWN)) z -= 0.005f;
            z = Math.Min(-1.0f, z);
            camera.SetPosition(0,0,z);

            world.Update();
            world.Render(framebuffer);
        }
    }
}
```