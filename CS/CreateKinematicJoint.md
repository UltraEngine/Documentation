```csharp
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
        camera.SetPosition(0, 0, -5);

        //Create light
        var light = new BoxLight(world);
        light.SetRotation(35, 35, 0);
        light.SetRange(-20, 20);
        
        var box = new Box(world);
        box.SetMass(1);
        box.SetColor(0, 1, 0);

        var joint = CreateKinematicJoint(box.GetPosition(), box);

        //Main loop
        float a = 0, y = 0;
        while (!window.Closed() && !window.KeyDown(Key.KEY_ESCAPE))
        {
            if (window.KeyDown(Key.KEY_RIGHT)) a -= 2;
            if (window.KeyDown(Key.KEY_LEFT)) a += 2;
            if (window.KeyDown(Key.KEY_UP)) y += 0.1f;
            if (window.KeyDown(Key.KEY_DOWN)) y -= 0.1f;

            joint.SetPose(new Vec3(0, y, 0), new Vec3(0, 0, a));

            world.Update();
            world.Render(framebuffer);
        }
    }
}
```