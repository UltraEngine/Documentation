# NavMesh.SetPosition

This method can be used to move a navigation mesh.

## Syntax

- void **SetPosition**(float x, float y, float z)
- void **SetPosition**([xVec3](xVec3.md) position)

| Parameter | Description |
|---|---|
| position (x, y, z) | navigation mesh position |

## Example

In this example the entire scene is shifted 100 meters to the right.

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
        var window = new Window("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

        //Create a framebuffer
        var framebuffer = new Framebuffer(window);

        //Create a world
        var world = new World();

        //Create a camera    
        var camera = new Camera(world);
        camera.SetFov(70);
        camera.SetClearColor(0.125f);
        camera.SetPosition(100, 3, -6);
        camera.SetRotation(35, 0, 0);

        //Create light
        var light = new BoxLight(world);
        light.SetRange(-20, 20);
        light.SetArea(20, 20);
        light.SetRotation(35, 35, 0);
        light.SetColor(3);
        light.SetPosition(100, 0, 0);

        //Create scene
        var ground = new Box(world, 10, 1, 10);
        ground.SetPosition(100, 0, 0);
        ground.Move(0, -0.5, 0);
        ground.SetColor(0, 1, 0);
        var wall = new Box(world, 1, 2, 4);
        wall.SetPosition(100, 0, 0);

        //Create navmesh
        var navmesh = new NavMesh(world, 5, 4, 4);
        navmesh.SetPosition(100, 0, 0);
        navmesh.Build();

        //Create player
        var player = new Cylinder(world, 0.4f, 1.8f);
        player.SetNavObstacle(false);
        player.SetColor(0, 0, 1);
        var agent = new NavAgent(navmesh);
        player.Attach(agent);
        agent.SetPosition(navmesh.RandomPoint());

        //Main loop
        while (!window.Closed() && !window.KeyDown(KeyCodes.KEY_ESCAPE))
        {
            if (window.MouseHit(MouseButtons.MOUSE_LEFT))
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