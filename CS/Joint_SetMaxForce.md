# Joint.SetMaxForce

This method sets the maximum force a motorized slider or kinematic joint can apply to reach its target position.

## Syntax

```csharp
public void SetMaxForce(float force)
```

| Parameter | Description |
|---|---|
| force | max force, in Newtons |

## Example

```csharp
using System;
using Ultrapack;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Engine.GetDisplays();

        //Create a window
        var window = Engine.CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WindowCenter | WindowFlags.WindowTitlebar);

        //Create a framebuffer
        var framebuffer = Engine.CreateFramebuffer(window);

        //Create a world
        var world = Engine.CreateWorld();

        //Create a camera    
        var camera = Engine.CreateCamera(world);
        camera.SetClearColor(0.125f);
        camera.SetPosition(0, 0, -6);

        //Create light
        var light = Engine.CreateBoxLight(world);
        light.SetRange(-20, 20);
        light.SetRotation(35, 35, 0);
        light.SetColor(3);

        var parent = Engine.CreateBox(world);
        parent.SetColor(0, 0, 1);
        parent.SetPosition(0, -2, 0);

        var child = Engine.CreateBox(world);
        child.SetMass(1);
        child.SetColor(0, 1, 0);
    
        //Create joint
        var joint = Engine.CreateSliderJoint(parent.position, new Vec3(0, 1, 0), parent, child);
        joint.SetMaxForce(100);
        joint.SetPose(2);

        //Main loop
        while (!window.Closed() && !window.KeyDown(KeyboardKey.KeyEscape))
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```