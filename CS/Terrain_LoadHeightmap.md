```csharp
using System;
using LeadwerksEngine;

public class Program
{
    public static void Main(string[] args)
    {
        //Get the displays
        var displays = Window.GetDisplays();

        //Create a window
        var window = Window.Create("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.Center | WindowFlags.Titlebar | WindowFlags.ClientCoords);

        //Create a framebuffer
        var framebuffer = Framebuffer.Create(window);

        //Create a world
        var world = World.Create();

        //Create a camera
        var camera = Camera.Create(world);
        camera.SetFOV(70);
        camera.SetClearColor(0.125);
        camera.SetRotation(45, 0, 0);
        camera.Move(0, 0, -500);

        //Create a light
        var light = DirectionalLight.Create(world);
        light.SetRotation(45, 45, 0);

        //Create terrain
        var terrain = Terrain.Create(world, 1024);
        terrain.LoadHeightmap("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Terrain/1024.r16");
        terrain.SetScale(1, 300, 1);
        terrain.SetPosition(0,-100,0);

        //Main loop
        while (!window.Closed() && !window.KeyDown(Key.Escape))
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```