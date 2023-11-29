# Entity.SetMass

This method sets the entity mass for physics interactivity.

## Syntax

```csharp
public void SetMass(float mass)
```

| Parameter | Description |
| --- | --- |
| mass | mass to set in kilograms, or zero for immovable objects |

## Example

```csharp
using System;
using UltraEngine;

public class Program
{
    public static void Main(string[] args)
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create a window
        var window = Window.Create("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

        //Create a world
        var world = World.Create();

        //Create a framebuffer
        var framebuffer = Framebuffer.Create(window);

        //Create a camera    
        var camera = Camera.Create(world);
        camera.SetClearColor(0.125f);
        camera.SetPosition(0, 1, -4);

        //Create light
        var light = BoxLight.Create(world);
        light.SetRange(-10, 10);
        light.SetRotation(45, 35, 0);
        light.SetColor(2);

        //Create the ground
        var ground = Box.Create(world, 10, 1, 10);
        ground.SetPosition(0, -0.5f, 0);
        ground.SetColor(0, 1, 0);

        //Add some boxes
        var box1 = Box.Create(world);
        box1.SetMass(1);
        box1.SetPosition(0, 5, 0);
        box1.SetElasticity(1);
        box1.SetColor(0, 0, 1);

        var box2 = Box.Create(world);
        box2.SetMass(1);
        box2.SetPosition(0.5f, 6.5f, 0);
        box2.SetElasticity(0.25f);
        box2.SetColor(0, 0, 1);

        //Very slow gravity
        world.SetGravity(0, -2, 0);

        //Main loop
        while (!window.Closed() && !window.KeyDown(Key.KEY_ESCAPE))
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```