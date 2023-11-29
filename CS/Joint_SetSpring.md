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
        child.SetGravityMode(false);
        child.SetColor(0, 1, 0);
        child.AddForce(0, 500, 0);

        //Create joint
        var hinge = new HingeJoint(parent.Position, new Vec3(0, 0, 1), parent, child);
        hinge.SetSpring(0.9f, 2000f, 0.01f);

        //Main loop
        while (window.Closed() == false && window.KeyDown(Key.KEY_ESCAPE) == false)
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```