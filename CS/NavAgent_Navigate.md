# NavAgent.Navigate

This method plots a path to the specified point and directs the navigation agent to move there.

## Syntax

- bool **Navigate**(Vec3 position)
- bool **Navigate**(float x, float y, float z)

| Parameter | Description |
|---|---|
| position (x, y, z) | destination position to navigate to |

## Returns

Returns true if a path was plotted to the destination, otherwise false is returned.

## Example

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
        var window = new Window("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowStyle.WINDOW_CENTER | WindowStyle.WINDOW_TITLEBAR);

        //Create a framebuffer
        var framebuffer = new Framebuffer(window);

        //Create a world
        var world = new World();

        //Create a camera    
        var camera = new Camera(world);
        camera.SetFOV(70);
        camera.SetClearColor(0.125f);
        camera.SetPosition(0, 3, -6);
        camera.SetRotation(35,0,0);

        //Create light
        var light = new BoxLight(world);
        light.SetRange(-20, 20);
        light.SetArea(20, 20);
        light.SetRotation(35, 35, 0);
        light.SetColor(3);

        //Create scene
        var ground = new Box(world, 10, 1, 10);
        ground.SetPosition(0, -0.5f, 0);
        ground.SetColor(0, 1, 0);
        var wall = new Box(world, 1, 2, 4);

        //Create navmesh
        var navmesh = new NavMesh(world, 10, 5, 10, 4, 4);
        navmesh.Build();

        //Create player
        var player = new Cylinder(world, 0.4f, 1.8f);
        player.SetNavObstacle(false);
        player.SetColor(0, 0, 1);
        var agent = new NavAgent(navmesh);
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