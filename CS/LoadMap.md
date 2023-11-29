# LoadMap

This command loads a scene from a file path or stream.

## Syntax

- ```csharp
  Map LoadMap(World world, string path, LoadFlags flags = LoadFlags.LOAD_DEFAULT)
  ```
- ```csharp
  Map LoadMap(World world, Stream stream, Stream binstream, LoadFlags flags = LoadFlags.LOAD_DEFAULT)
  ```

## Returns

If the scene is successfully loaded a new map is returned, otherwise NULL is returned.

## Remarks

This feature is in continued development and its behavior may change somewhat in future updates.

## Example

This example saves the starting map and reloads it when the space key is pressed.

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
        var window = new Window("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlag.WINDOW_CENTER | WindowFlag.WINDOW_TITLEBAR);

        //Create a world
        var world = new World();

        //Create a framebuffer
        var framebuffer = new Framebuffer(window);

        //Create a camera    
        var camera = new Camera(world);
        camera.SetClearColor(0.125f);
        camera.SetPosition(0, 1, -4);

        //Create light
        var light = new BoxLight(world);
        light.SetRange(-10, 10);
        light.SetArea(15, 15);
        light.SetRotation(45, 35, 0);
        light.SetColor(2);

        //Create the ground
        var ground = new Box(world, 10, 1, 10);
        ground.SetPosition(0, -0.5, 0);
        ground.SetColor(0, 1, 0);
    
        //Create a scene
        var scene = new Map();
        scene.entities.Add(ground);
        scene.entities.Add(light);
        ground = null;
        light = null;

        //Add some boxes
        for (int n = 0; n < 10; ++n)
        {
            var box = new Box(world);
            box.SetColor(0, 0, 1);
            box.SetPosition(Utility.Random(-5, 5), Utility.Random(5, 10), Utility.Random(-5, 5));
            box.SetMass(1);
            scene.entities.Add(box);
        }

        //Save the starting scene to memory
        var stream = new BufferStream();
        var binstream = new BufferStream();
        scene.Save(stream, binstream);

        //Main loop
        while (!window.Closed && !window.KeyDown(Key.KEY_ESCAPE))
        {
            //Reload the starting scene when space key is pressed
            if (window.KeyHit(Key.KEY_SPACE))
            {
                stream.Seek(0);
                binstream.Seek(0);
                scene = world.LoadScene(stream, binstream);
            }

            world.Update();
            world.Render(framebuffer);
        }
    }
}
```
