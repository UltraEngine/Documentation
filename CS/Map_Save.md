# Map.Save

This method saves a scene to a file or stream.

## Syntax

- bool **Save**(string path, SaveFlags flags = SaveFlags.SAVE_DEFAULT)
- bool **Save**(Stream stream, SaveFlags flags = SaveFlags.SAVE_DEFAULT)

| Parameter | Description |
|---|---|
| path | file path to save to |
| stream | stream to write JSON data to |
| binstream | stream to write binary data to |
| flags | Save mode flags |

## Returns

If the scene is successfully saved true is returned, otherwise false is returned.

## Remarks

This feature is in continued development and its behavior may change somewhat in future updates.

## Example

This example saves the starting scene and reloads it when the space key is pressed.

```csharp
using System;
using UltraEngine;

public class Program
{
    public static void Main(string[] args)
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create a window
        var window = Window.Create("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

        //Create a world
        var world = World.Create();

        //Create a framebuffer
        var framebuffer = Framebuffer.Create(window);

        //Create a camera    
        var camera = Camera.Create(world);
        camera.SetClearColor(0.125);
        camera.SetPosition(0, 1, -4);

        //Create light
        var light = BoxLight.Create(world);
        light.SetRange(-10, 10);
        light.SetArea(15, 15);
        light.SetRotation(45, 35, 0);
        light.SetColor(2);

        //Create the ground
        var ground = Box.Create(world, 10, 1, 10);
        ground.SetPosition(0, -0.5, 0);
        ground.SetColor(0, 1, 0);

        //Create a scene
        var scene = Map.Create();
        scene.entities.Add(ground);
        scene.entities.Add(light);
        ground = null;
        light = null;

        //Add some boxes
        for (int n = 0; n < 10; ++n)
        {
            var box = Box.Create(world);
            box.SetColor(0, 0, 1);
            box.SetPosition(Rand.Float(-5, 5), Rand.Float(5, 10), Rand.Float(-5, 5));
            box.SetMass(1);
            scene.entities.Add(box);
        }

        //Save the starting scene to a file
        scene.Save("game.sav");

        //Main loop
        while (!window.Closed() && !window.KeyDown(Keys.KEY_ESCAPE))
        {
            //Reload the starting scene when space key is pressed
            if (window.KeyHit(Keys.KEY_SPACE))
            {
                scene.Reload("game.sav");
            }

            world.Update();
            world.Render(framebuffer);
        }
    }
}
```