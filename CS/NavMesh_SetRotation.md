# NavMesh.SetRotation

This method can be used to rotate a navigation mesh. You can make characters that walk on the ceiling or handle navigation in a space simulation that has no uniform "up" direction.

## Syntax

- void **SetRotation**(float pitch, float yaw, float roll)
- void **SetRotation**(xVec3 rotation)
- void **SetRotation**(xQuat rotation)

| Parameter | Description |
|---|---|
| rotation (pitch, yaw, roll) | navigation mesh rotation |

## Example

This example tilts the scene and the navigation mesh by 45 degrees. Note that the navigation agent is aligned to the navmesh rotation.

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        // Get the displays
        var displays = Display.GetDisplays();

        // Create a window
        var window = Window.Create("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

        // Create a framebuffer
        var framebuffer = Framebuffer.Create(window);

        // Create a world
        var world = World.Create();

        // Create a camera    
        var camera = Camera.Create(world);
        camera.SetFov(70);
        camera.SetClearColor(new Vec4(0.125f, 0.125f, 0.125f, 1));
        camera.SetPosition(0, 3, -6);
        camera.SetRotation(35, 0, 0);

        // Create light
        var light = BoxLight.Create(world);
        light.SetRange(-20, 20);
        light.SetArea(20, 20);
        light.SetRotation(35, 35, 0);
        light.SetColor(new Vec3(3, 3, 3));

        // Create scene
        var ground = Box.Create(world, 10, 1, 10);
        ground.SetRotation(0, 0, 45);
        ground.Move(0, -0.5, 0);
        ground.SetColor(new Vec3(0, 1, 0));
        var wall = Box.Create(world, 1, 2, 4);
        wall.SetRotation(0, 0, 45);

        // Create navmesh
        var navmesh = NavMesh.Create(world, 5, 4, 4);
        navmesh.SetRotation(0, 0, 45);
        navmesh.Build();

        // Create player
        var player = Cylinder.Create(world, 0.4f, 1.8f);
        player.SetNavObstacle(false);
        player.SetColor(new Vec3(0, 0, 1));
        var agent = NavAgent.Create(navmesh);
        player.Attach(agent);
        agent.SetPosition(navmesh.RandomPoint());

        // Main loop
        while (!window.Closed() && !window.KeyDown(Key.KEY_ESCAPE))
        {
            if (window.MouseHit(Mouse.MOUSE_LEFT))
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