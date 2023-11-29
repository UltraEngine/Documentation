# Entity.AddForce

This method adds a physical force to the object, measured in Newtons.

## Syntax

- void **AddForce**(float x, float y, float z, bool global = true)
- void **AddForce**(xVec3 force, bool global = true)

| Parameter | Description |
| ------ | ------ |
| force, (x, y, z) | force to add |
| global | set to true to indicate a vector in global space, otherwise the vector will be in local space |

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
        var window = Window.Create("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

        //Create a framebuffer
        var framebuffer = Framebuffer.Create(window);

        //Create a world
        var world = World.Create();

        //Create a camera
        var camera = Camera.Create(world);
        camera.SetPosition(0, 0, -2);
        camera.SetClearColor(0.125f);

        //Create light
        var light = BoxLight.Create(world);
        light.SetRange(-10, 10);
        light.SetRotation(45, 35, 0);
        light.SetColor(2);

        //Create model
        var box = Box.Create(world);
        box.SetMass(1);
        box.SetColor(0, 0, 1);
        box.SetGravityMode(false);

        while (!window.Closed() && !window.KeyDown(Key.KEY_ESCAPE))
        {
            //Press the space key to apply a force
            if (window.KeyHit(Key.KEY_SPACE))
            {
                box.AddForce(100, 0, 0);
            }

            world.Update();
            world.Render(framebuffer);
        }
    }
}
```