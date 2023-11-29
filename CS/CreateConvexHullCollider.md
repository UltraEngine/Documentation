# CreateConvexHullCollider

This function creates a convex hull that encapsulates all vertices of the input geometry.

## Syntax

- **Collider** CreateConvexHullCollider(**Mesh** geometry)
- **Collider** CreateConvexHullCollider(**Model** geometry)
- **Collider** CreateConvexHullCollider(**List<Vec3>** points)

| Parameter | Description |
|---|---|
| geometry | mesh or model to build the collision from |
| points | array of vertices |

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get display list
        var displays = GetDisplays();

        //Create a window
        var window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_TITLEBAR | WindowFlags.WINDOW_CENTER);

        //Create framebuffer
        var framebuffer = CreateFramebuffer(window);

        //Create world
        var world = CreateWorld();

        //Create camera
        var camera = CreateCamera(world);
        camera.SetFOV(70);
        camera.Turn(15, 0, 0);
        camera.Move(0, 2, -8);
        camera.SetClearColor(0.125f);

        //Create light
        var light = CreateDirectionalLight(world);
        light.SetRotation(45, 35, 0);

        //Create ground
        var ground = CreateBox(world, 10, 1, 10);
        ground.SetPosition(0, -0.5, 0);

        //Create model
        var model = CreateCylinder(world, 0.5, 1, 5);
        model.SetPosition(0, 8, 0);
        model.SetColor(0, 0, 1);
        model.SetMass(1);
        model.Turn(90, 30, 0);

        //Create collision
        var collider = CreateConvexHullCollider(model);
        model.SetCollider(collider);

        while (!window.Closed() && !window.KeyHit(Key.KEY_ESCAPE))
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```