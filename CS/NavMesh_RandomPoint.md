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
        var window = new Window("Ultra Engine", 0, 0, 1280, 720, displays[0], Window.DECORATED);
        window.Center();
        
        //Create a framebuffer
        var framebuffer = new FrameBuffer(window);

        //Create a world
        var world = new World();

        //Create a camera    
        var camera = new Camera(world);
        camera.Fov = 70;
        camera.ClearColor = new Vec4(0.125f);
        camera.Position = new Vec3(0, 3, -6);
        camera.Rotation = new Vec3(35, 0, 0);

        //Create light
        var light = new BoxLight(world);
        light.SetRange(-20, 20);
        light.SetArea(20, 20);
        light.Rotation = new Vec3(35, 35, 0);
        light.Color = new Vec3(3);

        //Create scene
        var ground = new Box(world, 10, 1, 10);
        ground.Position = new Vec3(0, -0.5f, 0);
        ground.Color = new Vec4(0, 1, 0);
        var wall = new Box(world, 1, 2, 4);

        //Create navmesh
        var navmesh = new NavMesh(world, 5, 4, 4);
        navmesh.Build();

        //Create player
        var player = new Cylinder(world, 0.4f, 1.8f);
        player.SetNavObstacle(false);
        player.Color = new Vec4(0, 0, 1);
        var agent = new NavAgent(navmesh);
        player.Attach(agent);
        agent.Position = navmesh.RandomPoint();

        //Main loop
        while (!window.Closed && !window.KeyDown(Key.ESCAPE))
        {
            //Press the space key to reposition the agent
            if (window.KeyHit(Key.SPACE))
            {
                agent.Position = navmesh.RandomPoint();
                player.Sync();
            }

            world.Update();
            world.Render(framebuffer);
        }
    }
}
```