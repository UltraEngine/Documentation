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
        var window = Window.Create("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

        //Create a framebuffer
        var framebuffer = Framebuffer.Create(window);

        //Create a world
        var world = World.Create();

        //Create a camera
        var camera = Camera.Create(world);
        camera.SetClearColor(0.125f);
        camera.SetFOV(70);
        camera.Move(0, 4, 1);
        camera.SetRotation(70, 0, 0);

        //Create light
        var light = SpotLight.Create(world);
        light.SetPosition(0, 1, 0);
        light.SetRotation(35, 0, 0);
        light.SetColor(8);
        light.SetConeAngles(35, 25);
        light.SetRange(0.1f, 30);

        //Create ground
        var ground = Box.Create(world, 20, 1, 20);
        ground.SetPosition(0, -0.5f, 0);
        ground.SetColor(0, 1, 0);

        //Main loop
        while (!window.Closed() && !window.KeyHit(Key.KEY_ESCAPE))
        {
            world.Update();
            world.Render(framebuffer);
        }
        Environment.Exit(0);
    }
}
```