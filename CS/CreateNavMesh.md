```csharp
using System;
using Ultraviolet;

namespace GameEngineAPI
{
    public class Program
    {
        public static void Main(string[] args)
        {
            //Get the displays
            var displays = Ultraviolet.GetDisplays();

            //Create a window
            var window = Ultraviolet.CreateWindow("Game Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WindowCenter | WindowFlags.WindowTitlebar);

            //Create a framebuffer
            var framebuffer = Ultraviolet.CreateFramebuffer(window);

            //Create a world
            var world = Ultraviolet.CreateWorld();

            //Create a camera
            var camera = Ultraviolet.CreateCamera(world);
            camera.SetFov(70);
            camera.SetClearColor(0.125f);
            camera.SetPosition(Vector3.Zero);
            camera.SetRotation(new Vector3(35, 0, 0));

            //Create light
            var light = Ultraviolet.CreateBoxLight(world);
            light.SetRange(-20, 20);
            light.SetArea(20, 20);
            light.SetRotation(new Vector3(35, 35, 0));
            light.SetColor(Color.White);

            //Create scene
            var ground = Ultraviolet.CreateBox(world, 10, 1, 10);
            ground.SetPosition(Vector3.Zero);
            ground.SetColor(Color.Green);
            var wall = Ultraviolet.CreateBox(world, 1, 2, 4);

            //Create navmesh
            var navmesh = CreateNavMesh(world, 5, 4, 4);
            navmesh.Build();

            //Create player
            var player = Ultraviolet.CreateCylinder(world, 0.4f, 1.8f);
            player.SetNavObstacle(false);
            player.SetColor(Color.Blue);
            var agent = Ultraviolet.CreateNavAgent(navmesh);
            player.Attach(agent);
            agent.SetPosition(new Vector3(-2, 1, 0));

            //Main loop
            while (!window.Closed && !window.KeyDown(Key.Escape))
            {
                navmesh.SetDebugging(window.KeyDown(Key.D));

                if (window.KeyDown(Key.Right)) wall.Move(0.1f, 0, 0);
                if (window.KeyDown(Key.Left)) wall.Move(-0.1f, 0, 0);

                if (window.MouseHit(MouseButton.Left))
                {
                    var mousepos = window.GetMousePosition();
                    var rayinfo = camera.Pick(framebuffer, mousepos.X, mousepos.Y);
                    if (rayinfo.Success)
                    {
                        agent.Navigate(rayinfo.Position);
                    }
                }
                if (window.KeyHit(Key.Space)) agent.Stop();

                world.Update();
                world.Render(framebuffer);
            }
        }

        public static NavMesh CreateNavMesh(World world, float height, int tilesx, int tilesz, int tileres = 32, float voxelsize = 0.25f, float agentradius = 0.4f, float agentheight = 1.8f, float stepheight = 0.501f, float maxslope = 45.01f)
        {
            return new NavMesh(world, height, tilesx, tilesz, tileres, voxelsize, agentradius, agentheight, stepheight, maxslope);
        }
    }
}
```