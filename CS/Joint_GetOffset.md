# Joint.GetOffset

This method returns the current joint offset.

## Syntax

- **float GetOffset**()

## Returns

Returns the current angle of a hinge joint in degrees, or position of a slider joint in meters.

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
        camera.SetClearColor(0.125f);
        camera.SetPosition(0, 0, -6);

        //Create light
        var light = BoxLight.Create(world);
        light.SetRange(-20, 20);
        light.SetRotation(35, 35, 0);
        light.SetColor(3);

        var parent = Box.Create(world);
        parent.SetColor(0, 0, 1);

        var child = Box.Create(world);
        child.SetPosition(4, 0, 0);
        child.SetMass(1);
        child.SetColor(0, 1, 0);

        //Create joint
        var joint = HingeJoint.Create(parent.position, new Vec3(0, 0, 1), parent, child);

        //Setup 2D display
        var cam2d = Camera.Create(world, ProjectionMode.PROJECTION_ORTHOGRAPHIC);
        cam2d.SetRenderLayers(128);
        cam2d.SetClearMode(ClearFlags.CLEAR_DEPTH);
        cam2d.SetPosition(framebuffer.size.x * 0.5f, framebuffer.size.y * 0.5f);

        var font = Font.Load("Fonts/arial.ttf");
        var sprite = Sprite.Create(world, font, "0", 18);
        sprite.SetRenderLayers(128);
        sprite.SetPosition(2, framebuffer.size.y - font.GetHeight(18) - 2, 0);

        //Main loop
        while (!window.Closed() && !window.KeyDown(KeyCode.KEY_ESCAPE))
        {
            sprite.SetText("Angle: " + joint.GetOffset().ToString());
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```
