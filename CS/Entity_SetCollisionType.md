```csharp
using System;
using System.Collections.Generic;
using UltraEngine;

namespace GameEngine
{
    class Entity
    {
        public void SetCollisionType(int collisiontype, bool recursive = false)
        {
            // Set entity collision type
        }
    }
    
    class Program
    {
        static void Main(string[] args)
        {
            //Get the displays
            List<Display> displays = Functions.GetDisplays();

            //Create a window
            Window window = Functions.CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

            //Create a world
            World world = Functions.CreateWorld();

            //Create a framebuffer
            Framebuffer framebuffer = Functions.CreateFramebuffer(window);

            //Create a camera    
            Camera camera = Functions.CreateCamera(world);
            camera.SetClearColor(0.125f);
            camera.SetPosition(0, 1, -4);

            //Create light
            BoxLight light = Functions.CreateBoxLight(world);
            light.SetRange(-10, 10);
            light.SetRotation(45, 35, 0);
            light.SetColor(2);

            //Create the ground
            Box ground = Functions.CreateBox(world, 10, 1, 10);
            ground.SetPosition(0, -0.5f, 0);
            ground.SetColor(0, 1, 0);

            //Add some boxes
            Box box1 = Functions.CreateBox(world);
            box1.SetMass(1);
            box1.SetPosition(-1, 5, 0);
            box1.SetCollisionType(CollisionTypes.COLLISIONTYPE_PROP);
            box1.SetColor(0, 0, 1);

            Box box2 = Functions.CreateBox(world);
            box2.SetMass(1);
            box2.SetPosition(1, 5, 0);
            box2.SetCollisionType(CollisionTypes.COLLISIONTYPE_NONE);
            box2.SetColor(0, 0, 1);

            //Very slow gravity
            world.SetGravity(0, -1, 0);

            // Main loop
            while (!window.Closed() && !window.KeyDown(Keys.KEY_ESCAPE))
            {
                world.Update();
                world.Render(framebuffer);
            }
        }
    }
}
```