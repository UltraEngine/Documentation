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

        //Create a framebuffer
        var framebuffer = Engine.CreateFramebuffer(window);

        //Create a world
        var world = Engine.CreateWorld();

        //Create a camera    
        var camera = Engine.CreateCamera(world);
        camera.SetFov(70);
        camera.SetClearColor(0.125);
        camera.SetPosition(0, 3, -6);
        camera.SetRotation(35, 0, 0);

        //Create light
        var light = Engine.CreateBoxLight(world);
        light.SetRange(-20, 20);
        light.SetArea(20, 20);
        light.SetRotation(35, 35, 0);
        light.SetColor(3);

        //Create scene
        var ground = Engine.CreateBox(world, 10, 1, 10);
        ground.SetPosition(0, -0.5, 0);
        ground.SetColor(0, 1, 0);
        var wall = Engine.CreateBox(world, 1, 2, 4);

        //Create navmesh
        var navmesh = Engine.CreateNavMesh(world, 5, 4, 4);
        navmesh.Build();

        //Create player
        var player = Engine.CreateCylinder(world, 0.4, 1.8);
        player.SetNavObstacle(false);
        player.SetColor(0, 0, 1);
        var agent = Engine.CreateNavAgent(navmesh);
        player.Attach(agent);
        agent.SetPosition(-2, 1, 0);

        //Main loop
        while (window.Closed() == false && window.KeyDown(KeyCode.KEY_ESCAPE) == false)
        {
            navmesh.SetDebugging(window.KeyDown(KeyCode.KEY_D));

            if (window.KeyDown(KeyCode.KEY_RIGHT)) wall.Move(0.1, 0, 0);
            if (window.KeyDown(KeyCode.KEY_LEFT)) wall.Move(-0.1, 0, 0);

            if (window.MouseHit(MouseButton.MOUSE_LEFT))
            {
                var mousepos = window.GetMousePosition();
                var rayinfo = camera.Pick(framebuffer, mousepos.x, mousepos.y);
                if (rayinfo.success)
                {
                    agent.Navigate(rayinfo.position);
                }
            }
            if (window.KeyHit(KeyCode.KEY_SPACE)) agent.Stop();

            world.Update();
            world.Render(framebuffer);
        }
    }
}
```