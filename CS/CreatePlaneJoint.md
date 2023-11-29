```csharp
//CreatePlaneJoint
//This function creates a plane joint. Plane joints can be used to lock an entity to a plane, for 2D game physics.

## Syntax

```csharp
[Joint](Joint.md) CreatePlaneJoint([Vec3](Vec3.md) position, [Vec3](Vec3.md) axis, [Entity](Entity.md) parent, [Entity](Entity.md) child)
```

| Parameter | Description |
|---|---|
| position | joint position |
| axis | joint axis |
| parent | parent entity, or NULL for a fixed position |
| child | child entity |

## Returns

Returns a new joint.

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
        var window = new Window();
        window.Create("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

        //Create a world
        var world = new World();
        
        //Create a framebuffer
        var framebuffer = new Framebuffer(window);

        //Create a camera
        var camera = new Camera(world);
        camera.SetClearColor(0.125);
        camera.SetPosition(0, 0, -5);

        //Create a light
        var light = new BoxLight(world);
        light.SetRotation(45,35,0);
        light.SetArea(20, 20);
        light.SetRange(-20, 20);

        //Create a ramp
        var ramp = new Box(world, 10, 0.25, 2);
        ramp.SetRotation(0, 0, 5);
        ramp.SetPosition(0, -1, 0);
        ramp.SetColor(0, 0, 1);

        //Create rolling object
        var drum = new Cylinder(world);
        drum.SetRotation(90,0,0);
        drum.SetPosition(4, 4, 0);
        drum.SetColor(0, 1, 0);
        drum.SetMass(1);

        //Create joint
        var joint = CreatePlaneJoint(drum.position, new Vec3(0, 0, 1), null, drum);

        //Main loop
        while (!window.Closed() && !window.KeyDown(Key.KEY_ESCAPE))
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```