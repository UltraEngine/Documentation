```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = GetDisplays();

        //Create a window
        var window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

        //Create a framebuffer
        var framebuffer = CreateFramebuffer(window);

        //Create a world
        var world = CreateWorld();

        //Create a camera    
        var camera = CreateCamera(world);
        camera.SetClearColor(0.125);
        camera.SetPosition(0, 0, -6);

        //Create light
        var light = CreateBoxLight(world);
        light.SetRange(-20, 20);
        light.SetRotation(35, 35, 0);
        light.SetColor(3);

        var parent = CreateBox(world);
        parent.SetMass(1);
        parent.SetColor(0, 0, 1);

        var child = CreateBox(world);
        child.SetPosition(4, 0, 0);
        child.SetMass(1);
        child.SetColor(0, 1, 0);

        var hinge = CreateHingeJoint(parent.position, new Vec3(0, 0, 1), null, parent);
        hinge.SetMaxTorque(100);

        var slider = CreateSliderJoint(parent.position, new Vec3(-1, 0, 0), parent, child);
        slider.SetLimits(0, 8);

        float a = 0;

        //Main loop
        while (!window.Closed() && !window.KeyDown(KEY_ESCAPE))
        {
            a += 1;
            hinge.SetPose(a);
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```