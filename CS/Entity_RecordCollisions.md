```csharp
using System;
using Engine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create a window
        var window = Window.Create("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

        //Create a world
        var world = World.Create();

        //Create a framebuffer
        var framebuffer = Framebuffer.Create(window);

        //Create a camera
        var camera = Camera.Create(world);
        camera.SetClearColor(0.125f);
        camera.SetPosition(0, 1, -4);

        //Create light
        var light = BoxLight.Create(world);
        light.SetRange(-10, 10);
        light.SetArea(15, 15);
        light.SetRotation(45, 35, 0);
        light.SetColor(2);

        //Create the ground
        var ground = Box.Create(world, 10, 1, 10);
        ground.SetPosition(0, -0.5f, 0);
        ground.SetColor(0, 1, 0);

        //Add some boxes
        var box1 = Box.Create(world, 1, 1, 1);
        box1.SetPosition(-1, 5, 0);
        box1.SetColor(0, 0, 1);

        var box2 = Box.Create(world, 1, 1, 1);
        box2.SetPosition(1, 05, 0);
        box2.SetColor(0, 0, 1);

        //Enable collision recording
        box1.RecordCollisions(true);

        //Main loop
        while (!window.Closed() && !window.KeyDown(KeyCode.KEY_ESCAPE))
        {
            //Press the space key to start physics
            if (window.KeyHit(KeyCode.KEY_SPACE))
            {
                box1.SetMass(1);
                box2.SetMass(1);
            }

            //Color the collided entity red when collision is detected
            foreach (var c in world.Collisions)
            {
                for (int n = 0; n < 2; ++n)
                {
                    if (c.entity[n].GetMass() != 0.0f) c.entity[n].SetColor(1, 0, 0);
                }
            }

            world.Update();
            world.Render(framebuffer);
        }
    }
}
```
