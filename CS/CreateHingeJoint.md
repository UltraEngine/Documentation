# CreateHingeJoint

This function creates a new hinge joint. A hinge joint spins around an axis.

## Syntax

- [Joint](Joint.md) **CreateHingeJoint**(Vector3 position, Vector3 axis, [Entity](Entity.md) parent, [Entity](Entity.md) child)

| Parameter | Description |
|---|---|
| position | position of the joint |
| axis | axis the joint will spin around |
| parent | joint parent or NULL for a fixed point |
| child | joint child |

## Returns

Returns a new joint object.

## Example

```csharp
using UltraEngine;

public class Program
{
    public static void Main(string[] args)
    {
        //Get the displays
        var displays = GetDisplays();

        //Create a window
        var window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

        //Create a framebuffer
        var framebuffer = CreateFramebuffer(window);

        //Create a world
        var world = CreateWorld();

        //Create a camera    
        var camera = CreateCamera(world);
        camera.SetClearColor(0.125f);
        camera.SetPosition(0, 0, -6);

        //Create light
        var light = CreateBoxLight(world);
        light.SetRange(-20, 20);
        light.SetRotation(35, 35, 0);
        light.SetColor(3);

        var parent = CreateBox(world);
        parent.SetColor(0, 0, 1);
    
        var child = CreateBox(world);
        child.SetPosition(4, 0, 0);
        child.SetMass(1);
        child.SetColor(0, 1, 0);

        var joint = CreateHingeJoint(parent.position, Vector3(0, 0, 1), parent, child);
    
        //Main loop
        while (!window.Closed() && !window.KeyDown(KeyboardKey.KEY_ESCAPE))
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```