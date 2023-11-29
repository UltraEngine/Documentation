#### CreateMeshCollider

This function creates a collider from a mesh or model.

## Syntax
- **Collider** CreateMeshCollider(**Mesh** geometry)
- **Collider** CreateMeshCollider(**Model** geometry)

## Parameters

| Name | Description |
|---|---|
| geometry | mesh or model to build the collision from |

## Remarks

An entity that uses a mesh collider will remain stationary and will not react to physics forces, although other objects will collide with it.

## Example

```csharp
using System;
using System.Collections.Generic;
using UltraEngine;

public class Program
{
    static void Main()
    {
        //Get display list
        var displays = Display.GetDisplays();

        //Create a window
        var window = Window.Create("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowStyle.WINDOW_TITLEBAR | WindowStyle.WINDOW_CENTER);

        //Create framebuffer
        var framebuffer = Framebuffer.Create(window);

        //Load plugin for texture loading
        var plugin = Plugin.Load("Plugins/FITextureLoader");

        //Create world
        var world = World.Create();

        //Create camera
        var camera = Camera.Create(world);
        camera.SetFOV(70);
        camera.Turn(15, 0, 0);
        camera.Move(0, 0, -12);
        camera.SetClearColor(0.125f);

        //Create light
        var light = DirectionalLight.Create(world);
        light.SetRotation(45, 35, 0);

        //Load model
        var model = Model.Load(world, "https://github.com/UltraEngine/Documentation/raw/master/Assets/Models/Structures/wooden%20bridge.glb");
        model.SetRotation(0, 90, 0);

        //Create collision
        var collision = CreateMeshCollider(model);
        model.SetCollider(collision);
        model.SetCollisionType(CollisionType.COLLISION_SCENE);

        //Add some objects to show collision
        var boxes = new List<Entity>();
        for (int n = 0; n < 5; ++n)
        {
            var box = Box.Create(world);
            box.SetScale(2);
            box.SetPosition(Utility.Random(-2, 2), 8 + 3 * n, Utility.Random(-2, 2));
            box.SetColor(0, Utility.Random(), Utility.Random());
            box.SetMass(1);
            boxes.Add(box);
        }

        while (!window.Closed() && !window.KeyHit(Key.KEY_ESCAPE))
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```