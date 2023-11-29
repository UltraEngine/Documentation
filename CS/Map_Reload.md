```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Engine.GetDisplays();

        //Create a window
        var window = Engine.CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

        //Create a world
        var world = Engine.CreateWorld();

        //Create a framebuffer
        var framebuffer = Engine.CreateFramebuffer(window);

        //Create a camera    
        var camera = Engine.CreateCamera(world);
        camera.SetClearColor(0.125f);
        camera.SetPosition(0, 1, -4);

        //Create light
        var light = Engine.CreateBoxLight(world);
        light.SetRange(-10, 10);
        light.SetArea(15, 15);
        light.SetRotation(45, 35, 0);
        light.SetColor(2);

        //Create the ground
        var ground = Engine.CreateBox(world, 10, 1, 10);
        ground.SetPosition(0, -0.5f, 0);
        ground.SetColor(0, 1, 0);

        //Create a scene
        var scene = Engine.CreateMap();
        scene.entities.Add(ground);
        scene.entities.Add(light);

        //Add some boxes
        for (int n = 0; n < 10; ++n)
        {
            var box = Engine.CreateBox(world);
            box.SetColor(0, 0, 1);
            box.SetPosition(Engine.Random(-5, 5), Engine.Random(5, 10), Engine.Random(-5, 5));
            box.SetMass(1);
            scene.entities.Add(box);
        }

        //Save the starting scene to a file
        scene.Save("game.sav");

        //Main loop
        while (!window.Closed() && !window.KeyDown(Key.KEY_ESCAPE))
        {
            //Reload the starting scene when space key is pressed
            if (window.KeyHit(Key.KEY_SPACE))
            {
                scene.Reload("game.sav");
            }

            world.Update();
            world.Render(framebuffer);
        }
    }
}
```