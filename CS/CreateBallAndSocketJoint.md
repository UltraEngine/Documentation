# CreateBallAndSocketJoint

This function creates a ball and socket joint.

## Syntax

- [Joint](Joint.md) **CreateBallAndSocketJoint**([Vec3](Vec3.md) position, [Entity](Entity.md) parent, [Entity](Entity.md) child)

| Parameter | Description |
|---|---|
| position | joint position |
| parent | parent entity, or NULL for a fixed position |
| child | child entity |

## Returns

Returns a new joint.

## Example

```c#
using System;
using System.Collections.Generic;
using UltraEngine;

public class Program
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
        camera.SetClearColor(0.125);
        camera.SetPosition(0, 0, -6);

        //Create light
        var light = new BoxLight(world);
        light.SetRange(-20, 20);
        light.SetRotation(35, 35, 0);
        light.SetColor(3);

        var parent = new Box(world);
        parent.SetColor(0, 0, 1);

        var child = new Box(world);
        child.SetPosition(4, 0, 0);
        child.SetMass(1);
        child.SetColor(0, 1, 0);
        child.AddForce(0, 0, 100);
        child.AddTorque(100, 0, 0);

        var joint = CreateBallAndSocketJoint(parent.position, parent, child);
        joint.SetLimits(0, 360);

        //Main loop
        while (!window.Closed() && !window.KeyDown(Key.KEY_ESCAPE))
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```