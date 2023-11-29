# Entity.SetElasticity

This method sets the elasticity or "bounciness" of the entity.

## Syntax

- void **SetElasticity**(float elasticity)

| Parameter | Description |
|---|---|
| elasticity | elasticity value, between 0 and 1 |

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Application.GetDisplays();

        //Create a window
        var window = Application.CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

        //Create a world
        var world = Application.CreateWorld();

        //Create a framebuffer
        var framebuffer = Application.CreateFramebuffer(window);

        //Create a camera    
        var camera = Application.CreateCamera(world);
        camera.SetClearColor(0.125f);
        camera.SetPosition(new Vec3(0, 1, -4));

        //Create light
        var light = Application.CreateBoxLight(world);
        light.SetRange(-10, 10);
        light.SetRotation(new Vec3(45, 35, 0));
        light.SetColor(2);

        //Create the ground
        var ground = Application.CreateBox(world, 10, 1, 10);
        ground.SetPosition(new Vec3(0, -0.5f, 0));
        ground.SetColor(new Vec3(0, 1, 0));

        //Add some boxes
        var box1 = Application.CreateBox(world);
        box1.SetMass(1);
        box1.SetPosition(new Vec3(-1, 5, 0));
        box1.SetElasticity(1);
        box1.SetColor(new Vec3(0, 0, 1));

        var box2 = Application.CreateBox(world);
        box2.SetMass(1);
        box2.SetPosition(new Vec3(1, 5, 0));
        box2.SetElasticity(0.25f);
        box2.SetColor(new Vec3(0, 0, 1));

        //Very slow gravoty
        world.SetGravity(new Vec3(0, -1, 0));

        //Main loop
        while (!window.Closed() && !window.KeyDown(KeyCode.KEY_ESCAPE))
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```