# Joint.SetFriction

This method sets the friction of a hinge or slider joint.

## Syntax

- void **SetFriction**(float friction)

| Parameter | Description |
|---|---|
| friction | joint friction, in Newtons for a slider and Newton-meters for a hinge |

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
        var window = new Window("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowCreationFlags.WINDOW_CENTER | WindowCreationFlags.WINDOW_TITLEBAR);

        //Create a framebuffer
        var framebuffer = new Framebuffer(window);

        //Create a world
        var world = new World();

        //Create a camera    
        var camera = new Camera(world);
        camera.SetClearColor(0.125f);
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

        //Create joint
        var joint = new HingeJoint(parent.position, new Vec3(0, 0, 1), parent, child);
        joint.SetFriction(10);

        //Main loop
        while (!window.Closed() && !window.KeyDown(KeyCodes.KEY_ESCAPE))
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```