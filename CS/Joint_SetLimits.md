# Joint.SetLimits

This method sets the limits of a hinge, slider, or ball and socket joint.

## Syntax

```csharp
public void SetLimits(float lower, float upper)
```

| Parameter | Description |
|---|---|
| lower | minimum joint angle or offset |
| upper | maximum joint angle or offset |

## Remarks

For hinge and slider joints, if both the minimum and maximum limits are set to zero, joint limits will be disabled.

For ball and socket joints, the minimum limit will be used as a maximum cone angle, and the maximum limit will be used for the maximum twist angle.

For ball and socket joints, if the minimum limit is set to zero and the maximum limit is set to 360, joint limits will be disabled.

## Example

```csharp
using UltraEngine;

public class Program
{
    public static void Main(string[] args)
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create a window
        var window = Window.Create("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowType.WINDOW_CENTER | WindowType.WINDOW_TITLEBAR);

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
        parent.SetMass(1);
        parent.SetColor(0, 0, 1);

        var child = Box.Create(world);
        child.SetPosition(4, 0, 0);
        child.SetMass(1);
        child.SetColor(0, 1, 0);

        var hinge = HingeJoint.Create(parent.Position, new Vec3(0, 0, 1), null, parent);
        hinge.SetMaxTorque(100);

        var slider = SliderJoint.Create(parent.Position, new Vec3(-1, 0, 0), parent, child);
        slider.SetLimits(0, 8);

        var a = 0f;

        //Main loop
        while (!window.Closed() && !window.KeyDown(KeyCode.KEY_ESCAPE))
        {
            a += 1;
            hinge.SetPose(a);
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```
