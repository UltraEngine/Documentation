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
        camera.SetFOV(70);
        camera.SetClearColor(0.125f);
        camera.SetPosition(0, 3, -6);
        camera.SetRotation(35, 0, 0);

        //Create light
        var light = BoxLight.Create(world);
        light.SetRange(-20, 20);
        light.SetArea(20, 20);
        light.SetRotation(35, 35, 0);
        light.SetColor(3);

        //Create scene
        var ground = Box.Create(world, 10, 1, 10);
        ground.SetPosition(0, -0.5f, 0);
        ground.SetColor(0, 1, 0);
        var wall = Box.Create(world, 1, 2, 4);

        //Create navmesh
        var navmesh = NavMesh.Create(world, 10, 5, 10, 4, 4);
        navmesh.Build();

        //Create player
        var player = Cylinder.Create(world, 0.4f, 1.8f);
        player.SetNavObstacle(false);
        player.SetColor(0, 0, 1);
        var agent = CreateNavAgent(navmesh);
        player.Attach(agent);

        //Main loop
        while (!window.Closed() && !window.KeyDown(KeyCode.KEY_ESCAPE))
        {
            if (window.MouseHit(MouseButton.MOUSE_LEFT))
            {
                var mousepos = window.GetMousePosition();
                var rayinfo = camera.Pick(framebuffer, mousepos.x, mousepos.y);
                if (rayinfo.success)
                {
                    agent.Navigate(rayinfo.position);
                }
            }

            world.Update();
            world.Render(framebuffer);
        }
    }
}
```