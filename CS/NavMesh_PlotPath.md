```csharp
using System;
using System.Collections.Generic;
using UltraEngine;

public class Program
{
    public static void Main(string[] args)
    {
        //Get the displays
        var displays = GetDisplays();

        //Create a window
        var window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

        //Create a framebuffer
        var framebuffer = CreateFramebuffer(window);

        //Create a world
        var world = CreateWorld();

        //Create a camera    
        var camera = CreateCamera(world);
        camera.SetFov(70);
        camera.SetClearColor(0.125);
        camera.SetPosition(0, 3, -6);
        camera.SetRotation(35, 0, 0);

        //Create light
        var light = CreateBoxLight(world);
        light.SetRange(-20, 20);
        light.SetArea(20, 20);
        light.SetRotation(35, 35, 0);
        light.SetColor(3);

        //Create scene
        var ground = CreateBox(world, 10, 1, 10);
        ground.SetPosition(0, -0.5, 0);
        ground.SetColor(0, 1, 0);
        var wall = CreateBox(world, 1, 2, 4);

        //Create navmesh
        var navmesh = CreateNavMesh(world, 5, 4, 4);
        navmesh.Build();

        //Create player
        var player = CreateCylinder(world, 0.4, 1.8);
        player.SetNavObstacle(false);
        player.SetColor(0, 0, 1);
        var agent = CreateNavAgent(navmesh);
        player.Attach(agent);
        agent.SetPosition(navmesh.RandomPoint());

        var nodes = new List<Entity>();

        //Main loop
        while (!window.Closed() && !window.KeyDown(KEY_ESCAPE))
        {
            if (window.MouseHit(MOUSE_LEFT))
            {
                var mousepos = window.GetMousePosition();
                var rayinfo = camera.Pick(framebuffer, mousepos.x, mousepos.y);
                if (rayinfo.success)
                {
                    var path = navmesh.PlotPath(player.position, rayinfo.position);
                    nodes.Resize(path.Length);
                    for (int n = 0; n < nodes.Length; ++n)
                    {
                        if (nodes[n] == null)
                        {
                            nodes[n] = CreateSphere(world, 0.25);
                            nodes[n].SetNavObstacle(false);
                            nodes[n].SetColor(1, 0, 0);
                        }
                        nodes[n].SetPosition(path[n]);
                    }
                }
            }

            world.Update();
            world.Render(framebuffer);
        }
    }
}
```