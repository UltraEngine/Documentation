# CreateBox

This function creates a new box model with a physics collider.

## Syntax

- **[Model](Model.md)** **CreateBox**(**[World](World.md)** world, float size = 1)
- **[Model](Model.md)** **CreateBox**(**[World](World.md)** world, float width, float height, float depth, int xsegs = 1, int ysegs = 1, int zsegs = 1, **[MeshPrimitives](MeshPrimitives.md)** type = MESH_TRIANGLES)

| Parameter | Description |
|---|---|
| world | world to create the model in |
| size, (width, height, depth) | uniform size or dimensions of the box |
| xsegs, ysegs, zsegs | number of segments on each axis |
| type | can be MESH_TRIANGLES or MESH_QUADS |

## Remarks

For materials that use tessellation, set the *quad* parameter to true.

## Returns

Returns a new model.

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
        Window window = new Window("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

        //Create a world
        World world = new World();

        //Create a framebuffer
        Framebuffer framebuffer = new Framebuffer(window);

        //Create a camera
        Camera camera = new Camera(world);
        camera.SetClearColor(0.125f);
        camera.SetPosition(0, 0, -4);

        //Create a light
        BoxLight light = new BoxLight(world);
        light.SetRotation(45, 35, 0);
        light.SetRange(-10, 10);
        light.SetColor(2);

        //Create a model
        Model model = CreateBox(world);
        model.SetColor(0, 0, 1);

        //Main loop
        while (!window.Closed() && !window.KeyDown(Key.KEY_ESCAPE))
        {
            model.Turn(0, 1, 0);
            world.Update();
            world.Render(framebuffer);
        }
        Environment.Exit(0);
    }
}
```