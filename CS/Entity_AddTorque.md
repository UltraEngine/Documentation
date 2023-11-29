# Entity.AddTorque

This method adds physical torque to the entity, measured in Newton metres.

## Syntax

- void **AddTorque**(xVec3 torque, bool global = true)
- void **AddTorque**(float x, float y, float z, bool global = true)

| Parameter | Description |
| - | - |
| torque, (x, y, z) | torque to add |
| global | set to true to indicate a rotation in global space, otherwise the rotation will be in local space |

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
                box.AddTorque(0, 0, 10);
            }

            world.Update();
            world.Render(framebuffer);
        }
    }
}
```
