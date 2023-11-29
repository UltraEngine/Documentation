# CreateSliderJoint

This function creates a new slider joint. A hinge joint moves freely along the joint axis.

## Syntax

- `Joint CreateSliderJoint(xVec3 position, xVec3 axis, Entity parent, Entity child)`

| Parameter | Description |
|---|---|
| position | position of the joint |
| axis | axis the joint will slide along |
| parent | joint parent or NULL for a fixed point |
| child | joint child |

## Returns

Returns a new joint object.

## Example

```csharp
using System;
using System.Collections.Generic;
using Urho;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Urho.Application.GetDisplays();

        //Create a window
        var window = new Urho.ApplicationWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], Urho.WindowFlags.WindowCenter | Urho.WindowFlags.WindowTitlebar);

        //Create a framebuffer
        var framebuffer = new Urho.FrameBuffer(window);

        //Create a world
        var world = new Urho.World();

        //Create a camera    
        var camera = new Urho.Camera(world);
        camera.ClearColor = new Urho.Color(0.125f, 0.125f, 0.125f);
        camera.Node.SetPosition(new Urho.Vector3(0, 0, -6));

        //Create light
        var light = new Urho.BoxLight(world);
        light.Range = new Urho.Vector2(-20f, 20f);
        light.Node.SetRotation(new Urho.Vector3(35, 35, 0));
        light.Color = new Urho.Color(3, 3, 3);

        var parent = new Urho.Box(world);
        parent.Color = new Urho.Color(0, 0, 1);

        var child = new Urho.Box(world);
        child.Node.SetPosition(new Urho.Vector3(4, 0.1f, 0));
        child.Mass = 1f;
        child.Color= new Urho.Color(0, 1, 0);

        var joint = CreateSliderJoint(parent.Position, child.Position - parent.Position, parent, child);

        //Main loop
        while (!window.IsClosed && !Urho.Input.GetKeyDown(Urho.Key.Escape))
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```