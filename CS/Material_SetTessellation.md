# Material.SetTessellation

This method controls whether a material will use hardware tessellation.

## Syntax

```csharp
public void SetTessellation(bool mode)
```

| Parameter | Description |
|---|---|
| mode | set to true to enable tessellation |

## Remarks

Tessellation will only be used if the camera has it enabled with [Camera.SetTessellation](Camera_SetTessellation.md).

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the primary display
        var displays = Window.GetDisplays();

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
        var model = CubeSphere.Create(world, 0.5, 8, MeshFlags.MESH_QUADS);
        var mtl = Material.Load(remotepath + "/Materials/Ground/rocks_ground_02.json");
        mtl.SetTessellation(true);
        mtl.SetDisplacement(0.075f);
        model.SetMaterial(mtl);

        //Main loop
        while (!window.Closed() && !window.KeyHit(Key.KEY_ESCAPE))
        {
            //Arrow keys move
            if (window.KeyDown(Key.KEY_DOWN)) camera.Move(0, 0, -0.01);
            if (window.KeyDown(Key.KEY_UP)) camera.Move(0, 0, 0.01);

            //Show wireframe render when key is pressed
            camera.SetWireframe(window.KeyDown(Key.KEY_W));

            //Rotate the model
            model.Turn(0, 0.1, 0);

            world.Update();
            world.Render(framebuffer);
        }
    }
}
```