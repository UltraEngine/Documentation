# NavAgent.Stop

This method will cancel movement to a destination, if it is active, and the agent will smoothly come to a halt.

## Syntax

- void **Stop()**

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = UltraEngine.GetDisplays();

        //Create a window
        var window = UltraEngine.CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], UltraEngine.WINDOW_CENTER | UltraEngine.WINDOW_TITLEBAR);

        //Create a framebuffer
        var framebuffer = UltraEngine.CreateFramebuffer(window);

        //Create a world
        var world = UltraEngine.CreateWorld();

        //Create a camera    
        var camera = UltraEngine.CreateCamera(world);
        camera.SetFOV(70);
        camera.SetClearColor(0.125);
        camera.SetPosition(0, 3, -6);
        camera.SetRotation(35, 0, 0);

        //Create light
        var light = UltraEngine.CreateBoxLight(world);
        light.SetRange(-20, 20);
        light.SetArea(20, 20);
        light.SetRotation(35, 35, 0);
        light.SetColor(3);

        //Create scene
        var ground = UltraEngine.CreateBox(world, 10, 1, 10);
        ground.SetPosition(0, -0.5, 0);
        ground.SetColor(0, 1, 0);
        var wall = UltraEngine.CreateBox(world, 1, 2, 4);

        //Create navmesh
        var navmesh = UltraEngine.CreateNavMesh(world, 10, 5, 10, 4, 4);
        navmesh.Build();

        //Create player
        var player = UltraEngine.CreateCylinder(world, 0.4, 1.8);
        player.SetColor(0, 0, 1);
        var agent = UltraEngine.CreateNavAgent(navmesh);
        player.Attach(agent);

        //Main loop
        while (!window.Closed() && !window.KeyDown(UltraEngine.KEY_ESCAPE))
        {
            if (window.MouseHit(UltraEngine.MOUSE_LEFT))
            {
                var mousepos = window.GetMousePosition();
                var rayinfo = camera.Pick(framebuffer, mousepos.x, mousepos.y);
                if (rayinfo.success)
                {
                    agent.Navigate(rayinfo.position);
                }
            }
            if (window.KeyHit(UltraEngine.KEY_SPACE)) agent.Stop();

            world.Update();
            world.Render(framebuffer);
        }
    }
}
```